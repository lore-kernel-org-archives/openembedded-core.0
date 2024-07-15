Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCFB0C3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 12:26:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.36801.1721046375101054004
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 05:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y93xLFzK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80E5440009;
	Mon, 15 Jul 2024 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721046372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x3P9heSH2WsBiVt0KUOkdVBKuKDlNcZjCoaNYq+X4FE=;
	b=Y93xLFzK9EPfYetZT7XukDek+LNhJv7E14SuDjYl/hZULrmWFnhzaxeg0ffEolOJDdPdxt
	DS1NxtjuGQvfWvv0lm67S3Bqvh1fbaf4HATZE+Sav2uTZTCyJRfogmJMTM6XGOoqQ3Rrkf
	DJ6xINBHDVQY3CKsfPx2gy++WwpbBEc6HJ9UH1wyRtFrJZTGa/ckhfXbgAe3BY5Lmo0waa
	cbBPmeKoHzNea0D553WTr/B3fpFvIjKszbgrjsE+Lo1ALkhCCA2JCGDg8PrRw9QYziw9vh
	KDha8Ah1FhzpeFjWzKQuLcVpScg2fAy/tLGVm47uqmzopGsmcrp4NKg6cipPFA==
Date: Mon, 15 Jul 2024 14:26:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>, kweihmann@outlook.com
Subject: Re: [OE-core] [PATCH v6 0/2] image-bootfiles: new class
Message-ID: <2024071512261243271aac@mail.local>
References: <20240710085310.147425-1-marcus.folkesson@gmail.com>
 <ZpTzJ5Qkid1oy8AT@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpTzJ5Qkid1oy8AT@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 12:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201920

On 15/07/2024 12:00:07+0200, Marcus Folkesson wrote:
> 
> I think this is ready to be merged unless someone has any objections.
> It has been under review since June 19, v6 that I sent out just under a
> week ago just adds Reviewed-by tags to the commit messages.
> 

I didn't carry this in my branch yet so it has not been tested but I'll
do this this week.




-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

