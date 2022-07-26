Return-Path: <ncaidin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5068CCA47E
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 13:17:43 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.6371.1658841460653105530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 06:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RvmtDE+W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.177,
 mailfrom: ncaidin@linuxfoundation.org)
Received: by mail-yb1-f177.google.com with SMTP id r3so25224552ybr.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=ur08Bdg4OfhrnZY/M+3/c0j7Qd/5oZiktYb1PAL4f00=;
        b=RvmtDE+WUVc/vFK11cjG3mkCCONpsTpoQPbmq+px17DxiQdMVA/vw7M1Va66Zpp7Ck
         TUypl/hdOrXDwLGaKAgNWgdqcl+3M+4mAL2uIDDs5Fj9sfzFBj8SZuM8MgOKV7cb2DaI
         Xsgfr9+fZwbxDx7j2JiMxPyzFhUgyMVy+shBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ur08Bdg4OfhrnZY/M+3/c0j7Qd/5oZiktYb1PAL4f00=;
        b=jHm0KvrLF6qtUDCRDJFrev/Ft0aZFvatY3pP0SHBpMPTgZsF2vV/NZ7is5/RykAaNO
         74DHqPuNgAg3F3huS/J/DTkl81lUdx7pErSbOgq4d9yOom7ybdgytwR6Ft+jaJJRpdi3
         Zv4qPyp39Z6Yd+6bGBtc7irSLHvRqMlRBCA5zcrDISSJgOmNDS4r2KWJ0u+oOKuB2onE
         n54ZBBYlI3gswSLyFm4g9T0UrifqFEWxuz16BBldzfCqgrzD/RiyzVDZ+dmoyR9gUOpe
         18xbgdGwhCMaH7LSOoSOPKFBQ6MSVdjsfwpJ5n9jWA0y46Ggs1EnUU0LR6t/qhbKBOpZ
         1LGg==
X-Gm-Message-State: AJIora/Mc1QEJBTkh/odzbq2JvqX3TPiRL8r7hOoj3s+GD16G1Pwr6Kp
	Q/8B6g2OfMQue+8TTSlI9vBAZGI1QqDQnKNy2EJYyA==
X-Google-Smtp-Source: 
 AGRyM1s5EBZpGwJ18qhgMr1JeHH/hyvmSqUbLk/Rbp76CZgSE5ukRzxdA3sxpv/kUcxSBFl3QA0+AdyvzgMn3GorS6Q=
X-Received: by 2002:a25:780e:0:b0:671:3386:8129 with SMTP id
 t14-20020a25780e000000b0067133868129mr7770187ybc.404.1658841459696; Tue, 26
 Jul 2022 06:17:39 -0700 (PDT)
MIME-Version: 1.0
From: Neal Caidin <ncaidin@linuxfoundation.org>
Date: Tue, 26 Jul 2022 09:17:21 -0400
Message-ID: 
 <CAODMxsLe2atbETFV_kZAtON5JAcaPgCS-jRrgb_gg0sF-pZtGQ@mail.gmail.com>
Subject: Yocto Project Status 26 July 2022 (WW30)
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f1bd9e05e4b51f12"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 13:17:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168504

--000000000000f1bd9e05e4b51f12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 4.1 M3

Next Deadline: 22nd August 2022 YP 4.1 M3 Build

Next Team Meetings:

   -

   Bug Triage meeting Thursday July 28th 7:30 am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync Tuesday July 26th  at 8 am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Twitch -  See https://www.twitch.tv/theyoctojester


Key Status/Updates:

   -

   YP 4.1 M2 is due to be released with one known issue
   -

   YP 3.1.18 is entering QA
   -

   There were further issues with debug file mapping discovered in master.
   Unfortunately to fix this we=E2=80=99d need to move away from the relati=
