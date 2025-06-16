Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD06C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 14:22:26 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.31917.1750083744672223082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 07:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 55GELE5m007561;
	Mon, 16 Jun 2025 09:21:16 -0500
Received: from [192.168.2.13] ([192.168.2.13])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 55GELCh0009917;
	Mon, 16 Jun 2025 09:21:12 -0500
Message-ID: <996eaf10-fd50-40ec-b266-64becb4cf4fd@kernel.crashing.org>
Date: Mon, 16 Jun 2025 09:21:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/6] riscv tunes: ISA Implementation of RISC-V
 tune features
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
 <1750040965-15015-2-git-send-email-mark.hatle@kernel.crashing.org>
 <8bf4ccf58f9d948a5501c7eecf1daabc98c64ebf.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <8bf4ccf58f9d948a5501c7eecf1daabc98c64ebf.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 14:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218828

These all seem to be related to the same issue reported by Gyorgy Sarvari.

atomic_4 and atomic_8 functions are not working.

--Mark

On 6/16/25 5:11 AM, Richard Purdie wrote:
> On Sun, 2025-06-15 at 21:29 -0500, Mark Hatle via lists.openembedded.org wrote:
>> From: Mark Hatle <mark.hatle@amd.com>
>>
>> This implements the following base ISAs:
>>
>> * rv32i, rv64i
>> * rv32e, rv64i
>>
>> The following ABIs:
>> * ilp32, ilp32e, ilp32f, ilp32d
>> * lp64, lp64e, lp64f, lp64d
>>
>> The following ISA extension are also implemented:
>> * M - Integer Multiplication and Division Extension
>> * A - Atomic Memory Extension
>> * F - Single-Precision Floating-Point Extension
>> * D - Double-Precision Floating-Point Extension
>> * C - Compressed Extension
>> * B - Bit Manipulation Extension (implies Zba, Zbb, Zbs)
>> * V - Vector Operations Extension
>> * Zicsr - Control and Status Register Access Extension
>> * Zifencei - Instruction-Fetch Fence Extension
>> * Zba - Address bit manipulation extension
>> * Zbb - Basic bit manipulation extension
>> * Zbc - Carry-less multiplication extension
>> * Zbs - Single-bit manipulation extension
>> * Zicbom - Cache-block management extension
>>
>> The existing processors tunes are preserved:
>> * riscv64 (rv64gc)
>> * riscv32 (rv32gc)
>> * riscv64nf (rv64imac_zicsr_zifencei)
>> * riscv32nf (rv32imac_zicsr_zifencei)
>> * riscv64nc (rv64imafd_zicsr_zifencei)
>>
>> Previously defined feature 'big-endian' has been removed as it was not used.
> 
> I tried this (just 1/6) and it caused:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/142
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/135
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/114
> 
> Cheers,
> 
> Richard

