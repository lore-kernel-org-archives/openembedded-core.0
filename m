Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1E974A0C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 16:40:21 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40cLVG1kJPz1qwws;
	Thu,  3 May 2018 18:40:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40cLVG1FZCz1qrfv;
	Thu,  3 May 2018 18:40:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id JsH1-G0nfi9j; Thu,  3 May 2018 18:40:21 +0200 (CEST)
X-Auth-Info: +vN9D/+bWFXcoNmKb/KFNRiLLL3LMNCMG6X51iHGs0A=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu,  3 May 2018 18:40:21 +0200 (CEST)
To: Stefano Babic <sbabic@denx.de>, Lukasz Majewski <lukma@denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
References: <20180427145139.30732-1-lukma@denx.de>
	<fe2ffe1d-6695-f0bd-dc6c-d5345bcfbc3f@denx.de>
	<cef99ffe-3f4e-547d-318e-a7bc60ebdb2b@denx.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <2a2d73fb-edec-f179-8693-6efb0942a979@denx.de>
Date: Thu, 3 May 2018 18:36:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <cef99ffe-3f4e-547d-318e-a7bc60ebdb2b@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] u-boot: Add {gen|deploy}_default_envs tasks to generate environment images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2018 16:40:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/03/2018 06:28 PM, Stefano Babic wrote:
> On 27/04/2018 17:07, Marek Vasut wrote:
>> On 04/27/2018 04:51 PM, Lukasz Majewski wrote:
>>> This commit provides the ability to generate u-boot environment(s) as
>>> images, which afterwards can be used to produce image (with wic) for
>>> flashing (eMMC or SPI-NOR).
>>>
>>> This change removes the need to run "env default" during production phase,
>>> as proper environment (including redundant one) is already stored on
>>> persistent memory (the CRC is also correct).
>>>
>>> Signed-off-by: Lukasz Majewski <lukma@denx.de>
>>
>> If your default env is correct, why do you need this ? I can see some
>> use with non-default env, but then that can be wrapped into a separate
>> recipe.
>>
> 
> A use case is when the environment must be changed from user space.
> fw_setenv will report the CRC error and it needs the default environment
> to add changes. The default environment is linked together to fw_setenv,
> but this prohibites to use fw_setenv for multiple boards and must be
> explicitely built for that machine and with the same sources as u-boot
> (at least, they must share the same CONFIG_EXTRA_ENV). If the default
> environment is extracted, we could have a general (distro ?) fw_setenv.

I think in that case, the real solution is to either build fw_setenv per
machine OR fix fw_setenv to take env defaults from a file or somesuch ?

[...]
-- 
Best regards,
Marek Vasut

