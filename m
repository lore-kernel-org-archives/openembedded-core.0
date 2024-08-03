Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F12C3DA4A
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 05:14:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.3405.1722662037115171237
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 22:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LSl45xcH;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428035c0bb2so21783695e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 22:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722662035; x=1723266835; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYikuhq4w4ojstvm54NKclyaBHLb7khhuw31qyP454Q=;
        b=LSl45xcH29srwr7Zv0y585uhp0KkiYGVCRPS6iZU8XCRzBPOS+APP+uOxeKD+XT1z/
         8H6Rc1tGTQfdPGiw7OuHScg5TFhIDpsuYFr/9H6sE1wFsY0J0w8DWuqT3hzj6/0M3W1+
         pqESkAsMCrq8fT6z3mf/AnjuezT3jXFROYAXMxuMGe78OrCCurzCwSTEQ/6AHG8OH2Tz
         +HyiYlHo8SDi7je+5zRpPcdo5VqoXSmpQQMrtqtdDwANmNJwMJWPDmnXSXbaegbu/Fl9
         gsszAe2ecyQVdjDLKy65eavvUhgrZ3JQZXbQVy5RvKbHdLHK4f5FNjBZN6NlAAJf+1El
         4PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722662035; x=1723266835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYikuhq4w4ojstvm54NKclyaBHLb7khhuw31qyP454Q=;
        b=IGPnE2o7GBAoucMfXcBLxPONh/ElmVy4rmPj8N5LI3/OKfMZsl5syDlW/1pHQs9yQr
         kqvzqyqY3YZQZsX26/Z/Qw3kc2pALu5vMc4OHgcRMuoAIZm2/pyhQC6yK1ddLGbCANcq
         BXXIUxhj2o+4Ol/HsdaUlQyeFjI5bI8iELM+n6yssFG/X6sJs/k1MmkajAW9OTbi7y1b
         FjQEBmGrpZt6jx2I0dmZWvbFi+mzRJMz2obm0s4UVn7Y7DJqTFqj7zcvMJt3Z7DYUixK
         anfE3SbooNv9RhNnPdrp+m4HwYnJJBS3ygCND61uQPZAL8Lfbq9EpEjAXXvAJNcwoVlJ
         8rxg==
X-Gm-Message-State: AOJu0YzGMKjQVLoyTyIXvJvAulgYF+JzM4lsd17cHmdFcYyuH5JhMGeZ
	n4zwmk416Vos36AXi8YSi/8Y6abX/rQOUss0V1O6nbxs3Kf+HITe
X-Google-Smtp-Source: AGHT+IE/dANUY+I99BmIXXpR9LAN2riE8JOeAiVGFOQ9dP1iTh/Dya47hMQxrFzQ6iNoFhPE4oWRyQ==
X-Received: by 2002:a05:600c:4f0c:b0:426:67f9:a7d8 with SMTP id 5b1f17b1804b1-428e69a3307mr39241235e9.9.1722662034834;
        Fri, 02 Aug 2024 22:13:54 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282babaaa8sm115543305e9.24.2024.08.02.22.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 22:13:54 -0700 (PDT)
Message-ID: <90759604-7a95-4ef5-b03b-c66fb6107583@gmail.com>
Date: Sat, 3 Aug 2024 07:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/6] mesa: enable a rich set of drivers for
 native builds
To: peter.marko@siemens.com, "alex.kanavin@gmail.com"
 <alex.kanavin@gmail.com>, "alex@linutronix.de" <alex@linutronix.de>,
 Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230316094102.2628727-1-alex@linutronix.de>
 <20230316094102.2628727-3-alex@linutronix.de>
 <AS1PR10MB5697ED6BE1D46C5AEA0B2267FDB32@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <AS1PR10MB5697ED6BE1D46C5AEA0B2267FDB32@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Aug 2024 05:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202931

2024. 08. 02. 19:52 keltezéssel, Peter Marko via lists.openembedded.org írta:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Alexander Kanavin via
>> lists.openembedded.org
>> Sent: Thursday, March 16, 2023 10:41
>> To: openembedded-core@lists.openembedded.org
>> Cc: Kanavin, Alexander (EXT) (Linutronix GmbH) <alex@linutronix.de>
>> Subject: [OE-core] [PATCH 3/6] mesa: enable a rich set of drivers for native
>> builds
>>
>> Without this, the only available driver would be swrast
>> (without llvmpipe) which is far too slow to be practical,
>> and so qemu wouldn't be able to perform accelerated graphics.
>>
>> The one major dependency pulled in by this change is llvm-native
>> which takes just under three minutes on my machine. If this is
>> undesitable, opengl can be removed from DISTRO_FEATURES_NATIVE.
> I was just hit by this commit when migrating our gui layers from kirkstone to scarthgap.
> We include clang-native in our sdk and this creates conflict:
> ERROR: product-image-sdk-1.0-r0 do_prepare_recipe_sysroot: The file /usr/bin/llvm-lto2 is installed by both llvm-native and clang-native, aborting
>
> I had to create mesa_%.bbappend which replaces llvm with clang
> PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, clang clang-native elfutils"
>
> But bbappends are bad idea for config changes and should be only used as last resort so I'd like to solve it via distro config.
> Also update-alternatives doesn't work for native recipes I think.
>
> Any idea how to solve this in a nice way?
> One idea from me would be to create global LLVM_PROVIDER and LLVM_NATIVE_PROVIDER variables which could be automatically switched in meta-clang.
> Wdyt?

This is already documented in meta-clang.
Though it's not automatic, you have to add it manually to
your custom distro's configuration or local.conf.

https://github.com/kraj/meta-clang?tab=readme-ov-file#providing-llvm


