Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF8EC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 20:02:12 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.1791.1645128131543416895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IRWr6hjn;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id p8so574945pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=IVJ8Y+vlU+EgGpGe9moUmMrw3LuXHdZUJfv0/Tlk8mk=;
        b=IRWr6hjnct1LmV/rhFdX+oX9j6k8M42LXqMBPgAIgsS1BE2GulOlBkytL9MNH8uUIv
         /BTI3ho4KR7xQV7GXoggSGQG3BkJZEG503Yak1W6ePEc6zIa+PE4TMqAeucxwINcFcmz
         NYcDCVJKzULudzvLz6Pehzu4YQajRowPLrPSqvUta5UxaMWum7PuK+BkBQWgxPon6vkW
         /S99ckvBzYw6NUBzpg/V7af5IMz/H3nwwdeVnuknnoC4LOaEKwdd/KURyPH8ktgaAxdI
         O3U88oKBPifqsTVAGGRjNDwu36APlXiuciSzwQSRreiiHWtKB7Y0dbM13gJHqv9iOVaG
         DBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=IVJ8Y+vlU+EgGpGe9moUmMrw3LuXHdZUJfv0/Tlk8mk=;
        b=COrNrN9WMiwCuPsts+XTbVEHVT3uRgnKqp3vIWqrDmlShybilAgjImarPdV5D1INXY
         5pz7HWceJUzGk9+9oE8CMtzxmmLLar6q3iL9WIP1l5dls5X1ykDj9tfEXJMsepxRKr19
         txsN3iqCoFwJ4HQW4a0VbkLukAImEfUpxl2Qd8L+TXEAZf+Y8ZwhFWXWkOUnlK96iK+l
         jTdzejf1KfEwMm/I9AeVzdBvtDd3mLKsRE2HSsG16kOwmZZ3eOyKmqri0bGI9X3b+tWN
         i63QEiWbOLLS5qFfJey+cCAw5IESqkuqwSUp+7NqmlqrO6cKRFWyvGdjTMZ+Er+XCtUc
         86KQ==
X-Gm-Message-State: AOAM53355B672etfg827WjPn2snroT21BvZTUJAQnCZ0rgwKXaur9IMx
	ZZBjZfTIMxFS2po24iOzm2o=
X-Google-Smtp-Source: 
 ABdhPJylyV8kikYbZLi51/fF+ANUfBA0bZXM3x6HIprAXK5B+rDKATMO34H/zUj31LoxahQFQT1fSQ==
X-Received: by 2002:a62:1d07:0:b0:4bf:3782:22e3 with SMTP id
 d7-20020a621d07000000b004bf378222e3mr4614167pfd.52.1645128130941;
        Thu, 17 Feb 2022 12:02:10 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:9887:2763:ad87:2b2e?
 ([2601:646:9200:a0f0:9887:2763:ad87:2b2e])
        by smtp.gmail.com with ESMTPSA id
 g21sm375473pfc.167.2022.02.17.12.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 12:02:10 -0800 (PST)
Message-ID: <9fe05f72-ae7a-8bd7-5561-2ea22310a70e@gmail.com>
Date: Thu, 17 Feb 2022 12:02:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [OE-core] [PATCH 04/28] devtool: auto-pick 'main' branch in
 addition to 'master' in upgrades
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-4-alex@linutronix.de>
 <41d3206a0e2d4aa392e80483a503cb86@axis.com>
 <16D4A46679241182.18879@lists.openembedded.org>
 <CANNYZj_17GFwNMqcwP3tdOw5z8=8CsL4yQgEPLt7OKmk6jQhoQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <CANNYZj_17GFwNMqcwP3tdOw5z8=8CsL4yQgEPLt7OKmk6jQhoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 20:02:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161857



On 2/17/22 10:21 AM, Alexander Kanavin wrote:
> On Thu, 17 Feb 2022 at 18:57, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
>> It has worked fine where the branch is still master; I admit I don't
>> fully understand how this works, but it did help with a failed update
>> where devtool wasn't able to pick 'main' from several branches
>> containing the same SRCREV. Upgrade functionality isn't easy to test
>> as it is made of a million corner cases and runs against a 'live',
>> constantly evolving set of pending updates, so I mostly adjust it from
>> experience with AUH. If this still isn't good enough (as show by
>> actual failed updates), I'll adjust further.
> 
> That said, I'll try if the suggested change works as it should and
> resend if so :)

I worry about riscv emulators will break, perhaps riscv32 for sure.

> 
> Alex
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161852): https://lists.openembedded.org/g/openembedded-core/message/161852
> Mute This Topic: https://lists.openembedded.org/mt/89212438/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

