Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 487966E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 15:37:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 29 Jul 2016 08:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,440,1464678000"; 
	d="scan'208,217";a="741536804"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.5.132])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2016 08:37:29 -0700
Message-ID: <1469806649.3175.93.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Yocto Discussion <yocto@yoctoproject.org>, OpenEmbedded List
	<openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jul 2016 08:37:29 -0700
X-Mailer: Evolution 3.20.4 (3.20.4-1.fc24) 
Mime-Version: 1.0
Subject: Yocto Project Status WW31
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
X-List-Received-Date: Fri, 29 Jul 2016 15:37:29 -0000
Content-Type: multipart/alternative; boundary="=-xB9mZfP3y07VOGgoOGY5"

--=-xB9mZfP3y07VOGgoOGY5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


Current Dev Position: YP 2.2 M3
Next Deadline: YP 2.2 M3 which will be Aug 29th (5:00pm GMT)

SWAT team rotation: Ross -> Randy
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Key Status/Updates:
 * This status covers two weeks
 * We did get an M2 build into QA, it took some time to stabilize due to the shear number of errors we ran into coming from submitted patches, particularly from oe-selftest which takes a long time to run.
 * A performance regressing in the printk kernel feature was identified, proving the value in monitoring these things, wish we had more eyes on it though.
 * The M2 QA report is out. Unfortunately there are a substantial number of bugs being reported against M2. There is no common theme, bugs in many aspects of the system. We’re undecided whether to release it as is, try an rc2 with bugs fixed on a branch or try an rc2 with current master which does address some of the issues.
 * https://wiki.yoctoproject.org/wiki/WW30_-_2016-07-21_-_Full_Test_Cycle_2.2_M2.rc1
 * We’ve decided to remove uclibc.
 * Performance issues with pseudo when using xattrs have been identified and are in testing.
 * 2.1.1 has gcc6 fixes merged. We have some checkuri fixes pending, then will run a 2.1.1 rc2 build.

Key YP 2.2 Dates:
 * YP 2.2 M1 release would be: 6/24/16
 * YP 2.2 M2 cut off would be: 7/18/16
 * YP 2.2 M2 release would be: 7/29/16
 * YP 2.2 M3 cut off would be: 8/29/16
 * YP 2.2 M3 release would be: 9/9/16
 * YP 2.2 M4 cut off would be: 10/3/16
 * YP 2.2 M4 release would be: 10/28/16

Tracking Metrics:
	WDD 2744 (last week 2698)
(https://wiki.yoctoproject.org/charts/combo.html)

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features

[If anyone has suggestions for other information you’d like to see on this weekly status update, let us know!]

--=-xB9mZfP3y07VOGgoOGY5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div><span id=3D"docs-internal-guid-389028ff-374c-=
6993-62d3-3c10020cd5f4"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt;"><br></p><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666=
666px; font-family: Arial; color: rgb(0, 0, 0); background-color: transpare=
nt; vertical-align: baseline; white-space: pre-wrap;">Current Dev Position:=
 YP 2.2 M3</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; font-=
family: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical=
-align: baseline; white-space: pre-wrap;">Next Deadline: YP 2.2 M3 which wi=
ll be Aug 29th (5:00pm GMT)</span></p><br><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666=
666666666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: =
transparent; vertical-align: baseline; white-space: pre-wrap;">SWAT team ro=
tation: Ross -&gt; Randy</span></p><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.or=
g/wiki/Yocto_Build_Failure_Swat_Team" style=3D"text-decoration:none;"><span=
 style=3D"font-size: 14.666666666666666px; font-family: Consolas; color: rg=
b(17, 85, 204); background-color: transparent; text-decoration: underline; =
vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproject=
.org/wiki/Yocto_Build_Failure_Swat_Team</span></a></p><br><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"f=
ont-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); ba=
ckground-color: transparent; vertical-align: baseline; white-space: pre-wra=
p;">Key Status/Updates:</span></p><ul style=3D"margin-top:0pt;margin-bottom=
:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.666666=
666666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: tra=
nsparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.66666666=
6666666px; background-color: transparent; vertical-align: baseline; white-s=
pace: pre-wrap;">This status covers two weeks</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type: disc; font-size: 14.666666666666666px; font-fam=
ily: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-al=
ign: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; background=
-color: transparent; vertical-align: baseline; white-space: pre-wrap;">We d=
id get an M2 build into QA, it took some time to stabilize due to the shear=
 number of errors we ran into coming from submitted patches, particularly f=
