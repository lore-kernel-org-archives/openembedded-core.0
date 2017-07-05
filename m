Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 5D68960620
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 13:12:43 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3x2hB41Qtyz1qtHL;
	Wed,  5 Jul 2017 15:12:44 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3x2hB36212z3hhTq;
	Wed,  5 Jul 2017 15:12:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id mapH63_evdAh; Wed,  5 Jul 2017 15:12:40 +0200 (CEST)
X-Auth-Info: +HT4z7tjvBeT9ScB0rKc6Pqwt/EMoEVFBIAOISAvTMg=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed,  5 Jul 2017 15:12:40 +0200 (CEST)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20170704220128.28747-1-otavio@ossystems.com.br>
	<933095de-34ee-963a-cc7f-55f76956355c@denx.de>
	<CAP9ODKqi1vHHWx23hV2w9WaGBTucq277-pWyemQiJBt2SSsTDA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f8ad8c9f-4772-37bf-6e42-d26e6f4058c3@denx.de>
Date: Wed, 5 Jul 2017 15:12:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqi1vHHWx23hV2w9WaGBTucq277-pWyemQiJBt2SSsTDA@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Wed, 05 Jul 2017 13:12:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 07/05/2017 02:54 PM, Otavio Salvador wrote:
> On Tue, Jul 4, 2017 at 8:10 PM, Marek Vasut <marex@denx.de> wrote:
>> On 07/05/2017 12:01 AM, Otavio Salvador wrote:
>>> This patch upgrades the U-Boot to the 2017.07-rc3 release; for now it
>>> is not intended to be merged but to expose possible problems prior the
>>> official release so we may try to include fixes for final release.
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> ---
>>>
>>>  .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
>>>  .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
>>>  .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
>>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0
>>
>> NAK, you're updating to -rc3 yet mark it as final release , that's wrong.
> 
> Marek, did you READ the COMMIT LOG? I doubt you did.
> 
Doesn't really change the fact that the patch is wrong and it could be
done right very easily ...

-- 
Best regards,
Marek Vasut

