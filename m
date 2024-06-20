Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554A0C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:45:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.52612.1718901937871862398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 09:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oPqv2XJ/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 900FAFF807;
	Thu, 20 Jun 2024 16:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718901936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJre+r+fRCBViUKaZp/AgM6zig2Vlb3b4804ROgII7k=;
	b=oPqv2XJ/9T0nnmGTpjDiWt/ymO5Twd16P9C8HuehlrH0lbZX3CpBKgxygf0IDef3yGaAUk
	mhzITCSoUVrNXSeRUoWeG8cpTKTbCPhOO+4FQWzLgt7sMdLAIyzAt4mzR5QYdsdaUkRQEG
	1Ax7qL5nH8kVx9j6RUgr8z1/wuHr1WeBN5pwC2cDRxmHGB4wnqOyPCkzXcAuniP0QqsO2p
	52m9G9tpyMFM8KAcdcG0QzBn3f9ccglb5vmSD/bC1tz+nUTZMtxr2mjhMZ2DE6MP+tUHUv
	8y8ceIIKx6yyQfKRpdB2+j0U7k8UDrTYacMAY9I+rqLH6CIN5UD5OTFrflanpw==
Date: Thu, 20 Jun 2024 18:45:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alejandro Hernandez Samaniego <alejandro@enedino.org>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4] tclibc-picolibc: Adds a new TCLIBC variant
 to build with picolibc as C library
Message-ID: <202406201645359104eb23@mail.local>
References: <20240618181226.2693197-1-alejandro@enedino.org>
 <202406192003378ecde446@mail.local>
 <040A68B5-AF86-4553-B98C-8CF2F1BBA509@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <040A68B5-AF86-4553-B98C-8CF2F1BBA509@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 16:45:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200967

On 20/06/2024 16:10:41+0000, Ross Burton wrote:
> 
> 
> > On 19 Jun 2024, at 21:03, Alexandre Belloni via lists.openembedded.org <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> > 
> > Hello,
> > 
> > This causes selftest failures:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6833/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6877/steps/15/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6902/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6888/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3495/steps/15/logs/stdio
> 
> Those look a lot like they’re Josh’s SPDX changes not this.  Can we pick these back into your master-next branch Alex?

I can but I never had Josh's changes in my branch so unless this
assumption is that the sstate is poisoned, I'm pretty sure it s caused
by this patch.

This was the only change between
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7058
and https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7056

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

