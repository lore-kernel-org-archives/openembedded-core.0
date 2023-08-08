Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E1BC001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:10:01 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.67626.1691514593396644247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 10:09:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=UEZ2Jevl;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-34983226e16so1019605ab.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691514592; x=1692119392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJbE2R3Leasq3hmeSsh2CXZCrPKgViEMasbPJtTi4nk=;
        b=UEZ2Jevl8Y7KLjpXBIy20RTBR6V1cmw4pFnETTrKKXOoPEtlvqAkj1yPA/o5DDuGKC
         avToEWJuYfV8wlGCSJjtwBlTeZh/qETp2JJok4pZyHqHTpNUh8/5KAJUBMIU7Uyy/i8s
         CNXpFqhNceo09kfG3yRW3zDMqXgTaV+7HOAk71E+hL6WoMTyH8VdW9VF3/15lpD+nwzm
         ZGnT4C4fseoURRcEfAVM3PscvOlRBuXfYoO/BFTQSvNM71HcywjUWugekMjdJEfc7Ik8
         odUOFcz2RYFQEZGVRwf7CS2nCFwnBbnPlOJp0UCiMH4a14LZfzDesKxdiJHAIs0jPCn5
         5cBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514592; x=1692119392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJbE2R3Leasq3hmeSsh2CXZCrPKgViEMasbPJtTi4nk=;
        b=MsD3aYDKX96197cOVu4uB+dWqrY9udd68CP9ev+b6XFiWt3PezZ4J7fY1xIKaKJmKf
         I7mt6t8CDXslAnFgdox5YtHpg4l2OcCFze0p4lZ1jfo0zH26z0g1fhhuicXO0DnD6Bv9
         iFyLSruZqiRO7pfLC+SS+epHwPozZ8beCjH8kMrQI8MnNQhicoFqNS+LhduZj3Ii7dBP
         Wvka1G0SmCTSXZ9PO8QYJtkPv2p2chWTmTAstKeXFmg7AM8puqzlQrNar29cbIw76ykJ
         JPNhOxbPPMsp1l/tcBobwUWpeKxoQyuj26Kj31iE9014A/UT8vq98uaqnFxs30r1GPdV
         wsMg==
X-Gm-Message-State: AOJu0Yzo84pzsD8zofQuuuwU6STbD94DvH2gK0D1hLTYldVlQdtT4Kax
	gPA2prTLrj2Nv1T5WvcoVdilQNais31AmeY+ND4=
X-Google-Smtp-Source: AGHT+IFrwsszKieudZuwC/iAhbRrYMCmWovx3rioSUBlXQBk3f2YR0KJmxZBSwTDrDqICKb7vFIBi/CHSfV9Bh+yj9E=
X-Received: by 2002:a05:6e02:1d91:b0:348:d0e5:dbc8 with SMTP id
 h17-20020a056e021d9100b00348d0e5dbc8mr385109ila.31.1691514592409; Tue, 08 Aug
 2023 10:09:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691465503.git.bruce.ashfield@gmail.com>
 <2023080810431190bf01b5@mail.local> <1779695BCF00A2D5.10230@lists.openembedded.org>
In-Reply-To: <1779695BCF00A2D5.10230@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Aug 2023 13:09:50 -0400
Message-ID: <CADkTA4MtUzS+OgLorV_QHiuhnKiS2EEq2wC4kq=VFGJMZ4mSrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] linux-yocto: consolidated kernel pull request
To: bruce.ashfield@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 17:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185676

On Tue, Aug 8, 2023 at 8:49=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Tue, Aug 8, 2023 at 6:43=E2=80=AFAM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > Hello Bruce,
> >
> > While I didn't test this series yet, as discussed, I've tried to switch
> > to 6.4 by default. I got this warning:
>
> -tiny was clean here, but let me re-test and see if I've missed
> sending something in my 6.4 SRCREV bumps.
>

Which Machine is this ? (I always have a hard time figuring that out
.. sad, I know).

I have this series of commits:

commit fa08cd6bd6f9415c91da0dd72f4338bff3c68c68
Author: Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Mon Jul 10 11:21:58 2023 -0400

    tiny: enable HID in tiny BSPs

    HID is no longer selected, so to avoid -tiny warnings we need to
    explicitly enable it in more -tiny BSPs.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

:100644 100644 0fa5dae7ec9 51d597039c3 M
bsp/arm-versatile-926ejs/arm-versatile-926ejs-tiny.scc
:100644 100644 e4928b43416 5fdb341638a M        bsp/qemuarm64/qemuarm64-tin=
y.scc

commit 4655de57a68a86e651fcea2eb2c7e88f3de3bbfb
Author: Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Fri Jul 7 14:00:08 2023 -0400

    common-pc-64/tiny: enable HID by default

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

