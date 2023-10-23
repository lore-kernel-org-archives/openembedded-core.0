Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14026C25B46
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 17:05:13 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.126517.1698080710260259395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 10:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WigmV2Ji;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9ad8a822508so534833566b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698080709; x=1698685509; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RqT4nUyY5SPfq6lVWuHO5P21zFWbEIouGarR30tFtZc=;
        b=WigmV2Ji2u2uL05VkiwpjVxs4EWQNRhmgBXHG74/mlvU2jA9dXPM6Yc6BooGkuEuET
         E7JWkH6Dtwvh9NKUJJq/i8o/sK78HseGO+AxFDPvV5LFd46RmLUf+w4fIWQGIDkTsn+h
         HIf/56yd2yYnNYv7Nzp/sP8iAsNx5Uj3fmPQPfSFBidDxHMydhesXWMeNBWeJmcZliCW
         b1xeFealIpa/DOmPDIj6krRoHxocChclwZL+1XqIA3SdkCwRDa0JerbuUEczx3XF5/ZI
         J3VzjC6O0zN/FteInoxvWUcVf+mVlCB5ayMf3YNltjaHspTwgAGQOcpXccNhyH2Y+XsV
         Qc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698080709; x=1698685509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RqT4nUyY5SPfq6lVWuHO5P21zFWbEIouGarR30tFtZc=;
        b=pn74zp69jxyh9TTvKkEQDpLkfdIWASlDSEQQ0m1vzmMPRco7m+AmC/6BAC3WI7Jn9c
         OFDydt320+3KI7+gICwfMbwiC4DpVZ78j1l5XyN0qhZacHN9yHDkMZ3V59ideEP9nczL
         hKf3yIi1O7GYAG50kbphlHbB4nD1Hq7bri7wqeuF2T/rXppswQlMmjQD8cxfX5eWwxYO
         vhBRQnnIov7fK687E+KEt3Iy3oOTaqnPPJn2GUwT1TDDVsZw8SDb8FUz03NrLp85FKmT
         C/SO/zHfr7WuuJs6AoSOkRjdOXc+7NXpEdqIhz+4DDadjvo159C7INsds3wbWIM40yzI
         3fVA==
X-Gm-Message-State: AOJu0YyRYLafsokcjGWiZhNMIjeprtG6EbDTlLIO2dWnzdZervz03fLz
	jVX2jrLg9i43RJJXdsxUEV8=
X-Google-Smtp-Source: AGHT+IHGB8V6ioK0Dl5o8DJ4TUnMwSMUC1+VyCV2qukn96lt89UDLR53vwwO/OLdX+/xyGANVGLvrg==
X-Received: by 2002:a17:907:9727:b0:9bf:5696:9153 with SMTP id jg39-20020a170907972700b009bf56969153mr8221950ejc.57.1698080708342;
        Mon, 23 Oct 2023 10:05:08 -0700 (PDT)
Received: from [10.134.42.224] ([89.249.73.138])
        by smtp.gmail.com with ESMTPSA id dv19-20020a170906b81300b009928b4e3b9fsm6994316ejb.114.2023.10.23.10.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 10:05:07 -0700 (PDT)
Message-ID: <201d71f6-835e-4079-8c75-bce3d59504e9@gmail.com>
Date: Mon, 23 Oct 2023 19:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
Content-Language: en-US
To: Lukas Funke <lukas.funke-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
 <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 17:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189625

On 23.10.2023 14:18, Lukas Funke wrote:
> Hi Slava,
>
> On 22.10.2023 20:34, Vyacheslav Yurkov wrote:
>> Hey Lukas,
>> Thanks a lot for the patch. A few questions/comments from my initial 
>> test below.
>>
>> - I tried it with a go-based backend I have by providing ssh URL to 
>> github. It seems like the GO_IMPORT is set to a module name from 
>> go.mod of my project, which of course fails to fetch it like that, 
>> because it's not a valid URL. How is it supposed to be used?
>
> Your assumption is correct: the GO_IMPORT is taken from the go.mod file.
>
> I've not considered the case where the repo URL is unequal to the 
> module path. This may require manual rework of the recipe. Another 
> solution would be to take the source URL from the recipetool. I think 
> there is no correct solution to this problem, because probably most 
> people might want to have the original solution, since they are 
> creating recipes from oss components (i.e. from github).

Ah, it could be that module name is not used correctly in our backend. 
I'll try to put a proper URL there, thanks.

>
>
> The file will explode anyway. Thanks 'go'.
>
> Adding more intelligence to the underlying license detection could be 
> an idea: in your first example, the license file contains actually two 
> licenses: MIT and Apache. Yocto has no way to detect those cases.

Yeah, I only mentioned 2 out of 20 in my email to not make it huge ;) 
There are indeed around 20. I'll try to prepare the list and send the 
patch to include them.

>
>>
>> - Could please clarify where does the version from go.mod hide? Is it 
>> taken directly from go.mod? I'm trying to understand what should be 
>> the workflow when a module version should be bumped up in the go.mod. 
>> Will that be reflected in the recipe in any way?
>
> No, currently the go-version doesn't play a role ATM. Except one case 
> when you have a go.mod file with go < 1.17. These go.mod files don't 
> include indirect dependencies.
>

Still trying to wrap my head around... When there's no version at 
parsing stage, how this will affect reproducibility? If it's not known, 
then whenever the version is bumped up in go.mod, a manual 'clean all' 
will be required? (It's probably the same as now though).

Thanks,
Slava

