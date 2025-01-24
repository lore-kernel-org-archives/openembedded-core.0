Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AD5C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 20:11:50 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.2238.1737749506414808116
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 12:11:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50OK6WcQ023489;
	Fri, 24 Jan 2025 14:06:33 -0600
Received: from [192.168.2.133] ([192.168.2.133])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 50OK6V5v019354;
	Fri, 24 Jan 2025 14:06:31 -0600
Message-ID: <0bf5e226-62f7-4c69-b1e2-099defb6eac0@kernel.crashing.org>
Date: Fri, 24 Jan 2025 14:06:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] [RFC] bash: Drop /bin/sh from RPROVIDES
Content-Language: en-US
To: alex.kanavin@gmail.com
Cc: marex@denx.de, Khem Raj <raj.khem@gmail.com>,
        openembedded-core@lists.openembedded.org,
        Alexander Kanavin <alex@linutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250123201229.182266-1-marex@denx.de>
 <CAMKF1sohTGBUO0Lv3YWykjZg-6BB2Fcrd7x=g23iRxHe3TpqSg@mail.gmail.com>
 <a9914d2c-72c9-4cc0-b414-33d33d4c4f42@denx.de>
 <CANNYZj8XgBiaa9aqRPmETXzFgn1v-oeqN2-1zqugDAK6xuyYxQ@mail.gmail.com>
 <7adc6819-4e38-4dd0-b8fd-c80ed9f61d1c@kernel.crashing.org>
 <CANNYZj_ALxpN0N5bLkAFJN3w+EkkLdO3TaejoL7rQMvcajEg0Q@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CANNYZj_ALxpN0N5bLkAFJN3w+EkkLdO3TaejoL7rQMvcajEg0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 20:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210250


On 1/24/25 1:37 PM, Alexander Kanavin via lists.openembedded.org wrote:
> On Fri, 24 Jan 2025 at 18:58, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>> I'm more inclined to say that base-files depending on /bin/sh is the error.
>> AFAIK nothing in base-files should require /bin/sh (or are there post-install
>> scripts?).
> 
> There is a pre-install script, but it's for a long obsolete issue:
> 
> https://git.yoctoproject.org/poky/commit/?id=6f03a8d7ae383d63bfed8b85c06a697b86719004
> 
> Let's just drop it from the recipe, and then base-files won't depend on /bin/sh.

Agreed, base-files should be doing this kind of thing anyway.

--Mark

> 
> Alex
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210248): https://lists.openembedded.org/g/openembedded-core/message/210248
> Mute This Topic: https://lists.openembedded.org/mt/110778651/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

