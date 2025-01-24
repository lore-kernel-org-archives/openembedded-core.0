Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F4CC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 23:24:02 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web11.685.1737761032962951359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 15:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=IjqF3HL3;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6090108796E0;
	Sat, 25 Jan 2025 00:23:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737761031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvc9EUIIZB5cyLHjwLthIpHLKQ7fL5H48wChObN1s5M=;
	b=IjqF3HL3tEt5EiGpqaFEfDkgTBrrFlTVp3TRIpxUmx12gJ7JC8uzvlLC59L/nfyO21Izq7
	xrZOr2iHzdgN4Qntzk1/kjO6SQTfHEJiIIN1MDkeU5b7N0b3TCaD651llHS5GwojuId1vZ
	R/d1XeN6qLZBzwf+xQplGpSCkcV6H5suGG3ZiaRVrioNFIRZUhjFVdcWKplpRW3r1ativJ
	mTu3d1Nl/2OeKeFL53o26IjccczlmYBiWxrw6pI9roR3ZTY1fQMSHVVkmT6MGrWBuzjsCW
	OVVhAPj6HwcR0ypyF0j3X+wyJARqGrqpbb0EoVErCssoxUw1r3BITDOh+j0MGw==
Message-ID: <df9b3d7a-a5e2-4df8-8d6f-1d67c6defd15@denx.de>
Date: Sat, 25 Jan 2025 00:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
To: Mark Hatle <mark.hatle@kernel.crashing.org>, alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250123201229.182266-1-marex@denx.de>
 <CAMKF1sohTGBUO0Lv3YWykjZg-6BB2Fcrd7x=g23iRxHe3TpqSg@mail.gmail.com>
 <a9914d2c-72c9-4cc0-b414-33d33d4c4f42@denx.de>
 <CANNYZj8XgBiaa9aqRPmETXzFgn1v-oeqN2-1zqugDAK6xuyYxQ@mail.gmail.com>
 <7adc6819-4e38-4dd0-b8fd-c80ed9f61d1c@kernel.crashing.org>
 <CANNYZj_ALxpN0N5bLkAFJN3w+EkkLdO3TaejoL7rQMvcajEg0Q@mail.gmail.com>
 <0bf5e226-62f7-4c69-b1e2-099defb6eac0@kernel.crashing.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0bf5e226-62f7-4c69-b1e2-099defb6eac0@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 23:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210257

On 1/24/25 9:06 PM, Mark Hatle wrote:
> 
> On 1/24/25 1:37 PM, Alexander Kanavin via lists.openembedded.org wrote:
>> On Fri, 24 Jan 2025 at 18:58, Mark Hatle 
>> <mark.hatle@kernel.crashing.org> wrote:
>>> I'm more inclined to say that base-files depending on /bin/sh is the 
>>> error.
>>> AFAIK nothing in base-files should require /bin/sh (or are there 
>>> post-install
>>> scripts?).
>>
>> There is a pre-install script, but it's for a long obsolete issue:
>>
>> https://git.yoctoproject.org/poky/commit/? 
>> id=6f03a8d7ae383d63bfed8b85c06a697b86719004
>>
>> Let's just drop it from the recipe, and then base-files won't depend 
>> on /bin/sh.
> 
> Agreed, base-files should be doing this kind of thing anyway.
This works too, v2 sent, thanks !

