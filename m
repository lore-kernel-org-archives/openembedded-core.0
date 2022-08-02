Return-Path: <ncaidin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A1CC19F28
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 14:49:12 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.7187.1659451751682718203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QEVh2NZG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.174,
 mailfrom: ncaidin@linuxfoundation.org)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-31f41584236so143064447b3.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=l1FARSjQLfhYgQymXrU3itcDC0sEhfPGI9QiDc8EK2g=;
        b=QEVh2NZGZGnKtfjpuHq6HAEFwJra5TKIWSl62EiB1GmPLIJxcDWa9FLItGwEmgyAEe
         T0UcRQPA1Eqh967eQ0WZJdtiV7h0dPPHlSJKZBLn+iYQDTg+qs/lw8JiPG0OcDxAGYJD
         qmmLhf/H6sxI7QRLdN/wL/NzS2k5QmMHy8PKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=l1FARSjQLfhYgQymXrU3itcDC0sEhfPGI9QiDc8EK2g=;
        b=HGVXCGT/SfVyMcM+KhZh/FNNuz3MvWhsC6NWN/pTnhmDY6x6WgC9HkzM9lPI8NnbnZ
         mgWHlOOhquqtqSuuTety23GpnA/UCKSoVnohz+UjbpWw/qq5YfSDxpi0qOQWowICa9Zw
         oba6cxwDa+6Akrn5Jpvutf+QqaQJT9dMQKU54KX/3vCtVr9v+Y//wlizZlnub8iPt5nB
         sCtadjow7i5l1KYCI9iWRtww63V40VlPQLgyvHGdSiaMXlfZKUJrMUajlfOfo03zVrSY
         E0b2kkyAQGojv/EJnN9hEtYuDkSKu2dAgqmjG/7wJH8ksVi4+uOJaSSm0MEXNzsylObX
         J98Q==
X-Gm-Message-State: ACgBeo0remfQh5iTxweRaLDJZK5qoHTJMUlEvgVW7zLfTLBgryjLdIiC
	/oAmGZfUq4nbCLm0/cwk4XFl6yfhRrek4P3sGQyZNw==
X-Google-Smtp-Source: 
 AA6agR7q2UhMwiJtag9BAYQK8F10G9PJOuL++bGOdEOw/koaKTnIzLxcSlfYWPBuXnzLJp0DgsLMXOVT1+iUPvwkd70=
X-Received: by 2002:a0d:c184:0:b0:324:d917:78ac with SMTP id
 c126-20020a0dc184000000b00324d91778acmr10127995ywd.468.1659451750736; Tue, 02
 Aug 2022 07:49:10 -0700 (PDT)
MIME-Version: 1.0
From: Neal Caidin <ncaidin@linuxfoundation.org>
Date: Tue, 2 Aug 2022 10:48:52 -0400
Message-ID: 
 <CAODMxsLgFeENYpTGMJO=Y7QQUF_2Vg11STnY+cmeJXvHrdAtzA@mail.gmail.com>
Subject: Yocto Project Status 02 August 2022 (WW31)
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: Stephen Jolley <sjolley.yp.pm@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001ffb7405e54338ad"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 14:49:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168791

--0000000000001ffb7405e54338ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 4.1 M3

Next Deadline: 22nd August 2022 YP 4.1 M3 Build

Next Team Meetings:

   -

   Bug Triage meeting Thursday August 4th 7:30 am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync Tuesday August  2nd  at 8 am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Twitch -  See https://www.twitch.tv/theyoctojester


Key Status/Updates:

   -

   YP 4.1 M2 was released
   -

   YP 3.1.18 passed QA and is due to be released
   -

   The debug file mapping issues have moved slightly further forward thanks
   to some help from Ross but are stalling due to insufficient developer ti=
me
   available to resolve the issues.
   -

   Some rust toolchain improvements did merge, including an automated rust
   toolchain test. The bulk of the rework is stalled on a handful of remain=
ing
   issues, particularly a couple of reproducibility problems but also a mip=
s
   n32 toolchain issue.
   -

   We have one open CVE on master against qemu, help to backport that fix
   would be very welcome to keep the numbers down. CVEs in kirkstone (LTS)
   significantly reduced.
   -

   Some development workflow changes around the eSDK workflow merged. There
   are also some layer workflow patches still pending review.
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

   WDD 2404 (last week 2399) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1163 (last week 1155)
      -

      Patches in the Pending State: 325 (28%) [last week 326 (28%)]
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

Cheers

*Neal Caidin*
Program Manager, Program Management & Operations
The Linux Foundation
+1 (919) 238-9104 (w/h)
+1 (919) 949-1861 (m)
ncaidin@linuxfoundation.org

