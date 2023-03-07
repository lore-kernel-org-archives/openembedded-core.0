Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A4AC678DB
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 06:32:12 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.8720.1678170724715470577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 22:32:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nsCGbGAP;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id da10so48249807edb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 22:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678170723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8roQp4XYnWVyX+IRV7+R7fN8CPpbQ8dAp19vb8KGCI=;
        b=nsCGbGAPwJQFURQbyLg3YJhjHrOVHOY8vrXjFRxdg0jG0opeHZY8k23J7o3xDsMdK1
         uXUzBZQBAVsl6ZsCPrv9nG1rg2ie6i+B/VNd6JzpNjbgon0CQlYzj9cKQ0X0STDoj/q/
         Z68/Ng3jA3K1NfgPJR/T83EicRTeRdgP4tk1O9vwbqkg0apkabW8QEewCjF/9N7FviIQ
         Ma9YMOPCTx4TgLoRFKQ4VELTvQFefcE4ifATf4lCq2ugUUEG2FWFz9nao96g7vKjYcs3
         1nHxgHPokKK6yZPUex2r7vl/Pt7Kld9LliGPPsPwOJ0bjxiG70sfZ5ARLxwJp3e3IQUi
         VIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678170723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8roQp4XYnWVyX+IRV7+R7fN8CPpbQ8dAp19vb8KGCI=;
        b=CEt6J2lZTYfeNT2HD+o3q9Q9Ku+rb5lqXQDKG4PaxeCAcLyqHbxCqbOQ/DLpD8GYi+
         9JTw9ml8t6S4Yr2rFrwphxT6p7YgHdj8S4qO55Dgris/emmDna2E7gB44CH1M9ypJ+Qq
         eOZOkFbGA27rwpoiZqiLpsuMr4alFZSmr8dY3nEQ96JtltEjho6cFPcOctE+GZxl7MLx
         /aFfGJuMPjntaxtP6T5lVw7WeQcxR1vO9wVIWV/1TTUKb3MovsdLLddCv5S8T6bbAeXK
         WMQeKo1mnmPvfxvzMexiZOpKpQDrdYnyWv8FLOLBu991zi+jFGyRZ2vuvrwHVnxv3GFG
         GMRA==
X-Gm-Message-State: AO0yUKXKsY/EwQ3Rs3PU2M4KNctS2h7HVXPY+8vYhzMwUPrKWgXOp2ti
	0UCVYl+wKCBHw4iErSjuKoc=
X-Google-Smtp-Source: AK7set/FPP3Ic0dNwLxuHWjhuULxmERZQ7jQE3comJIqE/qs2K0AeCJFu3R97VsUHanHVsDYnW47Qg==
X-Received: by 2002:a17:906:d9c2:b0:8b1:7b22:90b6 with SMTP id qk2-20020a170906d9c200b008b17b2290b6mr12265430ejb.37.1678170723065;
        Mon, 06 Mar 2023 22:32:03 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id 20-20020a508e54000000b004d8d2735251sm4114313edx.43.2023.03.06.22.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 22:32:02 -0800 (PST)
Message-ID: <5abeed64-f4e6-609c-bb99-0732f92f8ccd@gmail.com>
Date: Tue, 7 Mar 2023 07:32:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH v3 3/3] mesa: Add PACKAGECONFIG "rusticl"
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
 <Ross.Burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Kiernan <alex.kiernan@gmail.com>
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com>
 <20230306091108.3347363-4-zboszor@gmail.com>
 <CAP9ODKpcJOkVvrT2K9xPgEcsRq70f-NjNBtGtD3y-B5VS83GBQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAP9ODKpcJOkVvrT2K9xPgEcsRq70f-NjNBtGtD3y-B5VS83GBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 06:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178088

2023. 03. 06. 16:59 keltezéssel, Otavio Salvador írta:
> Em seg., 6 de mar. de 2023 às 06:11, Zoltan Boszormenyi
> <zboszor@gmail.com> escreveu:
>> In the anonymous python function that creates packages based
>> on PACKAGECONFIG, use a single synthetic "opencl" setting
>> that is added when either "clover" or "rusticl" are present.
>>
>> Without this, creating variables for two "libopencl-mesa" will
>> confuse the packaging code, resulting in subsequent packages
>> (like mesa-megadriver and others) being renamed incorrectly.
>>
>> This also makes sense from a packaging standpoint: currently
>> both clover and rusticl can be enabled, in which case both CL
>> frontends should go into the same libopencl-mesa subpackage.
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> Please name the PACKAGECONFIG as opencl-rusticl
>
>>   inherit meson pkgconfig python3native gettext features_check
>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'rust', '', d)}
> Here.
>
>>   BBCLASSEXTEND = "native nativesdk"
>>
>> @@ -136,6 +137,9 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>>   OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
>>   PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
>>
>> +# "rusticl" requires libclc, spirv-llvm-translator and bindgen-cli-native from meta-clang and spirv-tools from OE-Core
>> +PACKAGECONFIG[rusticl] = "-Dgallium-rusticl=true -Drust_std=2021,-Dgallium-rusticl=false,bindgen-cli-native libclc spirv-tools spirv-llvm-translator,libclc spirv-tools spirv-llvm-translator"
> Here.
>
>>   RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'clover', 'libclc spirv-tools', '', d)}"
>> +RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
> Here.
>
>>   PACKAGES =+ "libegl-mesa libegl-mesa-dev \
>>                libosmesa libosmesa-dev \
>> @@ -250,6 +255,11 @@ do_install:append () {
>>   # RPROVIDEs/RCONFLICTs on the generic libgl name.
>>   python __anonymous() {
>>       pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
>> +    # Add the synthetic "opencl" string to pkgconfig because
>> +    # both "clover" and "rusticl" would create libopencl-mesa.
>> +    # Both CL frontends should go into the same package.
>> +    if "clover" in pkgconfig or "rusticl" in pkgconfig:
>> +        pkgconfig.append("opencl")
> Here.

Thanks, I will rename the PACKAGECONFIG names.

>
> Also, we need to add RREPLACES, RRECOMMENDS and RCONFLICTS to old
> clover package so we support package feed upgrades.

There is no "clover" package, there is libopencl-mesa.
That doesn't change with this, with either or both PACKAGECONFIGs
enabled, there is still libopencl-mesa that ships either or
both CL frontends. The versioning should be enough for the upgrade.


