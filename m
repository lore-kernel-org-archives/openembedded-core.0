Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.1542.1604355670161459057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 14:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J/F+/IyF;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id g11so1048641pll.13
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 14:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:thread-index
         :content-language;
        bh=mpsWKzSERumBBZCqaTLTFb9OhCUxdmwpLrdDftxlfcU=;
        b=J/F+/IyFwRGhgJQCPFVPZWzsqNyqrLI+Ej4Q1u0Lj59tO20wI0IWtIDsKBk0txHyIa
         k0P6mX74iN6xa74r91kUHEXdUBd+qbl0gJsltF/iGTrX96GkXPKP4AKisBpJwDWw5kQJ
         p4O3WnFGYB0MPWPQtKdYF3ln0EmVJzFWlJ8uBMc/UXWCnEJ+2e/n0GKf4B9RlkN3aOz6
         FB0FE53ElOTVvAP+xf2/H8465ugF6cLQf/JRM/55LQX9saFV10aMUgU13QoWIWFzxUxn
         4XgIwX6nwx8766Qdf1ksUz/5Gf/RHHmgUkWwhELlPGOryLPOsgjuWv8r6yg+AUZtQsFP
         bsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :thread-index:content-language;
        bh=mpsWKzSERumBBZCqaTLTFb9OhCUxdmwpLrdDftxlfcU=;
        b=hPFAGizx519v1vDNKuZBhInlPoe8hOX7iFAI0Xo5tI5bsLgycoUoo8niQpw8oPNh4I
         sg2GXy7Hcs/W8QB7MerGkAd0KDmuc3enAQJioapB+ndCqqjoflzLzKPwRZKLVnf9pVn1
         eVpCXYhnOcLRXbpYqaXoGzqGZT8MPKVmIZasNlsya9IxfGdb5/V6LbmCo6CstqPrJn8G
         r8NKDtzKfNhHJxpphgtk+8zNuLRdCuVgfJrDFq89w3GqmjvhLdaRdoHcpLPHF6qsQ7eS
         IbJ6ubZFQqK7iVhh2/BCedXldbJ60sDe5dUXupISPzEuWgthQzQ8Hy2XxVYhspntDg8i
         C7fw==
X-Gm-Message-State: AOAM533C8S1vVM8+Nefchf4wlnW5MLdwxoUXpp7+zeX4DdXBK4wuHtEr
	IW9I/MU/MWfMQ6BifDqN930=
X-Google-Smtp-Source: ABdhPJwywpTikwgQ2Kpu0L7Crf7dXTDskgk8KFkmb1eHkgtf05SQsvhYJ365P4lTFPtRAan3SGZILQ==
X-Received: by 2002:a17:902:eed3:b029:d6:db13:6679 with SMTP id h19-20020a170902eed3b02900d6db136679mr2670963plb.47.1604355669701;
        Mon, 02 Nov 2020 14:21:09 -0800 (PST)
Return-Path: <sjolley.yp.pm@gmail.com>
Received: from skjolley (c-71-59-136-149.hsd1.or.comcast.net. [71.59.136.149])
        by smtp.gmail.com with ESMTPSA id bs21sm461478pjb.36.2020.11.02.14.21.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2020 14:21:09 -0800 (PST)
From: "Stephen Jolley" <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
Date: Mon, 2 Nov 2020 14:21:08 -0800
Message-ID: <12e901d6b166$76df6220$649e2660$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLMBIw+FhtNFiRB25RG39D5oTuE4A==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_12EA_01D6B123.68BD3390"
Content-Language: en-us

------=_NextPart_000_12EA_01D6B123.68BD3390
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

All,

 

The triage team is starting to try and collect up and classify bugs which a
newcomer to the project would be able to work on in a way which means people
can find them. They're being listed on the triage page under the appropriate
heading:

https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs  Also please
review:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded and
how to create a bugzilla account at:
<https://bugzilla.yoctoproject.org/createaccount.cgi>
https://bugzilla.yoctoproject.org/createaccount.cgi

The idea is these bugs should be straight forward for a person to help work
on who doesn't have deep experience with the project.  If anyone can help,
please take ownership of the bug and send patches!  If anyone needs
help/advice there are people on irc who can likely do so, or some of the
more experienced contributors will likely be happy to help too.

 

