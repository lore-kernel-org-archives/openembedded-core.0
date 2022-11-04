Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B281C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 14:28:21 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.11810.1667572093242020602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 07:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z4aAXRgt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F3F211C000F;
	Fri,  4 Nov 2022 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667572091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GE9yDDxX2tDAdZPOojCfIHLnH9LZRXDJZCTdhNIKBtA=;
	b=Z4aAXRgte+xAwSZEEziQbbqhuk0hZI+h0FuLcTWyYYJyQs6AGfORHmU4twtYbZ8BMQXJe2
	y7F7YaAWh9BA9I8mZVMMfZf9ay3JLo96VN4yxQZgHoFh1OzRYLsysbsXFaQ12o6OyvEf7B
	GOozO8BRp3lru65TRTcRa++Jr39pg/UqXMFQDXObYconLkh5uWLdXOBQLErQeCo9KTcYkN
	dw28/ho6UpYnbTpBseFUoktRoAsDHiG+TcbqJGhBqQ21LgIa8Nz6A7y3zueZt/uAORyFmn
	nIF+GoVLDMs5ndR4ifYgkJreMVN3bBswYOlIsa2lraIddsFwrhf0Qfq+AtMupg==
Date: Fri, 4 Nov 2022 15:28:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/1] add python3-brotli_1.0.9 in
 meta/recipes-devtools/python
Message-ID: <Y2UheZ34RKrk8Avg@mail.local>
References: <cover.1667525891.git.cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667525891.git.cp0613@linux.alibaba.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 14:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172715

Hello,

On 04/11/2022 10:02:08+0800, cp0613 wrote:
> The following changes since commit 6050d1f74c02495490d982ead2993b6b3c9cc04a:
> are available in the Git repository at:
> 
>   https://github.com/cp0613/openembedded-core brotli
>   https://github.com/cp0613/openembedded-core/tree/brotli
> 
> cp0613 (1):
>   add python3-brotli_1.0.9 in meta/recipes-devtools/python

This fails on the autobuilders:

The following recipes do not have a HOMEPAGE. Please add an entry for HOMEPAGE in the recipe.
python3-brotli (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-devtools/python/python3-brotli_1.0.9.bb)

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
python3-brotli (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-devtools/python/python3-brotli_1.0.9.bb)

> 
>  .../python/python3-brotli_1.0.9.bb            | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-brotli_1.0.9.bb
> 
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172658): https://lists.openembedded.org/g/openembedded-core/message/172658
> Mute This Topic: https://lists.openembedded.org/mt/94798159/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

