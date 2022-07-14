Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B390C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 11:15:31 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.6222.1657797324737008058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 04:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S84NpMV9;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id t1so2224153lft.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=w/Huhxj0GmdXNOYBq+dwNal7QWvughejifpWtOJPrBo=;
        b=S84NpMV9lKDuDG5zHoFHATg8z45UARkgXaXx0n03bs6NuU+A2N4Y2HcMfmbx4uDK1d
         sBBCYkIhm8KypjIKJfUEE8ZRHsWgpv6nLXHH2pYW9HkTANRyCsZGLJdqbXxxUNax6iVS
         WYYH2VDYiEWRkiF9xAHLXdBcxtkJYebCR68yY7Bc5/uGm2PdlGFaynFRWNjlOzAjYZtT
         24tm6NI8ErcD8Vv76SZKK65ZKPzUsysZovasXKPaDRQdwVGIh6y23Bc2kVxqVtMHnHio
         u30Qe+M49m1HK2lXfDq9SAzHVZXm/bwSrk+vqLuNnDT0cYGUDXil0cJCbdUsZA/2B/80
         bKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w/Huhxj0GmdXNOYBq+dwNal7QWvughejifpWtOJPrBo=;
        b=ThmzOZQqtkZ5LKFdMLoeZc2JIgNsiQdIWa1vpTHvwxMfzIzxgzbb98LmjJHYvD+bVL
         iiAE+4L+RCCG8XWnN7m0Kr+mJYcWsKnhu40BZyZRedJZeastPHgiQxTRfpSxXC3mmBjx
         ZHeFoFv90H5gErJZGOsnChcSFAAGd1DrS11b9gZ4passXlFI6ypa+gAiRCz6/2jPowrZ
         x55MbXemfrEYHglhopI72kEo2e5LXSqV3UCzbmvQvCaQ9NEO0G8M5FJ59RYZscYruiI6
         pM5YY2yTj5eEUmOMH7qZIidZp+eWkfnvRToYrKOs0n2LaRn9meF1uVSeQzn7m6Qax5dk
         iXsA==
X-Gm-Message-State: AJIora9XeP5mTfGkZVHRMaQqL/2CzkD8oPwPF1f2VScsetQjmop//C9Y
	oRVGIpon93sCl1e89kcVVno=
X-Google-Smtp-Source: 
 AGRyM1sbjPYeF43S+ge5heSy7thM3i/EKauIeHZ6d5kj3vwmivYJ48/3Lf/oHrcr7//W38k9tLE/iw==
X-Received: by 2002:ac2:5389:0:b0:48a:1070:775d with SMTP id
 g9-20020ac25389000000b0048a1070775dmr3324923lfh.266.1657797322655;
        Thu, 14 Jul 2022 04:15:22 -0700 (PDT)
Received: from [192.168.10.113] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 dt8-20020a0565122a8800b0047f9aefa838sm305149lfb.109.2022.07.14.04.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 04:15:22 -0700 (PDT)
Message-ID: <cd66e245-9b30-dc6f-ed7e-a2d9a67df98c@gmail.com>
Date: Thu, 14 Jul 2022 13:15:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH v3 1/2] poky-altcfg: enable usrmerge
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Luca Bocassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <20220713165533.125600-1-luca.boccassi@gmail.com>
 <8189a37bf619f781f8e9437fd5a4b2c7c06c7457.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <8189a37bf619f781f8e9437fd5a4b2c7c06c7457.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 11:15:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168030

On 7/13/22 19:53, Richard Purdie wrote:
> On Wed, 2022-07-13 at 17:55 +0100, Luca Bocassi wrote:
>> From: Luca Boccassi <luca.boccassi@microsoft.com>
>>
>> Ensure it gets tested by the CI
>>
>> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>> ---
>>   meta-poky/conf/distro/poky-altcfg.conf | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/distro/poky-altcfg.conf
>> index f03306e798..57a76e8bb9 100644
>> --- a/meta-poky/conf/distro/poky-altcfg.conf
>> +++ b/meta-poky/conf/distro/poky-altcfg.conf
>> @@ -9,6 +9,8 @@ DISTROOVERRIDES = "poky:poky-altcfg"
>>   #DISTROOVERRIDES = "poky:linuxstdbase"
>>   
>>   INIT_MANAGER:poky-altcfg = "systemd"
>> +# systemd will soon require usrmerge
>> +DISTRO_FEATURES:poky-altcfg += "usrmerge"
>>   # systemd isn't suitable with musl
>>   INIT_MANAGER:poky-altcfg:libc-musl = "sysvinit"
>>   
> 
> This blew up builds since it clears everything else out of
> DISTRO_FEATURES which isn't what was intended. I've tweaked the patch
> and re-queued.
> 

Maybe I'm missing something, but what is the benefit in introducing and 
using the "poky-altcfg" override in this file ? If DISTRO_FEATURES was 
just appended with

DISTRO_FEATURES += "usrmerge"

it would all be fine, since it is after the

require conf/distro/poky.conf

line, right ? And if someone wants to base a distro in 
"poky-altcfg.conf", they would include "poky-altcfg.conf" first in the 
same way, then do customizations.

Jacob

