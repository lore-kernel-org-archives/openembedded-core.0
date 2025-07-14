Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E72C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 15:03:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.80279.1752505398524952736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 08:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IhFCYEE5;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45555e3317aso18343525e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752505397; x=1753110197; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZEdznhCmiZjVFR181K7gPXDfoliLmLwakzT7ShYghb8=;
        b=IhFCYEE5JabcXTLLxuKgMcXBJflTA/XZB0VOax+8BiOtsCW0VPALbwHmNXH0yObmSA
         HC3YjwacZ4m99Rrx2QSmhSl3bkrTHyROgt2pHnYHnpPaeChYafsl3TKcMxYTcMgBDwvV
         FKy2u1pQZkeQ0hH+bBdJR6bcNhYCOxRZK2BMAGzWWz726l+up+4dRidPxtsNvu/akwGF
         LqocZkeX5fs6cSqhW7VsahbaYeiN5nwDGOOmHNDVlD7auYgc3Hj4fCD9p6SkH/US/RKR
         qKuUMG2Hh4RpV9dT0kSV05ZJVHt+AIvE2dbzZrvqomHsjjle52nf4urAXYTpwHgMZT5N
         YcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505397; x=1753110197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEdznhCmiZjVFR181K7gPXDfoliLmLwakzT7ShYghb8=;
        b=V2uqE85PPJGG637FzWB1UvoxHVJCHqaW223uxGeRL+A1Rb6b7mmU7pHg65rQHvzmJ8
         WvgIyX88IdATSRYlufzScuKz8hSdHfpeg+TIsAtNlxYPNlUZuVuvCZVzyY8GC6eEH5tH
         +Z2NXy3JaebSSvVsac7ZoUymDERNL0Yu1GN7bAJBEMF1ILbCo0qfqTH8I6PAeCbYnzoL
         m8V1lHYf5YY0wEjLMb0T4UjZEw9W1Ob8mR5dchOQPNomJAHzqKQU/JoCiGM7hdoZcpBe
         fX5Pw2WpkOLExDKA5dJxCwyWrRvYKSzHnGRAjbn/U58QBIM/iNzEe6cKRRlxQr94twQd
         aEjg==
X-Forwarded-Encrypted: i=1; AJvYcCU9vgGWDdMyK3fjhBkYB+HSKEV+w+nye+U7kPv9Tg+zL6CiLyyyyrFgrUSS2gkLMPz3XRvBMzlmGbuHRWCQMheFeg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcQOB/Ld1k94r743QbdHYIT+rrhI1QY6VqhhIkCRidVEA+yXIK
	83LMJcLLpOOpdm4chWGtCkiaboLIHiOOBPGP4mxKyPMvBIiwlVTbdVui
X-Gm-Gg: ASbGncupD+5xmOsQm+if5AYbEeOxQeIpHWOZA0WelGuDLjJ7/pdiK/nLwsbVL2AKjIm
	TSH/1lfLmqKiHgoU6lEb4JPlWPb8CP1UQf7ac5XgvczULDb1r/t368gNxk8hd/Z3k53MPOaA7cg
	308Qx1hSupLb4H/gcpzLsGgI00zwBVW2TaqMkZAcpPsi+NqD4v3OAJMGxw9qhbFBbgeOtnLIwRt
	UhdbMi5nQ0G1l4bogFk5h7azxz91pumAEKUFfeYGFrbVCbXLRs2enAJ13nqiOCgGyQJJ9XpYe7n
	nWYSVxsxkXWzyINf8joDlOn1S1SdVIzG88NMQ8cc0fBb1GW95PNEBIM2XhjRato/xB6VWal1xr4
	HfIi4sSB2MF/d91rmDzp/mZUYbeH1pA==
X-Google-Smtp-Source: AGHT+IHLsjzPhBVa94RG+rzIAlavMHLODa8uCR3tPDKe9ucrwnlBEKrf0ec1rufLQ+gjAK56qN6Q7A==
X-Received: by 2002:a05:6000:144b:b0:3b6:4c3:1129 with SMTP id ffacd0b85a97d-3b604c31146mr2871780f8f.57.1752505395672;
        Mon, 14 Jul 2025 08:03:15 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612023b3234sm3918472a12.75.2025.07.14.08.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 08:03:14 -0700 (PDT)
Message-ID: <bbda64ad-2bee-4679-9e07-5b1a82a6aac5@gmail.com>
Date: Mon, 14 Jul 2025 17:03:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] compiler-rt: Always use clang for compiler
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20250506201127.4188369-1-raj.khem@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250506201127.4188369-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 15:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220235

I realize that this is a fairly old commit... anyway.

