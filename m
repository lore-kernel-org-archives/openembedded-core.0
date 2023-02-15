Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AA4C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 14:06:38 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.15593.1676469992489519569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 06:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1pSIQY-0006NV-93; Wed, 15 Feb 2023 15:06:30 +0100
Message-ID: <45dbf5141a71bc1db6756cfc9df3fb0c0b33b3be.camel@pengutronix.de>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Marco Felsch
	 <m.felsch@pengutronix.de>, openembedded-core@lists.openembedded.org, 
	yocto@pengutronix.de, barebox@lists.infradead.org
Date: Wed, 15 Feb 2023 15:06:29 +0100
In-Reply-To: <CAP9ODKqjkCuhyVkfhskOSdF3g57=R9MO6Bcy2R5zBV9fVd6wZQ@mail.gmail.com>
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
	 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
	 <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
	 <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org>
	 <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com>
	 <CANNYZj8_RkjMASpozi+oSu3XOHCW04n9YUC5UgHKy+2vm=cDrQ@mail.gmail.com>
	 <CAP9ODKqjkCuhyVkfhskOSdF3g57=R9MO6Bcy2R5zBV9fVd6wZQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 14:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177196

Am Mittwoch, dem 15.02.2023 um 10:53 -0300 schrieb Otavio Salvador:
> Em qua., 15 de fev. de 2023 às 10:44, Alexander Kanavin
> <alex.kanavin@gmail.com> escreveu:
> > On Wed, 15 Feb 2023 at 12:22, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > > > Fair enough, I'm open to the idea. It would be interesting/useful to
> > > > see if anyone else in the community is in favour of this or not. I'm
> > > > sure you appreciate why we need to ask the question and why we can't
> > > > just add everything! :)
> > > > 
> > > > The community usage does appear to be primarily phytec/ptx.
> > > 
> > > I have used barebox in some projects in the past for multiple customers. It is a solid and
> > > commonly used bootloader. I consider U-Boot the industry standard, but Barebox is also widely
> > > used, and it makes sense to be part of OE-Core.
> > 
> > I do not quite understand why barebox needs to be specifically in
> > oe-core. There's a well maintained layer for it:
> > https://github.com/menschel-d/meta-barebox
> > so once all those meta-phytec recipes are phased out in favour of
> > using that layer, there's no fragmentation.
> 
> I think the Barebox inside OE-Core allows a bigger integration and
> reuse of existing tooling for signing and other classes currently well
> integrated with U-Boot.

Yes, this is another valid point. We have already identified that many things in OE are a bit
tailored to u-boot. Having another option (as one has for x86 with grub anyway) could, especially on
ARM platforms, inspire to make things more generic and probably also create community synergy
effects.

What clearly would not be the intention is to tailor things in oe-core for barebox only.

> For me, a critical point for decision is if
> Pengutronix will commit to support it.

Yes, I stated that this is clearly our intention.
So support isn't only a one-man show at all ;)


Thanks and best regards, Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


