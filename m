Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.1825.1604429014846350387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 10:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=COB7T5hb;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id p4so1656975plr.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 10:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=RaLzc10qIs/R1r5/1tSicamIHqmqEksLrjgVrFKgaQI=;
        b=COB7T5hbBSLYwesbsNALS3OupCyA7FZTzvQuWxWLJP8/OsUJjoz1d1+Ggz1jC5jJb3
         DsYV0SmcdOBcRPAoOlS+iGW2WTaSbBgR+g3RHT5WPspLj+p96gtMnzlBdaEtC7DF6IMH
         wbHe7SYvugGiVe9v5YVcWOMKRRxPLRuahuXHMMbIc/AJjeFOkGtXWN/oNOo4LUmYW52S
         Hx3dz5XHqjUtoiBJN2vJGsR6iiZbQC5OK+hgvYHsR1Wy990HxKyyAShQSTAghIm1zKby
         9Z68V+qdEc3QdKP+z/S4uoXWzI0KKufprtCu4AQBQA31yvSPz3xcTTUaqBC6oci74HeJ
         WboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RaLzc10qIs/R1r5/1tSicamIHqmqEksLrjgVrFKgaQI=;
        b=HcwY64FKz1f3wCIOOkstS7tTyczt+a//ivYac56SmAVZku5mlSZkYSDUuGQpKlZi0w
         CjC/YDMJe0jiHFzeYrCpx7XisKPcRU7jAA/oHBz1XguUfly9rvakvgl06ocqv04Zokf2
         akKysS/5eg+LGbAFFV3audxYis8n9mBUcr9eSPe35OB4rLbxdxnXUMSTCKimk+DY4Dle
         DtE/3zIcYH0sgOiWieaQp5NVw5cA+BOF7/rUvMzye9YHWdJ4Yo8Jzz18J58aiwUbd1wQ
         r0vDM+ai3zV7pVKCLk1tCzfQ9MNWwFJx/3/nscXZRvqPSJhjAOplz4IXBf6mDVvxSmCT
         VT4Q==
X-Gm-Message-State: AOAM532HoBKyYZHaGK7bUvVSBtfjUbJ0FHesL1yRA+9HxqM/fSie8UdH
	idIMwXSrXPKKR+tp3KKUEi3iaxkte6ydTw==
X-Google-Smtp-Source: ABdhPJz6xNn6S/+1zicB9ZS4jcj4bj2wYt70swjga7g2Kih6xeqhgHuCd34BplfqSup1OsmdwTuvQQ==
X-Received: by 2002:a17:902:7882:b029:d6:38a2:8dee with SMTP id q2-20020a1709027882b02900d638a28deemr25615597pll.58.1604429013860;
        Tue, 03 Nov 2020 10:43:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::4b05? ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id s9sm4122206pjz.24.2020.11.03.10.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 10:43:33 -0800 (PST)
Subject: Re: [OE-core] [PATCH 70/80] rt-tests/hwlatdetect: upgrade 1.8 -> 1.9
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
 <20201102164907.27572-70-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <f878d465-f694-1bf9-4db7-1b2476a8199e@gmail.com>
Date: Tue, 3 Nov 2020 10:43:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102164907.27572-70-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

rt-tests now have added code which only works for x86/x86_64/ppc64 in 
src/oslat/oslat.c, so either that will need fixing for other arches or 
limit this recipe to above said arches. see a failure here e.g.

https://errors.yoctoproject.org/Errors/Details/511500/

On 11/2/20 8:48 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   ...001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 7 ++++---
>   .../rt-tests/{hwlatdetect_1.8.bb => hwlatdetect_1.9.bb}    | 0
>   meta/recipes-rt/rt-tests/rt-tests.inc                      | 2 +-
>   .../rt-tests/{rt-tests_1.8.bb => rt-tests_1.9.bb}          | 0
>   4 files changed, 5 insertions(+), 4 deletions(-)
>   rename meta/recipes-rt/rt-tests/{hwlatdetect_1.8.bb => hwlatdetect_1.9.bb} (100%)
>   rename meta/recipes-rt/rt-tests/{rt-tests_1.8.bb => rt-tests_1.9.bb} (100%)
> 
> diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> index c18928ed02..8fd94b176c 100644
> --- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> +++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
> @@ -1,4 +1,4 @@
> -From caaa142826504ad0375f9d21c558f10f31305cdb Mon Sep 17 00:00:00 2001
> +From f89d6d6d23e0dacfd0008f686a457d536edc406a Mon Sep 17 00:00:00 2001
>   From: Randy Witt <randy.e.witt@intel.com>
>   Date: Fri, 16 Oct 2020 16:54:30 -0700
>   Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
> @@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
>   Signed-off-by: Randy Witt <randy.e.witt@intel.com>
>   
>   Upstream-Status: Inappropriate [other]
> +
>   ---
>    Makefile | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/Makefile b/Makefile
> -index 05fc5ed..7a289c8 100644
> +index c3ebbd7..2176835 100644
>   --- a/Makefile
>   +++ b/Makefile
>   @@ -1,6 +1,6 @@
> - VERSION = 1.8
> + VERSION = 1.9
>   -CC = $(CROSS_COMPILE)gcc
>   -AR = $(CROSS_COMPILE)ar
>   +CC ?= $(CROSS_COMPILE)gcc
> diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb b/meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
> similarity index 100%
> rename from meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
> rename to meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
> index 5d28c7e63e..2dd890cf95 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,5 +1,5 @@
>   # Version 1.8
> -SRCREV = "9f78b91f057e63b0c241012ce36b57168133eefb"
> +SRCREV = "21c1df7d2ee199ac619cbb1806a38d15e7e95c09"
>   PE = "1"
>   
>   SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
> diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.8.bb b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
> similarity index 100%
> rename from meta/recipes-rt/rt-tests/rt-tests_1.8.bb
> rename to meta/recipes-rt/rt-tests/rt-tests_1.9.bb
> 
> 
> 
> 
> 