--0000000000001ffb7405e54338ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-31874f33-7fff-121a-c4=
9c-de530ec2c6b2"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
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
wrap">Bug Triage meeting Thursday August 4th 7:30 am PDT (</span><a href=3D=
"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=
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
y Project Engineering Sync Tuesday August=C2=A0 2nd=C2=A0 at 8 am PDT (</sp=
an><a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJ=
sUT09" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;text-decoration-line:underline;vertical-align:baseline;white-spa=
ce:pre-wrap">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJs=
UT09</span></a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decora=
tion-line:none"><span style=3D"font-size:11pt;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;text-decoration-=
line:underline;vertical-align:baseline;white-space:pre-wrap">)</span></a></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Twitch -=C2=A0 See </span><a hre=
f=3D"https://www.twitch.tv/theyoctojester" style=3D"text-decoration-line:no=
ne"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;text-decoration-line:underli=
ne;vertical-align:baseline;white-space:pre-wrap">https://www.twitch.tv/they=
octojester</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Key Status/Updates:</span></p><ul style=3D"margin-top:0px;marg=
in-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">YP 4.1 M2 was released</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">YP 3.1.18 passed QA and i=
s due to be released</span></p></li><li dir=3D"ltr" style=3D"list-style-typ=
e:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">The=
 debug file mapping issues have moved slightly further forward thanks to so=
me help from Ross but are stalling due to insufficient developer time avail=
able to resolve the issues.</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">Some rust toolchain improvements did merge, including an automated rust=
 toolchain test. The bulk of the rework is stalled on a handful of remainin=
g issues, particularly a couple of reproducibility problems but also a mips=
 n32 toolchain issue.=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">We have one open CVE on master against qemu, help to backport that fix =
would be very welcome to keep the numbers down. CVEs in kirkstone (LTS) sig=
nificantly reduced.</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Some=
 development workflow changes around the eSDK workflow merged. There are al=
so some layer workflow patches still pending review.</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">Help is very much welcome in trying to reso=
lve our autobuilder intermittent issues. You can see the list of failures w=
e=E2=80=99re continuing to see by searching for the =E2=80=9CAB-INT=E2=80=
=9D tag in bugzilla: </span><a href=3D"https://bugzilla.yoctoproject.org/bu=
glist.cgi?quicksearch=3DAB-INT" style=3D"text-decoration-line:none"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;text-decoration-line:underline;vertical=
-align:baseline;white-space:pre-wrap">https://bugzilla.yoctoproject.org/bug=
list.cgi?quicksearch=3DAB-INT</span></a></p></li></ul><br><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">Ways to contribute:</span></p><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font=
-size:11pt;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">There=
 are bugs identified as possible for newcomers to the project: </span><a hr=
ef=3D"https://wiki.yoctoproject.org/wiki/Newcomers" style=3D"text-decoratio=
n-line:none"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;text-decoration-lin=
e:underline;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoct=
oproject.org/wiki/Newcomers</span></a></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">There are bugs that are currently unassigned for YP 4.1. See: </spa=
n><a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.1_Un=
assigned_Enhancements.2FBugs" style=3D"text-decoration-line:none"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;text-decoration-line:underline;vertical-a=
lign:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Bug_=
Triage#Medium.2B_4.1_Unassigned_Enhancements.2FBugs</span></a></p></li><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">We=E2=80=99d welcome new maintainers for re=
cipes in OE-Core. Please see the list at: </span><a href=3D"http://git.yoct=
oproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc" s=
tyle=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;text-decoration-line:underline;vertical-align:baseline;white-space:pre-w=
rap">http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/includ=
e/maintainers.inc</span></a><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre-wrap"> and discuss with the existing ma=
intainer, or ask on the OE-Core mailing list. We will likely move a chunk o=
f these to =E2=80=9CUnassigned=E2=80=9D soon to help facilitate this.</span=
></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">Help us resolve CVE issues: <=
/span><a href=3D"https://docs.google.com/spreadsheets/d/e/2PACX-1vRgNISmH0D=
itf0bRtSezeR2XsgKIiSFJKF6KJUHpnzocNGzvKZbuSDKfmV3n64BFXDRqElBSJnhHtG4/pubch=
art?oid=3D1993375488&amp;format=3Dinteractive" style=3D"text-decoration-lin=
e:none"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;text-decoration-line:und=
erline;vertical-align:baseline;white-space:pre-wrap">CVE metrics</span></a>=
<span style=3D"font-size:11pt;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">=C2=A0</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">YP 4.1 Milestone Dates:</span></p><ul style=3D"margin-to=
p:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4.1 M3 buil=
d date 2022/08/22</span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4.1=
 M3 Release date 2022/09/02</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">YP 4.1 M4 build date 2022/10/03</span></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">YP 4.1 M4 Release date 2022/10/28</span></p></li></ul><br><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre-wrap">Upcoming dot releases:</span></=
p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">YP 3.1.18 Release date 2022/08/05</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presenta=
tion"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">YP 4.0.3 build date 2022/08/08</span></p></li><li dir=
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
-space:pre-wrap">WDD 2404 (last week 2399)</span><span style=3D"font-size:1=
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
-align:baseline;white-space:pre-wrap">Total patches found: 1163 (last week =
1155)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;font-family:Arial;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Patches in the Pending State: 325 (28%) [last week 326 (28%=
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
et us know!]</span></p></span><div><br></div><div>Cheers</div><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><span><font color=3D"#888888"><div dir=3D=
"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><b style=3D"color:rgb(136,136,13=
6)"><font color=3D"#666666"><font color=3D"#888888"><br></font></font></b><=
/div><div dir=3D"ltr"><b style=3D"color:rgb(136,136,136)"><font color=3D"#6=
66666"><font color=3D"#888888">Neal Caidin</font></font></b><br><div style=
=3D"color:rgb(136,136,136)"><span style=3D"border-collapse:collapse"><div><=
font color=3D"#666666"><font>Program Manager, Program Management &amp; Oper=
ations</font></font></div><div><font color=3D"#666666"><font>The Linux Foun=
dation</font></font></div><div><font color=3D"#666666">+1 (919) 238-9104 (w=
/h)<br>+1 (919) 949-1861 (m)</font></div><div><font color=3D"#666666"><a hr=
ef=3D"mailto:ncaidin@linuxfoundation.org" target=3D"_blank">ncaidin@linuxfo=
undation.org</a></font></div><div><br></div><div><br></div></span></div></d=
iv></div></div></div></div></div></div></div></div></font></span></div></di=
v></div></div></div></div>

--0000000000001ffb7405e54338ad--

