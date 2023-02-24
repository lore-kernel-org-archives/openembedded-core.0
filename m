Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4A5C61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:34:59 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.14726.1677234894224573407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 02:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MaRp8d83;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id q16so3077535wrw.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZOpaZJ+yEHl19pc6IejfcbyJHkBhJ1pZQLaS1/nt8w=;
        b=MaRp8d83sr7IhjwDXyrOrbefeH9AXtWnoxr2yLDplrVt/Jgxn6vhNFCV5EsQxsfWQ3
         IbnwFw8Wtu78EgPdIw7p/Z3hqDi9Mhh+zq8LOuCR01h0NT4TJGqZgxhuCdJ+usnVMUve
         OFRw2adeBrKkeh150UsP+D0TwM5q/ja/xYJ35ZMf001eO2fkF6SiGUiAh/Ybv6jYjlNQ
         BU2PM4QSdOTbLhi96cK0p6Gv8+fEr9hTzLRVUP9DcQh9FOMtlAdCsyPo1h+wtndPcK3u
         KLrjGbXw8eU7JZxM3oVSXqErRPxZ4qHNdux0vMNJzKILuHMIzNDI6LEu8PjDquPQPAly
         XCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZOpaZJ+yEHl19pc6IejfcbyJHkBhJ1pZQLaS1/nt8w=;
        b=wdamhKUx6i7z9u1jLLNWergiPOqLqUQl+5vrLwHhj5qgutRyFUdR+Hek2y8uttzESv
         /i+QqnmXI+Hnwmn6Nad/x4E1w6Kziyd3MKPJMDYTSFpPPHErtU1xQZFJE/OX3x/uCdS0
         lP5zRUblJ6H1VoMtVc6qU5H/kMAVqSYNlsSlTLlnU6px95PJ2z4q9fRa1Vmhp47DuMb4
         Kdr4gdZzoptUolqCcIoW1L4fYABGtUlVVzPgtTfDKXvSTu++S2RMlhrCaaYzEdEW1jIO
         YYv+zRypdhysViQG/Rw6pF5+lv+w5sOZqk2FtHjRjIXNgjKwP4TgzEZ1jQ5/19WKLVPq
         XOng==
X-Gm-Message-State: AO0yUKW/8seZ6Qmc5IisRi1GoDRHCrnbGTRhfRr04iVOMpihwr1ij82W
	imj36pg+dt5OSuzS0tSAHFE=
X-Google-Smtp-Source: AK7set+j5vXfgMo7eWpZoF094m8RCAr8kT1PW3cbyjf2ajX4jj1l8MBkpmzhV2O2nYtxSxTrZ6WU8A==
X-Received: by 2002:a5d:5309:0:b0:2c7:1b6e:5a9c with SMTP id e9-20020a5d5309000000b002c71b6e5a9cmr1978954wrv.2.1677234892629;
        Fri, 24 Feb 2023 02:34:52 -0800 (PST)
Received: from [192.168.1.143] (BC24452B.dsl.pool.telekom.hu. [188.36.69.43])
        by smtp.gmail.com with ESMTPSA id i16-20020adfefd0000000b002c552c6c8c2sm10302618wrp.87.2023.02.24.02.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:34:52 -0800 (PST)
Message-ID: <0dd9eb47-521e-7840-9196-f485f080b44c@gmail.com>
Date: Fri, 24 Feb 2023 11:34:51 +0100
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
 <1746BAA6D62E4C0A.18951@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1746BAA6D62E4C0A.18951@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 10:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177675

2023. 02. 24. 11:05 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 02. 24. 10:45 keltezéssel, Ross Burton írta:
>>> On 24 Feb 2023, at 09:38, Zoltan Boszormenyi via lists.openembedded.org 
>>> <zboszor=gmail.com@lists.openembedded.org> wrote:
>>> -inherit meson pkgconfig python3native gettext features_check
>>> +inherit meson pkgconfig python3native gettext features_check rust
>> This forces a dependency on rust-native, even if rusticl is disabled.
>>
>> Is it actually needed? If so, make the inherit conditional.
>
> I will do that, thanks.

Problem is, now the configure stage fails with:

| ../mesa-23.0.0/meson.build:964: WARNING: add_languages is missing native:, assuming 
languages are wanted for both host and build.
| Compiler for language rust for the build machine not found.
|
| ../mesa-23.0.0/meson.build:964:2: ERROR: Rust compiler rustc -C 
linker=x86_64-oe-linux-gcc -C link-arg=-m64 -C link-arg=-march=nehalem -C 
link-arg=-mtune=generic -C link-arg=-mfpmath=sse -C link-arg=-msse4.2 -C 
link-arg=-fstack-protector-strong -C link-arg=-O2 -C link-arg=-D_FORTIFY_SOURCE=2 -C 
link-arg=-Wformat -C link-arg=-Wformat-security -C link-arg=-Werror=format-security -C 
link-arg=--sysroot=/data2/dtd-yocto-4.0/tmp-sicom-glibc/work/corei7-64-oe-linux/mesa/2_23.0.0-r0/recipe-sysroot 
can not compile programs.
|
| error: Error loading target specification: Could not find specification for target 
"x86_64-linux". Run `rustc --print target-list` for a list of built-in targets

I also tried it with moving the conditionally set rust
between or before the already inherited classes.

It succeeds when inherit rust is not conditional.

>
>>
>> Ross
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177672): https://lists.openembedded.org/g/openembedded-core/message/177672
> Mute This Topic: https://lists.openembedded.org/mt/97202946/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


