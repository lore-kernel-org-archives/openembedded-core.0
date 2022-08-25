Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F70C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 13:37:19 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.23907.1661434636259215233
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 06:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ncmimGeB;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 52CF0200010;
	Thu, 25 Aug 2022 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661434634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=li9n536bh3XZuyBTbimGPqa6oG7WO/xb2RUC3BcWaR8=;
	b=ncmimGeB1+PZ28bAZGboSOltVt2FccSm0ZlCy5ZcoFNNeODgWXLfopdZZFgAuGwATekNJ5
	Li/nT2W+W+InGt0iMQn+PB4H2KAJd3/KJX7VGyx8FtrERKveudLDXYorjE4QyDRJZtY12/
	d5x8B4UjuSgSFbucFAfzwYS9f7EOn6M7BVjNRRLbQ885DqKzpZRsDmccc/88eoJ734r6rs
	I3Kewz6/1vmzgiWbx4J4PO6RjnepL4QW2IDnrw/Naz3kvb4gNb/D3f+WQvWpbhR/8V9eXC
	3XyZKvkuhihZBheMFzZeuOrqRoD80AMLkrij6i8i8tGC2r551phJ5/u0jvn5LQ==
Date: Thu, 25 Aug 2022 15:37:12 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 1/2] meta/conf: move default configuration
 templates into meta/conf/templates/default
Message-ID: <20220825153712.55f446b1@booty>
In-Reply-To: <20220824124234.3549247-1-alex@linutronix.de>
References: <20220824124234.3549247-1-alex@linutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 13:37:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169865

Hello Alex,

On Wed, 24 Aug 2022 14:42:33 +0200
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> This sets the ground for standardizing (and enforcing) the location of
> configuration templates: let's start with the default one.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

I have been trying to apply this patch, and it applies on oe-core, but
then combo-layer fails in picking it because poky has a different
.templateconf file. I'm not sure how this should be fixed, maybe the
patch should be done against meta-yocto (which has a .templateconf
identical to the one in poky)?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

