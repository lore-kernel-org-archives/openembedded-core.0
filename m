Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB463C83F34
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 21:09:50 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.6193.1752613785986509179
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 14:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PGNKaQ2g;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-748d982e97cso5034337b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752613785; x=1753218585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTLo7/NkTOJBCBjze127UYaLXPEMWc63G5GfqAza5jY=;
        b=PGNKaQ2gby3+NCMYfldgyk1mMVx43XoWrxaqzvwvkoBYWhrnwoOFSNMoULR+KMSoRC
         dN9Ue5xU0w1Vt13hEyqCk7ELEBvSv2s6R6Ja/tWGMadwPyetz1Mjul9NjopjcZUP7ufw
         Oj5n6NfvX9ZQ+e5JfMWeKLSMf6kf4zHqWcz77yV4bPcQIQuimNYw/u5qlKO3bHUHpDyK
         BJ3qcWCyVM6qlWXBuS5vth2PRWdUn5gXTzx+fL6VNzkS1xNCOI6QEIxfBcg4Nj0VwVTA
         QHVRZ3rYX5hoGQEycyw3RJddY+AoLYckvW5YLt/8OqrZvCbgPRShSLGSeZsJb6rIfsEe
         diXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752613785; x=1753218585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTLo7/NkTOJBCBjze127UYaLXPEMWc63G5GfqAza5jY=;
        b=Gud+KRazngRo97pmFmWph5eNK1WX3uFjyyCxyoMaJOIKedSqPBJk/W9VQ020EpSxeW
         0TpDpH7VjC0GP9lVHv93TjrIqYKeGtck46a9+MPt9JH1VT73eawmg3hmyEJT4g7s8kpR
         kNKBEji7rXuJyOwctmqKv7xvbxPMR4Pag3kshVP+VDY5aBdf344OIEl/Tx1/wAn+2PrP
         38gdoxMbpyw3h6Xz9hp6yZD4L2A/yD91hWCzb8hfiOF9/Eo2k49JgiaLRdCR1QbHi2+L
         FSYS5F1D6u9puh5aiVvE7dJgsV1irtYpp1CUxpeOp+7H9u6WWXA/x7kdHPbxlslo12gF
         qTpg==
X-Gm-Message-State: AOJu0YzgUy+UsSmRJEH/G0W2i4XQnpDtL2Z4DBAccL4BfGGfkPjFq5c0
	Z1k1tY4bXd8u0a1qQBAgKRnbAT4jPRRdAMl7RwgYxDIarSrIkRYya0b7fsapsQNY
X-Gm-Gg: ASbGncvk7/IPQHO+oP5trYB36SsBp4m6hhjvgtPtgFSRBXX1OXOBTWJNIrXuZFXuegN
	4SDM4hYLcREf91PJafwjuPv8wWDmMPaEbS9ZtGekJh3CHkowesPDx/7FULdWjTys8xcV6urTdsW
	Ik424R8WAvucY8ZNpBnqrwM/IyBMyFpHIVAIV7fey3at6VSnlp1lVRCYD28QGFc/WG6QvMSx0UR
	8RUmD55Iy6E1taBo3t9ZzqNIKnU/p+0/5sqqmZxlZZJFN+Gi2SvCZ6R+w0l85mqsccRxZ+NGB1s
	fzSRXvG4khJGrQ3k3gO0aegeeyfCDkfrc1TmMF5f+CVcLg/M01f4ZTEi1VdDQqVmKmJ2YJ96YjB
	/n+o2wFRrpANcyw==
X-Google-Smtp-Source: AGHT+IHa/02Fw6j93Hfh95dLUIlVi1S/+h2tLhkgKWk84dGdKMZdIkeeq+IeCxGrjBLaV+pFCBwvtg==
X-Received: by 2002:a05:6a00:399e:b0:748:e38d:fed4 with SMTP id d2e1a72fcca58-75722d62254mr90783b3a.6.1752613784903;
        Tue, 15 Jul 2025 14:09:44 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a8d6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4b3b5sm12745770b3a.123.2025.07.15.14.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 14:09:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] clang: Upgrade to 20.1.8 release
Date: Tue, 15 Jul 2025 14:09:39 -0700
Message-ID: <20250715210939.3226204-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715210939.3226204-1-raj.khem@gmail.com>
References: <20250715210939.3226204-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 21:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220429

Brings following fixes

* 87f0227cb601 [InstCombine] Avoid folding `select(umin(X, Y), X)` with min/max values in false arm (#143020)
* df43f93388b7 [PhaseOrdering] Add test for #139050 (NFC)
* 25bcf1145fd7 [RISCV] Fix assertion failure when using -fstack-clash-protection (#135248)
* 6fb913d3e2ec [RelLookupTableConverter] Drop unnamed_addr for GVs in entries to avoid generating GOTPCREL relocations (#146068)
* 0c9f909b7976 [AArch64][SME] Fix restoring callee-saves from FP with hazard padding (#143371)
* fa792cd4c630 [AsmPrinter] Always emit global equivalents if there is non-global uses (#145648)
* ce455b382c08 [objcopy][MachO] Revert special handling of encryptable binaries (#144058)
* 0de59a293f7a [X86] Ignore NSW when DstSVT is i32 (#131755)
* 9af763f038f7 [gtest] Fix building on OpenBSD/sparc64 (#145225)
* 1daceb20611f [LoongArch] Pass OptLevel to LoongArchDAGToDAGISel correctly
* b21155f97a0a [LoongArch] Precommit test case to show bug in LoongArchISelDagToDag
* da18fb9f04ce [LoongArch] Fix xvshuf instructions lowering (#145868)
* 65ce78f338cf [LoongArch] Pre-commit test for fixing xvshuf instructions. NFC
* 5532d5b745e4 [AArch64] Ensure the LR is preserved if we must call __arm_get_current_vg (#145760)
* 5ac3ce819688 [WebAssembly] Fix inline assembly with vector types (#146574)
* b83658b7e2c8 Bump version to 20.1.8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index f49d7317ee9..6bfc2efb162 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -480,7 +480,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-20.1.7 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.8 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index cbea6b4d75a..b8f37daea24 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "20"
 MINOR_VER = "1"
-PATCH_VER = "7"
+PATCH_VER = "8"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index a9d6f899c03..d6393652f39 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/llvm-proje
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}.src"
-SRC_URI[sha256sum] = "cd8fd55d97ad3e360b1d5aaf98388d1f70dfffb7df36beee478be3b839ff9008"
+SRC_URI[sha256sum] = "6898f963c8e938981e6c4a302e83ec5beb4630147c7311183cf61069af16333d"
 
 SRC_URI = "\
     ${BASEURI} \

