Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFECC678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 11:39:14 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.12148.1678189147733414338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 03:39:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lAUSmFZh;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id q16so11806253wrw.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 03:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678189146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYCpe4280sVpOwcFJOG4T07ChEO7kaYjG/dW9+C514g=;
        b=lAUSmFZhkvROzLNpJCT1Ij8flpz2qKN4m3DRiF80etq2TLCdSiJ66Z+LZDqSqcA+t5
         WgKDHM0BSVV6NRdSK6bpUQsJI6eq7zJSglI/l2CNWKvc3k22vqah4kXft7jw/6ZWNptI
         qyNE2N9D7ueFp4PlKCKIbnFhNbA/a8R5c3OhTeffd8THLa9nSKYAzcNf9287qorDRtHd
         7dNY+PDq0QCyrPKT0cGrhQEm2P9UaaWM9rDUTwMmX3KRHzFdu+7NUhwk/um7wuOQ5mqG
         L0Wvyi6R21Sh86/eQJoQH2q9eEevwjLBslx0XOl8ZH5sRtonQo9FYbfMXSJphHnBn0UO
         2smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678189146;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYCpe4280sVpOwcFJOG4T07ChEO7kaYjG/dW9+C514g=;
        b=2qfRlfjwB/wh6BJHIEYjzBC8Xg/k3744zwZCCSuZccW0zGAZInq1qFGrRaPVeQUdbk
         CBfDiq65qgcysEOhjH1MY5vjJwopJjBfHRZdbz2EDDGs01aNjFYgOTVyA7NczA9ruEwD
         AIFghno0N7HfRIWkndPyG8ZTU0/bMo60ou2jTUyD4R9GztAYBhdGVhafHkzrNM8YqgF7
         76/MSPSC+t+YY6ZMh5eRQn0LU4yGgRhmtfLw3+v4uHh1yYGWJazlUe0GChBHusG3S0kI
         HIFUfeyzoW+eZSHfuIA9quPtocY7HAVztHbiQvwZ92zfGDU69kAwY3hO1NbBcZCNdXcn
         r/Zw==
X-Gm-Message-State: AO0yUKWRrQ6lXqmYVM4e0waxa85ogHyQVb4EClgz6Knu9+vNx6m6bigO
	NKDtQL2W8m9NdoWXuHvoFRk=
X-Google-Smtp-Source: AK7set/8I2Cj2uPYQQiNiwU9wSFQg1a24L4NWoJefwjc3L+tm2SdyOiYFSvtIBGPgouF1zcg6Z5QDQ==
X-Received: by 2002:a5d:44c7:0:b0:2c7:1b41:2ed4 with SMTP id z7-20020a5d44c7000000b002c71b412ed4mr9992260wrr.46.1678189146082;
        Tue, 07 Mar 2023 03:39:06 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id v28-20020a5d591c000000b002c6e8af1037sm12318646wrd.104.2023.03.07.03.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 03:39:05 -0800 (PST)
Message-ID: <6524a686-7e21-7c69-4fee-e17d4d757108@gmail.com>
Date: Tue, 7 Mar 2023 12:39:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH v3 1/3] mesa, mesa-gl: 23.0.0
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Kiernan <alex.kiernan@gmail.com>
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com>
 <20230306091108.3347363-2-zboszor@gmail.com>
 <CAP9ODKqgw7+wv9VWTHF6KrNmcVZzgdujKNTthWiM2zCxJZXKgw@mail.gmail.com>
 <CANNYZj9qaL310h66gXiP2ZR2f7ywhWHDzrgvFnyMQH7cFwArqA@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9qaL310h66gXiP2ZR2f7ywhWHDzrgvFnyMQH7cFwArqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 11:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178102

2023. 03. 07. 11:41 keltezéssel, Alexander Kanavin írta:
> Just wanted to give everyone a heads up that mesa 23.0 started to
> strictly enforce that driver versions match the libraries that load
> them:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20069
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/1026d29344192755dd340d6ac13a9674189d2d61
>
> This breaks our implementation of accelerated virtual graphics which
> 'outsources' the provision of the drivers to the host distribution's
> mesa. Unfortunately enabling a useful set of drivers in mesa-native is
> not straightforward, as many of them rely on llvm, or pull in other
> lengthy dependency chains. I'll see what can be done: we'll probably
> have to guard the rich set of drivers with a DISTRO_FEATURE. Ideas?

The reasoning for the change is that glvnd is a thing.
Maybe the drivers you mention should just use that.
Recent distros enable glvnd in Mesa out of the box and
NVIDIA also supports that.

>
> Alex
>
> On Mon, 6 Mar 2023 at 16:54, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> Em seg., 6 de mar. de 2023 às 06:11, Zoltan Boszormenyi
>> <zboszor@gmail.com> escreveu:
>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750


