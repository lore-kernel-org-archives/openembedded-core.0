Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A19C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 13:17:01 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.45218.1671715019741596487
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 05:17:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HN9a6S8I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 77E4940006;
	Thu, 22 Dec 2022 13:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671715017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o12Auz5ELLVTfzYL9+R/no72SJ0P0Z1odtsjI1Suxxw=;
	b=HN9a6S8IfwjoTPmDPuunEg2KLGi6lXpV5lwqYH28CWLWq6t3gmuIDmE3aGWTPApovG+X0P
	u+0o+tI+bvHLbRDCbesq0b7F0DDKYdrz0syGXo8XMj/eHS+8kviv+J1ioCPlwxIDKlZsSK
	nYo/FMR9ycmKaXQ2D6sCdqtm6TvshzVOGDiLqnvCKjFbTLnkJg3eApYd2XDrnrMS2Yh/b2
	2OJhm3/7GtlOlleb0khPxWmfuGB72zYZUCvcwAgiyqamjHiMlmfvYBlQfKOfREh/LU1HXI
	7XyWtlMaZ7F/6oCPVUWCtYEFoU2oFQRZf0jfUvwnTPtwMShTxNNOdeAVXOQk/A==
Date: Thu, 22 Dec 2022 14:16:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yash Shinde <yashinde145@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] binutils : Fix CVE-2022-4285
Message-ID: <Y6RYyM/W1G88a+Iy@mail.local>
References: <Y6N0HxEZizm6amUL@mail.local>
 <28414.1671685571822882500@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28414.1671685571822882500@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 13:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174961

On 21/12/2022 21:06:11-0800, Yash Shinde wrote:
> Some updates were needed in the patch. So, posted a version 2 of it.
> 

I understand that but in the meantime, your colleague submitted a proper
patch and it has already been applied on master.

> Regards,
> 
> Yash

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174954): https://lists.openembedded.org/g/openembedded-core/message/174954
> Mute This Topic: https://lists.openembedded.org/mt/95811724/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

