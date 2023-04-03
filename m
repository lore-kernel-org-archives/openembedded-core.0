Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF9EC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 13:00:55 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.69460.1680526847441424987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 06:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CmANIAD5;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id ew6so116924301edb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680526846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0tX8aWWOXm4Z8C7RS/K0kbmEMXFNp7EGXrALPh3DJQ=;
        b=CmANIAD5KLFCn68cnnfTCfEZ5yD2IezCr1ogc7JEwobDd9HE7LcAT3ZH31xaWjuB8Z
         IiE50d5mr3lP/mBQo6gPJOx4NhrIg3FcE1a7bafLnilZuINwW9SL8rj1vCSMPWCDCyjV
         W5NWRNcl6OIsGp96IcpiFHwFxQlkq54h+GYviCa3u1B1HPGksEshifNV0tLoHIc7LU8L
         uHm9OXx7s/BYLOwbGTVuUkW3XxJqgGifnbK70n/Ga4XVAOfGmfcdiRcLOufPNF9SU8PY
         Oy1Vpj3SygL/agi9sipSerCtEzhk9ScIXVWa1JVO47sVMSQAmFGnUk5W+Z2u5tCfcuoo
         xyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680526846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0tX8aWWOXm4Z8C7RS/K0kbmEMXFNp7EGXrALPh3DJQ=;
        b=o3MADCRxDe66AbOKpRAbp8vkttmBo18ApTFYhhuGUJjAYbcD3SeLyCKoJzUYK4TwCW
         QYVgm8OtcoiX4QG+0OlXxr5GDK24wFlLs3Odwl2XfrGSwIOGF/5eO5WOpAPqy5+Faroy
         Dg0ReXJq9EpZSptyG0xIm6cyY7JzIisMXmzl+k+8p8avwKmB92PuO8LbB+4MzzCN+mIJ
         7ttWx+9peojwH4474qX08DXkMZG7H82qzR8keVM0o7Nr7R4Jo85WqUJ4a+MiaOSQ6/Zk
         1VNy6AK2juALBo/mL193KmjpvfdFlsYZiBXowW3KBAOemiJryGqPPv4UwQMUpKpltvIG
         ayvw==
X-Gm-Message-State: AAQBX9fgfk1WpJDggLQwFLQ3GTO9v7hPoLKECrRKOg2I1oNrY0crdgss
	m4LZ7EfD/c3ueuOCpnOVFuE=
X-Google-Smtp-Source: AKy350aGW2jexYxA2LLztjTHWbRnxMtdRts0XqV58aoAaQge9X/2D2hxrTJqbSGIMIggHXe6eSuCzQ==
X-Received: by 2002:a17:906:553:b0:8af:5403:992d with SMTP id k19-20020a170906055300b008af5403992dmr32949049eja.28.1680526845544;
        Mon, 03 Apr 2023 06:00:45 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id gv19-20020a1709072bd300b00931db712768sm4533325ejc.4.2023.04.03.06.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 06:00:45 -0700 (PDT)
Message-ID: <6f3a27c7-a8be-4430-b66f-a0d2c53ddf7f@gmail.com>
Date: Mon, 3 Apr 2023 15:00:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
To: Ross Burton <Ross.Burton@arm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
 <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
 <ab068d9c1e16fe78ea74b25a30412b55cad616a1.camel@linuxfoundation.org>
 <1751778F66ADC2DD.27612@lists.openembedded.org>
 <27b6f2b6-5e7f-8be6-32fc-2aa7cbd1402f@gmail.com>
 <3ADE60F3-FF7C-4022-AB82-9D992AAD1405@arm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <3ADE60F3-FF7C-4022-AB82-9D992AAD1405@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 13:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179630

2023. 04. 03. 12:59 keltezéssel, Ross Burton írta:
> On 31 Mar 2023, at 10:46, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>> Regarding my attempts to fix this: I have looked into
>> making these executables use "native: true" but it
>> would need duplicating all the driver and library targets
>> with "native: true", too, and it seemed to be too intrusive.
>> Also, it doesn't eliminate the native dependency chain,
>> building these executables would still need systemd-native,
>> libgudev-native and libgusb-native.
> I’d say this is still the correct solution, although the ‘native’ libfprint would be as lean as possible and not the entire library.

Hopefully someone can solve this bug soon:
https://github.com/mesonbuild/meson/issues/11029
FWIW, I commented about the problem but the meson
codebase is over my head so I can't fix it.

Then libfrint (and probably other meson bases recipes
in Yocto) won't need a native part.

Until then, please ignore this patchset and the other one
for meta-oe. I will stick to my in-house solution for now.


