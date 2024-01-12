Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C24DC4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 10:21:33 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.4265.1705054882608352546
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 02:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lzJiHrjH;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a26fa294e56so646523966b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 02:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705054881; x=1705659681; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUPxmuFARdA77IEMJ0gg6BAwcfTDirGLCt6p79PhTFo=;
        b=lzJiHrjHJbHiO1CcJxA0XSitzG1x7rDc7w4gLrmArr3e4g56Hv+vUT6uYQ8zvjMVUS
         lH5nw9rqS5VbaCskm2pmvuUQxO9OmbZGKEUF/+jlRWGtsDtMbFkZf/PyCeGFSppBmISO
         uInKFPxqZtqWIR+GU+Yt57OYxGOyB9zgx7IIgB/ZpuWN1CqLpWmA+LnGTC3fr2MRGFuv
         5pracuEH5VnxOnMohmlsMUqsOxSt6TpJAhH2FX7zfoD6V+S4X2cgz+U+aak1KWy+QvH+
         SumMm7wTLia+R+o76tZqtAMsGrtjn6psClHupzyJvEzWqbkpZfbDB3SDGyN/Y9jp9Ang
         rJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705054881; x=1705659681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUPxmuFARdA77IEMJ0gg6BAwcfTDirGLCt6p79PhTFo=;
        b=paRxb1GMS10gWKRgRdHeef62ffHHj1KeuLpYaGIKLIoOsInEn5RAANM6NDqqVql7Me
         gs2Ok3Yx3GZeavqkft/f3zCcSHNkKqYmwbi9g6gXftPZmWO4X1Q4b1UWiIL+1+d0GqMC
         iaWu5zgWuX42AcK9RIa0fvGdIPjH3xZGfpq/h3TF936hDW1L308NcljqfLA86F2m+R7I
         CCHUF8SrydJ7QpXfkMQ0orRk+4iFTNEurQyTfozvN1lz86+cS9AEeUVLzxN1R/uZzvQ8
         GaX45ZoIvN8uDHbqqppcHCAvEiMz0gjw43UMRQzWPy4sCp/wOxRHbkSu/UkkxrvDQv2r
         6n9g==
X-Gm-Message-State: AOJu0YyKMbvfJnoalntE5lh069wavXTBurunlxb3ae94ylKbZ3jSSN6M
	wM/Zkwob53sSHSt5qEwpjtM=
X-Google-Smtp-Source: AGHT+IEhr/ox8GPhnIWT58k3f9hR3rox1DcwAcvWOD0gvxJaTK18/pZI6e2SP0VvUGF/OIvS9Ci7dA==
X-Received: by 2002:a17:907:3182:b0:a28:f8d2:7897 with SMTP id xe2-20020a170907318200b00a28f8d27897mr713049ejb.20.1705054880803;
        Fri, 12 Jan 2024 02:21:20 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id i15-20020a170906264f00b00a268002274csm1637868ejc.52.2024.01.12.02.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 02:21:20 -0800 (PST)
Message-ID: <9296831d-bc09-4c20-b0c3-e419aef8a232@gmail.com>
Date: Fri, 12 Jan 2024 11:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 2/3] mesa: add support for RustiCL under
 PACKAGECONFIG "opencl"
Content-Language: en-US
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20231230191444.1204808-1-dmitry.baryshkov@linaro.org>
 <20231230191444.1204808-3-dmitry.baryshkov@linaro.org>
 <cee73ff2f2260660bd9138d13921a5425dbbb333.camel@linuxfoundation.org>
 <CALT56yPPkLbxQbMtu1o4K5gAoN4MY2uaHPdxJBLgia4Ynw9AUA@mail.gmail.com>
 <a46cf5c2b2afd5f73f247c9aefd9b3103201db8d.camel@linuxfoundation.org>
 <CALT56yPGZjpz0agYzDmmSQeaHXC8g0O=dwLPqcU+kDdJ3WCk+g@mail.gmail.com>
 <67deee116e78f2d0695e3cb25b284380465d780c.camel@linuxfoundation.org>
 <CALT56yNT-OZbXqqAPJXJ79ih1u_F3O40qoZJDwnhywjFQM-8ZQ@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CALT56yNT-OZbXqqAPJXJ79ih1u_F3O40qoZJDwnhywjFQM-8ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 10:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193574

