Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 23C966AC37
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 22:11:32 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id t26so46526244qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 15:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=m0r/5N0G2g5uWjonq4l+GpWyNaOC4UQaMKAedX4Seug=;
	b=WwFPwgzxRch3DudexPt0yLgBvGL7galMIhWOTp/NdEnqNMOfVrLyNi8xgcu4l2xyl5
	3M0CyO2zBTqeLLGyQ30pDRXVQw0uuEtJh7OJgkdt4zw4Ap/ha38GbHDWOaGe+XjHmgOd
	00eQQ4gkuAvdRZ3tS3FJWwTr0JAzZh+LuBizmnI9OeUpfKPtAsNEREU2LyVHDR+w2L7x
	J/CFvE8HFQ0xNGtoedeOmlu1qYrXF5pLzTMD+2phaeyKmrdYF4Dl0/6A9H4lUUMSIhs2
	bOxiuOmFgzrSE3OpT65gwT+LVJCFdiM0mDQEIgMikp+nnv7IP+KDGk8Y6VKuaObdFf+8
	Dw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=m0r/5N0G2g5uWjonq4l+GpWyNaOC4UQaMKAedX4Seug=;
	b=HhNaxXEm+5PSaW9XhdaHfOKzE3/SksKVbZQlRuVnehPpmJdkqcZoKt8Cp1nWmOXr+I
	wuC5d66JteNgkclIYHLusfF3YwQ1XuYVbQdgnHTEvlPLgtOHNNYMv7YG46AoymxQaQKh
	ek5OzJqwnlpTCtnFMbuOC4ogTqTzqx4DKn6Zo1zAHOkmL7JsvT6PT185RqJLiaL706qE
	/kaoygwRKfdaX9otlOIiFu4C1Y+ozLQAKpFYKlWSpTTa6iYc28thau5BNncAzZQVbuwo
	R8LVV9TKOe19DQFlsYeetw3N6SEmlmTOwsfMnZ9WiPG9bIBjAbzvxxnPqw8cYhRlUiLP
	ElMA==
X-Gm-Message-State: AN3rC/7e/Z/xs4SexRJZXZXFbazEmjBscUezuMBNtSgYuioDIOxiY+8W
	04GutlbguE2JuFx5/ZpW63ljFr2qBgo0
X-Received: by 10.200.46.217 with SMTP id i25mr25905050qta.188.1494281493592; 
	Mon, 08 May 2017 15:11:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Mon, 8 May 2017 15:11:13 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 May 2017 23:11:13 +0100
Message-ID: <CAJTo0LaaErXHwTnx8VwU6XtpEc3=KuMwirw2HJW0MeonjOdppg@mail.gmail.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cxOeKAmTE3?=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 May 2017 22:11:36 -0000
Content-Type: multipart/alternative; boundary=001a1146b1289ef553054f0a85d0

--001a1146b1289ef553054f0a85d0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Current Dev Position: Planning for YP 2.4

Next Deadline: YP 2.1.3 Cut off May 15, 2017

*** FEATURE FREEZE for 2.3 is now in effect. ***

SWAT team rotation: Ross -> Leo on May 12, 2017.

SWAT team rotation: Leo -> Juri on April 19, 2017.

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Key Status/Updates:

   -

   2.3 M4 rc4 has just left QA and the report is being evaluated now:
   https://wiki.yoctoproject.org/wiki/2.3_QA_Status
   <https://wiki.yoctoproject.org/wiki/2.3_QA_Status#Summary_Report>.
   Current instinct is that we will likely release this as 2.3.
   -

   The Master and Pyro git branches will be diverging shortly.
   -

   WDD is starting to rise again which is slightly worrying.
   -

   Since we=E2=80=99re very close to releasing 2.3, planning for 2.4 has be=
gun and
   we=E2=80=99re entering 2.4 ideas and enhancements in to bugzilla. If you=
 have
   suggestions for 2.4, please ensure they are in bugzilla.


Proposed upcoming dot releases:

YP 2.1.3 Cut off May 15, 2017

YP 2.1.3 Release by May 26, 2017

YP 2.2.2 Cut off May 29, 2017

YP 2.2.2 Release by June 9, 2017

Key YP 2.3 Dates:

YP 2.3 M4 release was scheduled for May 5, 2017 but M3 slipped so this
wasn=E2=80=99t hit.  If M4 RC4 is good we should be releasing M4 this week.

Tracking Metrics:

WDD 2631 (last week 2565) (https://wiki.yoctoproject.org/charts/combo.html)

Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.3_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.3_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.3_Features

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]

--001a1146b1289ef553054f0a85d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-e900cd16-ea1c-f2f4-2b=
34-e2d367447555"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-ligatures:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Current=
 Dev Position: Planning for YP 2.4</span></p><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-ligatures:normal;font-variant-east-asian:normal;vertical-align:baseline;w=
