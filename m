Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC95C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 15:20:16 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.25068.1752679211578285718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 08:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=irSFjmbz;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so1134891366b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 08:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752679210; x=1753284010; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3MAyG6CF1ScaixP6mm28EgM+JF2ZWTHuYz8H6YFAQo=;
        b=irSFjmbzKO1+uam6NGcRbWR2ptcI2BUhUhMJn0Ls4vq5zZqzBgDnQvPM8GwlrI4KH7
         4IvfwJbyAuaFYScw7CfCIbO/fqK4uD9PXPszGT9uZzu/0zdEuSnGaAIulLTiJgJ1gUq0
         SOqkRVPP6SiIpucidd1e9+5daXbG2Y113aXNGPAWy+X5csz6WDnS+827zrRhW38JifRI
         RHQjmn/+BiiVk998q1ynJrqHDzkwyHbo4uLfwyWstFYvwMqMgxr4PiqjJRB0CD5CVirJ
         fsCwZCXoIeJhOlBMA8PVDWsgDnBKSyxOYskH3Y0ZD3phCfnK1695vsF+5KaCuxHysb/J
         dV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679210; x=1753284010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3MAyG6CF1ScaixP6mm28EgM+JF2ZWTHuYz8H6YFAQo=;
        b=cvH5TM+mWBNvK7mALKsOoujv9Hc7/9H1dcnmeh8HvsEadWeWRKUgzus2vQGOQAZPq6
         iJLAIRBa4HlgePAzl1WcHzQs8qdkQk5f7hiZlIUl/j7j/dotGqYonc9Aav/mZ/ogUzrE
         cFjSDpmYxKYGLvbkFl02ntCdnVmN87XcODmMD/+g+nZPi5ow6/hH4SobPCWL6Tz9/h41
         B2oNNp02euPH3ZEmG8GzNjbcJGSB8NoRUH3nM7UXFzFUOZtXq+IwguJjr7CRqttKCxrB
         ke8HRoSvL4yuzQ6wih8YDsrbiMcXh9lsC8rt1FHz+uK3BlITS39pU3oZ2tWxgic3psAD
         Fepg==
X-Forwarded-Encrypted: i=1; AJvYcCWv/KJbP9MqgG9lB+HpulCxVxYl/TZDmM0YA8zONspBSmfSul1lAvXy4qxtwqWATDQpEKse7D5O6XRyw45W6pBwSg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWLcrYcXgJTkvvW7WrS0I9YTsb6d5PtTaJm7bmko6dIMJIMfGy
	mlAa/2NYuc9oE1tR/Pijxcf60t/SKVaUUew1Vdw8+DakR0+xna+zCG03
X-Gm-Gg: ASbGncsE01B+YGj5qkh7z+PRXT1ogaSLxWHcE50aA1zmwsljjpS0QF6snVFsWOUbKiM
	ypoxcYEv8oU5QNXD6aEsdm3actG91iwr6niQ4ImWJBpC1cNZ3YcDpN7KzpYvp9QKgdql4cHQAm1
	MY1DCcR24U+q4b6sUsmVWgllnefU4up9zIpeo9kYHJlfoTDO6bld2eReqQ6AtudQdTw/Dsok5GW
	T6G6CGy+mYWp7RGnv0GTYt4aG9CgWeDdnAZ7myQ9ITe/4Eq6wGV/5NFQ0sTfuafjpgRJhrb5woH
	HfuEnv/3XHNAh3b4KTACi6xiRsCboGbE3t7LcVOWFJdQL5hzp3X4dS29fBxNfO1AbTsS9EOxtVD
	MRclvJahG8jvwePDkX30E8TLQ0Z00sQ==
X-Google-Smtp-Source: AGHT+IGsOzm/IvLOlUn3qM7cTEl4/E4q97Yqzder5pTNBmmYEcsCGNP5BxCOZi2l8fderxnC5hQ/ZQ==
X-Received: by 2002:a17:907:c5cd:b0:ae3:6744:3661 with SMTP id a640c23a62f3a-ae9ce10c4f9mr256449666b.44.1752679209630;
        Wed, 16 Jul 2025 08:20:09 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82914c9sm1207859266b.112.2025.07.16.08.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 08:20:09 -0700 (PDT)
