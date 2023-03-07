Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EE9C6FD1B
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 16:43:45 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.20522.1678207415621795104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 08:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UuZWGgzW;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id da10so54916940edb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 08:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678207414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zn/3MId+x56L5l40R/tX7XB+cmsSzdViVGbQGwlXQSM=;
        b=UuZWGgzW02QDy8TzAO9yHCPnmnD8EQAmapkQOjQ9X8y090FgUxA2dd9UPkZ9xITqub
         4dcGpMH4dQ7mYGGce9Q2FLevZ7KUXK4mCqEGoaoYoCYQFccwYU7X2eexMU2gESIlQ564
         XsP6wyhZPNq6llPigr7wK6Y32x9LqNIccsvUgSWQasUV4Z9TDR61+FPRnj0omiCm77if
         +VkGoc6q8WFt5eKMvBVF2ZfHwPsb0SvDhCG1xENn2EyyZOUU6eoj2bd5/n6eF8471zmN
         s8NgwbeDK9dZPV6fOjGJq6qgloYDch+uQDtJfek1vUy1HrgiNDJInbdkDvXYeoMDVFZA
         9mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207414;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zn/3MId+x56L5l40R/tX7XB+cmsSzdViVGbQGwlXQSM=;
        b=bEVEP3RlbEylcpWpigY9ospGHKL6DYdAWArDkpXRIgZP30Xtf5xWxm0AZ1D1Px8cru
         ByVZdNmELKW63UkCQ2GL9vl6urFfffzlM3Y46Y8x5YwSfiTHXeKbF8PwQnEQc84FbF+5
         UPmuDTz2PSJTZqvR3agxqaL/7rnk5Jcl2nuXV5xaqM/W3NMvJwI0TsofpRHywfj/G5hv
         nB1GuIMwfHKJRH9QtJtIpKDEsIOQfRrsnaXH4VZGTtyROgqeM/vnOn9RlXybXv3skMwU
         OmVMPPprRPVkwQ6C5aOR+oRk/5QuCvwLboGZ1a0UG0TxGrlRWURHAx20WW8E8UKWZslo
         TMWA==
X-Gm-Message-State: AO0yUKVMD14M7fhCE7ermPuqzmskpjP2Anlo9j0ztPmF9kOH6Oxws7Q9
	0c51TG6MjtPGjzUGZw7QKoI=
X-Google-Smtp-Source: AK7set92fkZ2x0X5O6LKjovV5mGm3LhfhaaJyncHmlTvnfZdIyzzOkZaGhpf6cJa5g/yhK0alALnoQ==
X-Received: by 2002:a17:906:1287:b0:886:843b:e695 with SMTP id k7-20020a170906128700b00886843be695mr16312918ejb.22.1678207413912;
        Tue, 07 Mar 2023 08:43:33 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id gw5-20020a170906f14500b008c1f68ba0e2sm6264618ejb.85.2023.03.07.08.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 08:43:33 -0800 (PST)
Message-ID: <c986ecfa-458d-b7a2-a69b-9f5cc4a3af0a@gmail.com>
Date: Tue, 7 Mar 2023 17:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH v3 1/3] mesa, mesa-gl: 23.0.0
Content-Language: en-US
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
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_B1kxRB4bPWwCyU-90fR=ez0y=WGzdTjo16W05k5=Gww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 16:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178116

2023. 03. 07. 16:40 keltezéssel, Alexander Kanavin írta:
> On Tue, 7 Mar 2023 at 12:39, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> The reasoning for the change is that glvnd is a thing.
>> Maybe the drivers you mention should just use that.
>> Recent distros enable glvnd in Mesa out of the box and
>> NVIDIA also supports that.
> qemu unfortunately doesn't work this way. It links directly with
> libgbm, and libgbm probes directly into the drivers. This are the
> errors:
>
> did not find extension DRI_Mesa version 1
> failed to bind extensions
> did not find extension DRI_Mesa version 1
> failed to bind extensions
> did not find extension DRI_Mesa version 1
> failed to bind extensions
> did not find extension DRI_Mesa version 1
> failed to bind extensions
> qemu-system-x86_64: egl: gbm_create_device failed
> qemu-system-x86_64: egl: render node init failed
>
> And this is where they happen:
>
> Thread 1 "qemu-system-x86" hit Breakpoint 1, 0x00007ffff77e6020 in
> loader_bind_extensions () from
> /home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1

This looks like it's coming from a mesa-native build
which should match the target build version.
The problem may be that despite of this, it tries to open
the host drivers from /usr instead of .../recipe-sysroot-native/usr.

> (gdb) bt
> #0  0x00007ffff77e6020 in loader_bind_extensions () from
> /home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
> #1  0x00007ffff77e4fda in dri_screen_create_for_driver () from
> /home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
> #2  0x00007ffff77e53a8 in dri_device_create () from
> /home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
> #3  0x00007ffff77e376c in find_backend () from
> /home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
> #4  0x00007ffff77e3891 in gbm_create_device () from
> /home/alex/development/poky/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/../lib/libgbm.so.1
> #5  0x00005555559a00f8 in egl_rendernode_init (rendernode=<optimized
> out>, mode=DISPLAYGL_MODE_ON) at ../qemu-7.2.0/ui/egl-helpers.c:177
> #6  0x00005555559a04b1 in egl_headless_init (ds=<optimized out>,
> opts=<optimized out>) at ../qemu-7.2.0/ui/egl-headless.c:203
> #7  0x00005555559545f8 in qemu_init_displays () at
> ../qemu-7.2.0/softmmu/vl.c:2485
> #8  qemu_init (argc=<optimized out>, argv=<optimized out>) at
> ../qemu-7.2.0/softmmu/vl.c:3603
> #9  0x00005555557ec369 in main (argc=<optimized out>, argv=<optimized
> out>) at ../qemu-7.2.0/softmmu/main.c:47
>
> Alex


