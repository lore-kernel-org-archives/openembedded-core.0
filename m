Return-Path: <ncaidin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB32C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 15:02:05 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.43975.1655823715777050502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 08:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AIWqjFR+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.182,
 mailfrom: ncaidin@linuxfoundation.org)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-317741c86fdso132053117b3.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 08:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=uOO9hVztZiE+RptZ3Forsp8ngqrc5g0kfDhXMJZWg9A=;
        b=AIWqjFR+wk1+V25FQnTAXX/4I5sm74xw1TAIOx4XLNCaw4927bTtT7qpP4TSaa/uXe
         wKufLxf4UUQ00dII/7ZCfkHLZ48Rsqt3COg1NrQJvhApSiWa551gVn5hWeLIIePaavdK
         8TFLbB9Fcio2sCW7zoNU+MnGLWpcVQvqQ0Xkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=uOO9hVztZiE+RptZ3Forsp8ngqrc5g0kfDhXMJZWg9A=;
        b=c6A8ua2Mh4ga/M7xuZKHT8Sk7YqWwVbe0+8pcjlyFsYcIVfhXCrjSXqZ1XHQpMzs/S
         A+YeYXZ8gn27g2LcyQHmu8rtpsI72J1yqWTHuq7946R3Kh/SOIrFr+9fF2PZ1Xy94aot
         ui3hsv+V3vHL6EW4lAPxm6aQK/QE8ro6TjNV4Yl4Iv7rq0a1TCSXDRXudU9O4YSkPbJk
         EIwI29CZ1pcWFJma5x/KsqAheQ9HT0Cf3y802dBKeSkJEHc2hkivitoM+1Pfdnx3HEz2
         tYLxWaZ+n7ijMa9siVlOhmWKEmkCnbvo5JACFVFr3UUXVc4AzMAHbx9Dg1ag7k+jRqYI
         BO8w==
X-Gm-Message-State: AJIora9c41DF/+KgJPRhbg/a4FqpM+MuiImSFR2w6ubJm1z+13vvaSvK
	u8ud3TaEusvUyfyVoNVbGeXhl75+PD/ne5PZv/LXCQ==
X-Google-Smtp-Source: 
 AGRyM1v72AIZ7h7Vm11YdJxWPZTVn+0ICxNomQgXcpdDe9h1uOZvLYdR3IUCFDjdxpbzRp9Bqvr3RwJ1rf3nz7dFGOc=
X-Received: by 2002:a81:5bc5:0:b0:2d6:5659:73c2 with SMTP id
 p188-20020a815bc5000000b002d6565973c2mr34216567ywb.121.1655823714933; Tue, 21
 Jun 2022 08:01:54 -0700 (PDT)
MIME-Version: 1.0
From: Neal Caidin <ncaidin@linuxfoundation.org>
Date: Tue, 21 Jun 2022 11:01:37 -0400
Message-ID: 
 <CAODMxsL5w=dc3hCRVZ2SdVpYggk-vm=pdu-WwUhJyr98O6t4bw@mail.gmail.com>
Subject: Yocto Project Status 21 June 2022 (WW25)
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000056f90305e1f680bb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 15:02:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167161

--00000000000056f90305e1f680bb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 4.1 M2

Next Deadline: 11th July 2022 YP 4.1 M2 Build

Next Team Meetings:

   -

   Bug Triage meeting Thursday June 23rd 7:30 am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Monthly Project Meeting Tuesday July 5th at 8 am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Weekly Engineering Sync Tuesday June 21st  at 8 am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Twitch -  See https://www.twitch.tv/theyoctojester


Key Status/Updates:

   -

   YP 3.1.17 was released
   -

   We=E2=80=99ve taken a decision to remove the versions from the sstate fe=
eds so
   one sstate url now applies for all project active releases. This simplif=
ies
   the user interface to that data and also makes it easier to mirror too.
   -

   Older data on the sstate mirror will age out over time if that data
   isn=E2=80=99t used on the autobuilder. This should mean the most active/=
useful data
   is shared.
   -

   It was generally a quiet week otherwise with various recipe upgrades.
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

   YP 4.1 M2 build date 2022/07/11
   -

   YP 4.1 M2 Release date 2022/07/22
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

   YP 3.1.17 was released
   -

   YP 4.0.2 build date 2022/06/27
   -

   YP 4.0.2 Release date 2022/07/08
   -

   YP 3.1.18 build date 2022/07/18
   -

   YP 3.1.18 Release date 2022/07/29
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

   WDD 2430 (last week 2428) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1160 (last week 1159)
      -

      Patches in the Pending State: 326 (28%) [last week 326 (28%)]
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

