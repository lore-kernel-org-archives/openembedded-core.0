Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A53AC761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:45:52 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.27386.1680187545067062022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I1UXS41s;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id ew6so77428686edb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 07:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680187543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzwaLpucFreC5RHaLG5GHtulw+V0gs96MiXOlTcVnnY=;
        b=I1UXS41sknvx1yOe0fvRpauE9LjksfKxUnFz8A/l877iF5mnV5VSygZ0i5DUnmT/WQ
         66eVS4LEu3uJAjD4k9bnkGwkPHLcVrDAx2Cw10IWNDdNwgh5fom6gkmTvfSmMCaXhA/G
         OELiS/34jDb9HPdbOK8FOnoBkBRPNs7Cv31JZIpGW7m7ebkcuNiR50OL7DGhmGXr2ynB
         gkHMWNUIfnMZBp5whZ9XrY+E0FI40bpn3rMOtcPzIaW9glzKVG70x5+jg0XhBqpEsLbe
         6VCb/HsfSK1oyRS/Sl8pjLbMV5HdzxeocmneCJBknXzpKAvcjlZgTnmwVSMsO6NKOHkM
         pkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187543;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzwaLpucFreC5RHaLG5GHtulw+V0gs96MiXOlTcVnnY=;
        b=loGVXtojnCbuZy2c8MwzldwPsuoC4NhuXC/yDCrBZA+IcR/38GK0inXAm4XL83Hxb5
         ffRbGAo7/zMO4QtYdfEnPc/5ZthE8EoYNkD9ckF3/v30NggoCkoBzcQpwYwfUUVqExBh
         NJLffIjYxOVHWN/gQQjNCjmWsnc26NJ5LbQbybLf2ZTRvlubhE24XGHOSJQDU+8MQbfZ
         okeLGX7MwZPx1BsvttfQOFUWK9Elyco6YTB/Kbm46anYjikgvk4QJOcBcN0QYKzlbd1K
         8Hx6jCs2CHtNly6Q0tyyq6PaTgl0HKzDJksWZhZKDfyUXmS86rLfj3m6saxQWkpNLBuc
         ianA==
X-Gm-Message-State: AAQBX9e38MQ3F7SMCJkLnMliPsl9uzNrceyBXN3UnvxjGr2xAA9HePrn
	FVLQMa/sDuF6dHCt5B5Hp2w=
X-Google-Smtp-Source: AKy350b21wVdT+eoEH5JF43isg19/6W2IXcC+gFZ7UtWo2lT594i07znAacRx3ZzVRfLszfYuYj46Q==
X-Received: by 2002:a17:906:6d09:b0:934:2fe4:4921 with SMTP id m9-20020a1709066d0900b009342fe44921mr22708384ejr.19.1680187543478;
        Thu, 30 Mar 2023 07:45:43 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id b24-20020a170906491800b008e82cb55195sm17721360ejq.203.2023.03.30.07.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:45:43 -0700 (PDT)
Message-ID: <a4957e79-1f8b-d31f-7f8a-9fbf138fb57e@gmail.com>
Date: Thu, 30 Mar 2023 16:45:42 +0200
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
 <175138E3E9EE1FF1.27612@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <175138E3E9EE1FF1.27612@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:45:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179332

2023. 03. 30. 16:31 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 03. 30. 16:10 keltezéssel, Alexander Kanavin írta:
>> On Thu, 30 Mar 2023 at 16:08, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>>> Please see the MR:
>>> https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/431
>>>
>>> udev (provided by systemd) -> libgudev -> libfprint
>>> also:
>>> udev-native -> libgudev-native -> libfprint-native -> libfprint
>>>
>>> Also, please read the TODO part of the patch for systemd
>>> and consider it.
>> We can simply direct libfprint to run its own target pieces under qemu
>> usermode
>
> The mariadb change to use CROSSCOMPILING_EMULATOR
> instead of building mariadb-native was reverted because
> qemu is not ominpotent. The same applies to meson
> running executables via qemu. No custom wrapper would help.
>
>> , and avoid all this nasty native stuff. Meson has direct
>> support for it, and even if it doesn't work, libfprint can be patched
>> to use a custom 'wrapper' for executing the binaries.
>
> You seem to have omitted reading a large part in the
> commit message for the systemd change.
>
>> TODO? The new natively built systemctl binary may replace
>> the script in systemd-systemctl-native, as it supports
>> more options and works better than the script. For example,
>> the current script does not create the symlinks in
>> /etc/systemd/system for WantedBy= and RequiredBy= settings
>> and does not support systemctl set-default some.target.
>
>
> This is not relevant to libfprint itself, it's a bug in
> Yocto's systemctl replacement script.
>

Here's the fixed

----8<--- foo.service ----8<---
...
[Install]
WantedBy=bar.service bar2.service bar3.service
RequiredBy=baz.service baz2.service baz3.service
...
----8<--- foo.service ----8<---

> The symlinks in /etc/systemd/system/bar.service.wants
> and /etc/systemd/system/baz.service.requires are not
> created for foo.service.

Or not all of them. This command fixed them on the
installed system by creating all symlinks and not just the first:

systemctl reenable foo.service

but on a PXE booted image it's a bummer.

> This command is also not supported by the Yocto replacement:
>
> systemctl set-default custom.target
>
> I have been bitten by both issues.
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179330): https://lists.openembedded.org/g/openembedded-core/message/179330
> Mute This Topic: https://lists.openembedded.org/mt/97950749/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


