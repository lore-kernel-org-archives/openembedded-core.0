Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D45C433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 17:38:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.9024.1636133907876141880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=blX5ZxG/;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id u141so1545853pfc.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=2o/vA9k8vKYPltBmSuPGnJcHE+rms+o7qZ21pryZx6w=;
        b=blX5ZxG/BUMQEgiY8VEdjvXXKyLwjTm8HE2LyEXh5zEXz5j217dCihro6hBxLt0VWF
         jzDOGd+tOJqqRP94btLAQ++Ra5As49jUzom63Lax690TfWkrHPq1ssXeUzEBKd4SfpbB
         9W5TsZaSB1PdssvgKK5pYlr8uQ2r1HXI861O3S+lX2pIjE028zv76+W4GPIW3zmsQlpy
         pvqaaDzMkgjNNzkPx8zjxnVdpCz3yJPBM4mr91efScnDBQmyFisB/wkTC+17lts8vb5K
         nffFMCU1kC7fIh1Q/UqoSPXMAm6QcvzGmQAk4as98/Gj31kKI6qA6nKqOHIepzXGVome
         xDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=2o/vA9k8vKYPltBmSuPGnJcHE+rms+o7qZ21pryZx6w=;
        b=xdQUwIkZ7bBx16TOBA9jL7rypsNNDIKr8x1RbHjTpgJiwm5NC7srNeAkSxwjOsHsV8
         1NDkkz+oSRX8Y86J4xoyL4ruHwVWecc6XD4x6y2ne7LEuYqUpYv7/j1YdRq6pzyfE2KQ
         07L1kLIp4ZmHYfSoxqYl8ad5NJdOj4r2mS/Lt31A9q0q8jmAUVaaN+tvuIwevnvch5By
         DE5PvuVJjIx8k9dNyOa9G5+UqxKWKGMxGWI8IcoG/el1ZnVDjjTYFY5s6aH+05/baYdD
         BjmrKHeZFxig79WdFmOGP0FOE0IUaCUurPriSM9kK4OIUtl6XfCa5tFqNBTR3JSJKdX7
         rg4A==
X-Gm-Message-State: AOAM530Bbex4xebSN6qzbiQ8yYoO4iehwDxjEeoxN6BWqcS1s9JFHQ5y
	RUPXMrhtvY9GtbcvvqL/Rq4=
X-Google-Smtp-Source: 
 ABdhPJxmJ4oD+eOzUGHsWOIk6WW6N+raHZJ1CUhfbn/Ui7ZGXoDS1tgmVknbYLxajASj26lfu7Syqg==
X-Received: by 2002:a65:6411:: with SMTP id a17mr12396215pgv.54.1636133907345;
        Fri, 05 Nov 2021 10:38:27 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:9103:5ab5:3527:3728?
 ([2601:646:9200:a0f0:9103:5ab5:3527:3728])
        by smtp.gmail.com with ESMTPSA id
 s11sm7735226pfd.182.2021.11.05.10.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 10:38:26 -0700 (PDT)
Message-ID: <cb13b04a-5f9a-6220-61b9-1561f3f9fe09@gmail.com>
Date: Fri, 5 Nov 2021 10:38:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH 3/6] linux-libc-headers: update to v5.15
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
 <57d58cf2b9094e474cf01c17e475b0526ee969d8.1636054726.git.bruce.ashfield@gmail.com>
 <c13e0bd91696d38e2a42292f2098324591a6a6d0.camel@linuxfoundation.org>
 <CADkTA4PcSaeCTNOhencoQzydgcMfRByQYMOvq06=idJVirGm7Q@mail.gmail.com>
 <CAMKF1soD0m7QB3Yn3dSK1FZRUPiQ=BWQdmMFgjXn-2XgZN=Efw@mail.gmail.com>
 <CADkTA4OOUvBoNuwrzzeS0o4xDzf8EqsTujN8uT_FZetk0x=ZBg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CADkTA4OOUvBoNuwrzzeS0o4xDzf8EqsTujN8uT_FZetk0x=ZBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 17:38:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157920



On 11/5/21 10:37 AM, Bruce Ashfield wrote:
> On Fri, Nov 5, 2021 at 1:08 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Couple of failures in meta-openembedded not too bad
>>
>> https://errors.yoctoproject.org/Errors/Build/135189/
> 
> I'll have a look!
> 
> Doesn't look ipx related, so another removal perhaps.
> 
> Let me know if you are fixing it, just to save duplicated effort.

I am looking at mctp you can look into sdbus-c++

> 
> Bruce
> 
>>
>> On Fri, Nov 5, 2021 at 5:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>>
>>> On Fri, Nov 5, 2021 at 7:18 AM Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>
>>>> On Thu, 2021-11-04 at 15:48 -0400, bruce.ashfield@gmail.com wrote:
>>>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>>
>>>>> No patches needed refreshing or removal, so we just update the
>>>>> SRC_URI and pick up the latest uapi / kernel headers.
>>>>>
>>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>>> ---
>>>>>   meta/conf/distro/include/tcmode-default.inc                   | 2 +-
>>>>>   ...{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} | 4 ++--
>>>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>>>   rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)
>>>>>
>>>>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
>>>>> index 58f49800c4..86a6b50433 100644
>>>>> --- a/meta/conf/distro/include/tcmode-default.inc
>>>>> +++ b/meta/conf/distro/include/tcmode-default.inc
>>>>> @@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>>>>>   BINUVERSION ?= "2.37%"
>>>>>   GDBVERSION ?= "10.%"
>>>>>   GLIBCVERSION ?= "2.34"
>>>>> -LINUXLIBCVERSION ?= "5.14%"
>>>>> +LINUXLIBCVERSION ?= "5.15%"
>>>>>   QEMUVERSION ?= "6.1%"
>>>>>   GOVERSION ?= "1.16%"
>>>>>   # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>>>>> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
>>>>> similarity index 81%
>>>>> rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
>>>>> rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
>>>>> index 282c04d79c..588cc3acd1 100644
>>>>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
>>>>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
>>>>> @@ -14,7 +14,7 @@ SRC_URI:append = "\
>>>>>
>>>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
>>>>>
>>>>> -SRC_URI[md5sum] = "a082ef5748b813abca0649dab8be5f52"
>>>>> -SRC_URI[sha256sum] = "7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2"
>>>>> +SRC_URI[md5sum] = "071d49ff4e020d58c04f9f3f76d3b594"
>>>>> +SRC_URI[sha256sum] = "57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8"
>>>>>
>>>>>
>>>>
>>>> Looks like there is a musl issue with the ipx.h header in ppp:
>>>>
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/4299
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/4313
>>>
>>> ahah. Something my a-quick build didn't hit.
>>>
>>> I'll fire up a build here and see how we work around ipx.h going away.
>>>
>>> Bruce
>>>
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
> 
> 
> 

