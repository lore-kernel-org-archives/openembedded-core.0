Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11C3C3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 15:48:49 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.22440.1746200924337905640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 08:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5o2fy1B;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7398d65476eso1898678b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746200923; x=1746805723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vW2CbHXBxb0XU71Ra57udqbDe63WQ5XoslO44INZwSs=;
        b=S5o2fy1BCMkQd/sL41UhWUhXPlv4hEpgxdyP57mMjbalJAvZqTj2eLJvLUOdCfORw8
         0HTdLLQXnV9XQR55ixk88HkUTYD7QClqbACTN8+/161z4FlqT8rYAk1rRccyqkuoNy8W
         tdR8zocCsBarESedj6qtoLpehO5VnfDztOP4c4h3W49iZ1LPL+GVJt22qNio5GQQ3yk0
         hSxUkyfBucu9qrJAN7vudug6P1KiOvWRJ2JaacU6dOliEBJeFFvJSLnuerE+Pw8iAcaF
         cpDokNek+rPBrSs3nnAs1XVn1oNDQZLEgBmM11uoDHcd/wcCHvr15XH64ZqG52B0fzUP
         dALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746200923; x=1746805723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vW2CbHXBxb0XU71Ra57udqbDe63WQ5XoslO44INZwSs=;
        b=K4/qVRzDuzsWSoFAhMIkl0NRD35glsJTsD1UOUfLIeVN/j2kHq1Poxfnhy1QBgjuIg
         zNVIrUMmSVB7zBU5FeFYEIId0o7xaB8fCEAYH+DMvlvOysCvBKte5vXWqXdPg/LMF9Et
         jXuyULmBN4b7fzY8etKTazjZhDvYBtg0xfI1oZbiRaFYLV8N3z80a7r48nUWv/2uO0xM
         IsqbZ/KgPzIUYtpT6mMmCfyRZsgJSm1ldssRWSmtIYsFHHQDf5TGJxJWHSrW7W6aJ/qG
         eTNIbH+AqUUr/0TWPCoLmfxk+5TuFfJY1ts6D05ZCNgUIpS7fQM7tzNz+9DEAA1ZgliY
         ojOw==
X-Gm-Message-State: AOJu0YxXNaAtQOOh9/yigmw/gIG1iOP0QRxL9YQhPEQKKlpkOZfzULZT
	bvKlwISTf6kYrKLF+b4t1AVzAtW9GlnZT1jeJzHyWgmPIBzo+5k+ABlnkkAt
X-Gm-Gg: ASbGncsGFh268sIgJd/CVc7oBbBMRLVoS2utyEoQ3WQyg0n8zqybD1M2enYrORKFbNN
	x62OTm510Nu5qBRi+Qf8DK3ZefQCmYaZIFvh0M+wjKILojZjQnE4OhcyXLi1vBpvALm1loSMqYy
	Y21XK6PTZogpOZeuf898TFLzE8jFDFTbCpkSsO9zE6oc69ST5n6K/E3oAPvk4MUA+s2o4V/SRh4
	+mwfHgl9xPX5xm0D1d/JZH+/Wj3MbrXJD4Lq8rgYLHd8m8tWnWutVHOLEzcZKQ3rDVoFAcKWIzG
	tiWrCc0yOJcTbSOPvqgFBYuQeg5S1b4r
X-Google-Smtp-Source: AGHT+IE6UV+23XRVLau9A7BUXU2YlCaz8XNb7naIGKsXGx/2+zE69CGBjNbW30AdEJXZEQj8av1w8A==
X-Received: by 2002:a05:6a00:e8f:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-7404917149cmr11460633b3a.3.1746200923109;
        Fri, 02 May 2025 08:48:43 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905cfdfsm1714617b3a.123.2025.05.02.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 08:48:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [master-next][PATCH] clang: Upgrade to 20.1.3
Date: Fri,  2 May 2025 08:48:39 -0700
Message-ID: <20250502154839.1421750-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 15:48:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215908

Brings following fixes

