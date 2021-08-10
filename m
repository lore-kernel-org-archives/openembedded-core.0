Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.1869.1628556495076270205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 17:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DQjU7b40;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id pj14-20020a17090b4f4eb029017786cf98f9so2754051pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 17:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:thread-index
         :content-language;
        bh=ahGgBvrWUw/og7BTk5TcRHCp8TMxUKn2gHYR2vV9BPc=;
        b=DQjU7b40Wk/g7tsHZtkm8O0jsZ4yQ+lnKDEMcgvbQdk83cqQ5jKnkgeCGwEWZ3BI3r
         fhPyAcCZEQaJTzSLgALv61cSWT7QXWV3c2Rqasaano21yGiabchgLn54w6ajSWaLPfag
         kJqyQlMmhrJ/MtH/+b3hXP/pzFB32/1WdhymblQTAdVowXQhwryjoI3g7s96YZIJ2Zfp
         IXVDH8RkND/Gp9cBD5QLIF6ANgthPGWr6DdkLci7DcRowIi+g08GCRXx0oy7rJvgP3cq
         tVRtOUalKKkahD3IaTHUxs9HYZbeT42WlGWwAH2Ze4alYIQWf9yAhUMYeKrOwLwwFMqB
         /GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :thread-index:content-language;
        bh=ahGgBvrWUw/og7BTk5TcRHCp8TMxUKn2gHYR2vV9BPc=;
        b=PNL6jI0v0y4+q2Qu9nE89k9Q1zZmoAC4VSrWApWevGkZSUElYbRNVqNi4+qOn6APCj
         Zgq810p2oCDsezJKuHX+xqdKFY4FwDuCeDOOL2mZ1jVr2/cZsAiKcgME6kDxS1l5684L
         LqkQSKAdVgZQ1i0yJCjLyVSwyc1NF5NT19Wpe8/zKciQjHgcb98hO9/8/AWncfkQ7/yU
         bpBqQ0yDWz53nIHB15w4VL6vxvjsN6TYvnfkf4+FGh98qTGxKXAhR7ysrMFBmSw7P/GE
         Lpi3r8OcT9oThUcvGa4A4iS6lYmR7njtNz/5IstEwk+CS7B0M0elimuZvQEXormi1s3k
         sYSw==
X-Gm-Message-State: AOAM530J0/5ef5zeDXtlJYFwBmZ1tqA+FJ6NNXPCbfB09nqNC4XZQQis
	vT7co5cqi5dLFOVYQPI/aLY=
X-Google-Smtp-Source: ABdhPJyq1GO9OEbSIxW1xjr69xJMms5w5YEihoWau+Fylb5lIJ6hvoipbNQ2TAWMtNntXt/63hPHDA==
X-Received: by 2002:a05:6a00:1389:b029:3cd:e367:df2b with SMTP id t9-20020a056a001389b02903cde367df2bmr341848pfg.58.1628556494442;
        Mon, 09 Aug 2021 17:48:14 -0700 (PDT)
Return-Path: <sjolley.yp.pm@gmail.com>
Received: from skjolley ([2600:8800:1d98:5b00:2c9a:d858:bed4:bfa0])
        by smtp.gmail.com with ESMTPSA id d2sm25183512pgv.87.2021.08.09.17.48.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Aug 2021 17:48:14 -0700 (PDT)
From: "Stephen Jolley" <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
Date: Mon, 9 Aug 2021 17:48:13 -0700
Message-ID: <0b0601d78d81$66fa5b60$34ef1220$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJT180ncJW8tlIfhuRQT4h0Am/V5w==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0B07_01D78D46.BA9DF460"
Content-Language: en-us

------=_NextPart_000_0B07_01D78D46.BA9DF460
Content-Type: text/plain;
	charset="us-ascii"
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
team) are therefore going to start reporting out the currently 374
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

 


------=_NextPart_000_0B07_01D78D46.BA9DF460
Content-Type: text/html;
	boundary="----=_NextPart_000_0A99_01D78D44.CA3B85B0";
	charset="us-ascii"
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
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
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
team) are therefore going to start reporting out the currently 374 =
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

------=_NextPart_000_0B07_01D78D46.BA9DF460--
