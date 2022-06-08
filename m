Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C14BC43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:45:29 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.7318.1654699524417759567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B8QYulom;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id b12so12022440ljq.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mEupycFwq9kyfEa07IjjpgomlQmnh3Jq7y9JpSGqYDU=;
        b=B8QYulomnq9isw592nD0vOOuvoAIiciyvQXYm2386yIsGustgR1XVgSUeL0fF0uBjE
         yA5KiRPGcr6LqGSAZyIjfDDvUw7E3tv0p/rfT0BHVbxpXCFAi0OpcecqEf+rfv8FZt4D
         UpgnOIHFUfMJqLqXqeK/zhz5EXhKimsAooP00ftFGwx3beE9sd6F/IQ4XIT6SZtBcU9D
         82BmuzyU/AM2mkRckF7VVUopZKKMzpAxXRtjmwN/zxqCLlkhSDgxYfM99xzkd3OCOT2z
         aPEEefQXcNDbNQWTeJidvx7E2AT4my8BA4ncYXUwRPRV+kCYKreWKG6VWWalsWoQdAJf
         RgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mEupycFwq9kyfEa07IjjpgomlQmnh3Jq7y9JpSGqYDU=;
        b=x5Xm8O1sz5LBjfrL8me5GxuwRx3ibyQ7j2mHEwNlFjodztNg3uJKEX8zWpdkU1/+gb
         5dkcejnbm8DI81F8xkraEkW4DPRuYn9zSQOtHKOrVC0cTbrlKMl/aqyEjAE2y2S0Z/sC
         kLtnf39U1OpfIwZV3pHH4fUCSlUt2cVK5EmJgwr+s2tZ7d7Do7oT/nvOOyt2zLO9j9n6
         LTlwVL7hETww4MUHlcmxcY1jELTI9L+HWh19Hr3jGsBf+idsi60kKHBPxEsGOXyeUfjI
         Bg0Uhu5ns62A0iRPQB6JS+jeBlpRCyMqmu6l5gY4YmspDGKAzLP9TNIK7gU/7zwbpSqW
         godg==
X-Gm-Message-State: AOAM533Tu7H1oUJ3DPyTdxqmHkYuRyuamtAxqlDEP1Xwi2hhRJXyHUb8
	DU6ocj074U8Tn2cGWzFd8g==
X-Google-Smtp-Source: 
 ABdhPJxJvjxgI9sxDc5zTAZ7/lkwHH1Vf3UaklSig7o/D4tNHHQGSHkdRRvG+atzRNG9r0NVdqG2Fw==
X-Received: by 2002:a2e:9808:0:b0:255:59c1:3086 with SMTP id
 a8-20020a2e9808000000b0025559c13086mr24535814ljj.495.1654699522202;
        Wed, 08 Jun 2022 07:45:22 -0700 (PDT)
Received: from [10.67.202.36] (85-128-83-172.static.ip.netia.com.pl.
 [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 m4-20020a0565120a8400b00477b624c0a8sm3742550lfu.180.2022.06.08.07.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 07:45:21 -0700 (PDT)
Message-ID: <03c367d5-4983-f4cc-1417-4377df3a0ca1@gmail.com>
Date: Wed, 8 Jun 2022 16:45:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH v2 4/5] oeqa/selftest: Add test for shebang
 overflow
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
 <20220607151123.3588947-4-ptsneves@gmail.com> <20220608145305.4be602f2@booty>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: <20220608145305.4be602f2@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:45:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166734

On 6/8/22 14:53, Luca Ceresoli wrote:
> Hi Paulo,
>
> On Tue,  7 Jun 2022 17:11:22 +0200
> "Paulo Neves" <ptsneves@gmail.com> wrote:
>
>> Make sure we do not stage any executable with a bigger shebang
>> than 128. Fixes [1]
>>
>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053
>>
>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> This check seems to be working very well!! It triggered a huge amount
> of build failures on the autobuilders due to libcheck having a shebang
> too long in the checkmk script, e.g.:
>
> #! /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/x86_64-linux/libcheck-native/0.15.2-r0/recipe-sysroot-native/usr/bin/gawk -f
>
> Here are a few logs:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/14/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5689/steps/11/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5340/steps/12/logs/errors

I am not seeing an immediate way to fix this optimally. The go-to 
solution to this class of issues is to just make
the #!/usr/bin/env <interpreter>. The issue is that there is an extra 
-f, which with /usr/bin/env, will not work. The awk manual also implies 
this is not optional for standalone scripts. I think we can create a 
wrapper, or maybe we already have such a wrapper?
>
> It would be great if you could add another patch to your series to fix
> libcheck, and also to do 'bitbake world' to test as many packages as
> possible before discovering from the autobuilders.
It takes quite a while on my computer and often i get out of disk space. 
I tried asking the linaro guys for a tuxsuite token but no answer yet. 
If you have some way of getting resources to make builds let me know.
> Thank you!

Thank you
Paulo Neves

