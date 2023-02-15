Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB278C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 15:01:48 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.17121.1676473305297923589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 07:01:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1pSJHy-0004x2-DK; Wed, 15 Feb 2023 16:01:42 +0100
Message-ID: <721e4d45d0d67a03be6ea4953351f5cb0c4ac36d.camel@pengutronix.de>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Otavio Salvador
	 <otavio.salvador@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Marco Felsch
	 <m.felsch@pengutronix.de>, openembedded-core@lists.openembedded.org, 
	yocto@pengutronix.de, barebox@lists.infradead.org
Date: Wed, 15 Feb 2023 16:01:41 +0100
In-Reply-To: <CANNYZj_jLK-FXrGx+bF6fXrSsc-so6G_kpyZKNTpatqJKxQeRg@mail.gmail.com>
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
	 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
	 <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
	 <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org>
	 <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com>
	 <CANNYZj8_RkjMASpozi+oSu3XOHCW04n9YUC5UgHKy+2vm=cDrQ@mail.gmail.com>
	 <CAP9ODKqjkCuhyVkfhskOSdF3g57=R9MO6Bcy2R5zBV9fVd6wZQ@mail.gmail.com>
	 <CANNYZj_jLK-FXrGx+bF6fXrSsc-so6G_kpyZKNTpatqJKxQeRg@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 15:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177201

Am Mittwoch, dem 15.02.2023 um 15:11 +0100 schrieb Alexander Kanavin:
> On Wed, 15 Feb 2023 at 14:53, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> > I think the Barebox inside OE-Core allows a bigger integration and
> > reuse of existing tooling for signing and other classes currently well
> > integrated with U-Boot. For me, a critical point for decision is if
> > Pengutronix will commit to support it.
> 
> You should be well aware there's a history of people contributing
> stuff to core and even assigning themselves as maintainers, then
> disappearing.

If possible I would add my name with the above-mentioned Mailing list to the maintainers file.
This ensures I am responsible but not the only one reading the mails.

> And then it falls (largely) on me to keep things
> (barely) going. What happens if ptx withdraws its commitment? Can I
> then send a commit that removes barebox from core? Imagine the angry
> lynch mob that will show up after my head.

I am fully ok with removing barebox again if we fail maintaining it properly.

Should I sign this somewhere? ;)

> Adding things to core is a decision that cannot be easily reversed, so
> I'd rather have barebox in meta-barebox for a while, with any needed
> fixing to classes and infra in core.

It has been in meta-ptx since 2015 and in meta-barebox since 2016. I would call that 'a while' :)


Best regards, Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Embedded Linux Consulting & Support        | https://www.pengutronix.de/ |
Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  |
31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    |


