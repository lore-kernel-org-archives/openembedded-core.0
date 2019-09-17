Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8B57D69D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 14:49:50 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id m11so8346884ioo.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=IZB26cboH58hMtAOVO+MrLy98P49gCZuytLJ+WOEmEw=;
	b=SejYSrPZ13YBxiRw9yH7ENB3GznmCz11Z9uOw08EoAag9OMF05fPAe+n7+gDLVdq70
	iiPvsuBG01g2P4RLf/ryBmlpJ+HUS2xS7ivi3fj0E7z14SqmCoChjT40M2yy86WVWIdM
	DNsUc+meQB/LOb6mWW3p3gr3j4dXnjfBGgU++8F4r8HGM+LV1telbDqyBBkHMJgV0uEy
	0wPfudNcdajtsWduQHAovCU66g/v64CH3F+y9ZcU7Kfrp0vpTx9HMG9D17mzmHe9SpOr
	sctxwloLPBePk8qijgmXxuiZRxhPocBbFFTEZIt3LMBOox3N7bD6y1Am8rdi5l+bZ6dy
	5kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=IZB26cboH58hMtAOVO+MrLy98P49gCZuytLJ+WOEmEw=;
	b=nkR2ueCb7hKPQQeN5MyAKkFfHdSZ7lpHSXXgs6KKJvnGTuCx5mgKIwNGk3rR7ErI41
	WvFphGfMLLFo50Z0X7e6yMUF/GnSkeH3gI61W2MX8sswYKAohDQWSvIUMhwpTRJVhRNO
	71fVLQIIUxmgOJgRYCYTRGnMUEDNclZhNF56FUXThjHrzbWEINbIPb/y0vei/tWSwpGo
	9CqRWFfKz+bAVRrXnwYhqipKRf2i83lfBeaNhWL5BeLbiPmLQTkouIvMOaKn7OG2oEjW
	DVWI6WJMxXgeOZDjsrnWPwtqd8q1DiU2cm7C+uAK7w8jyErHag1J97NnU8eDC4thCxkW
	CqhA==
X-Gm-Message-State: APjAAAVDU1tjt+ywEtDYjdSonKjIoCoKVqoXK0mBEamxuVgsl2dB9anZ
	SD+V8XbTOXYS7KqwR/dAN40sfCcTz+XYNHq8hmc=
X-Google-Smtp-Source: APXvYqy10fsJ96F/Qgau9MvolwyaHjOzplsFr4TnmrRAdng5NJJF3G9yKWZ5cXWZyP8yksrohx/RHL9Us/zUOZ6T/Og=
X-Received: by 2002:a02:6a22:: with SMTP id l34mr4825970jac.33.1568731791385; 
	Tue, 17 Sep 2019 07:49:51 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 17 Sep 2019 07:49:40 -0700
Message-ID: <CAK5yBb_fQ86_Hhzq2GVD0xyOmjX=PMMkJhJ3i8N2ti6WnMh5Tw@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1czOOKAmTE5?=
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
X-List-Received-Date: Tue, 17 Sep 2019 14:49:50 -0000
Content-Type: multipart/alternative; boundary="0000000000002c6ae20592c0d50a"

--0000000000002c6ae20592c0d50a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.8 M4 Feature Freeze

Next Deadline: YP 3.0 Final Release 25th Oct

