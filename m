Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80335C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 10:42:23 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.17354.1690281736024970871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 03:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SwLYoMRw;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-992f15c36fcso916652166b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 03:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690281734; x=1690886534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3IeiGfbnaY+emrNh/VsUZ+z8yvCxnxWIfmDek4RSoY=;
        b=SwLYoMRw8d7Y/jkUMse93RrCiT+7GxrlRmSlsUUS0W7g/WREXGY35fwFFW+SKMs25T
         7r79ERrovXAaq8MT41w3MV1MWMB0OIgl8RnH4sSDzZtqqaVmcesuqwFpR5+8MnVUeJCk
         hzTDChE3ndd68NCctwXR2J5kbSv2+f6sup7MuWrWjc5Sq9VOZAG5T1zOEKMjdm42mb8C
         VdecqW/Zb4GgUSnfBbFFO/igRcV/kroLM+eDSKOJItjO5IPwezqPw0pgP8pRHfB6Jvxs
         tb+L2FM7+LclQmGx9JgBtTJ+GDagvfHGhJmHXXR/RtmPgEnzvpjEMe53li5TH/ni8d51
         UHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690281734; x=1690886534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3IeiGfbnaY+emrNh/VsUZ+z8yvCxnxWIfmDek4RSoY=;
        b=M8zE0n79YCbMFl8FRaJk3YzGILy72cwlLLNGjTXYqlgdA6cJZ8DtmH5ZBuJrArBdiF
         pqFNFZtbwCLMkSoZLenfuj6wr4/df1Mf5Ko+WPmb+pqpIAwa+K39IPmjgH9s1dbLUK+g
         4cc3Mz2svqIEIydk/U35MeKuNWdfIRy7Kmga5TKRH/gaJDdV8ZLw0J/TNtrqUqAmscVA
         fTC9Vh+VQ+iRig98URMuj4QT8WHmueYu6hsDfQC4kDQm9xKUzQOrHobxTNUma1kMhkCG
         clo2BUQJnnxQ4uQkNIhms56P24N2xOiGn52cA8RRLft6ZxmCUGXuNe+kHwDjGd8zEGya
         KEYw==
X-Gm-Message-State: ABy/qLbsU0UQYWnU1/sr9f4rH7uTpsAEOYpqSJChFe0nbXKkwQoxGn3B
	YAE5dV/fagywIcBTLxrth6A=
X-Google-Smtp-Source: APBJJlFN61f0NZXSA47onF8d9oY05Y3owksr8nWFiHrkt4K4EgqwqfQ4DcDTF1SjIRPLF3O0VgkEkg==
X-Received: by 2002:a17:906:51de:b0:993:d97f:ae06 with SMTP id v30-20020a17090651de00b00993d97fae06mr12990978ejk.13.1690281734200;
        Tue, 25 Jul 2023 03:42:14 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id rv14-20020a17090710ce00b0099b921de301sm3290972ejb.159.2023.07.25.03.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:42:13 -0700 (PDT)
Message-ID: <ab87d8d1-2f07-8d90-1379-f152a3101d07@gmail.com>
Date: Tue, 25 Jul 2023 12:42:12 +0200
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
 <3040946c-5697-d6f5-567c-7bb85f8e0c49@gmail.com>
 <CANNYZj__RUD=T7qgBpAmNs5K9Qf1hgFkjeqnsm_04yAQJkxQow@mail.gmail.com>
 <79529556-5b85-c8b5-1145-177c741f9da4@gmail.com>
 <CANNYZj92V90ADfPLOwT2QEkm9JyE4aDWM7SFCPO6JpFVbE7xqw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj92V90ADfPLOwT2QEkm9JyE4aDWM7SFCPO6JpFVbE7xqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 10:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184835

2023. 07. 25. 12:30 keltezéssel, Alexander Kanavin írta:
> On Tue, 25 Jul 2023 at 12:27, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> I have a working recipe change based on
>> https://github.com/rpm-software-management/rpm/pull/2579 (for 4.18.x)
>> https://github.com/rpm-software-management/rpm/pull/2580 (for 4.19.x)
>>
>> I will send it soon.
> I'd want to see what rpm upstream says. Maybe we're doing the whole
> platform macro thing wrongly.

Hm. Maybe using the BSP name as the platform name is the problem.

FWIW, on Fedora, there is no /etc/rpm/platform and binary
packages simply use .x86_64.rpm or .i686.rpm suffixes.

Apparently, rpmbuild can deduce the platform without help.
After removing /etc/rpm/platform, rpmbuild will generate
an .x86_64.rpm for me.