:100644 100644 7fcac7fd54a 0d083b0d2a5 M
bsp/common-pc-64/common-pc-64-tiny.scc

commit 252c55e236cb46860bae0fd1b1e0641e6e8dd512
Author: Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Fri Jul 7 10:39:41 2023 -0400

    common-pc/tiny: enable HID by default

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

:100644 100644 687414ae671 9fe725ac450 M        bsp/common-pc/common-pc-tin=
y.scc

commit 849f920aa1b7c76c0be6c1054c5efb758ca07600
Author: Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Fri Jul 7 10:36:39 2023 -0400

    cfg: add CONFIG_HID base fragment

    When testing the -tiny kernel against v6.4, configuration warnings
    were noticed as CONFIG_HID is disabled by our baseline allnoconfig.

    We have BSPs that require HID support for drivers, and they will
    warn when building a -tiny variant.

    Introducing a HID base fragment so they can share the enabling of
    these options as required.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

:000000 100644 00000000000 cfd84dbda45 A        features/hid/hid.cfg
:000000 100644 00000000000 28d242df7ad A        features/hid/hid.scc

But if this is showing up on the AB, I must have missed an instance.

My test build was just clean.

Bruce


> Bruce
>
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/7876/=
steps/13/logs/stdio
> >
> > WARNING: linux-yocto-tiny-6.4.3+gitAUTOINC+dab56f52aa_dee78ad196-r0 do_=
kernel_configcheck: [kernel config]: specified values did not make it into =
the kernel's final configuration:
> >     [NOTE]: 'CONFIG_USB_HID' last val (y) and .config val (n) do not ma=
tch
> >     [INFO]: CONFIG_USB_HID : n
> >     [INFO]: raw config text:
> >         config USB_HID
> >                 tristate "USB HID transport layer"
> >                 default y
> >                 select HID
> >                 depends on USB && INPUT && USB && HID_SUPPORT
> >                 help
> >                   Say Y here if you want to connect USB keyboards,
> >                   mice, joysticks, graphic tablets, or any other HID ba=
sed devices
> >                   to your computer via USB, as well as Uninterruptible =
Power Supply
> >                   (UPS) and monitor control devices.
> >
> >                   You can't use this driver and the HIDBP (Boot Protoco=
l) keyboard
> >                   and mouse drivers at the same time. More information =
is available:
> >                   <file:Documentation/input/input.rst>.
> >
> >                   If unsure, say Y.
> >
> >                   To compile this driver as a module, choose M here: th=
e
> >                   module will be called usbhid.
> >         Config 'USB_HID' has the following Direct dependencies (USB_HID=
=3Dn):
> >                 USB(=3Dy) && INPUT(=3Dy) && HID_SUPPORT(=3Dn)
> >         Parent dependencies are:
> >              INPUT [y] USB [y] HID_SUPPORT [n]
> >     [INFO]: config 'CONFIG_USB_HID' was set, but it wasn't assignable, =
check (parent) dependencies
> >
> >
> > master has 86adbe4db668 ("linux-yocto-tiny/6.4: fix configuration
> > warnings (HID)") so I guess there is something missing.
> >
> >
> > On 07/08/2023 23:35:46-0400, Bruce Ashfield wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Richard,
> > >
> > > Here's my queued set of -stable updates (as well as a -dev kernel bum=
p).
> > >
> > > I've got another round of updates under test, and will send them when
> > > ready.
> > >
> > > 6.4 marches along, it'll be up to date when those last issues keeping
> > > it from being the default are resolved.
> > >
> > > Bruce
> > >
> > > The following changes since commit 058a44165ce375f405063e73a9fcd1b275=
7ef8da:
> > >
> > >   bitbake: fetch2: Check if path is 'None' before calculating checksu=
ms (2023-08-04 11:48:26 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.yoctoproject.org/poky-contrib zedd/kernel
> > >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/ker=
nel
> > >
> > > Bruce Ashfield (7):
> > >   linux-yocto/6.4: fix CONFIG_LEDS_TRIGGER_GPIO kernel audit warning
> > >   linux-yocto/6.4: update to v6.4.6
> > >   linux-yocto/6.1: update to v6.1.41
> > >   linux-yocto/6.4: update to v6.4.7
> > >   linux-yocto-dev: bump to v6.5+
> > >   linux-yocto/6.4: update to v6.4.8
> > >   linux-yocto/6.1: update to v6.1.43
> > >
> > >  meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
> > >  .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
> > >  .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
> > >  .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
> > >  .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
> > >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++--------=
--
> > >  meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++--------=
--
> > >  7 files changed, 42 insertions(+), 42 deletions(-)
> > >
> > > --
> > > 2.34.1
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185661): https://lists.openembedded.org/g/openembedde=
d-core/message/185661
> Mute This Topic: https://lists.openembedded.org/mt/100615695/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

