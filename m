Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0152C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 13:34:08 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.6431.1654695247369558113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 06:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zs7WDeHR;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: ptsneves@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id b7so10230328ljr.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 06:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=3trYgm9QHbOT3qDL2FJYRAEVamJUkqPpoG/iksZN50Y=;
        b=Zs7WDeHRtp8B/JZNggAoMZZeJnhDggQH3YZ1nFZ8s7GBgyVC+iwexxkjJ3LiB1ViFN
         rmIBuC+9ScTkT81HKErS/nMOkXVCXY24ico1Kc5+DP2UkdVtLUsf01yGbGyLrfFhGPZV
         KoYtDaiGN/D4ob4Vrcupq3Fle2dmV8Odbnk8x5vPIaFtZjgxxhjFwbBm0XJISd0GTsa/
         k5y+24Vh7dxZkl5F5cFEq+ZbFZbxef/Gs2YF6SdT+3fUOUxP560K4rkdFEZbRe5u3N96
         cP4F3UPzJ39bOW8GIzVcxOrm3MV8Q7jb7TJVVbX+fjzw2Am2ybvOfu25zMaudjsBCgwL
         Kjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3trYgm9QHbOT3qDL2FJYRAEVamJUkqPpoG/iksZN50Y=;
        b=sQmEXDplQ5aqukrmAaNjW8x8FKsWJ6CMfzTcfRqkjc/gF0NCLscrYiCfxFu4TK+uGY
         E31BK+1qdwAXzakZRZoFtW7XBwdcgYUCXlS+eEQASW9xtRKakp2QP8lGy/AIA+9pEzZr
         Wd8Q4ibaOHH66gZJkiZIk5KCroiO5Ahk/QndE8QGJ+mZ5PQ0cOqth7JKW5a6u3WvNaXX
         GOo8vbwhlchDWz8jP+3eBj75VbbfiOqs5oEbuiHH4xTPMHwqJf5eMgrhRGydgblTkUd9
         9Rh/p6Vakhsh5QhDzQ7fzneTjs++HUY45hPyoLz8ilS173tK/Yc25fDJGvFTi7WmPqVc
         opvA==
X-Gm-Message-State: AOAM532TdK/oLzKTbUGCjdo5UyYMnykGv6WqbIUc+3zZVuoTM+IVJZC9
	0FG606aHe0Xx/jL/BrBkrA==
X-Google-Smtp-Source: 
 ABdhPJzi01xj7VOegaTk9/J73iGVJom5x4VlYTJQwYqMM6ydXhSBn0nlhG4QSlXDwFE7EJxyNAHPrQ==
X-Received: by 2002:a2e:9219:0:b0:255:69f7:c4fb with SMTP id
 k25-20020a2e9219000000b0025569f7c4fbmr20968739ljg.32.1654695245434;
        Wed, 08 Jun 2022 06:34:05 -0700 (PDT)
Received: from [10.67.202.36] (85-128-83-172.static.ip.netia.com.pl.
 [85.128.83.172])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a2ea90c000000b00255a658f9c8sm874482ljq.54.2022.06.08.06.34.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 06:34:04 -0700 (PDT)
Message-ID: <c4f524a4-043c-a658-8135-2a3b5af91eeb@gmail.com>
Date: Wed, 8 Jun 2022 15:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH] vim: put xxd in its own package
Content-Language: en-US
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 openembedded-core@lists.openembedded.org
References: <20220608074245.1962967-1-rasmus.villemoes@prevas.dk>
 <29553.1654689480120240103@lists.openembedded.org>
 <b3e2924f-9b00-f950-67a9-ff774d68d3c6@prevas.dk>
 <85ab03f4-72dc-6b9c-23fa-5319a6dbe6a8@gmail.com>
 <3bcb145f-cc37-c5c7-d247-76390834fa7e@prevas.dk>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: <3bcb145f-cc37-c5c7-d247-76390834fa7e@prevas.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 13:34:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166708

Looks good to me then ;) Had a look at the code [1] and indeed it is a 
very minimal standalone binary.

Grateful for your patience
Paulo Neves

[1] https://github.com/vim/vim/blob/master/src/xxd/xxd.c

On 6/8/22 14:36, Rasmus Villemoes wrote:
> On 08/06/2022 14.30, Paulo Neves wrote:
>> On 6/8/22 14:13, Rasmus Villemoes wrote:
>>
>>> On 08/06/2022 13.58, Paulo Neves via lists.openembedded.org wrote:
>> I mean that your patch allows for a new standalone package ${PN}-xxd.
>> Were somebody to use this package standalone, meaning without installing vim,
>> the ncurses-terminfo-base would not be installed, possibly breaking xxd.
>>
>> Before your patch this risk did not occur due to xxd being include in the ${PN}
>> which had an RDEPENDS to ncurses-terminfo-base.
> Thanks, now I understand what you were saying. And no, xxd does not in
> any way depend on those terminfo files; it's a simple utility for
> converting binary files to hex (or the reverse, which is what I happen
> to need, taking input in the form of ascii hex chars and producing
> binary output). Yes, I've tested it on target as well.
>
> Rasmus


