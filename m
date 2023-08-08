Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799B4C001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 20:49:42 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.73400.1691527775390330848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 13:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=pZ/YyNgy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E19DA60003;
	Tue,  8 Aug 2023 20:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691527773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mzt6NN9TB8M9sA5+A7tq/zaGf2yduIbz0JINk78DoKM=;
	b=pZ/YyNgyM4cPHNRgsko+iScyr8UmwID21qdKM8xBpY0vFonUqh+GjWkYyn/u6UQ1TGB8rK
	U6+CG6pgted4xfgAisyCk3OdVfWGiTwCLVIwxN8GrSNbv5PXsUhSceYjGrGI4H6GEvo0jZ
	ZVWeh0tH2gNmswaJbt17MCFSUWTM7HjBt1a2f/5FEt2CNRF9N1Qvs1HDD59zSQY49jeN7k
	RfZK5kjV8RFuTzS+69YxMTbuP48ktIBqt7QupJayp6BR45r+dJk9LMpSeOrRORoRQCsF/x
	7uq+k32CQ2i4WBJAEIgSNwMIKEe92SRCLhyybLixtcPX7XgBZnUd043kC8vrig==
Date: Tue, 8 Aug 2023 22:49:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/7] linux-yocto: consolidated kernel pull
 request
Message-ID: <20230808204932c467f561@mail.local>
References: <cover.1691465503.git.bruce.ashfield@gmail.com>
 <2023080810431190bf01b5@mail.local>
 <1779695BCF00A2D5.10230@lists.openembedded.org>
 <CADkTA4MtUzS+OgLorV_QHiuhnKiS2EEq2wC4kq=VFGJMZ4mSrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4MtUzS+OgLorV_QHiuhnKiS2EEq2wC4kq=VFGJMZ4mSrg@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 20:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185677

On 08/08/2023 13:09:50-0400, Bruce Ashfield wrote:
> On Tue, Aug 8, 2023 at 8:49 AM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> >
> > On Tue, Aug 8, 2023 at 6:43 AM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > Hello Bruce,
> > >
> > > While I didn't test this series yet, as discussed, I've tried to switch
> > > to 6.4 by default. I got this warning:
> >
> > -tiny was clean here, but let me re-test and see if I've missed
> > sending something in my 6.4 SRCREV bumps.
> >
> 
> Which Machine is this ? (I always have a hard time figuring that out
> .. sad, I know).
> 

This was qemuarm.

