Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A4E6275791
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 10:16:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6OAGiNB025019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Jul 2015 03:16:44 -0700 (PDT)
Received: from [128.224.162.235] (128.224.162.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Fri, 24 Jul 2015 03:16:34 -0700
Message-ID: <55B21084.9080307@windriver.com>
Date: Fri, 24 Jul 2015 18:16:36 +0800
From: He Zhe <zhe.he@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1437461993.git.zhe.he@windriver.com>	
	<81b6a1d0e88aa6e5f616e77b136972541bbdc7bd.1437461993.git.zhe.he@windriver.com>
	<1437666911.821.126.camel@linuxfoundation.org>
In-Reply-To: <1437666911.821.126.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.235]
Cc: bruce.ashfield@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] kernel: Pass sysroot mkimage to kernel makefile
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
X-List-Received-Date: Fri, 24 Jul 2015 10:16:47 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 07/23/2015 11:55 PM, Richard Purdie wrote:
> On Tue, 2015-07-21 at 15:23 +0800, zhe.he@windriver.com wrote:
>> From: He Zhe <zhe.he@windriver.com>
>>
>> Pass mkimage in sysroot to kernel makefile by NATIVE_MKIMAGE to avoid
>> depending on build machine's when KEEPUIMAGE is "yes".
>>
>> Fixes [YOCTO #6945].
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>  meta/classes/kernel.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 86ed28f..1d7fa48 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -141,7 +141,7 @@ UBOOT_ENTRYPOINT ?= "20008000"
>>  UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
>>  
>>  # Some Linux kernel configurations need additional parameters on the command line
>> -KERNEL_EXTRA_ARGS ?= ""
>> +KERNEL_EXTRA_ARGS ?= "NATIVE_MKIMAGE=${STAGING_BINDIR_NATIVE}/mkimage"
>>  
>>  # For the kernel, we don't want the '-e MAKEFLAGS=' in EXTRA_OEMAKE.
>>  # We don't want to override kernel Makefile variables from the environment
> ${STAGING_BINDIR_NATIVE} should be in PATH ahead of the usual system
> paths. Why therefore is this necessary? Is something resetting PATH?

You are right. There's no need to modify KERNEL_EXTRA_ARGS. Actually I made a mistake when I verified mkimage... I'll delete this patch in next version. Thank you for reviewing.

BTW, what about [PATCH v2 1/2] ?


Zhe

> Cheers,
>
> Richard
>
>
>


