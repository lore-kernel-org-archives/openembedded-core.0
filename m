Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8CBC43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 11:20:26 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.4552.1655119222493844523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 04:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j0YOztaJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: ptsneves@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id e5so2782108wma.0;
        Mon, 13 Jun 2022 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hUDVtkWJgnf0yQ8nSBLNoxhLn4BkJnT7SAMS8QePBys=;
        b=j0YOztaJ9R2Bayf3TjE8qASlg67O2Cnh1M25iUgzpzyaoKjwDkeeDjKRF3Vfqds7xb
         bhI3qbgmo6tZ6+niMx1JLDrcY4Hm9nkxFFeQX/HQBVSeCJD1CSMRzvuYVoXY4VNvF21g
         A1hawDTaXHwUhes7Rcy7/q5ygdC5bHGptTwKkGdm8zeaRJK/ygPG2H8zmXT7ejsYJ3Vc
         NYR8ZDYZ3fKipoVF1rIUl+92RX0HimQLukf/zrf5JRlXgdg2laslsBH+c7gp+JX4v95E
         8aheUh/NY8EsgtTOrOlgMqj8+Dn6ogfiJILRw+CJ/v+nLDovYjXQ5thPGBDzZf5mXdjo
         L4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hUDVtkWJgnf0yQ8nSBLNoxhLn4BkJnT7SAMS8QePBys=;
        b=x4tcAFiWPj+56kfFIJMr7Q9zW1XVTipn9uwv9eF60dHa4eYcpr7vd/qa7ZhBSOYfbG
         9chMzgql6UybSJikMxahSy20qVqQhuTSzzWpSo/Z7gEMwtWyK4+UTVv4l4L+yW7bwBCx
         5Z/0VxPzvywM/IXBxrw8hKVUnjNXhOccFCXapoVVUVJNzzUIBjs4U98MZ8bxvb9s37S4
         auHZR8OBohX5t+7k1ET/zYOz+nXkSlp0794rW1TQ694KDjnSQ0zBa/+XkSrf/F+A6ixn
         twW+HN9bIQipPTn/KNKqd+7ej/Kd905uOE2GjzYAuBOAjNPMWmDbdlF3xeQ7FHQmxpSC
         QOEA==
X-Gm-Message-State: AOAM532tPbVmjfaJ0dOFlpzq864CwcWW1wCLTxnjemFkv2ts3gHTeBYq
	KPokiodZ7XHnsRmxVZJj+A==
X-Google-Smtp-Source: 
 ABdhPJwIN2kwotJqt7z2H4MQRhS6ECoinFXeHXiJ9tWjstbrd8QDRP1YyCQho/Gd+tlBDHOP/Pa/Qg==
X-Received: by 2002:a05:600c:2189:b0:39c:4bfe:880e with SMTP id
 e9-20020a05600c218900b0039c4bfe880emr14001850wme.78.1655119220867;
        Mon, 13 Jun 2022 04:20:20 -0700 (PDT)
Received: from [192.168.1.248]
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 q14-20020adfea0e000000b00213ba4b5d94sm9885577wrm.27.2022.06.13.04.20.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 04:20:20 -0700 (PDT)
Message-ID: <be34fc80-bf8e-0e44-0ca2-fdab26d1ee5d@gmail.com>
Date: Mon, 13 Jun 2022 13:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH v2 4/5] oeqa/selftest: Add test for shebang
 overflow
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220607151123.3588947-1-ptsneves@gmail.com>
 <20220607151123.3588947-4-ptsneves@gmail.com>
 <16F6A653C457F871.26104@lists.openembedded.org>
 <20220608170626.4d97c4b7@booty>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: <20220608170626.4d97c4b7@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 11:20:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166837

Hey Luca,

I sent a new patchset and from my tests it all should be good now.

Paulo Neves

On 6/8/22 17:06, Luca Ceresoli wrote:
> Hi Paulo,
>
> On Wed, 8 Jun 2022 14:53:05 +0200
> "Luca Ceresoli via lists.openembedded.org"
> <luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>
>> Hi Paulo,
>>
>> On Tue,  7 Jun 2022 17:11:22 +0200
>> "Paulo Neves" <ptsneves@gmail.com> wrote:
>>
>>> Make sure we do not stage any executable with a bigger shebang
>>> than 128. Fixes [1]
>>>
>>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=11053
>>>
>>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> This check seems to be working very well!! It triggered a huge amount
>> of build failures on the autobuilders due to libcheck having a shebang
>> too long in the checkmk script, e.g.:
>>
>> #! /home/pokybuild/yocto-worker/genericx86-64-alt/build/build/tmp/work/x86_64-linux/libcheck-native/0.15.2-r0/recipe-sysroot-native/usr/bin/gawk -f
>>
>> Here are a few logs:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/14/logs/errors
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5367/steps/11/logs/errors
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5689/steps/11/logs/errors
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5340/steps/12/logs/errors
>>
>> It would be great if you could add another patch to your series to fix
>> libcheck, and also to do 'bitbake world' to test as many packages as
>> possible before discovering from the autobuilders.
> Here are more failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5689/steps/12/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/5689/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5340/steps/12/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5340/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5340/steps/13/logs/errors
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/5340/steps/13/logs/stdio
>
> This time the error is:
>
> stdio: ERROR: core-image-sato-1.0-r0 do_testsdk: The toolchain <...> is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' .
>
> I'm not sure exactly how your code triggers such error, but it appeared
> when testing on the autobuilders with this patch series and disappeared
> when I removed only these 5 patches, thus it seems related.
>


