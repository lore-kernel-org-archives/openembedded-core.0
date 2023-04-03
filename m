Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3768C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 11:42:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.67827.1680522158256866716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 04:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1pjIa3-00067t-Os; Mon, 03 Apr 2023 13:42:35 +0200
Message-ID: <5edb0cbe55f0b194b89b75a2c34b74b2f343f2c9.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/9] barebox: set default BAREBOX_CONFIG for qemu
 machines
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, Richard
 Purdie <richard.purdie@linuxfoundation.org>, alexandre.belloni@bootlin.com,
 afa <afa@pengutronix.de>
Date: Mon, 03 Apr 2023 13:42:34 +0200
In-Reply-To: <CANNYZj8qDFMKa5HhnK=k7+Le=h_rhmV2Mm_WreLwjfbYWxiUcA@mail.gmail.com>
References: <20230331104025.1478393-1-ejo@pengutronix.de>
	 <20230331104025.1478393-4-ejo@pengutronix.de>
	 <CANNYZj8qDFMKa5HhnK=k7+Le=h_rhmV2Mm_WreLwjfbYWxiUcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 11:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179625

Hi Alex,

Am Freitag, dem 31.03.2023 um 16:04 +0200 schrieb Alexander Kanavin:
> On Fri, 31 Mar 2023 at 12:40, Enrico Jorns <ejo@pengutronix.de> wrote:
> > +# set defaults for oe-core MACHINEs to allow building barebox
> > +BAREBOX_CONFIG:qemuarm = "vexpress_defconfig"
> > +BAREBOX_CONFIG:qemuarm64 = "qemu_virt64_defconfig"
> > +BAREBOX_CONFIG:qemux86-64 = "efi_defconfig"
> 
> As all three are different perhaps there could be commentary in the
> recipe explaining why that and how they differ? Note that there's also
> a qemuall override if there's a single configuration that works for
> all qemu targets.

as these three are different archs/machines, I do not find it surprising that they require different
configs. I assumed that this was self-explaining.

Note that for UBOOT, you have

in qemux86-64.conf:

  UBOOT_MACHINE ?= "qemu-x86_64_defconfig"

in qemuarm.conf:

  UBOOT_MACHINE ?= "qemu_arm_defconfig"

in qemuarm64.conf:

  UBOOT_MACHINE ?= "qemu_arm64_defconfig"

which is pretty much the same as for barebox, isn't it? Only the naming scheme is a bit more
consistent probably.


Thanks and regards

Enrico

> 
> Alex
> 

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