* 923a5c4f83d2 Revert "[ARM][ConstantIslands] Correct MinNoSplitDisp calculation (#114590)"
* 86f5891c5986 [llvm][Hexagon] Promote operand v2i1 to v2i32 (#135409)
* d55c3c20520a [libc++] Fix misplaced _LIBCPP_POP_MACROS (#134874)
* 9420327ad768 [Clang] Fix a lambda pattern comparison mismatch after ecc7e6ce4 (#133863)
* 4da7285e636e Silence -Wcast-function-type warnings on idiomatic Windows code (#135660)
* c5109be53b7e [LV] Disable epilogue vectorization for FindLastIV if start is poison.
* 91a3f14d9497 [LV] Add tests with FindLastIV and epilogue vectorization.
* 2131242240f7 [LLVM][MemCpyOpt] Unify alias tags if we optimize allocas (#129537)
* 86c98536380b [libc++] Fix deployment targets that were incorrectly bumped (#134278)
* dfd6f123362a [libc++] Guard additional headers with _LIBCPP_HAS_LOCALIZATION (#131921)
* dc9d4f9a7008 [lldb] Respect LaunchInfo::SetExecutable in ProcessLauncherPosixFork (#133093)
* 9c7d72869876 [LoongArch] Move fix-tle-le-sym-type test to test/MC. NFC (#133839)
* 0c30835a63db [X86][AVX10] Remove VAES and VPCLMULQDQ feature from AVX10.1 (#135489)
* 2e0966408283 [X86] Backport saturate-convert intrinsics renaming & YMM rounding intrinsics removal in AVX10.2
* 0dd4235473d4 [SCEV] Use ashr to adjust constant multipliers (#135534)
* a141e58685fd [llvm][CodeGen] avoid repeated interval calculation in window scheduler (#132352)
* d88cd35023b4 [llvm][CodeGen] Fix the empty interval issue in Window Scheduler (#129204)
* 73d1e8598eda [CodeGen] Avoid repeated hash lookups (NFC) (#130237)
* 7034995f1029 [clang] Handle Binary StingLiteral kind in one more place (#132201)
* 2e7710eaffdd [clang] Introduce "binary" StringLiteral for #embed data (#127629)
* e0db588f3db4 [IR] Fix assertion error in User new/delete edge case (#129914)
* d5bb7b866e59 Avoid a race condition in opt-viewer/optrecord (#131214)
* d15fef4209f1 [IndVarSimplify] Handle the case where both operands are the same when widening IV (#135207)
* 91647ae0dffe [X86][SSE] Don't emit SSE2 load instructions in SSE1-only mode (#134547)
* d05543ed0796 [clang-format] Keep the space between `not` and a unary operator (#135035)
* 81220e68a496 [fatlto] Add coroutine passes when using FatLTO with ThinLTO (#134434)
* edb54a7821fe Release/20.x: [clang-format] Set C11 instead of C17 for LK_C
* 4181e829d1db [LLDB][LoongArch] Fix build errors about NT_LOONGARCH_HW_{BREAK,WATCH} (#126020)
* 7436329bfee9 Revert "[clang] [ARM] Explicitly enable NEON for Windows/Darwin targets (#122095)"
* a0c8959cc880 [X86] When expanding LCMPXCHG16B_SAVE_RBX, substitute RBX in base (#134109)
* a8b5fe017a5e [libc++] Add missing release note for LLVM 20 about zip_view (#134144)
* 41aefdbebe64 cuda clang: Fix argument order for __reduce_max_sync (#132881)
* 19c2e1c12d47 [clang-tidy] Fix broken HeaderFilterRegex when read from config file (#133582)
* ac31db0463c0 [Sanitizers][Darwin][Test] XFAIL malloc_zone.cpp
* 53141e4e3c65 [clang] Do not infer lifetimebound for functions with void return type (#131997)
* cf7bb13f0c7f [TailDuplicator] Determine if computed gotos using `blockaddress` (#132536)
* 656289ffa0a6 Bump version to 20.1.3 (#134187)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b3e3862df9e..b67433d4d2b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -478,7 +478,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-20.1.2 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.3 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index bb152d2c566..41944265ba5 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "20"
 MINOR_VER = "1"
-PATCH_VER = "2"
+PATCH_VER = "3"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 5a1fa0bacf7..f733566bc88 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -15,7 +15,7 @@ LICENSE = "Apache-2.0-with-LLVM-exception"
 RELEASE ?= "${PV}"
 BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz"
 SOURCEDIR ?= "llvm-project-${PV}.src"
-SRC_URI[sha256sum] = "f0a4a240aabc9b056142d14d5478bb6d962aeac549cbd75b809f5499240a8b38"
+SRC_URI[sha256sum] = "b6183c41281ee3f23da7fda790c6d4f5877aed103d1e759763b1008bdd0e2c50"
 
 SRCREV_spirv = "6dd8f2a1681a27f16c53d932d2765920f312aeb2"
 SRCREV_spirvheaders = "09913f088a1197aba4aefd300a876b2ebbaa3391"

