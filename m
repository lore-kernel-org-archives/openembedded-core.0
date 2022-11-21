Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EB8C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 13:36:07 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.38291.1669037765704642331
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 05:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gyLKt5N7;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id r12so18890444lfp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 05:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1bcEigxV2yT/PiLKRieeN0tsLN6bxzubttAvZys+3so=;
        b=gyLKt5N7rHDd9vlySvne3NKTMOyhcXjMXCPTz9C1euoxSugKcy6gyRpVc3LtOUBT6u
         IwbqvVUAoUgnIuc8+7V1uFAQj3ACdIxMGH2Vh1l98bqf5d5vQrxCLVhIeErsdx7jpz1P
         ftXLKc4v50IuTU3hLnOxXxFuxFhh2jDt9Sg4OBlfhknVvjNm5MZ3StKMM4h+cF1gJGNK
         bRlpF0X447JnnJIVJ78fBHfg6icUfkPIJAnprAh90t60K3kLyfdafzLI1wwtWa5eihpW
         pNBrwxdaKkZRXbvkZdgvM9NdwYwkBDGj7hgQfqq/ppLc+xlZh/lkXeCxoORjLehCMMTl
         kTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bcEigxV2yT/PiLKRieeN0tsLN6bxzubttAvZys+3so=;
        b=0RBFRABWTJHGhX16bun6jBDNzV+W/OOrnWtPTAMsgS5LPYtr96mWakwX7awTi11ua/
         JSefMNTvaJZ2q99HrOTkg7vs4J9EfPaq+TkO5RKVHtPfDtAG4xvh2x1X6rsb7wMe6UoU
         iYPtI4YUDTwFUEDI+ACKg0W5utYUKq0Em5aSwMh5lk1iDWYoy2kJHlrbFLZnUYiEdIoz
         pxhHEi2sEHcnyU0+m45Guk8ZmH4NnOKZXy96UFYe40q1zEXAs+0Rudh8JbxGbkBdxVAX
         xOrddPw2WjqaV5Nw/bWpqKImMbJ9xywfsHie0DBNJZAUEXAd1Ajcfjo0pSLM6Gxz4yVr
         zcig==
X-Gm-Message-State: ANoB5plrm7xoOhgBFlWvsSQDtPkHBBtzG6nGHDe7KdAc0orLZFbfN4Kl
	6disLXYoTmSamfa2GJgwkqvR82/0EP5auqJ7sqU=
X-Google-Smtp-Source: AA0mqf43R/XCTHJvQGx+ddejYTm1ibOmL2mPCyZnxsh5spemFIJovvyTulSX2o5QVp1ELWuvVgnJ6Vy6NFaryEXnTGI=
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr5753640lfs.367.1669037763218; Mon, 21
 Nov 2022 05:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20221121132515.2028-1-cp0613@linux.alibaba.com>
In-Reply-To: <20221121132515.2028-1-cp0613@linux.alibaba.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Nov 2022 14:35:51 +0100
Message-ID: <CANNYZj_ZovLkLzQttXo5EyO8V86dkrQ28__mOAjEWE4qm7uUfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] flac: upgrade 1.4.0 -> 1.4.2
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 13:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173654

Changes in licensing need to be explained. We checksum them for a
reason, and the reason is precisely being able to catch and update the
value of LICENSE, so that license compliance for your product is based
on correct input data.

Most of the time they're harmless, but you need to explicitly check
and state something like this:

License-Update: copyright years
License-Update: formatting
License-Update: additional contributors

or similar. Look at the git log.

Alex

