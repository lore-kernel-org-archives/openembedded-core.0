Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EF2C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 13:18:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9644.1652188713217993480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 06:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RLNTcNkk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id d5so23792097wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:user-agent:mime-version;
        bh=QWPvRvf662lgsGo1THGif2GPpSoxBPkuo73kzMRTnis=;
        b=RLNTcNkkehctDxIih5l6+dYLNgqh7tDBrZofgzlvBrZgVhrYhMqJdVdv+xt8sSmDNV
         OCE/r7+y9dvxD2xcAZjJARMzZSrdCwYpnSRUGlw/PoKx1Hjr2nLAtJpsln7gd+2bOYIT
         a/YY9mV6Q9h5Xd3M9cRsGUvx3bU0jjg41NcLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version;
        bh=QWPvRvf662lgsGo1THGif2GPpSoxBPkuo73kzMRTnis=;
        b=wwUt10hZ5C/rz3DuLlci+w1wEK7O5TGkfDiJtka3+du2eRIJOVK306TmleH68ie3ys
         xP8VHcPX5xslLLSaYhs2dJJXi1EsbhSpkE5pU10PB1lGqSAZiRKworesxjjxBrFUDr9t
         ySREj5UDxYvCpzSAZkSFKWBwsWE3dB98ydtfUXvzx3TW8wgRyJPWFYcU/XP05rMMX4UV
         psfRmbKH5oAoCrBQCVjApdgSdAzS94HasFOLNQyOP4dXUR1VZBaMyfOxTKq98ELDlb6E
         8sDWLbNZSYtbJ4pwrX2ODk7BzO0dfLF74JqDoJNhQHWleiPzNj/xdyPiRK/7Z2PGtBAJ
         hHmg==
X-Gm-Message-State: AOAM530vHs5lkGCRUnu08ebQZkFTKudsF8Fn2Tr/ElX3NQkJPXay0uMS
	OgjGZZLL0LdhN7XcsDhB4NwDhA==
X-Google-Smtp-Source: 
 ABdhPJziFRm9nMwdzhFFjfSazhTpB07bY+a2L8y9rBN26VTanUyz5ZSvFS4p5bF2Y/HFYIzB1umPzg==
X-Received: by 2002:a5d:6c65:0:b0:20c:5230:f145 with SMTP id
 r5-20020a5d6c65000000b0020c5230f145mr18075287wrz.337.1652188711497;
        Tue, 10 May 2022 06:18:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f0f9:d8b3:e8bc:d2f3?
 ([2001:8b0:aba:5f3c:f0f9:d8b3:e8bc:d2f3])
        by smtp.gmail.com with ESMTPSA id
 s1-20020adfecc1000000b0020c5253d8e6sm13838111wro.50.2022.05.10.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 06:18:31 -0700 (PDT)
Message-ID: 
 <6a8a34938facca53cb783e2950e83d959cdd9392.camel@linuxfoundation.org>
