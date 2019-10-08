Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 50C107F36F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 14:51:37 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id z19so37215760ior.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=3G3RN5hLZhmq69jFSjMstBRTvCNzUlHoiycw8xBxvjw=;
	b=jjNIMsLHQ0cTHQa/kafjHS/9AtojW1mrQMSoQSRFp0DbsHAEoMAHdk12XYGSfDm8im
	vj/pLdkgtsVknyrpjHTib8MTLl8jHICfpCgnKQNC5FBq8VKoHDAzeqGYUeV2jR/N48fM
	hD89b7HNji7EPh7dxh9+Oh4LCv8yxOaU6Jwutd+/oTTODFzIeHbl2K61BmybPO7Ekzj2
	NFymr7Bz/7+bnQvcBWsRvCCURDaAydaLLl++FiIIPZczPY4emrUy+kelp482FcD5SEDs
	dvo6KaE/tN+w8WINQjuP5y/K9MQDKoXweD6WrJzT7tckc9jwZUqHRomvQZTGf8da7oXr
	Cl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=3G3RN5hLZhmq69jFSjMstBRTvCNzUlHoiycw8xBxvjw=;
	b=QiKZ0dCk685w45eTMf2xnuecWsc6TVAXBuka5u9q5DgoxMKGOSqPiSNvCC2ZRO5snx
	gOGiqIy1rV6jJc/EZAyzFyloQ0p9tsnL6f7QMIX01UXV1ccr0yDhc548XPlZXcH6bRkb
	cIIX0vPQr+LXny7K8zaBTEwheXJ1RyRdnBrZwZzZ9N0rMq/8uuFjdlsQYWhci/s7F4fY
	zXaR4/SMWxfPz3JLaFvmWOqMRJcDTmTCqS+1aGkoMlWZwcqSQ5l8EYZiJoV5ceNMWZV1
	ooj98/ny9vb3KFkem9Z8jT6f9uitlHRbcz/TSYUVULgG+wsfLeGGGiWQfkHRcxhprmHO
	Tsgw==
X-Gm-Message-State: APjAAAUclw2SMMfVS0+3RZIeqQgcuUXj5AGN21NgepkIvTTabjtQmNpi
	KMpcM3HZFx3E3QliujC0kXVuVm/mpnvwvNduIf0=
X-Google-Smtp-Source: APXvYqy45ZznoJDFYxZ8stxxbYYI2QNwqoqUjJsTugJh+1nPsZuEu3kgheXSTqa6hgUMalGyrMOsFKgKajo2QiqsN8o=
X-Received: by 2002:a5d:9f15:: with SMTP id q21mr17369748iot.130.1570546298174;
	Tue, 08 Oct 2019 07:51:38 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 8 Oct 2019 07:51:28 -0700
Message-ID: <CAK5yBb-TF8ZZVNr0-W4-q92hLYdVWpUqWjhduqwY2Bg7s6ASZA@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1c0MeKAmTE5?=
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
X-List-Received-Date: Tue, 08 Oct 2019 14:51:37 -0000
Content-Type: multipart/alternative; boundary="00000000000034c6810594674e86"

--00000000000034c6810594674e86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.8 M4 Feature Freeze

Next Deadline: YP 3.0 Final Release 25th Oct

