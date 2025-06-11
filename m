Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BFE3C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 10:46:57 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.4755.1749638812090388069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 03:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F9WAzm+J;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: zboszor@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-407a3913049so3487296b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749638811; x=1750243611; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqyHAGjYkBaaReRDz1iydFoXqeoOsbKmhK1H7ZBgMC8=;
        b=F9WAzm+JvAXn6Ou/1bkuC3a+YszM65q8+I9TXGe230eo9JWUB9ZXMnSuYms4XJDcSY
         17Y7akTua7yrI5cCWj4o610S3Hb6WS+WazO/a2TNLhpRMVU3Afwq8A0SQHGmYBcBZ8sj
         2lvDItZIQ9wX1AjlnKqTjHtx7LWDnwMuT1UXf0VFz4NUVX+DrztZ9agRj26cx1ezLZAg
         gRJ8zjzDOmMTbOv3Zbo3p47p336QVS0E3gfsHna0QyBa6lDRoLPAx/XGm2O0MaslPOjf
         /KOOMffyVrC+oY5e1JG2Oi5bFAWfCb1rFcsdq+buDBgw1hNV8dO5A476yVfOVrJnFKbP
         /GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749638811; x=1750243611;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqyHAGjYkBaaReRDz1iydFoXqeoOsbKmhK1H7ZBgMC8=;
        b=wjowJgPuTENihUYM0W5BOEsENoi3FHqUoWU0HfPXQCEccBOxgb2Cv7cE/3mRMUCsgc
         oTOEjNly41x6UWHAYPNJy9RRljaUmqBeuHL10+M13pRhXYNx9PYKWrsz9hkRfpDNKXbT
         k0NtkNaQGOEFkfVup54yXnkE9GEpvDTzZEqru1gDoXZNMyu1xAsB1jXK+IshllOGjZLE
         xyljFc7BwFUNR2xf81mmfLzxUK4QmpLajtr14SPceAZqlJCUQThr/x7sD2qPWmjjz00O
         9gY4i9YFx9o/LubDs1Rz9ek4hx9xC0//PcxHpC3xbMY21sZOnRAFyvmWMpu6LscMfAmj
         eHbw==
X-Gm-Message-State: AOJu0YzgvYWnO1NIdSFC/aBxZ51RJCQH/slZLV/BR9nIVltdqcCmKgzM
	q9jCsurmYGMhkT/n2lKccKvlgjYjocQ5cJ9/PrjcRnW1KusT7vBiHmiOqJJldA==
X-Gm-Gg: ASbGnctnPEM/V0mglhEGr28TpI0RJhQ23jUfljEq1wjjUpOkJbZfEyjaxJTU1nyfAsR
	2SSiZNWfGD+2VJW3Y500YuPHfTiw6D9lIXANiIA383GEnAMeNybovVbua3yqLK1OiotGOFB7Uev
	yB2hsqb0Mc+h3NT6b2bmVLNNeRDtr5rJlUqtmkW4zm1TQa4uWQME843Xb/K+1GuG1oRnbxV/aJK
	A+oW41FjrYQCF/bP4HNjgAyXcvWjyRlEywDZDOFdU2qKOorbiwm1VZUOJG4lRiKqGPjJsGZ5p+P
	KizD37vP/g7w4a62wYpDNUIjI/PDGLcHDVXStXtCyYHi00HJzuXPL6T0Rzep8KIWuKXTnPRzmJI
	KeR5Az0JS0F3kQ+OtcZM=
X-Google-Smtp-Source: AGHT+IHPb3nnIps6lVSO93CwdG+vW1C/Ys4YPjQkWzfO015DHLH9EQfzs1PImigbn+UfM15/Rao3LA==
X-Received: by 2002:a05:6e02:218f:b0:3dd:920f:d28e with SMTP id e9e14a558f8ab-3ddf42b3bb5mr26869485ab.13.1749638798923;
        Wed, 11 Jun 2025 03:46:38 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ddf4668c1dsm3445475ab.21.2025.06.11.03.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 03:46:37 -0700 (PDT)
Message-ID: <8e9387de-14f0-4def-a41e-3b8aeaa178a0@gmail.com>
Date: Wed, 11 Jun 2025 12:46:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: Fix bindgen includes
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
References: <20250610142413.681911-1-zboszor@gmail.com>
 <CAO9ioeUn24ndJqaH1O8B0G+mB8JKx_JcROXhzJqrw36L84bmNw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAO9ioeUn24ndJqaH1O8B0G+mB8JKx_JcROXhzJqrw36L84bmNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 10:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218446

2025. 06. 10. 21:49 keltezéssel, Dmitry Baryshkov via lists.openembedded.org írta:
> On Tue, 10 Jun 2025 at 17:24, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> Add a patch to fix bindgen errors due to not finding headers
>> in the system, like:
>>
>> |...
>> | ../mesa-25.1.2/src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal error: 'clang/Basic/Version.h' file not found
>> | Unable to generate bindings: clang diagnosed error: ../mesa-25.1.2/src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal error: 'clang/Basic/Version.h' file not found
>> |...
>> | .../work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not found
>> | Unable to generate bindings: clang diagnosed error: /data2/dtd-yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not found
> Can we fix this on the meson side by passing additional include path
> through the cross file?

This seems to work in mesa.inc without patching Mesa:

CFLAGS:append:class-target = " -I${STAGING_INCDIR}"
CXXFLAGS:append:class-target = " -I${STAGING_INCDIR}"

but it also[1] prints this for some of the bindgen runs:

clang diag: 
/home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:95:11: 
warning: '__INT64_C' macro redefined [-Wmacro-redefined]
clang diag: 
/home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:96:11: 
warning: '__UINT64_C' macro redefined [-Wmacro-redefined]

[1] Using the previously posted patch also prints the same.

It seems to be caused by a meson bug because it doesn't
collect the -isystem or --sysroot flags for rust/bindgen.
See the discussion at the MR link in the patch.

CFLAGS and CXXFLAGS changes are both needed because
bindgen is run on both .h and .hpp files for rusticl.

>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   ...w-build-option-for-extra-bindgen-inc.patch | 57 +++++++++++++++++++
>>   meta/recipes-graphics/mesa/mesa.inc           |  3 +-
>>   2 files changed, 59 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-Add-a-new-build-option-for-extra-bindgen-inc.patch
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218438): https://lists.openembedded.org/g/openembedded-core/message/218438
> Mute This Topic: https://lists.openembedded.org/mt/113570520/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


