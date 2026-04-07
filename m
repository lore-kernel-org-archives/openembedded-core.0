Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976FCFEEF2A
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 11:39:57 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79182.1775561989571914609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 04:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d+nHkztX;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso35375085e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775561988; x=1776166788; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=836xZlK3BycFB8Ak7+L4Q1ROfkZLSv42i+BYU7j3LYU=;
        b=d+nHkztX1cs4LhRK62MUiMUscqwYA4KIqxpSIqUBbo2yLsOxJOfTO8mFv8P2FysEY8
         d+v1z/+3kmw+6VcQlyNbkGGrguR5Y9Gd2IMuBg2n7VKTB4sesXrAvqqOweCHu2D6ZLlL
         QdHLBKKdelk3x2XK4Sos+zIac0RGAyR7IANMaea9v+i2crvtglp/5rOg0gFmmt/CX8sA
         84YSpGtUXtynQvcbxDeT0TpBoYsXefLfz0tr4ROqkK142pYskllVU3l7Btk8tcNHQhZG
         jVjFDq+jOsbaEXtsMJ+OWM/NFBIwZWFfvqpz5knMonsawj5AqTEBhaprSCaO41pH4+Tg
         iWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561988; x=1776166788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=836xZlK3BycFB8Ak7+L4Q1ROfkZLSv42i+BYU7j3LYU=;
        b=WlicOqj2sBmi/fH3SxXWpTKQz3AVfzZdfr6B+IAMn0en8BtZG+OxWxggPn9MDd1xWO
         nlC4j9Ydzpl01G+9aMcxYUGtVEJiChnVAq0XdXjER52d/HcK6oWBxYyMvixLAAPAHgWk
         SJPMdC4N7pWr2Xjv+FgnsecwHWNXiskM/YdXWxliUwptxINXKTl/sKZ73ZF3xYBUmRdi
         c3KWdUZ8qOixnT3Cq+yt7y+c5AeeeqoiF0Bdsr7gPpjaWiIHCz41bS4uAzfhditVWmyV
         AGSNrsh2BRJbKbv1vKNQ6EBeTuZYAtiiJ5NcajFfjpRQDAo28xthGVk44aN3RElZZtHL
         elqA==
X-Gm-Message-State: AOJu0Yxn1I1CR17W6pjJaQ7Ygb6iit0oLDnO1sapHtdofmx/d+uRi4qa
	x7lStR3V0zH3/yl2ZPeYjJs/TWMre1bWPzw5hI0y08cmj/khwkP9igGs
X-Gm-Gg: AeBDietFhFsSyYJQ5hz6jiqgfZeFKTsJ/5qZJW0+pWYOBTYIS00PapPMNwWW5Zw9ns0
	QA6loIB/zCVPnyrZ3pH1f6leX4NfGdn3qH+9tGC/51IiO0FYDvLFeHscl+9LbF4uOynAE0qC/Bp
	baFcylw9fbZQDJH+BfPWaarypQ2Do4xBMNKHaNcEbGJycAi+yW/H+j/ucH88ULVcNnM1cGik4jm
	kRf55GaYAT1WT2r4UeBMiISBQnRXSj+4lokyJkoLP9A/KNsIhMm3s4O/+tN6rSZ8amfL7PBWTku
	eRg9uAzMb9ABuP1pYj3IG1l+gkmqkqONxhQTY/AfuiTaQbf0X8q49F2lK7r77GSePEJRSf6SZtg
	4N2N3Nps1KvoO6DA8Wz2vsrMlLJiNL9kMQAUDvjIVD9fgR1hmXaQw9eOSlulAl3dbVSXbBDB/9N
	yvTgmzGS/C3rU8lNPubBFQjlIaC+eULMbA3MeVhYk95xrbNIDopNFKXbyUca4t400X
X-Received: by 2002:a05:600c:2d07:b0:488:a82f:bba9 with SMTP id 5b1f17b1804b1-488a82fbd2fmr90954845e9.22.1775561987268;
        Tue, 07 Apr 2026 04:39:47 -0700 (PDT)
Received: from [192.168.2.122] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm616607425e9.4.2026.04.07.04.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:39:46 -0700 (PDT)
Message-ID: <e38f41d9-4af6-4389-90a7-0c2ae6b47330@gmail.com>
Date: Tue, 7 Apr 2026 13:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 3/7] pseudo: fix for build with glibc-2.43
To: martin.jansa@gmail.com, Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
 Randy.MacLeod@windriver.com
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <20260308150834.2508331-3-Hemanth.KumarMD@windriver.com>
 <CA+chaQcneoNBogdCZmZB3LCE-cVErs2-4NoNtYUGgK+REEBxLg@mail.gmail.com>
 <18A40738790ACBCC.657799@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <18A40738790ACBCC.657799@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 11:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234730

2026. 04. 07. 10:54 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> Hi,
>
> something is still wrong with pseudo on Fedora 44 (beta) after this change.
> Besides GLIBC 2.43, GCC 16 is on Fedora 44.
>
> Packaging fails for every file and directory shipped by the recipe with:
>
> Cannot open: Function not implemented
>
> or
>
> Cannot mkdir: Function not implemented