rom oe-selftest which takes a long time to run.</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type: disc; font-size: 14.666666666666666px; font-f=
amily: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-=
align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; backgrou=
nd-color: transparent; vertical-align: baseline; white-space: pre-wrap;">A =
performance regressing in the printk kernel feature was identified, proving=
 the value in monitoring these things, wish we had more eyes on it though.<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 1=
4.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); background-co=
lor: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.=
666666666666666px; background-color: transparent; vertical-align: baseline;=
 white-space: pre-wrap;">The M2 QA report is out. Unfortunately there are a=
 substantial number of bugs being reported against M2. There is no common t=
heme, bugs in many aspects of the system. We=E2=80=99re undecided whether t=
o release it as is, try an rc2 with bugs fixed on a branch or try an rc2 wi=
th current master which does address some of the issues.</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.666666666666666p=
x; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; =
vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px;=
 background-color: transparent; vertical-align: baseline; white-space: pre-=
wrap;"><a href=3D"https://wiki.yoctoproject.org/wiki/WW30_-_2016-07-21_-_Fu=
ll_Test_Cycle_2.2_M2.rc1">https://wiki.yoctoproject.org/wiki/WW30_-_2016-07=
-21_-_Full_Test_Cycle_2.2_M2.rc1</a></span></p></li><li dir=3D"ltr" style=
=3D"list-style-type: disc; font-size: 14.666666666666666px; font-family: Ar=
ial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: ba=
seline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt;"><span style=3D"font-size: 14.666666666666666px; background-color:=
 transparent; vertical-align: baseline; white-space: pre-wrap;">We=E2=80=99=
ve decided to remove uclibc.</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type: disc; font-size: 14.666666666666666px; font-family: Arial; color=
: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline;"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;">=
<span style=3D"font-size: 14.666666666666666px; background-color: transpare=
nt; vertical-align: baseline; white-space: pre-wrap;">Performance issues wi=
th pseudo when using xattrs have been identified and are in testing.</span>=
</p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.6666=
66666666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: t=
ransparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666=
666666666px; background-color: transparent; vertical-align: baseline; white=
-space: pre-wrap;">2.1.1 has gcc6 fixes merged. We have some checkuri fixes=
 pending, then will run a 2.1.1 rc2 build.</span></p></li></ul><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 14.666666666666666px; font-family: Arial; color: rgb(0=
, 0, 0); background-color: transparent; vertical-align: baseline; white-spa=
ce: pre-wrap;">Key YP 2.2 Dates:</span></p><ul style=3D"margin-top:0pt;marg=
in-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: =
14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); background-c=
olor: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14=
.666666666666666px; background-color: transparent; vertical-align: baseline=
; white-space: pre-wrap;">YP 2.2 M1 release would be: 6/24/16</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.66666666666=
6666px; font-family: Arial; color: rgb(0, 0, 0); background-color: transpar=
ent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.6666666666666=
66px; background-color: transparent; vertical-align: baseline; white-space:=
 pre-wrap;">YP 2.2 M2 cut off would be: 7/18/16</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type: disc; font-size: 14.666666666666666px; font-f=
amily: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-=
align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; backgrou=
nd-color: transparent; vertical-align: baseline; white-space: pre-wrap;">YP=
 2.2 M2 release would be: 7/29/16</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type: disc; font-size: 14.666666666666666px; font-family: Arial; =
