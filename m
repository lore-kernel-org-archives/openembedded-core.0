Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074A7C6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 09:21:04 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.3488.1680859260233777750
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 02:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DoUD83ts;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: yashinde145@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id z19so39587036plo.2
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680859259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9DENZDyNp8e02g/LGIlWtKdJfYbST6y2Mt9NiDz+Hk=;
        b=DoUD83tsUUqMAQ/wzDg5oXCxHfW2Fg3PF+BTQqtKKq6a8OCFCGoiH7/jVv6/nLh7pD
         V6c7hCzcej1Hh4dicEkxOTDU05LKaxvSfeoYSRZ5YVzoIZY/iHWMEUCLQ73Bq0a0lUT5
         5JtsKw5ne5zSsZQwGVeBN38hhpXYTqkpnMBCJTKOXwI4IWCpa853LytINlyfHJgVDPwL
         erPdwZTj2R21AXUtxAOroHSKnZL5Wr7Kk7zKJjTAtXidSdvs+0qvs9L2jloBsHQyHx+u
         pI4FbrUoiRnOOp+X72xFpj6d4fdJ+6ptMM0iJPNBYryLg5iA2H5qcERmgRNnabjhMX2u
         z6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680859259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9DENZDyNp8e02g/LGIlWtKdJfYbST6y2Mt9NiDz+Hk=;
        b=bBls69z3hnQRKXWLnkBuDOtXjbh+a7L60baLwjSO3ga/YpX7ub7xAZveO1oXT2trr5
         hWeJcIK9WZo9TOG6+icpTHYIB80Qvh0kaJGEzGf3ZbMAnQXToIT/EEJxHTFtr7FfIpL1
         Xv72O/nBw7wXiso87Avtov8Oa7kxYSQTnlqv8Zu0A1skOGTXBRaf9LEcBL0/sciwpWXY
         3jeZVZgTsedt5app8je9OwSP3sP/oJOaIh2OGWll7K1jNSJjYBqWI5zWIRqgTm/NG/Fz
         //bmNty95PuoRBhkfWs/5dU7Vynv8CKWtC8L3ZG0qeshMZsKBlaoe+oW/eO1RdQ6d6Jz
         WdXg==
X-Gm-Message-State: AAQBX9cEGEOVzGztr8RnMYHVphd3MEkZL/qJ7eKbqdhX/lT85ixhFxbi
	R+7xkUqyD2u/TqVvSe9v+P/j8xLsqfRx1Q==
X-Google-Smtp-Source: AKy350Yge3UyKPbvt+fitPgwEuOpI2p+QwQVctr+CfFlVqrJcKm3+SRBjTHGMlvHraeR8XL0X1OUDw==
X-Received: by 2002:a17:90b:1c91:b0:22b:b832:d32 with SMTP id oo17-20020a17090b1c9100b0022bb8320d32mr1895116pjb.9.1680859259214;
        Fri, 07 Apr 2023 02:20:59 -0700 (PDT)
Received: from bft-2.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id k60-20020a17090a4cc200b0023f5c867f82sm4239896pjh.41.2023.04.07.02.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:20:58 -0700 (PDT)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com,
	Sundeep.Kokkonda@windriver.com,
	Yash.Shinde@windriver.com
Subject: [PATCH] gcc: Upstream-Status patch updates for GCC.
Date: Fri,  7 Apr 2023 14:50:33 +0530
Message-Id: <20230407092033.3185439-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 09:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179815

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../gcc/gcc/0002-gcc-poison-system-directories.patch         | 3 ++-
 ...ass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch | 2 +-
 ...-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch | 2 +-
 meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch   | 2 +-
 meta/recipes-devtools/gcc/gcc/0008-libtool.patch             | 2 +-
 ...9-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch | 2 +-
 .../gcc/0013-Ensure-target-gcc-headers-can-be-included.patch | 2 +-
 ...earch-target-sysroot-gcc-version-specific-dirs-with.patch | 2 +-
 ...dd-ssp_nonshared-to-link-commandline-for-musl-targe.patch | 2 +-
 ...ibgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch | 2 +-
 meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch      | 5 +++--
 11 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index 5aa635b3d4..02135b7324 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -11,7 +11,8 @@ aborted.
 Instead, we add the two missing items to the current scan.  If the user
 wants this to be a failure, they can add "-Werror=poison-system-directories".
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [OE configuration]
+
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
index e8f2163476..026f946b4d 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
@@ -13,7 +13,7 @@ ChangeLog:
     * Makefile.in: Regenerate.
     * Makefile.tpl: Add missing CXXFLAGS_FOR_BUILD overrides
 
-Upstream-Status: Pending [should be submittable]
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023-February/612560.html]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index e34eb2cf3f..8a3f0ffa6a 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -9,7 +9,7 @@ gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
 
 While compiling gcc-crosssdk-initial-x86_64 on some host, there is
 occasionally failure that test the existance of default.h doesn't
diff --git a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
index b08aecc736..9af82abaae 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
@@ -19,7 +19,7 @@ RP 2012/04/13
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
 ---
  gcc/cp/lang-specs.h | 2 +-
  gcc/gcc.cc          | 2 +-
diff --git a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
index c9bc38ccf0..9e1d6dd0a3 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
@@ -17,7 +17,7 @@ RP 2012/8/24
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2023-04/msg00000.html]
 ---
  ltmain.sh | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index dd67b115f0..d2d6c8f289 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -13,7 +13,7 @@ We might want to send it upstream.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023-April/615319.html]
 ---
  gcc/config/arm/linux-eabi.h | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
index 61e61ecc6e..cee447b310 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
@@ -13,7 +13,7 @@ command line in order to resolve this.
 
 Extend target gcc headers search to musl too
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index 9b05da64a7..6fca63a494 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -42,7 +42,7 @@ binaries can be found first. With this change the search path becomes:
 <sysroot>/lib32/
 <sysroot>/usr/lib32/
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023-April/615320.html]
 RP 2015/7/31
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 56793e03a3..b4b820b22c 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -13,7 +13,7 @@ are already present in libc_nonshared library therefore
 we do not need any library helper on glibc based systems
 but musl needs the libssp_noshared from gcc
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023-April/615317.html]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index f37092089f..7ee0342d87 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -29,7 +29,7 @@ gcc/Changelog:
 	* config/i386/i386-expand.c (ix86_expand_builtin): Make __builtin_cpu_init
 	call __cpu_indicator_init_local instead of __cpu_indicator_init.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023-February/612559.html]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
index 7f1a2deec7..23ae00ce40 100644
--- a/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/prefix-map-realpath.patch
@@ -7,8 +7,9 @@ Instead, call gcc's realpath function on the incomming path name before
 comparing it with the remapping. This means other issues like symlinks
 are also accounted for and leads to a more consistent remapping experience.
 
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2022-August/599885.html]
-[Also https://gcc.gnu.org/pipermail/gcc-patches/2022-August/599884.html]
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=11543b27fe16d81ca5483ecb98ec7a5b2426e0c0]
+                          [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5c15eb183f17e806ad6b58c9497321ded87866f]
+
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 
-- 
2.34.1


