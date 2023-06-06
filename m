Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB92C7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 14:58:10 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.834.1686063484772843720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 07:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Gz2woS7B;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f4b384c09fso7647331e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 07:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686063483; x=1688655483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LEvZp0BSyyeSw1n6wBflX0VGgMolyNg+TGPpDmEyRco=;
        b=Gz2woS7B9bjm32w6i0KkbuMxVTTRRk8vtWNsRCBDImXv9p3jFoSR0GlZT2ly8s/I/2
         nERRPs5Zevr0sSxIE+0+NXoxxvITgJ4pVXUyeG4rElcv0TjxXYqBcumi35CxU5QeTFmC
         TEGhMuFCCON77hbaMTBlCoyJTDf2CyPgFJrc38mPe2cBzloPOlAWT3BYDIhSOccvipba
         X5rfG+nlMMExmZ5bUprSOoquAxY/JhPXBnyf28IPxpW5LRi/KbG/wX0eL0AQ7j0cFk9P
         A34G4m5wbGPETjPcCyffPgSv+LE3S+VmwGCTKF38o7ZK7bucmFFfLHBKwi1s4NRMQZJW
         AdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686063483; x=1688655483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEvZp0BSyyeSw1n6wBflX0VGgMolyNg+TGPpDmEyRco=;
        b=gIKgpS/XnSvzV29WF0FpBQ8tlum3PSO0SC46QRJ4+EyOCh8aRILBzibPt6SXZOfVjt
         /MvERWN31kB8gz34xn34Skb2K72uhoIX99+s+gb6vzfpSoemP6rzbSwNBQDnJDYoVwRm
         cATDcVFqedZongU25gHLFiqi7dIUletH/z1GYHvbkPC2SBrkgvTLFlt5CkQ9XqssSQoS
         GrtpEEW7TRI8kXWdqRDA+oxUDAObSB5rRutU+lEoBRicVBOMlhURSwNsjl//0Aa9KzJA
         DcQkQG/mXL7l4//dBDC00hUaM2Q3nJH6HW8eCZcxbIVBcG3/L5XIYB2yEepF7GXbSVYg
         5z3Q==
X-Gm-Message-State: AC+VfDxtulk8yJyabTbLnrwM+Jc4pFFQo+GmeroclGb6Ox6fg6TWDbbA
	G5tmNiEREIPYQj/PYX+hNQ5WumWW2pSbH0FhAKU=
X-Google-Smtp-Source: ACHHUZ4J771IxzfHGIwnyx732drjdIBp0bal3BmYmfuJzRJiWsJINx3c2+oof/CnSggk8qx9pAbNl2yywvOObheTGfg=
X-Received: by 2002:ac2:5ec7:0:b0:4f4:c289:596b with SMTP id
 d7-20020ac25ec7000000b004f4c289596bmr924859lfq.67.1686063482265; Tue, 06 Jun
 2023 07:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <080901d99885$496ef0e0$dc4cd2a0$@gmail.com>
In-Reply-To: <080901d99885$496ef0e0$dc4cd2a0$@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Jun 2023 16:57:51 +0200
Message-ID: <CANNYZj9oBA_L2zNjexkmhdaey7NwXgab_CN6YRjexsZtGydY2Q@mail.gmail.com>
Subject: Re: [yocto] Yocto Project Status 6 June 2023 (WW23)
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Stephen Jolley <sjolley.yp.pm@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ede30f05fd773e71"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 14:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182444

--000000000000ede30f05fd773e71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m on holiday this week so my ability to help is limited but pleas=
e drop
the SQLite bump. It=E2=80=99s been problematic in my builds especially arou=
nd dnf
and do_rootfs, and things massively improved then.

Alex

On Tue 6. Jun 2023 at 16.43, Stephen Jolley <sjolley.yp.pm@gmail.com> wrote=
:

