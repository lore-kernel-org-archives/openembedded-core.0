Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D26C41513
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 18:45:44 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.43163.1691433941552479204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 11:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kyk/TWni;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5223fbd54c6so6884333a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691433940; x=1692038740;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YR4fSdT6qC1VXhtwavOZGJYUWFHtyonlw+1ekbzHjg=;
        b=kyk/TWniGbCc0ZLh8sx0uv7ACx3OiDadG1m5fDqDZDHNkPG4LH62beDqN7oRYGkzz7
         pRo+6vBD06Vz1B76UgQpXtuTkBW5NChykB/8RPzvMRM4tFCXf0bwKXHO5VGIr7Rllq3Y
         iIJdr7b3SoemoV49P9D63teH/Ua/32kLf+Li/oYpEaPHh6WwS9CyKmiB//KV91j1FTMr
         f+BJ3OJMXbrR0n4V0aeB+/OEWhgIBWLwF5+9kTmVKE7iUYKi27eUuslV6zXKoJKdHuGB
         D+S/7G8nszLEu4sOUjEO6KEHWlKeo9L1uzdr39M67PowWGAA+F+hG4KA68U31/MvVGO8
         ibaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691433940; x=1692038740;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YR4fSdT6qC1VXhtwavOZGJYUWFHtyonlw+1ekbzHjg=;
        b=iFnC7094TVK42wx18LBEJurAroKzavBm0Rm3UkvAap8ui5VlIRXvi3Ih0/O3M36CVr
         G7qwMvQjRm+F5eQJZOebRkYn6R/KASExye12rUDgcPfaRfKdBBA8l/k/tv9MvmwU7Z+c
         hBHTuilVjbzNxlRFD/1eooKw8ldTWB1BRdPdUOcoTwILrwM270hrGcrj3WG5x3t4XdEQ
         SWQ1/ppdW5a3iErR7KARAP5YVJLQ4JtalR4QK73NGYzIip6l0/RSjbug3+T+VSCSUy41
         KDo9G8js8ggT+n1574xnIFdR+yKglo1pw6jFDiYxFIe5zr6BNe4jFJvKWUsNmfDpKNDx
         UJLg==
X-Gm-Message-State: AOJu0YwhelvuOqYy5WRmgjA09sFALLx8xGSlH+vqm8YLphRYJz3sZ/0q
	BUG/Qk4zKA+YFIXN//8QKLH2cVr/VgxQo5FmldM=
X-Google-Smtp-Source: AGHT+IGW5c0Eqsew8tq5gRT0jRPt8Q6TOxnXmtq1hnGhlcFYH/6S/dw5RODxFaqaIL9UUXpiKhqizOB9phaHXXWLshk=
X-Received: by 2002:a17:906:208:b0:99b:ea8f:9003 with SMTP id
 8-20020a170906020800b0099bea8f9003mr10598078ejd.50.1691433939512; Mon, 07 Aug
 2023 11:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <0ab401d9be69$6ba9e480$42fdad80$@gmail.com>
In-Reply-To: <0ab401d9be69$6ba9e480$42fdad80$@gmail.com>
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 7 Aug 2023 11:45:29 -0700
Message-ID: <CAK5yBb-AE4vVQvaEmXxFQjTe_FkJRXSqK1SGMhtYyVK7Qzk+hA@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000202f81060259a739"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 18:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185620

--000000000000202f81060259a739
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All,
>
>

> The triage team is starting to try and collect up and classify bugs which
a newcomer to the project would be able to work on in a way which means
people can find them. They're being listed on the triage page under the
appropriate heading:

> https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs  Also please
review:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded and
how to create a bugzilla account at:
https://bugzilla.yoctoproject.org/createaccount.cgi

> The idea is these bugs should be straight forward for a person to help
work on who doesn't have deep experience with the project.  If anyone can
help, please take ownership of the bug and send patches!  If anyone needs
help/advice there are people on irc who can likely do so, or some of the
more experienced contributors will likely be happy to help too.

>

> Also, the triage team meets weekly and does its best to handle the bugs
reported into the Bugzilla. The number of people attending that meeting has
fallen, as have the number of people available to help fix bugs. One of the
things we hear users report is they don't know how to help. We (the triage
team) are therefore going to start reporting out the currently 433
unassigned or newcomer bugs.

>

