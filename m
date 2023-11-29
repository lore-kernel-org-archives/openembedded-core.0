Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6E4C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 11:15:12 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.30430.1701256508382816333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 03:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1r8IX3-0001IU-VW; Wed, 29 Nov 2023 12:15:05 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1r8IX3-00COIY-F9; Wed, 29 Nov 2023 12:15:05 +0100
Received: from mfe by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1r8IX3-004QbK-Cd; Wed, 29 Nov 2023 12:15:05 +0100
Date: Wed, 29 Nov 2023 12:15:05 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"yocto@pengutronix.de" <yocto@pengutronix.de>
Subject: Re: [OE-core] [PATCH] json-c: fix icecc compilation
Message-ID: <20231129111505.ygxre25t5m34qm63@pengutronix.de>
References: <20231128224743.2854095-1-m.felsch@pengutronix.de>
 <AS1PR10MB569750733E9544DDFF316DC0FD83A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <20231129093610.34gr6zwe26xkiyii@pengutronix.de>
 <CANNYZj87m=2M6mvhybSTM1iTyZAYCjmkSZ2UcT35QtB5RDx9Rw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj87m=2M6mvhybSTM1iTyZAYCjmkSZ2UcT35QtB5RDx9Rw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191438

On 23-11-29, Alexander Kanavin wrote:
> On Wed, 29 Nov 2023 at 10:36, Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > I don't like removing WERROR unconditionally which decreases quality checks.
> > > Can we do it only in case ICECC is used?
> > > Something like "${@'-DDISABLE_WERROR=ON' if bb.data.inherits_class(icecc, d) else ''}"
> >
> > Good point, but IMHO IMHO Werror builds are for the project itself. It's
> > not oe-core's purpose to check each package that Werror builds do
> > succeed else you would need to enable it for all packages.
> 
> In general we remove -Werror wherever we see it. If all components had
> it, every gcc version update would cause an unfixable mountain of
> fails all over the place. And version updates for the components
> themselves would cause non-deterministic native fails too, depending
> on which gcc version the build host has.
> 
> -Werror is something components should run only in their own CI.

Exactly :) So this patch is good for oe-core?

Regards,
  Marco