color: rgb(0, 0, 0); background-color: transparent; vertical-align: baselin=
e;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;"><span style=3D"font-size: 14.666666666666666px; background-color: tran=
sparent; vertical-align: baseline; white-space: pre-wrap;">YP 2.2 M3 cut of=
f would be: 8/29/16</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
: disc; font-size: 14.666666666666666px; font-family: Arial; color: rgb(0, =
0, 0); background-color: transparent; vertical-align: baseline;"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span sty=
le=3D"font-size: 14.666666666666666px; background-color: transparent; verti=
cal-align: baseline; white-space: pre-wrap;">YP 2.2 M3 release would be: 9/=
9/16</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-si=
ze: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); backgrou=
nd-color: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size=
: 14.666666666666666px; background-color: transparent; vertical-align: base=
line; white-space: pre-wrap;">YP 2.2 M4 cut off would be: 10/3/16</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.6666666=
66666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: tran=
sparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666=
666666px; background-color: transparent; vertical-align: baseline; white-sp=
ace: pre-wrap;">YP 2.2 M4 release would be: 10/28/16</span></p></li></ul><b=
r><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
;"><span style=3D"font-size: 14.666666666666666px; font-family: Arial; colo=
r: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline; w=
hite-space: pre-wrap;">Tracking Metrics:</span></p><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-siz=
e: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); backgroun=
d-color: transparent; vertical-align: baseline; white-space: pre-wrap;"><sp=
an class=3D"Apple-tab-span" style=3D"white-space:pre;">	</span></span><span=
 style=3D"font-size: 14.666666666666666px; font-family: Arial; color: rgb(0=
, 0, 0); background-color: transparent; vertical-align: baseline; white-spa=
ce: pre-wrap;">WDD 2744 (last week 2698)</span></p><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt;text-indent: 36pt;"><span=
 style=3D"font-size: 14.666666666666666px; font-family: Consolas; color: rg=
b(0, 0, 0); background-color: transparent; vertical-align: baseline; white-=
space: pre-wrap;">(</span><a href=3D"https://wiki.yoctoproject.org/charts/c=
ombo.html" style=3D"text-decoration:none;"><span style=3D"font-size: 14.666=
666666666666px; font-family: Arial; color: rgb(17, 85, 204); background-col=
or: transparent; text-decoration: underline; vertical-align: baseline; whit=
e-space: pre-wrap;">https://wiki.yoctoproject.org/charts/combo.html</span><=
/a><span style=3D"font-size: 14.666666666666666px; font-family: Consolas; c=
olor: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline=
; white-space: pre-wrap;">)</span></p><br><p dir=3D"ltr" style=3D"line-heig=
ht:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666=
666666666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: =
transparent; vertical-align: baseline; white-space: pre-wrap;">Key Status L=
inks for YP:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto=
_Project_v2.2_Status" style=3D"text-decoration:none;"><span style=3D"font-s=
ize: 14.666666666666666px; font-family: Consolas; color: rgb(17, 85, 204); =
background-color: transparent; text-decoration: underline; vertical-align: =
baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_=
Project_v2.2_Status</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org=
/wiki/Yocto_2.2_Schedule" style=3D"text-decoration:none;"><span style=3D"fo=
nt-size: 14.666666666666666px; font-family: Consolas; color: rgb(17, 85, 20=
4); background-color: transparent; text-decoration: underline; vertical-ali=
gn: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yo=
cto_2.2_Schedule</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wi=
ki/Yocto_2.2_Features" style=3D"text-decoration:none;"><span style=3D"font-=
size: 14.666666666666666px; font-family: Consolas; color: rgb(17, 85, 204);=
 background-color: transparent; text-decoration: underline; vertical-align:=
 baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto=
_2.2_Features</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.6666666666666=
66px; font-family: Arial; color: rgb(0, 0, 0); background-color: transparen=
t; vertical-align: baseline; white-space: pre-wrap;">[If anyone has suggest=
ions for other information you=E2=80=99d like to see on this weekly status =
update, let us know!]</span></p><br></span></div><div></div></body></html>

--=-xB9mZfP3y07VOGgoOGY5--
