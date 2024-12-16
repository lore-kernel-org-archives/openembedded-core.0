Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F218E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 22:22:32 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.69046.1734387744531655713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 14:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tNJTq-0007KY-N0; Mon, 16 Dec 2024 23:22:22 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tNJTp-003lTb-0G;
	Mon, 16 Dec 2024 23:22:21 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tNJTp-002hzg-2S;
	Mon, 16 Dec 2024 23:22:21 +0100
Date: Mon, 16 Dec 2024 23:22:21 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Subject: Re: [OE-core] [PATCH] icecc: fix PN 'no-pn' handling
Message-ID: <20241216222221.ylk2ijte5h56ecsa@pengutronix.de>
References: <20241209164608.3595821-1-m.felsch@pengutronix.de>
 <180F920C983A7BC6.8554@lists.openembedded.org>
 <d470ced4a402955d9061201ba33c8b875f0bce63.camel@linuxfoundation.org>
 <20241209173815.lq7fh5nr55mttn6u@pengutronix.de>
 <7262a79ef16c1e01a26491d0a6cc1ddc46d969df.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7262a79ef16c1e01a26491d0a6cc1ddc46d969df.camel@linuxfoundation.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 22:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208793

Hi,

On 24-12-16, Richard Purdie wrote:
> On Mon, 2024-12-09 at 18:38 +0100, Marco Felsch wrote:
> > On 24-12-09, Richard Purdie wrote:
> > > On Mon, 2024-12-09 at 17:22 +0000, Richard Purdie via
> > > lists.openembedded.org wrote:

...

> > > The modern way of doing much of this would be a python prefunc on
> > > the
> > > appropriate tasks. I have to wonder how many people are using icecc
> > > :/.
> > 
> > Okay, I will give it a try with a python based prefunc.
> 
> Just wanted to say thanks for that patch, it looks like a neater way to
> fix this and likely other issues too.

I've seen that you applied both v2 patches onto the master branch. Is it
possible to apply both to scarthgap too?

Regards,
  Marco

