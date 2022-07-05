Return-Path: <ncaidin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951C5C433EF
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 15:00:39 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web12.85183.1657033235888030272
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 08:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IAY29Htv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.219.180,
 mailfrom: ncaidin@linuxfoundation.org)
Received: by mail-yb1-f180.google.com with SMTP id r3so22294926ybr.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=SW5SOCV8JWA+J+SL3xKf+mYMmjeDXjmY9Wsm0VpAwEI=;
        b=IAY29HtvItmVU2mjl8U2dM5jjfbA32ha4FpSyASMlR8XawUDUuUAxl49bXmi/3caAg
         ik0rtO2Ah2F/4AgxldpLZKbBDyNcldr1ujc38PBM4NfXTT21ajHF0q5+9XDdYyexpDKO
         9x72rwG/qNgbH1NSVN5+Xzod2pPMnVgRZcDHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=SW5SOCV8JWA+J+SL3xKf+mYMmjeDXjmY9Wsm0VpAwEI=;
        b=Hj3mqzkAKMRyzxwMD74djQupZ55IyZWFBgKMS+RIL1DjOeuygYcAVDfzOCjNEknwMw
         o2XLNuTH2ru50/6+L+Jx40qcIMi+mKVT2DVZYh+n2iV1PA9zOr+QqgnWmzgLF9ZZ45Aa
         cbXLQxCcwNM9rA1UtzlzWMrz7m9/pqS6z02SbHOyqfymMKYmCQTNyjqCsgM2Bll/iyl4
         VznwTmUc/k9AbM+vNpNVw+wgy1Ecvk6ysQey+LYshXN3ktMyQTYMSyHjL83kJnnSdxBg
         BFyolev6B2zSvqQGcRPKX6e8gb/BFRL5ziFQGG2silTU7qYxFLAG4Fb1D5+VL1bJUskw
         22uw==
X-Gm-Message-State: AJIora9vIgKqT6DQwqAW/5ufBqJoP+148xDRzF74TXx4r4P+DWgMjbpo
	IEkevFZI+j5Z88LJOsaFkUuWKF1qAS37R502Jm3jvw==
X-Google-Smtp-Source: 
 AGRyM1v2W/iEKXW8rxHQxiUt8/DKWhbtWOD9ql6gPAOLj0vTp75RyTZpvpm9FQCYoi8FDg9GGL0+rwXr0JAnjf6ZLuI=
X-Received: by 2002:a25:34d0:0:b0:66e:255a:c195 with SMTP id
 b199-20020a2534d0000000b0066e255ac195mr20138740yba.151.1657033234657; Tue, 05
 Jul 2022 08:00:34 -0700 (PDT)
MIME-Version: 1.0
From: Neal Caidin <ncaidin@linuxfoundation.org>
Date: Tue, 5 Jul 2022 11:00:16 -0400
Message-ID: 
 <CAODMxsJVfnhGysMB1fjR-FGZpN74JB-G=M9dTxL0_9DXTk3Zcw@mail.gmail.com>
Subject: Yocto Project Status 05 July 2022 (WW27)
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: Stephen Jolley <sjolley.yp.pm@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000055559805e3101df5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 15:00:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167662

--00000000000055559805e3101df5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 4.1 M2

Next Deadline: 11th July 2022 YP 4.1 M2 Build