On Mon, 21 Nov 2022 at 14:27, cp0613 <cp0613@linux.alibaba.com> wrote:
>
> From: Chen Pei <cp0613@linux.alibaba.com>
>
> This small version release only has a few changes, but fixes several bugs.
>
> FLAC 1.4.2 released 2022-10-22
> Like the last release, this release only has a few changes. A problem with FLAC playback in GStreamer (and possibly other libFLAC users) was the reason for the short time since the last release.
> Changes:
>         Remove xmms plugin
>         Remove all pure assembler, removing build dependency on nasm
>         Made console output more uniform across different platforms and CPUs
>         Improve ability to tune compile for a certain system (for example with -march=native) when combining with --disable-asm-optimizations: plain C functions can now be better optimized
>         Default CFLAGS are now prepended instead of dropped when user CFLAGS are set
>         -msse2 is no longer added by default (was only applicable to x86)
>         Fix cross-compiling and out-of-tree building when pandoc and doxygen are not available
>         Fix issue with Clang not compiling functions with intrinsics
>         Fix detection of bswap intrinsics
>         Improve search for libssp on MinGW
>         Fix issue when the libFLAC user seeks in a file instead of libFLAC itself
>
> FLAC 1.4.1 released 2022-09-22
> This release fixes the release tarball (which was missing man pages and api documentation in FLAC 1.4.0) and some build problems that were found with FLAC 1.4.0.
> Changes:
>         CMake fixes
>         Add checks that man pages and api docs end up in tarball
>         Enable installation of prebuilt man pages and api docs
>         Fix compiler warnings
>         Fix format specifier
>         Enable building on Universal Windows Platform
>         Fix versioning from git
>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> ---
>  .../flac/{flac_1.4.0.bb => flac_1.4.2.bb}                | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>  rename meta/recipes-multimedia/flac/{flac_1.4.0.bb => flac_1.4.2.bb} (80%)
>
> diff --git a/meta/recipes-multimedia/flac/flac_1.4.0.bb b/meta/recipes-multimedia/flac/flac_1.4.2.bb
> similarity index 80%
> rename from meta/recipes-multimedia/flac/flac_1.4.0.bb
> rename to meta/recipes-multimedia/flac/flac_1.4.2.bb
> index 360396380d..32383927a2 100644
> --- a/meta/recipes-multimedia/flac/flac_1.4.0.bb
> +++ b/meta/recipes-multimedia/flac/flac_1.4.2.bb
> @@ -9,29 +9,25 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
>                      file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://src/flac/main.c;beginline=1;endline=18;md5=893456854ce6bf14a1a7ea77266eebab \
>                      file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
> -                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=73c74192ce89ee6238d15a171e00c971 \
>                      file://COPYING.Xiph;md5=3d6da238b5b57a0965d6730291119f65 \
> -                    file://include/FLAC/all.h;beginline=65;endline=70;md5=64474f2b22e9e77b28d8b8b25c983a48"
> +                    file://include/FLAC/all.h;beginline=65;endline=70;md5=39aaf5e03c7364363884c8b8ddda8eea"
>
>  SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
> -SRC_URI[sha256sum] = "af41c0733c93c237c3e52f64dd87e3b0d9af38259f1c7d11e8cbf583c48c2506"
> +SRC_URI[sha256sum] = "e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5a5f57fcaa83eb5a8e4"
>
>  CVE_PRODUCT = "libflac flac"
>
>  inherit autotools gettext
>
>  EXTRA_OECONF = "--disable-oggtest \
> -                --disable-xmms-plugin \
>                  --without-libiconv-prefix \
>                  ac_cv_prog_NASM="" \
>                  "
>
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
> -    ${@bb.utils.contains_any("TUNE_FEATURES", "core2 corei7", "sse", "", d)} \
>      ogg \
>  "
> -PACKAGECONFIG[sse] = "--enable-sse,--disable-sse"
>  PACKAGECONFIG[altivec] = "--enable-altivec,--disable-altivec"
>  PACKAGECONFIG[vsx] = "--enable-vsx,--disable-vsx"
>  PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
> @@ -41,3 +37,4 @@ PACKAGES += "libflac libflac++"
>  FILES:${PN} = "${bindir}/*"
>  FILES:libflac = "${libdir}/libFLAC.so.*"
>  FILES:libflac++ = "${libdir}/libFLAC++.so.*"
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173652): https://lists.openembedded.org/g/openembedded-core/message/173652
> Mute This Topic: https://lists.openembedded.org/mt/95171486/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

