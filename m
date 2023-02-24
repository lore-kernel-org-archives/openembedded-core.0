Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054CFC64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:05:39 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.14363.1677233136535017088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 02:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hXwEKf5S;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id s26so52707483edw.11
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7bdaCr23ljJLe56xMSeZ7IZbNUu/QDrk/m9D+6Wlsjg=;
        b=hXwEKf5SL0SNMQb4WQAXNENkxJFRg/GrolC7K7IYOFrqUJlB42B5OxVebt9/s5z697
         Mx3PjtWXAQfHepTCFOntQx6u71xot+grQ9NtiEH8f6e7cY4HQvpbRBMeNX1syaQhsXgi
         zTiBlXT2KEITPb6yRCo8hgSbHSz8LZE0w3Yjs+DvgKNBdiTYmOXAuZsnqNkK7E+h3PNt
         XgrzSupD0yNBI5rtlS/qGIW/rR7T8xzDR+ci+5t0SeQdVZdEpClz60ly15gLd2Hgbel2
         S+jANIltAltgQY8ZKBCtRb/i9lgl/y+E8xptMgTD/EKvQHoxAs7TvaplMd6v95ictV8C
         Cgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7bdaCr23ljJLe56xMSeZ7IZbNUu/QDrk/m9D+6Wlsjg=;
        b=mHUzFl2DgkHHtHhYFJSZ5K1VDvs1721Zln1BF8Z14jZKLuat7UEL1/MgZ4OHIYx+k/
         42LPwDVAYMXV7Lxl1uXEns308m4nSrxnvE+cSb5LNADUk8u1lLAwUrl3k9apjcKGrKMu
         Y4hpcTg1rh0ReQOWBBXh8wR6q99nuu4KDt1Ozu07NhgaFD3BDPMLh0JRKvCIaJ6B0+7z
         9k3lt5/cJgrb1C0Cc0WcEBDwwWzQLAlbLsrjR/4Oee312QSeu/jW7anaCh3dhvGxsWaD
         yGzONUcrxQ2QXno9UQwRkyeO/APHJH6uRfOAxaPWyQPZ1er+vLjRELQtIh8aeJFRr+dL
         kVPw==
X-Gm-Message-State: AO0yUKW6qODykKRXLwirY4+z5UwiO52LcF1Ye8m5t6vTXjZNs33mKdfc
	Zo4JI6pQqNI0l8Y7+BtNMII=
X-Google-Smtp-Source: AK7set9JhyW7G3zX1jFL8ssusghy2od53fiHxBqDoLYYDztxG6pyr20F9mAG30izfI2Ywh4WFXKeWg==
X-Received: by 2002:a50:fb0f:0:b0:4af:7170:28f0 with SMTP id d15-20020a50fb0f000000b004af717028f0mr3577068edq.42.1677233134800;
        Fri, 24 Feb 2023 02:05:34 -0800 (PST)
Received: from [192.168.1.143] (BC24452B.dsl.pool.telekom.hu. [188.36.69.43])
        by smtp.gmail.com with ESMTPSA id k23-20020a508ad7000000b004af5001c7ecsm4768967edk.12.2023.02.24.02.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:05:34 -0800 (PST)
Message-ID: <55b5c5a6-d1e9-a598-0e4d-0eacfee1eb42@gmail.com>
Date: Fri, 24 Feb 2023 11:05:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH 4/4] mesa: Add PACKAGECONFIG "rusticl"
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230224093850.3393567-1-zboszor@gmail.com>
 <20230224093850.3393567-4-zboszor@gmail.com>
 <3EE6D20C-8A7C-4772-BF56-E1CD25B12B6B@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <3EE6D20C-8A7C-4772-BF56-E1CD25B12B6B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 10:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177672

2023. 02. 24. 10:45 keltezéssel, Ross Burton írta:
>> On 24 Feb 2023, at 09:38, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> -inherit meson pkgconfig python3native gettext features_check
>> +inherit meson pkgconfig python3native gettext features_check rust
> This forces a dependency on rust-native, even if rusticl is disabled.
>
> Is it actually needed? If so, make the inherit conditional.

I will do that, thanks.

>
> Ross


