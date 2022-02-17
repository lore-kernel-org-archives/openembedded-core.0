Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D487C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 20:03:42 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.1731.1645128221836041168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=okJIm18o;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id 10so5437952plj.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=ICBj21RMV8bZLnqAse6k8D1x8W8QZIirtvE1jeD1UWU=;
        b=okJIm18oPp2TvAaXvF5/SKnmaNhUKG0zNuMHa9Bnt9iRf00H6ShyoFPR1n6sSYlLVV
         FcKE+Pg6Zox1sq6aLpGuXDhH/WfCZ5nFdmGGgjvi+Bopq4Cu7vnJX6TsfoDd93ywMLSK
         4/AC/Zk6H80weu/Isaf46oB+Z4/YPN2ghdemIvyGEgLcFRPPebskAZEMJLYvrBoz6/wh
         kfH2BNRmNg5y4nzLn0X/tRi25gkmXVdoHIZQs0J1IlwhaVVfPlUanykoDihFIObPK9ef
         /u0SIqHahUJmbzcly1jBqfhkAM0hmgYVgIAbHwqQAvBMvd//wb9fJ4RKZQ+9K1/RJikV
         D6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=ICBj21RMV8bZLnqAse6k8D1x8W8QZIirtvE1jeD1UWU=;
        b=0bWFk20ikLoiAYHoOSRLQBTXb4UcTFjMLZWBwqFNcwf1HVJQxRA71UcDhwjjp5Zjb7
         os/7+fhs2aYkgvYyW1lDd5ixKYM2PjC6bqMMi+8iU+3I8NJoDdz1AHcSCXii0Bfgar+g
         RkCrgqcnDfdbHmY07jHiY2ZurTYFsKtQfG0HbJuITGoF0uwR/9kAUGApew22q9KswJfR
         GGTqAqzU7V+9gMMxYfgvMloMa/Xw4xqfaP7e/0f8QiMddBp3xy9sGF9Fc1HOZ91x2Yx1
         JBqsA8q7Y6e+XL4mS6eKnDm+cENYMvqSzm13dlf6vGEQ4IM8gVLhdtbsy7+gZswznQK5
         a8Gg==
X-Gm-Message-State: AOAM532mQmt0lJUTv78acHdWfH7WXquMUBp3Kt/APyoWbpXh31mj4gYd
	BsurVfQHg1VY5zz7Efvz1xKHM7EiAgLMCw==
X-Google-Smtp-Source: 
 ABdhPJzxwJwH5226RX+N/W6B20TNqNSZ+7bWB6pbEius661kX4CoAz11xjfSeGV0+mRtr28EgXuykQ==
X-Received: by 2002:a17:90b:1e08:b0:1b9:fbab:34c0 with SMTP id
 pg8-20020a17090b1e0800b001b9fbab34c0mr8957001pjb.178.1645128221337;
        Thu, 17 Feb 2022 12:03:41 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:9887:2763:ad87:2b2e?
 ([2601:646:9200:a0f0:9887:2763:ad87:2b2e])
        by smtp.gmail.com with ESMTPSA id
 a38sm425080pfx.73.2022.02.17.12.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 12:03:40 -0800 (PST)
Message-ID: <83fae3c2-2583-f6de-6b17-65193de1969e@gmail.com>
Date: Thu, 17 Feb 2022 12:03:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCH 02/28] weston-init: replace deprecated/disabled
 fbdev with drm backend
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-2-alex@linutronix.de>
 <0d022bb4-9fe0-effa-d6b9-50812f060cdc@gmail.com>
 <16D4AB147C5087DA.27018@lists.openembedded.org>
 <CANNYZj8gG9vxKmU=5AU_7RV51Zji1b=mOT8fcdDqvvo-N9-Z-g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CANNYZj8gG9vxKmU=5AU_7RV51Zji1b=mOT8fcdDqvvo-N9-Z-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 20:03:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161858



On 2/17/22 11:59 AM, Alexander Kanavin wrote:
> On Thu, 17 Feb 2022 at 20:57, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> Yes, I ran a-full with this change on top of my transition-to-weston
>> branch (where image-sato is swapped for image-weston), and it passed
>> with flying colours. Without kvm performance may not be great, but we
>> can tweak that with --use-pixman later :)
> 
> Ah, one exception was x86-x32 (seatd doesn't build there, and swrast
> historically segfaulted with X11), but that target should be changed
> to cmdline only testing, or removed altogether. Intel invented it to
> look better in benchmarks :)
> 

what qemu targets are exercised by AB for full runtime tests ?

> Alex

