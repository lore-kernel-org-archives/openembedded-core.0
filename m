Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web10.6968.1589177658675364349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 23:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oKRNSyG9;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id r17so3385657lff.9
        for <openembedded-core@lists.openembedded.org>; Sun, 10 May 2020 23:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=0qOE9B5ENhuP5VHSVCJMG3t7f2hEAoN5H0h9iKVKxvA=;
        b=oKRNSyG9tcJLO74Yinf1JCskzqYAaxxsq84b4mAUAsufNOFZmVJGReCHTZBZIC9gJK
         zyG//IhO92xQsUWWmP9hxEiu+/ogYBikm4cvLFGZh/XkSjHgTpArpEZMsnPsNLgN9T+R
         w2ctBazPDhkBKZnqnoUmDogs93NNKSvLVKxPYSm9wHTOhY/9P18UF64Q+u2jDp7ybKM1
         ncEOn0Tsr/1+E8nRb28nfzb6EQIfvRsUXfuMm39tVKljsdU+cEaJGBEiWpMl6Ucf6nwE
         2CoeNVNtAiDncmpGufLJCOUJt0s/5nYoChEeL9pkuq5ZdNvGoMDL4FPHaXMgyWYD1egq
         xaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0qOE9B5ENhuP5VHSVCJMG3t7f2hEAoN5H0h9iKVKxvA=;
        b=Wcywg6gm/rDF2x3jKGuf6pQxuGvp73SAprqYVVHdb6yI0p8JxZsMKZM6pUx3fwdSiT
         oNuVXyWWwVLQJRB7qFMM3SmdvR6g0IQXBJO+gl1RL1k7ddUSjyCC3tpNiEza2g5NBzCB
         uuFWcRUsikti9HeXBPjD9VJzbnkyIimx8BCZWQYJxqEJHNxnfVv6IZN9HNowU29pzege
         ivmxjpIsWrWCTKye9XaXZkQbsPmrif4SmzbdREq6py1sg2g8RibtRL9thTXNgqGlTrAX
         kg6Yb0FG1LYJfrpKuyOUYWfI9aaSpIHFMa/sD2XTPPhek3i1N8EN9/gGSSWNP9ax2RpR
         vEpg==
X-Gm-Message-State: AOAM532PEq0NPMD3YUm+e03L+H+RXW86aWNI9uh/+QtD7fqm+CC+Lhnh
	zTE6af3USzJ0vPLuKQ0IpZLKlJZ5kyM=
X-Google-Smtp-Source: ABdhPJwsoFjyNHVPJQ759jIIh8qLcZf1llguuF/dB7dfyMxDZgqiYRFv2rCqw5tRAXPy6gAqOerA4g==
X-Received: by 2002:ac2:5a11:: with SMTP id q17mr9604192lfn.44.1589177656277;
        Sun, 10 May 2020 23:14:16 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id w15sm8828928ljd.35.2020.05.10.23.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2020 23:14:15 -0700 (PDT)
