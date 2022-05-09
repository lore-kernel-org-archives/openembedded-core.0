Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2FDC433FE
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 21:39:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.1463.1652132379300003820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 14:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RgeZtyPV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CF2521BF207;
	Mon,  9 May 2022 21:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652132377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xNurvf+/S5iGA3UafM2hlGdNBvKfUnqkGcC1+23PyMw=;
	b=RgeZtyPVqap6KcENNL1AxrlKaEbKrZaPuoJqcam2zYpOLN3sN9XbSmIKgEMxA8Q4cI+SGZ
	uuT6NeQXdvoihvXlvtjsENZIPqhjeBhbeFzlqzWCy6mbiC3pcnTY6NRclHUChcEzJNpIrD
	55mc5nHr6W7CUCRPx8MynTC5sv1MLeE4GAGrflyH5ZpGaOKfaN1DZ2Faz1DBfDo34ymefY
	IZ8xbwJhSe5GzxfeZVPAMx5N3wsNiHvJxJeP45ZFzbhOhg/z3431D2H0T92kzuAUAxJzgu
	DyROOFgscnizwjXWkNB801Ibm/zGF8jOWXPXJ9koQOAnty2HVAl3fQqDU+u+Fw==
Date: Mon, 9 May 2022 23:39:31 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gcc: upgrade 11.3 -> 12.1
Message-ID: <20220509233931.2d4bbf0b@melee>
In-Reply-To: <20220508003820.1120893-1-raj.khem@gmail.com>
References: <20220508003820.1120893-1-raj.khem@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 21:39:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165405

Hi Khem,

Il giorno Sat,  7 May 2022 17:38:20 -0700
"Khem Raj" <raj.khem@gmail.com> ha scritto:

> Major gcc release with lot of changes [2]
> 
> - Add patch to re-shuffle include of sched.h to fix build on musl
> - porting guide to gcc 12 [1]
> - Fix version in maintainers entry
> 
> [1] https://gcc.gnu.org/gcc-12/porting_to.html
> [2] https://gcc.gnu.org/gcc-12/changes.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

We have a xen-tools build failure on meta-virt with this patch applied:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/60/steps/13/logs/stdio

and the same build succeeds without that patch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/61/steps/13/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

