Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 33A9F606D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 21:00:04 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3szkpq6gdCz3hjQm;
	Wed, 19 Oct 2016 23:00:03 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3szkpq644vzvkds;
	Wed, 19 Oct 2016 23:00:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id hLViwNjQgE9T; Wed, 19 Oct 2016 23:00:02 +0200 (CEST)
X-Auth-Info: zzzA3Wwxpuhx3paf3x+BLAj4O/ERavM/vNglR8e56yU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 19 Oct 2016 23:00:02 +0200 (CEST)
To: Denys Dmytriyenko <denis@denix.org>
References: <20161018215513.2873-1-marex@denx.de>
	<20161018215513.2873-4-marex@denx.de> <20161019201021.GP2494@denix.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <26a26c16-7eaf-70c3-698e-164bdba67d8b@denx.de>
Date: Wed, 19 Oct 2016 23:00:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161019201021.GP2494@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] u-boot: Drop PV altogether
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
X-List-Received-Date: Wed, 19 Oct 2016 21:00:05 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10/19/2016 10:10 PM, Denys Dmytriyenko wrote:
> On Tue, Oct 18, 2016 at 11:55:12PM +0200, Marek Vasut wrote:
>> Drop the explicit setting of PV altogether. This changes the U-Boot
>> version string from "v20yy.mm" to "20yy.mm" , so layer setting the
>> PREFERRED_VERSION_u-boot must be updated by removing the leading 'v'.
> 
> Finally!
> But do we need to bump PE to ensure upgrade path and proper sorting?

I don't think so, since the whole U-Boot version got updated.

>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: Denys Dmytriyenko <denis@denix.org>
> 
> Acked-by: Denys Dmytriyenko <denis@denix.org>

Thanks!

btw. given the layout of the u-boot package after this, updating is a
matter of mv+sed combo :)

>> ---
>>  meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
>> index 0a90621..a535df1 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
>> @@ -9,8 +9,6 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
>>  # repo during parse
>>  SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
>>  
>> -PV = "v2016.09.01"
>> -
>>  SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"

And once 2016.11 is out, I believe I can even drop the ;branch= bit here.

>>  S = "${WORKDIR}/git"
>> -- 
>> 2.9.3
>>


-- 
Best regards,
Marek Vasut