> We're hoping people may be able to spare some time now and again to help
out with these.  Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system.  There are also roughly four different "priority"
classes right now,  =E2=80=9C4.3=E2=80=9D, =E2=80=9C4.4=E2=80=9D, "4.99" an=
d "Future", the more
pressing/urgent issues being in "4.3" and then =E2=80=9C4.4=E2=80=9D.

>

> Please review this link and if a bug is something you would be able to
help with either take ownership of the bug, or send me (
sjolley.yp.pm@gmail.com) an e-mail with the bug number you would like and I
will assign it to you (please make sure you have a Bugzilla account).  The
list is at:
https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcome=
r_Bugs

>

> Thanks,

>

> *Stephen K. Jolley*
*Yocto Project Program Manager*
(    *Cell*:                (208) 244-4460
* *Email*:              *sjolley.yp.pm@gmail.com <sjolley.yp.pm@gmail.com>*

--000000000000202f81060259a739
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote">All,<blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div class=3D"msg6180431433463689775"><div lang=3D"E=
N-US" style=3D"overflow-wrap: break-word;"><div class=3D"m_6180431433463689=
775WordSection1"><p class=3D"MsoNormal"><u></u></p></div></div></div></bloc=
kquote>=C2=A0<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div cla=
ss=3D"msg6180431433463689775"><div lang=3D"EN-US" style=3D"overflow-wrap: b=
reak-word;"><div class=3D"m_6180431433463689775WordSection1"><p class=3D"Ms=
oNormal"><u></u><u></u></p></div></div></div></blockquote>The triage team i=
s starting to try and collect up and classify bugs which a newcomer to the =
project would be able to work on in a way which means people can find them.=
 They&#39;re being listed on the triage page under the appropriate heading:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg6180=
431433463689775"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><=
div class=3D"m_6180431433463689775WordSection1"><p class=3D"MsoNormal"><u><=
/u></p></div></div></div></blockquote><a href=3D"https://wiki.yoctoproject.=
org/wiki/Bug_Triage#Newcomer_Bugs" target=3D"_blank">https://wiki.yoctoproj=
ect.org/wiki/Bug_Triage#Newcomer_Bugs</a>=C2=A0 Also please review: <a href=
=3D"https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded=
" target=3D"_blank">https://www.openembedded.org/wiki/How_to_submit_a_patch=
_to_OpenEmbedded</a> and how to create a bugzilla account at: <a href=3D"ht=
tps://bugzilla.yoctoproject.org/createaccount.cgi" target=3D"_blank"><span =
style=3D"color:blue">https://bugzilla.yoctoproject.org/createaccount.cgi</s=
pan></a><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D=
"msg6180431433463689775"><div lang=3D"EN-US" style=3D"overflow-wrap: break-=
word;"><div class=3D"m_6180431433463689775WordSection1"><p><u></u></p></div=
></div></div></blockquote>The idea is these bugs should be straight forward=
 for a person to help work on who doesn&#39;t have deep experience with the=
 project.=C2=A0 If anyone can help, please take ownership of the bug and se=
nd patches!=C2=A0 If anyone needs help/advice there are people on irc who c=
an likely do so, or some of the more experienced contributors will likely b=
e happy to help too.<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div class=3D"msg6180431433463689775"><div lang=3D"EN-US" style=3D"overflow-=
wrap: break-word;"><div class=3D"m_6180431433463689775WordSection1"><p clas=
s=3D"MsoNormal"><u></u></p></div></div></div></blockquote>=C2=A0<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg618043143346368=
9775"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div class=
=3D"m_6180431433463689775WordSection1"><p class=3D"MsoNormal"><u></u><u></u=
></p></div></div></div></blockquote>Also, the triage team meets weekly and =
does its best to handle the bugs reported into the Bugzilla. The number of =
people attending that meeting has fallen, as have the number of people avai=
lable to help fix bugs. One of the things we hear users report is they don&=
#39;t know how to help. We (the triage team) are therefore going to start r=
eporting out the currently 433 unassigned or newcomer bugs.<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div class=3D"msg6180431433463689775"=
><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div class=3D"m_6=
180431433463689775WordSection1"><p class=3D"MsoNormal"><u></u></p></div></d=
iv></div></blockquote>=C2=A0<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div class=3D"msg6180431433463689775"><div lang=3D"EN-US" style=3D"o=
verflow-wrap: break-word;"><div class=3D"m_6180431433463689775WordSection1"=
><p class=3D"MsoNormal"><u></u><u></u></p></div></div></div></blockquote>We=
&#39;re hoping people may be able to spare some time now and again to help =
out with these.=C2=A0 Bugs are split into two types, &quot;true bugs&quot; =
where things don&#39;t work as they should and &quot;enhancements&quot; whi=
ch are features we&#39;d want to add to the system.=C2=A0 There are also ro=
ughly four different &quot;priority&quot; classes right now, =C2=A0=E2=80=
=9C4.3=E2=80=9D, =E2=80=9C4.4=E2=80=9D, &quot;4.99&quot; and &quot;Future&q=
uot;, the more pressing/urgent issues being in &quot;4.3&quot; and then =E2=
=80=9C4.4=E2=80=9D.<br><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv class=3D"msg6180431433463689775"><div lang=3D"EN-US" style=3D"overflow-w=
rap: break-word;"><div class=3D"m_6180431433463689775WordSection1"><p class=
=3D"MsoNormal"><u></u></p></div></div></div></blockquote>=C2=A0<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg6180431433463689=
775"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div class=3D=
"m_6180431433463689775WordSection1"><p class=3D"MsoNormal"><u></u><u></u></=
p></div></div></div></blockquote>Please review this link and if a bug is so=
mething you would be able to help with either take ownership of the bug, or=
 send me (<a href=3D"mailto:sjolley.yp.pm@gmail.com" target=3D"_blank">sjol=
ley.yp.pm@gmail.com</a>) an e-mail with the bug number you would like and I=
 will assign it to you (please make sure you have a Bugzilla account).=C2=
=A0 The list is at: <a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triag=
e_Archive#Unassigned_or_Newcomer_Bugs" target=3D"_blank">https://wiki.yocto=
project.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcomer_Bugs</a><br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg618043143346=
3689775"><div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div clas=
s=3D"m_6180431433463689775WordSection1"><p class=3D"MsoNormal"><u></u></p><=
/div></div></div></blockquote>=C2=A0<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div class=3D"msg6180431433463689775"><div lang=3D"EN-US" st=
yle=3D"overflow-wrap: break-word;"><div class=3D"m_6180431433463689775WordS=
ection1"><p class=3D"MsoNormal"><u></u><u></u></p></div></div></div></block=
quote>Thanks,<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div cla=
ss=3D"msg6180431433463689775"><div lang=3D"EN-US" style=3D"overflow-wrap: b=
reak-word;"><div class=3D"m_6180431433463689775WordSection1"><p class=3D"Ms=
oNormal"><u></u></p></div></div></div></blockquote>=C2=A0<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div class=3D"msg6180431433463689775"><=
div lang=3D"EN-US" style=3D"overflow-wrap: break-word;"><div class=3D"m_618=
0431433463689775WordSection1"><p class=3D"MsoNormal"><u></u><u></u></p></di=
v></div></div></blockquote><b><i><span style=3D"font-size:16pt;font-family:=
&quot;Times New Roman&quot;,serif;color:purple">Stephen K. Jolley</span></i=
></b><br><b><span style=3D"font-size:8pt;font-family:&quot;Courier New&quot=
;;color:blue">Yocto Project Program Manager</span></b><br><span style=3D"fo=
nt-size:9pt;font-family:Wingdings;color:black">(</span><span style=3D"font-=
size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=
=A0=C2=A0 </span><b><span style=3D"font-size:8pt;font-family:&quot;Comic Sa=
ns MS&quot;;color:teal">Cell</span></b><span style=3D"font-size:9pt;font-fa=
mily:&quot;MS Sans Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><=
span style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(2=
08) 244-4460</span><br><span style=3D"font-size:9pt;font-family:Wingdings">=
* </span><b><span lang=3D"FR" style=3D"font-size:8pt;font-family:&quot;Comi=
c Sans MS&quot;;color:teal">Email</span></b><span lang=3D"FR" style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;color:teal">:</span><=
span lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quo=
t;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0<u><span style=3D"color:blue"><a href=3D"mailto:sjolle=
y.yp.pm@gmail.com" target=3D"_blank">sjolley.yp.pm@gmail.com</a></span></u>=
</span></div></div>

--000000000000202f81060259a739--

