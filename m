Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDBEC63682
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.9136.1649921811392875219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 00:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qN8fGnYq;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso8522675pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 00:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=hL+ZTDCdCAuo4nvZ8mf1ipHbRdFPMSXD/ClNMWW7C6c=;
        b=qN8fGnYq+MgeUBOY0e6D9lvUwbJxbNljjwJCvYwH9mKLwTXnu2PJElNLAgVcx02Yai
         vahKCJhsn9AQCGG3fgXHhXepytEr3hopk4+xgPQSHbQ67HPQWgoTAtuf5oAW3mF4eCIR
         nOQ8vBgHL1okopRYgXFsROZkXzfY/fxDIdXZb8NNg5d+SI0geakUg3fc32hW1920JFet
         UCEyaWp0wdypybHrL0CMnfC5yEv18kDrbBxM/rGGCLDMXvpg+MFCFmlAEf9XbqEMmpBC
         c+WvpbzuN93+fl8uGoHLTAajhX5xWZDe7nkTxeSCRkx+u3Bi6pqHDt/Usn9vA3g2Uoa8
         qnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=hL+ZTDCdCAuo4nvZ8mf1ipHbRdFPMSXD/ClNMWW7C6c=;
        b=jWjbIpCmRLQC2FqVA7Waa+hMTs7ozmPEh6zpl4z5dypnV2WQT2Kdi9apOaxiYjHRjT
         CvYX3cJepdZgCeuIKMwz86Wifw0XDRfGwpgyflzdqWA9LPRyo7XD+gZCgr5V0hsIKkMj
         ve7MpBZ3kH4vqcHXyzRhbQ8C1zdwjnWiaKgb5P8SkkJBCNHMse1yaMCjhk2wqdu+rYxB
         g7R6EMwXx1M9mK2pjKnOQmdnzLaZnC4MpsuE1WfqtVvXrFtfSacc4Wsp6e5YmA5i2II9
         OMJg2w/SSs2JcFiDX922uSLGQzvAvq41v02d7z/nmNr8YwOOAFddqcMk0criI2UwKclI
         CijQ==
X-Gm-Message-State: AOAM533MpFj6YZVID3x6w/24W1KaKamFLPMTkUPfZbq3dpv+pw9K9Mfv
	CT97/R6yQ3/5ZK4u54jQtMI=
X-Google-Smtp-Source: 
 ABdhPJwMRm/x8pB9A0VOaBhgh8AP/dz/6KVpVaXlvW23Bq3M9P00vEE/S7Vt4r/O92v+7mGvmeoY7Q==
X-Received: by 2002:a17:902:d717:b0:156:20a9:d388 with SMTP id
 w23-20020a170902d71700b0015620a9d388mr46021192ply.19.1649921810793;
        Thu, 14 Apr 2022 00:36:50 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0::a9f9? ([2601:646:9200:a0f0::a9f9])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a17090ad3c400b001c65ba76911sm5004374pjw.3.2022.04.14.00.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 00:36:50 -0700 (PDT)
Message-ID: <3086adb3-ba42-649f-3ff5-d67e43ff8e3e@gmail.com>
Date: Thu, 14 Apr 2022 00:36:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH 1/6] riscv: Add tunes for rv64 without
 compressed instructions
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220414025230.1166825-1-raj.khem@gmail.com>
 <CAKmqyKNUJse_0a_NTK7SRQZ+CSzBZ2EDbgJ68KaW7m23m9bc8A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CAKmqyKNUJse_0a_NTK7SRQZ+CSzBZ2EDbgJ68KaW7m23m9bc8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164394



On 4/14/22 00:32, Alistair Francis wrote:
> On Thu, Apr 14, 2022 at 12:52 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/conf/machine/include/riscv/arch-riscv.inc | 2 ++
>>   meta/conf/machine/include/riscv/tune-riscv.inc | 8 ++++++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
>> index e5611a12a66..230a266563a 100644
>> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
>> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
>> @@ -7,6 +7,8 @@ TUNE_PKGARCH = "${TUNE_PKGARCH:tune-${DEFAULTTUNE}}"
>>   TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nf', ' -mabi=lp64', ' ', d)}"
>>   TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32nf', ' -mabi=ilp32', ' ', d)}"
>>
>> +TUNE_CCARGS:append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv64nc', ' -march=rv64imafd', ' ', d)}"
> 
> I thought Linux expected compressed instruction support, is there
> actual hardware that doesn't have compressed instructions?

CDAC in India is designing bunch of cores without C instruction support.

> 
> Alistair
> 
>> +
>>   # Fix: ld: unrecognized option '--hash-style=sysv'
>>   LINKER_HASH_STYLE:libc-newlib = ""
>>   # Fix: ld: unrecognized option '--hash-style=gnu'
>> diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
>> index cc2896f277b..659801496c9 100644
>> --- a/meta/conf/machine/include/riscv/tune-riscv.inc
>> +++ b/meta/conf/machine/include/riscv/tune-riscv.inc
>> @@ -6,6 +6,8 @@ TUNEVALID[riscv32] = "Enable 32-bit RISC-V optimizations"
>>   TUNEVALID[riscv64nf] = "Enable 64-bit RISC-V optimizations no floating point"
>>   TUNEVALID[riscv32nf] = "Enable 32-bit RISC-V optimizations no floating point"
>>
>> +TUNEVALID[riscv64nc] = "Enable 64-bit RISC-V optimizations without compressed instructions"
>> +
>>   TUNEVALID[bigendian] = "Big endian mode"
>>
>>   AVAILTUNES += "riscv64 riscv32 riscv64nf riscv32nf"
>> @@ -31,3 +33,9 @@ TUNE_FEATURES:tune-riscv32nf = "${TUNE_FEATURES:tune-riscv32} riscv32nf"
>>   TUNE_ARCH:tune-riscv32nf = "riscv32"
>>   TUNE_PKGARCH:tune-riscv32nf = "riscv32nf"
>>   PACKAGE_EXTRA_ARCHS:tune-riscv32nf = "riscv32nf"
>> +
>> +# no compressed
>> +TUNE_FEATURES:tune-riscv64nc = "${TUNE_FEATURES:tune-riscv64} riscv64nc"
>> +TUNE_ARCH:tune-riscv64nc = "riscv64"
>> +TUNE_PKGARCH:tune-riscv64nc = "riscv64nc"
>> +PACKAGE_EXTRA_ARCHS:tune-riscv64nc = "riscv64nc"
>> --
>> 2.35.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#164378): https://lists.openembedded.org/g/openembedded-core/message/164378
>> Mute This Topic: https://lists.openembedded.org/mt/90456787/3619028
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alistair23@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

