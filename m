Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E28ACCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 05:01:20 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.8532.1760504459938083635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 22:01:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lcNW41ub;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso998260666b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760504458; x=1761109258; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjJYB69GJK3Obq2bJGH2xicIHp9lzohn4BGBaCK4BRo=;
        b=lcNW41ubU//OnMe2Fa68XRsdH/1C98H6/B6NNd4EXa7Zrdka04n1XVCscMhSyv/uqn
         h/pnf4jYKTDkuwAbC5545HkwBlMimu3Pm9W6PnjLz6BKkzt63zb8kztGpYXGcwKOl9pk
         FAIKhpYK+j+6lu5xP05M1BEx/t3iwQYc2zQPxltwqIv/uuf4u7yoaHCYMD03olDBGXP9
         vSDuIKser5WftPWTLcaoMFQo1ZTJmIvgFARMDejt+y7eass6x/55zcIEdrvkneuhPz7F
         AkzmLm+FNxHiYnf+XLNrc3C3STY16TXAgNWlwgb71mKIDJ6GMU4amF0XU1HB6ZceEzAA
         67JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760504458; x=1761109258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pjJYB69GJK3Obq2bJGH2xicIHp9lzohn4BGBaCK4BRo=;
        b=fqso+5oHKs8ra63xuoRkQKTpw2P3e0Ka6SYQI79eVDYtovgKOzC049SNqKUSn35YGT
         gJnFyYCjhDXLBxo7Vqa181c7LbIMl/IqfJsciXUbvagJaQPejH+3Dsy8lO55M4lPBBpD
         Rs/z1TsyGCm4ZBB8C2bv3Q3hDY2hm1Ewv6KzFz/jeQOLC5fa5bjlTx68rzUN0SWB6jHr
         RtVAwZG9NiuvnOn7BpKPm45vQzGbTe3snXK8QmfD4YctUr6IXz8qy7pDxG8YQNfZOtA3
         TcIbryMdL4QGFwA1HCfanJjM94zpTM9s9bpzaQdbmNalPuFWVuGLzjw59NCw18h58hg+
         7BOA==
X-Forwarded-Encrypted: i=1; AJvYcCXAK7P1y1dyWkqZmQWhkGMfqwwMcBBth7xrInmk/wMdI/bd3EOCvVr6ZIndh7Wr4BD205XlxKbi6rm3AFuPmRN8iw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzChIpa51dWU7P+bUafM7qtpHTuYUytGzRE7/JEgxtC3mp3HEVq
	n+Xjwt9VpZ1oQeKhsAzQt471ioLvkk1kB9GD+NRYVZBTkOL9ylghhnII
X-Gm-Gg: ASbGncveIQ3vADMI9cUyWPJudyL1qfkBVd5vamuGSajeJ99Wh6F+H2XbHP/36C8E2LD
	2cPJ2xZMolFIKxAt2c5HxKMvKYKnDvj5i9P66dkYDa2Q8Gv/pgOpestTHwc9ivVwyYwxPeMX2vP
	enOLdHEr1GnydJ8AI3CnOZ9j4vxw7SBOznAIR7ovEpz25+9vP0AblpfwsilAxegbScCGy02iimD
	kRiZmi827gWAPhney+S7igBO45rKxQGyr13VgJJrbjt5LBEUJyifTY2seYLZ56TRJPnyg0dhk2z
	zgkXwtqZxjAy2g2/zR7sksXDIR3V/NMRJ0tH96SZZe5zjn0uvkZgkl414jpJGXW6T8kCLdcv3Te
	t2pf3To48370cMLTux10NgqGzgU+AKXytG9HSXMxld/JXxG6KOV50t7z+r/AivGcQIrpry6OStp
	o=
X-Google-Smtp-Source: AGHT+IG+bpEUj3FMP5A0zTLF9NWJOT/30phODgj5yGYWAh3zqYGqsxNd6bNZKYKR1c2zPIk6ubCHdw==
X-Received: by 2002:a17:907:961b:b0:b40:e687:c2c with SMTP id a640c23a62f3a-b50ac2d5903mr2806384566b.37.1760504457821;
        Tue, 14 Oct 2025 22:00:57 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af86bsm135101366b.61.2025.10.14.22.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 22:00:57 -0700 (PDT)
Message-ID: <06019d2f-b77b-46cc-b0e9-4afb2a9a8232@gmail.com>
Date: Wed, 15 Oct 2025 07:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] x264: switch to PACKAGECONFIG
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20251012150805.536603-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20251012150805.536603-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 05:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224877

This causes a dependency loop between x264 and ffmpeg, if
PACKAGECONFIG = "x264" is used for ffmpeg.

Now, that x264 depends on ffmpeg by default, should the
PACKAGECONFIG[x264] entry from ffmpeg be removed?

