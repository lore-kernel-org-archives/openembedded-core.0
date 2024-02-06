Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868CFC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 21:14:26 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.4910.1707254057815584095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 13:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BqTcB5/N;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F49220004;
	Tue,  6 Feb 2024 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707254056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=trjDtOwizm8rApjZD8Vvluw/6cn+MPwEOV7PXjLjIKA=;
	b=BqTcB5/ND9k3D0Yu6hWrFdqpKnOnrxy9ahOxwaIrRDysNgNlZqkcf8wJbBh0wE8Dbl6Q6j
	QGq416htCmY9nGc3WYWgJkecKmSLK6k4GyQoytxUcXPoUJ4k548l993grIwdBL6ord8jB5
	X7uqh+TsRVVLLSatm3y4QeySnHIFZ6qE4s6KxwwFq+Mbr8ezpplCXrPr2fsCsI+FRRjfse
	vmunMFqkDLdBHa3AccCCvd0XflR6h7sRj18VyW4DJ9gBT800sq2oBB5+1Lp0wk1H8C/qgj
	pj0fx6wmMpdhGgAK1Ul0KFkPAlciaJjJd19+aTmbYFXmGt95cj6p6Ldt8vG1Sg==
Date: Tue, 6 Feb 2024 22:14:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jermain Horsman <jermain.horsman@nedap.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Andrey Zhizhikin <andrey.z@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
Message-ID: <20240206211415a1a984ff@mail.local>
References: <20231206092536.2874022-1-andrey.z@gmail.com>
 <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
 <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
 <CANNYZj8-9PHqeiRuExw+kdPhCNspCERzH1zKA9O7L06F=bx27w@mail.gmail.com>
 <VI1PR10MB31822295979B4CE4CDB89E8EF784A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
 <17AF75010791E9CF.16460@lists.openembedded.org>
 <CANNYZj-zu9+a_zX21YWjN_SF0kL+rm=Fu5000s=an17r3SUaiQ@mail.gmail.com>
 <20240206190246a3a66e24@mail.local>
 <CANNYZj9nB+-L2V1rpyfnTrz5=Y-6GDd9bggtL50C35DbMFvoEQ@mail.gmail.com>
 <VI1PR10MB3182DDD4183D1C53662DF392F7462@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR10MB3182DDD4183D1C53662DF392F7462@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 21:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195034

On 06/02/2024 19:23:58+0000, Jermain Horsman wrote:
> > RP didn't take them for a while and they conflict with your other series
> > that I wanted to test. I moved those to my staging branch so I remember
> > to come back to them.
> 
> At a quick glance it's probably because we both updated the end of the selftest file.
> Anyway let me know if/when I need to update anything.
> 

Yes it would be great if you could rebase on top of my master-next.

> Sincerely,
> 
> Jermain Horsman

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

