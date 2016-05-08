Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id A4BEE731C5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 17:19:26 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3r2sgx5YPTz3hkC4;
	Sun,  8 May 2016 19:19:25 +0200 (CEST)
X-Auth-Info: TFazrFE6YIx34qo/cO0COfeGxwSQwOTATUEmp/jDfAU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3r2sgx2gclzvdWS; 
	Sun,  8 May 2016 19:19:25 +0200 (CEST)
Message-ID: <572F751E.2030604@denx.de>
Date: Sun, 08 May 2016 19:19:26 +0200
From: Marek Vasut <marex@denx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1462712432-6214-1-git-send-email-marex@denx.de>
	<81F5E78B-F4F8-44E9-8E21-2F5225D18C00@gmail.com>
In-Reply-To: <81F5E78B-F4F8-44E9-8E21-2F5225D18C00@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake: Oldest kernel for nios2 is 3.19
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
X-List-Received-Date: Sun, 08 May 2016 17:19:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 05/08/2016 07:06 PM, Khem Raj wrote:
> 
>> On May 8, 2016, at 6:00 AM, Marek Vasut <marex@denx.de> wrote:
>>
>> The oldest kernel version for nios2 is 3.19.0, set it so, otherwise
>> qemu-nios2 -r ${OLDEST_KERNEL} fails with "FATAL: kernel too old"
>> message from glibc.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> meta/conf/bitbake.conf | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 1c4175f..2f5db22 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -405,6 +405,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>>
>> OLDEST_KERNEL = "2.6.32"
>> OLDEST_KERNEL_aarch64 = "3.14"
>> +OLDEST_KERNEL_nios2 = “3.19"
> 
> if you don’t need it on krogoth, then I would suggest to hold this patch for master since
> I have a series which upgrades glibc to 2.24 and 2.24 needs 3.x minimum
> 
> see
> 
> https://github.com/kraj/openembedded-core/commit/1be5ebb2e1e2d39936d13ce158db29954bc6dabe

I don't mind either way. I need 3.19, not 3.2 though, so your patch does
not help me if I understand it correctly.

>> STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
>> STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
>>
>> --
>> 2.7.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


-- 
Best regards,
Marek Vasut