Next Team Meetings:

   -

   Bug Triage meeting Thursday July 7th 7:30 am PDT (
   https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
   -

   Weekly Project Engineering Sync Tuesday July 5th  at 8 am PDT (
   https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
   <https://zoom.us/j/990892712>
   -

   Twitch -  See https://www.twitch.tv/theyoctojester


Key Status/Updates:

   -

   Next week M2 is due to build so if anyone has changes for that
   milestone, please send ASAP.
   -

   YP 4.0.2 has been through QA and is likely to be released in the next
   few days.
   -

   A reproducibility issue was identified and raised a question on whether
   we could enable               an old QA check for these kinds of issues
   (=E2=80=98buildpaths=E2=80=99 in insane.bbclass). Some bugs were fixed i=
n the test but is
   has highlighted several reproducibility issues. Some have been fixed but
   others remain:
   -

      docs issues in lib32-vala, rpm, lib32-gtk-doc, vala, gtk-doc
      -

      musl issue in ltp
      -

      multilib issues in lib32-vala, vala, rpm (may overlap docs)
      -

      qemuarm64 kernel-devsrc issue (Bruce looking into)
      -

      meta-virt issues in xen-tools (Christopher looking into)
      -

      meta-gplv2 issues in mc, tar
      -

      lttng-modules .debug issue on beaglebone, edgerouter, and qemumips
      -

   Fixing these will allow us to enable buildpaths by default which should
   allow more people to spot reproducibility issues.
   -

   There is a discussion about layer setup tooling in the bitbake-layers
   discussion on the OE-Core list, input is welcome from those with an
   interest in this.
   -

   There is also a RFC series about improving the eSDK tooling workflows
   from Alex Kanavin which may be of interest.
   -

   Code to monitor the /proc/pressure interface has been added and there is
   a patch to optionally allow bitbake to reduce the number of processes
   running depending on system load, which it is hoped may help some of our
   autobuilder intermittent issues (thanks Aryaman and Randy).
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

   YP 4.0.2 build date 2022/06/27 - pending TSC approval
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

   WDD 2387 (last week 2400) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   OE-Core/Poky Patch Metrics
   -

      Total patches found: 1158 (last week 1151)
      -

      Patches in the Pending State: 328 (28%) [last week 326 (28%)]
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

--00000000000055559805e3101df5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-a35f8711-7fff-82ac-e0=
81-191ff16567b9"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Current D=
ev Position: YP 4.1 M2</span></p><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
-wrap">Next Deadline: 11th July 2022 YP 4.1 M2 Build</span></p><br><p dir=
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
wrap">Bug Triage meeting Thursday July 7th 7:30 am PDT (</span><a href=3D"h=
ttps://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D=
"text-decoration-line:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;text=
-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">ht=
tps://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a>=
<span style=3D"font-size:11pt;background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Weekly P=
roject Engineering Sync Tuesday July 5th=C2=A0 at 8 am PDT (</span><a href=
=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" sty=
le=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;text-decoration-line:underline;vertical-align:baseline;white-space:pre-wra=
p">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span=
></a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decoration-line:=
none"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;text-decoration-line:under=
line;vertical-align:baseline;white-space:pre-wrap">)</span></a></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre-wrap">Twitch -=C2=A0 See </span><a href=3D"https=
://www.twitch.tv/theyoctojester" style=3D"text-decoration-line:none"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;text-decoration-line:underline;vertica=
l-align:baseline;white-space:pre-wrap">https://www.twitch.tv/theyoctojester=
</span></a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">Key Status/Updates:</span></p><ul style=3D"margin-top:0px;margin-bottom:=
0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">Next week M2 is due to build so if=
 anyone has changes for that milestone, please send ASAP.</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" ro=
le=3D"presentation"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">YP 4.0.2 has been through QA and is likel=
y to be released in the next few days.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">A reproducibility issue was identified and raised a questio=
n on whether we could enable =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 an old QA check for these kinds of issues (=E2=80=98buildpaths=E2=80=99=
 in insane.bbclass). Some bugs were fixed in the test but is has highlighte=
d several reproducibility issues. Some have been fixed but others remain:</=
span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr=
" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">docs issues in lib32-vala, rpm, lib32-gtk-doc, vala=
, gtk-doc</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">musl issue i=
n ltp</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-s=
ize:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">multilib issues =
in lib32-vala, vala, rpm (may overlap docs)</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presen=
tation"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">qemuarm64 kernel-devsrc issue (Bruce looking into)</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">meta-virt issues in xen-=
tools (Christopher looking into)</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">meta-gplv2 issues in mc, tar</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentati=
on"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">lttng-modules .debug issue on beaglebone, edgerouter, and=
 qemumips</span></p></li></ul><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;marg=
in-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Fixing th=
ese will allow us to enable buildpaths by default which should allow more p=
eople to spot reproducibility issues.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">There is a discussion about layer setup tooling in the bitb=
ake-layers discussion on the OE-Core list, input is welcome from those with=
 an interest in this.</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Th=
ere is also a RFC series about improving the eSDK tooling workflows from Al=
ex Kanavin which may be of interest.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Code to monitor the /proc/pressure interface has been added=
 and there is a patch to optionally allow bitbake to reduce the number of p=
rocesses running depending on system load, which it is hoped may help some =
of our autobuilder intermittent issues (thanks Aryaman and Randy).</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Help is very much welcome in try=
ing to resolve our autobuilder intermittent issues. You can see the list of=
 failures we=E2=80=99re continuing to see by searching for the =E2=80=9CAB-=
INT=E2=80=9D tag in bugzilla: </span><a href=3D"https://bugzilla.yoctoproje=
ct.org/buglist.cgi?quicksearch=3DAB-INT" style=3D"text-decoration-line:none=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;text-decoration-line:underline=
;vertical-align:baseline;white-space:pre-wrap">https://bugzilla.yoctoprojec=
t.org/buglist.cgi?quicksearch=3DAB-INT</span></a></p></li></ul><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Ways to contribute:</span></p><u=
l style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span st=
yle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-=
wrap">There are bugs identified as possible for newcomers to the project: <=
/span><a href=3D"https://wiki.yoctoproject.org/wiki/Newcomers" style=3D"tex=
t-decoration-line:none"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;text-dec=
oration-line:underline;vertical-align:baseline;white-space:pre-wrap">https:=
//wiki.yoctoproject.org/wiki/Newcomers</span></a></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentat=
ion"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">There are bugs that are currently unassigned for YP 4.1.=
 See: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Mediu=
m.2B_4.1_Unassigned_Enhancements.2FBugs" style=3D"text-decoration-line:none=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;text-decoration-line:underline=
;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.or=
g/wiki/Bug_Triage#Medium.2B_4.1_Unassigned_Enhancements.2FBugs</span></a></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">We=E2=80=99d welcome new maintai=
ners for recipes in OE-Core. Please see the list at: </span><a href=3D"http=
://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintai=
ners.inc" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;text-decoration-line:underline;vertical-align:baseline;white-=
space:pre-wrap">http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/di=
stro/include/maintainers.inc</span></a><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap"> and discuss with the =
existing maintainer, or ask on the OE-Core mailing list. We will likely mov=
e a chunk of these to =E2=80=9CUnassigned=E2=80=9D soon to help facilitate =
this.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">Help us resolve CV=
E issues: </span><a href=3D"https://docs.google.com/spreadsheets/d/e/2PACX-=
1vRgNISmH0Ditf0bRtSezeR2XsgKIiSFJKF6KJUHpnzocNGzvKZbuSDKfmV3n64BFXDRqElBSJn=
hHtG4/pubchart?oid=3D1993375488&amp;format=3Dinteractive" style=3D"text-dec=
oration-line:none"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;text-decorati=
on-line:underline;vertical-align:baseline;white-space:pre-wrap">CVE metrics=
</span></a><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">=C2=A0</span></p></li></ul><br><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">YP 4.1 Milestone Dates:</span></p><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"=
font-size:11pt;background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Y=
P 4.1 M2 build date 2022/07/11</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span s=
tyle=3D"font-size:11pt;background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
-wrap">YP 4.1 M2 Release date 2022/07/22</span></p></li><li dir=3D"ltr" sty=
le=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentatio=
n"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">YP 4.1 M3 build date 2022/08/22</span></p></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pre=
sentation"><span style=3D"font-size:11pt;background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre-wrap">YP 4.1 M3 Release date 2022/09/02</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" r=
ole=3D"presentation"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">YP 4.1 M4 build date 2022/10/03</span></=
p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">YP 4.1 M4 Release date 2022/10/2=
8</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
Upcoming dot releases:</span></p><ul style=3D"margin-top:0px;margin-bottom:=
0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">YP 4.0.2 build date 2022/06/27 - p=
ending TSC approval</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4=
.0.2 Release date 2022/07/08</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-he=
ight:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span sty=
le=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-w=
rap">YP 3.1.18 build date 2022/07/18</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">YP 3.1.18 Release date 2022/07/29</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pr=
esentation"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap">YP 4.0.3 build date 2022/08/08</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" rol=
e=3D"presentation"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre-wrap">YP 4.0.3 Release date 2022/08/19</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre-wrap">YP 3.1.19 build date 2022/08/29</=
span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">YP 3.1.19 Release date 20=
22/09/09</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4.0.4 build =
date 2022/09/19</span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=3D"font-si=
ze:11pt;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 4.0.4=
 Release date 2022/09/30</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">YP 3.1.20 build date 2022/10/10</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"presentation"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">YP 3.1.20 Release date 2022/10/21</span></p></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0=
,0,0);background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"present=
ation"><span style=3D"font-size:11pt;background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;w=
hite-space:pre-wrap">YP 4.0.5 build date 2022/10/31</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=
=3D"presentation"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">YP 4.0.5 Release date 2022/11/11</span></p>=
</li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">Tracking Met=
rics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" role=3D"pres=
entation"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">WDD 2387 (last week 2400)</span><span style=3D"font=
-size:11pt;font-family:Consolas,sans-serif;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap"> (</span><a href=3D"https://wiki.yoctoproject.or=
g/charts/combo.html" style=3D"text-decoration-line:none"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;text-decoration-line:underline;vertical-align:base=
line;white-space:pre-wrap">https://wiki.yoctoproject.org/charts/combo.html<=
/span></a><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">)</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Cons=
olas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt" role=3D"presentation"><span style=3D"font-size:11pt;font-family=
:Arial;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">OE-Core/P=
oky Patch Metrics</span></p></li><ul style=3D"margin-top:0px;margin-bottom:=
0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt" role=3D"presentation"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Total patches found: </span><spa=
n style=3D"font-size:11pt;color:rgb(34,34,34);font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"=
>1158</span><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap"> (last week 1151)</span></p></li><li dir=3D"ltr" =
style=3D"list-style-type:circle;font-size:11pt;font-family:Consolas,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><span style=3D"font-size:11pt;font-family:Arial;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">Patches in the Pendin=
g State: 328 (28%) [last week 326 (28%)]</span></p></li></ul><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt" =
role=3D"presentation"><a href=3D"https://autobuilder.yocto.io/pub/non-relea=
se/patchmetrics/" style=3D"text-decoration-line:none"><span style=3D"font-s=
ize:11pt;font-family:Arial;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;text-decoration-line:underline;vert=
ical-align:baseline;white-space:pre-wrap">https://autobuilder.yocto.io/pub/=
non-release/patchmetrics/</span></a></p></li></ul><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">The Yocto Project=E2=80=99s technical governan=
ce is through its Technical Steering Committee, more information is availab=
le at:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/TSC" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:Ar=
ial;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;text-decoration-line:underline;vertical-align:baseline;whi=
te-space:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre-wrap">The Status reports are no=
w stored on the wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wi=
ki/Weekly_Status" style=3D"text-decoration-line:none"><span style=3D"font-s=
ize:11pt;font-family:Arial;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;text-decoration-line:underline;vert=
ical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wik=
i/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">[If anyone has suggestions for other information you=E2=80=99d like=
 to see on this weekly status update, let us know!]</span></p></span><br cl=
ass=3D"gmail-Apple-interchange-newline"><div><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div =
dir=3D"ltr"><span><font color=3D"#888888"><div dir=3D"ltr"><div dir=3D"ltr"=
><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"l=
tr"><div dir=3D"ltr"><b style=3D"color:rgb(136,136,136)"><font color=3D"#66=
6666"><font color=3D"#888888"><br></font></font></b></div><div dir=3D"ltr">=
<b style=3D"color:rgb(136,136,136)"><font color=3D"#666666"><font color=3D"=
#888888">Neal Caidin</font></font></b><br><div style=3D"color:rgb(136,136,1=
36)"><span style=3D"border-collapse:collapse"><div><font color=3D"#666666">=
<font>Program Manager, Program Management &amp; Operations</font></font></d=
iv><div><font color=3D"#666666"><font>The Linux Foundation</font></font></d=
iv><div><font color=3D"#666666">+1 (919) 238-9104 (w/h)<br>+1 (919) 949-186=
1 (m)</font></div><div><font color=3D"#666666"><a href=3D"mailto:ncaidin@li=
nuxfoundation.org" target=3D"_blank">ncaidin@linuxfoundation.org</a></font>=
</div><div><br></div><div><br></div></span></div></div></div></div></div></=
div></div></div></div></div></font></span></div></div></div></div></div></d=
iv>

--00000000000055559805e3101df5--