During the weekend I decided to update a personal project of mine to the
tip of master, but after performing the main required changes, I faced
compiler-rt build failures, complaining about unrecognized -mcpu
argument during the compiler sanity check in do_configure[1].
Bisecting oe-core points to this commit. The project I'm using uses
-mcpu=cortex-a72.cortex-a53+crc+crypto (DEFAULTTUNE =
"cortexa72-cortexa53-crypto"), which is not accepted after this change.

Is this a user error, and I'm supposed to change something after this
revision, or is this a regression?

Thanks

[1]:
https://gist.github.com/OldManYellsAtCloud/1e0a931a815a054a35cf61792e529b70

On 5/6/25 22:11, Khem Raj via lists.openembedded.org wrote:
> This makes it build for all architectures e.g. riscv/mips/ppc etc.
>
> Using clang-native to build all variants of recipe makes it easier to
> handle compiling with various distros choosing different runtimes
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix builds when using clang as default system compiler
>
>  .../recipes-devtools/clang/compiler-rt_git.bb | 29 ++++++++++++-------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
> index 93928541273..a0f9c769a06 100644
> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> @@ -32,15 +32,15 @@ DEPENDS:append:class-nativesdk = " virtual/cross-c++ clang-native clang-crosssdk
>  DEPENDS:append:class-native = " clang-native"
>  
>  # Trick clang.bbclass into not creating circular dependencies
> -UNWINDLIB:class-nativesdk:toolchain-clang = "--unwindlib=libgcc"
> -COMPILER_RT:class-nativesdk:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
> -LIBCPLUSPLUS:class-nativesdk:toolchain-clang = "-stdlib=libstdc++"
> -UNWINDLIB:class-native:toolchain-clang = "--unwindlib=libgcc"
> -COMPILER_RT:class-native:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
> -LIBCPLUSPLUS:class-native:toolchain-clang = "-stdlib=libstdc++"
> -UNWINDLIB:class-target:toolchain-clang = "--unwindlib=libgcc"
> -COMPILER_RT:class-target:toolchain-clang = "-rtlib=libgcc --unwindlib=libgcc"
> -LIBCPLUSPLUS:class-target:toolchain-clang = "-stdlib=libstdc++"
> +UNWINDLIB:class-nativesdk = "--unwindlib=libgcc"
> +COMPILER_RT:class-nativesdk = "-rtlib=libgcc"
> +LIBCPLUSPLUS:class-nativesdk = "-stdlib=libstdc++"
> +UNWINDLIB:class-native = "--unwindlib=libgcc"
> +COMPILER_RT:class-native = "-rtlib=libgcc"
> +LIBCPLUSPLUS:class-native = "-stdlib=libstdc++"
> +UNWINDLIB:class-target = "--unwindlib=libgcc"
> +COMPILER_RT:class-target = "-rtlib=libgcc"
> +LIBCPLUSPLUS:class-target = "-stdlib=libstdc++"
>  
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[crt] = "-DCOMPILER_RT_BUILD_CRT:BOOL=ON,-DCOMPILER_RT_BUILD_CRT:BOOL=OFF"
> @@ -52,6 +52,13 @@ HF = ""
>  HF:class-target = "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', 'hf', '', d)}"
>  HF[vardepvalue] = "${HF}"
>  
> +CC = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +CXX = "${CCACHE}${HOST_PREFIX}clang++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
> +BUILD_CC = "${CCACHE}clang ${BUILD_CC_ARCH}"
> +BUILD_CXX = "${CCACHE}clang++ ${BUILD_CC_ARCH}"
> +LDFLAGS += "${COMPILER_RT} ${UNWINDLIB}"
> +CXXFLAGS += "${LIBCPLUSPLUS}"
> +
>  OECMAKE_TARGET_COMPILE = "compiler-rt"
>  OECMAKE_TARGET_INSTALL = "install-compiler-rt install-compiler-rt-headers"
>  OECMAKE_SOURCEPATH = "${S}/llvm"
> @@ -72,7 +79,7 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RelWithDebInfo \
>  
>  EXTRA_OECMAKE:append:class-native = "\
>                    -DCOMPILER_RT_DEFAULT_TARGET_ARCH=${HOST_ARCH} \
> -                  -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH} \
> +                  -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
>  "
>  
>  EXTRA_OECMAKE:append:class-target = "\
> @@ -89,7 +96,7 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
>                 -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
>                 -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
>                 -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
> -               -DCMAKE_C_COMPILER_TARGET=${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
> +               -DCMAKE_C_COMPILER_TARGET=${HOST_SYS} \
>  "
>  EXTRA_OECMAKE:append:powerpc = " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=powerpc "
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216082): https://lists.openembedded.org/g/openembedded-core/message/216082
> Mute This Topic: https://lists.openembedded.org/mt/112656561/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


