Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id EFC5A77C98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 18:57:20 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3x5vbN60DGz1r0WP;
	Mon, 10 Jul 2017 20:57:20 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3x5vbN57bMz3jgXt;
	Mon, 10 Jul 2017 20:57:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 0wd_sNdHS7Em; Mon, 10 Jul 2017 20:57:19 +0200 (CEST)
X-Auth-Info: qVqhJAITbZ4+Pxzd24A5baVCdqRn60UCcQLd3/6hQBY=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 10 Jul 2017 20:57:19 +0200 (CEST)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
	<CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
Date: Mon, 10 Jul 2017 20:57:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Mon, 10 Jul 2017 18:57:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 07/10/2017 08:51 PM, Otavio Salvador wrote:
> On Mon, Jul 10, 2017 at 3:47 PM, Marek Vasut <marex@denx.de> wrote:
>> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
>>> This patch upgrades the U-Boot to the 2017.07 release.
>>>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> ---
>>>
>>>  .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
>>>  .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
>>>  .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
>>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0
>>>  4 files changed, 1 insertion(+), 1 deletion(-)
>>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc} (88%)
>>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} (100%)
>>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb} (100%)
>>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb} (100%)
>>>
>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>>> similarity index 88%
>>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
>>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>>> index 0e52f27df8..f27989daa1 100644
>>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>>> @@ -7,7 +7,7 @@ PE = "1"
>>>
>>>  # We use the revision in order to avoid having to fetch it from the
>>>  # repo during parse
>>> -SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
>>> +SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
>>
>> Where did you get this hash from, it's not in the U-Boot repo ...
> 
> From the tag used by Tom. You can check it on his github repository.

I cannot, that is NOT where the U-Boot recipe points to nor is it in any
way an official U-Boot source git tree .

-- 
Best regards,
Marek Vasut

