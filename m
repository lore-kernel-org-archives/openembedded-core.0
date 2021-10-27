Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C851C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 06:25:39 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.8088.1635315937714491784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 23:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CVwNRVXN;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id x27so3926126lfu.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 23:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=Hf1KvKUBP7AS3uEBM/N6o3kD/Op/2m9yG6ozQEgLHYc=;
        b=CVwNRVXNRgw4yOZkxyVcnXbw1GK8bi85WzbtqVza+CZLpHWT+SISkXYypoWUln3RM/
         LLpeEzYf3CK6TwKCHBKxF9fDgYZh+P2uS3u4AH958jKeCx87bo1VMiMEzd1lpRMXUfKc
         0BBhnkoupbddsmeGcW5K6iV02ZW8CQ6WJApAOGjCcULMc75Q84BBF+csdV0K7qV24x7W
         B6dBRbd6Jd4rYywtsK4aXQ1ypP3wID+XlOkVvFbLMWDL2lLTrX2tOdbd212JkoOuRdzf
         EJZnEKDRZNBT69TTNCjM7kyJNSZSOi4/DNgQEoprOpGNRwiFvVnAU+Bx3e+KdOcepLb9
         1b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Hf1KvKUBP7AS3uEBM/N6o3kD/Op/2m9yG6ozQEgLHYc=;
        b=YlVzVckgoh+HwtX4gzG6jA7uhzMGpVRjNIYwHOp7GrdG5XGqjXIwsg5YkTvxW/DsNv
         kT9nfTPqYmR2IWCMAczBmtCdsOSwl8y4OYcc3wFaep0UJ4/rWWETnLS1l0nPDbret8R2
         n19Gjd2CYslubFv1ae6wmmJ8l2kkmEGS6q3kTsBZ3oTW+wrG3YqstPlOuDOacaK0+Vhm
         g+UWvARBCHIIYSP6EkYYtoRO+TKjN4gKLta56mpQnkauoeHaSMa8kwW3x585MFcZ40yy
         mcZjuZNgUDo93vpRSbdwP7LZIASJnomQVaY7rYdamJ/lKS9v5++UYNPaEHhLBZQuVmHz
         16Jg==
X-Gm-Message-State: AOAM532DReBkE3GCiIA7HDvPLuXosAU55EpXLtI6tPNlXH9GSq3Iggue
	GbgwJUagaMJmXw8DK36qooCGBLOaNGU=
X-Google-Smtp-Source: 
 ABdhPJzxLMkpcGpAslFAns3A754OKsUVNSRNYdRHAq2jin1oecL8Nt0ApNsRNiamKv3GTTXqOCugpQ==
X-Received: by 2002:a05:6512:3d0e:: with SMTP id
 d14mr915921lfv.20.1635315935575;
        Tue, 26 Oct 2021 23:25:35 -0700 (PDT)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 x24sm88816lji.138.2021.10.26.23.25.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 23:25:34 -0700 (PDT)
Message-ID: <b3a3dc01-64e1-6b20-0fe6-bb0b324c1fc4@gmail.com>
Date: Wed, 27 Oct 2021 08:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [OE-core] [PATCH 1/4] gcc: Merge three related patches together
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 06:25:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157474

On 10/26/21 13:11, Richard Purdie wrote:
> The SYSTEMLIBS_DIR change was spread over three patches, merge these
> together since there is no value in having them separate.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/gcc/gcc-11.2.inc        |  2 -
>   ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 52 ++++++++++---------
>   ...IR-replacement-instead-of-hardcoding.patch | 26 ----------
>   ...22-aarch64-Add-support-for-musl-ldso.patch | 25 ---------
>   4 files changed, 28 insertions(+), 77 deletions(-)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0022-aarch64-Add-support-for-musl-ldso.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index 9fd30f52a88..6fa344e9612 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -50,8 +50,6 @@ SRC_URI = "\
>              file://0018-export-CPP.patch \
>              file://0019-Ensure-target-gcc-headers-can-be-included.patch \
>              file://0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch \
> -           file://0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
> -           file://0022-aarch64-Add-support-for-musl-ldso.patch \
>              file://0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch \
>              file://0024-handle-sysroot-support-for-nativesdk-gcc.patch \
>              file://0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index 4726267a80f..0884730786c 100644
> --- a/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> @@ -30,8 +30,7 @@ Upstream-Status: Inappropriate [OE configuration]
>    gcc/config/sparc/linux64.h   |  4 ++--
>    12 files changed, 29 insertions(+), 34 deletions(-)
>   
> -diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
> -index c1dae8ca2cf..3ce2b76c1a4 100644
> +unchanged:
>   --- a/gcc/config/alpha/linux-elf.h
>   +++ b/gcc/config/alpha/linux-elf.h
>   @@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> @@ -45,8 +44,7 @@ index c1dae8ca2cf..3ce2b76c1a4 100644
>    #if DEFAULT_LIBC == LIBC_UCLIBC
>    #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>    #elif DEFAULT_LIBC == LIBC_GLIBC
> -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> -index 85d0136e76e..6bd95855827 100644
> +unchanged:

Doesn't the above change how the patch is applied ?

