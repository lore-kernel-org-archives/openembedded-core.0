Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52259C64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:36:49 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.14743.1677235002687276125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 02:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HBbycrRY;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id q16so3082532wrw.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/U41cePLeQ0tFser5Tn7VHJ21SEgfNQf602DBg1JoI=;
        b=HBbycrRYk8V4xLQH7ssfx/jeE8L45+N9Ccmbju/FtOhDstC/3B2PoukVvzczDvbOD5
         huilGLH/GgQijF8jyBhnd/daa68yHZXZBdkRgfs8l8mVOv2MUg39JvibyGWRUoQHm3Jw
         SbAK6/VmKSh+M1/B+VPSQL7ldNHjoT+FHQBRWYLgJmdplXjmHkHAWK5gGaUW7d7VjtFl
         pBKtkeotjAf4FEWxAFixDm7GJzq4Hfr6uemoP+7WLadoe3jMXJb2GEvfNlspTsIr6pgg
         5gtdQaVtJfVZ/PyMtVfkqbhHw+KrvMUAMJCpVPVyAmeCL2nK0WtU1a8+T+zLCC7YvgO8
         MkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/U41cePLeQ0tFser5Tn7VHJ21SEgfNQf602DBg1JoI=;
        b=THIQOFTk4FaZ30yrI5EGRX95d2az2+gLV86lMIqcH8A7FoOs6fISKATXRSVIXPMpJO
         547HdGhpQc7Iz7BQ7msLLeMV4j8EP0wffUfTOXOCefC8qDkdEu1iodhIGWVG9+n4nGKR
         qlb/O0aVUyEgWs8PW570J4LGTRUM/FkETHQ7spqqhcCGoVG54DxoqVvPLmoQyClxhTY+
         1j6nuiRTisRkwoKSKsfKGgJc0vGEqHcedI+Q2pxmbSzhq7U7dTncGte7H5WbznAMXAEb
         cnOVRx+1MWrN2XJj0aG5AqX7LJ+sZ9rtb4jyQsQnwBUk4gDyTGHDlxX3NpHloMRyrfWP
         eJQQ==
X-Gm-Message-State: AO0yUKU+0x73+0cFMtUiopx+954vQwXsaUeiEacnSiaBcqx/k3aQgqjE
	hlfabg2rmHMZXjk+DLlX01TZgyEt9IuvWg==
X-Google-Smtp-Source: AK7set/eYbI1eLUReSErBn/GdwljQfdxPyr87DihK/9y2HKsx77KVIuyB4+tQyYLAtQv/JXUfI391g==
X-Received: by 2002:adf:fc10:0:b0:2c7:832:8ccf with SMTP id i16-20020adffc10000000b002c708328ccfmr10153360wrr.53.1677235001186;
        Fri, 24 Feb 2023 02:36:41 -0800 (PST)
Received: from [192.168.1.143] (BC24452B.dsl.pool.telekom.hu. [188.36.69.43])
        by smtp.gmail.com with ESMTPSA id b15-20020a5d4b8f000000b002c561805a4csm14663615wrt.45.2023.02.24.02.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:36:40 -0800 (PST)
Message-ID: <2027b077-00c4-ccd8-9d6f-8596333cd3b1@gmail.com>
Date: Fri, 24 Feb 2023 11:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH 1/4] bindgen-cli: Add new recipe
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230224093850.3393567-1-zboszor@gmail.com>
 <CANNYZj-Cuande0w6CpviwoKWO4wT2pu6JOjzKPaCGAxLkFNatg@mail.gmail.com>
 <af312db7-d1cb-499f-4574-1a13da64d01c@gmail.com>
 <CANNYZj_0+y46d7k8xkXAmhi8sHfi37YjG=PuSR37mqzHqFbA7Q@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_0+y46d7k8xkXAmhi8sHfi37YjG=PuSR37mqzHqFbA7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 10:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177676

2023. 02. 24. 11:13 keltezéssel, Alexander Kanavin írta:
> On Fri, 24 Feb 2023 at 10:59, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2023. 02. 24. 10:44 keltezéssel, Alexander Kanavin írta:
>>> As this is needed only for rusticl, and that is switched off by
>>> default, there is no need for the recipe to be in core. I'd say
>>> meta-oe is a better location.
>> Why?
>>
>> Rust itself is in OE-core for a while now and
>> bindgen is practically an integral part of Rust
>> if it's to be interfaced with C/C++.
> That is not enough for inclusion into core. It either needs to be
> useful in a typical, common embedded use case, or be a hard depenency
> of such an item. So it has only one consumer, rusticl, and even that
> is not enabled by default or broadly useful.

Understood. I will move the bindgen recipe to meta-oe.

>
> Keep in mind that maintainer capacity is not infinite, we're all
> volunteers except RP.
>
> Alex


