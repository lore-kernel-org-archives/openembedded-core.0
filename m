Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.741.1589262347446717045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 22:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eFyiWUtq;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id v5so5387956lfp.13
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 22:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=XPhaSBXJOqLyXveZHOAA2xnGLpyJ/2QPCuwbA89/rtU=;
        b=eFyiWUtq8r/XllwtwKBBO4zG3A0vhthFUomdQW/77ogO0Ur4Resz+1RgpuTDagNg/1
         VSmjB2iL73/DjxnqWHlyHJSSbW2OuUz1mJJeqmiL9cKrqWKKjKxQN4i7bOE3eC2+ZlC6
         ZDZ2z35DWLc2ASGeOnTQz2GV7BqJvyF85jbzGtrWIDXLVo4SMF2aR5ZqixAsg+UmSMeJ
         6CGyldi2DOjCcjFYBvjAONkjse85fMsFsnQq3/njZQCoP1TVvYOorg6LxQ0F7p6us72s
         n/Ag+5zRLLYiFhriJhZevkyP4shNGY6Bx6gcbEST7BshuMZJS/hNEhlWP28Lww1VaQ7W
         ZXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XPhaSBXJOqLyXveZHOAA2xnGLpyJ/2QPCuwbA89/rtU=;
        b=DNzuAs8Uz3G8KprbX/Gvbzm2u6GuY2P/Nvn9cl/2CDzrf3R9wqUbCh/tJsQ2Wd6W0E
         AcQz9ZW72vWUIaeacR42pfiaYnlPWEsLL7WLA1txiXuRxjD4AVFbsW/kRwyCz7iLqa7T
         l0USjCeuaiSl+WV6gWMQp4qyItJKDLe8AHIrxucMwb4iqgy/n2KTUHOQEdZ9ag9CCdlq
         ZsxhIY1ZcIabGUcvOr+PNUFMDTOx/VOtXx7bPB5ZnK9Fu5iQD2I1gGgbm8O0Yr44tIJ+
         Az3S2RBWc+Qmn3poFfHjG2N0trWOYD++rJga8ND6S0mMvRqKJDmNp/6jaddcolo6vN/X
         1Mnw==
X-Gm-Message-State: AOAM531CS4rw2BWWuA/C27wX51p7JVVwoN6JfO495Lm2p9fcTuBH6+hQ
	be5UMWpYAkvtkLkudmauu90k5MTD2sg=
X-Google-Smtp-Source: ABdhPJzGSf45Q2Km42qq1Uz6G4v5Fw8XOZbbx66KMvSItK9bmuhuBxUxBPRVv2R9eeMTqkmewsGG3g==
X-Received: by 2002:ac2:5384:: with SMTP id g4mr13397544lfh.1.1589262345227;
        Mon, 11 May 2020 22:45:45 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id l5sm12970890lfk.16.2020.05.11.22.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 22:45:44 -0700 (PDT)
