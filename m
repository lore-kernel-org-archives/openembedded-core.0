Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1776AC433F5
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 19:58:36 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.13239.1636919914454082723
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 11:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bR/eMWlT;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id b40so37632153lfv.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 11:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8tNJ5aJs8Uvh1kajAy9+v1K6olhBP4o/3C5dyESp5Hw=;
        b=bR/eMWlTEiqXUTXxkgfT+Nr8iUAKDZb7YcM9gjx8nFV4PNX9mJohlrO0am9cgfYITT
         /lWLWeLVog+pcF57uc4nH7Rhz6ekvEZIM+pEkobDDPEHtWEBIuRo4MC05sdT4Y0scR85
         bKAQrFCNysA52Z0C76FHmMuV+f/OenvVbfMfrEdoY4HCS8gqymNM4NnDIE4Q6bLfSddb
         ZKkP2ESmeV6PaGpexLsDJgC4C37srkT18NKfKEzDpZIyuGuBdGkAOtlhRdzi67IaDMAt
         6ghr/RjOP6Q8tHbywYhDjwdnrHd6JCIdWYGM6tb3zUpDqPL2tegu1E826J9+AXMY/2pX
         E8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8tNJ5aJs8Uvh1kajAy9+v1K6olhBP4o/3C5dyESp5Hw=;
        b=YjMM7wiG0Yqf2FC3cXZM/a2ENWNputjB4PafPC9IGfzSWppgLe4ZGZ+sLv4UDeH2Jn
         SMNNatx9B1BesErdnzdWwkqHslSLXGh10l3y2gaeMvkC76yDfMYRZTGM+b8PJ/VTDj9s
         kb0YCqqf+djFmb6XcbqYuSUtIRuYGkgq/CEh730+XQu1TTxN31EKRL4L+erpEoLcNCwA
         IcMhjDHYRBBUW4NkdqO2Omzrca9qhLZhJtkPwMeJej9A9qe3ujj9UNrhg4yyP8w8eCLH
         RJJoUvcv8SyIBsBivYais4iZXm4XcAb61j9R1mXVExO/4FGtBAWJXs0tZHpQgBzbtJuk
         7ybg==
X-Gm-Message-State: AOAM530wXNS/PSI+HJ+z11epDBC+eiIGPq9oh6BjNLW5Jk83NZIZSRPQ
	m5nNkvW8ZB7uFmGW5B80krY=
X-Google-Smtp-Source: 
 ABdhPJxj5nLO5D+QyRJjGIx2Q3SFX0aWTLtsVeOzthfcmQpzNgNzVnFqKaXZcbIGjvyBzgKc69xCeg==
X-Received: by 2002:a05:6512:3b2a:: with SMTP id
 f42mr29868437lfv.282.1636919912627;
        Sun, 14 Nov 2021 11:58:32 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 l4sm1077897ljg.60.2021.11.14.11.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Nov 2021 11:58:32 -0800 (PST)
Message-ID: <ada55396-37c7-5c35-433a-71c98b319c14@gmail.com>
Date: Sun, 14 Nov 2021 20:58:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [hardknott][PATCH] mklibs: remove recipes and class
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20211114065008.3899-1-jacob.kroon@gmail.com>
 <dfc7b7fc105d153303d7d5933689d9b469fb5a22.camel@linuxfoundation.org>
 <c02ee82c-4d14-d704-6fa0-50578f9f746f@gmail.com>
 <24dd6bb7c3d4bb755281b3697ed18c7116a5d101.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <24dd6bb7c3d4bb755281b3697ed18c7116a5d101.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 19:58:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158265

On 11/14/21 20:51, Richard Purdie wrote:
> On Sun, 2021-11-14 at 20:47 +0100, Jacob Kroon wrote:
>> On 11/14/21 20:36, Richard Purdie wrote:
>>> On Sun, 2021-11-14 at 07:50 +0100, Jacob Kroon wrote:
>>>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>>>
>>>> This is not enabled or tested by default, and has never been
>>>> ported to python 3 upstream[1], which means it doesn't work at all
>>>> with plain poky. If you need it, please put it in a separate layer
>>>> and/or modernize to work with py3.
>>>>
>>>> https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs
>>>>
>>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> (cherry picked from commit 908df863b419d1cad7317153101fc827e7e3a354)
>>>
>>> What issue is it causing in hardknott? Normally we don't backport invasive
>>> changes like that...
>>>
>>
>> The problem is that mklibs-native doesn't build with gcc 11, and
>> "image-mklibs" was in USER_CLASSES by default in hardknott.
>>
>> I sent a patch to fix mklibs build here:
>>
>> https://lists.openembedded.org/g/openembedded-core/message/151982
>>
>> but after some discussions we just decided to drop mklibs support
>> entirely with the proposed patch.
> 
> ok, that is something we should fix. My worry is that the backport as is will
> need everyone to update their local.conf since the class will no longer be there
> and it will throw errors if people try and include it. This isn't what people
> expect from a point release.
> 
> Could we just remove it from local.conf in hardknott? That should solve the
> issue but reduce risk to anyone who has hardknott already working fine with an
> older gcc.
> 

Yeah I'm ok with that, I'm even ok with leaving it as it is :-)

Or perhaps we should forward-port

ef8b7946b4793db653ef7dd716e1d3f919a84725

in dunfell branch to hardknott, which also should take care of it.

/Jacob

