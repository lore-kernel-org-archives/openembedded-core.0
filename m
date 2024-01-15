Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9D6C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:58:55 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.75142.1705312728628605472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:58:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y+8MA5p3;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5592d72edecso1049727a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 01:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705312727; x=1705917527; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nHMgjefILeNq0vFoiK8uHhuBWCspHpoHcXf4h9kTVXs=;
        b=Y+8MA5p34VdGFeQ1xMeP+ZONzPjxa1STSFzHHWblA9XUfiXUddt7xb9eanc20mtlhK
         R3giD8uqvpYS2ggLcFBDCnPiXs63Mx9qBH8nuTzpXDfPQ96NUvxlviTMEn0fsbj9SPEz
         tc/O/glSdvCyQqqHEe1BkqQSmTKfdfVQMBNWdFECLUQEmxYToMjD9rRD77Wm2I55qC9g
         laJCH1e21qBz1Twt5l5o2X/wXR0UjmzNGIIcu0GeGZHxffDs5vXyRvq6BVxIrDdKizbz
         9spFHsT6PqvD9dI/AShyLHs9UoYcnxIixlsT6qj0bKv+5+nBfyJ5g3LVTb0OWNXjPz7c
         A1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705312727; x=1705917527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nHMgjefILeNq0vFoiK8uHhuBWCspHpoHcXf4h9kTVXs=;
        b=Ecu7EaVIdCK/Xm89QFyGRR2ukGv9gQ2DuK3RUcXPD8gq9mWVpUFjRBKai7bEgmYcDV
         I4rM+pbMIQHsnPa21+uy1eRrml7SeowHCbKTKZllnc7xGrBJjcCAZllu2BghFLOK3cHo
         DO1MngmYBhOCmbjwa+n1wpJB0hATG5qtPEhonBwR4eGhSFdWBOr5dxlZmqcJ2hHvaU35
         4P5mDSLEtncTHJ2eSnIr+gOgnGuGETa0oEuf3jfD27WjTx62LLU/y2DZ+w809xLl5PQR
         Am7hj1ISFVimH58g+2NtJCssaKROcFiJEKiJaOt35nRyaO50kdzijV5S82eGGXZ2d+1v
         hj8A==
X-Gm-Message-State: AOJu0YxBcuxFB0WkgLAcMpzlZX1suGTyaM6k/MYWxDeD/LUKQZTn2GIL
	TvXu/DCTBbcd0j7z3hN/Ags=
X-Google-Smtp-Source: AGHT+IH8UAQ1uFhhtL8YaVLUanFnGaRnOw3nIVn3mUNJIcVf5hyRasHJIpW20UFyy5TcubPQ3Tfcsg==
X-Received: by 2002:aa7:c143:0:b0:558:b89d:a2ce with SMTP id r3-20020aa7c143000000b00558b89da2cemr3022299edp.19.1705312726559;
        Mon, 15 Jan 2024 01:58:46 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d9-20020a50fe89000000b00558ebc389a0sm3394845edt.38.2024.01.15.01.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 01:58:45 -0800 (PST)
Message-ID: <7ac96de5-c250-4422-bf3a-d2addf9b79a3@gmail.com>
Date: Mon, 15 Jan 2024 10:58:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 2/3] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org>
 <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
 <CALT56yPPkLbxQbMtu1o4K5gAoN4MY2uaHPdxJBLgia4Ynw9AUA@mail.gmail.com>
 <a46cf5c2b2afd5f73f247c9aefd9b3103201db8d.camel@linuxfoundation.org>
 <CALT56yPGZjpz0agYzDmmSQeaHXC8g0O=dwLPqcU+kDdJ3WCk+g@mail.gmail.com>
 <67deee116e78f2d0695e3cb25b284380465d780c.camel@linuxfoundation.org>
 <CALT56yNT-OZbXqqAPJXJ79ih1u_F3O40qoZJDwnhywjFQM-8ZQ@mail.gmail.com>
 <9296831d-bc09-4c20-b0c3-e419aef8a232@gmail.com>
 <CALT56yN=sT14RdiyHJy2ctcosY_pSG0KdN8vJV25TvwsPOifnQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CALT56yN=sT14RdiyHJy2ctcosY_pSG0KdN8vJV25TvwsPOifnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:58:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193667