> Current Dev Position: YP 4.3 M1
>
> Next Deadline: 5th June 2023 YP 4.3 M1 build date
>
>
>
> Next Team Meetings:
>
>    - Bug Triage meeting Thursday June 8th 7:30 am PDT (
>    https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
>    - Weekly Project Engineering Sync Tuesday June 6th at 8 am PDT (
>    https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
>    <https://zoom.us/j/990892712>
>    - Twitch -  See https://www.twitch.tv/theyoctojester
>
>
>
> Key Status/Updates:
>
>    - YP 4.3 M1 is due to build this week
>    - The remaining issue with SPDX manifest generation on the autobuilder
>    should have been identified and fixed so we plan to enable the create_=
spdx
>    class by default in poky assuming a successful test build.
>    - The recent 6.1 kernel stable updates appear to be causing a couple
>    of different intermittent autobuilder issues. We=E2=80=99re working to=
 try and get
>    to the bottom of that, we=E2=80=99re hoping further updates to the 6.1=
 series may
>    pull in fixes for the regressions.
>    - Patch merging has been slow this week as we struggled to bisect
>    failures down to the problematic commits (potentially the sqlite versi=
on
>    bump).
>    - We continue to see problematic intermittent failures on the
>    autobuilder. We=E2=80=99re struggling to make progress against these a=
nd they are
>    feeling overwhelming. We=E2=80=99re open to ideas on how we might try =
and address
>    them. Experience shows that if left unresolved/ignored, people do end =
up
>    hitting them in real world usage or during testing of their own produc=
ts.
>
>
>    - There are a number of patches still queued in master-next as it is
>    unclear whether they=E2=80=99re ready for various reasons. For bandwid=
th reasons
>    these will likely be deferred to M2, people are just stretched too thi=
nly
>    to do otherwise, frustrating as it is.
>    - Big thanks to Ross for helping look at the high number of CVE issues
>    open against master.
>
>
>
> Ways to contribute:
>
>    - As people are likely aware, the project has a number of components
>    which are either unmaintained, or have people with little to no time t=
rying
>    to keep them alive. These components include: patchtest, layerindex,
>    devtool, toaster, wic, oeqa, autobuilder, CROPs containers, pseudo and
>    more. Many have open bugs. Help is welcome in trying to better look af=
ter
>    these components!
>    - There are bugs identified as possible for newcomers to the project:
>    https://wiki.yoctoproject.org/wiki/Newcomers
>    - There are bugs that are currently unassigned for YP 4.3. See:
>    https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.3_Unassigned=
_Enhancements.2FBugs
>    - We=E2=80=99d welcome new maintainers for recipes in OE-Core. Please =
see the
>    list at:
>    http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/includ=
e/maintainers.inc
>    and discuss with the existing maintainer, or ask on the OE-Core mailin=
g
>    list. We will likely move a chunk of these to =E2=80=9CUnassigned=E2=
=80=9D soon to help
>    facilitate this.
>    - Help is very much welcome in trying to resolve our autobuilder
>    intermittent issues. You can see the list of failures we=E2=80=99re co=
ntinuing to
>    see by searching for the =E2=80=9CAB-INT=E2=80=9D tag in bugzilla:
>    https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT.
>    - Help us resolve CVE issues: CVE metrics
>    <https://autobuilder.yocto.io/pub/non-release/patchmetrics/>
>    - We have a growing number of bugs in bugzilla, any help with them is
>    appreciated.
>
>
>
> YP 4.3 Milestone Dates:
>
>    - YP 4.3 M1 build date  2023/06/05
>    - YP 4.3 M1 Release date 2023/06/16
>    - YP 4.3 M2 build date  2023/07/17
>    - YP 4.3 M2 Release date 2023/07/28
>    - YP 4.3 M3 build date  2023/08/28
>    - YP 4.3 M3 Release date 2023/09/08
>    - YP 4.3 M4 build date  2023/10/02
>    - YP 4.3 M4 Release date 2023/10/27
>
>
>
> Upcoming dot releases:
>
>    - YP 3.1.26 build date 2023/06/19
>    - YP 3.1.26 Release date 2023/06/30
>    - YP 4.0.11 build date 2023/06/26
>    - YP 4.0.11 Release date 2023/07/07
>    - YP 4.2.2 build date 2023/07/10
>    - YP 4.2.2 Release date 2023/07/21
>    - YP 3.1.27 build date 2023/07/31
>    - YP 3.1.27 Release date 2023/08/11
>    - YP 4.0.12 build date 2023/08/07
>    - YP 4.0.12 Release date 2023/08/18
>    - YP 4.2.3 build date 2023/08/28
>    - YP 4.2.3 Release date 2023/09/08
>    - YP 3.1.28 build date 2023/09/18
>    - YP 3.1.28 Release date 2023/09/29
>    - YP 4.0.13 build date 2023/09/25
>    - YP 4.0.13 Release date 2023/10/06
>    - YP 3.1.29 build date 2023/10/30
>    - YP 3.1.29 Release date 2023/11/10
>    - YP 4.0.14 build date 2023/11/06
>    - YP 4.0.14 Release date 2023/11/17
>    - YP 4.2.4 build date 2023/11/13
>    - YP 4.2.4 Release date 2023/11/24
>    - YP 3.1.30 build date 2023/12/11
>    - YP 3.1.30 Release date 2023/12/22
>    - YP 4.0.15 build date 2023/12/18
>    - YP 4.0.15 Release date 2023/12/29
>
>
>
> Tracking Metrics:
>
>    - WDD 2527 (last week 2522) (
>    https://wiki.yoctoproject.org/charts/combo.html)
>    - OE-Core/Poky Patch Metrics
>       - Total patches found: 1162 (last week 1160)
>       - Patches in the Pending State: 271 (23%) [last week 272 (23%)]
>    - https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>
>
>
> The Yocto Project=E2=80=99s technical governance is through its Technical=
 Steering
> Committee, more information is available at:
>
> https://wiki.yoctoproject.org/wiki/TSC
>
>
>
> The Status reports are now stored on the wiki at:
> https://wiki.yoctoproject.org/wiki/Weekly_Status
>
>
>
> [If anyone has suggestions for other information you=E2=80=99d like to se=
e on this
> weekly status update, let us know!]
>
>
>
> Thanks,
>
>
>
> *Stephen K. Jolley*
>
> *Yocto Project Program Manager*
>
> (    *Cell*:                (208) 244-4460
>
> * *Email*:              *sjolley.yp.pm@gmail.com
> <sjolley.yp.pm@gmail.com>*
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#60189):
> https://lists.yoctoproject.org/g/yocto/message/60189
> Mute This Topic: https://lists.yoctoproject.org/mt/99364585/1686489
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ede30f05fd773e71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99m on holiday this week so my ability to help is=
 limited but please drop the SQLite bump. It=E2=80=99s been problematic in =
my builds especially around dnf and do_rootfs, and things massively improve=
d then.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue =
6. Jun 2023 at 16.43, Stephen Jolley &lt;<a href=3D"mailto:sjolley.yp.pm@gm=
ail.com">sjolley.yp.pm@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"overflow-wr=
ap: break-word;"><div><p style=3D"margin:0in"><span style=3D"font-family:Ar=
ial,sans-serif;color:black">Current Dev Position: YP 4.3 M1</span><u></u><u=
></u></p><p style=3D"margin:0in"><span style=3D"font-family:Arial,sans-seri=
f;color:black">Next Deadline: 5th June 2023 YP 4.3 M1 build date</span><u><=
/u><u></u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p style=3D"ma=
rgin:0in"><span style=3D"font-family:Arial,sans-serif;color:black">Next Tea=
m Meetings:</span><u></u><u></u></p><ul style=3D"margin-top:0in" type=3D"di=
sc"><li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;c=
olor:black"><span style=3D"font-family:Arial,sans-serif">Bug Triage meeting=
 Thursday June 8th 7:30 am PDT (<a href=3D"https://zoom.us/j/454367603?pwd=
=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09" target=3D"_blank" style=3D"font-family=
:Arial,sans-serif"><span style=3D"font-family:Arial,sans-serif;color:rgb(17=
,85,204)">https://zoom.us/j/454367603?pwd=3DZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz0=
9</span></a>)<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font=
-family:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;margi=
n-bottom:0in;vertical-align:baseline;color:black"><span style=3D"font-famil=
y:Arial,sans-serif">Weekly Project Engineering Sync Tuesday June 6th at 8 a=
m PDT (<a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjR=
rcmJsUT09" target=3D"_blank" style=3D"font-family:Arial,sans-serif"><span s=
tyle=3D"font-family:Arial,sans-serif;color:rgb(17,85,204)">https://zoom.us/=
j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</span></a><a href=3D"htt=
ps://zoom.us/j/990892712" target=3D"_blank" style=3D"font-family:Arial,sans=
-serif"><span style=3D"font-family:Arial,sans-serif;color:rgb(17,85,204)">)=
</span></a><u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-f=
amily:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;margin-=
bottom:0in;vertical-align:baseline;color:black"><span style=3D"font-family:=
Arial,sans-serif">Twitch -=C2=A0 See <a href=3D"https://www.twitch.tv/theyo=
ctojester" target=3D"_blank" style=3D"font-family:Arial,sans-serif"><span s=
tyle=3D"font-family:Arial,sans-serif;color:rgb(17,85,204)">https://www.twit=
ch.tv/theyoctojester</span></a><u style=3D"font-family:Arial,sans-serif"></=
u><u style=3D"font-family:Arial,sans-serif"></u></span></li></ul><p class=
=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p style=3D"margin:0in"><span style=
=3D"font-family:Arial,sans-serif;color:black">Key Status/Updates:</span><u>=
</u><u></u></p><ul style=3D"margin-top:0in" type=3D"disc"><li style=3D"marg=
in-top:0in;margin-bottom:0in;vertical-align:baseline;color:black"><span sty=
le=3D"font-family:Arial,sans-serif">YP 4.3 M1 is due to build this week<u s=
tyle=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,san=
s-serif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;vert=
ical-align:baseline;color:black"><span style=3D"font-family:Arial,sans-seri=
f">The remaining issue with SPDX manifest generation on the autobuilder sho=
uld have been identified and fixed so we plan to enable the create_spdx cla=
ss by default in poky assuming a successful test build.<u style=3D"font-fam=
ily:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></s=
pan></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:basel=
ine;color:black"><span style=3D"font-family:Arial,sans-serif">The recent 6.=
1 kernel stable updates appear to be causing a couple of different intermit=
tent autobuilder issues. We=E2=80=99re working to try and get to the bottom=
 of that, we=E2=80=99re hoping further updates to the 6.1 series may pull i=
n fixes for the regressions.<u style=3D"font-family:Arial,sans-serif"></u><=
u style=3D"font-family:Arial,sans-serif"></u></span></li><li style=3D"margi=
n-top:0in;margin-bottom:0in;vertical-align:baseline;color:black"><span styl=
e=3D"font-family:Arial,sans-serif">Patch merging has been slow this week as=
 we struggled to bisect failures down to the problematic commits (potential=
ly the sqlite version bump).<u style=3D"font-family:Arial,sans-serif"></u><=
u style=3D"font-family:Arial,sans-serif"></u></span></li><li style=3D"margi=
n-top:0in;margin-bottom:0in;vertical-align:baseline;color:black"><span styl=
e=3D"font-family:Arial,sans-serif">We continue to see problematic intermitt=
ent failures on the autobuilder. We=E2=80=99re struggling to make progress =
against these and they are feeling overwhelming. We=E2=80=99re open to idea=
s on how we might try and address them. Experience shows that if left unres=
olved/ignored, people do end up hitting them in real world usage or during =
testing of their own products.<u style=3D"font-family:Arial,sans-serif"></u=
><u style=3D"font-family:Arial,sans-serif"></u></span></li></ul><ul style=
=3D"margin-top:0in" type=3D"disc"><li style=3D"margin-top:0in;margin-bottom=
:0in;vertical-align:baseline;color:black"><span style=3D"font-family:Arial,=
sans-serif">There are a number of patches still queued in master-next as it=
 is unclear whether they=E2=80=99re ready for various reasons. For bandwidt=
h reasons these will likely be deferred to M2, people are just stretched to=
o thinly to do otherwise, frustrating as it is.<u style=3D"font-family:Aria=
l,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li=
><li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;colo=
r:black"><span style=3D"font-family:Arial,sans-serif">Big thanks to Ross fo=
r helping look at the high number of CVE issues open against master.<u styl=
e=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-s=
erif"></u></span></li></ul><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><=
p style=3D"margin:0in"><span style=3D"font-family:Arial,sans-serif;color:bl=
ack">Ways to contribute:</span><u></u><u></u></p><ul style=3D"margin-top:0i=
n" type=3D"disc"><li style=3D"margin-top:0in;margin-bottom:0in;vertical-ali=
gn:baseline;color:black"><span style=3D"font-family:Arial,sans-serif">As pe=
ople are likely aware, the project has a number of components which are eit=
her unmaintained, or have people with little to no time trying to keep them=
 alive. These components include: patchtest, layerindex, devtool, toaster, =
wic, oeqa, autobuilder, CROPs containers, pseudo and more. Many have open b=
ugs. Help is welcome in trying to better look after these components!<u sty=
le=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-=
serif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;vertic=
al-align:baseline;color:black"><span style=3D"font-family:Arial,sans-serif"=
>There are bugs identified as possible for newcomers to the project: <a hre=
f=3D"https://wiki.yoctoproject.org/wiki/Newcomers" target=3D"_blank" style=
=3D"font-family:Arial,sans-serif"><span style=3D"font-family:Arial,sans-ser=
if;color:rgb(17,85,204)">https://wiki.yoctoproject.org/wiki/Newcomers</span=
></a><u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:=
Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;margin-bottom=
:0in;vertical-align:baseline;color:black"><span style=3D"font-family:Arial,=
sans-serif">There are bugs that are currently unassigned for YP 4.3. See: <=
a href=3D"https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.3_Unass=
igned_Enhancements.2FBugs" target=3D"_blank" style=3D"font-family:Arial,san=
s-serif"><span style=3D"font-family:Arial,sans-serif;color:rgb(17,85,204)">=
https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_4.3_Unassigned_Enha=
ncements.2FBugs</span></a><u style=3D"font-family:Arial,sans-serif"></u><u =
style=3D"font-family:Arial,sans-serif"></u></span></li><li style=3D"margin-=
top:0in;margin-bottom:0in;vertical-align:baseline;color:black"><span style=
=3D"font-family:Arial,sans-serif">We=E2=80=99d welcome new maintainers for =
recipes in OE-Core. Please see the list at: <a href=3D"http://git.yoctoproj=
ect.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc" target=
=3D"_blank" style=3D"font-family:Arial,sans-serif"><span style=3D"font-fami=
ly:Arial,sans-serif;color:rgb(17,85,204)">http://git.yoctoproject.org/cgit.=
cgi/poky/tree/meta/conf/distro/include/maintainers.inc</span></a> and discu=
ss with the existing maintainer, or ask on the OE-Core mailing list. We wil=
l likely move a chunk of these to =E2=80=9CUnassigned=E2=80=9D soon to help=
 facilitate this.<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"=
font-family:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;m=
argin-bottom:0in;vertical-align:baseline;color:black"><span style=3D"font-f=
amily:Arial,sans-serif">Help is very much welcome in trying to resolve our =
autobuilder intermittent issues. You can see the list of failures we=E2=80=
=99re continuing to see by searching for the =E2=80=9CAB-INT=E2=80=9D tag i=
n bugzilla: <a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?quicks=
earch=3DAB-INT" target=3D"_blank" style=3D"font-family:Arial,sans-serif"><s=
pan style=3D"font-family:Arial,sans-serif;color:rgb(17,85,204)">https://bug=
zilla.yoctoproject.org/buglist.cgi?quicksearch=3DAB-INT</span></a>.<u style=
=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-se=
rif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical=
-align:baseline;color:black"><span style=3D"font-family:Arial,sans-serif">H=
elp us resolve CVE issues: <a href=3D"https://autobuilder.yocto.io/pub/non-=
release/patchmetrics/" target=3D"_blank" style=3D"font-family:Arial,sans-se=
rif"><span style=3D"font-family:Arial,sans-serif;color:rgb(17,85,204)">CVE =
metrics</span></a>=C2=A0<u style=3D"font-family:Arial,sans-serif"></u><u st=
yle=3D"font-family:Arial,sans-serif"></u></span></li><li style=3D"margin-to=
p:0in;margin-bottom:0in;vertical-align:baseline;color:black"><span style=3D=
"font-family:Arial,sans-serif">We have a growing number of bugs in bugzilla=
, any help with them is appreciated.<u style=3D"font-family:Arial,sans-seri=
f"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li></ul><p cl=
ass=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p style=3D"margin:0in"><span sty=
le=3D"font-family:Arial,sans-serif;color:black">YP 4.3 Milestone Dates:</sp=
an><u></u><u></u></p><ul style=3D"margin-top:0in" type=3D"disc"><li style=
=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:black"><=
span style=3D"font-family:Arial,sans-serif">YP 4.3 M1 build date=C2=A0 2023=
/06/05<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family=
:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;margin-botto=
m:0in;vertical-align:baseline;color:black"><span style=3D"font-family:Arial=
,sans-serif">YP 4.3 M1 Release date 2023/06/16<u style=3D"font-family:Arial=
,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li>=
<li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color=
:black"><span style=3D"font-family:Arial,sans-serif">YP 4.3 M2 build date=
=C2=A0 2023/07/17<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"=
font-family:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;m=
argin-bottom:0in;vertical-align:baseline;color:black"><span style=3D"font-f=
amily:Arial,sans-serif">YP 4.3 M2 Release date 2023/07/28<u style=3D"font-f=
amily:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u><=
/span></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:bas=
eline;color:black"><span style=3D"font-family:Arial,sans-serif">YP 4.3 M3 b=
uild date=C2=A0 2023/08/28<u style=3D"font-family:Arial,sans-serif"></u><u =
style=3D"font-family:Arial,sans-serif"></u></span></li><li style=3D"margin-=
top:0in;margin-bottom:0in;vertical-align:baseline;color:black"><span style=
=3D"font-family:Arial,sans-serif">YP 4.3 M3 Release date 2023/09/08<u style=
=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-se=
rif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical=
-align:baseline;color:black"><span style=3D"font-family:Arial,sans-serif">Y=
P 4.3 M4 build date=C2=A0 2023/10/02<u style=3D"font-family:Arial,sans-seri=
f"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li><li style=
=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:black"><=
span style=3D"font-family:Arial,sans-serif">YP 4.3 M4 Release date 2023/10/=
27<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Ari=
al,sans-serif"></u></span></li></ul><p class=3D"MsoNormal"><u></u>=C2=A0<u>=
</u></p><p style=3D"margin:0in"><span style=3D"font-family:Arial,sans-serif=
;color:black">Upcoming dot releases:</span><u></u><u></u></p><ul style=3D"m=
argin-top:0in" type=3D"disc"><li style=3D"margin-top:0in;margin-bottom:0in;=
vertical-align:baseline;color:black"><span style=3D"font-family:Arial,sans-=
serif">YP 3.1.26 build date 2023/06/19<u style=3D"font-family:Arial,sans-se=
rif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li><li styl=
e=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:black">=
<span style=3D"font-family:Arial,sans-serif">YP 3.1.26 Release date 2023/06=
/30<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Ar=
ial,sans-serif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0=
in;vertical-align:baseline;color:black"><span style=3D"font-family:Arial,sa=
ns-serif">YP 4.0.11 build date 2023/06/26<u style=3D"font-family:Arial,sans=
-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li><li s=
tyle=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:blac=
k"><span style=3D"font-family:Arial,sans-serif">YP 4.0.11 Release date 2023=
/07/07<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family=
:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;margin-botto=
m:0in;vertical-align:baseline;color:black"><span style=3D"font-family:Arial=
,sans-serif">YP 4.2.2 build date 2023/07/10<u style=3D"font-family:Arial,sa=
ns-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li><li=
 style=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:bl=
ack"><span style=3D"font-family:Arial,sans-serif">YP 4.2.2 Release date 202=
3/07/21=C2=A0<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font=
-family:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;margi=
n-bottom:0in;vertical-align:baseline;color:black"><span style=3D"font-famil=
y:Arial,sans-serif">YP 3.1.27 build date 2023/07/31<u style=3D"font-family:=
Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span>=
</li><li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;=
color:black"><span style=3D"font-family:Arial,sans-serif">YP 3.1.27 Release=
 date 2023/08/11<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"f=
ont-family:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;ma=
rgin-bottom:0in;vertical-align:baseline;color:black"><span style=3D"font-fa=
mily:Arial,sans-serif">YP 4.0.12 build date 2023/08/07<u style=3D"font-fami=
ly:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></sp=
an></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseli=
ne;color:black"><span style=3D"font-family:Arial,sans-serif">YP 4.0.12 Rele=
ase date 2023/08/18<u style=3D"font-family:Arial,sans-serif"></u><u style=
=3D"font-family:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0=
in;margin-bottom:0in;vertical-align:baseline;color:black"><span style=3D"fo=
nt-family:Arial,sans-serif">YP 4.2.3 build date 2023/08/28<u style=3D"font-=
family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u>=
</span></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:ba=
seline;color:black"><span style=3D"font-family:Arial,sans-serif">YP 4.2.3 R=
elease date 2023/09/08<u style=3D"font-family:Arial,sans-serif"></u><u styl=
e=3D"font-family:Arial,sans-serif"></u></span></li><li style=3D"margin-top:=
0in;margin-bottom:0in;vertical-align:baseline;color:black"><span style=3D"f=
ont-family:Arial,sans-serif">YP 3.1.28 build date 2023/09/18<u style=3D"fon=
t-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></=
u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:=
baseline;color:black"><span style=3D"font-family:Arial,sans-serif">YP 3.1.2=
8 Release date 2023/09/29<u style=3D"font-family:Arial,sans-serif"></u><u s=
tyle=3D"font-family:Arial,sans-serif"></u></span></li><li style=3D"margin-t=
op:0in;margin-bottom:0in;vertical-align:baseline;color:black"><span style=
=3D"font-family:Arial,sans-serif">YP 4.0.13 build date 2023/09/25<u style=
=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-se=
rif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical=
-align:baseline;color:black"><span style=3D"font-family:Arial,sans-serif">Y=
P 4.0.13 Release date 2023/10/06<u style=3D"font-family:Arial,sans-serif"><=
/u><u style=3D"font-family:Arial,sans-serif"></u></span></li><li style=3D"m=
argin-top:0in;margin-bottom:0in;vertical-align:baseline;color:black"><span =
style=3D"font-family:Arial,sans-serif">YP 3.1.29 build date 2023/10/30<u st=
yle=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans=
-serif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;verti=
cal-align:baseline;color:black"><span style=3D"font-family:Arial,sans-serif=
">YP 3.1.29 Release date 2023/11/10<u style=3D"font-family:Arial,sans-serif=
"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li><li style=
=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:black"><=
span style=3D"font-family:Arial,sans-serif">YP 4.0.14 build date 2023/11/06=
<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Arial=
,sans-serif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;=
vertical-align:baseline;color:black"><span style=3D"font-family:Arial,sans-=
serif">YP 4.0.14 Release date 2023/11/17<u style=3D"font-family:Arial,sans-=
serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li><li st=
yle=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:black=
"><span style=3D"font-family:Arial,sans-serif">YP 4.2.4 build date 2023/11/=
13<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Ari=
al,sans-serif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0i=
n;vertical-align:baseline;color:black"><span style=3D"font-family:Arial,san=
s-serif">YP 4.2.4 Release date 2023/11/24<u style=3D"font-family:Arial,sans=
-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li><li s=
tyle=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:blac=
k"><span style=3D"font-family:Arial,sans-serif">YP 3.1.30 build date 2023/1=
2/11<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:A=
rial,sans-serif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:=
0in;vertical-align:baseline;color:black"><span style=3D"font-family:Arial,s=
ans-serif">YP 3.1.30 Release date 2023/12/22<u style=3D"font-family:Arial,s=
ans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li><l=
i style=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:b=
lack"><span style=3D"font-family:Arial,sans-serif">YP 4.0.15 build date 202=
3/12/18<u style=3D"font-family:Arial,sans-serif"></u><u style=3D"font-famil=
y:Arial,sans-serif"></u></span></li><li style=3D"margin-top:0in;margin-bott=
om:0in;vertical-align:baseline;color:black"><span style=3D"font-family:Aria=
l,sans-serif">YP 4.0.15 Release date 2023/12/29<u style=3D"font-family:Aria=
l,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></li=
></ul><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p style=3D"margin:0in=
"><span style=3D"font-family:Arial,sans-serif;color:black">Tracking Metrics=
:</span><u></u><u></u></p><ul style=3D"margin-top:0in" type=3D"disc"><li st=
yle=3D"margin-top:0in;margin-bottom:0in;vertical-align:baseline;color:black=
"><span style=3D"font-family:Arial,sans-serif">WDD 2527 (last week 2522)</s=
pan><span style=3D"font-family:Consolas"> (</span><span style=3D"font-famil=
y:Arial,sans-serif"><a href=3D"https://wiki.yoctoproject.org/charts/combo.h=
tml" target=3D"_blank" style=3D"font-family:Arial,sans-serif"><span style=
=3D"font-family:Arial,sans-serif;color:rgb(17,85,204)">https://wiki.yoctopr=
oject.org/charts/combo.html</span></a></span><span style=3D"font-family:Con=
solas">)</span><span style=3D"font-family:Arial,sans-serif"><u style=3D"fon=
t-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></=
u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical-align:=
baseline;color:black"><span style=3D"font-family:Arial,sans-serif">OE-Core/=
Poky Patch Metrics</span><span style=3D"font-family:Consolas"><u style=3D"f=
ont-family:Consolas"></u><u style=3D"font-family:Consolas"></u></span></li>=
<ul style=3D"margin-top:0in" type=3D"circle"><li style=3D"margin-top:0in;ma=
rgin-bottom:0in;vertical-align:baseline;color:black"><span style=3D"font-fa=
mily:Arial,sans-serif">Total patches found: 1162 (last week 1160)<u style=
=3D"font-family:Arial,sans-serif"></u><u style=3D"font-family:Arial,sans-se=
rif"></u></span></li><li style=3D"margin-top:0in;margin-bottom:0in;vertical=
-align:baseline;color:black"><span style=3D"font-family:Arial,sans-serif">P=
atches in the Pending State: 271 (23%) [last week 272 (23%)]</span><span st=
yle=3D"font-family:Consolas"><u style=3D"font-family:Consolas"></u><u style=
=3D"font-family:Consolas"></u></span></li></ul><li style=3D"margin-top:0in;=
margin-bottom:0in;vertical-align:baseline;color:black"><span style=3D"font-=
family:Consolas"><a href=3D"https://autobuilder.yocto.io/pub/non-release/pa=
tchmetrics/" target=3D"_blank" style=3D"font-family:Consolas"><span style=
=3D"font-family:Arial,sans-serif;color:rgb(17,85,204)">https://autobuilder.=
yocto.io/pub/non-release/patchmetrics/</span></a><u style=3D"font-family:Co=
nsolas"></u><u style=3D"font-family:Consolas"></u></span></li></ul><p class=
=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p style=3D"margin:0in"><span style=
=3D"font-family:Arial,sans-serif;color:black">The Yocto Project=E2=80=99s t=
echnical governance is through its Technical Steering Committee, more infor=
mation is available at:</span><u></u><u></u></p><p style=3D"margin:0in"><a =
href=3D"https://wiki.yoctoproject.org/wiki/TSC" target=3D"_blank"><span sty=
le=3D"font-family:Arial,sans-serif;color:rgb(17,85,204)">https://wiki.yocto=
project.org/wiki/TSC</span></a><u></u><u></u></p><p class=3D"MsoNormal"><u>=
</u>=C2=A0<u></u></p><p style=3D"margin:0in"><span style=3D"font-family:Ari=
al,sans-serif;color:black">The Status reports are now stored on the wiki at=
: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" targe=
t=3D"_blank"><span style=3D"font-family:Arial,sans-serif;color:rgb(17,85,20=
4)">https://wiki.yoctoproject.org/wiki/Weekly_Status</span></a><u></u><u></=
u></p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p style=3D"margin:0in=
"><span style=3D"font-family:Arial,sans-serif;color:black">[If anyone has s=
uggestions for other information you=E2=80=99d like to see on this weekly s=
tatus update, let us know!]</span><u></u><u></u></p><p class=3D"MsoNormal">=
<u></u>=C2=A0<u></u></p><p class=3D"MsoNormal">Thanks,<u></u><u></u></p><p =
class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><p class=3D"MsoNormal" style=3D=
"break-after:avoid"><b><i><span style=3D"font-size:16pt;font-family:&quot;T=
imes New Roman&quot;,serif;color:purple">Stephen K. Jolley</span></i></b><b=
><i><span style=3D"font-size:16pt;font-family:Tahoma,sans-serif;color:purpl=
e"><u style=3D"font-family:Tahoma,sans-serif"></u><u style=3D"font-family:T=
ahoma,sans-serif"></u></span></i></b></p><p class=3D"MsoNormal"><b><span st=
yle=3D"font-size:8pt;font-family:&quot;Courier New&quot;;color:blue">Yocto =
Project Program Manager<u style=3D"font-family:&quot;Courier New&quot;"></u=
><u style=3D"font-family:&quot;Courier New&quot;"></u></span></b></p><p cla=
ss=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Wingdings;color:b=
lack">(</span><span style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&=
quot;;color:teal">=C2=A0=C2=A0=C2=A0 </span><b><span style=3D"font-size:8pt=
;font-family:&quot;Comic Sans MS&quot;;color:teal">Cell</span></b><span sty=
le=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;;color:teal">:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 </span><span style=3D"font-size:9pt;font-family:&quot;MS Sans =
Serif&quot;">(208) 244-4460<span style=3D"font-family:&quot;MS Sans Serif&q=
uot;;color:black"><u style=3D"font-family:&quot;MS Sans Serif&quot;"></u><u=
 style=3D"font-family:&quot;MS Sans Serif&quot;"></u></span></span></p><p c=
lass=3D"MsoNormal"><span style=3D"font-size:9pt;font-family:Wingdings">* </=
span><b><span lang=3D"FR" style=3D"font-size:8pt;font-family:&quot;Comic Sa=
ns MS&quot;;color:teal">Email</span></b><span lang=3D"FR" style=3D"font-siz=
e:9pt;font-family:&quot;MS Sans Serif&quot;;color:teal">:</span><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;">=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0<u style=3D"font-family:&quot;MS Sans Serif&quot;"><span style=3D"fon=
t-family:&quot;MS Sans Serif&quot;;color:blue"><a href=3D"mailto:sjolley.yp=
.pm@gmail.com" target=3D"_blank" style=3D"font-family:&quot;MS Sans Serif&q=
uot;">sjolley.yp.pm@gmail.com</a></span></u></span><span lang=3D"FR" style=
=3D"font-size:12pt;font-family:Arial,sans-serif"><u style=3D"font-family:Ar=
ial,sans-serif"></u><u style=3D"font-family:Arial,sans-serif"></u></span></=
p><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#60189): <a href=3D"https://lists.yoctoproject.org/g/yoc=
to/message/60189" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctop=
roject.org/g/yocto/message/60189</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99364585/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/99364585/1686489</a><br>
Group Owner: <a href=3D"mailto:yocto%2Bowner@lists.yoctoproject.org" target=
=3D"_blank">yocto+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/yocto/un=
sub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.k=
anavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ede30f05fd773e71--