hite-space:pre-wrap">Next Deadline: YP 2.1.3 Cut off May 15, 2017</span></p=
><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;font-family:arial;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-ligatures:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">*** FEATURE FREEZE =
for 2.3 is now in effect. ***</span></p><br><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:arial;color:rgb(0,0,0);background-color:transparent;font-variant=
-ligatures:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">SWAT team rotation: Ross -&gt; Leo on May 12, 2017.</sp=
an></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-ligatures:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team rotatio=
n: Leo -&gt; Juri on April 19, 2017.</span></p><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoct=
oproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D"text-decoration:n=
one"><span style=3D"font-size:11pt;font-family:consolas;background-color:tr=
ansparent;font-variant-ligatures:normal;font-variant-east-asian:normal;text=
-decoration:underline;vertical-align:baseline;white-space:pre-wrap">https:/=
/wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a></p><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-ligatures:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Key Status/Updates:</sp=
an></p><ul style=3D"margin-top:0pt;margin-bottom:0pt"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-ligatures:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-ligatures:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">2.3 M4 rc4 has just=
 left QA and the report is being evaluated now: </span><a href=3D"https://w=
iki.yoctoproject.org/wiki/2.3_QA_Status#Summary_Report" style=3D"text-decor=
ation:none"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-ligatures:normal;font-variant-east-asian:normal;text-decoration:un=
derline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctopro=
ject.org/wiki/2.3_QA_Status</span></a><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-ligatures:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">. Current instinct is=
 that we will likely release this as 2.3.</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:arial;color:rgb(0,0,=
0);background-color:transparent;font-variant-ligatures:normal;font-variant-=
east-asian:normal;vertical-align:baseline"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-ligatures:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">The Master and P=
yro git branches will be diverging shortly.</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-ligatures:normal;font-varian=
t-east-asian:normal;vertical-align:baseline"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-ligatures:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">WDD is startin=
g to rise again which is slightly worrying.</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-ligatures:normal;font-varian=
t-east-asian:normal;vertical-align:baseline"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-ligatures:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">Since we=E2=80=
=99re very close to releasing 2.3, planning for 2.4 has begun and we=E2=80=
=99re entering 2.4 ideas and enhancements in to bugzilla. If you have sugge=
stions for 2.4, please ensure they are in bugzilla.</span></p></li></ul><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-ligatures:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">Proposed upcoming dot r=
eleases:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-ligatures:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 2.=
1.3 Cut off May 15, 2017</span></p><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-famil=
y:arial;color:rgb(0,0,0);background-color:transparent;font-variant-ligature=
s:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">YP 2.1.3 Release by May 26, 2017</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-ligatures:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">YP 2.2.2 Cut off May 29, 2017</span></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-ligatures:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">YP 2.2.2 Release by June 9, =
2017</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-ligatures:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Key Y=
P 2.3 Dates:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:arial;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-ligatures:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Y=
P 2.3 M4 release was scheduled for May 5, 2017 but M3 slipped so this wasn=
=E2=80=99t hit.=C2=A0 If M4 RC4 is good we should be releasing M4 this week=
.</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:arial;color:rgb(0=
,0,0);background-color:transparent;font-variant-ligatures:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Tracking=
 Metrics:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:arial;color:r=
gb(0,0,0);background-color:transparent;font-variant-ligatures:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"><spa=
n class=3D"gmail-Apple-tab-span" style=3D"white-space:pre">	</span></span><=
span style=3D"font-size:11pt;font-family:arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-ligatures:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">WDD 2631 (last week 2565)=
 </span><span style=3D"text-indent:36pt;font-size:11pt;font-family:consolas=
;color:rgb(0,0,0);background-color:transparent;font-variant-ligatures:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">(</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" sty=
le=3D"text-indent:36pt;text-decoration:none"><span style=3D"font-size:11pt;=
font-family:arial;background-color:transparent;font-variant-ligatures:norma=
l;font-variant-east-asian:normal;text-decoration:underline;vertical-align:b=
aseline;white-space:pre-wrap">https://wiki.yoctoproject.org/charts/combo.ht=
ml</span></a><span style=3D"text-indent:36pt;font-size:11pt;font-family:con=
solas;color:rgb(0,0,0);background-color:transparent;font-variant-ligatures:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap">)</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:arial;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-ligatures:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"=
>Key Status Links for YP:</span></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.or=
g/wiki/Yocto_Project_v2.3_Status" style=3D"text-decoration:none"><span styl=
e=3D"font-size:11pt;font-family:consolas;background-color:transparent;font-=
variant-ligatures:normal;font-variant-east-asian:normal;text-decoration:und=
erline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproj=
ect.org/wiki/Yocto_Project_v2.3_Status</span></a></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://w=
iki.yoctoproject.org/wiki/Yocto_2.3_Schedule" style=3D"text-decoration:none=
"><span style=3D"font-size:11pt;font-family:consolas;background-color:trans=
parent;font-variant-ligatures:normal;font-variant-east-asian:normal;text-de=
coration:underline;vertical-align:baseline;white-space:pre-wrap">https://wi=
ki.yoctoproject.org/wiki/Yocto_2.3_Schedule</span></a></p><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https:=
//wiki.yoctoproject.org/wiki/Yocto_2.3_Features" style=3D"text-decoration:n=
one"><span style=3D"font-size:11pt;font-family:consolas;background-color:tr=
ansparent;font-variant-ligatures:normal;font-variant-east-asian:normal;text=
-decoration:underline;vertical-align:baseline;white-space:pre-wrap">https:/=
/wiki.yoctoproject.org/wiki/Yocto_2.3_Features</span></a></p><br><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-ligatures:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">[If anyone has suggestions for oth=
er information you=E2=80=99d like to see on this weekly status update, let =
us know!]</span></p><div><span style=3D"font-size:11pt;font-family:arial;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-ligatures:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"=
><br></span></div></span></div>

--001a1146b1289ef553054f0a85d0--
