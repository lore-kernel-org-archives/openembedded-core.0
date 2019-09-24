Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2116BDE3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 14:50:59 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id b19so5141445iob.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=gzMoiiSaExLMP8a8BqeXZmE3e2Np6xRlexsgTpLSgBs=;
	b=Fk6K8aBQgZDOLPx+whtUtgGqcgLQYptK+dUyGJbIVjKK5DRl8UuTR78whIpiAXLH4u
	kYnl00Y37JLNyvkluRBJES9WekCtVCPtdIRZiHrZDe+BhO1U4X37JK7ZrWYKQ4rTuufg
	FE662yMOQY6vXubPUJkHXCDtAoZjNzu42Q4mjs6Y1BEqyShepXVAM8tbhPK5EiI1N6PC
	bYsfyJpGUhUxI6Gx2TdmwJwSlzh+OaEXsRoZxjqbvysMurrzUXSY2qJ9OlX24PkTcpMT
	KlmMZ7vNON1wDvM8S2BlliydYZqPFN1JFbkAOpQksPMaqHtP5MhkFgsESfc9f3kXls5X
	ViFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=gzMoiiSaExLMP8a8BqeXZmE3e2Np6xRlexsgTpLSgBs=;
	b=g9KfWfnSatMOpYvBx+mFJT7bXvpv936e7qfLDhV/qMmmtnINCyBb0lzoOm1pFLEz4+
	7KfllsRTG49sJdvJL46CmzozLkzAtUo5Ztp2OX7OI/UX/qJBeHVqMiJ9lfSSlKlqL9UJ
	0Z+RhaxwTszdZOQYW8ufaRtysnFt+rrmV6P8V1u+ZdRC1LrXh4DhZ9bKVltACRd+dXuR
	Bzy8pamoWguip6u7MDTRgL+OaggQc7IAsX41cD3XIMRf00cn9ofJVAxj6qlB60vS+I6W
	kLOd241e8PMgMZiwq9fEXpf5ucPkD84p3SfbZEXeO9AS22OH3nMK4yRXDyw3s8JbZcRv
	8o+A==
X-Gm-Message-State: APjAAAXtLLY14zl39O0latq/lADARNDSNcEZkKz9rni+pg1sI2FASRz6
	6bmSA0UBp98TUNO5p/ye2ljPUJHM8b0CQBiwnQ4=
X-Google-Smtp-Source: APXvYqxu9YqaVjpQ/nz8Uu7N3g/kuDfYDcCM3LaMUdqn7mTrm8yjMn4LFUx1e1+wa/SXnMN8yEnyaKD894I/r9Wy7uY=
X-Received: by 2002:a5d:8911:: with SMTP id b17mr3949705ion.287.1569336661005; 
	Tue, 24 Sep 2019 07:51:01 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 24 Sep 2019 07:50:50 -0700
Message-ID: <CAK5yBb8ZGghJb3pTmdK-neC2eoH7c5h-v+aHJ1=y2TozPbASew@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: "Ta, Lieu" <Lieu.Ta@windriver.com>
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1czOeKAmTE5?=
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
X-List-Received-Date: Tue, 24 Sep 2019 14:51:00 -0000
Content-Type: multipart/alternative; boundary="000000000000365a3e05934daa55"

--000000000000365a3e05934daa55
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.8 M4 Feature Freeze

Next Deadline: YP 3.0 Final Release 25th Oct

