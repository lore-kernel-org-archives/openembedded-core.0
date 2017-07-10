Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3051177C98
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:07:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3x5vpq5Fl5z1r0WN;
	Mon, 10 Jul 2017 21:07:15 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3x5vpq4Mtyz3jgXt;
	Mon, 10 Jul 2017 21:07:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id HoN15f9_UwuU; Mon, 10 Jul 2017 21:07:14 +0200 (CEST)
X-Auth-Info: 6vw+v1QVLqw09ABy7+EFQWcdDi85wkfMqubLJAAH/OU=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 10 Jul 2017 21:07:14 +0200 (CEST)
To: Tom Rini <trini@konsulko.com>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
	<CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
	<7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
	<20170710190128.GE22707@bill-the-cat>
	<ce1cd8f5-1c41-87c0-57b4-d92abb3c177e@denx.de>
	<20170710190621.GF22707@bill-the-cat>
From: Marek Vasut <marex@denx.de>
Message-ID: <707cff08-5ec0-e6e2-3040-7b248d20f33f@denx.de>
Date: Mon, 10 Jul 2017 21:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170710190621.GF22707@bill-the-cat>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 10 Jul 2017 19:07:15 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 07/10/2017 09:06 PM, Tom Rini wrote:
> On Mon, Jul 10, 2017 at 09:02:39PM +0200, Marek Vasut wrote:
>> On 07/10/2017 09:01 PM, Tom Rini wrote:
>>> On Mon, Jul 10, 2017 at 08:57:19PM +0200, Marek Vasut wrote:
>>>> On 07/10/2017 08:51 PM, Otavio Salvador wrote:
>>>>> On Mon, Jul 10, 2017 at 3:47 PM, Marek Vasut <marex@denx.de> wrote:
>>>>>> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
>>>>>>> This patch upgrades the U-Boot to the 2017.07 release.
>>>>>>>
>>>>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>>>>>> ---
>>>>>>>
>>>>>>>  .../u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc}     | 2 +-
>>>>>>>  .../u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb}   | 0
>>>>>>>  .../u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb}     | 0
>>>>>>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb}        | 0
>>>>>>>  4 files changed, 1 insertion(+), 1 deletion(-)
>>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc => u-boot-common_2017.07.inc} (88%)
>>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb => u-boot-fw-utils_2017.07.bb} (100%)
>>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb => u-boot-mkimage_2017.07.bb} (100%)
>>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb => u-boot_2017.07.bb} (100%)
>>>>>>>
>>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>>>>>>> similarity index 88%
>>>>>>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
>>>>>>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>>>>>>> index 0e52f27df8..f27989daa1 100644
>>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
>>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>>>>>>> @@ -7,7 +7,7 @@ PE = "1"
>>>>>>>
>>>>>>>  # We use the revision in order to avoid having to fetch it from the
>>>>>>>  # repo during parse
>>>>>>> -SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
>>>>>>> +SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
>>>>>>
>>>>>> Where did you get this hash from, it's not in the U-Boot repo ...
>>>>>
>>>>> From the tag used by Tom. You can check it on his github repository.
>>>>
>>>> I cannot, that is NOT where the U-Boot recipe points to nor is it in any
>>>> way an official U-Boot source git tree .
>>>
>>> It's also on the official github mirror.  I'll go see why the DENX git
>>> is lagging behind.
>>
>> Hm that's weird. How can it be a mirror if it contains objects not in
>> the mirrored repo ? ;-)
> 
> git supports multiple push URIs.  So I update all 3 locations with a
> single push.  However, git.denx.de works differently than github.com
> does.

So it's not really a mirror, just another repo, OK.

-- 
Best regards,
Marek Vasut

