Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067F8CA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 14:37:32 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.15516.1756478243252057504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 07:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MFCPkdDe;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7a8dd3dso267609466b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 07:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756478242; x=1757083042; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TxOENc1eJqJc/u3vYt2ZDrlft4kniwL9aOqgqonf55E=;
        b=MFCPkdDeRbcjUXDr1YjJKUPNI2SMYJYIp+4PMVa8NlVvwxzfj3UT51xNjfI0ccaEU5
         B5ACc/fHAz32KXB/1aYouCzwnryRxfuVlfQv1GRM/xkKzMdXBLSH9eh9IfIEY4SxUv8X
         kanvDgbeEAPgrhER06yYmLoVz3O1HgHxd6KhjjT0EfhM5++i1ijvE6AXNp/NX4iDcZ4E
         cD+tr4ReQSFkM2KnwhnueKJLMtn1TzQW7j3t3QkgFjTQiwQpPCH/rI8m0xexHsQdFpNP
         PdbffLGlx/Tps8Ev+TzTYmKBHLLSObEar8fFSgSwVEChvXHCP9OAynVxpwvvytkGlic4
         qu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478242; x=1757083042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxOENc1eJqJc/u3vYt2ZDrlft4kniwL9aOqgqonf55E=;
        b=IAfh8NfU537CiJZ1oAEhWbFSyXWpU7lZOFUPYpQzWSPMrl1wHwcwFJMhLnjf/tJb/C
         N4smKcNtHW2g5APl/5+g4/xQPYeyizaWRPYzgprWI3CmxXX8esRLkbbU4jEqMHQKUSDl
         dPS9FojWdq0ggE7qCNRGxichNRSZF78961bmpbO4OPg93ev7z3/TezYbUVnj3LtCHF/b
         j5YhHsa71w5ghAIC1TqSWjfEuIdtAFAHIbgbEky2od2lUvb5Mr9iyFuJbDHEzuqhP3l5
         +GCqy0MKmI/3flBJXwQTgLTY/WpzZQLlO1nuBhtmFYiATVQoxjD3e6QhMjdNX3S76Qt7
         pM4A==
X-Forwarded-Encrypted: i=1; AJvYcCVdPg9YkGQ3uedCvrRC8BF3WU+rfYrb4ROUrg6YuWusURarBozxuPvhqzaUDfz5S6Q1TOU72etzv42OtzFcrMrUhw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+eDkL33ZPXHC8mawrFP7FUoa8pxlkhOLuPeab8l8cJENrjl9I
	7RhLnsmWr328j5V4NQBoPKN0HsWV5hNjYk1ubGvu9hrfWa+cPaFdTRaF
X-Gm-Gg: ASbGncvtubrkjoakc8ba3iWfnigmiFH/oyax9JVJEL2mr7W7gYF+4YIDlhy5mqvwAiG
	+USA1ApUFyXAXJkDdhq74tBXbTzOT/9H6M2uho2sKivaWgZ41H99uVSR1mPuwCRsVQ8nffk5pYJ
	fWXg8WN+3QFte4DJdVENVSJqvaT++mmnS6hMbe/43SxgdJBiOQIGDaDYdyaSZvCyxrYxtO+HBpH
	eN5ePftERcrhci1rJFCRZNagfAJfOhEdrvO5e5/CMxNRHvBOjSCsWRZevre6OkXfVnm7kUxRjvP
	+S9US+4p/pb23DuYKRFemEcAoXCVPrf5qyNrsRF6zbCU2crRcX9MGtaK0F+49HSk9GTZekdgHNo
	oQ6+wM1cGIioQMYMOQn9D/+1Xscd32X8=
X-Google-Smtp-Source: AGHT+IEkz5mvjZzA+WjbbY8S4Kt6dRiFqmzr43PH6YVfEhU4CAQpZWZSGcZ7D7sRF4EAKcmaDnuD/g==
X-Received: by 2002:a17:907:9404:b0:afe:954b:25b2 with SMTP id a640c23a62f3a-afe954b2fc6mr1641652366b.12.1756478241474;
        Fri, 29 Aug 2025 07:37:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefd695512sm204310166b.60.2025.08.29.07.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 07:37:20 -0700 (PDT)
