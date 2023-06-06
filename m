Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A638C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 13:37:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.105.1686058619761276231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 06:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D8otYWmb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686058617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LqxfEaGjOTozbhENPHUhaFGgPoiyJPl0b8MNyraki0I=;
	b=D8otYWmbd33DihwTSAnnq9EYfK1mtlPazorkq0cbadE8qeokFOM7ITFQtT5VmMTC/qigCj
	ujB95K1jeXv1w5/khrIJpo4FL4RbdFCRRJD37PPTWLoVnVc3scdtiyiBkBeRh1Tc3m6LvR
	exSfAKzy/Yfozk4GPFB4dJG5l/NQs0QssEi89pdxMeVrCClBGLlxJeBK1Yi8V9s3tPm2lw
	uKm5ZBnSUIwDIGkkHGlVgiNMjh2pro9GyiErSj6wl23jsMLF5JWVMR/xeJExD/kFYz4RmW
	aRKPmbnNa26zT8AvMeGyvbAee85hmW0sI+xuWKNMZYXkoedV0VkEvrp9G+a2TA==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5773E60014;
	Tue,  6 Jun 2023 13:36:57 +0000 (UTC)
Date: Tue, 6 Jun 2023 15:36:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] vulkan-validation-layers: add new recipe
 v1.3.243.0
Message-ID: <202306061336568b9602db@mail.local>
References: <20230604041127.35885-1-vince@underview.tech>
 <18914.1685851972901762862@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18914.1685851972901762862@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 13:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182439

On 03/06/2023 21:12:52-0700, Vincent Davis Jr wrote:
> Requires spirv-tools base_libdir fix to be merged.
> 
> https://lists.openembedded.org/g/openembedded-core/message/182353

Then this should be a series instead of separate patches.


> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182355): https://lists.openembedded.org/g/openembedded-core/message/182355
> Mute This Topic: https://lists.openembedded.org/mt/99316446/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