> I have this series of commits:
> 
> commit fa08cd6bd6f9415c91da0dd72f4338bff3c68c68
> Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> Date:   Mon Jul 10 11:21:58 2023 -0400
> 
>     tiny: enable HID in tiny BSPs
> 
>     HID is no longer selected, so to avoid -tiny warnings we need to
>     explicitly enable it in more -tiny BSPs.
> 
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> :100644 100644 0fa5dae7ec9 51d597039c3 M
> bsp/arm-versatile-926ejs/arm-versatile-926ejs-tiny.scc
> :100644 100644 e4928b43416 5fdb341638a M        bsp/qemuarm64/qemuarm64-tiny.scc
> 
> commit 4655de57a68a86e651fcea2eb2c7e88f3de3bbfb
> Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> Date:   Fri Jul 7 14:00:08 2023 -0400
> 
>     common-pc-64/tiny: enable HID by default
> 
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> :100644 100644 7fcac7fd54a 0d083b0d2a5 M
> bsp/common-pc-64/common-pc-64-tiny.scc
> 
> commit 252c55e236cb46860bae0fd1b1e0641e6e8dd512
> Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> Date:   Fri Jul 7 10:39:41 2023 -0400
> 
>     common-pc/tiny: enable HID by default
> 
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> :100644 100644 687414ae671 9fe725ac450 M        bsp/common-pc/common-pc-tiny.scc
> 
> commit 849f920aa1b7c76c0be6c1054c5efb758ca07600
> Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> Date:   Fri Jul 7 10:36:39 2023 -0400
> 
>     cfg: add CONFIG_HID base fragment
> 
>     When testing the -tiny kernel against v6.4, configuration warnings
>     were noticed as CONFIG_HID is disabled by our baseline allnoconfig.
> 
>     We have BSPs that require HID support for drivers, and they will
>     warn when building a -tiny variant.
> 
>     Introducing a HID base fragment so they can share the enabling of
>     these options as required.
> 
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> :000000 100644 00000000000 cfd84dbda45 A        features/hid/hid.cfg
> :000000 100644 00000000000 28d242df7ad A        features/hid/hid.scc
> 
> But if this is showing up on the AB, I must have missed an instance.
> 
> My test build was just clean.
> 
> Bruce
> 
> 
> > Bruce
> >
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/7876/steps/13/logs/stdio
> > >
> > > WARNING: linux-yocto-tiny-6.4.3+gitAUTOINC+dab56f52aa_dee78ad196-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
> > >     [NOTE]: 'CONFIG_USB_HID' last val (y) and .config val (n) do not match
> > >     [INFO]: CONFIG_USB_HID : n
> > >     [INFO]: raw config text:
> > >         config USB_HID
> > >                 tristate "USB HID transport layer"
> > >                 default y
> > >                 select HID
> > >                 depends on USB && INPUT && USB && HID_SUPPORT
> > >                 help
> > >                   Say Y here if you want to connect USB keyboards,
> > >                   mice, joysticks, graphic tablets, or any other HID based devices
> > >                   to your computer via USB, as well as Uninterruptible Power Supply
> > >                   (UPS) and monitor control devices.
> > >
> > >                   You can't use this driver and the HIDBP (Boot Protocol) keyboard
> > >                   and mouse drivers at the same time. More information is available:
> > >                   <file:Documentation/input/input.rst>.
> > >
> > >                   If unsure, say Y.
> > >
> > >                   To compile this driver as a module, choose M here: the
> > >                   module will be called usbhid.
> > >         Config 'USB_HID' has the following Direct dependencies (USB_HID=n):
> > >                 USB(=y) && INPUT(=y) && HID_SUPPORT(=n)
> > >         Parent dependencies are:
> > >              INPUT [y] USB [y] HID_SUPPORT [n]
> > >     [INFO]: config 'CONFIG_USB_HID' was set, but it wasn't assignable, check (parent) dependencies
> > >
> > >
> > > master has 86adbe4db668 ("linux-yocto-tiny/6.4: fix configuration
> > > warnings (HID)") so I guess there is something missing.
> > >
> > >
> > > On 07/08/2023 23:35:46-0400, Bruce Ashfield wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Richard,
> > > >
> > > > Here's my queued set of -stable updates (as well as a -dev kernel bump).
> > > >
> > > > I've got another round of updates under test, and will send them when
> > > > ready.
> > > >
> > > > 6.4 marches along, it'll be up to date when those last issues keeping
> > > > it from being the default are resolved.
> > > >
> > > > Bruce
> > > >
> > > > The following changes since commit 058a44165ce375f405063e73a9fcd1b2757ef8da:
> > > >
> > > >   bitbake: fetch2: Check if path is 'None' before calculating checksums (2023-08-04 11:48:26 +0100)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   https://git.yoctoproject.org/poky-contrib zedd/kernel
> > > >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> > > >
> > > > Bruce Ashfield (7):
> > > >   linux-yocto/6.4: fix CONFIG_LEDS_TRIGGER_GPIO kernel audit warning
> > > >   linux-yocto/6.4: update to v6.4.6
> > > >   linux-yocto/6.1: update to v6.1.41
> > > >   linux-yocto/6.4: update to v6.4.7
> > > >   linux-yocto-dev: bump to v6.5+
> > > >   linux-yocto/6.4: update to v6.4.8
> > > >   linux-yocto/6.1: update to v6.1.43
> > > >
> > > >  meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
> > > >  .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
> > > >  .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
> > > >  .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
> > > >  .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
> > > >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
> > > >  meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
> > > >  7 files changed, 42 insertions(+), 42 deletions(-)
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185661): https://lists.openembedded.org/g/openembedded-core/message/185661
> > Mute This Topic: https://lists.openembedded.org/mt/100615695/1050810
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

