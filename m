Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB15C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 23:07:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.335.1668035262635431128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 15:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BofYXYGm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 607D6E0002;
	Wed,  9 Nov 2022 23:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668035260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xotB0W/GkhQDJQwsoeTDJsdEx6K1P3mV3sW7JYL/Byw=;
	b=BofYXYGmE4rEAlGyOTrC/3BSZF4AjONjbKdOYA3jiOkmYuD/53RypIMwosfy6XzeQyxVsN
	3SD9vCdxk2Ia1mOD7U/3OHPT5szBQPMQfWNPoU8imTN1hn+Nwn9tyn+I6BgJdeVZXf6Dnk
	xYs6vG/6bC42U1hhHhn+jLto7m+llm1EVIhfn5hP0R0Z9/zKONGuK3Eml4c9DJs3cpbb3L
	JNlgR+x/eS5kMaGrSl8rMUKcF2t1cmT/fW9KXhdMEVyCiOEgSCRhvlB8ac+CwgrGu4XVuv
	3xCT5ItBSHvmUa14MiGmRoTM/xShIzZVi2/Er872yAQfGlgYd6rxadb/1fvEjw==
Date: Thu, 10 Nov 2022 00:07:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
Message-ID: <Y2wyumeMw77ATwDl@mail.local>
References: <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
 <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
 <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com>
 <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
 <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com>
 <ea92c4e3fda1e06defc28532e8f0b1c7205e09c1.camel@linuxfoundation.org>
 <c4d27774-ec17-e171-6470-1730441b5b02@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d27774-ec17-e171-6470-1730441b5b02@seco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 23:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173062

Hi,

On 01/11/2022 13:54:18-0400, Sean Anderson wrote:
> > That would result in a lot of messages on the mailing list and ends up
> > being a lot of work for the maintainers as well.
> 
> If you use a tool like b4 [1] it can automatically generate a summary thank-you message.
> As an example, [2]. This keeps the number of messages down and is not terribly
> burdensome for maintainers (since it fits into the usual patch workflow),
> 

I was also surprised to not receive confirmation that my patches were
applied. However, unfortunately, b4 is not working with our current
workflow as I am applying the patches and providing tested branches to
Richard that he is cherry-picking from.

> You can set up something like pwbot [3], which integrates with patchwork
> and your repository. It produces messages like [4] automatically when it
> notices they have been merged into the repositiry, and marks them as
> "Accepted" in patchwork. This is even lower effort for your maintainers.
> 

This would integrate better but I4m not sure we have a pw instace for
every repository that compose poky.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

