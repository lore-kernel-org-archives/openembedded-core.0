Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0B9C761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:31:32 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.26928.1680186687099726083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kO0CdRAT;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id b20so77325708edd.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 07:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680186685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m4YT7+lT7EoFuF/3qQZ+Iagt02ZqWagR+piEyp0VSts=;
        b=kO0CdRAT3ICboKgkx6A/DCu/1HXEVPB6fcumyMTO/40G+i3vd01EktvzxQIpGRT3pP
         GJ64YmYOYPtdJlB78bZn6lobxntbvtM/eAX0+a8TwxXGKBd+4FJp6rz5An9hDME/aaKC
         mKaj1xCyewJ1L+V8GGBakO10o+2pAAz54TfyxE7HN1UvX4uYaX9G96VcyJzVA82wXbCr
         bmoWEUe7Tc0Oh9mAMJcBJ6R4zx4IAbqEUxSQWy8w7KmUK8QIVXkbEbGhZy9O5gJF4dcG
         bHLdxT/m1nC9ThtlfIi79nSpypwxLdcDp6C4Ujpg/PDwr08NcCciRT7b2gMCh9VNd+KB
         my/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680186685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4YT7+lT7EoFuF/3qQZ+Iagt02ZqWagR+piEyp0VSts=;
        b=CIc1wcLgvdFTyzG8bsy0bLgdfL27D/pRM3yADL7TP1DmDgPX/NJeWH9rxa1h6DyQ8d
         VBKeTwcVz1NDL4615a7FeAv4MJ5utcM5uMXLjB3lq866ham0OaPrCDmfaF4NBRKJWXvn
         iAEOKLSsYNkF424a2kWU2ovFMgWO8mBJfQ433P/6IjYUWAEolAxXt88SYymHlnftNndO
         Tk/92tIjkQrWlk6v2Mz1s5rzj5ipQHv3WVbb/fqFJALeueLzmjF/jlPGlY/H7t5PByFj
         g+8OFIx81UbamJc6KU+DRGCgvJ06Jng22BEtGLo+oMVAIXhbPMcvHgSRrZCnlYbtNu6W
         UapQ==
X-Gm-Message-State: AAQBX9cKZtvGV1qLhc/09TD7MqpyetneGyrsgMron3gK+tusaocARdYx
	APq6hGuL4YslfaJ5DuNj+1wp0hh5cZU=
X-Google-Smtp-Source: AKy350bTPFDQ3apC9C3TdfmM4E5CyNXVVqpNXmVCG4oVoh+JlGG2gM1tkyrB7pEKDJaEsHJ78gfUwg==
X-Received: by 2002:a17:906:5646:b0:930:7d8f:15a4 with SMTP id v6-20020a170906564600b009307d8f15a4mr23649821ejr.53.1680186685586;
        Thu, 30 Mar 2023 07:31:25 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id b1-20020a1709065e4100b008ca52f7fbcbsm17694288eju.1.2023.03.30.07.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:31:25 -0700 (PDT)
Message-ID: <1deaad30-4816-af4d-910d-ef2242952033@gmail.com>
Date: Thu, 30 Mar 2023 16:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
 <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179330

2023. 03. 30. 16:10 keltezéssel, Alexander Kanavin írta:
> On Thu, 30 Mar 2023 at 16:08, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>> Please see the MR:
>> https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/431
>>
>> udev (provided by systemd) -> libgudev -> libfprint
>> also:
>> udev-native -> libgudev-native -> libfprint-native -> libfprint
>>
>> Also, please read the TODO part of the patch for systemd
>> and consider it.
> We can simply direct libfprint to run its own target pieces under qemu
> usermode

The mariadb change to use CROSSCOMPILING_EMULATOR
instead of building mariadb-native was reverted because
qemu is not ominpotent. The same applies to meson
running executables via qemu. No custom wrapper would help.

> , and avoid all this nasty native stuff. Meson has direct
> support for it, and even if it doesn't work, libfprint can be patched
> to use a custom 'wrapper' for executing the binaries.

You seem to have omitted reading a large part in the
commit message for the systemd change.

> TODO? The new natively built systemctl binary may replace
> the script in systemd-systemctl-native, as it supports
> more options and works better than the script. For example,
> the current script does not create the symlinks in
> /etc/systemd/system for WantedBy= and RequiredBy= settings
> and does not support systemctl set-default some.target.


This is not relevant to libfprint itself, it's a bug in
Yocto's systemctl replacement script.

----8<--- foo.service ----8<---
...
[Install]
WantedBy=bar.service
RequiredBy=baz.service
...
----8<--- foo.service ----8<---

The symlinks in /etc/systemd/system/bar.service.wants
and /etc/systemd/system/baz.service.requires are not
created for foo.service.

This command is also not supported by the Yocto replacement:

systemctl set-default custom.target

I have been bitten by both issues.