Subject: Re: [OE-core] [PATCH V3 1/3] gcc10: Update to GCC 10.1 Release
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20200511182812.441561-1-raj.khem@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <008159f3-8bea-deb2-5228-3984bae2ff36@gmail.com>
Date: Tue, 12 May 2020 07:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511182812.441561-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/11/20 8:28 PM, Khem Raj wrote:
> * Package new gomp header acc_prof.h
> * Package lto-dump which is a new tool in gcc10
> * All Changes are here [1]
> * Porting apps to gcc 10 help is here [2]
> * Backport a patch to fix CET errors on cross builds
> * Add patch to fix mingw libstdc++
> 
> [1] https://gcc.gnu.org/gcc-10/changes.html
> [2] https://gcc.gnu.org/gcc-10/porting_to.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Correct SRC_URI checksums
> v3: Drop icu change
>      Backport a patch for CET cross compile
> 
>   meta/conf/distro/include/maintainers.inc      |   2 +-
>   meta/conf/distro/include/tcmode-default.inc   |   2 +-
>   .../gcc/{gcc-9.3.inc => gcc-10.1.inc}         |  53 +++----
>   ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch |  15 +-
>   .../0002-gcc-poison-system-directories.patch  |  47 +++---
>   ...-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  11 +-
>   .../0004-64-bit-multilib-hack.patch           |  15 +-
>   .../0005-optional-libstdc.patch               |  29 ++--
>   .../0006-COLLECT_GCC_OPTIONS.patch            |  11 +-
>   ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  20 +--
>   .../0008-fortran-cross-compile-hack.patch     |  15 +-
>   .../0009-cpp-honor-sysroot.patch              |  13 +-
>   .../0010-MIPS64-Default-to-N64-ABI.patch      |  11 +-
>   ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  33 ++--
>   ...gcc-Fix-argument-list-too-long-error.patch |  11 +-
>   .../0013-Disable-sdt.patch                    |  23 ++-
>   .../{gcc-9.3 => gcc-10.1}/0014-libtool.patch  |   9 +-
>   ...s-fix-v4bx-to-linker-to-support-EABI.patch |  11 +-
>   ...-config-files-from-B-instead-of-usin.patch |  25 ++-
>   ...ir-from-.la-which-usually-points-to-.patch |  11 +-
>   .../0018-export-CPP.patch                     |   9 +-
>   ...e-target-gcc-headers-can-be-included.patch |  13 +-
>   ...-directory-during-relink-if-inst_pr.patch} |  11 +-
>   ...R-replacement-instead-of-hardcoding.patch} |   9 +-
>   ...2-aarch64-Add-support-for-musl-ldso.patch} |   9 +-
>   ...fix-libcc1-s-install-path-and-rpath.patch} |   9 +-
>   ...e-sysroot-support-for-nativesdk-gcc.patch} | 112 ++++++-------
>   ...root-gcc-version-specific-dirs-with.patch} |  13 +-
>   ...us-_FOR_BUILD-and-related-variables.patch} |  27 ++--
>   ...27-nios2-Define-MUSL_DYNAMIC_LINKER.patch} |   9 +-
>   ...-to-link-commandline-for-musl-targe.patch} |  15 +-
>   ...sing-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} |   9 +-
>   .../0030-sync-gcc-stddef.h-with-musl.patch}   |   9 +-
>   ...fault-in-precompiled-header-generat.patch} |  11 +-
>   .../0032-Fix-for-testsuite-failure.patch}     |   9 +-
>   ...e-introduce-spe-commandline-options.patch} |  11 +-
>   ...s-for-__cpu_indicator_init-instead-.patch} |  29 ++--
>   ...-Do-not-use-__LINE__-for-maintainin.patch} |  55 +++----
>   ...le-CET-in-cross-compiler-if-possible.patch | 150 ++++++++++++++++++
>   ...v3-Include-system_error-for-std-errc.patch |  23 +++
>   ...ild-with-disable-dependency-tracking.patch |  54 -------
>   .../gcc/gcc-9.3/0030-ldbl128-config.patch     |  79 ---------
>   ...heck-zero-value-in-simple_object_elf.patch |  48 ------
>   ...ands-Don-t-match-user-defined-regs-o.patch | 100 ------------
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
>   meta/recipes-support/icu/icu/filter.json      |   2 -
>   57 files changed, 491 insertions(+), 703 deletions(-)
>   rename meta/recipes-devtools/gcc/{gcc-9.3.inc => gcc-10.1.inc} (65%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (79%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0002-gcc-poison-system-directories.patch (85%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0003-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (92%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0004-64-bit-multilib-hack.patch (95%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0005-optional-libstdc.patch (86%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0006-COLLECT_GCC_OPTIONS.patch (80%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (87%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0008-fortran-cross-compile-hack.patch (81%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0009-cpp-honor-sysroot.patch (87%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0010-MIPS64-Default-to-N64-ABI.patch (85%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (93%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0012-gcc-Fix-argument-list-too-long-error.patch (85%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0013-Disable-sdt.patch (88%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0014-libtool.patch (87%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (87%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch (81%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0017-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (76%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0018-export-CPP.patch (93%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3 => gcc-10.1}/0019-Ensure-target-gcc-headers-can-be-included.patch (88%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0021-Don-t-search-host-directory-during-relink-if-inst_pr.patch => gcc-10.1/0020-Don-t-search-host-directory-during-relink-if-inst_pr.patch} (80%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0022-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch => gcc-10.1/0021-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch} (81%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0023-aarch64-Add-support-for-musl-ldso.patch => gcc-10.1/0022-aarch64-Add-support-for-musl-ldso.patch} (83%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0024-libcc1-fix-libcc1-s-install-path-and-rpath.patch => gcc-10.1/0023-libcc1-fix-libcc1-s-install-path-and-rpath.patch} (91%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0025-handle-sysroot-support-for-nativesdk-gcc.patch => gcc-10.1/0024-handle-sysroot-support-for-nativesdk-gcc.patch} (84%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0026-Search-target-sysroot-gcc-version-specific-dirs-with.patch => gcc-10.1/0025-Search-target-sysroot-gcc-version-specific-dirs-with.patch} (90%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0027-Fix-various-_FOR_BUILD-and-related-variables.patch => gcc-10.1/0026-Fix-various-_FOR_BUILD-and-related-variables.patch} (89%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0028-nios2-Define-MUSL_DYNAMIC_LINKER.patch => gcc-10.1/0027-nios2-Define-MUSL_DYNAMIC_LINKER.patch} (79%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0029-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch => gcc-10.1/0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch} (89%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0031-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch => gcc-10.1/0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch} (80%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0033-sync-gcc-stddef.h-with-musl.patch => gcc-10.1/0030-sync-gcc-stddef.h-with-musl.patch} (93%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0034-fix-segmentation-fault-in-precompiled-header-generat.patch => gcc-10.1/0031-fix-segmentation-fault-in-precompiled-header-generat.patch} (86%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0035-Fix-for-testsuite-failure.patch => gcc-10.1/0032-Fix-for-testsuite-failure.patch} (98%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0036-Re-introduce-spe-commandline-options.patch => gcc-10.1/0033-Re-introduce-spe-commandline-options.patch} (81%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0032-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch => gcc-10.1/0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch} (77%)
>   rename meta/recipes-devtools/gcc/{gcc-9.3/0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch => gcc-10.1/0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch} (80%)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/0036-Enable-CET-in-cross-compiler-if-possible.patch
>   create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/0037-libstdc-v3-Include-system_error-for-std-errc.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0020-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0030-ldbl128-config.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch
>   rename meta/recipes-devtools/gcc/{gcc-cross-canadian_9.3.bb => gcc-cross-canadian_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-cross_9.3.bb => gcc-cross_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-crosssdk_9.3.bb => gcc-crosssdk_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-runtime_9.3.bb => gcc-runtime_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-sanitizers_9.3.bb => gcc-sanitizers_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc-source_9.3.bb => gcc-source_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{gcc_9.3.bb => gcc_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc-initial_9.3.bb => libgcc-initial_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgcc_9.3.bb => libgcc_10.1.bb} (100%)
>   rename meta/recipes-devtools/gcc/{libgfortran_9.3.bb => libgfortran_10.1.bb} (100%)
>   delete mode 100644 meta/recipes-support/icu/icu/filter.json
> 

[cut]

> diff --git a/meta/recipes-support/icu/icu/filter.json b/meta/recipes-support/icu/icu/filter.json
> deleted file mode 100644
> index 2c63c08510..0000000000
> --- a/meta/recipes-support/icu/icu/filter.json
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -{
> -}
> 

Sorry for repeating myself, but this version also touches icu by 
deleting icu/filter.json. Just mentioning it in case this wasn't the 
intention.

/Jacob
