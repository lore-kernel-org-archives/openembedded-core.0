Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F428C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 09:39:57 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.50569.1680255593337108245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 02:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=igDjkkyf;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id i5so87467114eda.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 02:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680255591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLlI+TYgIlBVd3sgFHMs82wIyca3rtTuoXfoHhS428s=;
        b=igDjkkyfRgGmL4pwEPOnunlweiYtKiId/sQXqOtUC3ONqZnXhFw+TibZc0OiuIMgrn
         zatZ2eRF2DRDXajzGGgKu+qaSNy/vthhrIWCVn5XB7EmUXWIzMFY3Zpf/SNTB4T/WSvI
         sTX60tHO8y3H5e/QtOptJvFCg1Yl67nUTHKJ9NZACysrmCtgbuBwqonJCaFD8YNoKSq+
         3oD2xFGRC8by+kDH9gdWhTIgc6mXbIoeYG83g7nbReifXqSg52oEStKcJUfWEi1bTx7v
         P1vVVaUQwdiZdi6FImRXguhFJqcFZuWvuIhN0p0KpU+vI4UejKxLb89DVwetXdweaXTT
         4/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680255591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLlI+TYgIlBVd3sgFHMs82wIyca3rtTuoXfoHhS428s=;
        b=t942BWM0+unFvVlh+HdNBvxWufpv6rtLS0ciV3C27yVCWSWFM/bew3FQQhTuh7HS/w
         Z3ROPiFuO/Ax5pD3ZENtEF/kzdSvGf3FMc7ERbZYZAVkN3W2O/DcQIgxiqg0h8bitc/j
         PVvXAJ7ZGwWRae/MkdPM9/F+zNStARnwzQPWkvGVB1DMIo+jWbsdXekZMUWv1FttNhLy
         IDc6F7YZCEYnvCJ26CiRohNnNshzYzIa8XTeLOMHoUs7Lkst3VsEhyTF4WuXFk9n17nk
         9g3ig4dPXVZqpaAFz98JKD0effDypEfwubNUEY4cKQzMN1UrJ0Jt0bzAAQcsC0mQPqqw
         bfCw==
X-Gm-Message-State: AAQBX9e+UxBNqK+i/FrxCDoSsJ+erTb4xklRQfR1eLXfBOtLUV9qE+Vc
	mj3RhrNqE1vTPpX1SnIcaIc=
X-Google-Smtp-Source: AKy350a/a8uzTx8mRqE3RUN8obBpcr5gBNSXoX/9iPfygvdJdP5baqPwUNAsv6xgDJ40yYKvyKlXqw==
X-Received: by 2002:a05:6402:4da:b0:4fa:b302:84d9 with SMTP id n26-20020a05640204da00b004fab30284d9mr24924728edw.14.1680255591194;
        Fri, 31 Mar 2023 02:39:51 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a24-20020a509b58000000b005027d356613sm503866edj.63.2023.03.31.02.39.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:39:50 -0700 (PDT)
Message-ID: <6c7b2a9d-621e-5a1f-28c6-3a7993a25941@gmail.com>
Date: Fri, 31 Mar 2023 11:39:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
 <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
 <ab068d9c1e16fe78ea74b25a30412b55cad616a1.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <ab068d9c1e16fe78ea74b25a30412b55cad616a1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 09:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179406

2023. 03. 30. 18:39 keltezéssel, Richard Purdie írta:
> On Thu, 2023-03-30 at 16:10 +0200, Alexander Kanavin wrote:
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
>> usermode, and avoid all this nasty native stuff. Meson has direct
>> support for it, and even if it doesn't work, libfprint can be patched
>> to use a custom 'wrapper' for executing the binaries.
> Before we jump to using qemu user mode, the first question has to be do
> we really need a libgudev native to make libfprint-native work enough
> to build libprintf.
>
> I'd hope the answer is no, we don't as we don't want the build systems
> udev setup/devices leaking into a target build.
>
> We intentionally try and keep native dependencies minimal and needing
> native udev/systemd versions of things sets of warnings in my mind and
> in others since it often means we're doing things we shouldn't be or
> don't actually need.
>
> I appreciate there are issues with systemctl-native but those are
> separate issues and should be addressed as such. Complicating the build
> dependencies unnecessarily is bad and we should minimise them where
> possible. it isn't that I didn't read that bit of the patch, I just
> don't see it as a reason to have this dependency for libfprint.
>
> So, I come back to the question of what libfprint needs from libfprint-
> native and whether it really does need udev for that?

libfprint needs two generator executables to create
a set of udev rules and another file called autosuspend.hwdb.

Both executables are linked with the complete libfprint library
which includes the complete set of drivers that are configured
and built. They seem to need this to deduce the list of supported
device USB IDs for the current build. Both executables use fpi_
prefixed functions to ask the libfprint library for their goals.

In turn, the libfprint library depend on libgudev and libgusb
for hotplug and device discovery purposes, respectively.

There is also a meson bug that Alexander Kanavin brought
to my attention where custom_target() doesn't run executables
using the exe_wrapper and I seem to be hitting this with
libfprint.

I am not a meson expert so if there's a way to replace
the executable()+custom_target(capture: true) combination
with something more cross-compiler friendly, please don't hold
this information back.

I couldn't fix this for libfprint 1.0 / fprintd 0.9.0 two years ago
and I cannot fix it for the 2.0 beta versions either.
In my current in-house solution there's a separate systemd-native.bb
recipe but I thought maybe cleaning it up for upstream and
modifying the systemd recipe may be acceptable.