ve path
   calls to configure in autotools and this causes a ton of new buildpath
   warnings. There doesn=E2=80=99t seem much interest in fixing these kinds=
 of issues
   and to move things forward help would be needed here.
   -

   There is a patch to rework the rust toolchain support into something
   which has tests and working cross build support. Whilst this actually
   builds and tests on the autobuilder properly (an improvement on the
   existing code), help would be needed in chasing down the remaining
   failures/warnings and any regressions from the patch.
   -

   We are managing to stay roughly on track with upstream updates and CVE
   fixing.
   -

   Help is very much welcome in trying to resolve our autobuilder
   intermittent issues. You can see the list of failures we=E2=80=99re cont=
inuing to
   see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT


Ways to contribute:

   -

   There are bugs identified as possible for newcomers to the project:
   https://wiki.yoctoproject.org/wiki/Newcomers
   -

   There are bugs that are currently unassigned for YP 4.1. See:
   https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.1_Unassigned_E=
nhancements.2FBugs
   -

   We=E2=80=99d welcome new maintainers for recipes in OE-Core. Please see =
the list
   at:
   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/=
maintainers.inc
   and discuss with the existing maintainer, or ask on the OE-Core mailing
   list. We will likely move a chunk of these to =E2=80=9CUnassigned=E2=80=
=9D soon to help
   facilitate this.
   -

   Help us resolve CVE issues: CVE metrics
   <https://docs.google.com/spreadsheets/d/e/2PACX-1vRgNISmH0Ditf0bRtSezeR2=
XsgKIiSFJKF6KJUHpnzocNGzvKZbuSDKfmV3n64BFXDRqElBSJnhHtG4/pubchart?oid=3D199=
3375488&format=3Dinteractive>



YP 4.1 Milestone Dates:

   -

   YP 4.1 M3 build date 2022/08/22
   -

   YP 4.1 M3 Release date 2022/09/02
   -

   YP 4.1 M4 build date 2022/10/03
   -

   YP 4.1 M4 Release date 2022/10/28


Upcoming dot releases:

   -

   YP 3.1.18 build date 2022/07/27
   -

   YP 3.1.18 Release date 2022/08/05
   -

   YP 4.0.3 build date 2022/08/08
   -

   YP 4.0.3 Release date 2022/08/19
   -

   YP 3.1.19 build date 2022/08/29
   -

   YP 3.1.19 Release date 2022/09/09
   -

   YP 4.0.4 build date 2022/09/19
   -

   YP 4.0.4 Release date 2022/09/30
   -

   YP 3.1.20 build date 2022/10/10
   -

   YP 3.1.20 Release date 2022/10/21
   -

   YP 4.0.5 build date 2022/10/31
   -

   YP 4.0.5 Release date 2022/11/11


Tracking Metrics:

   -

   WDD 2399 (last week 2414) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1155 (last week 1155)
      -

      Patches in the Pending State: 326 (28%) [last week 327 (28%)]
      -

   https://autobuilder.yocto.io/pub/non-release/patchmetrics/


The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]


*Neal Caidin*
Program Manager, Program Management & Operations
The Linux Foundation
+1 (919) 238-9104 (w/h)
+1 (919) 949-1861 (m)
ncaidin@linuxfoundation.org