Also, the triage team meets weekly and does its best to handle the bugs
reported into the Bugzilla. The number of people attending that meeting has
fallen, as have the number of people available to help fix bugs. One of the
things we hear users report is they don't know how to help. We (the triage
team) are therefore going to start reporting out the currently 325
unassigned or newcomer bugs.

 

We're hoping people may be able to spare some time now and again to help out
with these.  Bugs are split into two types, "true bugs" where things don't
work as they should and "enhancements" which are features we'd want to add
to the system.  There are also roughly four different "priority" classes
right now, "3.2", "3.3, "3.99" and "Future", the more pressing/urgent issues
being in "3.2" and then "3.3".

 

Please review this link and if a bug is something you would be able to help
with either take ownership of the bug, or send me (sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> ) an e-mail with the bug number you would
like and I will assign it to you (please make sure you have a Bugzilla
account).  The list is at:
https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcomer
_Bugs

 

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_12EA_01D6B123.68BD3390
Content-Type: text/html;
	boundary="----=_NextPart_000_08CE_01D6ABA7.0304C260";
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"MS Sans Serif";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal =
style=3D'text-autospace:none'>All,<o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'>The triage team is starting to try and =
collect up and classify bugs which a newcomer to the project would be =
able to work on in a way which means people can find them. They're being =
listed on the triage page under the appropriate =
heading:<o:p></o:p></p><p><a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs">http=
s://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs</a>&nbsp; Also =
please review: <a =
href=3D"https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEm=
bedded">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEm=
bedded</a> and how to create a bugzilla account at: <a =
href=3D"https://bugzilla.yoctoproject.org/createaccount.cgi"><span =
style=3D'color:blue'>https://bugzilla.yoctoproject.org/createaccount.cgi<=
/span></a><o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'>The idea is these bugs should be straight =
forward for a person to help work on who doesn't have deep experience =
with the project.&nbsp; If anyone can help, please take ownership of the =
bug and send patches!&nbsp; If anyone needs help/advice there are people =
on irc who can likely do so, or some of the more experienced =
contributors will likely be happy to help too.<o:p></o:p></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal style=3D'text-autospace:none'>Also, the triage team =
meets weekly and does its best to handle the bugs reported into the =
Bugzilla. The number of people attending that meeting has fallen, as =
have the number of people available to help fix bugs. One of the things =
we hear users report is they don't know how to help. We (the triage =
team) are therefore going to start reporting out the currently 325 =
unassigned or newcomer bugs.<o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'>We're hoping people may be able to spare =
some time now and again to help out with these.&nbsp; Bugs are split =
into two types, &quot;true bugs&quot; where things don't work as they =
should and &quot;enhancements&quot; which are features we'd want to add =
to the system.&nbsp; There are also roughly four different =
&quot;priority&quot; classes right now, &#8220;3.2&#8221;, &#8220;3.3, =
&quot;3.99&quot; and &quot;Future&quot;, the more pressing/urgent issues =
being in &quot;3.2&quot; and then &#8220;3.3&#8221;.<o:p></o:p></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal style=3D'text-autospace:none'>Please review this link =
and if a bug is something you would be able to help with either take =
ownership of the bug, or send me (<a =
href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>) an =
e-mail with the bug number you would like and I will assign it to you =
(please make sure you have a Bugzilla account).&nbsp; The list is at: <a =
href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_=
or_Newcomer_Bugs">https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#U=
nassigned_or_Newcomer_Bugs</a><o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'>Thanks,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'page-break-after:avoid;text-autospace:none'><b><i><span =
style=3D'font-size:16.0pt;font-family:"Times New =
Roman",serif;color:purple'>Stephen K. Jolley</span></i></b><b><i><span =
style=3D'font-size:16.0pt;font-family:"Tahoma",sans-serif;color:purple'><=
o:p></o:p></span></i></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:8.0pt;font-family:"Courier New";color:blue'>Yocto =
Project Program Manager<o:p></o:p></span></b></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings;color:black'>(</span><span=
 style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>&nbsp;&nbsp;&nbsp; </span><b><span =
style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Cell</span></b><span =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:9.0pt;font-family:"MS Sans Serif"'>(208) =
244-4460<span style=3D'color:black'><o:p></o:p></span></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings'>* </span><b><span =
lang=3DFR style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Email</span></b><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:</span><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;<u><span style=3D'color:blue'><a =
href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a></span=
></u></span><span lang=3DFR =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif'><o:p></o:p></sp=
an></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_000_12EA_01D6B123.68BD3390--
