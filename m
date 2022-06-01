Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3425CCA473
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 15:05:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.8775.1654095906867102904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aIrUEIOA;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DA6F260011;
	Wed,  1 Jun 2022 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654095904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CETntA4cuXhdyHKG5QRxTSMmV56MwGU6IGxNgSQr2e8=;
	b=aIrUEIOAn9pIYiZ3qXv+51emTMyRqr8rQG2FbPxvZq/zzQ/kwf3BtrEEevrFHnRd9sf3JE
	RtmQ7okRKRLps5xJ/Sp2p1IyZVeEdG2Fr0SP2yMdnJFbIAaCi80xXnm2w837JvoS39lfpN
	UpI274TfEhjyyHNdZ3ZpPjXGwdNLjr6pOiclARMkDjDLSJPyAI3mhgIvjVigmADkhX5E5u
	Ee+Db2TbmfDo/EpEluT3XuG/FThlg7n0Wl3MvXnLs+nYDI9Ml60i9pAiSUySMKJ0h3PIjv
	amU8FeWNf4vnWNFS/fJAnOsQCWHwF7NX+qFhD2+nXZIBOTB8L8f4e977KsLlxQ==
Date: Wed, 1 Jun 2022 17:05:02 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "Marcel Ziswiler" <marcel@ziswiler.com>,
 openembedded-core@lists.openembedded.org, Peter Bergin
 <peter@berginkonsult.se>, Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use
 aaf config for alsa-plugins
Message-ID: <20220601170502.1889c3e5@booty>
In-Reply-To: <16F483479D2BE28A.13026@lists.openembedded.org>
References: <20220531213206.7119-1-marcel@ziswiler.com>
	<20220531213206.7119-2-marcel@ziswiler.com>
	<16F483479D2BE28A.13026@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 15:05:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166382

Hi Marcel,

On Wed, 1 Jun 2022 15:48:15 +0200
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hi Marcel,
> 
> On Tue, 31 May 2022 23:32:06 +0200
> "Marcel Ziswiler" <marcel@ziswiler.com> wrote:
> 
> > From: Peter Bergin <peter@berginkonsult.se>
> > 
> > In order to enable configuration option aaf (AVTP Audio Format)
> > used for AVB the library libavtp is a dependency but no recipe for
> > this library was present. aaf support for alsa-plugins was
> > introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> > 
> > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>  
> 
> This patch is failing on musl builds:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5308/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5294/steps/12/logs/stdio

This patch also triggers selftest errors because the new recipe has no
maintainer:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3657/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3661/steps/14/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

