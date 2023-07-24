Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C272C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 15:00:02 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.49773.1690210793729137065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 07:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Q+m6aGdY;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-997c4107d62so658159066b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690210792; x=1690815592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HK9IYL+YrcvejWs6PHdUV2SoOW+ooJZEiLmICcU7JG8=;
        b=Q+m6aGdYSyhsuSXv1M6BgnOjJhSpM9vxs8DEYphn+uv7ZtRxIY1SXYBlUOLdNv5MXe
         kF4/zeMNiTWF4Dril1cNfR+eO4Gk7EKQ4sT1oz/FPE8H/5Vin085fKQxSZ16F1iLqEy/
         7PIbyEOoPRdmQCpRQBWqayXmWN/w8IX5NlgNPbhdLw4tejnIJYiz4qouI1HRopHx+rWa
         0IL3DbM4U3zWlCia9J2Lpb21/O/0tZnsg+4QP+iEbnJbeoFEkVuW3h96LmNHs1EEhT4a
         x97GFEpGAisAh1zUPltW5IWdjslU035NsyuSrOdHHEf1JsJqV3+SK2WEy8d3EVvBpFIR
         tSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690210792; x=1690815592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HK9IYL+YrcvejWs6PHdUV2SoOW+ooJZEiLmICcU7JG8=;
        b=PD+DWyzBLOf6t2pePZ7OYAPwQynf9j1ukbXFDzasNsuJNhwb6zweJomgxqUhmw8skJ
         D1MF01LSlKNTwuAG4rsrAmsvtqsFeKl9WSVK/mKOwYWML9K60AhiaEENAIiUKsyHBBWA
         5PkTeJSdbjcTHNvWZjETFRQI50dmROPUBZS3N3aSpDHNyZUPsZokijOMoMiZrmnrwXrv
         7mWjHwxdGwceudZE7mbmCDKY7TDHcBpJxGyWL+viEwMdbgo9rHMkvI86hLGM1JJFSyW3
         LfRjkDSnVTLLlfNvFlZpVs6eIB9Gvgya4YDW0AJL305n4ByIN1yWXFsY/JZLvN/ciKsT
         jUgA==
X-Gm-Message-State: ABy/qLbRAtJMlz6dmgrXHImBz0dYCjfrtgBdndRRTBH8NXKeIetMdAE2
	OOs10jv4M30SBtJQ5R4buGk=
X-Google-Smtp-Source: APBJJlGMY0cf4jTiaAngixu0HZxp+Wo5poQGkTKiLefTLbdCcxJuDVevwLu/uosJM/tsQq1CyYj1aA==
X-Received: by 2002:a17:906:53d6:b0:982:caf9:126 with SMTP id p22-20020a17090653d600b00982caf90126mr10621877ejo.42.1690210792011;
        Mon, 24 Jul 2023 07:59:52 -0700 (PDT)
Received: from [192.168.2.52] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id w12-20020a17090633cc00b0099275c59bc9sm6808688eja.33.2023.07.24.07.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 07:59:51 -0700 (PDT)
Message-ID: <3040946c-5697-d6f5-567c-7bb85f8e0c49@gmail.com>
Date: Mon, 24 Jul 2023 16:59:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>
References: <20230724123529.288581-1-zboszor@gmail.com>
 <CANNYZj9FLbQxnbhd-Lzcr5GB3Ycf+35O1eADZ51EuVNg-eN33A@mail.gmail.com>
 <CANNYZj8HRnoCSBax5VzHU+xU+=XqeS3gF_ys_jFzJYs2+MivwQ@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj8HRnoCSBax5VzHU+xU+=XqeS3gF_ys_jFzJYs2+MivwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 15:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184794

2023. 07. 24. 16:03 keltezéssel, Alexander Kanavin írta:
> On Mon, 24 Jul 2023 at 16:02, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>> +        sed -i \
>>> +            -e "s:^%_lib\t.*$:%_lib\t${baselib}:" \
>>> +            -e "s:^%_libdir\t.*$:%_libdir\t${libdir}:" \
>>> +            ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux/macros
>> Can this be refactored to avoid sed please? This is both difficult or
>> impossible to understand, and is prone to silent regressions.
> What I mean is, can the file be generated in the first place with the
> correct values?

I'll rework it using a template file.
Still, sed would be used, but in a more readable fashion.

Will this work for you?