Message-ID: <70146350-25ee-4419-9535-227732cd732d@gmail.com>
Date: Wed, 16 Jul 2025 17:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] toolchain/clang: handle big.LITTLE Arm SoCs
To: Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
References: <20250716145707.2271609-1-skandigraun@gmail.com>
 <a514a643-5ca6-419e-845a-e62beabb198f@cherry.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <a514a643-5ca6-419e-845a-e62beabb198f@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 15:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220472

On 7/16/25 17:10, Quentin Schulz wrote:
> Hi Gyorgy,
>
> On 7/16/25 4:57 PM, Gyorgy Sarvari via lists.openembedded.org wrote:
>> clang doesn't have Arm big.LITTLE specific tune options - when they are used,
>> the compilation fails with an error like this:
>>
>> aarch64-poky-linux-clang: error: unsupported argument 'cortex-a72.cortex-a53+crc+crypto' to option '-mcpu='
>>
>> To avoid this, in case a big.LITTLE SoC is the target, select the tune corresponding
>> to the LITTLE core.
>>
>> This has been lifted from meta-clang, extended with cortexa73-cortexa35 which
>> was missing.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>   meta/classes/toolchain/clang.bbclass | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
>> index d7b8a3657c..b0e284be84 100644
>> --- a/meta/classes/toolchain/clang.bbclass
>> +++ b/meta/classes/toolchain/clang.bbclass
>> @@ -34,4 +34,20 @@ TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-pre
>>   LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
>>   LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
>>   
>> +# clang doesn't support big.LITTLE tunes, choose always the tune for the LITTLE cores
>> +TUNE_CCARGS:remove = "\
>> +    -mcpu=cortex-a57.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
>> +    -mcpu=cortex-a72.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
>> +    -mcpu=cortex-a15.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
>> +    -mcpu=cortex-a17.cortex-a7${TUNE_CCARGS_MARCH_OPTS} \
>> +    -mcpu=cortex-a72.cortex-a35${TUNE_CCARGS_MARCH_OPTS} \
>> +    -mcpu=cortex-a73.cortex-a35${TUNE_CCARGS_MARCH_OPTS} \
>> +    -mcpu=cortex-a73.cortex-a53${TUNE_CCARGS_MARCH_OPTS} \
>> +    -mcpu=cortex-a75.cortex-a55${TUNE_CCARGS_MARCH_OPTS} \
>> +    -mcpu=cortex-a76.cortex-a55${TUNE_CCARGS_MARCH_OPTS}"
>> +TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa72-cortexa53 cortexa57-cortexa53 cortexa73-cortexa53", " -mcpu=cortex-a53${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
>> +TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa15-cortexa7 cortexa17-cortexa7", " -mcpu=cortex-a7${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
>> +TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa72-cortexa35 cortexa73-cortexa35", " -mcpu=cortex-a35${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
>> +TUNE_CCARGS:append = "${@bb.utils.contains_any("TUNE_FEATURES", "cortexa75-cortexa55 cortexa76-cortexa55", " -mcpu=cortex-a55${TUNE_CCARGS_MARCH_OPTS}", "", d)}"
>> +
> Wouldn't it be better to have this in the tune conf file directly? I'm a 
> bit worried we'll have more big.LITTLE flavors in the future and because 
> this is in a separate file it'll be out of date.
>
> We should be able to do that by simply using the toolchain-clang or 
> toolchain-gcc override wherever appropriate?
>
> E.g.
>
> MCPU = "cortexa73-cortexa35"
> # clang doesn't have Arm big.LITTLE specific tune options, so select the 
> tune corresponding to the LITTLE core.
> MCPU:toolchain-clang = "cortexa35"
>
> TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", 
> "cortexa73-cortexa35", " -mcpu=${MCPU}", "", d)}"
>
> [... and other replacements in 
> meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc]
>
> (NOT TESTED) something like that?
>
> What do you think?

I have no strong opinion about this... with that said, the original list
was indeed slightly outdated. Will send a v2 later today with this
implementation.


