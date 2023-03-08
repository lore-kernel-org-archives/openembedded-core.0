Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F36C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 05:28:18 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.695.1678253295336892655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 21:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eDZTCyEP;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id g3so61324433eda.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 21:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678253294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KFET1jzAwM6EpWUsM4R2icvJNgQrFLQwTKqXXnFqJiQ=;
        b=eDZTCyEPGeEmJAWv+9N2rIp8IIYfYCDZakwKEkuK3D8VJTC7Ob+0U6a41mktClzI5R
         Rw0pepIf1itdj4SCIpf40Xb303eU+YMg0AGNpzhjqbSvxBMZpDyb8HMRrqr3Vewqcgvr
         q3I5nA/RYvARWwnDqiEkXwP4FfFt9dbMFn48LcvIh3Zdn5JbxVbBYX2AK9u+jAYQcmdB
         Oi7KQJIAngYW37oSjmCuBA68LBLWxqdL66H4B6WUwLdExGxBryo9Wpu+EQPZFmOk/y1G
         sZT6VhtJtfi4DyRm9fCwqMzEnXI35w5LZy3DnsVBl4h+NID7LCOBaPfTTazV+iRYye/s
         1oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678253294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KFET1jzAwM6EpWUsM4R2icvJNgQrFLQwTKqXXnFqJiQ=;
        b=wIcg0fBbrBkalLJ9iQ/Jlvz3oeynAS0O8CN+uxEiomBW1aRXEbkP4TCsL9f9Y52jBg
         qZ5tEdXDlGxHuQv4Ce1ydma7PxFc4btXoqXwHSDwfhItnpfOVygEZyLggUucrvgSVh8E
         GsKYncY3LK0SXD6adRYEripldhd90roxcj3oK10xNIRPiYY3vtVK9hgtPRnlv7BV9e9q
         fPKvNwxY6FjlQO416of/l93csFEZwyQKRW7Tikg0SrqsO7vTZdIZ1nxwZsXSnO/fkFp0
         1MWluiqVeLNmCzFaKaGHK/d0tBv/lFLRG/yYSNm22L43Abyl7Y2wi/805pw5Ef78uQyp
         /jSQ==
X-Gm-Message-State: AO0yUKVBmmCy8zNWX493i+kfOePhxuR1fDQBYEk6DSQsWTMTAlJLTXO8
	TbQI8VXFNisMN7sFKmVGII4=
X-Google-Smtp-Source: AK7set/SdTtbAuMZTaI/myaIOmWvUq3ZxJPo3mQQ9prjgef0V2+O1OdxURWYb1khwu7MjgZpWP6XnQ==
X-Received: by 2002:a17:906:2303:b0:87f:89f2:c012 with SMTP id l3-20020a170906230300b0087f89f2c012mr15955145eja.24.1678253293719;
        Tue, 07 Mar 2023 21:28:13 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id ot18-20020a170906ccd200b008e40853a712sm6998947ejb.97.2023.03.07.21.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 21:28:13 -0800 (PST)
Message-ID: <1575601e-27f5-59ea-12cf-df9986f8401b@gmail.com>
Date: Wed, 8 Mar 2023 06:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH v3 1/3] mesa, mesa-gl: 23.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
 openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Kiernan <alex.kiernan@gmail.com>
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com>
 <20230306091108.3347363-2-zboszor@gmail.com>
 <CAP9ODKqgw7+wv9VWTHF6KrNmcVZzgdujKNTthWiM2zCxJZXKgw@mail.gmail.com>
 <CANNYZj9qaL310h66gXiP2ZR2f7ywhWHDzrgvFnyMQH7cFwArqA@mail.gmail.com>
 <6524a686-7e21-7c69-4fee-e17d4d757108@gmail.com>
 <CANNYZj_B1kxRB4bPWwCyU-90fR=ez0y=WGzdTjo16W05k5=Gww@mail.gmail.com>
 <c986ecfa-458d-b7a2-a69b-9f5cc4a3af0a@gmail.com>
 <CANNYZj9p+zBOA=Ng_zWafM8aaw=dEMNMcD450XmbVcQJq9R++A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9p+zBOA=Ng_zWafM8aaw=dEMNMcD450XmbVcQJq9R++A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 05:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178153

2023. 03. 07. 17:50 keltezéssel, Alexander Kanavin írta:
> On Tue, 7 Mar 2023 at 17:43, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>
>> This looks like it's coming from a mesa-native build
>> which should match the target build version.
>> The problem may be that despite of this, it tries to open
>> the host drivers from /usr instead of .../recipe-sysroot-native/usr.
> Yes, that's exactly what runqemu does, on purpose, by redirecting
> native mesa to use the host drivers via LIBGL_DRIVERS_PATH environment
> variable. We could easily make it use its own drivers from
> recipe-sysroot-native, but that means we have to actually build them,
> which is very heavy (e.g. llvm is required for llvmpipe, and some amd
> drivers). Unfortunately mesa 23.0.0 more or less forces that with its
> version matching.

I think that was already brewing with 22.3.x, since that version
cut off the "classic" drivers, keeping only the gallium ones.
Like the kernel, Mesa's drivers were implicitly expected to work
with everything built from the same main version because
they were using internal structures that may be reworked
from one major version to another.

That's why glvnd exists. NVIDIA's libGL.so.1 only loaded its own
hardware driver (kernel or userspace), and Mesa too.
The situation that started with 22.3.x explicitly stated that
glvnd has to be used if someone wanted to use the
classic drivers from Mesa 22.2.x a.k.a. the "amber" branch.
Though it's true that the version enforcing was only added
to 23.0.0, but it only added emphasis to the already existing
state of affairs.


