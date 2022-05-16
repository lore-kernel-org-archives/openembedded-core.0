Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E6CC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 12:52:20 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.28137.1652705537544195029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 05:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MlEbV9bK;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id l19so17978583ljb.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=4DT66ptsoa1bZW5EIOKFNmixfAi8EAUBEkGNXQSPk5k=;
        b=MlEbV9bKgRYqya+DH2rC9k49UAUCbQse+cSQvtVipnsliggOGFLlmm6/p+WA4tZreJ
         X3Er9/dkZq+1shxNQi/1m3/rwthCgfwwjLowAgslFJgW+PaeNdcXu0uqAuD+YVSYvv8O
         Irvy7s99jl8AZNFiqAPiY2gHclOpKLoCWQrW71DzTFmgPgZGsxISgK1BBRSIbeSMMWa3
         xelZB1O/E+1DtKbGzGB8g2km3Q3FipGElPo7QlmKni0sNrREfDzhiJSetY2bQOM9Ew83
         gr+uP3+Di2oevV1e86KzzO74e0y4Y35HYckHMp4g7RcYNnPEvt/t+4iFo9RKejxePsmP
         M+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4DT66ptsoa1bZW5EIOKFNmixfAi8EAUBEkGNXQSPk5k=;
        b=7316ebMnDx93qQQ3186XY93icvtQ6hh43pwqPpcS3Xj1ilWwnddPlgtu1+Qmwsf3Mv
         EJvgPrSjHFAixI0X8OjeZh2xOsamVRoVRZu8o1OS1dame74pUaLlQ+HbdtyhCfOiQc4W
         pWZlVXtz8SRnxpAJ29STalbiHN0mSwpIBylNajSCgGTAhYpFMIuBU3uttp/mGl5NLjKp
         W/k8L1YwuHAWtohps6TFfZJcZwd8jIjj/naBy4F6Dr/fxmi4yVbsdBd0J1WMeUIscu4z
         lIOKbbo+wzQ4g6NThfSS3rdImuW45YGO9+FTf0wm11YiIdWOI03NogQsRX4gXgt1ZAJM
         nn6Q==
X-Gm-Message-State: AOAM530pTVzG7R6PriBLdEioC/lA5wssMI+DdbOm3+amhwGWYSmFQIN6
	D2+WulAq8Pcw3f+hKzLO8vk=
X-Google-Smtp-Source: 
 ABdhPJztcU0mUo9rE6Dicg0OZV8vncbfpYgIOVeXv1qqgP57qwcHHF/OZ1sA32KR0jw8JNsKvKbVqA==
X-Received: by 2002:a05:651c:1988:b0:250:5c21:5b9d with SMTP id
 bx8-20020a05651c198800b002505c215b9dmr10807671ljb.25.1652705535705;
        Mon, 16 May 2022 05:52:15 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 l28-20020ac24a9c000000b0047255d2119esm1291494lfp.205.2022.05.16.05.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 May 2022 05:52:15 -0700 (PDT)
Message-ID: <660498bc-9239-4f1f-097d-29b562ba76a3@gmail.com>
Date: Mon, 16 May 2022 14:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [OE-core] [PATCH] selftest/imagefeatures/overlayfs: Always append
 to DISTRO_FEATURES
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20220516112849.448882-1-richard.purdie@linuxfoundation.org>
 <7763f240-35b1-27d8-f2ec-8860dbea0e48@gmail.com>
 <63b10a5b05a1a029e50725341b1cb5cf4838ac53.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <63b10a5b05a1a029e50725341b1cb5cf4838ac53.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 12:52:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165679

On 5/16/22 14:38, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2022-05-16 at 13:43 +0200, Jacob Kroon wrote:
>> Hi Richard,
>>
>> On 5/16/22 13:28, Richard Purdie wrote:
>>> Using += unintentionally removes all over entries from DISTRO_FEATURES and
>>
>> "over", you mean "other" ? If so, how is that possible ?
> 
> I mean other, I'll fix the typo. It happens due to:
> 
> meta-poky/conf/distro/poky.conf:DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
> 
> which interacts badly with "+=" :(
> 
> I'm not happy about the situation with variable interactions but still
> not entirely sure the best way to proceed.
> 

That is surprising to me. I tried this snippet in a Makefile:

foo ?= bar1 
 
 
 

foo += bar2 
 
 
 

$(info $(foo))

which produces:

bar1 bar2

which is what I'd expect (maybe because I'm more used to make than bitbake).

Aligning bitbake's and make's handling of variables would make a lot of 
sense to me...

Jacob

