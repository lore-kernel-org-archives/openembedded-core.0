Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32356C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 12:17:58 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.13132.1691065071238613544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 05:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gucanr/t;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bdcade7fbso123738366b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691065069; x=1691669869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQbEZxG9YwJvaYJ2Rp3uksQ8CsrZQuEk7gqtGH8BBKo=;
        b=gucanr/tOfy3mu9E5Boc4Iu8Uhd9R8QLj6P43lu0pZFyOClCBvZljeas/kyQFHCxCP
         W6rWd45Pnr9F4QPusSlrshB5VbXWjrnck1uvDzNDLeNZyPWyGX81NWYNlb/pXxuUpKPe
         9T+KPgU1tvgEl1L5NM/GbwJlejABYwXMbRymleKrEg9W9b+WgIaoQ8yzDT/IT2ALxjjc
         UI4W2vqDxJSsK8RIvn4YiXzfaInIUR4hhhucwG9BB/5djxuJ8d9M/xnjUM+5xBBKGX0g
         md1fRHV8vz8UjuOfT0hRHzugq51Lw0rD/JW6AGVO6P9bN3+2+j2mbF977HuPkVqp0JUx
         KcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691065069; x=1691669869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQbEZxG9YwJvaYJ2Rp3uksQ8CsrZQuEk7gqtGH8BBKo=;
        b=c4UzUHambTyzhAi2cWz1jkLpbiiT5XeI4AbjmnK32oFOq3sI2RGf2yWb7DnjYGishP
         cWBN1vIOFRxC1kNdhbxUBXAUb4/BsVqAwTznHiwWVhhkVPSenqmi/Nmgn33k9du0gpi4
         vpxhH6kLC5rqZ/ZkF/Bp2O19J2vii5eq0gmyc0TTjScanECyBxeQ3qI6t7keUJ9SOYrx
         EwnIBBS2qrqOtsHFBrbh+9fC8TaZHAbnK9UuI3a1rz1EDJ1FHtDAhOFP0jRcw/nVqx3W
         3Bq3zZ0Pup7mB0rqqaeI7f57vDb0Oa1sCCALS7fljNSAClIoGY37yWd2VfqPU08U48Ww
         Ao/g==
X-Gm-Message-State: ABy/qLZ7Vc04gsO511IFdYU05iP9ry5lkB8qsVEZ2Sdrjb2WAo04izRx
	fmszSSyhrWXd2fiLEl7JwQs=
X-Google-Smtp-Source: APBJJlHdBZ6XXAKjRe5+o7IDdprdgFXrhnE0oXj+xw3Cgzu1guHAwJvikG9jsURTcRVJXAVsWT77JQ==
X-Received: by 2002:a17:907:2c68:b0:99b:4ed4:5526 with SMTP id ib8-20020a1709072c6800b0099b4ed45526mr6904524ejc.7.1691065069384;
        Thu, 03 Aug 2023 05:17:49 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id br7-20020a170906d14700b0098ce63e36e9sm10566750ejb.16.2023.08.03.05.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 05:17:49 -0700 (PDT)
Message-ID: <0e09aba7-acd0-17ca-abbc-e6e1d5ee924b@gmail.com>
Date: Thu, 3 Aug 2023 14:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH v6] rpm: Allow setting platform macro settings
 externally
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230801132957.401557-1-zboszor@gmail.com>
 <20230802134131db3e0b1e@mail.local>
 <e4dcb013-25f0-63f8-4713-8d4b71757cb4@gmail.com>
 <CANNYZj_WpBs=f0thUNdEgBi9G-VepAF-_hf2gxsRP1mOjD1vtA@mail.gmail.com>
 <ffd0b874-711a-abc8-0445-2884e24f8a3b@gmail.com>
 <CANNYZj-hE=Cct9bLOhy_kWA9NZqnpUAJ3ZTXW2RnoXzz65B1fw@mail.gmail.com>
 <2b5bc564-f05c-3c14-688e-50b3ba62eb2e@gmail.com>
 <CANNYZj9sn6UyaQwpXwcywBZJ=+PMvUwsZ5AtVx4eeSVqk9xCiQ@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9sn6UyaQwpXwcywBZJ=+PMvUwsZ5AtVx4eeSVqk9xCiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 12:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185475

2023. 08. 03. 13:15 keltezéssel, Alexander Kanavin írta:
> On Thu, 3 Aug 2023 at 12:59, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> When /etc/rpm/platform exists, its content is read and
>> /usr/lib/rpm/platform/`cat /etc/rpm/platform`/macros will be used
>> for setting up essential macro values, even if this file does not exist.
>> rpmbuild will look no further for other fallback "macros" file, like
>> /usr/lib/rpm/platform/x86_64-linux/macros in my case.
> But /etc/rpm/platform contains:
> qemux86_64-pc-linux
>
> Do you know at which point '-pc' is stripped from the middle?

The cpu-vendor-os triplet with the optional -gnu suffix is deduced here:

https://github.com/rpm-software-management/rpm/blob/rpm-4.18.x/lib/rpmrc.c#L689

Then cpu[-vendor]-os[-gnu] combinations are tried as the platform directory names
but I have not yet found where exactly.

