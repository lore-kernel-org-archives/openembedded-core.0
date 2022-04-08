Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC277C3527E
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 20:12:14 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.1543.1649447994480413212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qR8HZGRD;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id z128so8678830pgz.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 12:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=4tNLs8DqnCRTJ4KCMk47eLZTc0elXg4fRafMYrnhn3Y=;
        b=qR8HZGRDx02VQCAGJclqt+9yQZoDgk+BDhuWOo/WNy1WgNK8KVeoYSyltgfJtXCqUM
         56f/DNF/zXfvPOaqwLFEwHb7I1ztgl1by7QQKSS3DwnPDIhQ6oLaFUwgn3ph5ZXgcKWe
         loP/XidnPFt/b96313BJ1TgP/IUjqMTCRQRzEArE9AEvKe+LbFjxLzrvYiybRuuUXoJe
         qDGVfC+G8pT9IDmayfZcCof7urk0YOY4Pptm7t6MbnsJq7oD37r+ya+HT0ZIPW1PjvWz
         iFaUlA4EsLoMmX2zdSRa0kVrxv4yskkSIrpqj5A9MbnbkKgrHeKE5FpRxQhKxozB71h2
         U74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=4tNLs8DqnCRTJ4KCMk47eLZTc0elXg4fRafMYrnhn3Y=;
        b=g8XkwO7OG1zpS7Sg15eHz+5VFBwduC14nYQwst/N9T3KYJL7x0RmyW8cTh2Vw6Xt41
         3YfmomeDe7p8htSTtrbsZP4IokkPQapEJNHeHOzFzPqPcSSdcnqqH73ujP4r9O631PlC
         2haBHORjTG8bhOL0L6aJbSlqpBhon0DkAIlY6VPImPwMDO71paR+BQF+aK9gzSc+b3cA
         aURwbFQ9kqha0dU3fyGRRHDf9n+giqXE26+sw5v3GfWocXRyfrDieanqyKiiTr4slt1m
         h2s4x2xbHJWE5xA9ftooQ+U5gaOmc2VQwHO3tmg23+HI1R4J80zYcxxRXn0sV8oliupj
         91yg==
X-Gm-Message-State: AOAM531y92yqiTvD7iGSMDm51h45z/xTjCKEUtfHFBZJQ8kvoZ433sc8
	3QSQzLb5r7GBE/S0y6qhcStmw5DArdvZOw==
X-Google-Smtp-Source: 
 ABdhPJyp5m3w4GFQU3q+Psndp4ZsGivvo0+h+H6zt3LBb2qgDCKPDbeEJyiAJ00LZyt6syEUcZnd7Q==
X-Received: by 2002:a62:1ad3:0:b0:4fa:9adc:7680 with SMTP id
 a202-20020a621ad3000000b004fa9adc7680mr21342880pfa.25.1649447993841;
        Fri, 08 Apr 2022 12:59:53 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:55c2:182d:f2d6:dc4b?
 ([2601:646:9200:a0f0:55c2:182d:f2d6:dc4b])
        by smtp.gmail.com with ESMTPSA id
 x123-20020a623181000000b004fdf99d25f6sm19478364pfx.80.2022.04.08.12.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 12:59:53 -0700 (PDT)
Message-ID: <68c41d95-2e35-ed3e-3a0d-7aa7a9151bca@gmail.com>
Date: Fri, 8 Apr 2022 12:59:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v2 5/6] poky-tiny: add a distro description
Content-Language: en-US
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
References: <20220408192521.1608764-1-jdmason@kudzu.us>
 <20220408192521.1608764-6-jdmason@kudzu.us>
 <6f6d562e-f33f-e528-4dda-ccc4bc444b74@gmail.com>
 <CAPoiz9zasM8oWqhSaiDVdvWwdrWPEkt=Qzr9VH41os1RsNz_jg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CAPoiz9zasM8oWqhSaiDVdvWwdrWPEkt=Qzr9VH41os1RsNz_jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 20:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164175



On 4/8/22 12:55 PM, Jon Mason wrote:
> On Fri, Apr 8, 2022 at 3:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 4/8/22 12:25 PM, Jon Mason wrote:
>>> Signed-off-by: Jon Mason <jdmason@kudzu.us>
>>> ---
>>>    meta-poky/conf/distro/poky-tiny.conf | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
>>> index 499af906a898..91c596faf182 100644
>>> --- a/meta-poky/conf/distro/poky-tiny.conf
>>> +++ b/meta-poky/conf/distro/poky-tiny.conf
>>> @@ -32,6 +32,7 @@ require conf/distro/poky.conf
>>>    require conf/distro/include/gcsections.inc
>>>
>>>    DISTRO = "poky-tiny"
>>> +DISTRO_NAME = "Poky Tiny (The Smallest Yocto Project Reference Distro)"
>>
>> maybe replace 'Distro' with Distribution
> 
> poky has
> DISTRO_NAME = "Poky (Yocto Project Reference Distro)"
> 
> But I guess there is some form of humor in the tiny distro having a
> longer distro name :)


I think this gets into image as well isn't it? If so then Just call it 
'Poky Tiny' is good maybe, saves few extra bytes in image.

> 
>>
>>>    DISTROOVERRIDES = "poky:poky-tiny"
>>>    TCLIBC = "musl"
>>>
>>>
>>>
>>>
>>>
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#164170): https://lists.openembedded.org/g/openembedded-core/message/164170
>> Mute This Topic: https://lists.openembedded.org/mt/90343239/3616920
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jdmason@kudzu.us]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

