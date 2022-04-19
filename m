Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <7cace6321d884b00e6e82f5b1d000efbc8e0a681.camel@linuxfoundation.org>
Subject: Yocto Project Status WW16`22
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 19 Apr 2022 10:32:57 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-kpYEi1VJ4g7uLaQPIybY"
List-id: <openembedded-core.lists.openembedded.org>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org

--=-kpYEi1VJ4g7uLaQPIybY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 4.0 rc3
Next Deadline: 29th April 2022 YP 4.0 final release

Next Team Meetings:
 * Bug Triage meeting Thursday Apr.21st 7:30 am PDT
   (https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
 * Monthly Project Meeting Tuesday May 3rd at 8 am PDT
   (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
 * Weekly Engineering Sync Tuesday Apr. 19th  at 8 am PDT
   (https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
 * Twitch -  See https://www.twitch.tv/theyoctojester

Key Status/Updates:
 * The next release, kirkstone will be 4.0 (previously known as 3.5) and will be
   bitbake 2.0 based.
 * The third release candidate build for YP 4.0 (3.5) is now in QA.
 * rc1 had several issues such as edgerouter not booting, a uninative gcc 12
   issue and broken icons in sato that made it inappropriate for release. rc2
   triggered a number of autobuilder intermittent issues, there were tweaks to
   some of the rc1 fixes needed, several CVEs and a systemd/bluetooth issue that
   resulted in an rc3.
 * YP 3.3.6, the final hardknott release will build after 4.0.
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
 * YP 4.0 is in QA
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
 * YP 3.3.6 build date 2022/03/28
 * YP 3.3.6 Release date 2022/04/08
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
 * WDD 2597 (last week 2597) (https://wiki.yoctoproject.org/charts/combo.html)
 * OE-Core/Poky Patch Metrics
    - Total patches found: 1215 (last week 1203)
    - Patches in the Pending State: 343 (28%) [last week 343 (29%)]

The Yocto Project’s technical governance is through its Technical Steering
Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you’d like to see on this
weekly status update, let us know!]



Archived content:

Tip of the Week:
 * The scripts in ${WORKDIR}/temp/run.XXX for shell tasks can be quickly hacked
   and used for standalone debugging by replacing the function call at the end
   with “bash -i” which will then drop you into a shell environment matching the
   task being debugged (minus the fakeroot context). 
 * Bonus marks for anyone sending a patch to add the fakeroot context as
   comments at the start of the scripts.
 * (send any tips you’d like to see here to Stephen or Richard)
 * 

--=-kpYEi1VJ4g7uLaQPIybY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;"><div><span style=3D"font-family: Ar=
ial; font-size: 11pt; white-space: pre-wrap;">Current Dev Position: YP 4.0 =
rc3</span></div><div><span style=3D"font-size:11pt;font-family:Arial;color:=
#000000;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e;white-space:pre-wrap;">Next Deadline: 29th April 2022 YP 4.0 final releas=
e</span></div><br><div><span style=3D"font-size:11pt;font-family:Arial;colo=
r:#000000;background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:none;vertical-align:baseline;white-space:=
pre;white-space:pre-wrap;">Next Team Meetings:</span></div><ul style=3D"mar=
gin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">Bug Triage meeting Thursday Apr.21st 7:30 am PDT (</span=
><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6d=
z09" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:#1155cc;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:underline;-webkit-text-deco=
ration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;whit=
e-space:pre;white-space:pre-wrap;">https://zoom.us/j/454367603?pwd=3DZGxoa2=
ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;white-space:pre-wrap;">)</span></div></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#0000=
00;background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" a=
ria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:=
#000000;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e;white-space:pre-wrap;">Monthly Project Meeting Tuesday May 3rd at 8 am PD=
T (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcr=
YjRrcmJsUT09" style=3D"text-decoration:none;"><span style=3D"font-size:11pt=
;font-family:Arial;color:#1155cc;background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:underline;-webkit-=
text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:base=
line;white-space:pre;white-space:pre-wrap;">https://zoom.us/j/990892712?pwd=
=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/=
990892712" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:#1155cc;background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:underline;-webkit-tex=
t-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:baselin=
e;white-space:pre;white-space:pre-wrap;">)</span></a></div></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">Weekly Engineering Sync Tuesday Apr. 19th&nbsp=
; at 8 am PDT (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1Mjho=
M2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration:none;"><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:#1155cc;background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:underl=
ine;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertica=
l-align:baseline;white-space:pre;white-space:pre-wrap;">https://zoom.us/j/9=
90892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"https:=
//zoom.us/j/990892712" style=3D"text-decoration:none;"><span style=3D"font-=
size:11pt;font-family:Arial;color:#1155cc;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:underline=
;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-a=
lign:baseline;white-space:pre;white-space:pre-wrap;">)</span></a></div></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial;color:#000000;background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;white-space:pre-wrap;">Twitch -&nbsp; See <a href=3D"http=
s://www.twitch.tv/theyoctojester">https://www.twitch.tv/theyoctojester</a><=
/span></div></li></ul><br><div><span style=3D"font-size:11pt;font-family:Ar=
ial;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;white-space:pre-wrap;">Key Status/Updates:</span></div><ul styl=
e=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#00=
0000;background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"=
 aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;colo=
r:#000000;background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:none;vertical-align:baseline;white-space:=
pre;white-space:pre-wrap;">The next release, kirkstone will be 4.0 (previou=
sly known as 3.5) and will be bitbake 2.0 based.</span></div></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">The third release candidate build for YP 4=
.0 (3.5) is now in QA.</span></div></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div=
><span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wr=
ap;">rc1 had several issues such as edgerouter not booting, a uninative gcc=
 12 issue and broken icons in sato that made it inappropriate for release. =
rc2 triggered a number of autobuilder intermittent issues, there were tweak=
s to some of the rc1 fixes needed, several CVEs and a systemd/bluetooth iss=
ue that resulted in an rc3.</span></div></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"=
><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:p=
re-wrap;">YP 3.3.6, the final hardknott release will build after 4.0.</span=
></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial;color:#000000;background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11=
pt;font-family:Arial;color:#000000;background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre;white-space:pre-wrap;">YP 4.1 planning documen=
t is available for review at: </span><a href=3D"https://docs.google.com/doc=
ument/d/1-g7DatSdmIETwD3xFSCxV7MbWVVkpQvQ788mIr1MPTI/edit?usp=3Dsharing" st=
yle=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:Ari=
al;color:#1155cc;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-=
skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space=
:pre;white-space:pre-wrap;">https://docs.google.com/document/d/1-g7DatSdmIE=
TwD3xFSCxV7MbWVVkpQvQ788mIr1MPTI/edit?usp=3Dsharing</span></a></div></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family=
:Arial;color:#000000;background-color:transparent;font-weight:400;font-styl=
e:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;w=
hite-space:pre;white-space:pre-wrap;">If people see intermittent issues in =
their own builds, particularly if they=E2=80=99re the same as intermittent =
issues seen on the autobuilder, please do comment in the bugs mentioning wh=
en they happen as the frequency information does help us prioritize fixing =
the most common issues.</span></div></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><di=
v><span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-=
color:transparent;font-weight:400;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-w=
rap;">Intermittent issues continue to be at high levels and help is very mu=
ch welcome in trying to resolve them. You can see the list of failures we=
=E2=80=99re continuing to see by searching for the =E2=80=9CAB-INT=E2=80=9D=
 tag in bugzilla: </span><a href=3D"https://bugzilla.yoctoproject.org/bugli=
st.cgi?quicksearch=3DAB-INT" style=3D"text-decoration:none;"><span style=3D=
"font-size:11pt;font-family:Arial;color:#1155cc;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:und=
erline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vert=
ical-align:baseline;white-space:pre;white-space:pre-wrap;">https://bugzilla=
.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT</span></a></div></li></u=
l><div><br></div><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">Ways to contribute:</span></div><ul style=3D"marg=
in-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">There are bugs identified as possible for newcomers to t=
he project: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Newcomers"=
 style=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:=
Arial;color:#1155cc;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:underline;-webkit-text-decorati=
on-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-sp=
ace:pre;white-space:pre-wrap;">https://wiki.yoctoproject.org/wiki/Newcomers=
</span></a></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:#000000;background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre;white-space:pre-wrap;">There are bug=
s that are currently unassigned for YP 3.5. See: </span><a href=3D"https://=
wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.5_Unassigned_Enhancements=
.2FBugs" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;font=
-family:Arial;color:#1155cc;background-color:transparent;font-weight:400;fo=
nt-style:normal;font-variant:normal;text-decoration:underline;-webkit-text-=
decoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;=
white-space:pre;white-space:pre-wrap;">https://wiki.yoctoproject.org/wiki/B=
ug_Triage#Medium.2B_3.5_Unassigned_Enhancements.2FBugs</span></a></div></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial;color:#000000;background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;white-space:pre-wrap;">We=E2=80=99d welcome new maintaine=
rs for recipes in OE-Core. Please see the list at: </span><a href=3D"http:/=
/git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintaine=
rs.inc" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-=
family:Arial;color:#1155cc;background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:underline;-webkit-text-d=
ecoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;w=
hite-space:pre;white-space:pre-wrap;">http://git.yoctoproject.org/cgit.cgi/=
poky/tree/meta/conf/distro/include/maintainers.inc</span></a><span style=3D=
"font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"> and discu=
ss with the existing maintainer, or ask on the OE-Core mailing list. We wil=
l likely move a chunk of these to =E2=80=9CUnassigned=E2=80=9D soon to help=
 facilitate this.</span></div></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><spa=
n style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">=
Help us resolve CVE issues: </span><a href=3D"https://docs.google.com/sprea=
dsheets/d/e/2PACX-1vRgNISmH0Ditf0bRtSezeR2XsgKIiSFJKF6KJUHpnzocNGzvKZbuSDKf=
mV3n64BFXDRqElBSJnhHtG4/pubchart?oid=3D1993375488&amp;format=3Dinteractive"=
 style=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:=
Arial;color:#1155cc;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:underline;-webkit-text-decorati=
on-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-sp=
ace:pre;white-space:pre-wrap;">CVE metrics</span></a><span style=3D"font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;white-space:pre-wrap;">&nbsp;</span></div=
></li></ul><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;white-space:pre-wrap;">YP 4.0 Milestone Dates:</span></div><ul style=3D"ma=
rgin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;ba=
ckground-color:transparent;font-weight:400;font-style:normal;font-variant:n=
ormal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-l=
evel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0000=
00;background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whi=
te-space:pre-wrap;">YP 4.0 is in QA</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">YP 4.0 Release date 2022/04/29</span></div></li></ul><br=
><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:p=
re-wrap;">YP 4.1 Milestone Dates:</span></div><ul style=3D"margin-top:0;mar=
gin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><di=
v><span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-=
color:transparent;font-weight:400;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-w=
rap;">YP 4.1 M1 build date 2022/05/30</span></div></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;ba=
ckground-color:transparent;font-weight:400;font-style:normal;font-variant:n=
ormal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-l=
evel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0000=
00;background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whi=
te-space:pre-wrap;">YP 4.1 M1 Release date 2022/06/10</span></div></li><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;=
color:#000000;background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:A=
rial;color:#000000;background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre;white-space:pre-wrap;">YP 4.1 M2 build date 2022/07/11</span><=
/div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial;color:#000000;background-color:transparent;font-weight:400;fo=
nt-style:normal;font-variant:normal;text-decoration:none;vertical-align:bas=
eline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt=
;font-family:Arial;color:#000000;background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:none;vertical-alig=
n:baseline;white-space:pre;white-space:pre-wrap;">YP 4.1 M2 Release date 20=
22/07/22</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;fon=
t-size:11pt;font-family:Arial;color:#000000;background-color:transparent;fo=
nt-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ve=
rtical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=
=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.1 =
M3 build date 2022/08/22</span></div></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><d=
iv><span style=3D"font-size:11pt;font-family:Arial;color:#000000;background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-=
wrap;">YP 4.1 M3 Release date 2022/09/02</span></div></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ari=
a-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0=
00000;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;=
white-space:pre-wrap;">YP 4.1 M4 build date 2022/10/03</span></div></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
;color:#000000;background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:=
Arial;color:#000000;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre;white-space:pre-wrap;">YP 4.1 M4 Release date 2022/10/28</spa=
n></div></li></ul><br><div><span style=3D"font-size:11pt;font-family:Arial;=
color:#000000;background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre;white-space:pre-wrap;">Upcoming dot releases:</span></div><ul style=
=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" =
aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">YP 3.3.6 build date 2022/03/28</span></div></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al;color:#000000;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-famil=
y:Arial;color:#000000;background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre;white-space:pre-wrap;">YP 3.3.6 Release date 2022/04/08</sp=
an></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial;color:#000000;background-color:transparent;font-weight:40=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:=
11pt;font-family:Arial;color:#000000;background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.16 build date =
2022/04/25</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial;color:#000000;background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=
=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.=
16 Release date 2022/05/06</span></div></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1">=
<div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgrou=
nd-color:transparent;font-weight:400;font-style:normal;font-variant:normal;=
text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pr=
e-wrap;">YP 3.4.4 build date 2022/05/02</span></div></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;=
background-color:transparent;font-weight:400;font-style:normal;font-variant=
:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria=
-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00=
0000;background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;w=
hite-space:pre-wrap;">YP 3.4.4 Release date 2022/05/13</span></div></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
;color:#000000;background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:none;vertical-align:baseline;white-s=
pace:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:=
Arial;color:#000000;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre;white-space:pre-wrap;">YP 4.0.1 build date 2022/05/16</span><=
/div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial;color:#000000;background-color:transparent;font-weight:400;fo=
nt-style:normal;font-variant:normal;text-decoration:none;vertical-align:bas=
eline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt=
;font-family:Arial;color:#000000;background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:none;vertical-alig=
n:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.1 Release date 202=
2/05/27</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial;color:#000000;background-color:transparent;fon=
t-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ver=
tical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D=
"font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.17 =
build date 2022/06/06</span></div></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div>=
<span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wra=
p;">YP 3.1.17 Release date 2022/06/17</span></div></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;ba=
ckground-color:transparent;font-weight:400;font-style:normal;font-variant:n=
ormal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-l=
evel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0000=
00;background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whi=
te-space:pre-wrap;">YP 4.0.2 build date 2022/06/27</span></div></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">YP 4.0.2 Release date 2022/07/08</span></d=
iv></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial;color:#000000;background-color:transparent;font-weight:400;font=
-style:normal;font-variant:normal;text-decoration:none;vertical-align:basel=
ine;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;f=
ont-family:Arial;color:#000000;background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.18 build date 2022/0=
7/18</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:#000000;background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.18 Rel=
ease date 2022/07/29</span></div></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><=
span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap=
;">YP 4.0.3 build date 2022/08/08</span></div></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">YP 4.0.3 Release date 2022/08/19</span></div></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">YP 3.1.19 build date 2022/08/29</span></di=
v></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial;color:#000000;background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:#000000;background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre;white-space:pre-wrap;">YP 3.1.19 Release date 2022/=
09/09</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial;color:#000000;background-color:transparent;font-=
weight:400;font-style:normal;font-variant:normal;text-decoration:none;verti=
cal-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"f=
ont-size:11pt;font-family:Arial;color:#000000;background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.4 bui=
ld date 2022/09/19</span></div></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><sp=
an style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"=
>YP 4.0.4 Release date 2022/09/30</span></div></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">YP 3.1.20 build date 2022/10/10</span></div></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
#000000;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;c=
olor:#000000;background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre;white-space:pre-wrap;">YP 3.1.20 Release date 2022/10/21</span></div=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;fon=
t-family:Arial;color:#000000;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre;white-space:pre-wrap;">YP 4.0.5 build date 2022/10/3=
1</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial;color:#000000;background-color:transparent;font-weig=
ht:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-=
align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-=
size:11pt;font-family:Arial;color:#000000;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.5 Release=
 date 2022/11/11</span></div></li></ul><br><div><span style=3D"font-size:11=
pt;font-family:Arial;color:#000000;background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre;white-space:pre-wrap;">Tracking Metrics:</span=
></div><ul style=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;=
"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial;color:#000000;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;wh=
ite-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:#000000;background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre;white-space:pre-wrap;">WDD 2597 (last week 2597)</span><=
span style=3D"font-size:11pt;font-family:Consolas,sans-serif;color:#000000;=
background-color:transparent;font-weight:400;font-style:normal;font-variant=
:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-=
space:pre-wrap;"> (</span><a href=3D"https://wiki.yoctoproject.org/charts/c=
ombo.html" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:#1155cc;background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:underline;-webkit-tex=
t-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:baselin=
e;white-space:pre;white-space:pre-wrap;">https://wiki.yoctoproject.org/char=
ts/combo.html</span></a><span style=3D"font-size:11pt;font-family:Consolas,=
sans-serif;color:#000000;background-color:transparent;font-weight:400;font-=
style:normal;font-variant:normal;text-decoration:none;vertical-align:baseli=
ne;white-space:pre;white-space:pre-wrap;">)</span></div></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-se=
rif;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fami=
ly:Arial;color:#000000;background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre;white-space:pre-wrap;">OE-Core/Poky Patch Metrics</span></=
div></li><ul style=3D"margin-top:0;margin-bottom:0;padding-inline-start:48p=
x;"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;" aria-level=3D"2"><div><span style=3D"font-size:11pt;fon=
t-family:Arial;color:#000000;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre;white-space:pre-wrap;">Total patches found: 1215 (la=
st week 1203)</span></div></li><li dir=3D"ltr" style=3D"list-style-type:cir=
cle;font-size:11pt;font-family:Consolas,sans-serif;color:#000000;background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"=
2"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre;white-space=
:pre-wrap;">Patches in the Pending State: 343 (28%) [last week 343 (29%)]</=
span></div></li></ul></ul><br><div><span style=3D"font-size:11pt;font-famil=
y:Arial;color:#000000;background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre;white-space:pre-wrap;">The Yocto Project=E2=80=99s technica=
l governance is through its Technical Steering Committee, more information =
is available at:</span></div><div><a href=3D"https://wiki.yoctoproject.org/=
wiki/TSC" style=3D"text-decoration:none;"><span style=3D"font-size:11pt;fon=
t-family:Arial;color:#1155cc;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:underline;-webkit-text=
-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:baseline=
;white-space:pre;white-space:pre-wrap;">https://wiki.yoctoproject.org/wiki/=
TSC</span></a></div><br><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">The Status reports are now stored on the w=
iki at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status"=
 style=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:=
Arial;color:#1155cc;background-color:transparent;font-weight:400;font-style=
:normal;font-variant:normal;text-decoration:underline;-webkit-text-decorati=
on-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-sp=
ace:pre;white-space:pre-wrap;">https://wiki.yoctoproject.org/wiki/Weekly_St=
atus</span></a></div><br><div><span style=3D"font-size:11pt;font-family:Ari=
al;color:#000000;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre;white-space:pre-wrap;">[If anyone has suggestions for other info=
rmation you=E2=80=99d like to see on this weekly status update, let us know=
!]</span></div><br><div><span style=3D"font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;white-space:pre-wrap;"><span style=3D"width:100px;display:inline-block=
;position:relative;"></span></span></div><br><br><div><span style=3D"font-s=
ize:11pt;font-family:Arial;color:#000000;background-color:transparent;font-=
weight:400;font-style:normal;font-variant:normal;text-decoration:none;verti=
cal-align:baseline;white-space:pre;white-space:pre-wrap;">Archived content:=
</span></div><br><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">Tip of the Week:</span></div><ul style=3D"margin-=
top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">The scripts in ${WORKDIR}/temp/run.XXX for shell tasks can =
be quickly hacked and used for standalone debugging by replacing the functi=
on call at the end with =E2=80=9Cbash -i=E2=80=9D which will then drop you =
into a shell environment matching the task being debugged (minus the fakero=
ot context).&nbsp;</span></div></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><sp=
an style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"=
>Bonus marks for anyone sending a patch to add the fakeroot context as comm=
ents at the start of the scripts.</span></div></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">(send any tips you=E2=80=99d like to see here to Stephen or=
 Richard)</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial;color:#000000;background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre;" aria-level=3D"1"><br></li></ul><di=
v><span></span></div></body></html>

--=-kpYEi1VJ4g7uLaQPIybY--
