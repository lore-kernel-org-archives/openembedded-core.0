Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 774C778740
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Nov 2017 19:52:09 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3yfQcB20Ljz1qsTK;
	Sat, 18 Nov 2017 20:52:10 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3yfQcB1GLGz1qqkM;
	Sat, 18 Nov 2017 20:52:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id r-6S_FsBsFiZ; Sat, 18 Nov 2017 20:52:07 +0100 (CET)
X-Auth-Info: /9MPGQA53UmSE4tAUn7y8rd6JXTL9bqMMEjR6LX+DXE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 18 Nov 2017 20:52:07 +0100 (CET)
To: Tom Rini <trini@konsulko.com>, Ed Bartosh <ed.bartosh@linux.intel.com>
References: <20171114183223.7804-1-otavio@ossystems.com.br>
	<c19104c9-f988-d406-650e-2c9d7d74babd@denx.de>
	<20171117205918.GX9986@bill-the-cat>
	<50bf044c-899c-cd0a-84fb-af563ee46546@denx.de>
	<20171118141419.GZ9986@bill-the-cat>
From: Marek Vasut <marex@denx.de>
Message-ID: <31a42ea0-2ec9-565a-aec2-2a4fbf2a1a06@denx.de>
Date: Sat, 18 Nov 2017 20:29:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171118141419.GZ9986@bill-the-cat>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.11 release
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
X-List-Received-Date: Sat, 18 Nov 2017 19:52:10 -0000
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/18/2017 03:14 PM, Tom Rini wrote:
> On Sat, Nov 18, 2017 at 11:19:13AM +0100, Marek Vasut wrote:
>> On 11/17/2017 09:59 PM, Tom Rini wrote:
>>> On Fri, Nov 17, 2017 at 08:19:07PM +0100, Marek Vasut wrote:
>>>> On 11/14/2017 07:32 PM, Otavio Salvador wrote:
>>>>> This upgrades the U-Boot from 2017.09 to 2017.11 release.
>>>>>
>>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>>>> ---
>>>>>
>>>>>  .../u-boot/{u-boot-common_2017.09.inc => u-boot-common_2017.11.inc}     | 2 +-
>>>>>  .../u-boot/{u-boot-fw-utils_2017.09.bb => u-boot-fw-utils_2017.11.bb}   | 0
>>>>>  .../u-boot/{u-boot-mkimage_2017.09.bb => u-boot-mkimage_2017.11.bb}     | 0
>>>>>  meta/recipes-bsp/u-boot/{u-boot_2017.09.bb => u-boot_2017.11.bb}        | 0
>>>>>  4 files changed, 1 insertion(+), 1 deletion(-)
>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.09.inc => u-boot-common_2017.11.inc} (89%)
>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.09.bb => u-boot-fw-utils_2017.11.bb} (100%)
>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.09.bb => u-boot-mkimage_2017.11.bb} (100%)
>>>>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.09.bb => u-boot_2017.11.bb} (100%)
>>>>>
>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
>>>>> similarity index 89%
>>>>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
>>>>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
>>>>> index 02e51242cb..bfdf1a0d8f 100644
>>>>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
>>>>> @@ -7,7 +7,7 @@ PE = "1"
>>>>>  
>>>>>  # We use the revision in order to avoid having to fetch it from the
>>>>>  # repo during parse
>>>>> -SRCREV = "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
>>>>> +SRCREV = "c253573f3e269fd9a24ee6684d87dd91106018a5"
>>>>>  
>>>>>  SRC_URI = "git://git.denx.de/u-boot.git \
>>>>>      file://MPC8315ERDB-enable-DHCP.patch \
>>>>
>>>> This patch ^ could use a refresh , since it applies with Fuzz now.
>>>
>>> Honestly, just enable DISTRO_DEFAULTS for the board and post that
>>> upstream instead.
>>
>> Or that, but someone would have to test that first and the patch author
>> does not respond for some reason.
> 
> Adding in Ed..
> 
> Yes, it would be good if the MPC8315 got run-time tested more often, but
> no, a build test is sufficient I think for changing a few options like
> this.

I didn't have very good experience with changing such stuff for random
board and not actually testing it thus far ...

-- 
Best regards,
Marek Vasut

