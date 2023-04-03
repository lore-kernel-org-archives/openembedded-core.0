Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC62C761AF
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 19:37:26 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.81490.1680550637546549765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 12:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lOew8Nn3;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id o2so29120824plg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 12:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680550636;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bd+FidYO+GVK+6EU/0JSOt+pM1WQ50LjdKiqzXYX8jI=;
        b=lOew8Nn3Pmb6+xH4KWiZsY/6Xh74MK6O+JPqbsiFbsqU8hXw8uE77aGduCDsO2G4tr
         C5y60Olyne/NEJMwbo171RiHffVgQ1/q8ptPUcPs5neYyoc49XO0QUlxkbLtCUKz1svu
         vHDqb9YAky2n1EPgs1Q0YBjti5rbZTzXAwNXV7KXaeNMpzMsECCZhd3sfFjnOfgDFIYq
         jzSU6LFqfNjuwcn/8rekkD2VUUSxkBmuqOIZ1e8fqpPPi3Gx47slpaUklkO4TJvZkcpG
         dYbPP6wUm6gfn4mBKUpIlAaCfwZhCvpmEUs+4hdTRTkPpe261vmTziMRNJVoWRLDvwOx
         SZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680550636;
        h=content-language:thread-index:mime-version:message-id:date:subject
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bd+FidYO+GVK+6EU/0JSOt+pM1WQ50LjdKiqzXYX8jI=;
        b=T+6Yv8KsXHpN6MaQQeTmoB6qbu/Z0+zr/6ZHPXcXOSL5r/DnAVYA/c6+JV2UyOcxhX
         5sDqQ+dDusu+iXFMFT7Ui0uAY5Q/QcIkV5InItTvqq2o7wlwdPc5qfL/yu6q+CcxUYRn
         uI4sWN91FKqmt0mup/CR7NPUcDctXPfj4UrKZ5FcNUiaKqdRJCK3ZG/MlG0KriezJvza
         HpDK3UIEtOA5C8Ja0cqGufJsdL875YhD+rmd2aHZPyP29xk49Z1V1cknWFtBGhPQ/oib
         F1skWS5oDP9BUECOAzLtDROgDLjScd4mErERbuDRiXYjDxNMfSMTGxGs50grUZHFdG9Z
         sFOg==
X-Gm-Message-State: AO0yUKX7tUmtx1e+brxsfUTE8OosdLvIjxw993EXIM9S2gylr4xEIS3G
	/8jtvjr0UZj7LfNuCZHtpQHSzTIEiHU=
X-Google-Smtp-Source: AK7set+mnpKG3p879w+H/oASoNiX6bOm+Ejqz8MzEG1ljQZXjOTV9/9jC/3xO8Y3gjTJ+kc71EOpiw==
X-Received: by 2002:a05:6a20:6d05:b0:d5:1c74:27af with SMTP id fv5-20020a056a206d0500b000d51c7427afmr30836680pzb.29.1680550636416;
        Mon, 03 Apr 2023 12:37:16 -0700 (PDT)
Received: from skjolley ([2600:1011:a124:5236:3d7a:fbd1:9445:c50b])
        by smtp.gmail.com with ESMTPSA id j1-20020aa78d01000000b0062e032b61a8sm4178700pfe.63.2023.04.03.12.37.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Apr 2023 12:37:15 -0700 (PDT)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@lists.yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
Date: Mon, 3 Apr 2023 12:37:16 -0700
Message-ID: <0b3701d96663$b32ff3c0$198fdb40$@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0B38_01D96629.06D25440"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJmMEbJZM17naV9PAYCQqbtreO11w==
Content-Language: en-us
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179650

This is a multipart message in MIME format.

------=_NextPart_000_0B38_01D96629.06D25440
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
team) are therefore going to start reporting out the currently 425
unassigned or newcomer bugs.

 

We're hoping people may be able to spare some time now and again to help out
with these.  Bugs are split into two types, "true bugs" where things don't
work as they should and "enhancements" which are features we'd want to add
to the system.  There are also roughly four different "priority" classes
right now,  "4.2", "4.3", "4.99" and "Future", the more pressing/urgent
issues being in "4.2" and then "4.3".

 

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

 


------=_NextPart_000_0B38_01D96629.06D25440
Content-Type: text/html;
	boundary="----=_NextPart_000_0F3C_01D960D0.C6C5B4D0";
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
team) are therefore going to start reporting out the currently 425 =
unassigned or newcomer bugs.<o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'>We're hoping people may be able to spare =
some time now and again to help out with these.&nbsp; Bugs are split =
into two types, &quot;true bugs&quot; where things don't work as they =
should and &quot;enhancements&quot; which are features we'd want to add =
to the system.&nbsp; There are also roughly four different =
&quot;priority&quot; classes right now, &nbsp;&#8220;4.2&#8221;, =
&#8220;4.3&#8221;, &quot;4.99&quot; and &quot;Future&quot;, the more =
pressing/urgent issues being in &quot;4.2&quot; and then =
&#8220;4.3&#8221;.<o:p></o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'text-autospace:none'>Please review this link and if a bug is =
something you would be able to help with either take ownership of the =
bug, or send me (<a =
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
------=_NextPart_000_0B38_01D96629.06D25440--


