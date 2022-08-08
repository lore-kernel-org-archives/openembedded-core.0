Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F32C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 17:10:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.1145.1659978618112993083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N3dPgDNN;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id 17so9091131plj.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=yNjv2QMg+Ut7UHkPbfeY7EB+jHm7Pxw8xgV09WO+vAs=;
        b=N3dPgDNNuHyo2+soSb8ktGWm9U3BKjK+1tTzPt1bW6iKsDk18AjooLZz0gI+hAqRrW
         s14xRXjdeuvR+fLLuOupk+A5/Ey5UE8f20cHto82toYqfrb4p9GIcTEesxDJEW+lee22
         Ltg1biDfWijxkfO/aQ7eSRRXJBq7nRaagRMUf9r1o92PmuF+pM8IrSOoymcsePtPuMGu
         K05+uSkhBMGppA8djPTNvBa0sOi6pWx1SQYTYCd2E1bZaCEAaBgjcy1yVhfbOENuP8V7
         GPOKWVX5yCEOR4t0LDvAFv++tXAJEr1emt0Syyt1BqRAzBsY4QW+zKLQCnkQU1gJeVp5
         MIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=yNjv2QMg+Ut7UHkPbfeY7EB+jHm7Pxw8xgV09WO+vAs=;
        b=sB/7xZ5cSnJDbJgzKLBnQm1xcr9PCybCcnGpaRH2G45rlHMlzaAnBQ0jJmjvCsuw/0
         QMzlrrnNMxhHVdMTnexRfZ8kr7sNWEy7v3kJ0JpH63gx3QrwmRbLWsHiu8lSbB0IMQvS
         EKGk6VRTHSk4fi2zis7ZTxz8o5lWbsGDRqz8jVcB3Nx1eAUOfolJkNz1m5pEDVNIg+/p
         MXEKmNtka7kMMXmQTN1Wyj+qeubRPKwKF7RBix103US7wJvtjFCc4zydwd1RTTPmndAQ
         HxQpVn1HU2A6TMIOxeq0kvPD0mpE/1SaLlSh5fLCmkJqV/Hor8yg8iHwh7WQcK9YCzTX
         sTIA==
X-Gm-Message-State: ACgBeo1KmgBW7EeELIIEsxYGMR4v9XY0A0PEzFa0DCaBm3Jkju55bQhZ
	eB/0aoTYaSiwqnqPpPiOEm8=
X-Google-Smtp-Source: 
 AA6agR4Eyj9Q46deC17fOpfx3ns7l3bfZBOLcWGcYO69eZdPNpdCOGxfe+Fd6eZSSSTL9fTIs3qmiQ==
X-Received: by 2002:a17:90a:a2a:b0:1f3:1479:e869 with SMTP id
 o39-20020a17090a0a2a00b001f31479e869mr21425558pjo.41.1659978617437;
        Mon, 08 Aug 2022 10:10:17 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f9ab:8bd3:9e60:d783?
 ([2601:646:9200:a0f0:f9ab:8bd3:9e60:d783])
        by smtp.gmail.com with ESMTPSA id
 o24-20020aa79798000000b0052e82c7d91bsm8849635pfp.135.2022.08.08.10.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 10:10:16 -0700 (PDT)
Message-ID: <b1733f84-c3f5-c5ea-86aa-f349ceb4427e@gmail.com>
Date: Mon, 8 Aug 2022 10:10:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.1
Subject: Re: [OE-core] [PATCH v2 14/44] libwpe: upgrade 1.12.0 -> 1.12.2
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-14-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220808064237.3975347-14-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 17:10:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169103



On 8/7/22 11:42 PM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   ...ure-due-to-libc-using-libc-functions.patch | 42 +++++++++++++++++++
>   .../{libwpe_1.12.0.bb => libwpe_1.12.2.bb}    |  6 ++-
>   2 files changed, 46 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
>   rename meta/recipes-sato/webkit/{libwpe_1.12.0.bb => libwpe_1.12.2.bb} (72%)
> 
> diff --git a/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch b/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
> new file mode 100644
> index 0000000000..6d27b4835d
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
> @@ -0,0 +1,42 @@
> +From ccf8a58c3536ca0e62748e0ea477514e14d821bc Mon Sep 17 00:00:00 2001
> +From: Adrian Perez de Castro <aperez@igalia.com>
> +Date: Thu, 4 Aug 2022 12:19:05 +0300
> +Subject: [PATCH] Fix build failure due to libc++ using libc functions
> +
> +Include the "alloc-private.h" header after the C++ standard library
> +headers. This sidesteps build failures caused by implementations of
> +std::map and std::string which use libc memory allocation functions
> +in expanded templates after they have been marked with the "poison"
> +pragma.
> +
> +Fixes #115
> +
> +Upstream-Status: Backport

Link to PR or upstream commit would be handy here.

> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + src/pasteboard-generic.cpp | 9 ++++++---
> + 1 file changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/pasteboard-generic.cpp b/src/pasteboard-generic.cpp
> +index 86fe4ee..a357027 100644
> +--- a/src/pasteboard-generic.cpp
> ++++ b/src/pasteboard-generic.cpp
> +@@ -26,12 +26,15 @@
> +
> + #include "pasteboard-private.h"
> +
> +-#include "alloc-private.h"
> +-#include <cstdlib>
> +-#include <cstring>
> + #include <map>
> + #include <string>
> +
> ++// We need to include this header last, in order to avoid template expansions
> ++// from the C++ standard library happening after it forbids usage of the libc
> ++// memory functions.
> ++#include "alloc-private.h"
> ++#include <cstring>
> ++
> + namespace Generic {
> + using Pasteboard = std::map<std::string, std::string>;
> + }
> diff --git a/meta/recipes-sato/webkit/libwpe_1.12.0.bb b/meta/recipes-sato/webkit/libwpe_1.12.2.bb
> similarity index 72%
> rename from meta/recipes-sato/webkit/libwpe_1.12.0.bb
> rename to meta/recipes-sato/webkit/libwpe_1.12.2.bb
> index ac4ee3eb23..e23a9ac32d 100644
> --- a/meta/recipes-sato/webkit/libwpe_1.12.0.bb
> +++ b/meta/recipes-sato/webkit/libwpe_1.12.2.bb
> @@ -10,8 +10,10 @@ inherit cmake features_check pkgconfig
>   
>   REQUIRED_DISTRO_FEATURES = "opengl"
>   
> -SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "e8eeca228a6b4c36294cfb63f7d3ba9ada47a430904a5a973b3c99c96a44c18c"
> +SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz \
> +           file://0001-Fix-build-failure-due-to-libc-using-libc-functions.patch \
> +           "
> +SRC_URI[sha256sum] = "4ac4fd0a8b562b721bffd0f46ae9f06c2b5a3114407581978be875a9d651642a"
>   
>   # This is a tweak of upstream-version-is-even needed because
>   # ipstream directory contains tarballs for other components as well.
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169039): https://lists.openembedded.org/g/openembedded-core/message/169039
> Mute This Topic: https://lists.openembedded.org/mt/92887010/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