2024. 01. 13. 7:12 keltezéssel, Dmitry Baryshkov írta:
> On Fri, 12 Jan 2024 at 12:21, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2024. 01. 02. 23:57 keltezéssel, Dmitry Baryshkov írta:
>>> On Tue, 2 Jan 2024 at 17:30, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Tue, 2024-01-02 at 17:25 +0200, Dmitry Baryshkov wrote:
>>>>> On Tue, 2 Jan 2024 at 13:40, Richard Purdie
>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>> On Tue, 2024-01-02 at 12:32 +0200, Dmitry Baryshkov wrote:
>>>>>>> On Sat, 30 Dec 2023 at 23:02, Richard Purdie
>>>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>>> On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
>>>>>>>>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>>>>
>>>>>>>>> Mesa now has two OpenCL implementations: Clover (older one) and RustiCL
>>>>>>>>> (newer one). Extend the "opencl" package config to include both
>>>>>>>>> implementations into the libopencl-mesa (-dev) packages. As the Clover
>>>>>>>>> implementation is in maintenance mode and is expected to be removed at
>>>>>>>>> some point, it doesn't make sense to split the packages or to provide
>>>>>>>>> two config options.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>>>> [DB: reworked rust class inheritance]
>>>>>>>>> [DB: merged "rusticl" and "clover" back to "opencl"]
>>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>>> ---
>>>>>>>>>    meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
>>>>>>>>>    1 file changed, 16 insertions(+), 5 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>>>>>>>>> index efbce5caade5..a192562a7935 100644
>>>>>>>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>>>>>>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>>>>>>>> @@ -48,6 +48,12 @@ PROVIDES = " \
>>>>>>>>>
>>>>>>>>>    inherit meson pkgconfig python3native gettext features_check
>>>>>>>>>
>>>>>>>>> +# We can not include rust conditionally, otherwise it can not be overriden by
>>>>>>>>> +# the bbappends.  Instead always include it, but remove the dependencies by
>>>>>>>>> +# default.
>>>>>>>>> +inherit rust
>>>>>>>>> +INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
>>>>>>>>> +
>>>>>>>> I'd really prefer not to have the rust inherit unconditionally. I have
>>>>>>>> some ideas about how we could fix this in bitbake so we may need to
>>>>>>>> wait for that if we can't avoid the PACKAGECONFIG issue from appends...
>>>>>>> Well, it's not just appends. Extending PACKAGECONFIG from local.conf
>>>>>>> also doesn't work. In fact even adding "opencl" to the default
>>>>>>> PACKAGECONFIG doesn't work unless I move `inherit
>>>>>>> @{bb.utils.contains....` after the PACKAGECONFIG definition. Using
>>>>>>> `INHIBIT_DEFAULT_RUST_DEPS` works around that issue, but yes, it has a
>>>>>>> drawback of including rust unconditionally.
>>>>>> PACKAGECONFIG:append:pn-mesa = " opencl"
>>>>> Yes, I tried that. I got an error about rust tools not being defined.
>>>>> I think the :append: and overrides are handled after the inherit
>>>>> argument is handled. So it is either PACKAGECONFIG being fully defined
>>>>> before inherit (literally before), or inherit ends up with an empty
>>>>> argument.
>>>> The append and overrides would be expanded at the time the expression
>>>> in the inherit statement is evaluated so if that didn't work there is
>>>> something else at play...
>>> I did not attempt debugging the bitbake itself. However I can see that
>>> with this line in local.conf, PACKAGECONFIG is updated, but the RUSTC
>>> is not defined (which means that rust.bbclass was not inherited). Then
>>> I tried adding opencl to the default PACKAGECONFIG in mesa.inc. If
>>> inherit comes before PACKAGECONFIG being set, it is not honoured. If
>>> inherit comes after PACKAGECONFIG, it works as expected (and RUSTC
>>> gets defined).
>> Something like this should work:
>>
>> inherit ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'rust', '', d)}
>>
>> E.g. the libxml2 recipe does it, although for a different bbclass.
> This way enabling opencl in .bbappend is not honoured.

Yes, I remember now, that's what I was fighting with, too. Pity.

I wonder why, though. Isn't the .bb and all .bbappend files
loaded, merged then parsed as a whole entity with the variable
dependency graph used for the inherit lines?


