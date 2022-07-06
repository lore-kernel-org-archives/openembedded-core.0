Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C9EC43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 13:29:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6106.1657114162770376675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 06:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AB0a9umQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2FB47240006;
	Wed,  6 Jul 2022 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657114160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=D9HUfX2XqIu4qoY8v5qTaK5uZJgU4TKCDj3HqFPzuAI=;
	b=AB0a9umQs4zAYfU9yhaWloZJlFGW7WELinn+4+LfgAoaUsffJOe3ecOaiQvICsIVJXtnLo
	vVCVnKPigZfVJJIQW0+HH3BGnZOCGAVO/3ITDetQBDV70WoPKi9k9Y+z8Rdr6HYpDMhhvZ
	8NM9ND7sSdqkmSKmb1F+EM3FWZbF/elTYccp7PD6FhPOnh55O/+lkGLbet+O1uDB7TOe5m
	vc9IvWt2jpdgnoU0n8Od13SMqHUH3CtzULRE9+pns2ZxHnnzqZn1oDF6SJWHTw4Dh3ecm4
	0Kl2p7FUgSxWGZqhDnv3gyFfBMEipongchfaTnULWSg0qmpwYGK63jLwB4iZ0Q==
Date: Wed, 6 Jul 2022 15:29:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: linux-yocto 5.15.48 reproducibility failure
Message-ID: <YsWOLwlNxhAq7sKz@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 13:29:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167724

Hello Bruce,

I got the following reproducible build failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1116/steps/12/logs/stdio

To me, it looks like the in-kernel config changed, did the compression
alg change?

Are you able to look at that soon or should I file a bug?

Regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

