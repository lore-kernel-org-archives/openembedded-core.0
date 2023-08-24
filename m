Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A562AC27C40
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:53:28 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.6597.1692867201706508261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=QVN4AbWx;
 spf=pass (domain: konsulko.com, ip: 209.85.167.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50078e52537so7223561e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1692867200; x=1693472000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s029iHzIqnMOREljZwC6ljwf/pM00SQib1CAJdO6Ua8=;
        b=QVN4AbWx6SQsGR/PskxqD+Zoj8eJ7BPwxY60ElZicoBeRpxlGOGcw2Rbc6+zUKC5se
         imJdaGHC//FIgOSc7kQ3K8UVWryo4n6qlyQF3EfKV9i88bVVuUNKKV7zofNbFxAkC+aW
         5nNvxVnGA50STjwnaVVlwz4EF5CTVrduXA/co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692867200; x=1693472000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s029iHzIqnMOREljZwC6ljwf/pM00SQib1CAJdO6Ua8=;
        b=dCBnOQtWC9987PrFAqKecFwXc+kjonpOl2AgcaxQmLUtM2Y0RnAXNd+Jwz1Mto8o9z
         lbN7xkNeneMUbl6s7DCrzlusUe6CX5xuUO7u8yTm4nNVghTsr67rpkAmKufpZoctQZeF
         hMJz1VSQ9IoNIEBdwUVvBWn/THD5dmQ90NfgqfkpGRqoiJ5IGsHWBAO4+XaSDfxD+1PY
         VYAYiA42OPTewl+D/WERlXHKEo+XpcohEBU0TozLzvLrsU8v/GRHBaQLxnSQA3ptHaoE
         XpeM0/vP0y+0nzD4w7RWHlX0Y3eE3dh6Iyr9qY/ILx6XskSDTqFl1TZ+ycDLLKduoZAx
         KCkA==
X-Gm-Message-State: AOJu0Yx6S7rRq2iRRVVcwvM9VQz4sWFBOg2q5sIjuD6r+IDkP5E/GKoq
	0M/2wsHIzoSyQoXqs93vXFWMgKbsL+J6x9rgpnvZwA==
X-Google-Smtp-Source: AGHT+IGYQnd+KXokKl4PWHyjg0X6mTuGpiAWG+CCqUjIs2KLNEUodjrHrl4f+g1ZqM8/5GGKc/I5NQ==
X-Received: by 2002:a19:7b06:0:b0:4f8:4245:ed57 with SMTP id w6-20020a197b06000000b004f84245ed57mr8768928lfc.35.1692867199593;
        Thu, 24 Aug 2023 01:53:19 -0700 (PDT)
Received: from [192.168.5.249] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id xa13-20020a170907b9cd00b0099bd5d28dc4sm10746125ejc.195.2023.08.24.01.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:53:19 -0700 (PDT)
Message-ID: <a0904058-b9c5-3763-5bbd-67f54108ec80@konsulko.com>
Date: Thu, 24 Aug 2023 11:53:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [OE-core] [PATCH 2/2] neatvnc: add new recipe
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230823162404.457379-1-leon.anavi@konsulko.com>
 <20230823162404.457379-2-leon.anavi@konsulko.com>
 <CANNYZj-et3+B=2C5TfxFjMBTck=JCGDh36giY0hcD5nN7TSdPQ@mail.gmail.com>
 <098c6e92-55b4-7930-0e98-712bb6141fd8@konsulko.com>
 <CANNYZj8ei0RKo21Yt-tV6a4XKqWFzgxGBjAk0gBFdH4GYG3agQ@mail.gmail.com>
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CANNYZj8ei0RKo21Yt-tV6a4XKqWFzgxGBjAk0gBFdH4GYG3agQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 08:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186648


On 24.08.23 г. 11:45 ч., Alexander Kanavin wrote:
> On Thu, 24 Aug 2023 at 10:38, Leon Anavi <leon.anavi@konsulko.com> wrote:
>> Without these 2 recipes Weston 12 fails to build if PACKAGECONFIG
>> includes vnc:
>>
>> Missing or unbuildable dependency chain was: ['weston', 'neatvnc']
>>
>> In this case neatvnc and aml are dependencies of weston and in my
>> opinion they should be in the same layer. However, if you insist I can
>> submit the patches to meta-oe.
> The criteria for oe-core are:
> a) core feature needed for a typical embedded system
> b) hard dependency of something in a)
>
> Optional features go to meta-oe typically. Otherwise, oe-core would
> just grow uncontrollably.
OK, I will wait for Khem's reply about tls in neatvnc and resubmit the 
patches to meta-oe.

Best regards, Leon

>
> Alex

-- 
Leon Anavi
Software Engineer
konsulko.com


