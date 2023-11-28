Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB85C07E98
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 10:31:25 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.29735.1701167479158045065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 02:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELrT7Om+;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a00cbb83c82so752658466b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 02:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701167477; x=1701772277; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Heg1GJgFJovtAXCGL6TtTD00ootCE0UEeY7yh3pQggU=;
        b=ELrT7Om+aRAJtATyueh164JeeY9Sz60j0o8Wy7p3QunNY7yhItj9O57Dl3dbFHvhTY
         iC+JCCh3DOwB+z3ImWVHcr0IQ0+PXyg+ztGGcLBArIalF2qQWPs4j/jBRT7WeK/mDuWS
         GtNBBC7/UG+ik2KHOLjrgxDRTH/5ZZ+fVJYqwiusoVl6c1PeYuT3bR4RLmBJbTgM28g9
         aQPzqazr7POqjFx/p0dx3+ngi/ahWh75S3p3uK5pHXqA3WjTG4rw89DbtnwqYPidV13U
         FRiNRFkc3F9fG9VgH46kLKpqRGmfVIY4xUlRZEVBMu0muUjCdxAys0KAxe8dWtFEvWAc
         EtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701167477; x=1701772277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Heg1GJgFJovtAXCGL6TtTD00ootCE0UEeY7yh3pQggU=;
        b=pM/HcGV84ueqp/CL2ks4GWISgLtmlb4b0N82DQXPgRmhJ2/jZBhmcMBUAcLgzRszUF
         N78Ak/f8CMxp4ycrEf66IZd4Rf5LLtMCKyM1fyfgwVclKG2OI2LtuFG3K/edk1QRrD51
         IgogeYFy1lhKlNc5tMnVf3BVYwzOuSYLOd5KHKNF1qZSmJbwOqA8VGBNcs9lgZxuUWpc
         ToBdyxD/I2a4uWe+Xpia+HCD8PE+yO59QpTjqbTj+3/nnHxlBrS4a4rSxssUrFlr8u6p
         /myL4Awy+10eB6W/XoBdrHJWEb4Z6gm1J0mFpGaBwzaUMueQrd9mBFKUbnRzU5lx/sPv
         4YnA==
X-Gm-Message-State: AOJu0YyJcgxIZ8XMtsbkjVHsEE3GyAffIu1uiEbcGfsCsUaQdWYHeV3W
	JsxwayeozSEf2DwI9KuMmZE=
X-Google-Smtp-Source: AGHT+IEMjXW2C408mMNyniz4czwpGBlY+iwVQ3MrKtal8vWB713m7j3fc+ZnpZdFBpp0vCJfVRKRCA==
X-Received: by 2002:a17:907:d407:b0:9d0:51d4:4d87 with SMTP id vi7-20020a170907d40700b009d051d44d87mr13446915ejc.62.1701167477424;
        Tue, 28 Nov 2023 02:31:17 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v12-20020a170906338c00b009f2b7282387sm6633498eja.46.2023.11.28.02.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 02:31:17 -0800 (PST)
Message-ID: <d1479bd9-163c-4958-b1e2-6eb066fbe41a@gmail.com>
Date: Tue, 28 Nov 2023 11:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] bitbake-server does not exit after build ends
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com>
 <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com>
 <ab819301dbf2bf4a669dfdbd937b21f0c7ec719c.camel@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <ab819301dbf2bf4a669dfdbd937b21f0c7ec719c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 10:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191354

2023. 11. 28. 11:00 keltezéssel, Richard Purdie írta:
> On Tue, 2023-11-28 at 10:26 +0100, Böszörményi Zoltán wrote:
>> So it's not just Fedora, but Python 3.12 in general.
>>
>> Googling for problem with threads + fork reveals that
>> it is indeed an issue even in C / POSIX: only the thread
>> executing fork() will become part of the new process,
>> but not the main process starting the thread or any
>> other threads from the original process.
>>
>> The warning is justified, and apparently the issue
>> not occurring in bitbake with previous Python versions
>> is pure luck.
> I'm not sure that is entirely true/fair.

Maybe not fair. Still, true. See this piece:

http://www.doublersolutions.com/docs/dce/osfdocs/htmls/develop/appdev/Appde193.htm

Other discussions, like this one confirm the same:
https://stackoverflow.com/questions/39890363/what-happens-when-a-thread-forks

>   The way bitbake has executed
> processes and handled threads was very carefully written deliberately
> to avoid some of these kinds of issues so it wasn't "pure luck". What I
> don't know is what changed in 3.12 to mean this now is potentially
> breaking.

The warning only occurs if os.fork() is called when
there are already Python threads.

I guess the general performance uplift in Python 3.12
can trigger a pre-existing issue in bitbake more easily.

It is entirely possible that the threads bitbake creates do not
exist yet with Python 3.11 and earlier at the time of executing
os.fork(). ¯\_(ツ)_/¯


