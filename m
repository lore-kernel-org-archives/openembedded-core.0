Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82121D68B2B
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 14:35:29 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.38555.1731594921001666563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 06:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h34w5otZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A690E0002;
	Thu, 14 Nov 2024 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731594919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+UzjWGF+HHiO4hfzXl64QamkPH1BS/eFwUSXtSan8c=;
	b=h34w5otZb7DSWashQJWlmY96dp80LTwJe8QShIq4KJbMlPx0/ATHs38diTNSM3rneFKqJa
	pq2w8snLAJiMFTD2KCUbetQyR5Szh1b8adxzHoxUiTCkKc4341/qbLG8AIgM3Yt595yJYT
	WKeG6Eqxv8i5RgWhMpH6mCiU2tblsbSa4Yx3ebg4BXE//8MGvS16S5Y7JONHcNAQLkyVPZ
	Qa+VLBT7H+b9ZW8O6p0mYBKHNZzoARicpVzGpK0NZds/cveVnx/tHexHRn99ItRAuD2JYo
	TQ8T8RiPFZ+2NEYoONGzZopFPHsfWOE8KezeYpX2MClUnzdVGp5osL/C3Kcs7Q==
Date: Thu, 14 Nov 2024 15:35:17 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: majortomtosourcecontrol@gmail.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com,
	yoann.congal@smile.fr
Subject: Re: [OE-core] [PATCH] uboot-sign: fix concat_dtb arguments
Message-ID: <ZzYKpSIigYU9Nj30@bootlin-mathieu>
Mail-Followup-To: majortomtosourcecontrol@gmail.com,
	openembedded-core@lists.openembedded.org,
	randy.macleod@windriver.com, yoann.congal@smile.fr
References: <b676cb1d-53f0-403d-969f-e0bfdaedc4cc@gmail.com>
 <72af1bc8-f20a-4fc8-926a-1418580f303d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72af1bc8-f20a-4fc8-926a-1418580f303d@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 14:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207168

On Thu, Nov 14, 2024 at 06:35:29AM -0700, Clayton Casciato via lists.openembedded.org wrote:
> Hello!
> 
> I am looking for feedback and/or the status for this patch.
> 
> Thanks!
> 

Hi Clayton,

This patch has now been merged in master:
https://git.openembedded.org/openembedded-core/commit/?id=b3c473785e5ceef677ff2b77c5fc17f5704c622f

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

