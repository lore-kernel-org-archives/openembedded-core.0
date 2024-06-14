Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D966C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 15:44:40 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.15088.1718379879275980840
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jun 2024 08:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dLP++YKp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07BCB240007;
	Fri, 14 Jun 2024 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718379877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/pnYa36cUOO9rt3t3QIMMyUriosi8azjMZD8/UFLVaA=;
	b=dLP++YKpobX5SYcofeCpJjsW9Htpf3L5AD9Axkelhk001i0TzB3OwyqHRyDUcYsiXXW6aD
	eddXaABfqx+I/AZTa9GbBVUFbRS3pxENC3NpZh5WB/O06kTwKKdNiy1sfeISRZFuhWNT9q
	ZhMKmUguVP5+7Ien/Ounw2e5uPT1UWMaXdBl+xV1rDww1KvYhjzv7PtBm6h45F5sTBSP4O
	bGJsg1x8/bVBVU+uUJJiYUd1Ms/p3adJiz6XeNg/3ZGunWCTTT8DxaNKw7gK6OX2bo88ET
	vYHayRWKmURHqCFgVNHfCEQM4t9hXOJPI5ew9L70nDUOS7QI0PdSTTiY4mneiQ==
Date: Fri, 14 Jun 2024 17:44:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v11 0/3] pkg-database and systemd-sysext image
Message-ID: <2024061415443651f86cd6@mail.local>
References: <20240604065040.2771-1-johannes.schneider@leica-geosystems.com>
 <4a6b60ec8200956e25e031cd28bf1023cf02df3f.camel@linuxfoundation.org>
 <20240613130118d23ee04e@mail.local>
 <PAXPR06MB75346D4EB374F60FC978E6ABBCC12@PAXPR06MB7534.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR06MB75346D4EB374F60FC978E6ABBCC12@PAXPR06MB7534.eurprd06.prod.outlook.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 15:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200657

On 14/06/2024 09:35:59+0000, SCHNEIDER Johannes wrote:
> > I'm actually surprised it failed for you as v11 was successful on the AB
> > for me. Anyway, In the meantime, I dropped the series.
> 
> Aww, we were getting close; so the last iteration fixed the one
> remaining/troubling exception with the arm64+ipk? :-)
> 

This had v11 and was successful:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7033
in particular: https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3466

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