Message-ID: <05f76d77-1f5e-476d-a7cf-931aa259e5dc@gmail.com>
Date: Fri, 29 Aug 2025 16:37:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][walnascar 10/12] linux-yocto/6.12: riscv: Enable
 TUNE_FEATURES based KERNEL_FEATURES
To: steve@sakoman.com, openembedded-core@lists.openembedded.org,
 mark.hatle@amd.com
References: <cover.1753041740.git.steve@sakoman.com>
 <850949594410a9a228e164977c9e8a08f4a52876.1753041740.git.steve@sakoman.com>
 <1860423D83620FA2.10903@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1860423D83620FA2.10903@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 14:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222616

On 8/29/25 16:11, Gyorgy Sarvari via lists.openembedded.org wrote:
> Since this patch, it looks like qemuriscv64 doesn't boot in Walnascar.
>
> I'm using a vanilla core-image-sato with some extra added applications.
> I can't really figure out how to save the console output from qemu, so
> all I offer is a useless screenshot that is not showing anything because
> it scrolled too far: https://postimg.cc/G8sqjK0b
>
> Once I remove this patch, it boots again. Am I missing something on my
> end, or is this something with the combo of Walnascar and this patch?

I managed to figure out how to save the bootlog from qemu: 
https://gist.github.com/OldManYellsAtCloud/e31d7a286d074fd095d9e1c29dd0b359

>
> On 7/20/25 22:04, Steve Sakoman via lists.openembedded.org wrote:
>> From: Mark Hatle <mark.hatle@amd.com>
>>
>> Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selections
>> in the kernel config via config fragments selected by KERNEL_FEATURES.
>>
>> This allows the following items to be selected dynamically:
>>
>>     CONFIG_ARCH_RV32I
>>     CONFIG_ARCH_RV64I
>>     CONFIG_FPU
>>     CONFIG_RISCV_ISA_C
>>     CONFIG_RISCV_ISA_V
>>     CONFIG_RISCV_ISA_ZBB
>>     CONFIG_RISCV_ISA_ZICBOM
>>     CONFIG_RISCV_ISA_ZICBOZ
>>     CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>>
>> Note: Some ISA options, such as CONFIG_RISCV_ISA_C may be reenabled by other
>> options such as CONFIG_EFI.  This is properly reported by the configuration
>> tooling.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 45a1b5aa6abc9007d0d87efc2d740b5564a209dd)
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto.inc | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 389329030d..4d0a726bb6 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -37,6 +37,22 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
>>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
>>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
>>  
>> +KERNEL_FEATURES_RISCV = "\
>> +    arch/riscv/tunes/riscv-isa-clear.scc \
>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/riscv/tunes/riscv-isa-rv32i.scc',  '', d)} \
>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/riscv/tunes/riscv-isa-rv64i.scc',  '', d)} \
>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/riscv/tunes/riscv-isa-fpu.scc',    '', d)} \
>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/riscv/tunes/riscv-isa-c.scc',      '', d)} \
>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/riscv/tunes/riscv-isa-v.scc',      '', d)} \
>> +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/riscv/tunes/riscv-isa-zba.scc',    '', d)} \
>> +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/riscv/tunes/riscv-isa-zbb.scc',    '', d)} \
>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/riscv/tunes/riscv-isa-zbc.scc',    '', d)} \
>> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/riscv/tunes/riscv-isa-zicbom.scc', '', d)} \
>> +    "
>> +
>> +KERNEL_FEATURES:append:riscv32 = " ${KERNEL_FEATURES_RISCV}"
>> +KERNEL_FEATURES:append:riscv64 = " ${KERNEL_FEATURES_RISCV}"
>> +
>>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>>  # by the kernel. This is typically the branch that should be built,
>>  # and it can be specific to the machine or shared
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222615): https://lists.openembedded.org/g/openembedded-core/message/222615
> Mute This Topic: https://lists.openembedded.org/mt/114257145/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