It's not GCC. I forced to build pseudo-native with GCC 15 and packaging
linux-libc-headers and others still failed with the same problem.

GLIBC is glibc-2.43-2.fc44.x86_64, which uses commit
48f5a05a7a1eeb9e0567ab429f654648f831307f from
the release/2.43/master branch. It's a post-2.43 commit.

> 2026. 03. 08. 17:37 keltezéssel, Martin Jansa via lists.openembedded.org írta:
>> Hi,
>>
>> this is already merged in the repo and there is SRCREV bump which
>> includes that change from Richard in master-next.
>>
>> Regards,
>>
>> On Sun, Mar 8, 2026 at 4:09 PM Hemanth Kumar M D via
>> lists.openembedded.org
>> <Hemanth.KumarMD=windriver.com@lists.openembedded.org> wrote:
>>> From: Martin Jansa <martin.jansa@gmail.com>
>>>
>>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>> ---
>>>   ...01-openat2-use-const-struct-open_how.patch | 54 +++++++++++++++++++
>>>   meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
>>>   2 files changed, 55 insertions(+)
>>>   create mode 100644 
>>> meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>>
>>> diff --git 
>>> a/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch 
>>> b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>> new file mode 100644
>>> index 0000000000..eda2593bdf
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/pseudo/files/0001-openat2-use-const-struct-open_how.patch
>>> @@ -0,0 +1,54 @@
>>> +From d17159194e94b5150600c333a5e2ad46fda6291e Mon Sep 17 00:00:00 2001
>>> +From: Martin Jansa <martin.jansa@gmail.com>
>>> +Date: Thu, 5 Mar 2026 17:53:34 +0100
>>> +Subject: [PATCH] openat2: use const struct open_how
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=UTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +To match
>>> +https://sourceware.org/cgit/glibc/commit/?id=0f0a5cd338998f4b603f52f3ce2163df0db7b814
>>> +
>>> +Otherwise it fails to build with glibc-2.43:
>>> +
>>> +In file included from pseudo_wrappers.c:300:
>>> +pseudo_wrapfuncs.c: At top level:
>>> +pseudo_wrapfuncs.c:11537:1: error: conflicting types for ‘openat2’; have ‘int(int,  
>>> const char *, struct open_how *, size_t)’ {aka ‘int(int,  const char *, struct 
>>> open_how *, long unsigned int)’}
>>> +11537 | openat2(int dirfd, const char *path, struct open_how *how, size_t size) {
>>> +      | ^~~~~~~
>>> +In file included from /usr/include/bits/fcntl-linux.h:492,
>>> +                 from /usr/include/bits/fcntl.h:61,
>>> +                 from /usr/include/fcntl.h:35,
>>> +                 from pseudo_wrappers.c:23:
>>> +/usr/include/bits/fcntl-linux-fortify.h:36:1: note: previous definition of ‘openat2’ 
>>> with type ‘int(int,  const char *, const struct open_how *, long unsigned int)’
>>> +   36 | openat2 (int __dfd, const char *__filename, const struct open_how *__how,
>>> +      | ^~~~~~~
>>> +make: *** [Makefile:162: pseudo_wrappers.o] Error 1
>>> +
>>> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>> +Upstream-Status: Pending
>>> +---
>>> + ports/linux/openat2/guts/openat2.c | 2 +-
>>> + ports/linux/openat2/wrapfuncs.in   | 2 +-
>>> + 2 files changed, 2 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/ports/linux/openat2/guts/openat2.c b/ports/linux/openat2/guts/openat2.c
>>> +index da01b31..366fb95 100644
>>> +--- a/ports/linux/openat2/guts/openat2.c
>>> ++++ b/ports/linux/openat2/guts/openat2.c
>>> +@@ -4,7 +4,7 @@
>>> +  *
>>> +  * SPDX-License-Identifier: LGPL-2.1-only
>>> +  *
>>> +- * int openat2(int dirfd, const char *path, struct open_how *how, size_t size)
>>> ++ * int openat2(int dirfd, const char *path, const struct open_how *how, size_t size)
>>> +  *    int rc = -1;
>>> +  */
>>> +
>>> +diff --git a/ports/linux/openat2/wrapfuncs.in b/ports/linux/openat2/wrapfuncs.in
>>> +index 96ae8a7..2f1e716 100644
>>> +--- a/ports/linux/openat2/wrapfuncs.in
>>> ++++ b/ports/linux/openat2/wrapfuncs.in
>>> +@@ -1 +1 @@
>>> +-int openat2(int dirfd, const char *path, struct open_how *how, size_t size);
>>> ++int openat2(int dirfd, const char *path, const struct open_how *how, size_t size);
>>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb 
>>> b/meta/recipes-devtools/pseudo/pseudo_git.bb
>>> index a26a205a16..b34525055d 100644
>>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>>> @@ -1,6 +1,7 @@
>>>   require pseudo.inc
>>>
>>>   SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
>>> + file://0001-openat2-use-const-struct-open_how.patch \
>>>              file://fallback-passwd \
>>>              file://fallback-group \
>>>              "
>>> -- 
>>> 2.49.0
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234724): https://lists.openembedded.org/g/openembedded-core/message/234724
> Mute This Topic: https://lists.openembedded.org/mt/118204632/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


