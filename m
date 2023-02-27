Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F00AC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 10:36:42 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.87119.1677494196641716763
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 02:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QL12bUiO;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id s26so23624574edw.11
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LXyQ7He2FzPUJrtYA6MmkRfYvya/lLJS6m+q1GrAeXY=;
        b=QL12bUiO9gv0g2cRHt2AKRNNKb36jpLHQwUZDJpCjjZXoRtVJfsaUi90ZIeutsyHoU
         es1P3XsJPp5OT4aAXUpf8RgpulyUNrJnHSHN5asUgliSCWuRs37gGMpIFdI7pV0bV7a+
         b7eeFaQ0cNc3+3FV0rIJ302DwQnCQCfv4J8K0vJlcWbOJY6BlDIFWn3N3ZiAsU+A0YGH
         utaTiUBi8Ax7NxZU2NmXvS1/ugpY5Ozs7P2K5r/R108LIMeo6Zhox13vC2P51ZhyUOL9
         UZJBvd+I9z+GV/fsH0sgZZ0zmbB8aDoZK2v6MOIAMDX9j9OxgDmfZQkpd5BAS6WcWF6I
         L7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXyQ7He2FzPUJrtYA6MmkRfYvya/lLJS6m+q1GrAeXY=;
        b=QtYT2HtgXN8HxkoP1Cm7AaLZ4eIyJ9Hrv+fOVW0OkTfYiUmueUFsGpsEKkkauPOSBg
         yMZw9s2AVrpcyVk0+BuQA3RGJz5XKekr8J05c/CTkfckljLueAyWWfRZ0OiyZoPnk8rR
         pVaxLm8Q4dOUkq+dTFyRt1yawMAs6u2W/kf73flef8Eb8KoHNcqYMB54iR9z0xE9nNVr
         FQW4crLJELddz8FwhqBE1ycZj/SaUusJRRNJWoL75mvgrDH51Z0iNqnKS7QbsB6ZdT27
         SCDDjwirr6iphFmR/jSJA1Sw+5UhmphHUv65els3y/5xyVNPG3/+jPYckht7KFb1r851
         qO+Q==
X-Gm-Message-State: AO0yUKULoHEAxq29WtlQsTQyl3/JKQwWR36PbLR6hbh+qPIT/nDYId14
	4xKFi+MWFGJUNiUjZJTs6J0=
X-Google-Smtp-Source: AK7set95kyPyWeQX8HN7HyM6df5cNbf1jReawxUppCq35IhgSbcA8/0NPdM9YbfV+RoMZAsQk+joqQ==
X-Received: by 2002:aa7:c6c6:0:b0:4af:69e2:529f with SMTP id b6-20020aa7c6c6000000b004af69e2529fmr16584588eds.27.1677494194910;
        Mon, 27 Feb 2023 02:36:34 -0800 (PST)
Received: from [192.168.1.143] ([188.36.67.108])
        by smtp.gmail.com with ESMTPSA id w1-20020a50d781000000b004acb2c8aeaesm2914627edi.85.2023.02.27.02.36.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 02:36:34 -0800 (PST)
Message-ID: <9e42abc2-7920-8a01-cc49-53d2e9f66150@gmail.com>
Date: Mon, 27 Feb 2023 11:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH v2 3/3] mesa: Add PACKAGECONFIG "rusticl"
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
 <Ross.Burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20230224093850.3393567-1-zboszor@gmail.com>
 <20230226050814.929055-1-zboszor@gmail.com>
 <20230226050814.929055-4-zboszor@gmail.com>
 <17479FC3A76A2964.29542@lists.openembedded.org>
 <CAO5Uq5R0gJUJuE6kMfsPd4BT5Psy=nVPnLMuYbYVfH3OgC5rpA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAO5Uq5R0gJUJuE6kMfsPd4BT5Psy=nVPnLMuYbYVfH3OgC5rpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 10:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177785

