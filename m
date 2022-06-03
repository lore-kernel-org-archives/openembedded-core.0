Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66365C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 20:17:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.2971.1654287451155436195
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 13:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B9a9U98f;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 043411BF205;
	Fri,  3 Jun 2022 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654287449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yNxS5qqilz6l2DCYAxyKTOhokSKnY5yRSFkcSTjUOUU=;
	b=B9a9U98f1LOYFVMFx+Z54svc7D9hDYHZJjNaS+A4KR+Wv9YsHq9M1J4ZTQJAMqLEBBh9/v
	XkPY7VrXyyKS7h33NQOn/08VLk7g3IihOFywxW8ZEA/TcKK3X7doBLSoKOed7LQTqaciWF
	gPeGlgjyJ/OfaQXHlli86RALSGKRHcheZUFr66i5go9IORTN7LjVRNmUZCRl4X/1MnLbP5
	n8/fCc9U/9IFo+WoaO9S/uXz2cB7EcghtN+N+Hvnn4uXwBhzjojMd+zLojyiWP5XP8Iv3r
	spPC+XQcEKatUuJkAbLAD+9nvcsVRifMB+xBe0Mk5loIDa1CMz1A0fV0wtnxdA==
Date: Fri, 3 Jun 2022 22:17:27 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCH 1/4] xorg-lib-common: allow to build for
 wayland
Message-ID: <20220603221727.1e8c5f6b@booty>
In-Reply-To: <6b5c87ac-3ea0-be92-9439-7cf69d136c9b@t-online.de>
References: <20220531190620.186764-1-f_l_k@t-online.de>
	<20220601170035.76ab1bcc@booty>
	<6b5c87ac-3ea0-be92-9439-7cf69d136c9b@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 20:17:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166523

Hi Markus,

On Wed, 1 Jun 2022 17:10:45 +0200
"Markus Volk" <f_l_k@t-online.de> wrote:

> Hi Luca,
> 
> i've sent a patch that should hopefully fix your issue

I guess you refer to:

  [oe-core][PATCH] xorg-font-common.inc: allow to build for wayland

and so I ran a build test with the above patch + the 4 patches in this
series.

However I would find it a lot clearer if you instead sent a v2 series
with all the 5 patches (1 new + 4 as in the previous version). It would
avoid any confusion.

About the test, unfortunately we are still having failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5316/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5316/steps/14/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

