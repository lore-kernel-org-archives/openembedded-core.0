Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <0517c28b02387604b779b117c7309f5afb86f8ad.camel@linuxfoundation.org>
Subject: Yocto Project Status WW42`21
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 19 Oct 2021 15:58:38 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-09D2vSeU8UEEBSVIhpYY"
List-id: <openembedded-core.lists.openembedded.org>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: sjolley.yp.pm@gmail.com

--=-09D2vSeU8UEEBSVIhpYY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 3.4 M4
Next Deadline: 29th Oct. 2021 YP 3.4 M4 release

Next Team Meetings:
 * Bug Triage meeting Thursday Oct. 21st at 7:30am PDT
   (https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
 * Monthly Project Meeting Tuesday Nov. 2nd at 8am PDT
   (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
 * Weekly Engineering Sync Tuesday Oct. 19th at 8am PDT
   (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
 * Twitch -  See https://www.twitch.tv/theyoctojester

Key Status/Updates:
 * YP 3.4 rc1 is through QA and the TSC is discussing, likely planning to
   release as 3.4
 * YP 3.5 Planning document: https://docs.google.com/document/d/1OXw-
   NKoL_Vb9RWI6sRPs3zTcAn4hHPtG0Y2BIs7xIzo/edit?usp=sharing
 * Patches to master have continued to merge post-release, most of the backlog
   is now processed. There were a number of more invasive changes that were
   deferred for after 3.4 and this has disrupted things a little (pkgconfig-
   native missing dependencies, reproducible builds being made the default,
   openssl 3.X, python 3.10, insane class function cleanup and switch to zstd
   for sstate which have also now merged.
 * We are pleased to report that sstate reuse on the autobuilder has improved
   significantly and this is reducing build times, to the point several of us
   did check to see if it did actually build things!
 * Intermittent issues continue to rise, particularly with some seemingly
   network related gremlin somewhere. Help is very much welcome on these issues.
   You can see the list of failures we’re continuing to see by searching for the
   “AB-INT” tag in bugzilla:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT

Ways to contribute:
 * There are bugs identified as possible for newcomers to the project:
   https://wiki.yoctoproject.org/wiki/Newcomers
 * There are bugs that are currently unassigned for YP 3.4. See:
   https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.4_Unassigned_Enhanc
   ements.2FBugs
 * We’d welcome new maintainers for recipes in OE-Core. Please see the list at:
   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maint
   ainers.inc and discuss with the existing maintainer, or ask on the OE-Core
   mailing list. We will likely move a chunk of these to “Unassigned” soon to
   help facilitate this.

YP 3.4 Milestone Dates:
 * YP 3.4 M4 is in QA
 * YP 3.4 M4 Release date 2021/10/29

Proposed YP 3.5 Milestone Dates:
 * YP 3.5 M1 build date 2021/12/06
 * YP 3.5 M1 Release date 2021/12/17
 * YP 3.5 M2 build date 2022/01/10
 * YP 3.5 M2 Release date 2022/1/21
 * YP 3.5 M3 build date 2022/2/21
 * YP 3.5 M3 Release date 2022/03/04
 * YP 3.5 M4 build date 2022/04/04
 * YP 3.5 M4 Release date 2022/04/29

Proposed upcoming dot releases:
 * YP 3.3.4 build date 2021/11/01
 * YP 3.3.4 Release date 2021/11/12
 * YP 3.1.12 build date 2021/11/15
 * YP 3.1.12 Release date 2021/11/26
 * YP 3.4.1 build date 2021/11/22
 * YP 3.4.1 Release date 2021/12/03
 * YP 3.1.13 build date 2021/12/13
 * YP 3.1.13 Release date 2021/12/22
 * YP 3.1.14 build date 2022/01/24
 * YP 3.1.14 Release date 2022/02/04
 * YP 3.4.2 build date 2022/02/07
 * YP 3.4.2 Release date 2022/02/18
 * YP 3.1.15 build date 2022/03/14
 * YP 3.1.15 Release date 2022/03/25
 * YP 3.4.3 build date 2022/03/21
 * YP 3.4.3 Release date 2022/04/01
 * YP 3.1.16 build date 2022/04/25
 * YP 3.1.16 Release date 2022/05/06

Tracking Metrics:
 * WDD 2682 (last week 2687) (https://wiki.yoctoproject.org/charts/combo.html)
 * OE-Core/Poky Patch Metrics
    - Total patches found: 1318 (last week 1318)
    - Patches in the Pending State: 488 (37%) [last week 488 (37%)]

The Yocto Project’s technical governance is through its Technical Steering
Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you’d like to see on this
weekly status update, let us know!]



--=-09D2vSeU8UEEBSVIhpYY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;"><div><span style=3D"font-size:11pt;=
font-family:Arial;color:#000000;background-color:transparent;font-weight:40=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre;white-space:pre-wrap;">Current Dev Position: YP 3=
.4 M4</span></div><div><span style=3D"font-size:11pt;font-family:Arial;colo=
r:#000000;background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:none;vertical-align:baseline;white-space:=
pre;white-space:pre-wrap;">Next Deadline: 29th Oct. 2021 YP 3.4 M4 release<=
/span></div><br><div><span style=3D"font-size:11pt;font-family:Arial;color:=
#000000;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e;white-space:pre-wrap;">Next Team Meetings:</span></div><ul style=3D"margi=
n-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">Bug Triage meeting Thursday Oct. 21st at 7:30am PDT (</s=
pan><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVV=
Z6dz09" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-=
family:Arial;color:#1155cc;background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:underline;-webkit-text-d=
ecoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;w=
hite-space:pre;white-space:pre-wrap;">https://zoom.us/j/454367603?pwd=3DZGx=
oa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;font-=
family:Arial;color:#000000;background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre;white-space:pre-wrap;">)</span></div></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#0=
00000;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;=
" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;white-space:pre-wrap;">Monthly Project Meeting Tuesday Nov. 2nd at 8am=
 PDT (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81b=
kcrYjRrcmJsUT09" style=3D"text-decoration:none;"><span style=3D"font-size:1=
1pt;font-family:Arial;color:#1155cc;background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:underline;-webk=
it-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:b=
aseline;white-space:pre;white-space:pre-wrap;">https://zoom.us/j/990892712?=
pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us=
/j/990892712" style=3D"text-decoration:none;"><span style=3D"font-size:11pt=
;font-family:Arial;color:#1155cc;background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:underline;-webkit-=
text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:base=
line;white-space:pre;white-space:pre-wrap;">)</span></a></div></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">Weekly Engineering Sync Tuesday Oct. 19th =
at 8am PDT (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x=
6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration:none;"><span style=3D"font-=
size:11pt;font-family:Arial;color:#1155cc;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:underline=
;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-a=
lign:baseline;white-space:pre;white-space:pre-wrap;">https://zoom.us/j/9908=
92712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://z=
oom.us/j/990892712" style=3D"text-decoration:none;"><span style=3D"font-siz=
e:11pt;font-family:Arial;color:#1155cc;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:underline;-w=
ebkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-alig=
n:baseline;white-space:pre;white-space:pre-wrap;">)</span></a></div></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family=
:Arial;color:#000000;background-color:transparent;font-weight:400;font-styl=
e:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;w=
hite-space:pre;white-space:pre-wrap;">Twitch -&nbsp; See <a href=3D"https:/=
/www.twitch.tv/theyoctojester">https://www.twitch.tv/theyoctojester</a></sp=
an></div></li></ul><br><div><span style=3D"font-size:11pt;font-family:Arial=
;color:#000000;background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre;white-space:pre-wrap;">Key Status/Updates:</span></div><ul style=
=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" =
aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">YP 3.4 rc1 is through QA and the TSC is discussin=
g, likely planning to release as 3.4</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">YP 3.5 Planning document: </span><a href=3D"https://docs=
.google.com/document/d/1OXw-NKoL_Vb9RWI6sRPs3zTcAn4hHPtG0Y2BIs7xIzo/edit?us=
p=3Dsharing" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;=
font-family:Arial;color:#1155cc;background-color:transparent;font-weight:40=
0;font-style:normal;font-variant:normal;text-decoration:underline;-webkit-t=
ext-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:basel=
ine;white-space:pre;white-space:pre-wrap;">https://docs.google.com/document=
/d/1OXw-NKoL_Vb9RWI6sRPs3zTcAn4hHPtG0Y2BIs7xIzo/edit?usp=3Dsharing</span></=
a></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial;color:#000000;background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:1=
1pt;font-family:Arial;color:#000000;background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre;white-space:pre-wrap;">Patches to master have=
 continued to merge post-release, most of the backlog is now processed. The=
re were a number of more invasive changes that were deferred for after 3.4 =
and this has disrupted things a little (pkgconfig-native missing dependenci=
es, reproducible builds being made the default, openssl 3.X, python 3.10, i=
nsane class function cleanup and switch to zstd for sstate which have also =
now merged.</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial;color:#000000;background-color:transparent=
;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none=
;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span styl=
e=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">We are=
 pleased to report that sstate reuse on the autobuilder has improved signif=
icantly and this is reducing build times, to the point several of us did ch=
eck to see if it did actually build things!</span></div></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" =
aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">Intermittent issues continue to rise, particularl=
y with some seemingly network related gremlin somewhere. Help is very much =
welcome on these issues. You can see the list of failures we=E2=80=99re con=
tinuing to see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in bugzill=
a: </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicksea=
rch=3DAB-INT" style=3D"text-decoration:none;"><span style=3D"font-size:11pt=
;font-family:Arial;color:#1155cc;background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:underline;-webkit-=
text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:base=
line;white-space:pre;white-space:pre-wrap;">https://bugzilla.yoctoproject.o=
rg/buglist.cgi?quicksearch=3DAB-INT</span></a></div></li></ul><br><div><spa=
n style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">=
Ways to contribute:</span></div><ul style=3D"margin-top:0;margin-bottom:0;p=
adding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial;color:#000000;background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=
=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">There a=
re bugs identified as possible for newcomers to the project: </span><a href=
=3D"https://wiki.yoctoproject.org/wiki/Newcomers" style=3D"text-decoration:=
none;"><span style=3D"font-size:11pt;font-family:Arial;color:#1155cc;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:underline;-webkit-text-decoration-skip:none;text-decorati=
on-skip-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-wr=
ap;">https://wiki.yoctoproject.org/wiki/Newcomers</span></a></div></li><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;=
color:#000000;background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:A=
rial;color:#000000;background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre;white-space:pre-wrap;">There are bugs that are currently unass=
igned for YP 3.4. See: </span><a href=3D"https://wiki.yoctoproject.org/wiki=
/Bug_Triage#Medium.2B_3.4_Unassigned_Enhancements.2FBugs" style=3D"text-dec=
oration:none;"><span style=3D"font-size:11pt;font-family:Arial;color:#1155c=
c;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-=
decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-spac=
e:pre-wrap;">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.4_Un=
assigned_Enhancements.2FBugs</span></a></div></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">We=E2=80=99d welcome new maintainers for recipes in OE-Core=
. Please see the list at: </span><a href=3D"http://git.yoctoproject.org/cgi=
t.cgi/poky/tree/meta/conf/distro/include/maintainers.inc" style=3D"text-dec=
oration:none;"><span style=3D"font-size:11pt;font-family:Arial;color:#1155c=
c;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-=
decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-spac=
e:pre-wrap;">http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distr=
o/include/maintainers.inc</span></a><span style=3D"font-size:11pt;font-fami=
ly:Arial;color:#000000;background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre;white-space:pre-wrap;"> and discuss with the existing main=
tainer, or ask on the OE-Core mailing list. We will likely move a chunk of =
these to =E2=80=9CUnassigned=E2=80=9D soon to help facilitate this.</span><=
/div></li></ul><br><div><span style=3D"font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;white-space:pre-wrap;">YP 3.4 Milestone Dates:</span></div><ul style=
=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" =
aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">YP 3.4 M4 is in QA</span></div></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#00=
0000;background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"=
 aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;colo=
r:#000000;background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:none;vertical-align:baseline;white-space:=
pre;white-space:pre-wrap;">YP 3.4 M4 Release date 2021/10/29</span></div></=
li></ul><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;wh=
ite-space:pre-wrap;">Proposed YP 3.5 Milestone Dates:</span></div><ul style=
=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" =
aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">YP 3.5 M1 build date 2021/12/06</span></div></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fami=
ly:Arial;color:#000000;background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre;white-space:pre-wrap;">YP 3.5 M1 Release date 2021/12/17</=
span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial;color:#000000;background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-siz=
e:11pt;font-family:Arial;color:#000000;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.5 M2 build dat=
e 2022/01/10</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span sty=
le=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.=
5 M2 Release date 2022/1/21</span></div></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"=
><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:p=
re-wrap;">YP 3.5 M3 build date 2022/2/21</span></div></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ari=
a-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0=
00000;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;=
white-space:pre-wrap;">YP 3.5 M3 Release date 2022/03/04</span></div></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al;color:#000000;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-famil=
y:Arial;color:#000000;background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre;white-space:pre-wrap;">YP 3.5 M4 build date 2022/04/04</spa=
n></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial;color:#000000;background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:1=
1pt;font-family:Arial;color:#000000;background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre;white-space:pre-wrap;">YP 3.5 M4 Release date=
 2022/04/29</span></div></li></ul><br><div><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:#000000;background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre;white-space:pre-wrap;">Proposed upcoming dot releas=
es:</span></div><ul style=3D"margin-top:0;margin-bottom:0;padding-inline-st=
art:48px;"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial;color:#000000;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11p=
t;font-family:Arial;color:#000000;background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre;white-space:pre-wrap;">YP 3.3.4 build date 2021=
/11/01</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial;color:#000000;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"=
font-size:11pt;font-family:Arial;color:#000000;background-color:transparent=
;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none=
;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.3.4 Re=
lease date 2021/11/12</span></div></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div>=
<span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wra=
p;">YP 3.1.12 build date 2021/11/15</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">YP 3.1.12 Release date 2021/11/26</span></div></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;c=
olor:#000000;background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Ar=
ial;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;white-space:pre-wrap;">YP 3.4.1 build date 2021/11/22</span></d=
iv></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial;color:#000000;background-color:transparent;font-weight:400;font=
-style:normal;font-variant:normal;text-decoration:none;vertical-align:basel=
ine;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;f=
ont-family:Arial;color:#000000;background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre;white-space:pre-wrap;">YP 3.4.1 Release date 2021/=
12/03</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial;color:#000000;background-color:transparent;font-=
weight:400;font-style:normal;font-variant:normal;text-decoration:none;verti=
cal-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"f=
ont-size:11pt;font-family:Arial;color:#000000;background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.13 bu=
ild date 2021/12/13</span></div></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><s=
pan style=3D"font-size:11pt;font-family:Arial;color:#000000;background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;=
">YP 3.1.13 Release date 2021/12/22</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">YP 3.1.14 build date 2022/01/24</span></div></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">YP 3.1.14 Release date 2022/02/04</span></=
div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial;color:#000000;background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;=
font-family:Arial;color:#000000;background-color:transparent;font-weight:40=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre;white-space:pre-wrap;">YP 3.4.2 build date 2022/0=
2/07</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:#000000;background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.4.2 Rele=
ase date 2022/02/18</span></div></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><s=
pan style=3D"font-size:11pt;font-family:Arial;color:#000000;background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;=
">YP 3.1.15 build date 2022/03/14</span></div></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">YP 3.1.15 Release date 2022/03/25</span></div></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">YP 3.4.3 build date 2022/03/21</span></div=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;fon=
t-family:Arial;color:#000000;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre;white-space:pre-wrap;">YP 3.4.3 Release date 2022/04=
/01</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:11pt;font-family:Arial;color:#000000;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"fon=
t-size:11pt;font-family:Arial;color:#000000;background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.16 buil=
d date 2022/04/25</span></div></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><spa=
n style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">=
YP 3.1.16 Release date 2022/05/06</span></div></li></ul><br><div><span styl=
e=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Tracki=
ng Metrics:</span></div><ul style=3D"margin-top:0;margin-bottom:0;padding-i=
nline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial;color:#000000;background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-=
size:11pt;font-family:Arial;color:#000000;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre;white-space:pre-wrap;">WDD 2682 (last w=
eek 2687)</span><span style=3D"font-size:11pt;font-family:Consolas,sans-ser=
if;color:#000000;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre;white-space:pre-wrap;"> (</span><a href=3D"https://wiki.yoctopro=
ject.org/charts/combo.html" style=3D"text-decoration:none;"><span style=3D"=
font-size:11pt;font-family:Arial;color:#1155cc;background-color:transparent=
;font-weight:400;font-style:normal;font-variant:normal;text-decoration:unde=
rline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;verti=
cal-align:baseline;white-space:pre;white-space:pre-wrap;">https://wiki.yoct=
oproject.org/charts/combo.html</span></a><span style=3D"font-size:11pt;font=
-family:Consolas,sans-serif;color:#000000;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre;white-space:pre-wrap;">)</span></div></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Consolas,sans-serif;color:#000000;background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;white-space:pre-wrap;">OE-Core/Poky Patch=
 Metrics</span></div></li><ul style=3D"margin-top:0;margin-bottom:0;padding=
-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Arial;color:#000000;background-color:transparent;font-=
weight:400;font-style:normal;font-variant:normal;text-decoration:none;verti=
cal-align:baseline;white-space:pre;" aria-level=3D"2"><div><span style=3D"f=
ont-size:11pt;font-family:Arial;color:#000000;background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Total patche=
s found: 1318 (last week 1318)</span></div></li><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Consolas,sans-serif;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;" aria-level=3D"2"><div><span style=3D"font-size:11pt;font-family:Arial;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">Patches in the Pending State: 488 (37%) [last =
week 488 (37%)]</span></div></li></ul></ul><br><div><span style=3D"font-siz=
e:11pt;font-family:Arial;color:#000000;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre;white-space:pre-wrap;">The Yocto Project=
=E2=80=99s technical governance is through its Technical Steering Committee=
, more information is available at:</span></div><div><a href=3D"https://wik=
i.yoctoproject.org/wiki/TSC" style=3D"text-decoration:none;"><span style=3D=
"font-size:11pt;font-family:Arial;color:#1155cc;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:und=
erline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vert=
ical-align:baseline;white-space:pre;white-space:pre-wrap;">https://wiki.yoc=
toproject.org/wiki/TSC</span></a></div><br><div><span style=3D"font-size:11=
pt;font-family:Arial;color:#000000;background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre;white-space:pre-wrap;">The Status reports are =
now stored on the wiki at: </span><a href=3D"https://wiki.yoctoproject.org/=
wiki/Weekly_Status" style=3D"text-decoration:none;"><span style=3D"font-siz=
e:11pt;font-family:Arial;color:#1155cc;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:underline;-w=
ebkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-alig=
n:baseline;white-space:pre;white-space:pre-wrap;">https://wiki.yoctoproject=
.org/wiki/Weekly_Status</span></a></div><br><div><span style=3D"font-size:1=
1pt;font-family:Arial;color:#000000;background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre;white-space:pre-wrap;">[If anyone has suggest=
ions for other information you=E2=80=99d like to see on this weekly status =
update, let us know!]</span></div><br><br><div><span style=3D"font-size:11p=
t;font-family:Arial;color:#000000;background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre;white-space:pre-wrap;"><span style=3D"width:100=
px;display:inline-block;position:relative;"></span></span></div><div><span>=
</span></div></body></html>

--=-09D2vSeU8UEEBSVIhpYY--
