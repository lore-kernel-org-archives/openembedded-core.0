Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8516ACAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:47:26 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.54176.1759153640077404747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mkf4aX+Q;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-4258ac8f64dso44913515ab.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 06:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759153639; x=1759758439; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=030ClkkkO4/00x5X6vv7xV4tdsmvPGruv+ZCZYUYz2A=;
        b=Mkf4aX+QHPjhFxNpv5ViWfKOaYSmXBsEqH5UZB7zy4oGmdsVFfNOsCjvxkV1asEg3/
         ivCMCeYRAo+WYkB4Lptrc3g757BYdNrgSpe496K5jGWI2l2ixXrrHYT4B6AN+nmkQEA9
         oQO9TZrgWRIpc9B408dwboXycinZY4pvnaLf/N3TWfW9Ce7xq1WDscp29ayHEuPPhYEa
         IOvF1hCPZKOw6uRhqdEmvnAunR+BtvSayJWPXohby756C35aS1eAMOdWuWrlM8VCKl/N
         x2qnHB//O+pxWWQ5p/Z21PJnWYQQ5OtI1YI3J4Q6vQJ3xsu7DBwoXtq1BNF6ZfSu5Yrl
         okGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759153639; x=1759758439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=030ClkkkO4/00x5X6vv7xV4tdsmvPGruv+ZCZYUYz2A=;
        b=ltYZJjMa6aAi4V1olSJOzneifi9NAZ0zlVfyIBxVukglfS48f8IG0VFN30hGtoxNsC
         7vWC5PSVu888Ihs9KJYTy3almCIZF7vQWID2GYn/KgfgpNxmQCDDQQIvuePo4hn1a29H
         2hl05yyGeR4w4xm656qZVDm5MSkAXuxoNFWejfuMmgo8wlkqCCyexcdqynZgNH5fuc8j
         Wk4Xp0p/7yStx8/aNHBkfGEoyfRoltFnLuzcNphngKm0FHcK3eqnHDQNzY2KlN3cpM/F
         yU+jkq3l8Lhkhr+NkAEdYlvYlMLfF5f1IzXHJ+IUVQ49ogO3TAKT8dL7D60pZrUcuV44
         RCqg==
X-Gm-Message-State: AOJu0Yw5Bu2QvzlFjg0fv+SgKFNU4EW1xg9am5IclwXvxhCajbND9wF+
	2KXH+da9ym5S7VME+6emc1J9V5s2PnQsE00tY0Muh9eBlHkZh/xbBMUA
X-Gm-Gg: ASbGncsn0MM1YGtG8w5Ez2L3P0U4AxujucYp9ggLDCUWjYzYo0yZM076HQl41INtZkB
	NoKQx7tUOMeZqcMuKbn/ikFP0OiGEB88K0x++v5xJoi35yqwBI/sBvoJF+jGEIGNwO7rXCl3ZlX
	B5afWYML2sRAxgVZzA63GhdOXjRcvqGUncJmylC4gS3aNU4EEFJ7bK3s5/hCqhyBkl2icNB9wC1
	DQ057zPng/HoW1buzL7YxCi/QhyCCS0Jgng5xuAv2SLToR3y9ad8+R+gvngn4VYdqzoVc00aBOq
	SwUx/oDB2UGSXOrZgcC6p/Tw2p9duvM448k+G8nRsd1f9UVyPTV4at2tClTH/PuDoRZJ1Pk20g4
	3ToULXSIOGZjmQHqMUylc9fa7YOgJJDVoWl0H57IPzpIEnHOkGTVewfzEPWF3QBT8Da8Zhml9iQ
	==
X-Google-Smtp-Source: AGHT+IE14LmzIj0JHwlSuteb0g/lMEyzQ3RdfWl4Lu3pTbJIv88GwGMcjNvaBx9zJfd7Gaq8BDvyUw==
X-Received: by 2002:a05:6e02:1547:b0:426:2f95:318b with SMTP id e9e14a558f8ab-4262f953c65mr269580535ab.29.1759153639191;
        Mon, 29 Sep 2025 06:47:19 -0700 (PDT)
Received: from [172.26.252.3] (174-16-207-42.hlrn.qwest.net. [174.16.207.42])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425bbeb54dcsm58716965ab.2.2025.09.29.06.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:47:18 -0700 (PDT)
Message-ID: <9d9b71c6-76f2-4964-8341-4918eb9d66b4@gmail.com>
Date: Mon, 29 Sep 2025 07:47:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rpm-sequoia-crypto-policy: add nativesdk to
 BBCLASSEXTEND
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, zboszor@gmail.com
References: <a5b379d1-88b8-499c-bfe6-d741e508ca84@gmail.com>
 <CANNYZj9PM=Sn5zy+6-N6ZFvzEt4eJpM5dGNAMong8WMtOHtNeA@mail.gmail.com>
Content-Language: en-US
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <CANNYZj9PM=Sn5zy+6-N6ZFvzEt4eJpM5dGNAMong8WMtOHtNeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 13:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224142

>> On Sun, 28 Sept 2025 at 22:32, Clayton Casciato via 
>> lists.openembedded.org
>> <majortomtosourcecontrol=gmail.com@lists.openembedded.org> wrote:
>>>
>>> This does not occur with "PACKAGECONFIG:append:pn-rpm".
>>@
>> ... 
>>@
>>> -BBCLASSEXTEND = "native"
>>> +BBCLASSEXTEND = "native nativesdk"
>>@
>> There has to be an actual use case for doing this, and some standard
>> build path where nativesdk variant is tested. Otherwise, it's a
>> workaround, and you need to add sequoia option such that it's enabled
>> only for native and target.
>>@
>> Alex
>@
Hi, Alex

I understand the pushback against unnecessary functionality.

I would still like to resolve the case where "sequoia" is in the ??. 

What are your thoughts on this alternative?

PACKAGECONFIG:remove:class-nativesdk = "sequoia"

Thank you!

Clayton Casciato

