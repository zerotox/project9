<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><s:message code="common.pageTitle"/></title>
    <link href="css/sb-admin/bootstrap.min.css" rel="stylesheet">
    <link href="css/sb-admin/metisMenu.min.css" rel="stylesheet">
    <link href="css/sb-admin/sb-admin-2.css" rel="stylesheet">
    <link href="css/sb-admin/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="css/sb-admin/bootstrap.min.js"></script>
    <script src="css/sb-admin/metisMenu.min.js"></script>
    <script src="css/sb-admin/sb-admin-2.js"></script>
<script>
function fn_moveDate(date){
	$.ajax({
		url: "moveDate",
		type:"post", 
		data : {date: date},
		success: function(result){
			$("#calenDiv").html(result);
		}
	})
}	
</script>
    
</head>

<body>

    <div id="wrapper">

		<jsp:include page="../common/navigation.jsp" />
		
        <div id="page-wrapper">
            <div id="calenDiv">
				<jsp:include page="indexCalen.jsp" />
			</div>
			            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-send fa-fw"></i> Recent News
                            <div class="pull-right"><a href="boardList">more</a>
                            </div>
                        </div>
                        <div class="panel-body">
							<div class="table-responsive">
								 <table class="table table-striped table-bordered table-hover">
									<colgroup>
										<col width='*%' />
										<col width='15%' />
										<col width='15%' />
										<col width='15%' />
									</colgroup>
									<thead>
										<tr>
											<th><s:message code="board.title"/></th>
											<th><s:message code="board.writer"/></th>
											<th><s:message code="board.date"/></th>
											<th><s:message code="board.locate"/></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="listview" items="${listview}" varStatus="status">	
											<c:url var="link" value="boardRead">
												<c:param name="brdno" value="${listview.brdno}" />
											</c:url>		
																	  				
											<tr>
												<td><a href="${link}"><c:out value="${listview.brdtitle}"/></a></td>
												<td><c:out value="${listview.brdwriter}"/></td>
												<td><c:out value="${listview.brddate}"/></td>
												<td><c:out value="${listview.bgname}"/></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
			            	</div> 
			            	                         
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-clock-o fa-fw"></i> Time Line
                        </div>
                        <div class="panel-body height400">
							<c:forEach var="listtime" items="${listtime}" varStatus="status">	
								<c:url var="link" value="boardRead">
									<c:param name="brdno" value="${listtime.brdno}" />
								</c:url>	
								<a href="${link}">
								<div>
                                    <i class="fa fa-comment fa-fw"></i> 게시물[<c:out value="${listtime.brdtitle}"/>]에 댓글이 추가되었습니다.	
                                    <span class="pull-right text-muted small"><c:out value="${listtime.brddate}"/></span>
                                </div>	
                                </a>
							</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
</body>

</html>