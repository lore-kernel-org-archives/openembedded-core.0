Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A3CC83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 01:33:00 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.38891.1752715970125544588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 18:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KgjF2Wa1;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70e4043c5b7so3827097b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 18:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752715969; x=1753320769; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esP0BdsoU3S/3mRjluHn9HjQwTnSUk7CKdi8ElL2Gd4=;
        b=KgjF2Wa1IJ2jnZzJO+HKAtvEHu3TomN/1/SWMrtcQDPcU/94O7CwmThrQhUyPP1rVr
         Qtoxi7nsevJPdrpijblcyJWL9pFkW/oyiFvwr2FeAKrNJR2CGjownFWC9x/PDOtaFNKW
         qi4g5jFwmmEnT/8n6A+5AqojNAWuHieCsS0gDA731s1FBPoNQwmzhRDk/6rFh9KJWt/Q
         PatOKv5CnfvfwXlWJLUg6/gjnLD4avhsil87Vr8vPQ+MH60jszq9GEyJZHh/2x0m3k2y
         T1wA2K8Yn6p6XSKiEyss2ziA7mTr7Mfszm1fh5Es0xFEKpyan4MokDmZhaWogBTiCfG+
         +clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752715969; x=1753320769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=esP0BdsoU3S/3mRjluHn9HjQwTnSUk7CKdi8ElL2Gd4=;
        b=ew4KRQQSSFmsRX3/CDsa/0Viwo93yULls6U+2ykC9Ybfl+IXCtYWJtDU3nQPaEKH4l
         pRnODT0tfgfLCcW/BA+ExfTWf1KiyuGY0Oj1cHojo6KA5nrqzCJCO7VnPym9Ey7+fNUP
         1gsKDl3BEb133v1Wn0zMivDjDZU7HWd/m79RmAD/x3xJZYhIF9eldD/pzFAEy721nzpd
         mH7pJs+bl7DtG8RE0sQEZWBjjfbhl6K7aDwuMzCFO11Ju+AZ5aSL8ctLYMCTK2dXH0oc
         ZfSUJxfFAk8AUcal4nhi0JzntCbrgZvs49eb33rhtry6Nr//zyAoEfymCd42DSvIS1h5
         5OGw==
X-Gm-Message-State: AOJu0Yz6iV6L0DrEpCHmjjvB36C8Xez7HDZj/Mrfamf7qaLsO1sHDOO3
	kxzlFW3NMuowAHpzehh2yMs67xaJbRSMmG5FLLPsjeok/46bPih+aXc9G4iYKe2HG34D7coitDw
	FB1IKcdIgzDCwrrqQKLKT3NLcyPfiAwQ/llxk
X-Gm-Gg: ASbGncv9ObeJV0VkB4pnbfgif+DyAx6GzRdQnPVfXMFsYAN9/f4EQY/pA1huWxjqyfh
	OrWEuR8JZS5IsREmxL/bSvMi1kMrtIhefep/w0ps9TiEVgu6iLmurvVDHTsPVS97jn2SusaJpJM
	3ubdsRItuRTxysm+BMQnhsNMTUfQkNL9it8juvWQKLc4KdByDSMcl+EhTeqK0PWCGqD3Tt2YP8K
	b2ir2s92rNlzvvV
X-Google-Smtp-Source: AGHT+IFkqcjjvCR61GDGPKIqmzpBE2mwcgB/m9OOTACqzRV2Qy0xT2ok9FeZdzNdkFnj76LuPTWN9k37Aoh3/Lcah6A=
X-Received: by 2002:a05:690c:9a84:b0:718:a975:d4f6 with SMTP id
 00721157ae682-718a975e3b4mr14743957b3.31.1752715969079; Wed, 16 Jul 2025
 18:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250716123047.1322878-1-ross.burton@arm.com>
In-Reply-To: <20250716123047.1322878-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jul 2025 18:32:23 -0700
X-Gm-Features: Ac12FXxh5GdAOaDfLl-5ZsmBW4OLtzvmQ29uzM0sniETooCrwyLxdnv4wMyK9m4
Message-ID: <CAMKF1srjH=+jMcY4BqMToXWF_Q0DfPcnWynuqVBPK5h5H8azJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: remove obsolete 'terminfo' PACKAGECONFIG
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 01:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220480

On Wed, Jul 16, 2025 at 5:30=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Neither LLVM_ENABLE_TERMINFO or COMPILER_RT_TERMINFO_LIB are used in the
> current CMakeLists.

It has transformed overtime, so removal is perhaps fine. although this
has transformed into lldb cmake detecting it for the build
so it might be doing the job due to ncurses being in deps which now it
gone. TUI with lldb might be disabled

>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/clang/clang_git.bb | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
> index 194e690a8c4..d70f2c0133b 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -57,8 +57,7 @@ PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtt=
i shared-libs libclang-pyth
>                                ${@bb.utils.contains('TC_CXX_RUNTIME', 'll=
vm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
>                                "
>
> -PACKAGECONFIG ??=3D "terminfo \
> -                   ${PACKAGECONFIG_CLANG_COMMON} \
> +PACKAGECONFIG ??=3D "${PACKAGECONFIG_CLANG_COMMON} \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto',=
 d)} \
>                     "
>  PACKAGECONFIG:class-native =3D "clangd \
> @@ -89,7 +88,6 @@ PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLV=
M_ENABLE_LIBPFM=3DOFF,libpfm,"
>  PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOF=
F,,"
>  PACKAGECONFIG[shared-libs] =3D "-DLLVM_BUILD_LLVM_DYLIB=3DON -DLLVM_LINK=
_LLVM_DYLIB=3DON,,,"
>  PACKAGECONFIG[split-dwarf] =3D "-DLLVM_USE_SPLIT_DWARF=3DON,-DLLVM_USE_S=
PLIT_DWARF=3DOFF,,"
> -PACKAGECONFIG[terminfo] =3D "-DLLVM_ENABLE_TERMINFO=3DON -DCOMPILER_RT_T=
ERMINFO_LIB=3DON,-DLLVM_ENABLE_TERMINFO=3DOFF -DCOMPILER_RT_TERMINFO_LIB=3D=
OFF,ncurses,"
>  PACKAGECONFIG[thin-lto] =3D "-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS_IN=
CDIR=3D${STAGING_INCDIR},,binutils,"
>  PACKAGECONFIG[unwindlib] =3D "-DCLANG_DEFAULT_UNWINDLIB=3Dlibunwind,-DCL=
ANG_DEFAULT_UNWINDLIB=3Dlibgcc,,"
>  PACKAGECONFIG[libclang-python] =3D "-DCLANG_PYTHON_BINDINGS_VERSIONS=3D$=
{PYTHON_BASEVERSION},,"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220449): https://lists.openembedded.org/g/openembedde=
d-core/message/220449
> Mute This Topic: https://lists.openembedded.org/mt/114183620/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

