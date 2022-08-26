Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76914ECAAD6
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 10:37:45 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.35266.1661510263904059177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=i6lhz3/N;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6091F100003;
	Fri, 26 Aug 2022 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661510262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsQKqIrQJsgiY2vP4793985sh4uTMLu8Zcy4jDu8EZY=;
	b=i6lhz3/NljRdC4JYUVEGNDY7kj+l4ku4Dl/jJCgRvX0yvMCEuY/p9vYl5jXiJ5Vdyk/LZg
	fjLbaNpj/P2MZRQPGug5NN4RNOxLadm0vHKXKtlRMFZTLaDyi+wypWEicztV0JlC3XBUqt
	5xwmC1k/HmhAFS2ooWmFW4bAYsUizwUiH2Ynp0uNZ+sB37F6k+xAST3TVb5Zk3I6DpSxIn
	t8dm4cOBzhiWMSkC2AlU56+Py52lk0hj8iEtYDbISx+SpyoKICQGkJRVqbyy66piqlrHXq
	5qOP738C/IPs1LzqapwptNIbppozK/J/lH/lapw3w0S+laZ9JdoOFxts1qDEjQ==
Date: Fri, 26 Aug 2022 12:37:40 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 4/5] scripts/oe-setup-layers: add a script
 that restores the layer configuration from a json file
Message-ID: <20220826123740.7641ee5f@booty>
In-Reply-To: <20220825203451.2074080-4-alex@linutronix.de>
References: <20220825203451.2074080-1-alex@linutronix.de>
	<20220825203451.2074080-4-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 10:37:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169909

Hi Alex,

On Thu, 25 Aug 2022 22:34:50 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> This script can be used directly from poky or oe-core, or can be copied directly
> into alayer or any other repository - it is self-suffucient and requires only python3

alayer -> a layer
suffucient -> sufficient

Added to my testing branch with those typos fixed.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

