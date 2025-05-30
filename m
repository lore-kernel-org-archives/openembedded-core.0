Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1BDC5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:11:19 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.703.1748625077677022012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G9LyrNOh;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fab467aacdso22683576d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748625076; x=1749229876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4RW9O+Vi1XJjcPc8sEMQ/DSwUYiwndtDzdfKPl4zHE=;
        b=G9LyrNOhe3CacgwAwbgH79FZx+u7nL6A0IESJqkZXNIZ6P0YmXrIF3DoCRTEscMbR7
         j9C9o1K6rJ3EYcWGUpbOKCsf7zuF8C2tLV7kKSQjv5aMrdJ2ALWBDYSOawvTpWFgUupT
         BIA2xTOeAqOCvjumYKMttzs2eMdhojCq069A6JgS2PCmKNDaRGbGExaQmMSXOwvDO1l0
         +xwaxqmXXbYnuEtsut0EV9sdPF5FPoGbUuwPo4Eny3HM7kZRtizzXxl+UgzGz6fMllyd
         sle84txPp/bH/ZXQ+2BWRt1pl4oajp21kN2UMS6+lwD7/qGS+zWUt4Zgk0B+ZXQDSZj2
         QFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748625076; x=1749229876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4RW9O+Vi1XJjcPc8sEMQ/DSwUYiwndtDzdfKPl4zHE=;
        b=Bjv4bRgMk1pXBJElVpPVJ5o4Gx1TcrQYP5MLQjsgDtPbxieSR2R7qM4R0r5cdoiGxO
         Ofr8A642uZSP6e+CBiMjct6tE/Jqrvtx1EqKmyeH+CXmO/Q+RC239V0qCrMkS+YfCtum
         z5ZX2QVtzBg+8aMMc68LvKtofgugrptFNpPtcpgX90BdHkH6j4d42vdFvv1/mjyryFhw
         qYTeUae+VAKZaMOvjWd7RAAEXy4DcPM5dVricApUMgNQQNMLMkUfXlXhpZ8wT1g29gxy
         GUq0joS5GLI7uHkTFmk/bf/kgNa30rfSe/1ud87GvvEZMa+Co6nUCl5Hy9QpnKUfqRxe
         /xLg==
X-Gm-Message-State: AOJu0YxnzqoB1zqez1eCWDXbGcfnAOrvfECOS7O+8yNzeTHCXBtUhVMI
	NyBV6M4eunNVqh0bySQyfB+4r9OVlX+wyPV7kkfzKiYP4c2xcmrCBIteg4hw/h43
X-Gm-Gg: ASbGncshe1wmPPj2CvFjt6957Rorzb8i4UpO1q/DL7rsiGX/1mCBXQ3pAsxTc38rceb
	dgWZkHPdKcDTn4CIUhdlt1ulr+VbtSHZ1VuTM/+1ilylXNOSxEnKdN69EJjW2Vt30oBp/rUWgc9
	oEuBTlWD6dKy+KYtuZ7YQsTviVHA/OKkAHQE9JKUcXngfqe46SCQIMjdGYt6OZvukk018p3Eesv
	HlkCttWiwnQ2P/H56pfQWfPoQ6U9GYKY4iFISAWS8JL5ddSrH27L2Zv1JxMUgqne8UxmqSkBkEN
	49AEqNdHHfMo4wLF2BZw5G/ufX91JrSrSoQ4XtuGfSU=
X-Google-Smtp-Source: AGHT+IGQCBiitUxEJ79tUUih6fgrqB1m4NMygy7yG+BPF8m3fJvkicWUvIHTVAuwmn0uZMucGii/gg==
X-Received: by 2002:a17:903:289:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-2352920a1b6mr62395615ad.31.1748625065968;
        Fri, 30 May 2025 10:11:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdb3f4sm30887555ad.86.2025.05.30.10.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:11:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] clang: Upgrade to 20.1.6 minor release
Date: Fri, 30 May 2025 10:11:03 -0700
Message-ID: <20250530171103.3913632-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217522

Brings following commits

* 47addd4540b4 [libclc] Include isnan implementation for SPIR-V targets
* 4b6e5a286653 [clang-format] Handle Java text blocks (#141334)
* 0e1ef696f1fe [Driver] Fix _XOPEN_SOURCE definition on Solaris (#137141)
* 5d99a97583e1 [MachO] Improve bounds check (#141083)
* aa804fd3e624 [sanitizer_common] Remove interceptors for deprecated struct termio (#137403)
* 53393e26d5f4 [LoongArch] Prevent R0/R1 allocation for rj operand of [G]CSRXCHG (#140862)
* 6fcb1c127b40 [LoongArch] Fix assertion failure for annotate tablejump (#140907)
* 15ec590e389b release/20.x: [clang-format] Fix the indent of StartOfName after AttributeMacro (#140361)
* 802f4f75372e [clang-format] Handle raw string literals containing JSON code (#140666)
* 9b0832508ede [SDAG] Ensure load is included in output chain of sincos expansion (#140525)
* 8a36b8e3ab46 [clang][analyzer] Handle CXXParenInitListExpr alongside InitListExpr
* 070cf62530ea [Clang] Demote mixed enumeration arithmetic error to a warning (#131811)
* a169f5ca4e4f Correct position of CFI Instruction for Pointer Authentication"
* 5befd1fb3c97 [Clang][AST] Fix HandleLValueBase to deal with references (#140105)
* e3d2c00ccee4 [LLD][COFF] Allow -arm64xsameaddress in ARM64EC directives (#139631)
* 85e06a761483 [LoongArch] Fix fp_to_uint/fp_to_sint conversion errors for lasx (#137129)
* ff2e8f93f609 Fix test pfalse-v4i1.ll added in #138712 to require asserts.
* 1e4d39e07757 Bump version to 20.1.6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8627f72ce77..e5d24ac2c85 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -477,7 +477,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-20.1.5 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.6 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 45616de3e3e..15e6610b9b2 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "20"
 MINOR_VER = "1"
-PATCH_VER = "5"
+PATCH_VER = "6"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index f53336326aa..5244298dfb1 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-proje
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}.src"
-SRC_URI[sha256sum] = "a069565cd1c6aee48ee0f36de300635b5781f355d7b3c96a28062d50d575fa3e"
+SRC_URI[sha256sum] = "5c70549d524284c184fe9fbff862c3d2d7a61b787570611b5a30e5cc345f145e"
 
 SRC_URI = "\
     ${BASEURI} \