SWAT Team Rotation:

   -

   SWAT lead is currently: Amanda
   -

   SWAT team rotation: Amanda -> Chen on Sept. 27, 2019
   -

   SWAT team rotation: Chen -> Armin on Oct. 4, 2019
   -

   https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Next Team Meetings:

   -

   Bug Triage meeting Thursday Sept 26th at 7:30am PDT (
   https://zoom.us/j/454367603)
   -

   Monthly Project Meeting Tuesday Oct. 1st at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Weekly Engineering Sync Tuesday Sept. 24th at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Twitch - Next event is Tuesday Octt. 8th at 8am PDT (
   https://www.twitch.tv/yocto_project)


Key Status/Updates:

   -

   We=E2=80=99re now in feature freeze for 3.0 and working on bug fixing fo=
r final
   release
   -

   We have built M3 and this is due from QA on Thursday
   -

   The main unresolved issue for 3.0 is with the hash equivalence server
   causing problems with the eSDK and this issue is being investigated but
   can=E2=80=99t be reproduced as yet.
   -

   We also want to find a better solution to the systemd timeout problem
   before final release.
   -

   A significant performance problem has been found on the autobuilder
   where some builds are scaling in time badly as the sstate cache grows,
   taking 12 hours or more in some cases. Unfortunately nobody seems motiva=
ted
   to help work on this kind of issue.
   -

   The plan for M4 is to resolve the above issues and any issues raised
   from M3 QA, then proceed with the main release rc builds. The first M4
   build is scheduled for next week.
   -

   If anyone has any status items for the project they=E2=80=99d like to ad=
d to the
   weekly reports, please email Richard+Stephen.


Planned Releases for YP 3.0 {2.8}:

   -

   M3 Release 6th Sept
   -

   M4 Cutoff 30th Sept - this will be YP 3.0.
   -

   YP 3.0 {2.8 (M4)} Final Release 25th Oct


Planned upcoming dot releases:

   -

   YP 2.7.2 (Warrior) is planned for after YP 3.0 release.
   -

   YP 2.6.4 (Thud) is planned for after YP 2.7.2  release.


Tracking Metrics:

   -

   WDD 2505 (last week 2449) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   Poky Patch Metrics
   -

      Total patches found: 1427 (last week 1424)
      -

      Patches in the Pending State: 587 (41%) [last week 587 (41%)]


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.8_Features

The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]

--=20

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

*7867 SW Bayberry Dr., Beaverton, OR 97007*

(    *Cell*:                (208) 244-4460

* *Email*:                 *stephen.k.jolley@intel.com
<stephen.k.jolley@intel.com>*

--000000000000365a3e05934daa55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-cb3789bb-7fff-93ea-00=
b5-a175f1492038"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Current D=
ev Position: YP 2.8 M4 Feature Freeze</span></p><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">Next Deadline: YP 3.0 Final Release 25th Oct</span></=
p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">SWAT Team Rotation:<=
/span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT=
 lead is currently: Amanda=C2=A0</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team rot=
ation: Amanda -&gt; Chen on Sept. 27, 2019</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWA=
T team rotation: Chen -&gt; Armin on Oct. 4, 2019</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,san=
s-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_=
Team" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;text-decoration-line:underline;vertical-align:baseline;white-spac=
e:pre-wrap">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Tea=
m</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">Next Team Meetings:</span></p><ul style=3D"margin-top:0px;margin-bottom=
:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Bug Triage meeting Thursday Sept 26th at 7:30am PDT (</=
span><a href=3D"https://zoom.us/j/454367603" style=3D"text-decoration-line:=
none"><span style=3D"font-size:10pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;text-decoration-line:under=
line;vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/454367=
603</span></a><span style=3D"font-size:11pt;background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">Monthly Project =
Meeting Tuesday Oct. 1st at 8am PDT (</span><a href=3D"https://zoom.us/j/99=
0892712" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;text-decoration-line:underline;vertical-align:baseline;white-s=
pace:pre-wrap">https://zoom.us/j/990892712)</span></a></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">Weekly Engineering Sync Tuesday Sept. 24th at 8am PDT (</span><a href=3D=
"https://zoom.us/j/990892712" style=3D"text-decoration-line:none"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;text-decoration-line:underline;vertical-a=
lign:baseline;white-space:pre-wrap">https://zoom.us/j/990892712)</span></a>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">Twitch - Next event is Tuesday Octt. 8th at 8am PDT =
(</span><a href=3D"https://www.twitch.tv/yocto_project" style=3D"text-decor=
ation-line:none"><span style=3D"font-size:11pt;background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;text-decoration=
-line:underline;vertical-align:baseline;white-space:pre-wrap">https://www.t=
witch.tv/yocto_project</span></a><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">)</span></p></li></ul><br><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">Key Status/Updates:</span></=
p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">We=E2=80=99r=
e now in feature freeze for 3.0 and working on bug fixing for final release=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">We have built M3 and this is due from QA on T=
hursday</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap">The main unresolved issue for 3.0 is w=
ith the hash equivalence server causing problems with the eSDK and this iss=
ue is being investigated but can=E2=80=99t be reproduced as yet.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">We also want to find a better solution to the systemd ti=
meout problem before final release.</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">A signific=
ant performance problem has been found on the autobuilder where some builds=
 are scaling in time badly as the sstate cache grows, taking 12 hours or mo=
re in some cases. Unfortunately nobody seems motivated to help work on this=
 kind of issue.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap">The plan for M4 is to resolve =
the above issues and any issues raised from M3 QA, then proceed with the ma=
in release rc builds. The first M4 build is scheduled for next week.</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">If anyone has any status items for the project they=
=E2=80=99d like to add to the weekly reports, please email Richard+Stephen.=
</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">P=
lanned Releases for YP 3.0 {2.8}:</span></p><ul style=3D"margin-top:0px;mar=
gin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">M3 Release 6th Sept</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">M4 Cutoff 30th Sept - this will be YP 3.0.</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">YP 3.0 {2.8 (M4)} Final Release 25th Oct</span></p></li></ul><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Planned upcoming dot releases:</=
span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 2.=
7.2 (Warrior) is planned for after YP 3.0 release.</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">YP 2.6.4 (Thud) is planned for after YP 2.7.2=C2=A0 release.</span>=
</p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Tracking=
 Metrics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">WDD 2505 (last week 2449)</span><span style=3D"font-size:11pt;font-=
family:Consolas,sans-serif;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap"> (</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.h=
tml" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;text-decoration-line:underline;vertical-align:baseline;white-space=
:pre-wrap">https://wiki.yoctoproject.org/charts/combo.html</span></a><span =
style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial;background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre-wrap">Poky Patch Metrics=C2=A0=C2=A0</span></p></li><=
ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list=
-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre-wrap">Total patches=
 found: 1427 (last week 1424)</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:circle;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Patches in the Pending State: 587 (41%) [last week 587 (4=
1%)]</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">Key Status Links for YP:</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctopro=
ject.org/wiki/Yocto_Project_v2.8_Status" style=3D"text-decoration-line:none=
"><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;text-decoration-line:underline;vertical-align:baseline;white-space:pre-wr=
ap">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status</span></a>=
</p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:Co=
nsolas,sans-serif;background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;text-decoration-line:underline;vertical-alig=
n:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Yocto_2=
.8_Schedule</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/Yoc=
to_2.8_Features" style=3D"text-decoration-line:none"><span style=3D"font-si=
ze:11pt;font-family:Consolas,sans-serif;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:u=
nderline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctopr=
oject.org/wiki/Yocto_2.8_Features</span></a></p><br><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap">The Yocto Project=E2=80=99s technical governance =
is through its Technical Steering Committee, more information is available =
at:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"t=
ext-decoration-line:none"><span style=3D"font-size:11pt;font-family:Arial;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;text-decoration-line:underline;vertical-align:baseline;white-sp=
ace:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap">The Status reports are now sto=
red on the wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/We=
ekly_Status" style=3D"text-decoration-line:none"><span style=3D"font-size:1=
1pt;font-family:Arial;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;text-decoration-line:underline;vertical-=
align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Wee=
kly_Status</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">[If anyone has suggestions for other information you=E2=80=99d like to s=
ee on this weekly status update, let us know!]</span></p></span><div><br></=
div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gma=
il_signature"><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"background-i=
mage:initial;background-position:initial;background-repeat:initial"><span s=
tyle=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<span></span></=
span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager<spa=
n></span></span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-family:&quot;Co=
urier New&quot;;color:fuchsia;background-image:initial;background-position:=
initial;background-repeat:initial">7867 SW Bayberry Dr., Beaverton, OR 9700=
7</span></b><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><sp=
an></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><a href=3D"mailto:stephen.k.jolley@intel.com" target=3D"_b=
lank"><span style=3D"color:rgb(17,85,204)">stephen.k.jolley@intel.com</span=
></a></span></u><span style=3D"font-size:12pt;font-family:Arial,sans-serif"=
><span></span></span></p></div></div></div>

--000000000000365a3e05934daa55--
