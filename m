Return-Path: <andrey.konovalov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F766C54EE9
	for <webhook@archiver.kernel.org>; Sun, 18 Sep 2022 12:06:51 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web08.8145.1663502805518454418
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 05:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cUhWhCBF;
 spf=pass (domain: linaro.org, ip: 209.85.208.169,
 mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id j9so7878743ljg.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=U8QZHHk44FuOnvlIvZhWZ0RzWOtQr0vLUr6RnpVYE9E=;
        b=cUhWhCBF6AT9TCKBjvU+tf1ek9986xteFq5jMqOMCexXXn2rgMUYgYaMirEbXrfAW3
         E/vXh9O3JsQvOIM58ZFSYGbi4b1Qwr3Do00R4T2jGYLXaYEnG42cxoxPix3m3ayopRm4
         VUJaxCD3uYwui3xH7x5gSPpcus1Uyhg6VP6dixiYedcf3NxJ7R41sU1/kgwLHvnSykqP
         ZgRtrSnWs4yI50Jg439zpYxvHZbJJysLOZDJOf1Vfa9KL0BolzMW1hlQRTWeDjsf4xva
         4qSSXn8zZ1R6WEnl3iYWdkGxwTcCIy9yOKGdHHpeqGFpkLFFqrSbhV0PRuapHjeK1GP2
         7BNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=U8QZHHk44FuOnvlIvZhWZ0RzWOtQr0vLUr6RnpVYE9E=;
        b=o2auejckOCzjMTHCCKwgsfdh6iXN8imJQO8m1+gvIzdyfzvibBmAYXkvTL5EOhxj70
         h0NQPUutNuoJGXV9KI0wSzOPEKsjyKm8/c0+RYJ1agly/C27AvSHEtFgHDgtj97GOFyZ
         m74D6PTl+gQzvFvdnQ2yOS8T3RjiJaFK6o+WGhCiPlhF61Ka6q75g9Wixffy2fWDbL/3
         oxyr7ENF1hZTg/eTQC0Gy3jpEqqYVHoLLbud1tjZ7SEuggrzQJb3B/8X65BoguF0UGE6
         RJLsbhoRdGYWiC4fgFN6HBTs8pO9m2KLILNa7jygZGXifuth+MlUEcU4/ASyKhLHzO3N
         TAUg==
X-Gm-Message-State: ACrzQf2TFHCVla9KI6m6wXj9fdy+cy2ffPpoR65hZqok5veCqR7m6SPb
	/zcshz6YBx4upXFrPgpBVpv0FQ==
X-Google-Smtp-Source: 
 AMsMyM6/PSlu0HeaCbfhv+XszmGMmbxvOCxQb0MBsKnqp9V1c1LDOVR9XW6VWHZM90rS6Uo001Llcg==
X-Received: by 2002:a2e:98ce:0:b0:26b:e763:27d1 with SMTP id
 s14-20020a2e98ce000000b0026be76327d1mr3560470ljj.306.1663502803557;
        Sun, 18 Sep 2022 05:06:43 -0700 (PDT)
Received: from [192.168.118.20] (128-69-252-44.broadband.corbina.ru.
 [128.69.252.44])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a056512344100b004979ec19387sm4627064lfr.305.2022.09.18.05.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 05:06:43 -0700 (PDT)
Message-ID: <b4406430-8ff1-25f6-c792-ed384feb7ca0@linaro.org>
Date: Sun, 18 Sep 2022 15:06:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [RFC][PATCH 0/1] mesa: clover | Microsoft/Intel CLC:
 fix building OpenCL programs
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220917115642.766941-1-andrey.konovalov@linaro.org>
 <CAMKF1srKXtQ=oJX+tz6_EWC=d_CjPmxSvnA5SFHiYDfU3MJu1g@mail.gmail.com>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
In-Reply-To: 
 <CAMKF1srKXtQ=oJX+tz6_EWC=d_CjPmxSvnA5SFHiYDfU3MJu1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Sep 2022 12:06:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170847

On 9/17/22 19:38, Khem Raj wrote:
> On Sat, Sep 17, 2022 at 4:56 AM Andrey Konovalov
> <andrey.konovalov@linaro.org> wrote:
>>
>> This fixes the errors like:
>>
>> -----8<-----
>> dragonboard-845c:~$ clinfo
>> <snip>
>>     Max work group size                             1024
>> === CL_PROGRAM_BUILD_LOG ===
>> <built-in>:1:10: fatal error: 'opencl-c.h' file not found
>>     Preferred work group size multiple (kernel)     <getWGsizes:1504: create ker>
>>     Preferred / native vector sizes
>>       char                                                16 / 16
>> <snip>
>> -----8<-----
>>
>> Here clinfo runs on target board and produces correct output except for
>> the "Preferred work group size multiple (kernel)" item. This is the only
>> item which requires clinfo to build and run a small OpenCL kernel. But
>> building OpenCL program fails as clover can't find the include file.
>>
>> The reason is that the include search path is set at mesa build time by
>> setting CLANG_RESOURCE_DIR to "$(llvm-config --libdir)something" and
>> passing it in cpp args. This results in path to sysroot included into
>> CLANG_RESOURCE_DIR:
>>
>> -----8<-----
>> dragonboard-845c:~$ strace clinfo 2>&1|grep include
>> newfstatat(AT_FDCWD, "/workdir/master.test/build-rpb/tmp-rpb-glibc/work/armv8-2>
>> newfstatat(AT_FDCWD, "/usr/local/include", 0xfffffc3bad68, 0) = -1 ENOENT (No s>
>> newfstatat(AT_FDCWD, "/workdir/master.test/build-rpb/tmp-rpb-glibc/work/armv8-2>
>> newfstatat(AT_FDCWD, "/usr/include", {st_mode=S_IFDIR|0755, st_size=12288, ...}>
>> openat(AT_FDCWD, "/usr/include/opencl-c.h", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No>
>> -----8<-----
>>
>> Hence clover fails to locate /usr/lib/clang/14.0.6/include/opencl-c.h.
>>
>> Microsoft/Intel CLC *should* have the same problem, as the code in
>> compiler/clc/clc_helpers.cpp is pretty close to the one in
>> gallium/frontends/clover/llvm/invocation.cpp. Except for the case when
>> the contents of opencl-c.h is compiled into the CLC library (seems to be
>> the most common configuration for Windows), and the problem with locating
>> the include file on the target fs doesn't exist.
>>
>> This patch is RFC for two reasons:
>> * I am not sure if using hardcoded "/usr/lib" is good enough
>> * The compiler/clc/clc_helpers.cpp part is not tested. Maybe splitting
>>    the patch into two - the clover and the Microsoft/Intel CLC parts separated -
>>    would make more sense.
>>
>> Last note for those to try reproducing the build with clover:
>> clover uses libclc from meta-clang. meta-clang master branch has moved to
>> clang 15.0.0 recently, which breaks mesa build as the mesa fixes to account
>> for clang 15.0.0 changes have been merged into mesa main branch, but have not
>> yet made it into the last mesa release.
>> My temporary solution is rolling meta-clang back to the commit just before the
>> 14.0.6 -> 15.0.0 update, and cherry-picking "llvm-config: Replace TARGET_*
>> flags with normal equivalent flags". The latter is not required in my case,
>> it just makes llvm-config wrapper from meta-clang (the one used in this build)
>> to look closer to the llvm-config wrapper from oe-core.
>>
>> Andrey Konovalov (1):
>>    mesa: fix building OpenCL programs
>>
>>   ...-meson.CLANG_RESOURCE_DIR-workaround.patch | 42 +++++++++++++++++++
>>   meta/recipes-graphics/mesa/mesa.inc           |  1 +
>>   2 files changed, 43 insertions(+)
>>   create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
>>
> 
> I am not able to find the patch with above changes. Did you miss sending it ?

Yes, I did...
Will see if I can find something better then hardcoded '/usr/lib', and submit
the patch to https://gitlab.freedesktop.org/mesa/mesa

Thanks,
Andrey

>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#170827): https://lists.openembedded.org/g/openembedded-core/message/170827
>> Mute This Topic: https://lists.openembedded.org/mt/93741464/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

