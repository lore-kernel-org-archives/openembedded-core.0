Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C3AD374AE
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 15:52:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.1400.1729180335357399306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 08:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YO13unZ8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC74E40009;
	Thu, 17 Oct 2024 15:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729180333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BaZFiXCanpd4v6c+hUwkpPUivi2wmpVWnH09Q8yW06M=;
	b=YO13unZ8Fi6ITYvcqaO72e2dQHSEqshhH7Js2Fhq3qxPm/PtNrOCRfDk7NfyPWOxY9pY7S
	SekrKLWSbaNVd1B6/FtDRe+vr0ZnkMr6NqyExgAlRl+tu/YKYX0GW1umJBLLeDaW21xs7B
	2gZKC9juGPwk1nEC42uf9SZEWk/g8mF5k77qZR3p2sub+Q8oQIX0d26cccptYlRyMFRRRe
	Y/0+QPztyd2VsMthHa4ClXGu5iVT9SwoWLRdFQmZXhxWolsOIsJU4+aNz0qxlGAvR2vrrt
	6ITw1qdwwPEOg4Jx5EmgGMTbmOlLX8pLqHyQKiHuVY6NgstA4pA4c8j6hJfdDg==
Date: Thu, 17 Oct 2024 17:52:11 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: quentin.schulz@cherry.de
Cc: Fabio Estevam <festevam@gmail.com>,
	openembedded-core@lists.openembedded.org, marex@denx.de,
	Fabio Estevam <festevam@denx.de>, Ross Burton <ross.burton@arm.com>,
	jon.mason@arm.com
Subject: Re: [OE-core] [PATCH RESEND] u-boot: upgrade 2024.07 -> 2024.10
Message-ID: <ZxEyq0MAqQ4bepFZ@bootlin-mathieu>
Mail-Followup-To: quentin.schulz@cherry.de,
	Fabio Estevam <festevam@gmail.com>,
	openembedded-core@lists.openembedded.org, marex@denx.de,
	Fabio Estevam <festevam@denx.de>, Ross Burton <ross.burton@arm.com>,
	jon.mason@arm.com
References: <20241014113549.1594444-1-festevam@gmail.com>
 <ZxEO4yJA4VVLQdsN@bootlin-mathieu>
 <de94f4d8-0ae0-487b-a45e-01098869866a@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de94f4d8-0ae0-487b-a45e-01098869866a@cherry.de>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 15:52:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206029

On Thu, Oct 17, 2024 at 03:47:58PM +0200, Quentin Schulz via lists.openembedded.org wrote:
> Hi Mathieu,
> 
> On 10/17/24 3:19 PM, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> > [You don't often get email from mathieu.dubois-briand=bootlin.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On Mon, Oct 14, 2024 at 08:35:49AM -0300, Fabio Estevam wrote:
> > > From: Fabio Estevam <festevam@denx.de>
> > > 
> > > Upgrade to U-Boot 2024.10.
> > > 
> > > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > 
> > Hi Fabio,
> > 
> > I tried to apply your patch, and I got the following error on the
> > autobuilder:
> > 
> > ERROR: u-boot-1_2024.10-r0 do_patch: Applying patch
> > '0004-arm-Move-sev-and-wfe-definitions-to-common-Arm-heade.patch' on
> > target directory
> 
> This is for/with meta-arm/meta-arm-bsp folks to look at I believe?
> 
> @cc ross and jon
> 

Oops, my bad, this is indeed for meta-arm. Thanks Quentin !

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

