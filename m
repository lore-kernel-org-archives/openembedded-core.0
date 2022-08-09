Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776EAC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:54:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.12892.1660056857500669529
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=La4kC3tt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id j15so14626975wrr.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:date:cc:to:from:subject:message-id:from:to
         :cc;
        bh=h8HD8e2NcBIKgejyxZ/CN8TmWP8KBBqgyJvx4mcgrGU=;
        b=La4kC3ttWat93AEsJDu6uOkiq3YWhska+p/6ee444F3gEbf6qQaFfICL37sstuZFr8
         pyuWyje1iWDhiFnCZUyaaHzWZPbGihukJ0tPWUibzggQolut+MmSVBXwvwLlXqmdPFAm
         T30D9FWYCfoAstX4NE49EcqG0a1ldgjMuLCw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc;
        bh=h8HD8e2NcBIKgejyxZ/CN8TmWP8KBBqgyJvx4mcgrGU=;
        b=1xd1poeh31bqzIUHrMSBCjF78MmMU7V3g2qTVnFi/0kg1DMbWoPUzkNKTlSi9VVYos
         X2k7mS4WJY6SKYqrFoNuRI93/dGUb2dP7uAX93e6G5EP2fb9804QA/pb1Z3ZC3amxTeF
         QDLF9qSGznDzEWvBKo10VM4IEwch7MABhfq584pqR6h2fVsSgHeJ51Ud6xVhPoT1aXeb
         MLiqaSM5yEvpMCHmKPu7aM4QcSqNsaceUeVAu7Ahd6oaoAfN6GtPj3TXPA9Sb5HVQ+SM
         PbHLHWZl7VPo9Iy1eAY7EGDXdXF414GmsKW7IYLgKg175gs64T7tDIPqi1939RpRg5My
         FNKg==
X-Gm-Message-State: ACgBeo0BkLURUzFYZL2TIRPAXMj0VXDBBDYZ8BY/RQBfL0/wRkBSHAFJ
	dbKuR7+KOEqyD+zxBUs7WMGrmw==
X-Google-Smtp-Source: 
 AA6agR6IAXWiO9F8OdePnFXXEBvCdlbaLOsIXy1smHjNSK7cUnqr1rY9heQeBlKHwwJYzmpLmBlKmg==