2023. 02. 27. 10:32 keltezéssel, Alex Kiernan írta:
> On Mon, Feb 27, 2023 at 8:04 AM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org>
> wrote:
>> On Sun, Feb 26, 2023 at 5:08 AM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> ---
>>>   meta/recipes-graphics/mesa/mesa.inc | 15 ++++++++++++---
>>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>>> index 89e2dc6e90..2fbc1f971e 100644
>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>> @@ -46,6 +46,7 @@ PROVIDES = " \
>>>       "
>>>
>>>   inherit meson pkgconfig python3native gettext features_check
>>> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'rust', '', d)}
>>>
>>>   BBCLASSEXTEND = "native nativesdk"
>>>
>>> @@ -119,6 +120,13 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>>>   OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
>>>   PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
>>>
>>> +# "rusticl" requires libclc and spirv-llvm-translator from meta-clang and spirv-tools from OE-Core
>>> +PACKAGECONFIG[rusticl] = "-Dgallium-rusticl=true -Drust_std=2021,-Dgallium-rusticl=false,bindgen-cli-native libclc spirv-tools spirv-llvm-translator,libclc spirv-tools spirv-llvm-translator"
>>> +
>>> +# Building "rusticl" runs bindgen.
>>> +# This setting is needed by bindgen to dlopen the correct libclang.
>>> +export LIBCLANG_PATH = "${STAGING_LIBDIR_NATIVE}"
>>> +
>> Could that be part of a wrapper in the bindgen recipe?
>>
> Also, with this export, I don't believe you have a dependency on
> anything from meta-clang (certainly you're not declaring it here
> AFAICS).

See https://gitlab.freedesktop.org/mesa/mesa/-/issues/8352
bindgen dlopens libclang which AFAIK doesn't exist in oe-core or meta-oe.
Unless I am wrong, bindgen does depend on meta-clang.

>
>>>   PACKAGECONFIG[broadcom] = ""
>>>   PACKAGECONFIG[etnaviv] = ""
>>>   PACKAGECONFIG[freedreno] = ""
>>> @@ -197,6 +205,7 @@ DEV_PKG_DEPENDENCY = ""
>>>   RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
>>>
>>>   RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'clover', 'libclc spirv-tools', '', d)}"
>>> +RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'rusticl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
>>>
>>>   PACKAGES =+ "libegl-mesa libegl-mesa-dev \
>>>                libosmesa libosmesa-dev \
>>> @@ -233,7 +242,7 @@ do_install:append () {
>>>   # RPROVIDEs/RCONFLICTs on the generic libgl name.
>>>   python __anonymous() {
>>>       pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
>>> -    if "clover" in pkgconfig:
>>> +    if "clover" in pkgconfig or "rusticl" in pkgconfig:
>>>           pkgconfig.append("opencl")
>>>       suffix = ""
>>>       if "-native" in d.getVar("PN"):
>>> @@ -305,7 +314,7 @@ FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
>>>   FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
>>>   FILES:libgl-mesa = "${libdir}/libGL.so.*"
>>>   FILES:libglx-mesa = "${libdir}/libGLX*.so.*"
>>> -FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
>>> +FILES:libopencl-mesa = "${libdir}/libMesaOpenCL.so.* ${libdir}/libRusticlOpenCL.so.* ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd ${sysconfdir}/OpenCL/vendors/rusticl.icd"
>>>   FILES:libglapi = "${libdir}/libglapi.so.*"
>>>   FILES:libosmesa = "${libdir}/libOSMesa.so.*"
>>>   FILES:libxatracker = "${libdir}/libxatracker.so.*"
>>> @@ -319,7 +328,7 @@ FILES:libglapi-dev = "${libdir}/libglapi.*"
>>>   FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
>>>   FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
>>>   FILES:libgles3-mesa-dev = "${includedir}/GLES3"
>>> -FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so"
>>> +FILES:libopencl-mesa-dev = "${libdir}/libMesaOpenCL.so ${libdir}/libRusticlOpenCL.so"
>>>   FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
>>>   FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
>>>                             ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
>>> --
>>> 2.39.2
>>>
>>
>> --
>> Alex Kiernan
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#177775): https://lists.openembedded.org/g/openembedded-core/message/177775
>> Mute This Topic: https://lists.openembedded.org/mt/97240533/3618097
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>


