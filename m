Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F549C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 10:21:08 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.15936.1678443664628880939
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 02:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fV9f6oR2;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id o12so18438454edb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 02:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678443663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruLbHVoMWRtt66o2nx/8rM9z2TnYYfMzFFeCBtl2Lv4=;
        b=fV9f6oR2EabGdvq1q6bxFFdp6259QBQhRBKiqyX0V0RwHN5NsdeQCstcmitfBADzBl
         8laMLkYhMECe5vZbSFiXLmT4SFR20NBxQc5QlrpB9J9JNgZjtG00ad8GsSe1EMbbU4Ui
         jVlKocVlHc2jzCcBpEI66f6e+j1Ec+6fOfvPrtgWDmhp/+rvD8ppbuThqzkKmuOxWXWe
         2kZ8DAjTgyYRO6iv2ONW4WxkIvdl3Fa1mHzbsYLmehCGI6gVyrfpUcVyZ03sCErFU8Aw
         Tg4VVj1Y2YsqTwW419NyzEN6Cu7MoVRkj18UWhK//2ChKiUM3eVrLj2BUuY4NY99hBgL
         W4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678443663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruLbHVoMWRtt66o2nx/8rM9z2TnYYfMzFFeCBtl2Lv4=;
        b=oGBIXwW+nvR7uatk8m3i0WqilL4kh4EVS1Ne3iWY5E8c2N+6aR2ZeWvAHpTq3Gt25Q
         zW6/Zx4aQrUq0PpIPlOGZ+jN0CuReGCUxOlxV375sLwNYxuIdOp5Rcqw1ZL7/dbviS+6
         1Gsa40Sahd9myybqLIU+8a9NDDdXajR4sKqcuE76tqNOS7mGDDaXQeEeoH758xnH3J04
         9TLUt6Ff2Wr4MkUZxsAxc3nStthFNlh9e1QC/Lf09yxTEq+f+E+gs6BLNKZVt3vdCp8w
         XT6wbU0IVqxuxGuMtazc4iT9Q1Kr6rcTR6bnq30uMY5J+3xjE8s6FFmnFvPU8QENQtSk
         eTCw==
X-Gm-Message-State: AO0yUKV/TYHsNf8szA/m8RonadBV9KFpPCqp1+xpYyc2MTkYovDydJSO
	CJ/GH7VT9XenK7oVY0LuVN8=
X-Google-Smtp-Source: AK7set8LcS7IJh+vbOurpu7vE26cfErQT4t+Vplknme3GNWdPquzAUwPW7VVW3KETc1TejF/pdAdEQ==
X-Received: by 2002:a50:ee86:0:b0:4af:6c25:f04f with SMTP id f6-20020a50ee86000000b004af6c25f04fmr21368012edr.36.1678443663017;
        Fri, 10 Mar 2023 02:21:03 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id v18-20020a50d092000000b004aef147add6sm651275edd.47.2023.03.10.02.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 02:21:02 -0800 (PST)
Message-ID: <2aa71fb1-68b6-4809-0004-8b3380cef757@gmail.com>
Date: Fri, 10 Mar 2023 11:21:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [RFC] Add new python modules for building others
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <174B040A85AB843D.27660@lists.openembedded.org>
 <20230310095419.3487056-1-zboszor@gmail.com>
 <CANNYZj8S7WnPM265Z39fi-wjqK_1r6XJK87DAfkTumesj8qGMw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj8S7WnPM265Z39fi-wjqK_1r6XJK87DAfkTumesj8qGMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178326

2023. 03. 10. 11:15 keltezéssel, Alexander Kanavin írta:
> It would be good to actually test that these new recipes work
> properly; if they don't have consumers in oe-core, then such tests
> will not occur. Maybe meta-oe is a better place for now?

Can you still take patch 1/4 into oe-core to avoid the clash
between cmake and python3-cmake if/when the new
modules are accepted into meta-oe?

>
> Alex
>
> On Fri, 10 Mar 2023 at 10:54, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>>
>> Some python modules use "import skbuild", "import cmake" or
>> "import ninja" during their builds.
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#178315): https://lists.openembedded.org/g/openembedded-core/message/178315
>> Mute This Topic: https://lists.openembedded.org/mt/97516343/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


