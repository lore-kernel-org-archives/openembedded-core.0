Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C269EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:32:43 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.3247.1687365155672012492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LlepoXw3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
X-GND-Sasl: michael.opdenacker@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687365153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GBUm4CejLcTTm/eK+nl+b7fSiI4/k9sN9z5WyooBnyk=;
	b=LlepoXw3PpzBvkfUWnHcdUdaiNUcprig2dNRMImeieyyOfHsGs+n0dTyre7dU1RpL+7IJj
	cvq0Do2zTwz3ahsKvMKwSswKiZsiNSwvkP8uzFnk+xcstokAWsqZZdM6D8VgadxqeOUVcI
	rva177UB2Xp9IsFk7kz80i9nXZYb4csX02qEhudEZnVSbc8bl05tWDW/d4qPbPieP0qtCY
	bnIXozIZzjASAaGNKj2TOK3Z3as082XcMHBAKXgDHFV7cXc7sffx0FW5QSvySmCAZRxIJf
	KuiYozNo85VoJzfs+TpZlPM3lmM4MSFeMOiZQg6ydMRKCqI3zaAvgtLSsxNa7w==
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
X-GND-Sasl: michael.opdenacker@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B10AD240004;
	Wed, 21 Jun 2023 16:32:32 +0000 (UTC)
Message-ID: <eb7e5f60-8780-d133-7dfc-21177f50844f@bootlin.com>
Date: Wed, 21 Jun 2023 18:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: Ming Liu <liu.ming50@gmail.com>, francesco.dolcini@toradex.com,
 max.krummenacher@toradex.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20230530170949.12045-1-liu.ming50@gmail.com>
 <ac8e3e09-f847-b131-98c6-cad0cdbdf4ad@bootlin.com>
 <CADkTA4OsL0HeFhjeU1vRTADqir_OyqHTMQetn-Q8-6woimRUMQ@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CADkTA4OsL0HeFhjeU1vRTADqir_OyqHTMQetn-Q8-6woimRUMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 16:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183188

Hi Bruce,

Thanks for your help.

On 21.06.23 at 18:17, Bruce Ashfield wrote:
> linux-yocto uses a different mechanism for setting this (and will
> continue to use that existing mechanism).
>
> So this would work in absence of a kernel recipe using CONFIG_LOCALVERSION.


That's good to know from a documentation perspective :)

I'm using "core-image-minimal". Is there another standard image I can 
build that wouldn't use linux-yocto then (if I understood correctly)?

I want to make sure people know how to use this variable, because 
without further information, I expected that information to be used by 
linux-yocto.
Thanks
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


