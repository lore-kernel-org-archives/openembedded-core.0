Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644EDC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 08:17:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.61271.1643789852809587624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 00:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=YW/r7BGh;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 50E95832DA;
	Wed,  2 Feb 2022 09:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643789849;
	bh=zcHcFyk87EsCcYO3Dn7VHWyAVdu9Mgi3lVGTo0d08bs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YW/r7BGhyhbymn29jw2Mld4fSLb54kHM96KAP4BDEaq8Dux5riAFH2L3SzjLPG+H3
	 gyBYNc9Bmn94vl+WOeF42B85X5qRQvrC4mor7TYWkHcNzc+LPQXKUZsb45pcmBD5fL
	 gDDe06nhKcsYI459xkkq5HBPos9luqgUcRftu++FNkwu0UPfobZJSKUbCCPbAWjz0p
	 pbLH8LCsMzfJ6UKoWZxDq2DXDKgklgvnVR3SSI0oRrm8UOUEGEZTZGOrsEe2e/wsAu
	 F9RI8YSVsm9ukWd6bderCeeSWi/dhsnYJRgooR7ken5VJfAyvhAo0JnqBOsYOhiyMN
	 zeqog0OO1ql8g==
Message-ID: <95a6175a-16c8-9676-0918-f69828b8d6ec@denx.de>
Date: Wed, 2 Feb 2022 09:17:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [OE-core] [PATCH] Revert "featimage: refactor style"
Content-Language: en-US
To: "Valek, Andrej" <andrej.valek@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
References: <20220129002907.84534-1-marex@denx.de>
 <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
 <315161c5-6b68-2b4c-37fc-3d10459fdbf8@denx.de>
 <53514b34002e424584e20150b6b725a7@axis.com>
 <cd82c692-f11c-0e1d-4b53-950121e0b3bc@denx.de>
 <c864b18a0e354116059c25ddf03096c90cf8bbca.camel@siemens.com>
 <251fe11a-7348-086f-364b-b9940fff3d68@denx.de>
 <613436ece6c481bbd5efda1774bb45be2960988e.camel@siemens.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <613436ece6c481bbd5efda1774bb45be2960988e.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 08:17:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161184

On 2/2/22 07:51, Valek, Andrej wrote:
> Marek,

Hello Andrej,

> Sorry, but these are still not an arguments, why to do that.

I'm sorry, I am lost and confused ... what part of the email are you 
referring to ?

> On Mon, 2022-01-31 at 10:39 +0100, Marek Vasut wrote:
>> On 1/31/22 08:01, Valek, Andrej wrote:
>>> Hi,
>>
>> Hello Andrej,
>>
>> (please avoid top-posting)
>>
>>> Sorry, but personally I don't like your idea. What's the benefit of
>>> reverting this? I would keep the ${} for bitbake and $ for shell. The
>>> {} has to be placed only for variables like $a${b}c.
>>
>> That's exactly the benefit of using ${} in shell scripts consistently -
>> -
>> you don't have to worry about variable names being accidentally
>> conflated with surrounding strings, either due to your own mistake, or
>> some automated transformation that was applied incorrectly .
>>
>>> We should respect the workflow on all recipes otherwise we're braking
>>> the "unwritten" rules.
>>
>> The workflow on all recipes ? What does this mean ?
>>
>> broken by people. Better update the documentation.
>>
>> There is one technical counter-argument to this revert from Peter,
>> quote:
>> "
>> There is actually a technical reason to not use ${foo} for shell
>> variables unless necessary in bitbake files and it is because
>> bitbake will treat them all as potential bitbake variables. This
>> means they are unnecessarily included in the taskhashes that
>> bitbake calculates.
>> "
>>
>> But the patch being reverted here addresses the problem only partly,
>> because it still contains remnants like this:
>> "
>> conf_desc="$conf_desc${sep}setup"
>> "
> Just for your information, this is not remnants, this is exactly the
> right {} usage. If you didn't place the {}, it will be
> conf_desc="$conf_desc$sepsetup", which doesn't  make any sense.

OK, one more time then.

Either your patch attempted to change the coding style of this script to 
match your personal preference, and did it only partly, so the result is 
inconsistent.

Or

You were fixing the aforementioned taskhash issue, in which case the 
taskhash issue is also fixed only partly.

The commit message is not clear on what the intention was.

[...]

