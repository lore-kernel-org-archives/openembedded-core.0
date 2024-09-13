Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0417EFA3743
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 10:44:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.70612.1726224229647802459
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 03:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AtIQQE8k;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374c4d4f219so1313260f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 03:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726224228; x=1726829028; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eUSssw8FBh7kZ4d+ga6yYI5FDz9j2eRUgHwJk2YtyFo=;
        b=AtIQQE8kCldrjc5IxqfnT1grgxayNu9Y7ns8NpxWo8Vx+ZbiCTD7wa3/z6RZR2WsnD
         tdUdGEooDnVRTweFKTD7QYNOnkfuIYNzRUxGjlNkoqxxIuIbOEKwF/3Y7P13QV1HqHys
         qCvRMk+maRlDsYhqWBQYuH1+DS1Ono5QCMRBgbnbwXvfNrHiShV4E1Nq19zYPV7V/qNA
         KrUhEQ2LUtneCmm6ZxWayVyA8U/KqVoZBemxGEniEw0TLqvB2FEH6eZF3fbKLLzFQDqp
         p9aAosh6JyVpp0cafsv7A8U2kZvDHcrDA4rbHHjjO57Za2RJfQLS0wyyzmXLoCNA7aV7
         MKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726224228; x=1726829028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUSssw8FBh7kZ4d+ga6yYI5FDz9j2eRUgHwJk2YtyFo=;
        b=BWa5zhfctO+XS/QuzYy3S4mMN+4UjCAhaHrBf9csw9tLrnTh+6Y0H5Pgp9otfnHAU7
         SA6gOGl69zSa1AdK0FxLHqEzKDy29RM8w22Ffn6OWOSPXPI4jnfLgrpc0I7P2gsK+Xjq
         7jyRfLGJO9lFl+YpZ9mPWrFIobbXLx0OyNsh5xRrs61ScBNPiE4dfeCvtN+BohVgF+2r
         QJombtCPavdkK2oeb+fxn5vjSxY5zI2DMDZjx67AraBkNvcCk9v2V0obOfdu1yE0/MVy
         5Nt/9m3MNskMPKF5ZwAuIXeOVhOHXPzXoQxYJmsqqgm0Cqo3BR/Su3GJjyJH7LHfs5HD
         yUaA==
X-Gm-Message-State: AOJu0Ywph6vCTIsux/HrGR4ZkBSXJaGz0EBjCNNh/YpjPYWVjxsi8/1b
	3P1YsnsKIL5dOPn6keC+Vkwpp74GYg9Gxf8wdx6+FSVrJlCXwOP0
X-Google-Smtp-Source: AGHT+IGT1TLrvdl8XhZTxgqKJ6gxZK+xbaxXqrdSgP8dUILXpj+3BkCaYNYYF+vF31Nf+/4RlYg9Kg==
X-Received: by 2002:a5d:4e50:0:b0:374:c11c:c5c3 with SMTP id ffacd0b85a97d-378c2d5a7d1mr3445184f8f.41.1726224227861;
        Fri, 13 Sep 2024 03:43:47 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de3f0sm16395787f8f.113.2024.09.13.03.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 03:43:47 -0700 (PDT)
Message-ID: <b3c52dd5-e19a-442a-9da6-7ad1857c1e0c@gmail.com>
Date: Fri, 13 Sep 2024 12:43:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][oe-core][PATCH] mesa: add support for rusticl
To: f_l_k@t-online.de, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240908172311.3773048-1-f_l_k@t-online.de>
 <CANNYZj_aLfFFe14-YNYfGt5T05dRb_-N7NPSk3Tx5-j09xRtrg@mail.gmail.com>
 <HSHJJS.OO3X80OW2KGA@t-online.de>
 <17F4C79C2431BD42.10184@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <17F4C79C2431BD42.10184@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 10:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204479

2024. 09. 13. 12:40 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2024. 09. 09. 11:45 keltezéssel, Markus Volk via lists.openembedded.org írta:
>> On Mon, Sep 9 2024 at 10:46:59 AM +02:00:00, Alexander Kanavin <alex.kanavin@gmail.com> 
>> wrote:
>>> This does need to be properly looked into, there's probably a better patch possible, 
>>> or a build setting we're missing, or at least an upstream ticket to be filed. It's not 
>>> a good patch when it says 'workaround' and doesn't explain the issue and the fix.
>>
>> Fully agree. This is ugly as hell. Just a quick and dirty hack to get things working 
>> (which is always a good starting point) but by no means a solution for oe-core. Thats 
>> why I marked it RFC
>
> Don't call it a "workaround" then.
> Call it "pass in recipe-sysroot include directories" because
> that's what this patch does combined with the mesa.inc changes.

The underlying problem seems to be that bindgen does not
seem to pick up CFLAGS or CPPFLAGS automatically, so it needs
the extra -I options passed in under Yocto to look for headers
in the correct places.

>
> Though it's not complete in my testing.
> I needed this patch against 24.2.2 so I could build Mesa Rusticl,
> plus EXTRA_OEMESON += "-Dintel-rt=disabled" in my bbappend
> because the iris driver failed to build otherwise, complaining for
> every generated file from *.cl about "shader not available, consider
> installing libclc" or something like that, eventually failing the build.
>
> diff --git a/src/gallium/frontends/rusticl/meson.build 
> b/src/gallium/frontends/rusticl/meson.build
> index eef09d8f01e..efac4cab964 100644
> --- a/src/gallium/frontends/rusticl/meson.build
> +++ b/src/gallium/frontends/rusticl/meson.build
> @@ -146,6 +146,7 @@ rusticl_opencl_bindings_rs = rust.bindgen(
>      rusticl_bindgen_c_args,
>      pre_args,
>      cl_c_args,
> +   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'
>    ],
>    args : [
>      rusticl_bindgen_args,
> @@ -190,6 +191,7 @@ rusticl_llvm_bindings_rs = rust.bindgen(
>    c_args : [
>      rusticl_bindgen_c_args,
>      pre_args,
> +   '-I@include@', '-I@include_cpp@', '-I@include_cpp_target_sys@'
>    ],
>    dependencies : [
>      dep_clang,
>
>
>>
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204478): https://lists.openembedded.org/g/openembedded-core/message/204478
> Mute This Topic: https://lists.openembedded.org/mt/108340502/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


