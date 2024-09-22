<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes: Notes Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container">
  		<%@include file ="navbar.jsp" %>
  		
  		<br>
  		<h1 class="text-uppercase"> All Notes : </h1>
  		
  		<div class="row">
  		<div class="col-12">
  			<%
	  		Session s = FactoryProvider.getFactory().openSession();
	  		Query q=s.createQuery("from Note");
	  		List<Note> list= q.list();
	  		
	  		for(Note note: list){
	  		%>
	  		
	  		<div class="card mt-3" >
			  <img class="card-img-top pl-4 pt-4 mx-auto" style="max-width:100px;" src="img/notepad.png" alt="Card image cap">
			  <div class="card-body px-5">
			    <h5 class="card-title"><%= note.getTitle()%></h5>
			    <p class="card-text">
			    <%=note.getContent() %>
			    </p>
			    <p><b class="text-primary"><%=note.getAdDate() %></b></p>
			    <div class="container text-center">
			    <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
			    <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Edit</a>
			    
			    </div>
			  </div>
			</div>
	  		<%
	  			}
	  		
	  		s.close();
	  		%>
  		
  		</div>
  		</div>
  		
  		
  	</div>
	

</body>
</html>