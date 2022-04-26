Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ede2046b95e1c5828309c44261615655311744ce.camel@linuxfoundation.org>
Subject: Yocto Project Status WW17`22
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 26 Apr 2022 16:05:03 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-sOY8mV89bSnKpJ/astQN"
List-id: <openembedded-core.lists.openembedded.org>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org

--=-sOY8mV89bSnKpJ/astQN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 4.1 M1
Next Deadline: 30th May 2022 YP 4.1 M1 Build

Next Team Meetings:
 * Bug Triage meeting Thursday Apr. 28th 7:30 am PDT
   (https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
 * Monthly Project Meeting Tuesday May 3rd at 8 am PDT
   (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
 * Weekly Engineering Sync Tuesday Apr. 26th  at 8 am PDT
   (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
 * Twitch -  See https://www.twitch.tv/theyoctojester

Key Status/Updates:
 * The next release, kirkstone will be 4.0 (previously known as 3.5) and will be
   bitbake 2.0 based.
 * The YP 4.0 (3.5) is due to release pending final checks on documentation and
   release notes.
 * YP 3.3.6 has passed QA and pending TSC approval for release
 * YP 3.1.16 has been built and entering QA
 * There is a major issue from a recent CVE fix to git which is making it’s way
   into various distros and causes problems when git is used from a fakeroot
   environment. We use git from the host so we are exposed to the issue. There
   are several patches attempting to fix this, the initial fixes in master were
   not quite enough unfortunately.
 * Performance workers on the autobuilder have been replaced with new alma8 and
   debian 11 systems. The previous centos7 and ubuntu1604 systems completed over
   5800 builds each!
 * Master has started taking new patches but the git issue above is impeding
   testing.
 * YP 4.1 planning document is available for review at:
   https://docs.google.com/document/d/1-
   g7DatSdmIETwD3xFSCxV7MbWVVkpQvQ788mIr1MPTI/edit?usp=sharing
 * If people see intermittent issues in their own builds, particularly if
   they’re the same as intermittent issues seen on the autobuilder, please do
   comment in the bugs mentioning when they happen as the frequency information
   does help us prioritize fixing the most common issues.
 * Intermittent issues continue to be at high levels and help is very much
   welcome in trying to resolve them. You can see the list of failures we’re
   continuing to see by searching for the “AB-INT” tag in bugzilla:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT

Ways to contribute:
 * There are bugs identified as possible for newcomers to the project:
   https://wiki.yoctoproject.org/wiki/Newcomers
 * There are bugs that are currently unassigned for YP 3.5. See:
   https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.5_Unassigned_Enhanc
   ements.2FBugs
 * We’d welcome new maintainers for recipes in OE-Core. Please see the list at:
   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maint
   ainers.inc and discuss with the existing maintainer, or ask on the OE-Core
   mailing list. We will likely move a chunk of these to “Unassigned” soon to
   help facilitate this.
 * Help us resolve CVE issues: CVE metrics 

YP 4.0 Milestone Dates:
 * YP 4.0 Release date 2022/04/29

YP 4.1 Milestone Dates:
 * YP 4.1 M1 build date 2022/05/30
 * YP 4.1 M1 Release date 2022/06/10
 * YP 4.1 M2 build date 2022/07/11
 * YP 4.1 M2 Release date 2022/07/22
 * YP 4.1 M3 build date 2022/08/22
 * YP 4.1 M3 Release date 2022/09/02
 * YP 4.1 M4 build date 2022/10/03
 * YP 4.1 M4 Release date 2022/10/28

Upcoming dot releases:
 * YP 3.3.6 out of QA
 * YP 3.1.16 build date 2022/04/25
 * YP 3.1.16 Release date 2022/05/06
 * YP 3.4.4 build date 2022/05/02
 * YP 3.4.4 Release date 2022/05/13
 * YP 4.0.1 build date 2022/05/16
 * YP 4.0.1 Release date 2022/05/27
 * YP 3.1.17 build date 2022/06/06
 * YP 3.1.17 Release date 2022/06/17
 * YP 4.0.2 build date 2022/06/27
 * YP 4.0.2 Release date 2022/07/08
 * YP 3.1.18 build date 2022/07/18
 * YP 3.1.18 Release date 2022/07/29
 * YP 4.0.3 build date 2022/08/08
 * YP 4.0.3 Release date 2022/08/19
 * YP 3.1.19 build date 2022/08/29
 * YP 3.1.19 Release date 2022/09/09
 * YP 4.0.4 build date 2022/09/19
 * YP 4.0.4 Release date 2022/09/30
 * YP 3.1.20 build date 2022/10/10
 * YP 3.1.20 Release date 2022/10/21
 * YP 4.0.5 build date 2022/10/31
 * YP 4.0.5 Release date 2022/11/11

Tracking Metrics:
 * WDD 2495 (last week 2597) (https://wiki.yoctoproject.org/charts/combo.html)
 * OE-Core/Poky Patch Metrics
    - Total patches found: 1215 (last week 1215)
    - Patches in the Pending State: 343 (28%) [last week 343 (28%)]

The Yocto Project’s technical governance is through its Technical Steering
Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you’d like to see on this
weekly status update, let us know!]

--=-sOY8mV89bSnKpJ/astQN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;"><div><span style=3D"font-family: Ar=
ial; font-size: 11pt; white-space: pre-wrap;">Current Dev Position: YP 4.1 =
M1</span></div><div><span style=3D"font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;white-space:pre-wrap;">Next Deadline: 30th May 2022 YP 4.1 M1 Build</span>=
</div><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">Next Team Meetings:</span></div><ul style=3D"margin-top:=
0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-=
color:transparent;font-weight:400;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1=
"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:=
pre-wrap;">Bug Triage meeting Thursday Apr. 28th 7:30 am PDT (</span><a hre=
f=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" st=
yle=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:Ari=
al;color:#1155cc;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-=
skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space=
:pre;white-space:pre-wrap;">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM=
3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;font-family:Ari=
al;color:#000000;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre;white-space:pre-wrap;">)</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">Monthly Project Meeting Tuesday May 3rd at 8 am PDT (</s=
pan><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcm=
JsUT09" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-=
family:Arial;color:#1155cc;background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:underline;-webkit-text-d=
ecoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;w=
hite-space:pre;white-space:pre-wrap;">https://zoom.us/j/990892712?pwd=3DcHU=
1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892=
712" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:#1155cc;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:underline;-webkit-text-deco=
ration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;whit=
e-space:pre;white-space:pre-wrap;">)</span></a></div></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ari=
a-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0=
00000;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;=
white-space:pre-wrap;">Weekly Engineering Sync Tuesday Apr. 26th&nbsp; at 8=
 am PDT (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck=
81bkcrYjRrcmJsUT09" style=3D"text-decoration:none;"><span style=3D"font-siz=
e:11pt;font-family:Arial;color:#1155cc;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:underline;-w=
ebkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-alig=
n:baseline;white-space:pre;white-space:pre-wrap;">https://zoom.us/j/9908927=
12?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom=
.us/j/990892712" style=3D"text-decoration:none;"><span style=3D"font-size:1=
1pt;font-family:Arial;color:#1155cc;background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:underline;-webk=
it-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:b=
aseline;white-space:pre;white-space:pre-wrap;">)</span></a></div></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;c=
olor:#000000;background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Ar=
ial;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;white-space:pre-wrap;">Twitch -&nbsp; See <a href=3D"https://ww=
w.twitch.tv/theyoctojester">https://www.twitch.tv/theyoctojester</a></span>=
</div></li></ul><br><div><span style=3D"font-size:11pt;font-family:Arial;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">Key Status/Updates:</span></div><ul style=3D"m=
argin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-=
level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;wh=
ite-space:pre-wrap;">The next release, kirkstone will be 4.0 (previously kn=
own as 3.5) and will be bitbake 2.0 based.</span></div></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#0000=
00;background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" a=
ria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:=
#000000;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e;white-space:pre-wrap;">The YP 4.0 (3.5) is due to release pending final c=
hecks on documentation and release notes.</span></div></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ar=
ia-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;white-space:pre-wrap;">YP 3.3.6 has passed QA and pending TSC approval for=
 release</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial;color:#000000;background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=
=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.=
16 has been built and entering QA</span></div></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">There is a major issue from a recent CVE fix to git which i=
s making it=E2=80=99s way into various distros and causes problems when git=
 is used from a fakeroot environment. We use git from the host so we are ex=
posed to the issue. There are several patches attempting to fix this, the i=
nitial fixes in master were not quite enough unfortunately.</span></div></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial;color:#000000;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:#000000;background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre;white-space:pre-wrap;">Performance workers on the autobu=
ilder have been replaced with new alma8 and debian 11 systems. The previous=
 centos7 and ubuntu1604 systems completed over 5800 builds each!</span></di=
v></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial;color:#000000;background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:#000000;background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre;white-space:pre-wrap;">Master has started taking ne=
w patches but the git issue above is impeding testing.</span></div></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
;color:#000000;background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:=
Arial;color:#000000;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre;white-space:pre-wrap;">YP 4.1 planning document is available =
for review at: </span><a href=3D"https://docs.google.com/document/d/1-g7Dat=
SdmIETwD3xFSCxV7MbWVVkpQvQ788mIr1MPTI/edit?usp=3Dsharing" style=3D"text-dec=
oration:none;"><span style=3D"font-size:11pt;font-family:Arial;color:#1155c=
c;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-=
decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-spac=
e:pre-wrap;">https://docs.google.com/document/d/1-g7DatSdmIETwD3xFSCxV7MbWV=
VkpQvQ788mIr1MPTI/edit?usp=3Dsharing</span></a></div></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ari=
a-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0=
00000;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;=
white-space:pre-wrap;">If people see intermittent issues in their own build=
s, particularly if they=E2=80=99re the same as intermittent issues seen on =
the autobuilder, please do comment in the bugs mentioning when they happen =
as the frequency information does help us prioritize fixing the most common=
 issues.</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial;color:#000000;background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=
=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Intermi=
ttent issues continue to be at high levels and help is very much welcome in=
 trying to resolve them. You can see the list of failures we=E2=80=99re con=
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
igned for YP 3.5. See: </span><a href=3D"https://wiki.yoctoproject.org/wiki=
/Bug_Triage#Medium.2B_3.5_Unassigned_Enhancements.2FBugs" style=3D"text-dec=
oration:none;"><span style=3D"font-size:11pt;font-family:Arial;color:#1155c=
c;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-=
decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-spac=
e:pre-wrap;">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.5_Un=
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
/div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial;color:#000000;background-color:transparent;font-weight:400;fo=
nt-style:normal;font-variant:normal;text-decoration:none;vertical-align:bas=
eline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt=
;font-family:Arial;color:#000000;background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:none;vertical-alig=
n:baseline;white-space:pre;white-space:pre-wrap;">Help us resolve CVE issue=
s: </span><a href=3D"https://docs.google.com/spreadsheets/d/e/2PACX-1vRgNIS=
mH0Ditf0bRtSezeR2XsgKIiSFJKF6KJUHpnzocNGzvKZbuSDKfmV3n64BFXDRqElBSJnhHtG4/p=
ubchart?oid=3D1993375488&amp;format=3Dinteractive" style=3D"text-decoration=
:none;"><span style=3D"font-size:11pt;font-family:Arial;color:#1155cc;backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:underline;-webkit-text-decoration-skip:none;text-decorat=
ion-skip-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-w=
rap;">CVE metrics</span></a><span style=3D"font-size:11pt;font-family:Arial=
;color:#000000;background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre;white-space:pre-wrap;">&nbsp;</span></div></li></ul><br><div><span=
 style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Y=
P 4.0 Milestone Dates:</span></div><ul style=3D"margin-top:0;margin-bottom:=
0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span sty=
le=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.=
0 Release date 2022/04/29</span></div></li></ul><br><div><span style=3D"fon=
t-size:11pt;font-family:Arial;color:#000000;background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.1 Milesto=
ne Dates:</span></div><ul style=3D"margin-top:0;margin-bottom:0;padding-inl=
ine-start:48px;"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial;color:#000000;background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.1 M1 build da=
te 2022/05/30</span></div></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:#000000;background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span st=
yle=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4=
.1 M1 Release date 2022/06/10</span></div></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"=
1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre;white-space=
:pre-wrap;">YP 4.1 M2 build date 2022/07/11</span></div></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" =
aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">YP 4.1 M2 Release date 2022/07/22</span></div></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial;color:#000000;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:#000000;background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre;white-space:pre-wrap;">YP 4.1 M3 build date 2022/08/22</=
span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial;color:#000000;background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-siz=
e:11pt;font-family:Arial;color:#000000;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.1 M3 Release d=
ate 2022/09/02</span></div></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial;color:#000000;background-color:transpar=
ent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:n=
one;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span s=
tyle=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP =
4.1 M4 build date 2022/10/03</span></div></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-=
color:transparent;font-weight:400;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1=
"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:=
pre-wrap;">YP 4.1 M4 Release date 2022/10/28</span></div></li></ul><br><div=
><span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wr=
ap;">Upcoming dot releases:</span></div><ul style=3D"margin-top:0;margin-bo=
ttom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><spa=
n style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">=
YP 3.3.6 out of QA</span></div></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><sp=
an style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"=
>YP 3.1.16 build date 2022/04/25</span></div></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">YP 3.1.16 Release date 2022/05/06</span></div></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">YP 3.4.4 build date 2022/05/02</span></div=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;fon=
t-family:Arial;color:#000000;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre;white-space:pre-wrap;">YP 3.4.4 Release date 2022/05=
/13</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:11pt;font-family:Arial;color:#000000;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"fon=
t-size:11pt;font-family:Arial;color:#000000;background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.1 build=
 date 2022/05/16</span></div></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span=
 style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Y=
P 4.0.1 Release date 2022/05/27</span></div></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgrou=
nd-color:transparent;font-weight:400;font-style:normal;font-variant:normal;=
text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">YP 3.1.17 build date 2022/06/06</span></div></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
#000000;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;c=
olor:#000000;background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre;white-space:pre-wrap;">YP 3.1.17 Release date 2022/06/17</span></div=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;fon=
t-family:Arial;color:#000000;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre;white-space:pre-wrap;">YP 4.0.2 build date 2022/06/2=
7</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial;color:#000000;background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-=
size:11pt;font-family:Arial;color:#000000;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.2 Release=
 date 2022/07/08</span></div></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span=
 style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Y=
P 3.1.18 build date 2022/07/18</span></div></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgroun=
d-color:transparent;font-weight:400;font-style:normal;font-variant:normal;t=
ext-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D=
"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre;white-spac=
e:pre-wrap;">YP 3.1.18 Release date 2022/07/29</span></div></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">YP 4.0.3 build date 2022/08/08</span></div></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial;color:#000000;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:#000000;background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre;white-space:pre-wrap;">YP 4.0.3 Release date 2022/08/19<=
/span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial;color:#000000;background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.19 build da=
te 2022/08/29</span></div></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:#000000;background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span st=
yle=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3=
.1.19 Release date 2022/09/09</span></div></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"=
1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre;white-space=
:pre-wrap;">YP 4.0.4 build date 2022/09/19</span></div></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#0000=
00;background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" a=
ria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:=
#000000;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e;white-space:pre-wrap;">YP 4.0.4 Release date 2022/09/30</span></div></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fami=
ly:Arial;color:#000000;background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre;white-space:pre-wrap;">YP 3.1.20 build date 2022/10/10</sp=
an></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial;color:#000000;background-color:transparent;font-weight:40=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:=
11pt;font-family:Arial;color:#000000;background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.20 Release dat=
e 2022/10/21</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span sty=
le=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.=
0.5 build date 2022/10/31</span></div></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><=
div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgroun=
d-color:transparent;font-weight:400;font-style:normal;font-variant:normal;t=
ext-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre=
-wrap;">YP 4.0.5 Release date 2022/11/11</span></div></li></ul><br><div><sp=
an style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"=
>Tracking Metrics:</span></div><ul style=3D"margin-top:0;margin-bottom:0;pa=
dding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial;color:#000000;background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=
=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">WDD 249=
5 (last week 2597)</span><span style=3D"font-size:11pt;font-family:Consolas=
,sans-serif;color:#000000;background-color:transparent;font-weight:400;font=
-style:normal;font-variant:normal;text-decoration:none;vertical-align:basel=
ine;white-space:pre;white-space:pre-wrap;"> (</span><a href=3D"https://wiki=
.yoctoproject.org/charts/combo.html" style=3D"text-decoration:none;"><span =
style=3D"font-size:11pt;font-family:Arial;color:#1155cc;background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:n=
one;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">https://=
wiki.yoctoproject.org/charts/combo.html</span></a><span style=3D"font-size:=
11pt;font-family:Consolas,sans-serif;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">)</span=
></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Consolas,sans-serif;color:#000000;background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=
=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">OE-Core=
/Poky Patch Metrics</span></div></li><ul style=3D"margin-top:0;margin-botto=
m:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type:ci=
rcle;font-size:11pt;font-family:Arial;color:#000000;background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre;" aria-level=3D"2"><div><span=
 style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">T=
otal patches found: 1215 (last week 1215)</span></div></li><li dir=3D"ltr" =
style=3D"list-style-type:circle;font-size:11pt;font-family:Consolas,sans-se=
rif;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;" aria-level=3D"2"><div><span style=3D"font-size:11pt;font-fami=
ly:Arial;color:#000000;background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre;white-space:pre-wrap;">Patches in the Pending State: 343 (=
28%) [last week 343 (28%)]</span></div></li></ul></ul><br><div><span style=
=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">The Yoc=
to Project=E2=80=99s technical governance is through its Technical Steering=
 Committee, more information is available at:</span></div><div><a href=3D"h=
ttps://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration:none;"><spa=
n style=3D"font-size:11pt;font-family:Arial;color:#1155cc;background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink=
:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">https:=
//wiki.yoctoproject.org/wiki/TSC</span></a></div><br><div><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:#000000;background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre;white-space:pre-wrap;">The Status re=
ports are now stored on the wiki at: </span><a href=3D"https://wiki.yoctopr=
oject.org/wiki/Weekly_Status" style=3D"text-decoration:none;"><span style=
=3D"font-size:11pt;font-family:Arial;color:#1155cc;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;v=
ertical-align:baseline;white-space:pre;white-space:pre-wrap;">https://wiki.=
yoctoproject.org/wiki/Weekly_Status</span></a></div><br><div><span style=3D=
"font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">[If anyone=
 has suggestions for other information you=E2=80=99d like to see on this we=
ekly status update, let us know!]</span></div><div><span></span></div></bod=
y></html>

--=-sOY8mV89bSnKpJ/astQN--
