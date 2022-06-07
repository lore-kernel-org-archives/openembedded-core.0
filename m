Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD47C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 10:41:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.11129.1654598461066868251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 03:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U4a598Uj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BA168FF81E;
	Tue,  7 Jun 2022 10:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654598459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAdBoyy118G5GYf+T+dDCDmvLe9neDPHru3ngNMLpgw=;
	b=U4a598UjmXA2FiklgK6WLQVS95cxdlFTNVPejJimRTS5DHtURrKLfqBSvcu3/hJ+XMM4So
	VJJmV1VCBfNf6uQBgbLPBDUei+0npnIZSYoGJ1QYaRAAWsJb3fJhoP2Q6WR0PECxqLRHUu
	+OucbSwd9wXKOrpzP1e/hgN+YgWCPJQbUqJfPBDgSsngy53HaN7EVJxuEJ6XFLp3jxXM02
	aiq+2Imou6Yk4yJlpDg6Ksy8SgKUgVNlMdiAQBJ2zfjNdaVGNQNc3PrCiq1OB6FXQPm++d
	dIm6D349H/TxmeYqr4x0a2GP36S/DdBYTDwlBKDy9aH/y1evxmEdDdPDAKzifw==
Date: Tue, 7 Jun 2022 12:40:56 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "wangmy" <wangmy@fujitsu.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 22.0.3 -> 22.1.1
Message-ID: <20220607124056.78bad3b5@booty>
In-Reply-To: <1654518434-9263-3-git-send-email-wangmy@fujitsu.com>
References: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
	<1654518434-9263-3-git-send-email-wangmy@fujitsu.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 10:41:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166658

Hi wangmy,

On Mon, 6 Jun 2022 20:27:12 +0800
"wangmy" <wangmy@fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

There are lots of failures when testing with this patch applied:

  (EE) AIGLX error: Calling driver entry point failed

Here are some logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5275/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5318/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/5291/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/5338/steps/19/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/4202/steps/13/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

