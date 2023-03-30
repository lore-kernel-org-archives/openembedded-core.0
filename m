Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107FBC761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:01:42 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.25877.1680184898560720598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DQIDG0vl;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id t10so76745295edd.12
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 07:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680184897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBs3Ake8Bsot3pJxmeizc2YfyeuvHBVbI0nF+1pTEHI=;
        b=DQIDG0vlPhCcO6aYVT3lt7Sf+pudvH29DxSrMURMehdPW6vPWkBSJnm7c9LeMlC9oH
         gRZXzl3e2p9u9BEYCqYJVJOzHkQIfSwGVKSQZuZCsF3MPjmmUedz5iNahMEpL0CblZ0G
         FBzFC3oFjJe3S5O/63KX7QmPcEfhx9aNQD4RYqn6RDEQJsywgNJ/oqGxTqRfRfgJeaWV
         b/WFtY+ksB3uLKMeHzOcExa/dsU6Q2EkMUHBXtWQweJLwHf8TWX5Y+Z4EglxD4/lv7G2
         B/LFGIsFBT5/Qe9lSUkDyigPrcq11re1w6FPawzq5K4eSs2KrJ564CfHYYxbllVVxAFV
         WztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBs3Ake8Bsot3pJxmeizc2YfyeuvHBVbI0nF+1pTEHI=;
        b=LpkG0kM/OdOSPzI7b+jmfozfPX8/LAHC50dT2UcyEWDmlEDNi48qAx6iNmsqISOSK1
         vXO+bd46yNxqI7DXhJIMQblByWsqU8MJmnxZXa1T76aso6YK2RzgIJvWkAQI+vQ+HQBN
         cs+sBiMf3ACPFFP7+nWxprrImf3XXvPr3l+WVkY4KZum1N2hoe/ptk+5dezbBGY3/w3w
         IK6kyY4U4Wb+ZTXybgYzbPHlczV3oJvW13ukL4XhtP+m1BjAYerKfl291wY/QYspGhvr
         ZiKQiBsRNphyfSDTA3uIeKFqr91c7Tx50G+NNHsl6U/bVozImquYvqargnZ0P8mzZzR8
         Og1w==
X-Gm-Message-State: AAQBX9dAgZx8AYNor85htPvSU4cbe1jtmNyK+6+33iHEUwBdwN0J3ndW
	Ba7b+kGBjePpgZdDLf/YXEQ=
X-Google-Smtp-Source: AKy350ZExcESPA8Lpkw1Jltf+3/04NPO94lg0h6xNMuiX9k04x7ouBRj1Pm8qsQHFbTz10hmxDEhmg==
X-Received: by 2002:aa7:cfd8:0:b0:4fd:1cf1:b7b0 with SMTP id r24-20020aa7cfd8000000b004fd1cf1b7b0mr19936524edy.7.1680184896864;
        Thu, 30 Mar 2023 07:01:36 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id c24-20020a50d658000000b00501d5432f2fsm13348363edj.60.2023.03.30.07.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:01:36 -0700 (PDT)
Message-ID: <e70963a3-b3f2-b182-8f24-41e9981b0b8c@gmail.com>
Date: Thu, 30 Mar 2023 16:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 2/2] libgudev: Allow native build
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <20230330134214.2772913-2-zboszor@gmail.com>
 <CANNYZj--VdBinzni-5vKpb9Q4qq09x-oo9WAfmZYoBb5bfZ3BQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj--VdBinzni-5vKpb9Q4qq09x-oo9WAfmZYoBb5bfZ3BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179326

2023. 03. 30. 15:47 keltezéssel, Alexander Kanavin írta:
> Can you look into specific details of why libgudev is needed, and
> whether it can be made optional? Also, what is it from
> libfprint-native that libfprint needs?
>
> I would really like to know these details before we conclude that
> adding native variants for tricky, brittle items like all of systemd
> is indeed the only option. Maybe we can break those dependency chains.

It's verbosely explained in the patch for libfprint sent to oe-devel.
Please read that. It's also here:
https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/431

>
> Alex
>
>
> On Thu, 30 Mar 2023 at 15:42, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>> libgudev-native is a dependency of libfprint-native, which
>> is needed to build libfprint.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/recipes-gnome/libgudev/libgudev_237.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-gnome/libgudev/libgudev_237.bb b/meta/recipes-gnome/libgudev/libgudev_237.bb
>> index 9ce43ce34b..ad3a16ab99 100644
>> --- a/meta/recipes-gnome/libgudev/libgudev_237.bb
>> +++ b/meta/recipes-gnome/libgudev/libgudev_237.bb
>> @@ -9,6 +9,8 @@ SRC_URI[archive.sha256sum] = "0d06b21170d20c93e4f0534dbb9b0a8b4f1119ffb00b4031aa
>>
>>   DEPENDS = "glib-2.0 udev"
>>
>> +BBCLASSEXTEND = "native"
>> +
>>   RCONFLICTS:${PN} = "systemd (<= 220)"
>>
>>   LICENSE = "LGPL-2.1-only"
>> --
>> 2.39.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179322): https://lists.openembedded.org/g/openembedded-core/message/179322
>> Mute This Topic: https://lists.openembedded.org/mt/97950751/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