--00000000000056f90305e1f680bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><span><font color=3D=
"#888888"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span id=3D"gmail-doc=
s-internal-guid-7b4e052e-7fff-dfd6-85c3-b501a313384a"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"backg=
round-color:transparent;color:rgb(0,0,0);font-family:Arial;font-size:11pt;w=
hite-space:pre-wrap">Current Dev Position: YP 4.1 M2</span><br></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Next Deadline: 11th July 2022 YP=
 4.1 M2 Build</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap=
">Next Team Meetings:</span></p><ul style=3D"margin-top:0px;margin-bottom:0=
px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap">Bug Triage meeting Thursday June 23=
rd 7:30 am PDT (</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2Z=
XL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration-line:none"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-decoration-line:underline;vertical-ali=
gn:baseline;white-space:pre-wrap">https://zoom.us/j/454367603?pwd=3DZGxoa2Z=
XL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">)</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">Monthly Project Meeting Tuesday July 5th at=
 8 am PDT (</span><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6=
ck81bkcrYjRrcmJsUT09" style=3D"text-decoration-line:none"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;text-decoration-line:underline;vertical-align:bas=
eline;white-space:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6c=
k81bkcrYjRrcmJsUT09</span></a><a href=3D"https://zoom.us/j/990892712" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;t=
ext-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap"=
>)</span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">Weekly Engineerin=
g Sync Tuesday June 21st=C2=A0 at 8 am PDT (</span><a href=3D"https://zoom.=
us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decora=
tion-line:none"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;text-decoration-=
line:underline;vertical-align:baseline;white-space:pre-wrap">https://zoom.u=
s/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"h=
ttps://zoom.us/j/990892712" style=3D"text-decoration-line:none"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-decoration-line:underline;vertical-ali=
gn:baseline;white-space:pre-wrap">)</span></a></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Twitch -=C2=A0 See </span><a href=3D"https://www.twitch.tv/=
theyoctojester" style=3D"text-decoration-line:none"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;text-decoration-line:underline;vertical-align:baseline;=
white-space:pre-wrap">https://www.twitch.tv/theyoctojester</span></a></p></=
li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">Key Status/Upd=
ates:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">YP 3.1.17 was released</span></p></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb=
(0,0,0);background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"prese=
ntation"><span style=3D"font-size:11pt;background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">We=E2=80=99ve taken a decision to remove the version=
s from the sstate feeds so one sstate url now applies for all project activ=
e releases. This simplifies the user interface to that data and also makes =
it easier to mirror too.</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">Older data on the sstate mirror will age out over time if that data isn=
=E2=80=99t used on the autobuilder. This should mean the most active/useful=
 data is shared.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">It was =
generally a quiet week otherwise with various recipe upgrades.</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">Help is very much welcome in trying =
to resolve our autobuilder intermittent issues. You can see the list of fai=
lures we=E2=80=99re continuing to see by searching for the =E2=80=9CAB-INT=
=E2=80=9D tag in bugzilla: </span><a href=3D"https://bugzilla.yoctoproject.=
org/buglist.cgi?quicksearch=3DAB-INT" style=3D"text-decoration-line:none"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;text-decoration-line:underline;ve=
rtical-align:baseline;white-space:pre-wrap">https://bugzilla.yoctoproject.o=
rg/buglist.cgi?quicksearch=3DAB-INT</span></a></p></li></ul><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">Ways to contribute:</span></p><ul sty=
le=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">There are bugs identified as possible for newcomers to the project: </sp=
an><a href=3D"https://wiki.yoctoproject.org/wiki/Newcomers" style=3D"text-d=
ecoration-line:none"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;text-decora=
tion-line:underline;vertical-align:baseline;white-space:pre-wrap">https://w=
iki.yoctoproject.org/wiki/Newcomers</span></a></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">There are bugs that are currently unassigned for YP 4.1. Se=
e: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2=
B_4.1_Unassigned_Enhancements.2FBugs" style=3D"text-decoration-line:none"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;text-decoration-line:underline;ve=
rtical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/w=
iki/Bug_Triage#Medium.2B_4.1_Unassigned_Enhancements.2FBugs</span></a></p><=
/li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap">We=E2=80=99d welcome new maintainer=
s for recipes in OE-Core. Please see the list at: </span><a href=3D"http://=
git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainer=
s.inc" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-decoration-line:underline;vertical-align:baseline;white-spa=
ce:pre-wrap">http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distr=
o/include/maintainers.inc</span></a><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap"> and discuss with the exi=
sting maintainer, or ask on the OE-Core mailing list. We will likely move a=
 chunk of these to =E2=80=9CUnassigned=E2=80=9D soon to help facilitate thi=
s.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">Help us resolve CVE i=
ssues: </span><a href=3D"https://docs.google.com/spreadsheets/d/e/2PACX-1vR=
gNISmH0Ditf0bRtSezeR2XsgKIiSFJKF6KJUHpnzocNGzvKZbuSDKfmV3n64BFXDRqElBSJnhHt=
G4/pubchart?oid=3D1993375488&amp;format=3Dinteractive" style=3D"text-decora=
tion-line:none"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;text-decoration-=
line:underline;vertical-align:baseline;white-space:pre-wrap">CVE metrics</s=
pan></a><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">=C2=A0</span></p></li></ul><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">YP 4.1 Milestone Dates:</span></p><ul style=3D=
"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4=
.1 M2 build date 2022/07/11</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">YP 4.1 M2 Release date 2022/07/22</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">YP 4.1 M3 build date 2022/08/22</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">YP 4.1 M3 Release date 2022/09/02</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">YP 4.1 M4 build date 2022/10/03</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre-wrap">YP 4.1 M4 Release date 2022/10/28=
</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">U=
pcoming dot releases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0=
px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap">YP 3.1.17 was released</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t" role=3D"presentation"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">YP 4.0.2 build date 2022/06/27</span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">YP 4.0.2 Release date 2022/07=
/08</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">YP 3.1.18 build date=
 2022/07/18</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 3.1.18 Re=
lease date 2022/07/29</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP=
 4.0.3 build date 2022/08/08</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-w=
rap">YP 4.0.3 Release date 2022/08/19</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">YP 3.1.19 build date 2022/08/29</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">YP 3.1.19 Release date 2022/09/09</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">YP 4.0.4 build date 2022/09/19</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">YP 4.0.4 Release date 2022/09/30</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">YP 3.1.20 build date 2022=
/10/10</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">YP 3.1.20 Release=
 date 2022/10/21</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-s=
ize:11pt;background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4.0.=
5 build date 2022/10/31</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
YP 4.0.5 Release date 2022/11/11</span></p></li></ul><br><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">Tracking Metrics:</span></p><ul style=3D"mar=
gin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">WDD 2430=
 (last week 2428)</span><span style=3D"font-size:11pt;font-family:Consolas,=
sans-serif;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"> (</s=
pan><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"te=
xt-decoration-line:none"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;text-de=
coration-line:underline;vertical-align:baseline;white-space:pre-wrap">https=
://wiki.yoctoproject.org/charts/combo.html</span></a><span style=3D"font-si=
ze:11pt;font-family:Consolas,sans-serif;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0)=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;font-family:Arial;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">OE-Core/Poky Patch Metrics</span></p></li=
><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">Total patches found: </span><span style=3D"font-size:11pt;color:=
rgb(34,34,34);font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre-wrap">1160</span><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"> (last=
 week 1159)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;=
font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;font-family:Arial;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">Patches in the Pending State: 326 (28%) [last week 32=
6 (28%)]</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><a href=3D=
"https://autobuilder.yocto.io/pub/non-release/patchmetrics/" style=3D"text-=
decoration-line:none"><span style=3D"font-size:11pt;font-family:Arial;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;text-decoration-line:underline;vertical-align:baseline;white-space:=
pre-wrap">https://autobuilder.yocto.io/pub/non-release/patchmetrics/</span>=
</a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
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
e, let us know!]</span></p></span><br class=3D"gmail-Apple-interchange-newl=
ine"><b style=3D"color:rgb(136,136,136)"><font color=3D"#666666"><font colo=
r=3D"#888888"><br></font></font></b></div><div dir=3D"ltr"><b style=3D"colo=
r:rgb(136,136,136)"><font color=3D"#666666"><font color=3D"#888888">Neal Ca=
idin</font></font></b><br><div style=3D"color:rgb(136,136,136)"><span style=
=3D"border-collapse:collapse"><div><font color=3D"#666666"><font>Program Ma=
nager, Program Management &amp; Operations</font></font></div><div><font co=
lor=3D"#666666"><font>The Linux Foundation</font></font></div><div><font co=
lor=3D"#666666">+1 (919) 238-9104 (w/h)<br>+1 (919) 949-1861 (m)</font></di=
v><div><font color=3D"#666666"><a href=3D"mailto:ncaidin@linuxfoundation.or=
g" target=3D"_blank">ncaidin@linuxfoundation.org</a></font></div><div><br><=
/div><div><br><br></div></span></div></div></div></div></div></div></div></=
div></font></span></div></div></div></div>

--00000000000056f90305e1f680bb--

