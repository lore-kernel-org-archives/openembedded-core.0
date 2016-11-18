Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0C871AC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 20:30:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3tL8lL0fc2z3hjZR;
	Fri, 18 Nov 2016 21:30:54 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3tL8lK6tGLzvkWL;
	Fri, 18 Nov 2016 21:30:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id FXyLviNTPifl; Fri, 18 Nov 2016 21:30:52 +0100 (CET)
X-Auth-Info: icPOYEb8Eb/iQLzKn9RVp6K154CTkPgLL6okhOuL7s8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 18 Nov 2016 21:30:52 +0100 (CET)
To: Denys Dmytriyenko <denis@denix.org>
References: <20161118192955.17284-1-marex@denx.de>
	<20161118194439.GF26131@denix.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <96a66f71-61e3-6386-c463-6f7df9c60d43@denx.de>
Date: Fri, 18 Nov 2016 21:30:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161118194439.GF26131@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to v2016.11 release
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
X-List-Received-Date: Fri, 18 Nov 2016 20:30:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 11/18/2016 08:44 PM, Denys Dmytriyenko wrote:
> On Fri, Nov 18, 2016 at 08:29:55PM +0100, Marek Vasut wrote:
>> Upgrade U-Boot to the latest version.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Denys Dmytriyenko <denis@denix.org>
> 
> Acked-by: Denys Dmytriyenko <denys@ti.com>
> 
> 
>> Cc: Ross Burton <ross.burton@intel.com>
>> ---
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
>> similarity index 71%
>> rename from meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
>> rename to meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
>> index f706a6b..84adc1c 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
>> @@ -7,8 +7,8 @@ PE = "1"
>>  
>>  # We use the revision in order to avoid having to fetch it from the
>>  # repo during parse
>> -SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
>> +SRCREV = "29e0cfb4f77f7aa369136302cee14a91e22dca71"
>>  
>> -SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
>> +SRC_URI = "git://git.denx.de/u-boot.git"
> 
> Will it branch off into own branch eventually?Does master ever get 
> re-written? I guess as long as this commit always stays in master, it should 
> be fine.

Master never gets rewritten and the commit is always in master, unless
we screw something up bad and need to make a fixup release (which
happens almost never :-)), in which case that goes into separate branch.

-- 
Best regards,
Marek Vasut

