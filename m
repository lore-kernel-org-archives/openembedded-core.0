Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30ACD2168A
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:20:55 +0000 (UTC)
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
 by mx.groups.io with SMTP id smtpd.web11.11960.1728994845482274442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=AneVopYy;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=AneVopYy;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.162, mailfrom: andrej.v@skyrain.eu)
Received: from [172.25.231.43] ([85.248.43.180])
	by cmgsmtp with ESMTPSA
	id 0gXat5JnceqGt0gXbtIPix; Tue, 15 Oct 2024 14:20:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1728994843; bh=0X4zMZQGAXIHfSALjE8gZvnaClmY2VFZuno0J2i2MbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=AneVopYyxWUNA6Lzli53AqwbxliywbDG54G2iVhefxfS7QUgTHJyR4oNeK25BtL8Q
	 rl09X/G/aVHseG/AVoOKq5zGFX4Sr9abxF3enytTkz7RA+b1ykPRhXttLrZgoJqykA
	 YcT08SRNyw3o7EdwWZTOGe8HeiqYEZYGvOtuYUZjw3vuUGntcGeGorfic1PRRA7kVs
	 owlZU4A+QOBBAGyPSAycaSSXQQQfzcdTZci410l0wJrQk6d8I2chOeN6q7EBIwZsgY
	 KpKcanbiZq+tezsve0BLH9zlYRsUQnk63kZefix5oItOw7H8QXEvFwowmbgG2q5oyu
	 nvuElmguX43BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1728994843; bh=0X4zMZQGAXIHfSALjE8gZvnaClmY2VFZuno0J2i2MbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=AneVopYyxWUNA6Lzli53AqwbxliywbDG54G2iVhefxfS7QUgTHJyR4oNeK25BtL8Q
	 rl09X/G/aVHseG/AVoOKq5zGFX4Sr9abxF3enytTkz7RA+b1ykPRhXttLrZgoJqykA
	 YcT08SRNyw3o7EdwWZTOGe8HeiqYEZYGvOtuYUZjw3vuUGntcGeGorfic1PRRA7kVs
	 owlZU4A+QOBBAGyPSAycaSSXQQQfzcdTZci410l0wJrQk6d8I2chOeN6q7EBIwZsgY
	 KpKcanbiZq+tezsve0BLH9zlYRsUQnk63kZefix5oItOw7H8QXEvFwowmbgG2q5oyu
	 nvuElmguX43BA==
Message-ID: <a37cc22a-e880-45e7-aefc-c667d233f36e@skyrain.eu>
Date: Tue, 15 Oct 2024 14:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] busybox: 1.36.1 -> 1.37.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20241011094830.1009557-1-andrej.v@skyrain.eu>
 <a9c4777b9bf0987e3a01138e664fdfbe45907035.camel@linuxfoundation.org>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <a9c4777b9bf0987e3a01138e664fdfbe45907035.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCtmJ+FNblCCPocWwwZ/NuQb1smItjC+jusJDA6bOVvF2twu2Eo5ySMN5WCFmiYC/dumjbahJAc4EvMIlItvkEWzASUsqqnLBkYldj0G6Kz6sI5DI2pp
 xktE+VENNv+veymRAb5CiCyGw/2Y5UR6EeNaDJEZzWikuji1ieMoDNF5DaGD2zNgvx1Vr6K2XGxGYZyJW4kIj6DufBievsB/Q6MucSJwlmS5y5bz+lqg0jXw
 iiZfJzvFfrqOBeNp95hdVcRpToxz9g8Qw8IAqTI9CjA=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205908

Hi all,

Busysbox upgrade status: Ok, there were multiple problems occurred.

One problem is the wrong "sha accel" configuration, which I fixed 
already. The most critical part is not working syslog. It has been 
broken by 
https://git.busybox.net/busybox/commit/sysklogd?id=02378ce20c6d2df062357b6d60fc440609d203be 
so I have to dig into the problem and try to fix it.

Regards,
Andrej

On 11.10.2024 14:33, Richard Purdie wrote:
> On Fri, 2024-10-11 at 11:48 +0200, Andrej Valek via lists.openembedded.org wrote:
>> - update to next stable version 1.37.0
>>   - refresh defconfig
>>     - disable new applets (ip_link_can)
>>     - enable new applets (time64, find_exec_ok, getfattr, udhcpd_bootp)
>>   - remove and refresh already merged patches
>>
>> Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
>> ---
>>   ...ab_1.36.1.bb => busybox-inittab_1.37.0.bb} |   0
>>   ...01-awk-fix-precedence-of-relative-to.patch | 197 ------------------
>>   ...-fix-segfault-when-compiled-by-clang.patch |  41 ----
>>   ...1-awk.c-fix-CVE-2023-42366-bug-15874.patch |  37 ----
>>   ...x-ternary-operator-and-precedence-of.patch |  96 ---------
>>   .../busybox/busybox/CVE-2021-42380.patch      | 151 --------------
>>   .../busybox/busybox/CVE-2023-42363.patch      |  67 ------
>>   meta/recipes-core/busybox/busybox/defconfig   |   8 +-
>>   .../{busybox_1.36.1.bb => busybox_1.37.0.bb}  |   8 +-
>>   9 files changed, 7 insertions(+), 598 deletions(-)
>>   rename meta/recipes-core/busybox/{busybox-inittab_1.36.1.bb => busybox-inittab_1.37.0.bb} (100%)
>>   delete mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch
>>   delete mode 100644 meta/recipes-core/busybox/busybox/0001-awk-fix-segfault-when-compiled-by-clang.patch
>>   delete mode 100644 meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
>>   delete mode 100644 meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch
>>   delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42380.patch
>>   delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42363.patch
>>   rename meta/recipes-core/busybox/{busybox_1.36.1.bb => busybox_1.37.0.bb} (84%)
> This would seem to be causing:
>
> https://valkyrie.yoctoproject.org/#/builders/65/builds/225/steps/11/logs/stdio
>
> and many other failures in that build:
>
> https://valkyrie.yoctoproject.org/#/builders/29/builds/251
>
> Cheers,
>
> Richard


