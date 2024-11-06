Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055E0D44D47
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 10:39:06 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.42808.1730889539545112117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 02:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RGNmJurm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 58C47C0002;
	Wed,  6 Nov 2024 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730889537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YVd4MdDZceazjGPQR0JWasR8pLwyx5U8/VaQsCGompo=;
	b=RGNmJurmsKNqaVEFXJU0tOgVgs+nAHzq+3EHUuVCPJxTEBK1RV6AvgjZ7s2j67BJuQ5vGl
	ENoJDburuuzu/E13mYTFMLWtYNJ/g6UStFHOUBMws2pOQNhYpd1hJQTkICwI9/Sjl0Z3bA
	37x/3NGCvlDWc2pGBe3vzpPaLAbNUcA4LR9qQbbz7TYdtLppUqlaKBEQhXLLwGIWCZg2mW
	LRxY41wopQ7za+Tu/i/pUWMnOs943E2HXw8E8gG2cMt6gtsPLQzZTM1b4b+cnMAOuszpnj
	LAR4XS5zYTneIbEb2Z66KzIK0ULBXsCBvpsx+i3WuGqgLfpEbN871f9g1kSzOA==
Date: Wed, 6 Nov 2024 11:38:56 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 16/19] sdks: Add clang toolchain to SDKs
Message-ID: <ZytHQPBqHCH4scZZ@bootlin-mathieu>
Mail-Followup-To: Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20241105184540.3450302-1-raj.khem@gmail.com>
 <20241105184540.3450302-16-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105184540.3450302-16-raj.khem@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 10:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206763

On Tue, Nov 05, 2024 at 10:45:35AM -0800, Khem Raj wrote:
> Use SDK_TOOLCHAINS_LANGS to tether clang toolchain into SDKs
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for your patches, but I believe there is an issue with this one:
it modifies files in both openembedded-core and yocto-docs.

Could you provide the documentation modification as a separate commit ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