How does this change influence h.264 support if I remove
PACKAGECONFIG = "x264" from my ffmpeg bbappend?
Will that be always a hw-accelerated implementation now or just disables it?

2025. 10. 12. 17:08 keltezéssel, Dmitry Baryshkov via lists.openembedded.org írta:
> Switch to PACKAGECONFIG in order to make x264 options configurable.
> Enable FFmpeg (by default) and OpenCL (if enabled by the distro). Pick
> up the patch to fix building with the latest FFmpeg.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   ...b801191522961102d4bea292cdb61068d0dd.patch | 39 +++++++++++++++++++
>   meta/recipes-multimedia/x264/x264_git.bb      | 11 ++++--
>   2 files changed, 47 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch
>
> diff --git a/meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch b/meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch
> new file mode 100644
> index 000000000000..fb0f313cdb60
> --- /dev/null
> +++ b/meta/recipes-multimedia/x264/x264/32c3b801191522961102d4bea292cdb61068d0dd.patch
> @@ -0,0 +1,39 @@
> +From 32c3b801191522961102d4bea292cdb61068d0dd Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Martin=20Storsj=C3=B6?= <martin@martin.st>
> +Date: Fri, 4 Apr 2025 16:59:34 +0300
> +Subject: [PATCH] lavf: Update the code to work with the latest libavutil API
> +
> +Upstream-Status: Backport [https://code.videolan.org/videolan/x264/-/commit/32c3b801191522961102d4bea292cdb61068d0dd]
> +---
> + input/lavf.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/input/lavf.c b/input/lavf.c
> +index 90f4cec5..e2489963 100644
> +--- a/input/lavf.c
> ++++ b/input/lavf.c
> +@@ -33,6 +33,7 @@
> + #include <libavutil/error.h>
> + #include <libavutil/mem.h>
> + #include <libavutil/pixdesc.h>
> ++#include <libavutil/version.h>
> +
> + #define FAIL_IF_ERROR( cond, ... ) FAIL_IF_ERR( cond, "lavf", __VA_ARGS__ )
> +
> +@@ -141,8 +142,13 @@ static int read_frame_internal( cli_pic_t *p_pic, lavf_hnd_t *h, int i_frame, vi
> +     if( info )
> +     {
> +         info->fullrange  = is_fullrange;
> ++#if LIBAVUTIL_VERSION_MAJOR < 60
> +         info->interlaced = h->frame->interlaced_frame;
> +         info->tff        = h->frame->top_field_first;
> ++#else
> ++        info->interlaced = !!(h->frame->flags & AV_FRAME_FLAG_INTERLACED);
> ++        info->tff        = !!(h->frame->flags & AV_FRAME_FLAG_TOP_FIELD_FIRST);
> ++#endif
> +     }
> +
> +     if( h->vfr_input )
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
> index 3cc339259381..eb72ba006a04 100644
> --- a/meta/recipes-multimedia/x264/x264_git.bb
> +++ b/meta/recipes-multimedia/x264/x264_git.bb
> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>   DEPENDS = "nasm-native"
>   
>   SRC_URI = "git://code.videolan.org/videolan/x264.git;branch=stable;protocol=https \
> +    file://32c3b801191522961102d4bea292cdb61068d0dd.patch \
>              "
>   UPSTREAM_CHECK_COMMITS = "1"
>   
> @@ -25,6 +26,13 @@ X264_DISABLE_ASM:armv5 = "--disable-asm"
>   X264_DISABLE_ASM:powerpc = "${@bb.utils.contains("TUNE_FEATURES", "spe", "--disable-asm", "", d)}"
>   X264_DISABLE_ASM:mipsarch = "${@bb.utils.contains("TUNE_FEATURES", "r6", "", "--disable-asm", d)}"
>   
> +PACKAGECONFIG ?= " \
> +    ffmpeg \
> +    ${@bb.utils.filter("DISTRO_FEATURES", "opencl", d)} \
> +"
> +PACKAGECONFIG[ffmpeg] = "--enable-lavf --enable-swscale,--disable-lavf --disable-swscale,ffmpeg"
> +PACKAGECONFIG[opencl] = "--enable-opencl,--disable-opencl,"
> +
>   EXTRA_OECONF = '--prefix=${prefix} \
>                   --host=${HOST_SYS} \
>                   --libdir=${libdir} \
> @@ -32,9 +40,6 @@ EXTRA_OECONF = '--prefix=${prefix} \
>                   --sysroot=${STAGING_DIR_TARGET} \
>                   --enable-shared \
>                   --enable-static \
> -                --disable-lavf \
> -                --disable-swscale \
> -                --disable-opencl \
>                   --enable-pic \
>                   ${X264_DISABLE_ASM} \
>                   --extra-cflags="${TUNE_CCARGS}" \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224738): https://lists.openembedded.org/g/openembedded-core/message/224738
> Mute This Topic: https://lists.openembedded.org/mt/115719250/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