2024. 01. 02. 23:57 keltezéssel, Dmitry Baryshkov írta:
> On Tue, 2 Jan 2024 at 17:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2024-01-02 at 17:25 +0200, Dmitry Baryshkov wrote:
>>> On Tue, 2 Jan 2024 at 13:40, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Tue, 2024-01-02 at 12:32 +0200, Dmitry Baryshkov wrote:
>>>>> On Sat, 30 Dec 2023 at 23:02, Richard Purdie
>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>> On Sat, 2023-12-30 at 21:14 +0200, Dmitry Baryshkov wrote:
>>>>>>> From: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>>
>>>>>>> Mesa now has two OpenCL implementations: Clover (older one) and RustiCL
>>>>>>> (newer one). Extend the "opencl" package config to include both
>>>>>>> implementations into the libopencl-mesa (-dev) packages. As the Clover
>>>>>>> implementation is in maintenance mode and is expected to be removed at
>>>>>>> some point, it doesn't make sense to split the packages or to provide
>>>>>>> two config options.
>>>>>>>
>>>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>> [DB: reworked rust class inheritance]
>>>>>>> [DB: merged "rusticl" and "clover" back to "opencl"]
>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> ---
>>>>>>>   meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++++++-----
>>>>>>>   1 file changed, 16 insertions(+), 5 deletions(-)
>>>>>>>
>>>>>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>>>>>>> index efbce5caade5..a192562a7935 100644
>>>>>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>>>>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>>>>>> @@ -48,6 +48,12 @@ PROVIDES = " \
>>>>>>>
>>>>>>>   inherit meson pkgconfig python3native gettext features_check
>>>>>>>
>>>>>>> +# We can not include rust conditionally, otherwise it can not be overriden by
>>>>>>> +# the bbappends.  Instead always include it, but remove the dependencies by
>>>>>>> +# default.
>>>>>>> +inherit rust
>>>>>>> +INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
>>>>>>> +
>>>>>> I'd really prefer not to have the rust inherit unconditionally. I have
>>>>>> some ideas about how we could fix this in bitbake so we may need to
>>>>>> wait for that if we can't avoid the PACKAGECONFIG issue from appends...
>>>>> Well, it's not just appends. Extending PACKAGECONFIG from local.conf
>>>>> also doesn't work. In fact even adding "opencl" to the default
>>>>> PACKAGECONFIG doesn't work unless I move `inherit
>>>>> @{bb.utils.contains....` after the PACKAGECONFIG definition. Using
>>>>> `INHIBIT_DEFAULT_RUST_DEPS` works around that issue, but yes, it has a
>>>>> drawback of including rust unconditionally.
>>>> PACKAGECONFIG:append:pn-mesa = " opencl"
>>> Yes, I tried that. I got an error about rust tools not being defined.
>>> I think the :append: and overrides are handled after the inherit
>>> argument is handled. So it is either PACKAGECONFIG being fully defined
>>> before inherit (literally before), or inherit ends up with an empty
>>> argument.
>> The append and overrides would be expanded at the time the expression
>> in the inherit statement is evaluated so if that didn't work there is
>> something else at play...
> I did not attempt debugging the bitbake itself. However I can see that
> with this line in local.conf, PACKAGECONFIG is updated, but the RUSTC
> is not defined (which means that rust.bbclass was not inherited). Then
> I tried adding opencl to the default PACKAGECONFIG in mesa.inc. If
> inherit comes before PACKAGECONFIG being set, it is not honoured. If
> inherit comes after PACKAGECONFIG, it works as expected (and RUSTC
> gets defined).

Something like this should work:

inherit ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'rust', '', d)}

E.g. the libxml2 recipe does it, although for a different bbclass.

Best regards,
Zoltán Böszörményi