--000000000000f1bd9e05e4b51f12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-7f1bfbcd-7fff-f9d0-df=
60-7be6fa88d90c"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Current D=
ev Position: YP 4.1 M3</span></p><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
-wrap">Next Deadline: 22nd August 2022 YP 4.1 M3 Build</span></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Next Team Meetings:</span></p><u=
l style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-=
wrap">Bug Triage meeting Thursday July 28th 7:30 am PDT (</span><a href=3D"=
https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;t=
ext-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap"=
>https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span><=
/a><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Weekl=
y Project Engineering Sync Tuesday July 26th=C2=A0 at 8 am PDT (</span><a h=
ref=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" =
style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;text-decoration-line:underline;vertical-align:baseline;white-space:pre-=
wrap">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</s=
pan></a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decoration-li=
ne:none"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:un=
derline;vertical-align:baseline;white-space:pre-wrap">)</span></a></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">Twitch -=C2=A0 See </span><a href=3D"ht=
tps://www.twitch.tv/theyoctojester" style=3D"text-decoration-line:none"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;text-decoration-line:underline;vert=
ical-align:baseline;white-space:pre-wrap">https://www.twitch.tv/theyoctojes=
ter</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-=
wrap">Key Status/Updates:</span></p><ul style=3D"margin-top:0px;margin-bott=
om:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre-wrap">YP 4.1 M2 is due to be released=
 with one known issue</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP=
 3.1.18 is entering QA</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">T=
here were further issues with debug file mapping discovered in master. Unfo=
rtunately to fix this we=E2=80=99d need to move away from the relative path=
 calls to configure in autotools and this causes a ton of new buildpath war=
nings. There doesn=E2=80=99t seem much interest in fixing these kinds of is=
sues and to move things forward help would be needed here.</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">There is a patch to rework the rust tool=
chain support into something which has tests and working cross build suppor=
t. Whilst this actually builds and tests on the autobuilder properly (an im=
provement on the existing code), help would be needed in chasing down the r=
emaining failures/warnings and any regressions from the patch.</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">We are managing to stay roughly on t=
rack with upstream updates and CVE fixing.</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">Help is very much welcome in trying to resolve our autob=
uilder intermittent issues. You can see the list of failures we=E2=80=99re =
continuing to see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in bugz=
illa: </span><a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quick=
search=3DAB-INT" style=3D"text-decoration-line:none"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-decoration-line:underline;vertical-align:baseline=
;white-space:pre-wrap">https://bugzilla.yoctoproject.org/buglist.cgi?quicks=
earch=3DAB-INT</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">Ways to contribute:</span></p><ul style=3D"margin-top:0px;=
margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">There are bugs ident=
ified as possible for newcomers to the project: </span><a href=3D"https://w=
iki.yoctoproject.org/wiki/Newcomers" style=3D"text-decoration-line:none"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;text-decoration-line:underline;ver=
tical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wi=
ki/Newcomers</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">There a=
re bugs that are currently unassigned for YP 4.1. See: </span><a href=3D"ht=
tps://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.1_Unassigned_Enhanc=
ements.2FBugs" style=3D"text-decoration-line:none"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;text-decoration-line:underline;vertical-align:baseline;w=
hite-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2=
B_4.1_Unassigned_Enhancements.2FBugs</span></a></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">We=E2=80=99d welcome new maintainers for recipes in OE-Cor=
e. Please see the list at: </span><a href=3D"http://git.yoctoproject.org/cg=
it.cgi/poky/tree/meta/conf/distro/include/maintainers.inc" style=3D"text-de=
coration-line:none"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;text-decorat=
ion-line:underline;vertical-align:baseline;white-space:pre-wrap">http://git=
.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.i=
nc</span></a><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap"> and discuss with the existing maintainer, or as=
k on the OE-Core mailing list. We will likely move a chunk of these to =E2=
=80=9CUnassigned=E2=80=9D soon to help facilitate this.</span></p></li><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">Help us resolve CVE issues: </span><a href=
=3D"https://docs.google.com/spreadsheets/d/e/2PACX-1vRgNISmH0Ditf0bRtSezeR2=
XsgKIiSFJKF6KJUHpnzocNGzvKZbuSDKfmV3n64BFXDRqElBSJnhHtG4/pubchart?oid=3D199=
3375488&amp;format=3Dinteractive" style=3D"text-decoration-line:none"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-decoration-line:underline;vertic=
al-align:baseline;white-space:pre-wrap">CVE metrics</span></a><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">=C2=A0</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">YP 4.1 Milestone Dates:</span></p><ul style=3D"margin-top:0px;margi=
n-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">YP 4.1 M3 build date 2022=
/08/22</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4.1 M3 Release=
 date 2022/09/02</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4.1 =
M4 build date 2022/10/03</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">YP 4.1 M4 Release date 2022/10/28</span></p></li></ul><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">Upcoming dot releases:</span></p><ul sty=
le=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">YP 3.1.18 build date 2022/07/27</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">YP 3.1.18 Release date 2022/08/05</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;w=
hite-space:pre-wrap">YP 4.0.3 build date 2022/08/08</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">YP 4.0.3 Release date 2022/08/19</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">YP 3.1.19 build date 2022/08/29</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre-wrap">YP 3.1.19 Release date 202=
2/09/09</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4.0.4 build d=
ate 2022/09/19</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4.0.4 =
Release date 2022/09/30</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
YP 3.1.20 build date 2022/10/10</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">YP 3.1.20 Release date 2022/10/21</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">YP 4.0.5 build date 2022/10/31</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">YP 4.0.5 Release date 2022/11/11</span></p></li></=
ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">Tracking Metrics:</=
span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">WDD 2399 (last week 2414)</span><span style=3D"font-size:1=
1pt;font-family:Consolas,sans-serif;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap"> (</span><a href=3D"https://wiki.yoctoproject.org/chart=
s/combo.html" style=3D"text-decoration-line:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-decoration-line:underline;vertical-align:baseline;wh=
ite-space:pre-wrap">https://wiki.yoctoproject.org/charts/combo.html</span><=
/a><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre-wrap">)</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,=
sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-family:Aria=
l;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">OE-Core/Poky P=
atch Metrics</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px">=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">Total patches found: 1155 (last week =
1155)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;font-family:Arial;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Patches in the Pending State: 326 (28%) [last week 327 (28%=
)]</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><a href=3D"https=
://autobuilder.yocto.io/pub/non-release/patchmetrics/" style=3D"text-decora=
tion-line:none"><span style=3D"font-size:11pt;font-family:Arial;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;text-decoration-line:underline;vertical-align:baseline;white-space:pre-wr=
ap">https://autobuilder.yocto.io/pub/non-release/patchmetrics/</span></a></=
p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">The Yocto =
Project=E2=80=99s technical governance is through its Technical Steering Co=
mmittee, more information is available at:</span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://w=
iki.yoctoproject.org/wiki/TSC" style=3D"text-decoration-line:none"><span st=
yle=3D"font-size:11pt;font-family:Arial;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:u=
nderline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctopr=
oject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">The Status reports are now stored on the wiki at: </span><a href=
=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-decorat=
ion-line:none"><span style=3D"font-size:11pt;font-family:Arial;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;text-decoration-line:underline;vertical-align:baseline;white-space:pre-wra=
p">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre-wrap">[If anyone has suggestions for =
other information you=E2=80=99d like to see on this weekly status update, l=
et us know!]</span></p></span><br class=3D"gmail-Apple-interchange-newline"=
><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_si=
gnature"><div dir=3D"ltr"><div><div dir=3D"ltr"><span><font color=3D"#88888=
8"><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><b style=3D"color:=
rgb(136,136,136)"><font color=3D"#666666"><font color=3D"#888888"><br></fon=
t></font></b></div><div dir=3D"ltr"><b style=3D"color:rgb(136,136,136)"><fo=
nt color=3D"#666666"><font color=3D"#888888">Neal Caidin</font></font></b><=
br><div style=3D"color:rgb(136,136,136)"><span style=3D"border-collapse:col=
lapse"><div><font color=3D"#666666"><font>Program Manager, Program Manageme=
nt &amp; Operations</font></font></div><div><font color=3D"#666666"><font>T=
he Linux Foundation</font></font></div><div><font color=3D"#666666">+1 (919=
) 238-9104 (w/h)<br>+1 (919) 949-1861 (m)</font></div><div><font color=3D"#=
666666"><a href=3D"mailto:ncaidin@linuxfoundation.org" target=3D"_blank">nc=
aidin@linuxfoundation.org</a></font></div><div><br></div><div><br></div></s=
pan></div></div></div></div></div></div></div></div></div></div></font></sp=
an></div></div></div></div></div></div>

--000000000000f1bd9e05e4b51f12--