SWAT Team Rotation:

   -

   SWAT lead is currently: Ross
   -

   SWAT team rotation: Ross -> Amanda on Sept. 20, 2019
   -

   SWAT team rotation: Amanda -> Chen on Sept. 27, 2019
   -

   https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Next Team Meetings:

   -

   Bug Triage meeting Thursday Sept 19th at 7:30am PDT (
   https://zoom.us/j/454367603)
   -

   Monthly Project Meeting Tuesday Oct. 1st at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Weekly Engineering Sync Tuesday Sept. 17th at 8am PDT (
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

   We have not built M3 yet as there are still three issues that need to be
   resolved:
   -

      strace ptest regressions with 5.1/5.2 kernels
      -

      systemd timeouts on mips
      -

      hashequiv server rewrite
      -

   The strace regressions will be discussed with the kernel community, the
   best workaround may be to lower the individual test timeouts so one the
   affected individual tests fail rather than all tests timing out.
   -

   The qemumips issue with systemd is puzzling as its happening in hwdb and
   hwdb should be generated in advance anyway. Investigation is ongoing abo=
ut
   why its being regenerated, a workaround is to increase the timeout as mi=
ps
   is just slow (it does complete eventually, its just marginal).
   -

   The hashequiv server changes are being tested in master-next
   -

   It is planned to build M3 this week with the workarounds mentioned above
   worst case. Its expected there would be further hashequiv fixing during =
M4.
   -

   We hope to make up time during M4 by having M3 at high quality and take
   advantage of our automation.
   -

   Documentation - Due to illness Scott is unavailable for the next month
   or two so doc patches will be handled by Richard or Ross in the short te=
rm.
   We=E2=80=99ll likely limit them to correctness issues and defer any subs=
tantial new
   text. If anyone has availability and skills to work on the manuals pleas=
e
   talk to us. We=E2=80=99re aware there is a patch backlog.
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

   WDD 2449 (last week 2424) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   Poky Patch Metrics
   -

      Total patches found: 1424 (last week 1417)
      -

      Patches in the Pending State: 587 (41%) [last week 582 (41%)]


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


Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:              sjolley.yp.pm@gmail.com

--0000000000002c6ae20592c0d50a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-3847c562-7fff-be8f-2b=
dc-ba0b652cd4a3"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
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
 lead is currently: Ross</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team rotation: R=
oss -&gt; Amanda on Sept. 20, 2019</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team r=
otation: Amanda -&gt; Chen on Sept. 27, 2019</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"=
 style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;text-decoration-line:underline;vertical-align:baseline;white-space:pre=
-wrap">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</sp=
an></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">N=
ext Team Meetings:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Bug Triage meeting Thursday Sept 19th at 7:30am PDT (</span>=
<a href=3D"https://zoom.us/j/454367603" style=3D"text-decoration-line:none"=
><span style=3D"font-size:10pt;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;text-decoration-line:underline;=
vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/454367603</=
span></a><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">Monthly Project Meeti=
ng Tuesday Oct. 1st at 8am PDT (</span><a href=3D"https://zoom.us/j/9908927=
12" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;text-decoration-line:underline;vertical-align:baseline;white-space:=
pre-wrap">https://zoom.us/j/990892712)</span></a></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Wee=
kly Engineering Sync Tuesday Sept. 17th at 8am PDT (</span><a href=3D"https=
://zoom.us/j/990892712" style=3D"text-decoration-line:none"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;text-decoration-line:underline;vertical-align:b=
aseline;white-space:pre-wrap">https://zoom.us/j/990892712)</span></a></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">Twitch - Next event is Tuesday Octt. 8th at 8am PDT (</spa=
n><a href=3D"https://www.twitch.tv/yocto_project" style=3D"text-decoration-=
line:none"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:=
underline;vertical-align:baseline;white-space:pre-wrap">https://www.twitch.=
tv/yocto_project</span></a><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">)</span></p></li></ul><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Key Status/Updates:</span></p><u=
l style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">We=E2=80=99re no=
w in feature freeze for 3.0 and working on bug fixing for final release</sp=
an></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap">We have not built M3 yet as there are still three=
 issues that need to be resolved:</span></p></li><ul style=3D"margin-top:0p=
x;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap">strace ptest regressions with 5.1/5.2 =
kernels</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">systemd timeouts on mips</span></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">hashequiv server rewrite</span></p></li></ul><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">The strace regressions will be discussed with the kernel community, the=
 best workaround may be to lower the individual test timeouts so one the af=
fected individual tests fail rather than all tests timing out.</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">The qemumips issue with systemd is puzzling as its happeni=
ng in hwdb and hwdb should be generated in advance anyway. Investigation is=
 ongoing about why its being regenerated, a workaround is to increase the t=
imeout as mips is just slow (it does complete eventually, its just marginal=
).</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">The hashequiv server changes are being test=
ed in master-next</span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">It is planned to build M3 th=
is week with the workarounds mentioned above worst case. Its expected there=
 would be further hashequiv fixing during M4.</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
We hope to make up time during M4 by having M3 at high quality and take adv=
antage of our automation.</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">Documentation - Due =
to illness Scott is unavailable for the next month or two so doc patches wi=
ll be handled by Richard or Ross in the short term. We=E2=80=99ll likely li=
mit them to correctness issues and defer any substantial new text. If anyon=
e has availability and skills to work on the manuals please talk to us. We=
=E2=80=99re aware there is a patch backlog.</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">If=
 anyone has any status items for the project they=E2=80=99d like to add to =
the weekly reports, please email Richard+Stephen.</span></p></li></ul><br><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">Planned Releases for YP 3.0=
 {2.8}:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">M3 Release 6th Sept</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">M4 Cutoff 30th Sept - =
this will be YP 3.0.</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">YP 3.0 {2.8 (M4)} Final R=
elease 25th Oct</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">Planned upcoming dot releases:</span></p><ul style=3D"margin-=
top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">YP 2.7.2 (Warrior) is planned for =
after YP 3.0 release.</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">YP 2.6.4 (Thud) is plann=
ed for after YP 2.7.2=C2=A0 release.</span></p></li></ul><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">Tracking Metrics:</span></p><ul style=3D=
"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre-wrap">WDD 2449 (last week 2424)<=
/span><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap"> (</span><a href=3D"htt=
ps://wiki.yoctoproject.org/charts/combo.html" style=3D"text-decoration-line=
:none"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:unde=
rline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproje=
ct.org/charts/combo.html</span></a><span style=3D"font-size:11pt;font-famil=
y:Consolas,sans-serif;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-=
wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Poky P=
atch Metrics=C2=A0=C2=A0</span></p></li><ul style=3D"margin-top:0px;margin-=
bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre-wrap">Total patches found: 1424 (last week 1417)</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;f=
ont-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">Patches in the P=
ending State: 587 (41%) [last week 582 (41%)]</span></p></li></ul></ul><br>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre-wrap">Key Status Links for YP:</=
span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_S=
tatus" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;fo=
nt-family:Consolas,sans-serif;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;text-decoration-line:underline;v=
ertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/=
wiki/Yocto_Project_v2.8_Status</span></a></p><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctop=
roject.org/wiki/Yocto_2.8_Schedule" style=3D"text-decoration-line:none"><sp=
an style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;tex=
t-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">h=
ttps://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule</span></a></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a hre=
f=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.8_Features" style=3D"text-d=
ecoration-line:none"><span style=3D"font-size:11pt;font-family:Consolas,san=
s-serif;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-decoration-line:underline;vertical-align:baseline=
;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Yocto_2.8_Feature=
s</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">The Yo=
cto Project=E2=80=99s technical governance is through its Technical Steerin=
g Committee, more information is available at:</span></p><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https:/=
/wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration-line:none"><span =
style=3D"font-size:11pt;font-family:Arial;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;text-decoration-line=
:underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yocto=
project.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">The Status reports are now stored on the wiki at: </span><a hr=
ef=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-decor=
ation-line:none"><span style=3D"font-size:11pt;font-family:Arial;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;text-decoration-line:underline;vertical-align:baseline;white-space:pre-w=
rap">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">[If anyone has suggestions fo=
r other information you=E2=80=99d like to see on this weekly status update,=
 let us know!]</span></p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0=
001pt;font-size:11pt;font-family:Calibri,sans-serif"><br></p><p class=3D"Ms=
oNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;font-family:Calibr=
i,sans-serif">Thanks,</p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0=
001pt;font-size:11pt;font-family:Calibri,sans-serif">=C2=A0</p><p class=3D"=
MsoNormal" style=3D"margin:0in 0in 0.0001pt;break-after:avoid;font-size:11p=
t;font-family:Calibri,sans-serif"><b><i><span style=3D"font-size:16pt;font-=
family:&quot;Times New Roman&quot;,serif;color:purple">Stephen K. Jolley</s=
pan></i></b><b><i><span style=3D"font-size:16pt;font-family:Tahoma,sans-ser=
if;color:purple"></span></i></b></p><p class=3D"MsoNormal" style=3D"margin:=
0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"><b><span st=
yle=3D"font-size:8pt;font-family:&quot;Courier New&quot;;color:blue">Yocto =
Project Program Manager</span></b></p><p class=3D"MsoNormal" style=3D"margi=
n:0in 0in 0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"><span sty=
le=3D"font-size:9pt;font-family:Wingdings;color:black">(</span><span style=
=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;color:teal">=
=C2=A0=C2=A0=C2=A0=C2=A0</span><b><span style=3D"font-size:8pt;font-family:=
&quot;Comic Sans MS&quot;;color:teal">Cell</span></b><span style=3D"font-si=
ze:9pt;font-family:&quot;MS Sans Serif&quot;,serif;color:teal">:=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0</span><span style=3D"font-size:9pt;font-family:&quot;MS Sans S=
erif&quot;,serif">(208) 244-4460<span style=3D"color:black"></span></span><=
/p><p class=3D"MsoNormal" style=3D"margin:0in 0in 0.0001pt;font-size:11pt;f=
ont-family:Calibri,sans-serif"><span style=3D"font-size:9pt;font-family:Win=
gdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;font-fami=
ly:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=3D"FR" =
style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;color:te=
al">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS S=
ans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<a href=3D"mailto:sjolley.yp.pm@gmail.com"=
 target=3D"_blank" style=3D"color:rgb(5,99,193)">sjolley.yp.pm@gmail.com</a=
></span></p></span></div>

--0000000000002c6ae20592c0d50a--