SWAT Team Rotation:

   -

   SWAT lead is currently: Chen
   -

   SWAT team rotation: Chen -> Paul on Oct. 11, 2019
   -

   SWAT team rotation: Paul -> Ross on Oct. 18, 2019
   -

   https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Next Team Meetings:

   -

   Bug Triage meeting Thursday Oct. 10th at 7:30am PDT (
   https://zoom.us/j/454367603)
   -

   Monthly Project Meeting Tuesday Oct. 8th at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Weekly Engineering Sync Tuesday Oct. 15th at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Twitch - Next event is Tuesday Oct. 8th at 8am PDT (
   https://www.twitch.tv/yocto_project)


Key Status/Updates:

   -

   The project is about to build M4 rc1 once some final tweaks have been
   tested and merged (details below).
   -

   Known issues that have been or are to be addressed before M4 rc1 is
   built:
   -

      Strace kernel timeout problems - the issue has now been reproduced
      and understood upstream and a patch has been found to address
the issue. We
      therefore plan to include this in M4 rc1 (thanks Bruce)
      -

      We upgraded to a new uninative version to ensure compatibility with
      distros shipping glibc 2.30 (thanks Michael/Armin).
      -

      We resolved the systemd hwdb postinst script issues (thanks Ross)
      -

   The eSDK performance issue has been worked around but removal of old
   sstate artefacts on the system however we ultimately do need to improve =
the
   code (will target 3.1).
   -

   If anyone has any status items for the project they=E2=80=99d like to ad=
d to the
   weekly reports, please email Richard+Stephen.


Planned Releases for YP 3.0 {2.8}:

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

   WDD 2525 (last week 2552) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   Poky Patch Metrics
   -

      Total patches found: 1448 (last week 1440)
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

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--00000000000034c6810594674e86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-924f47da-7fff-c76f-2e=
6b-aa28400df863"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
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
 lead is currently: Chen=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team rotat=
ion: Chen -&gt; Paul on Oct. 11, 2019</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT t=
eam rotation: Paul -&gt; Ross on Oct. 18, 2019</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-s=
erif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Tea=
m" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;text-decoration-line:underline;vertical-align:baseline;white-space:p=
re-wrap">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</=
span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"=
>Next Team Meetings:</span></p><ul style=3D"margin-top:0px;margin-bottom:0p=
x"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">Bug Triage meeting Thursday Oct. 10th at 7:30am PDT (</spa=
n><a href=3D"https://zoom.us/j/454367603" style=3D"text-decoration-line:non=
e"><span style=3D"font-size:10pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;text-decoration-line:underlin=
e;vertical-align:baseline;white-space:pre-wrap">https://zoom.us/j/454367603=
</span></a><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">Monthly Project Mee=
ting Tuesday Oct. 8th at 8am PDT (</span><a href=3D"https://zoom.us/j/99089=
2712" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;text-decoration-line:underline;vertical-align:baseline;white-spac=
e:pre-wrap">https://zoom.us/j/990892712)</span></a></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">W=
eekly Engineering Sync Tuesday Oct. 15th at 8am PDT (</span><a href=3D"http=
s://zoom.us/j/990892712" style=3D"text-decoration-line:none"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;text-decoration-line:underline;vertical-align:=
baseline;white-space:pre-wrap">https://zoom.us/j/990892712)</span></a></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Twitch - Next event is Tuesday Oct. 8th at 8am PDT (</spa=
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
asian:normal;vertical-align:baseline;white-space:pre-wrap">The project is a=
bout to build M4 rc1 once some final tweaks have been tested and merged (de=
tails below).</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Known issues that have been or a=
re to be addressed before M4 rc1 is built:</span></p></li><ul style=3D"marg=
in-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circ=
le;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">Strace kernel timeout problem=
s - the issue has now been reproduced and understood upstream and a patch h=
as been found to address the issue. We therefore plan to include this in M4=
 rc1 (thanks Bruce)</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">We upgraded to a new uni=
native version to ensure compatibility with distros shipping glibc 2.30 (th=
anks Michael/Armin).</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre-wrap">We resolved the systemd=
 hwdb postinst script issues (thanks Ross)</span></p></li></ul><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">The eSDK performance issue has been worked around but removal of old sst=
ate artefacts on the system however we ultimately do need to improve the co=
de (will target 3.1).</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">If anyone has any status=
 items for the project they=E2=80=99d like to add to the weekly reports, pl=
ease email Richard+Stephen.</span></p></li></ul><br><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap">Planned Releases for YP 3.0 {2.8}:</span></p><ul =
style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">M4 Cutoff 30th Sep=
t - this will be YP 3.0.</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">YP 3.0 {2.8 (M4)} Fin=
al Release 25th Oct</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Planned upcoming dot releases:</span></p><ul style=3D"mar=
gin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap">YP 2.7.2 (Warrior) is planned =
for after YP 3.0 release.</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">YP 2.6.4 (Thud) is p=
lanned for after YP 2.7.2=C2=A0 release.</span></p></li></ul><br><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">Tracking Metrics:</span></p><ul styl=
e=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">WDD 2525 (last week 25=
52)</span><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap"> (</span><a href=3D=
"https://wiki.yoctoproject.org/charts/combo.html" style=3D"text-decoration-=
line:none"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:=
underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctop=
roject.org/charts/combo.html</span></a><span style=3D"font-size:11pt;font-f=
amily:Consolas,sans-serif;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Po=
ky Patch Metrics=C2=A0=C2=A0</span></p></li><ul style=3D"margin-top:0px;mar=
gin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:1=
1pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">Total patches found: 1448 (last week 1440)<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11=
pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Ar=
ial;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">Patches in t=
he Pending State: 587 (41%) [last week 587 (41%)]</span></p></li></ul></ul>=
<br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">Key Status Links for Y=
P:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2=
.8_Status" style=3D"text-decoration-line:none"><span style=3D"font-size:11p=
t;font-family:Consolas,sans-serif;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;text-decoration-line:underli=
ne;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.=
org/wiki/Yocto_Project_v2.8_Status</span></a></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yo=
ctoproject.org/wiki/Yocto_2.8_Schedule" style=3D"text-decoration-line:none"=
><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;text-decoration-line:underline;vertical-align:baseline;white-space:pre-wra=
p">https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule</span></a></p><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a h=
ref=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.8_Features" style=3D"text=
-decoration-line:none"><span style=3D"font-size:11pt;font-family:Consolas,s=
ans-serif;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;text-decoration-line:underline;vertical-align:baseli=
ne;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Yocto_2.8_Featu=
res</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color=
:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">The =
Yocto Project=E2=80=99s technical governance is through its Technical Steer=
ing Committee, more information is available at:</span></p><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https=
://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration-line:none"><spa=
n style=3D"font-size:11pt;font-family:Arial;background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;text-decoration-li=
ne:underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoc=
toproject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">The Status reports are now stored on the wiki at: </span><a =
href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-dec=
oration-line:none"><span style=3D"font-size:11pt;font-family:Arial;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;text-decoration-line:underline;vertical-align:baseline;white-space:pre=
-wrap">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">[If anyone has suggestions =
for other information you=E2=80=99d like to see on this weekly status updat=
e, let us know!]</span></p></span><div><br></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><div><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"background-image:ini=
tial;background-position:initial;background-repeat:initial"><span style=3D"=
font-size:12pt;font-family:Arial,sans-serif">Thanks,<span></span></span></p=
>

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
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div></div></div>

--00000000000034c6810594674e86--