X-Received: by 2002:a5d:6a01:0:b0:21a:338c:4862 with SMTP id
 m1-20020a5d6a01000000b0021a338c4862mr14139237wru.631.1660056855754;
        Tue, 09 Aug 2022 07:54:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222?
 ([2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003a02cbf862esm16737184wmi.13.2022.08.09.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 07:54:15 -0700 (PDT)
Message-ID: 
 <0ec05a61f1dc11f59d17b03a0733c9afaa989e66.camel@linuxfoundation.org>
Subject: Yocto Project Status 9 August 2022 (WW32)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: sjolley.yp.pm@gmail.com
Date: Tue, 09 Aug 2022 15:54:14 +0100
Content-Type: multipart/alternative; boundary="=-z0FosTjuLzycnQOSLN9e"
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 14:54:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169156

--=-z0FosTjuLzycnQOSLN9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 4.1 M3
Next Deadline: 22nd August 2022 YP 4.1 M3 Build

Next Team Meetings:
 * Bug Triage meeting Thursday August 11th 7:30 am PDT
   (https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
 * Weekly Project Engineering Sync Tuesday August=C2=A0 9th=C2=A0 at 8 am P=
DT
   (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
 * Twitch -=C2=A0 See https://www.twitch.tv/theyoctojester

Key Status/Updates:
 * YP 3.1.18 was released
 * YP 4.0.3 is due to build this week but we need the glibc and kernel
   reproducibility fixes first
 * Major changes to the rust toolchain build process were merged and
   this enables target rust, cross SDK and automated SDK testing. Sadly
   some issues remain and are stopping enabling the tests by default.
 * We have finally tracked down and worked out a fix for the kernel
   reproducibility issue which appeared in recent 5.15 stable updates.
   It was a config option which changed depending on whether /bin/sh
   was dash or bash.
 * The 5.19 kernel uprev is nearly ready to merge as the final build
   issues look to have been addressed.
 * The base glibc 2.36 patches have merged but not the actual upgrade
   yet.
 * We had some infrastructure issues over the weekend which impacted
   the autobuilder. Combined with a number of complex patch
   submissions, this has meant there are patches backlogged.
 * A number of new CVEs appeared in master this week so help would be
   much appreciated in addressing those.
 * The debug file mapping issues are stalled due to developer bandwidth
   limitations.
 * Help is very much welcome in trying to resolve our autobuilder
   intermittent issues. You can see the list of failures we=E2=80=99re
   continuing to see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in b=
ugzilla:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT

Ways to contribute:
 * There are bugs identified as possible for newcomers to the project:
   https://wiki.yoctoproject.org/wiki/Newcomers
 * There are bugs that are currently unassigned for YP 4.1. See:
   https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.1_Unassign
   ed_Enhancements.2FBugs
 * We=E2=80=99d welcome new maintainers for recipes in OE-Core. Please see =
the
   list at:
   http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/incl
   ude/maintainers.inc and discuss with the existing maintainer, or ask
   on the OE-Core mailing list. We will likely move a chunk of these to
   =E2=80=9CUnassigned=E2=80=9D soon to help facilitate this.
 * Help us resolve CVE issues: CVE metrics=C2=A0

YP 4.1 Milestone Dates:
 * YP 4.1 M3 build date 2022/08/22
 * YP 4.1 M3 Release date 2022/09/02
 * YP 4.1 M4 build date 2022/10/03
 * YP 4.1 M4 Release date 2022/10/28

Upcoming dot releases:
 * YP 3.1.18 Release date 2022/08/05
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
 * WDD 2419 (last week 2404)
   (https://wiki.yoctoproject.org/charts/combo.html)
 * OE-Core/Poky Patch Metrics
    - Total patches found: 1178 (last week 1163)
    - Patches in the Pending State: 326 (28%) [last week 325 (28%)]
 * https://autobuilder.yocto.io/pub/non-release/patchmetrics/

The Yocto Project=E2=80=99s technical governance is through its Technical
Steering Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on
this weekly status update, let us know!]


--=-z0FosTjuLzycnQOSLN9e
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode:=
 space; line-break: after-white-space;"><pre></pre><div><span style=3D"font=
-family: Arial; font-size: 11pt; white-space: pre-wrap;">Current Dev Positi=
on: YP 4.1 M3</span></div><div><span style=3D"font-size:11pt;font-family:Ar=
ial;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;white-space:pre-wrap;">Next Deadline: 22nd August 2022 YP 4.1 M=
3 Build</span></div><br><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">Next Team Meetings:</span></div><ul style=
=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" =
aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">Bug Triage meeting Thursday August 11th 7:30 am P=
DT (</span><a href=3D"https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd=
5aVpHVVZ6dz09" style=3D"text-decoration:none;"><span style=3D"font-size:11p=
t;font-family:Arial;color:#1155cc;background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:underline;-webkit=
-text-decoration-skip:none;text-decoration-skip-ink:none;vertical-align:bas=
eline;white-space:pre;white-space:pre-wrap;">https://zoom.us/j/454367603?pw=
d=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span style=3D"font-size:11p=
t;font-family:Arial;color:#000000;background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre;white-space:pre-wrap;">)</span></div></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;c=
olor:#000000;background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Ar=
ial;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;white-space:pre-wrap;">Weekly Project Engineering Sync Tuesday =
August&nbsp; 9th&nbsp; at 8 am PDT (</span><a href=3D"https://zoom.us/j/990=
892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-decoration:non=
e;"><span style=3D"font-size:11pt;font-family:Arial;color:#1155cc;backgroun=
d-color:transparent;font-weight:400;font-style:normal;font-variant:normal;t=
ext-decoration:underline;-webkit-text-decoration-skip:none;text-decoration-=
skip-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;=
">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span>=
</a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decoration:none;"=
><span style=3D"font-size:11pt;font-family:Arial;color:#1155cc;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:underline;-webkit-text-decoration-skip:none;text-decoration-ski=
p-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">)=
</span></a></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:#000000;background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre;white-space:pre-wrap;">Twitch -&nbsp=
; See </span><a href=3D"https://www.twitch.tv/theyoctojester" style=3D"text=
-decoration:none;"><span style=3D"font-size:11pt;font-family:Arial;color:#1=
155cc;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:underline;-webkit-text-decoration-skip:none;t=
ext-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-=
space:pre-wrap;">https://www.twitch.tv/theyoctojester</span></a></div></li>=
</ul><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white=
-space:pre-wrap;">Key Status/Updates:</span></div><ul style=3D"margin-top:0=
;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"=
><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:p=
re-wrap;">YP 3.1.18 was released</span></div></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">YP 4.0.3 is due to build this week but we need the glibc an=
d kernel reproducibility fixes first</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">Major changes to the rust toolchain build process were m=
erged and this enables target rust, cross SDK and automated SDK testing. Sa=
dly some issues remain and are stopping enabling the tests by default.</spa=
n></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial;color:#000000;background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:1=
1pt;font-family:Arial;color:#000000;background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre;white-space:pre-wrap;">We have finally tracke=
d down and worked out a fix for the kernel reproducibility issue which appe=
ared in recent 5.15 stable updates. It was a config option which changed de=
pending on whether /bin/sh was dash or bash.</span></div></li><li dir=3D"lt=
r" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#00=
0000;background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"=
 aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;colo=
r:#000000;background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:none;vertical-align:baseline;white-space:=
pre;white-space:pre-wrap;">The 5.19 kernel uprev is nearly ready to merge a=
s the final build issues look to have been addressed.</span></div></li><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;=
color:#000000;background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:A=
rial;color:#000000;background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre;white-space:pre-wrap;">The base glibc 2.36 patches have merged=
 but not the actual upgrade yet.</span></div></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">We had some infrastructure issues over the weekend which im=
pacted the autobuilder. Combined with a number of complex patch submissions=
, this has meant there are patches backlogged.</span></div></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">A number of new CVEs appeared in master this w=
eek so help would be much appreciated in addressing those.</span></div></li=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial;color:#000000;background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;white-space:pre-wrap;">The debug file mapping issues are =
stalled due to developer bandwidth limitations.</span></div></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
#000000;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;c=
olor:#000000;background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre;white-space:pre-wrap;">Help is very much welcome in trying to resolv=
e our autobuilder intermittent issues. You can see the list of failures we=
=E2=80=99re continuing to see by searching for the =E2=80=9CAB-INT=E2=80=9D=
 tag in bugzilla: </span><a href=3D"https://bugzilla.yoctoproject.org/bugli=
st.cgi?quicksearch=3DAB-INT" style=3D"text-decoration:none;"><span style=3D=
"font-size:11pt;font-family:Arial;color:#1155cc;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:und=
erline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:none;vert=
ical-align:baseline;white-space:pre;white-space:pre-wrap;">https://bugzilla=
.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT</span></a></div></li></u=
l><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;ba=
ckground-color:transparent;font-weight:400;font-style:normal;font-variant:n=
ormal;text-decoration:none;vertical-align:baseline;white-space:pre;white-sp=
ace:pre-wrap;">Ways to contribute:</span></div><ul style=3D"margin-top:0;ma=
rgin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><d=
iv><span style=3D"font-size:11pt;font-family:Arial;color:#000000;background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-=
wrap;">There are bugs identified as possible for newcomers to the project: =
</span><a href=3D"https://wiki.yoctoproject.org/wiki/Newcomers" style=3D"te=
xt-decoration:none;"><span style=3D"font-size:11pt;font-family:Arial;color:=
#1155cc;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:underline;-webkit-text-decoration-skip:none=
;text-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">https://wiki.yoctoproject.org/wiki/Newcomers</span></a><=
/div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font=
-family:Arial;color:#000000;background-color:transparent;font-weight:400;fo=
nt-style:normal;font-variant:normal;text-decoration:none;vertical-align:bas=
eline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt=
;font-family:Arial;color:#000000;background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:none;vertical-alig=
n:baseline;white-space:pre;white-space:pre-wrap;">There are bugs that are c=
urrently unassigned for YP 4.1. See: </span><a href=3D"https://wiki.yoctopr=
oject.org/wiki/Bug_Triage#Medium.2B_4.1_Unassigned_Enhancements.2FBugs" sty=
le=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:Aria=
l;color:#1155cc;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-s=
kip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space:=
pre;white-space:pre-wrap;">https://wiki.yoctoproject.org/wiki/Bug_Triage#Me=
dium.2B_4.1_Unassigned_Enhancements.2FBugs</span></a></div></li><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">We=E2=80=99d welcome new maintainers for recip=
es in OE-Core. Please see the list at: </span><a href=3D"http://git.yoctopr=
oject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc" styl=
e=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:Arial=
;color:#1155cc;background-color:transparent;font-weight:400;font-style:norm=
al;font-variant:normal;text-decoration:underline;-webkit-text-decoration-sk=
ip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">http://git.yoctoproject.org/cgit.cgi/poky/tree/me=
ta/conf/distro/include/maintainers.inc</span></a><span style=3D"font-size:1=
1pt;font-family:Arial;color:#000000;background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre;white-space:pre-wrap;"> and discuss with the =
existing maintainer, or ask on the OE-Core mailing list. We will likely mov=
e a chunk of these to =E2=80=9CUnassigned=E2=80=9D soon to help facilitate =
this.</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial;color:#000000;background-color:transparent;font-=
weight:400;font-style:normal;font-variant:normal;text-decoration:none;verti=
cal-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"f=
ont-size:11pt;font-family:Arial;color:#000000;background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Help us reso=
lve CVE issues: </span><a href=3D"https://docs.google.com/spreadsheets/d/e/=
2PACX-1vRgNISmH0Ditf0bRtSezeR2XsgKIiSFJKF6KJUHpnzocNGzvKZbuSDKfmV3n64BFXDRq=
ElBSJnhHtG4/pubchart?oid=3D1993375488&amp;format=3Dinteractive" style=3D"te=
xt-decoration:none;"><span style=3D"font-size:11pt;font-family:Arial;color:=
#1155cc;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:underline;-webkit-text-decoration-skip:none=
;text-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">CVE metrics</span></a><span style=3D"font-size:11pt;font=
-family:Arial;color:#000000;background-color:transparent;font-weight:400;fo=
nt-style:normal;font-variant:normal;text-decoration:none;vertical-align:bas=
eline;white-space:pre;white-space:pre-wrap;">&nbsp;</span></div></li></ul><=
br><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre;white-space=
:pre-wrap;">YP 4.1 Milestone Dates:</span></div><ul style=3D"margin-top:0;m=
argin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-col=
or:transparent;font-weight:400;font-style:normal;font-variant:normal;text-d=
ecoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><=
div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgroun=
d-color:transparent;font-weight:400;font-style:normal;font-variant:normal;t=
ext-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre=
-wrap;">YP 4.1 M3 build date 2022/08/22</span></div></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;=
background-color:transparent;font-weight:400;font-style:normal;font-variant=
:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria=
-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00=
0000;background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;w=
hite-space:pre-wrap;">YP 4.1 M3 Release date 2022/09/02</span></div></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family=
:Arial;color:#000000;background-color:transparent;font-weight:400;font-styl=
e:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;w=
hite-space:pre;white-space:pre-wrap;">YP 4.1 M4 build date 2022/10/03</span=
></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial;color:#000000;background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11=
pt;font-family:Arial;color:#000000;background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre;white-space:pre-wrap;">YP 4.1 M4 Release date =
2022/10/28</span></div></li></ul><br><div><span style=3D"font-size:11pt;fon=
t-family:Arial;color:#000000;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre;white-space:pre-wrap;">Upcoming dot releases:</span>=
</div><ul style=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"=
><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:A=
rial;color:#000000;background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;white-space:pre-wrap;">YP 3.1.18 Release date 2022/08/05<=
/span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial;color:#000000;background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.3 build dat=
e 2022/08/08</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span sty=
le=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.=
0.3 Release date 2022/08/19</span></div></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"=
><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:p=
re-wrap;">YP 3.1.19 build date 2022/08/29</span></div></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ar=
ia-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;white-space:pre-wrap;">YP 3.1.19 Release date 2022/09/09</span></div></li>=
<li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ar=
ial;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-fami=
ly:Arial;color:#000000;background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre;white-space:pre-wrap;">YP 4.0.4 build date 2022/09/19</spa=
n></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial;color:#000000;background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:1=
1pt;font-family:Arial;color:#000000;background-color:transparent;font-weigh=
t:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-a=
lign:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.4 Release date =
2022/09/30</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial;color:#000000;background-color:transparent;=
font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;=
vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=
=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.=
20 build date 2022/10/10</span></div></li><li dir=3D"ltr" style=3D"list-sty=
le-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><d=
iv><span style=3D"font-size:11pt;font-family:Arial;color:#000000;background=
-color:transparent;font-weight:400;font-style:normal;font-variant:normal;te=
xt-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-=
wrap;">YP 3.1.20 Release date 2022/10/21</span></div></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ari=
a-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0=
00000;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;=
white-space:pre-wrap;">YP 4.0.5 build date 2022/10/31</span></div></li><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;=
color:#000000;background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:A=
rial;color:#000000;background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre;white-space:pre-wrap;">YP 4.0.5 Release date 2022/11/11</span>=
</div></li></ul><br><div><span style=3D"font-size:11pt;font-family:Arial;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">Tracking Metrics:</span></div><ul style=3D"mar=
gin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">WDD 2419 (last week 2404)</span><span style=3D"font-size=
:11pt;font-family:Consolas,sans-serif;color:#000000;background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"> (</sp=
an><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=3D"tex=
t-decoration:none;"><span style=3D"font-size:11pt;font-family:Arial;color:#=
1155cc;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:underline;-webkit-text-decoration-skip:none;=
text-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white=
-space:pre-wrap;">https://wiki.yoctoproject.org/charts/combo.html</span></a=
><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">)</span></div></li><li dir=3D"ltr" style=3D"list-style-t=
ype:disc;font-size:11pt;font-family:Consolas,sans-serif;color:#000000;backg=
round-color:transparent;font-weight:400;font-style:normal;font-variant:norm=
al;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-leve=
l=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;=
background-color:transparent;font-weight:400;font-style:normal;font-variant=
:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-=
space:pre-wrap;">OE-Core/Poky Patch Metrics</span></div></li><ul style=3D"m=
argin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" sty=
le=3D"list-style-type:circle;font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ari=
a-level=3D"2"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0=
00000;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;=
white-space:pre-wrap;">Total patches found: 1178 (last week 1163)</span></d=
iv></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font=
-family:Consolas,sans-serif;color:#000000;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre;" aria-level=3D"2"><div><span style=3D"=
font-size:11pt;font-family:Arial;color:#000000;background-color:transparent=
;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none=
;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Patches in =
the Pending State: 326 (28%) [last week 325 (28%)]</span></div></li></ul><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Cons=
olas,sans-serif;color:#000000;background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre;" aria-level=3D"1"><div><a href=3D"https://autobuil=
der.yocto.io/pub/non-release/patchmetrics/" style=3D"text-decoration:none;"=
><span style=3D"font-size:11pt;font-family:Arial;color:#1155cc;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:underline;-webkit-text-decoration-skip:none;text-decoration-ski=
p-ink:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">h=
ttps://autobuilder.yocto.io/pub/non-release/patchmetrics/</span></a></div><=
/li></ul><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#00=
0000;background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;w=
hite-space:pre-wrap;">The Yocto Project=E2=80=99s technical governance is t=
hrough its Technical Steering Committee, more information is available at:<=
/span></div><div><a href=3D"https://wiki.yoctoproject.org/wiki/TSC" style=
=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:Arial;=
color:#1155cc;background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:underline;-webkit-text-decoration-ski=
p:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space:pr=
e;white-space:pre-wrap;">https://wiki.yoctoproject.org/wiki/TSC</span></a><=
/div><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white=
-space:pre-wrap;">The Status reports are now stored on the wiki at: </span>=
<span style=3D"text-decoration: underline; font-size: 11pt; font-family: Ar=
ial; color: rgb(17, 85, 204); background-color: transparent; font-weight: 4=
00; font-style: normal; font-variant-ligatures: normal; font-variant-caps: =
normal; font-variant-east-asian: normal; font-variant-position: normal; tex=
t-decoration-skip-ink: none; vertical-align: baseline; white-space: pre-wra=
p;"><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"t=
ext-decoration:none;">https://wiki.yoctoproject.org/wiki/Weekly_Status</a><=
/span></div><div><br></div><div><div><span style=3D"font-size: 11pt; font-f=
amily: Arial; font-variant-ligatures: normal; font-variant-east-asian: norm=
al; font-variant-position: normal; vertical-align: baseline; white-space: p=
re-wrap;" id=3D"docs-internal-guid-64c683a6-7fff-dcca-7afe-531f70f696d2">[I=
f anyone has suggestions for other information you=E2=80=99d like to see on=
 this weekly status update, let us know!]</span></div></div><div><br></div>=
<div><span></span></div></body></html>

--=-z0FosTjuLzycnQOSLN9e--

