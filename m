Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36D6C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 12:32:30 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.5528.1678278749193596349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 04:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SMPxcrEK;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id i34so65049422eda.7
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 04:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678278747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGqQcytLiPOXuvcbZsugdhGDTy/CEeisfuyeA8hKwOk=;
        b=SMPxcrEKtMCF0MuQtmTyiRehnZfpxy9a2sDCOyw7+bLrrTzwQL8ZLtHAnTdDjWwp8g
         YGjBGuAdNS2JtyhEr3F/7z1O2mAr4ZrveBPmQQSEe7lwfEQTxOGjTiY9SZcsE3UJVvb7
         6tOMbT0QiJxrWdZUUN9GnkMRfJ7uXKE2F5HqXRmxrY9bJCexm1/83eJsVwJ03t8J8ZR5
         +hDzzcfzwg98at7whiOG8+KpcZRAB0V6RkBYoDoeZ9RQdCuW4pGJ5X6iLV45vUgUxJ4o
         b2Ss2RHh9MXtKnCEo8cyOOPyRKdZV3u3U8IuSFwtTBMCRb420/Qav9UfJ5WOHmAJ/qVZ
         wzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678278747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGqQcytLiPOXuvcbZsugdhGDTy/CEeisfuyeA8hKwOk=;
        b=LtuEE8ITUYwxPm5bcdSzKC3wo+p4bhxVhzZo6MlyzPlF+g7rml9P5UXFMI5EMvIg9d
         whtnZ9xQVrh7BxRPQ853cYPjuu4OsrSJu8DviG51R7CIsQZ2lbUpsuma/+8iRGXk+mwL
         GaxFRKoX5q8cLXpLEAe8IZvXLNtc/tGc7FHL2/x1QwQIPZVeexujoEMYQbARbuXyc38F
         yX4NuKvkio4g1WKiL0kvSW9zNrkphWrtiEfthR65CgqBykgRT8a0KBMtP0m16uruNScy
         UWwwmGUUSpTeOrjOblND6lbBS+uYcz92ForqSyBuNff97x7OXJKsx5Oy0sz6r09kXhIL
         ngOw==
X-Gm-Message-State: AO0yUKU3sA/j9c9q7jgPhZcvWtWrSavE+7FSdqGo1YiyTylhs1KoRYFe
	PwOSwBtlF1hxOF39Jzp8WvQ=
X-Google-Smtp-Source: AK7set+MWliSo7xfXkaHNxNv/1C2Hdb1dI6G/3ByYq34f+pNf7rCv+GMyQLgUtiGOmoFAAs1HPV+FA==
X-Received: by 2002:a17:907:a429:b0:88b:23bb:e61f with SMTP id sg41-20020a170907a42900b0088b23bbe61fmr22660971ejc.25.1678278747317;
        Wed, 08 Mar 2023 04:32:27 -0800 (PST)
Received: from [192.168.1.143] ([188.36.69.113])
        by smtp.gmail.com with ESMTPSA id u15-20020a17090657cf00b008eaf99be56esm7528112ejr.170.2023.03.08.04.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 04:32:26 -0800 (PST)
Message-ID: <c01e6137-1b57-4ba7-c60f-479af59e3672@gmail.com>
Date: Wed, 8 Mar 2023 13:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] python3-ninja to speed up cmake builds of python
 modules
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <ed526f1f-9ef4-5c46-1ee5-7eef641c9684@gmail.com>
 <1E9DF585-4E79-46C4-A07D-A56B46F9CB10@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1E9DF585-4E79-46C4-A07D-A56B46F9CB10@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 12:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178170

2023. 03. 08. 12:43 keltezéssel, Ross Burton írta:
> On 7 Mar 2023, at 15:13, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> Hi,
>>
>> Recently, I had to create recipes for a few python modules,
>> among which a few used cmake to build their C or C++ pieces.
>> I saw from their build log that they complained about
>> the missing (optional) "ninja" python module, and falling back
>> to the traditional compile-one-file-at-a-time method.
>>
>> Do we want to speed up building python modules that
>> exploit this or using ninja is too rare to bother?
> Ninja is used by cmake.bbclass and meson.bbclass, so absolutely use ninja if the build supports it.

Cool.

However, I am talking about this below when trying to
build ByteTrack from https://github.com/ifzhang/ByteTrack
which needs pytorch to build. Pytorch also has some build
extensions itself:

python3-bytetrack/0.0.1-r0/temp/log.do_compile:/data2/yocto-4.0/tmp-sicom-glibc/work/corei7-64-oe-linux/python3-bytetrack/0.0.1-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/torch/utils/cpp_extension.py:415: 
UserWarning: Attempted to use ninja as the BuildExtension backend but we could not find 
ninja.. Falling back to using the slow distutils backend.

The code in pytorch does "import ninja" conditionally,
so it expects it as a python module. Also, this specific
package and anything that uses pytorch for its build
(like torchvision) complains about the same.

My question was out of curiosity, not as a real need.


