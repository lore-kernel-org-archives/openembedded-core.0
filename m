Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9ADC77B71
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 10:29:32 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.5078.1681813768789375697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 03:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lGyjU5t0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3DD811C0003;
	Tue, 18 Apr 2023 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681813767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cl7cN0GFU6Yyxgsq1PObEnDvih7s4cqPE+rtFNI68/c=;
	b=lGyjU5t0KzCvJSYE3in4Rn1VEHDgnnV+pdB3rjcKYWdAm8w+UoV31frBdFHKAd8Hakw0EN
	baGjm1VHCy4n5Bz68oQbRcNOtdavVfWzEFYgJkz1Zs6H9enCVcX7M+uNzdGG02Hlvg0BHw
	yiGtuhtqkzwWmnHFofgBPuRmEtfQ9+X+T7RcqlQETCLqmuY4yM4DS/BW7JsqiStydKaXed
	o7sTXZCqJI+2vLOK3XcCTqrQxwlhHnYpVXLt7Np+xzbyjBfcQavUZeSINf/j8GHZ5wdOvy
	t9DwsS25s6XJJmYDtpymZ1uAyJfylDifFxgZza5RL0R7ta7wImY3TXpNj1spow==
Date: Tue, 18 Apr 2023 12:29:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Xiangyu Chen" <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] shadow: backport patch to fix CVE-2023-29383
Message-ID: <20230418122925.72d23e09@booty>
In-Reply-To: <20230418054951.228055-1-xiangyu.chen@eng.windriver.com>
References: <20230418054951.228055-1-xiangyu.chen@eng.windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 10:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180184

Hello Xiangyu,

On Tue, 18 Apr 2023 13:49:51 +0800
"Xiangyu Chen" <xiangyu.chen@eng.windriver.com> wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>

This patch does not apply on current oe-core master. It is based on an
old commit?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

