Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00BCCCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 23:05:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.9613.1760223938763889302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 16:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I3t8nPMs;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-273a0aeed57so50960815ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760223938; x=1760828738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3rCovJk8/D6AZYvcGVVJfc2366dd4CNX7uZ9msVARXc=;
        b=I3t8nPMsc/UT6KCudPwt5eYmalHWKC/Yuz8O20jfsYlDw7gIh5iVYwj5lCr2tnCrrh
         YRbG2PvUGbA55SZ1xxViI9ta/46Ronx66n0VkjAmFHLqhwKYxod/n023QmAaY+zDrF7m
         BE4A2zfVQHBoOreA3l2EIEmCAtexgSEtqkd8LJAAyrM1qhWgZw+9RF2diiL4J4NygIa+
         G4dNVtKF1FqDKL4J30i1M1lmMn+74EpyflL8rfO5EoUne1/YJ2EAuHsM2Mj8v3SzPDad
         cyMpc9ffnuawvmyPbzU7ZKNb0iJA840QzGCdhMGuIWbGCtYHdYCqaiR0CH5qEFioHLRG
         x3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760223938; x=1760828738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rCovJk8/D6AZYvcGVVJfc2366dd4CNX7uZ9msVARXc=;
        b=Wh/HquaRbFAOUseCGsC2/WV+XuO8g9cZGg3KTeqiF/EaG3Jzn8CC0ajstYk2cZdrfb
         9SC7oN9kyxl0Tulmi2CZUm/PFaTz75ORmdvTG5HHveMKlU35dLTF77EJUsWg+6K2qN+h
         /GGhtxA2vL2BaS8qo2e0DCjvaoF8jPbheNSTP5m9k/rwqRB/yw0FBfnwpAelZmxle+Bg
         WkwxAlLrWRjlvV8fA+lNtzGbrRW2b+z9YKx/8HoDhiq/8iFsh6POVCBsKv7zwCjL8cdE
         RuArn7HodfC8cL/YRA8Tk5QLUbRJUCVeGL3970KsTjRwGNXR0D52WKcqKdpkL6KiBQMM
         WyDw==
X-Gm-Message-State: AOJu0Yw5G+KbP5PZSLHntminuyiFE+ptoZ+VC7s1GmYZF+kuKOlVQ5Hd
	fkGSU6cV/on+1qxR+0x2YJGLHpvzEZDL7D6xcCLUeGI+9MXk/tJpRiTtP95MFvGA
X-Gm-Gg: ASbGncvRG3em1v1dFU8NvOwxyE5tVkyyPCG1/CX4teubPRF/PGlwehJ4+CnBtN37aL5
	6nVwMyVfnCtz4p1ycBPS98YywC7/54ryzgCF7aNxdBnNBArH28UYzN7X4Ke0sfpYU1C7HgtsgIf
	u07SBk6+Dn/Yu34x3mEB0goKigikLQVrcOmvsPFQ86KVgZQQylegD/4rZndWIe+Q5arqhDjCEmh
	1hFclP6nvKcV5iWSyZtAUx4cSKm0hNx/XVzcqYhwchg87CG+yabi9rMD4/SdOcCgI1qQjbRyUUu
	y0f1NMZDFOiPGdcKYhSUPih2p0xQTyUVSTSOCOErV6CKYPuoqPYYWoCdC/xsO4xNu3q5uok5CX7
	8BM6fRYkO9N4Xp98m9b0deobqVFSkv39Y9eH56BtQ0SrzoJJDlKWw
X-Google-Smtp-Source: AGHT+IE0GvEGxqD0I682uicv3J8owlkWjMJRHHALMb1X006QSMc3yyePtpnEb4QO3ZPU1I9IOXagOA==
X-Received: by 2002:a17:902:f691:b0:267:cdc1:83e with SMTP id d9443c01a7336-28ec9c975a0mr284069825ad.15.1760223937857;
        Sat, 11 Oct 2025 16:05:37 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4a63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aab514sm7412442a91.16.2025.10.11.16.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 16:05:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm/clang: Upgrade to 21.1.3 release
Date: Sat, 11 Oct 2025 16:05:35 -0700
Message-ID: <20251011230535.1970099-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 23:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224725

brings following fixes

* 450f52eec88f Bump version to 21.1.3.
* 05b5090e961f Port 5b4819e to release/21.x
* 2cb08dbb39b1 [compiler-rt][sanitizer] fix msghdr for musl (#136195)
* 6e687cbe0dd3 [SPARC] Prevent meta instructions from being inserted into delay slots (#161111)
* f8151a1d2c86 [clang] [Headers] Don't use unreserved names in avx10_2bf16intrin.h (#161824)
* 9ee4ac8a8359 [clang][SPARC] Pass 16-aligned structs with the correct alignment in CC (#155829)
* 220bac16a417 [Hexagon] Add opcode V6_vS32Ub_npred_ai for offset validity check (#161618)
* a867bd53e861 [clang][PAC] Don't try to diagnose use of pointer auth on dependent types #159505 (#159859)
* 41e817a1d1f4 release/21.x: [clang-format] Fix bugs in annotating arrows and square brackets (#160973)
* 559d966bcb54 [Mips] Fix atomic min/max generate mips4 instructions when compiling for mips2 (#159717)
* d1e2f8916128 [LLD] [COFF] Fix symbol names for import thunks (#160694)
* 0060034c6a0b [analyzer] Revert #115918, so empty base class optimization works again (#157480)
* 31e4363ba9c2 [NVPTX] Disable relative lookup tables (#159748)
* 74cb34a6f51a Bump version to 21.1.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d2c613b8e9d..deac453365e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.2 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.3 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 47f036bc662..7191d41efd5 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "2"
+PATCH_VER = "3"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index a89831ce8f5..b7adc653404 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "1a417d1c8faf8d93e73fec1cbb76d393ed3218974c2283c7bac9672d3d47c54b"
+SRC_URI[sha256sum] = "9c9db50d8046f668156d83f6b594631b4ca79a0d96e4f19bed9dc019b022e58f"
 
 SRC_URI = "\
     ${BASEURI} \

