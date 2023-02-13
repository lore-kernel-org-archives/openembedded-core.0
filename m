Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5287BC636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 21:07:10 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.27707.1676322421345321233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 13:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DIX+IzBK;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A0E69240008;
	Mon, 13 Feb 2023 21:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676322419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UFv/uvskGuEJXJnscy74JsszRLEQjdPV0qyEydiMotU=;
	b=DIX+IzBKgFmXkfku8X3lLN7QsfD4HAv6mFvBY57sXgE2URp/Q4XGiSss6ogbg5AOuCP+d0
	F911u8lddazVHW7gw36t0pDVMzim/mqYfulzba43D/APGJS/RrfEPBzGfFvxjXpvaq5dZX
	HSEhlRcHhFSu3ySBofBH+3xE9gvVbwMqlYI375UFYrdUQKX4j1C1WuXwCYktUIGxtSX5QO
	CXYE0wvgcCIXCrW2pLYypZ8mX1BvP5qOLomDO+nKguVRm91R/sVzpUspAIgI6K74jprjxD
	dMLOqKdi+OTzyzVWIXTEYgbe+Y+xLfOiGIO2FpaskX5iuSJXLrOphfugyT/1IA==
Date: Mon, 13 Feb 2023 22:06:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
	Pablo Saavedra <psaavedra@igalia.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe-core][PATCH] graphene: disable neon support on arm 32bits
Message-ID: <Y+qmcQVCcJ4F5LOA@mail.local>
References: <20230211082609.6471-1-f_l_k@t-online.de>
 <99d270db661ec96c2e6f5a864962aaade7fd7887.camel@linuxfoundation.org>
 <V6J0QR.2R35TSZ0OM8J3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <V6J0QR.2R35TSZ0OM8J3@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 21:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177114

On 13/02/2023 10:47:19+0100, Markus Volk wrote:
> Am Sa, 11. Feb 2023 um 09:05:05 +0000 schrieb Richard Purdie
> <richard.purdie@linuxfoundation.org>:
> > Can we tweak the comment to say why? Saying what it does isn't that
> > useful, saying why it does it helps to understand when it may be
> > removed in future. An example of how to crash it would be even better.
> > Was this just some some subset of 32 bit arm or all 32 bit arm?
> > 
> > Cheers,
> > 
> > Richard
> 
> Hello Richard,
> 
> I'm not affected by this bug, none of my machines has it but probably  the
> underlying problem is, that there are still issues with neon runtime
> detection and not all arm platforms are guaranteed to have NEON available.
> That said, maybe it would be better to add this as a PACKAGECONFIG, so
> people could at least manually enable neon support if they know it would be
> working for them?
> 

Can't we get that out of the tune?


> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177087): https://lists.openembedded.org/g/openembedded-core/message/177087
> Mute This Topic: https://lists.openembedded.org/mt/96893757/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

