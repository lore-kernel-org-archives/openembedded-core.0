Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E920FC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 21:05:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.241.1705525543456462866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 13:05:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=eqCkB+w9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F75660003;
	Wed, 17 Jan 2024 21:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705525541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D9nA2wPwrlH+mINCda5dQl6U9uhUgPRUJThAZwyOPJg=;
	b=eqCkB+w9ZCbvwcp6gTVREZ/YUIt/iZQpYP2iePie5kiJm5nZ75kxyWPeDQ2YGe4KH2nzdk
	9tIyWZilWg8EPsZ/0YeZrLUs85j0lmpHNnXewRcV6tB+GcGsKWBSgPSXicxJTZI7v+RfLl
	fw+rtxg1bj0J9jm/4KlJpafmr1Qnry7jZBw2io0UOAozXGiY+NJ7HNRI4y95qOz/kJCVwm
	J2pFvNuvX65SOYytzGBCS8LH9Eo6wgPRs9cQgXfkWkyAxER6cgvdwG1duOv/mOhQmsqhYh
	Oi0efgpa2H8AdJPN0JU1fIjWKeW3Z7SijMZpsHKkmlsVWiYScCOV43WcYrbQyQ==
Date: Wed, 17 Jan 2024 22:05:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Simone =?iso-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] classes-global/insane: Add check for
 "virtual/" in RPROVIDES and RDEPENDS
Message-ID: <202401172105400e51bf3b@mail.local>
References: <20240114171903.10264-1-simone.p.weiss@posteo.com>
 <202401162329150cb039e3@mail.local>
 <41a612e78d38e7132c2b07a83456e4664ee1b11a.camel@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41a612e78d38e7132c2b07a83456e4664ee1b11a.camel@posteo.net>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 21:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193947

On 17/01/2024 19:19:28+0000, Simone Wei� wrote:
> I see, the warning is correct and a fix should be applied to meta-
> oe/recipes-core/opencl/ocl-icd_2.3.2.bb for this, I will send out a
> patch for this as well. Afterwards this should be fixed implicitly.
> Just one question: Which branch is tested in the autobuilder for meta-
> aws/meta-op? Is it good enough if I just fix it on meta-oes main
> branch?

Yes, this would be master for this patch.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

