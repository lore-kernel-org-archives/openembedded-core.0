Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A90BC77B62
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:46:57 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.50658.1680256007256176259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 02:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VlqCywk6;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id er13so46327107edb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 02:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680256006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozkKINMQI8o3Hk5eW027t493wqk9k/zDHkVjB9+0NqE=;
        b=VlqCywk6gTEGrBXuPA+nYkevlDlCuCUXnphqeffPE9OP26slcwsdaPaS1afDATHt9/
         8FqcBVuSWRRub8HEIr3Oa6C1nAhDjL2fDSCadtyVSQfuQFFjMbg3cQQx+PThBBIWAdkn
         YU52zoOZWSwd9MqozBdTR64BF8mQucGHf55sQCjmt535zISgmvybOae9ph68e+po624k
         9abHnnirbUdnwec0otdQrrMgj4Vjc8OQ2PleYokzq2Tpg7iMjgkWMYwIA0RFmNRTrcf6
         d67ZQTB3Mp8dgN7gNaEYqjcAxKQ/ObllAAlC7vi8QVr9Akes9EVh6RN5VPjfu9QdUkFG
         R0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680256006;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozkKINMQI8o3Hk5eW027t493wqk9k/zDHkVjB9+0NqE=;
        b=huzMoRHSqVEvkhkv44GG8P/tI17ewP5mI+tipg1xvmYtpUWTVl0Y1JV4YlMNd/ZKSN
         fhxPq3zx0jsEpVqa0+sBS9qK+vwnsxTdqU6NWCwMamgRp3zgeTmYy+DWcb0LHz52JErp
         tqK6qeKCnZKiv6QzLkjbBf7ioda0IMmcmxb7Bspy+NtfsRQOoyc+y1BXCz8UqisBxh53
         n2XQ78Qd9TnNdafeYQIl5RMLMuioJ97qLk0QwkqBenLTRpjQ8bpGtkEwjn0A/P8jzNAn
         aaLjHzjRENPPvCIEl/TqD2QeUq0uF0rABDj6n8Span5A+gx6sakB4SjfLf8BBFzR0KEe
         ZPqA==
X-Gm-Message-State: AAQBX9cX/tOmKTTA8VBvW/U1T0ijolhDzzMMgfTvIW+7GeSaakRFmMmt
	VwdKjEv6Ux6WlNEh24OUAwk=
X-Google-Smtp-Source: AKy350bHK4uzt4SJP0i2g8hh2tquWc0RenmiGVWb0ylOY2L2YsXeymtvrqKR064jtetHDNFrqaGERQ==
X-Received: by 2002:a05:6402:48e:b0:4fa:9b39:a388 with SMTP id k14-20020a056402048e00b004fa9b39a388mr26260952edv.14.1680256005730;
        Fri, 31 Mar 2023 02:46:45 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d3-20020a170906544300b009476309c1d9sm781547ejp.125.2023.03.31.02.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:46:45 -0700 (PDT)
Message-ID: <27b6f2b6-5e7f-8be6-32fc-2aa7cbd1402f@gmail.com>
Date: Fri, 31 Mar 2023 11:46:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
 <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
 <ab068d9c1e16fe78ea74b25a30412b55cad616a1.camel@linuxfoundation.org>
 <1751778F66ADC2DD.27612@lists.openembedded.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1751778F66ADC2DD.27612@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 09:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179407

2023. 03. 31. 11:39 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2023. 03. 30. 18:39 keltezéssel, Richard Purdie írta:
>> On Thu, 2023-03-30 at 16:10 +0200, Alexander Kanavin wrote:
>>> On Thu, 30 Mar 2023 at 16:08, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>>>> Please see the MR:
>>>> https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/431
>>>>
>>>> udev (provided by systemd) -> libgudev -> libfprint
>>>> also:
>>>> udev-native -> libgudev-native -> libfprint-native -> libfprint
>>>>
>>>> Also, please read the TODO part of the patch for systemd
>>>> and consider it.
>>> We can simply direct libfprint to run its own target pieces under qemu
>>> usermode, and avoid all this nasty native stuff. Meson has direct
>>> support for it, and even if it doesn't work, libfprint can be patched
>>> to use a custom 'wrapper' for executing the binaries.
>> Before we jump to using qemu user mode, the first question has to be do
>> we really need a libgudev native to make libfprint-native work enough
>> to build libprintf.
>>
>> I'd hope the answer is no, we don't as we don't want the build systems
>> udev setup/devices leaking into a target build.
>>
>> We intentionally try and keep native dependencies minimal and needing
>> native udev/systemd versions of things sets of warnings in my mind and
>> in others since it often means we're doing things we shouldn't be or
>> don't actually need.
>>
>> I appreciate there are issues with systemctl-native but those are
>> separate issues and should be addressed as such. Complicating the build
>> dependencies unnecessarily is bad and we should minimise them where
>> possible. it isn't that I didn't read that bit of the patch, I just
>> don't see it as a reason to have this dependency for libfprint.
>>
>> So, I come back to the question of what libfprint needs from libfprint-
>> native and whether it really does need udev for that?
>
> libfprint needs two generator executables to create
> a set of udev rules and another file called autosuspend.hwdb.
>
> Both executables are linked with the complete libfprint library
> which includes the complete set of drivers that are configured
> and built. They seem to need this to deduce the list of supported
> device USB IDs for the current build. Both executables use fpi_
> prefixed functions to ask the libfprint library for their goals.
>
> In turn, the libfprint library depend on libgudev and libgusb
> for hotplug and device discovery purposes, respectively.
>
> There is also a meson bug that Alexander Kanavin brought
> to my attention where custom_target() doesn't run executables
> using the exe_wrapper and I seem to be hitting this with
> libfprint.
>
> I am not a meson expert so if there's a way to replace
> the executable()+custom_target(capture: true) combination
> with something more cross-compiler friendly, please don't hold
> this information back.
>
> I couldn't fix this for libfprint 1.0 / fprintd 0.9.0 two years ago
> and I cannot fix it for the 2.0 beta versions either.
> In my current in-house solution there's a separate systemd-native.bb
> recipe but I thought maybe cleaning it up for upstream and
> modifying the systemd recipe may be acceptable.

Regarding my attempts to fix this: I have looked into
making these executables use "native: true" but it
would need duplicating all the driver and library targets
with "native: true", too, and it seemed to be too intrusive.
Also, it doesn't eliminate the native dependency chain,
building these executables would still need systemd-native,
libgudev-native and libgusb-native.

>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179406): https://lists.openembedded.org/g/openembedded-core/message/179406
> Mute This Topic: https://lists.openembedded.org/mt/97950749/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