Subject: Re: [OE-core] [PATCH V2 1/2] gcc10: Update to GCC 10.1 Release
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200510195050.3470835-1-raj.khem@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <5703cd73-8de1-68ed-a165-164f3a7fc734@gmail.com>
Date: Mon, 11 May 2020 08:14:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200510195050.3470835-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/10/20 9:50 PM, Khem Raj wrote:
> * Package new gomp header acc_prof.h
> * Package lto-dump which is a new tool in gcc10
> * All Changes are here [1]
> * Porting apps to gcc 10 help is here [2]
> 
> [1] https://gcc.gnu.org/gcc-10/changes.html
> [2] https://gcc.gnu.org/gcc-10/porting_to.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Correct SRC_URI checksums
> 
>   meta/conf/distro/include/maintainers.inc      |   2 +-
>   meta/conf/distro/include/tcmode-default.inc   |   2 +-
>   .../gcc/{gcc-9.3.inc => gcc-10.1.inc}         |  51 ++++----
>   ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  15 +--
>   .../0002-gcc-poison-system-directories.patch  |  47 ++++----
>   ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  11 +-
>   .../0004-64-bit-multilib-hack.patch           |  15 +--
>   .../0005-optional-libstdc.patch               |  29 ++---
>   .../0006-COLLECT_GCC_OPTIONS.patch            |  11 +-
>   ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  20 ++--
>   .../0008-fortran-cross-compile-hack.patch     |  15 +--
>   .../0009-cpp-honor-sysroot.patch              |  13 +-
>   .../0010-MIPS64-Default-to-N64-ABI.patch      |  11 +-
>   ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  33 +++---
>   ...gcc-Fix-argument-list-too-long-error.patch |  11 +-
>   .../0013-Disable-sdt.patch                    |  23 ++--
>   .../{gcc-9.3 => gcc-10.1}/0014-libtool.patch  |   9 +-
>   ...s-fix-v4bx-to-linker-to-support-EABI.patch |  11 +-
>   ...-config-files-from-B-instead-of-usin.patch |  25 ++--
>   ...ir-from-.la-which-usually-points-to-.patch |  11 +-
>   .../0018-export-CPP.patch                     |   9 +-
>   ...e-target-gcc-headers-can-be-included.patch |  13 +-
>   ...-directory-during-relink-if-inst_pr.patch} |  11 +-
>   ...R-replacement-instead-of-hardcoding.patch} |   9 +-
>   ...2-aarch64-Add-support-for-musl-ldso.patch} |   9 +-
>   ...fix-libcc1-s-install-path-and-rpath.patch} |   9 +-
>   ...e-sysroot-support-for-nativesdk-gcc.patch} | 112 +++++++++---------
>   ...root-gcc-version-specific-dirs-with.patch} |  13 +-
>   ...us-_FOR_BUILD-and-related-variables.patch} |  27 ++---
>   ...27-nios2-Define-MUSL_DYNAMIC_LINKER.patch} |   9 +-
>   ...-to-link-commandline-for-musl-targe.patch} |  15 +--
>   ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   9 +-
>   .../0030-sync-gcc-stddef.h-with-musl.patch}   |   9 +-
>   ...fault-in-precompiled-header-generat.patch} |  11 +-
>   .../0032-Fix-for-testsuite-failure.patch}     |   9 +-
>   ...e-introduce-spe-commandline-options.patch} |  11 +-
>   ...s-for-__cpu_indicator_init-instead-.patch} |  29 ++---
>   ...-Do-not-use-__LINE__-for-maintainin.patch} |  55 ++++-----
>   ...ild-with-disable-dependency-tracking.patch |  54 ---------
>   .../gcc/gcc-9.3/0030-ldbl128-config.patch     |  79 ------------
>   ...heck-zero-value-in-simple_object_elf.patch |  48 --------
>   ...ands-Don-t-match-user-defined-regs-o.patch | 100 ----------------
>   ...dian_9.3.bb => gcc-cross-canadian_10.1.bb} |   0
>   .../{gcc-cross_9.3.bb => gcc-cross_10.1.bb}   |   0
>   ...c-crosssdk_9.3.bb => gcc-crosssdk_10.1.bb} |   0
>   meta/recipes-devtools/gcc/gcc-runtime.inc     |   1 +
>   ...gcc-runtime_9.3.bb => gcc-runtime_10.1.bb} |   0
>   ...nitizers_9.3.bb => gcc-sanitizers_10.1.bb} |   0
>   .../{gcc-source_9.3.bb => gcc-source_10.1.bb} |   0
>   meta/recipes-devtools/gcc/gcc-target.inc      |   1 +
>   .../gcc/{gcc_9.3.bb => gcc_10.1.bb}           |   0
>   ...-initial_9.3.bb => libgcc-initial_10.1.bb} |   0
>   .../gcc/{libgcc_9.3.bb => libgcc_10.1.bb}     |   0
>   ...libgfortran_9.3.bb => libgfortran_10.1.bb} |   0
>   meta/recipes-support/icu/icu/filter.json      |   6 +
>   55 files changed, 322 insertions(+), 701 deletions(-)

The changes in icu/ seem unrelated to the gcc update ?