Subject: Yocto Project Status WW19`22
From: richard.purdie@linuxfoundation.org
To: "<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2022 14:18:29 +0100
Content-Type: multipart/alternative; boundary="=-NiUW0dmBqV3mvR5C1iQv"
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 13:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165415

--=-NiUW0dmBqV3mvR5C1iQv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 4.1 M1
Next Deadline: 30th May 2022 YP 4.1 M1 Build

Next Team Meetings:
 * Yocto Project Summit - 17th-19th May
   (https://www.yoctoproject.org/yocto-project-summit-2022-05/)
 * Bug Triage meeting Thursday May 12th 7:30 am PDT
   (https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
 * Monthly Project Meeting Tuesday June 7th at 8 am PDT
   (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
 * Weekly Engineering Sync Tuesday May 10th=C2=A0 at 8 am PDT
   (https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
 * Twitch -=C2=A0 See https://www.twitch.tv/theyoctojester

Key Status/Updates:
 * YP 3.1.16 was released
 * YP 3.4.4 passed QA and has approval for release
 * We=E2=80=99ve continued to struggle with the git CVE fix issues and ende=
d up
   changing the approach taken resolve it.
 * Whilst the git issue was breaking reproducible builds on the
   autobuilder, two other issues started occurring in reproducible
   builds, making clean builds hard to regain for master.
 * The update to gcc 12 has merged after clean test runs on the
   autobuilder. Thanks to Khem and Bruce for working though various
   issues in particular.
 * A lot of general version upgrades were merged bringing us more into
   sync with various upstreams, thanks Alex.
 * Help is very much welcome in trying to resolve our autobuilder
   intermittent issues. You can see the list of failures we=E2=80=99re
   continuing to see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in b=
ugzilla:
   https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT

Ways to contribute:
 * There are bugs identified as possible for newcomers to the project:
   https://wiki.yoctoproject.org/wiki/Newcomers
 * There are bugs that are currently unassigned for YP 3.5. See:
   https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.5_Unassign
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
 * YP 4.1 M1 build date 2022/05/30
 * YP 4.1 M1 Release date 2022/06/10
 * YP 4.1 M2 build date 2022/07/11
 * YP 4.1 M2 Release date 2022/07/22
 * YP 4.1 M3 build date 2022/08/22
 * YP 4.1 M3 Release date 2022/09/02
 * YP 4.1 M4 build date 2022/10/03
 * YP 4.1 M4 Release date 2022/10/28

Upcoming dot releases:
 * YP 3.1.16 is released.
 * YP 3.4.4 is out of QA
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
 * WDD 2450 (last week 2450)
   (https://wiki.yoctoproject.org/charts/combo.html)
 * OE-Core/Poky Patch Metrics
    - Total patches found: 1181 (last week 1205)
    - Patches in the Pending State: 339 (29%) [last week 341 (28%)]

The Yocto Project=E2=80=99s technical governance is through its Technical
Steering Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on
this weekly status update, let us know!]



Archived content:

Tip of the Week:
 * The scripts in ${WORKDIR}/temp/run.XXX for shell tasks can be
   quickly hacked and used for standalone debugging by replacing the
   function call at the end with =E2=80=9Cbash -i=E2=80=9D which will then =
drop you
   into a shell environment matching the task being debugged (minus the
   fakeroot context).=C2=A0
 * Bonus marks for anyone sending a patch to add the fakeroot context
   as comments at the start of the scripts.
 * (send any tips you=E2=80=99d like to see here to Stephen or Richard)
 *=20

--=-NiUW0dmBqV3mvR5C1iQv
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div><span style=3D"font-family: Arial; font-size:=
 11pt; white-space: pre-wrap;">Current Dev Position: YP 4.1 M1</span></div>=
<div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgrou=
nd-color:transparent;font-weight:400;font-style:normal;font-variant:normal;=
text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pr=
e-wrap;">Next Deadline: 30th May 2022 YP 4.1 M1 Build</span></div><br><div>=
<span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wra=
p;">Next Team Meetings:</span></div><ul style=3D"margin-top:0;margin-bottom=
:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:#000000;background-color:transpare=
nt;font-weight:400;font-style:normal;font-variant:normal;text-decoration:no=
ne;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span st=
yle=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Yoct=
o Project Summit - 17th-19th May (</span><a href=3D"https://www.yoctoprojec=
t.org/yocto-project-summit-2022-05/" style=3D"text-decoration:none;"><span =
style=3D"font-size:11pt;font-family:Arial;color:#1155cc;background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:n=
one;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">https://=
www.yoctoproject.org/yocto-project-summit-2022-05/</span></a><span style=3D=
"font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">)</span></=
div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial;color:#000000;background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;=
font-family:Arial;color:#000000;background-color:transparent;font-weight:40=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre;white-space:pre-wrap;">Bug Triage meeting Thursda=
y May 12th 7:30 am PDT (</span><a href=3D"https://zoom.us/j/454367603?pwd=
=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" style=3D"text-decoration:none;"><span =
style=3D"font-size:11pt;font-family:Arial;color:#1155cc;background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:underline;-webkit-text-decoration-skip:none;text-decoration-skip-ink:n=
one;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">https://=
zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09</span></a><span =
style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">)<=
/span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11=
pt;font-family:Arial;color:#000000;background-color:transparent;font-weight=
:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-al=
ign:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;white-space:pre-wrap;">Monthly Project Me=
eting Tuesday June 7th at 8 am PDT (</span><a href=3D"https://zoom.us/j/990=
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
ertical-align:baseline;white-space:pre;white-space:pre-wrap;">Weekly Engine=
ering Sync Tuesday May 10th&nbsp; at 8 am PDT (</span><a href=3D"https://zo=
om.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09" style=3D"text-dec=
oration:none;"><span style=3D"font-size:11pt;font-family:Arial;color:#1155c=
c;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-=
decoration-skip-ink:none;vertical-align:baseline;white-space:pre;white-spac=
e:pre-wrap;">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJs=
UT09</span></a><a href=3D"https://zoom.us/j/990892712" style=3D"text-decora=
tion:none;"><span style=3D"font-size:11pt;font-family:Arial;color:#1155cc;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:underline;-webkit-text-decoration-skip:none;text-dec=
oration-skip-ink:none;vertical-align:baseline;white-space:pre;white-space:p=
re-wrap;">)</span></a></div></li><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial;color:#000000;background-color:transpa=
rent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:=
none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span =
style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Tw=
itch -&nbsp; See </span><a href=3D"https://www.twitch.tv/theyoctojester" st=
yle=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:Ari=
al;color:#1155cc;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-=
skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space=
:pre;white-space:pre-wrap;">https://www.twitch.tv/theyoctojester</span></a>=
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
ite-space:pre-wrap;">YP 3.1.16 was released</span></div></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000=
000;background-color:transparent;font-weight:400;font-style:normal;font-var=
iant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" =
aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color=
:#000000;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re;white-space:pre-wrap;">YP 3.4.4 passed QA and has approval for release</=
span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11p=
t;font-family:Arial;color:#000000;background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-siz=
e:11pt;font-family:Arial;color:#000000;background-color:transparent;font-we=
ight:400;font-style:normal;font-variant:normal;text-decoration:none;vertica=
l-align:baseline;white-space:pre;white-space:pre-wrap;">We=E2=80=99ve conti=
nued to struggle with the git CVE fix issues and ended up changing the appr=
oach taken resolve it.</span></div></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div=
><span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wr=
ap;">Whilst the git issue was breaking reproducible builds on the autobuild=
er, two other issues started occurring in reproducible builds, making clean=
 builds hard to regain for master.</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">The update to gcc 12 has merged after clean test runs on=
 the autobuilder. Thanks to Khem and Bruce for working though various issue=
s in particular.</span></div></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial;color:#000000;background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span=
 style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">A=
 lot of general version upgrades were merged bringing us more into sync wit=
h various upstreams, thanks Alex.</span></div></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">Help is very much welcome in trying to resolve our autobuil=
der intermittent issues. You can see the list of failures we=E2=80=99re con=
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
P 4.1 Milestone Dates:</span></div><ul style=3D"margin-top:0;margin-bottom:=
0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-type:disc=
;font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span sty=
le=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.=
1 M1 build date 2022/05/30</span></div></li><li dir=3D"ltr" style=3D"list-s=
tyle-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1">=
<div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgrou=
nd-color:transparent;font-weight:400;font-style:normal;font-variant:normal;=
text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pr=
e-wrap;">YP 4.1 M1 Release date 2022/06/10</span></div></li><li dir=3D"ltr"=
 style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#0000=
00;background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" a=
ria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:=
#000000;background-color:transparent;font-weight:400;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e;white-space:pre-wrap;">YP 4.1 M2 build date 2022/07/11</span></div></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al;color:#000000;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-famil=
y:Arial;color:#000000;background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre;white-space:pre-wrap;">YP 4.1 M2 Release date 2022/07/22</s=
pan></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial;color:#000000;background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:none;vertical-alig=
n:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size=
:11pt;font-family:Arial;color:#000000;background-color:transparent;font-wei=
ght:400;font-style:normal;font-variant:normal;text-decoration:none;vertical=
-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.1 M3 build date=
 2022/08/22</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial;color:#000000;background-color:transparent=
;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none=
;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span styl=
e=3D"font-size:11pt;font-family:Arial;color:#000000;background-color:transp=
arent;font-weight:400;font-style:normal;font-variant:normal;text-decoration=
:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.1=
 M3 Release date 2022/09/02</span></div></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-c=
olor:transparent;font-weight:400;font-style:normal;font-variant:normal;text=
-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"=
><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;backgro=
und-color:transparent;font-weight:400;font-style:normal;font-variant:normal=
;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:p=
re-wrap;">YP 4.1 M4 build date 2022/10/03</span></div></li><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ar=
ia-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;white-space:pre-wrap;">YP 4.1 M4 Release date 2022/10/28</span></div></li>=
</ul><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white=
-space:pre-wrap;">Upcoming dot releases:</span></div><ul style=3D"margin-to=
p:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgroun=
d-color:transparent;font-weight:400;font-style:normal;font-variant:normal;t=
ext-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=3D=
"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre;white-spac=
e:pre-wrap;">YP 3.1.16 is released.</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">YP 3.4.4 is out of QA</span></div></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000=
;background-color:transparent;font-weight:400;font-style:normal;font-varian=
t:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" ari=
a-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#0=
00000;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;=
white-space:pre-wrap;">YP 4.0.1 build date 2022/05/16</span></div></li><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;=
color:#000000;background-color:transparent;font-weight:400;font-style:norma=
l;font-variant:normal;text-decoration:none;vertical-align:baseline;white-sp=
ace:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:A=
rial;color:#000000;background-color:transparent;font-weight:400;font-style:=
normal;font-variant:normal;text-decoration:none;vertical-align:baseline;whi=
te-space:pre;white-space:pre-wrap;">YP 4.0.1 Release date 2022/05/27</span>=
</div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Arial;color:#000000;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11p=
t;font-family:Arial;color:#000000;background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.17 build date 202=
2/06/06</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial;color:#000000;background-color:transparent;fon=
t-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ver=
tical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D=
"font-size:11pt;font-family:Arial;color:#000000;background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.17 =
Release date 2022/06/17</span></div></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><di=
v><span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-=
color:transparent;font-weight:400;font-style:normal;font-variant:normal;tex=
t-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-w=
rap;">YP 4.0.2 build date 2022/06/27</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">YP 4.0.2 Release date 2022/07/08</span></div></li><li di=
r=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Ari=
al;color:#000000;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:none;vertical-align:baseline;white=
-space:pre;white-space:pre-wrap;">YP 3.1.18 build date 2022/07/18</span></d=
iv></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial;color:#000000;background-color:transparent;font-weight:400;font=
-style:normal;font-variant:normal;text-decoration:none;vertical-align:basel=
ine;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;f=
ont-family:Arial;color:#000000;background-color:transparent;font-weight:400=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre;white-space:pre-wrap;">YP 3.1.18 Release date 2022=
/07/29</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial;color:#000000;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"=
font-size:11pt;font-family:Arial;color:#000000;background-color:transparent=
;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none=
;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.3 bu=
ild date 2022/08/08</span></div></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><s=
pan style=3D"font-size:11pt;font-family:Arial;color:#000000;background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;=
">YP 4.0.3 Release date 2022/08/19</span></div></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-le=
vel=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#00000=
0;background-color:transparent;font-weight:400;font-style:normal;font-varia=
nt:normal;text-decoration:none;vertical-align:baseline;white-space:pre;whit=
e-space:pre-wrap;">YP 3.1.19 build date 2022/08/29</span></div></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">YP 3.1.19 Release date 2022/09/09</span></=
div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-=
family:Arial;color:#000000;background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;=
font-family:Arial;color:#000000;background-color:transparent;font-weight:40=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.4 build date 2022/0=
9/19</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;color:#000000;background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:#000000;background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre;white-space:pre-wrap;">YP 4.0.4 Rele=
ase date 2022/09/30</span></div></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:tra=
nsparent;font-weight:400;font-style:normal;font-variant:normal;text-decorat=
ion:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div><s=
pan style=3D"font-size:11pt;font-family:Arial;color:#000000;background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;=
">YP 3.1.20 build date 2022/10/10</span></div></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:#000000;backgr=
ound-color:transparent;font-weight:400;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level=
=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-s=
pace:pre-wrap;">YP 3.1.20 Release date 2022/10/21</span></div></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Aria=
l;color:#000000;background-color:transparent;font-weight:400;font-style:nor=
mal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-=
space:pre;white-space:pre-wrap;">YP 4.0.5 build date 2022/10/31</span></div=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:#000000;background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre;" aria-level=3D"1"><div><span style=3D"font-size:11pt;fon=
t-family:Arial;color:#000000;background-color:transparent;font-weight:400;f=
ont-style:normal;font-variant:normal;text-decoration:none;vertical-align:ba=
seline;white-space:pre;white-space:pre-wrap;">YP 4.0.5 Release date 2022/11=
/11</span></div></li></ul><br><div><span style=3D"font-size:11pt;font-famil=
y:Arial;color:#000000;background-color:transparent;font-weight:400;font-sty=
le:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;=
white-space:pre;white-space:pre-wrap;">Tracking Metrics:</span></div><ul st=
yle=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=3D"=
ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:#=
000000;background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
;" aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">WDD 2450 (last week 2450)</span><span style=3D=
"font-size:11pt;font-family:Consolas,sans-serif;color:#000000;background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wra=
p;"> (</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" st=
yle=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:Ari=
al;color:#1155cc;background-color:transparent;font-weight:400;font-style:no=
rmal;font-variant:normal;text-decoration:underline;-webkit-text-decoration-=
skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-space=
:pre;white-space:pre-wrap;">https://wiki.yoctoproject.org/charts/combo.html=
</span></a><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;co=
lor:#000000;background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">)</span></div></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;color:#00=
0000;background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;"=
 aria-level=3D"1"><div><span style=3D"font-size:11pt;font-family:Arial;colo=
r:#000000;background-color:transparent;font-weight:400;font-style:normal;fo=
nt-variant:normal;text-decoration:none;vertical-align:baseline;white-space:=
pre;white-space:pre-wrap;">OE-Core/Poky Patch Metrics</span></div></li><ul =
style=3D"margin-top:0;margin-bottom:0;padding-inline-start:48px;"><li dir=
=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:Arial;c=
olor:#000000;background-color:transparent;font-weight:400;font-style:normal=
;font-variant:normal;text-decoration:none;vertical-align:baseline;white-spa=
ce:pre;" aria-level=3D"2"><div><span style=3D"font-size:11pt;font-family:Ar=
ial;color:#000000;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre;white-space:pre-wrap;">Total patches found: 1181 (last week 120=
5)</span></div></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Consolas,sans-serif;color:#000000;background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre;" aria-level=3D"2"><div><sp=
an style=3D"font-size:11pt;font-family:Arial;color:#000000;background-color=
:transparent;font-weight:400;font-style:normal;font-variant:normal;text-dec=
oration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;"=
>Patches in the Pending State: 339 (29%) [last week 341 (28%)]</span></div>=
</li></ul></ul><br><div><span style=3D"font-size:11pt;font-family:Arial;col=
or:#000000;background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre;white-space:pre-wrap;">The Yocto Project=E2=80=99s technical governanc=
e is through its Technical Steering Committee, more information is availabl=
e at:</span></div><div><a href=3D"https://wiki.yoctoproject.org/wiki/TSC" s=
tyle=3D"text-decoration:none;"><span style=3D"font-size:11pt;font-family:Ar=
ial;color:#1155cc;background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:underline;-webkit-text-decoration=
-skip:none;text-decoration-skip-ink:none;vertical-align:baseline;white-spac=
e:pre;white-space:pre-wrap;">https://wiki.yoctoproject.org/wiki/TSC</span><=
/a></div><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#00=
0000;background-color:transparent;font-weight:400;font-style:normal;font-va=
riant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;w=
hite-space:pre-wrap;">The Status reports are now stored on the wiki at: </s=
pan><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"t=
ext-decoration:none;"><span style=3D"font-size:11pt;font-family:Arial;color=
:#1155cc;background-color:transparent;font-weight:400;font-style:normal;fon=
t-variant:normal;text-decoration:underline;-webkit-text-decoration-skip:non=
e;text-decoration-skip-ink:none;vertical-align:baseline;white-space:pre;whi=
te-space:pre-wrap;">https://wiki.yoctoproject.org/wiki/Weekly_Status</span>=
</a></div><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#0=
00000;background-color:transparent;font-weight:400;font-style:normal;font-v=
ariant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;=
white-space:pre-wrap;">[If anyone has suggestions for other information you=
=E2=80=99d like to see on this weekly status update, let us know!]</span></=
div><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;=
background-color:transparent;font-weight:400;font-style:normal;font-variant=
:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-=
space:pre-wrap;"><span style=3D"width:100px;display:inline-block;position:r=
elative;"></span></span></div><br><br><div><span style=3D"font-size:11pt;fo=
nt-family:Arial;color:#000000;background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre;white-space:pre-wrap;">Archived content:</span></di=
v><br><div><span style=3D"font-size:11pt;font-family:Arial;color:#000000;ba=
ckground-color:transparent;font-weight:400;font-style:normal;font-variant:n=
ormal;text-decoration:none;vertical-align:baseline;white-space:pre;white-sp=
ace:pre-wrap;">Tip of the Week:</span></div><ul style=3D"margin-top:0;margi=
n-bottom:0;padding-inline-start:48px;"><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div>=
<span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wra=
p;">The scripts in ${WORKDIR}/temp/run.XXX for shell tasks can be quickly h=
acked and used for standalone debugging by replacing the function call at t=
he end with =E2=80=9Cbash -i=E2=80=9D which will then drop you into a shell=
 environment matching the task being debugged (minus the fakeroot context).=
&nbsp;</span></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial;color:#000000;background-color:transparent;font=
-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vert=
ical-align:baseline;white-space:pre;" aria-level=3D"1"><div><span style=3D"=
font-size:11pt;font-family:Arial;color:#000000;background-color:transparent=
;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none=
;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Bonus marks=
 for anyone sending a patch to add the fakeroot context as comments at the =
start of the scripts.</span></div></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:#000000;background-color:t=
ransparent;font-weight:400;font-style:normal;font-variant:normal;text-decor=
ation:none;vertical-align:baseline;white-space:pre;" aria-level=3D"1"><div>=
<span style=3D"font-size:11pt;font-family:Arial;color:#000000;background-co=
lor:transparent;font-weight:400;font-style:normal;font-variant:normal;text-=
decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wra=
p;">(send any tips you=E2=80=99d like to see here to Stephen or Richard)</s=
pan></div></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial;color:#000000;background-color:transparent;font-weight:4=
00;font-style:normal;font-variant:normal;text-decoration:none;vertical-alig=
n:baseline;white-space:pre;" aria-level=3D"1"><br></li></ul><div><span></sp=
an></div></body></html>

--=-NiUW0dmBqV3mvR5C1iQv--

