Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id DD81C65CE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 05:11:21 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42wTwm52mxz1qxQK;
	Thu, 15 Nov 2018 06:11:20 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42wTwm4MxXz1qsJj;
	Thu, 15 Nov 2018 06:11:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id CC2RRkygaHas; Thu, 15 Nov 2018 06:11:18 +0100 (CET)
X-Auth-Info: 0QsrcybLJlNHFbdO/tJTp2XpP+m2HZuoRXBeVq5jVs4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 15 Nov 2018 06:11:18 +0100 (CET)
To: Khem Raj <raj.khem@gmail.com>, Alexey Brodkin <alexey.brodkin@synopsys.com>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
	<CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
Date: Thu, 15 Nov 2018 06:03:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 05:11:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/2018 05:57 AM, Khem Raj wrote:
> On Wed, Nov 14, 2018 at 8:00 PM Alexey Brodkin
> <alexey.brodkin@synopsys.com> wrote:
>>
>> This utility is used for creation of images containing
>> usable in run-time U-Boot environment.
>>
>> As of today this utility is added per-board like here [1]
>> for Intel Edison board, here [2] for Altera's SoCFPGA and
>> I may guess there're others so instead of adding another one for
>> ARC why don't we package it for each and everyone.
>>
>> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
>> [2] https://github.com/kraj/meta-altera/blob/master/recipes-bsp/u-boot/u-boot-mkenvimage_v2016.11.bb
> 
> If this is applicable/works for all u-boot based machines then I think it makes
> sense to have it on OE-core.

It is.

>> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>> Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>> Cc: Ross Burton <ross.burton@intel.com>
>> Cc: Marek Vasut <marex@denx.de>

Reviewed-by: Marek Vasut <marex@denx.de>

That said, could the recipe for mkimage and mkenvimage be somehow
deduplicated ? There seems to be a lot of common stuff.

>> ---
>>  .../u-boot/u-boot-mkenvimage_2018.07.bb            | 27 ++++++++++++++++++++++

btw why was U-Boot not updated using AUH to 2018.09/2018.11 ?

-- 
Best regards,
Marek Vasut

