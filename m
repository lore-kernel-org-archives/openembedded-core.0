Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BF1EB64DD
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 02:16:20 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.47080.1690596971315829757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 19:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nrIaeM0X;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686ba97e4feso2683666b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 19:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690596970; x=1691201770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=No/Vgn+VtoMMf5yMkUUQ2JMo6tYFqZcX+NRlQ1ICHLQ=;
        b=nrIaeM0XFmAuK/o77jNwR+XV+vLp1fYofj6KZFKd5y+UEDZGdPSbXjlg5x7kM3N4z9
         ustFCVFZos399RuurCpUkSK6Rme62fmP0MouvyhE0qBYtO7M6Pam4yqc4O+w1tkO8KTq
         G6vkLcNKZ9uCaUXJ6zxA3eOcU/0NgvQynQeN1+frA5rCSZCFMVgOXNbIDx5tQwPNW2KS
         5eATOjkJkHwhuaHZ71G89FmGwmz2S9+f+ncV9DxA5+lJgSJRHuP3ZN/Zc91WspBuHrB9
         UNA9Ypg9+EDyJ0tubWocykVWeYaDA2H6qAXYR/PczJFaquLS2Q60B/neOkXvdiWS8yCe
         pIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690596970; x=1691201770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=No/Vgn+VtoMMf5yMkUUQ2JMo6tYFqZcX+NRlQ1ICHLQ=;
        b=GaXuEMGkECkbuAkv1BEE+5Z8bJWSAPgVOLn9OaFltFheXpfSC2FGmNeD80KjEQbwMx
         TRs+nFZHdb4UPPQ1K48HEP21JHp6PQEi43sUQ9v1BJ3FVTLYWq9jWLKxukij4adQjws7
         c/FMUj6tHUXg7ixO4PeUfGCvpc9Zy3oAbwLscoTahIxhTMXLxhYSsuCov/202AnsYWfs
         h/1TYB0BH7sqgO1FrF2/5D6GqY0J5tzK26lXk7fiv+bvIApBq3/TvjTmKA+gt/9fW0ZG
         nSVFFIvnACKblxREB6W7bgeZTakViPe1N1Fxw2pBGTgKD8VF0psnM+0JUhRMcS7xGzFV
         hB1A==
X-Gm-Message-State: ABy/qLZeEJeR75shyGRe5I1MGTNyNj6gzV4EdntOdRtlft6/pYgB1jVg
	Wh/8VvJQB4sPvRuAkDoapY8N2Ql+PKr24A==
X-Google-Smtp-Source: APBJJlEBDTlo6cWWXAv5fgd5GTTMjIxOlO8HAakMBFHh8W81UIvJdzDYDBxkTAShH0cnQkhQZs/4sg==
X-Received: by 2002:a05:6a20:549a:b0:13c:ca8b:7e29 with SMTP id i26-20020a056a20549a00b0013cca8b7e29mr3206175pzk.12.1690596969933;
        Fri, 28 Jul 2023 19:16:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::d8d1])
        by smtp.gmail.com with ESMTPSA id ey13-20020a056a0038cd00b00682a908949bsm3894178pfb.92.2023.07.28.19.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 19:16:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc: Upgrade to 13.2 release
Date: Fri, 28 Jul 2023 19:16:06 -0700
Message-ID: <20230729021607.946070-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 02:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185043

This is a bugfix [1] release on GCC-13 release with 58 [2] bugs fixed

[1] https://gcc.gnu.org/pipermail/gcc-announce/2023/000179.html
[2] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=390723&resolution=FIXED&target_milestone=13.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 .../gcc/{gcc-13.1.inc => gcc-13.2.inc}        | 18 +++---
 ...ian_13.1.bb => gcc-cross-canadian_13.2.bb} |  0
 .../{gcc-cross_13.1.bb => gcc-cross_13.2.bb}  |  0
 ...-crosssdk_13.1.bb => gcc-crosssdk_13.2.bb} |  0
 ...cc-runtime_13.1.bb => gcc-runtime_13.2.bb} |  0
 ...itizers_13.1.bb => gcc-sanitizers_13.2.bb} |  0
 ...{gcc-source_13.1.bb => gcc-source_13.2.bb} |  0
 ...0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch | 10 +--
 .../0002-gcc-poison-system-directories.patch  |  8 +--
 .../gcc/gcc/0003-64-bit-multilib-hack.patch   |  2 +-
 ...R_BUILD-in-a-couple-of-places-to-avo.patch |  4 +-
 ...ts.h-in-B-instead-of-S-and-t-oe-in-B.patch |  4 +-
 .../gcc/gcc/0006-cpp-honor-sysroot.patch      |  4 +-
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 62 +++++++++++++++----
 .../gcc/gcc/0008-libtool.patch                |  2 +-
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  2 +-
 ...-config-files-from-B-instead-of-usin.patch |  2 +-
 ...1-aarch64-Fix-include-paths-when-S-B.patch |  4 +-
 ...ir-from-.la-which-usually-points-to-.patch |  2 +-
 ...e-target-gcc-headers-can-be-included.patch |  6 +-
 ...t-directory-during-relink-if-inst_pr.patch |  2 +-
 ...-fix-libcc1-s-install-path-and-rpath.patch |  2 +-
 ...le-sysroot-support-for-nativesdk-gcc.patch |  2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  5 +-
 ...d-to-link-commandline-for-musl-targe.patch |  4 +-
 ...Re-introduce-spe-commandline-options.patch |  2 +-
 ...as-for-__cpu_indicator_init-instead-.patch |  4 +-
 ...s-Do-not-use-__LINE__-for-maintainin.patch |  2 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch |  2 +-
 .../0023-Fix-install-path-of-linux64.h.patch  |  6 +-
 ...ardcoded-build-paths-into-ppc-libgcc.patch |  2 +-
 .../gcc/{gcc_13.1.bb => gcc_13.2.bb}          |  0
 ...initial_13.1.bb => libgcc-initial_13.2.bb} |  0
 .../gcc/{libgcc_13.1.bb => libgcc_13.2.bb}    |  0
 ...ibgfortran_13.1.bb => libgfortran_13.2.bb} |  0
 36 files changed, 101 insertions(+), 64 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-13.1.inc => gcc-13.2.inc} (91%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_13.1.bb => gcc-cross-canadian_13.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_13.1.bb => gcc-cross_13.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_13.1.bb => gcc-crosssdk_13.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_13.1.bb => gcc-runtime_13.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_13.1.bb => gcc-sanitizers_13.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_13.1.bb => gcc-source_13.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_13.1.bb => gcc_13.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_13.1.bb => libgcc-initial_13.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_13.1.bb => libgcc_13.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_13.1.bb => libgfortran_13.2.bb} (100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 408b2f64607..835ff7b5793 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -187,7 +187,7 @@ RECIPE_MAINTAINER:pn-gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <r
 RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gcc-source-13.1.1 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-gcc-source-13.2.0 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-gdb = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-devtools/gcc/gcc-13.1.inc b/meta/recipes-devtools/gcc/gcc-13.2.inc
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-13.1.inc
rename to meta/recipes-devtools/gcc/gcc-13.2.inc
index e94753eed06..7329562f657 100644
--- a/meta/recipes-devtools/gcc/gcc-13.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -2,11 +2,11 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "13.1.1"
+PV = "13.2.0"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "13.1.1"
+BINV = "13.2.0"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
 
@@ -30,14 +30,14 @@ LIC_FILES_CHKSUM = "\
 #SOURCEDIR ?= "official-gcc-${@'${RELEASE}'[0:7]}"
 
 # from snapshot
-RELEASE ?= "13-20230520"
-SOURCEDIR ?= "gcc-${RELEASE}"
-BASEURI ?= "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
+#RELEASE ?= "13-20230520"
+#SOURCEDIR ?= "gcc-${RELEASE}"
+#BASEURI ?= "https://gcc.gnu.org/pub/gcc/snapshots/${RELEASE}/gcc-${RELEASE}.tar.xz"
 
 # official release
-#RELEASE ?= "${PV}"
-#BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
-#SOURCEDIR ?= "gcc-${PV}"
+RELEASE ?= "${PV}"
+BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
+SOURCEDIR ?= "gcc-${PV}"
 
 SRC_URI = "${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
@@ -65,7 +65,7 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
 "
-SRC_URI[sha256sum] = "b8716f92e468086fca5aea8873f7405f1cd7d309ad0719f0a90c57b3483e448c"
+SRC_URI[sha256sum] = "e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_13.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_13.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_13.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_13.1.bb b/meta/recipes-devtools/gcc/gcc-cross_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_13.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_13.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_13.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_13.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_13.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_13.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_13.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_13.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_13.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_13.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_13.1.bb b/meta/recipes-devtools/gcc/gcc-source_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_13.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_13.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
index 0f1340491f5..5c75698edab 100644
--- a/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
+++ b/meta/recipes-devtools/gcc/gcc/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
@@ -1,4 +1,4 @@
-From 3875ab692a7d7ee796a6d5d2ece6daa3db81d5c4 Mon Sep 17 00:00:00 2001
+From 553564bdcabdcc5d4cc4de73c7eb94c505ef51f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 08:37:11 +0400
 Subject: [PATCH] gcc-4.3.1: ARCH_FLAGS_FOR_TARGET
@@ -12,10 +12,10 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 85883099410..044315af1da 100755
+index 117a7ef23f2..535265253fd 100755
 --- a/configure
 +++ b/configure
-@@ -10183,7 +10183,7 @@ fi
+@@ -10195,7 +10195,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
@@ -25,10 +25,10 @@ index 85883099410..044315af1da 100755
   *" newlib "*)
    case " $target_configargs " in
 diff --git a/configure.ac b/configure.ac
-index 2b612dce6e9..f26fffd4f62 100644
+index b3e9bbd2aa5..5ac8d6490f6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3339,7 +3339,7 @@ fi
+@@ -3351,7 +3351,7 @@ fi
  # for target_alias and gcc doesn't manage it consistently.
  target_configargs="--cache-file=./config.cache ${target_configargs}"
  
diff --git a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
index 6fa5494efc5..492300047da 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-gcc-poison-system-directories.patch
@@ -1,4 +1,4 @@
-From e09aa9c3565585390328dd514cc286c20b74e76a Mon Sep 17 00:00:00 2001
+From 52676b5934ba127c3af39fc484c8236c8fa60b96 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Mar 2021 16:04:20 -0800
 Subject: [PATCH] gcc: poison-system-directories
@@ -11,7 +11,7 @@ aborted.
 Instead, we add the two missing items to the current scan.  If the user
 wants this to be a failure, they can add "-Werror=poison-system-directories".
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [OE configuration]
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
@@ -132,7 +132,7 @@ index 09082e8ccae..6cd01a8966b 100644
  AC_SUBST(subdirs)
  AC_SUBST(srcdir)
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index c9482886c5a..f302c637908 100644
+index de40f62e219..d6f203c8b71 100644
 --- a/gcc/doc/invoke.texi
 +++ b/gcc/doc/invoke.texi
 @@ -384,6 +384,7 @@ Objective-C and Objective-C++ Dialects}.
@@ -143,7 +143,7 @@ index c9482886c5a..f302c637908 100644
  -Wno-pragmas  -Wno-prio-ctor-dtor  -Wredundant-decls
  -Wrestrict  -Wno-return-local-addr  -Wreturn-type
  -Wno-scalar-storage-order  -Wsequence-point
-@@ -8422,6 +8423,14 @@ made up of data only and thus requires no special treatment.  But, for
+@@ -8426,6 +8427,14 @@ made up of data only and thus requires no special treatment.  But, for
  most targets, it is made up of code and thus requires the stack to be
  made executable in order for the program to work properly.
  
diff --git a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
index d547d7e48a3..3b3eec20271 100644
--- a/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
+++ b/meta/recipes-devtools/gcc/gcc/0003-64-bit-multilib-hack.patch
@@ -1,4 +1,4 @@
-From 86664e09670efa5a8662ef59590e01707f8e0cc3 Mon Sep 17 00:00:00 2001
+From febfac59d0e8a864370d0b4018b4e497ceec156d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:10:06 +0400
 Subject: [PATCH] 64-bit multilib hack
diff --git a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
index d749ff12d48..7e33bf17b07 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-Pass-CXXFLAGS_FOR_BUILD-in-a-couple-of-places-to-avo.patch
@@ -1,4 +1,4 @@
-From 2a1336d2e2ba08747acd7368264fc5813a37b049 Mon Sep 17 00:00:00 2001
+From 6fbf920ccde6efc2d0caafde996d9e5738a1ba37 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 28 Oct 2021 11:33:40 +0100
 Subject: [PATCH] Pass CXXFLAGS_FOR_BUILD in a couple of places to avoid these
@@ -13,7 +13,7 @@ ChangeLog:
     * Makefile.in: Regenerate.
     * Makefile.tpl: Add missing CXXFLAGS_FOR_BUILD overrides
 
-Upstream-Status: Pending [should be submittable]
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023-February/612560.html]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
diff --git a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
index 2eba38e3759..db2fea3d165 100644
--- a/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0005-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
@@ -1,4 +1,4 @@
-From 6cce395992a1b573e6795fdad2f9086db921e924 Mon Sep 17 00:00:00 2001
+From 2cedf13819c0cc929660072d8a972f5e422f9701 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:17:25 +0400
 Subject: [PATCH] Use the defaults.h in ${B} instead of ${S}, and t-oe in ${B}
@@ -26,7 +26,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  4 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index ad9a5d94cd0..fe636af3f63 100644
+index 775aaa1b3c4..04f28984b34 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -561,7 +561,7 @@ TARGET_SYSTEM_ROOT = @TARGET_SYSTEM_ROOT@
diff --git a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
index 3887aa3a055..704c44cb72f 100644
--- a/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc/0006-cpp-honor-sysroot.patch
@@ -1,4 +1,4 @@
-From 223ff12852a8c8974f6e542ee3a8b276639d2452 Mon Sep 17 00:00:00 2001
+From f0b4d02a3a3dca1d67fd7add15ed63c2cd572bb9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:22:00 +0400
 Subject: [PATCH] cpp: honor sysroot.
@@ -17,7 +17,7 @@ The fix below adds %I to the cpp-output spec macro so the default substitutions
 
 RP 2012/04/13
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index e3af0bf161f..079142c5409 100644
--- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From ba2e308f7993099708ef3d8cbf2db5f134f08941 Mon Sep 17 00:00:00 2001
+From aacfd6e14dd583b1fdc65691def61c5e1bc89708 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
@@ -35,6 +35,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gcc/config/sparc/linux64.h         |  4 ++--
  18 files changed, 53 insertions(+), 58 deletions(-)
 
+diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch64-linux.h
+index 4277f03da2a..e4c92c03291 100644
 --- a/gcc/config/aarch64/aarch64-linux.h
 +++ b/gcc/config/aarch64/aarch64-linux.h
 @@ -21,10 +21,10 @@
@@ -50,9 +52,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #undef  ASAN_CC1_SPEC
  #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
+diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
+index 03f783f2ad1..4fa02668aa7 100644
 --- a/gcc/config/alpha/linux-elf.h
 +++ b/gcc/config/alpha/linux-elf.h
-@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
+@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
  #define EXTRA_SPECS \
  { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
  
@@ -63,6 +67,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #if DEFAULT_LIBC == LIBC_UCLIBC
  #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
  #elif DEFAULT_LIBC == LIBC_GLIBC
+diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
+index a119875599d..dce7f59eeea 100644
 --- a/gcc/config/arm/linux-eabi.h
 +++ b/gcc/config/arm/linux-eabi.h
 @@ -62,8 +62,8 @@
@@ -85,6 +91,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
     use the GNU/Linux version, not the generic BPABI version.  */
+diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
+index 7b7b7cbbe14..98ef2267117 100644
 --- a/gcc/config/arm/linux-elf.h
 +++ b/gcc/config/arm/linux-elf.h
 @@ -60,7 +60,7 @@
@@ -96,9 +104,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #define LINUX_TARGET_LINK_SPEC  "%{h*} \
     %{static:-Bstatic} \
+diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
+index bbb7cc7115e..7d9272040ee 100644
 --- a/gcc/config/i386/linux.h
 +++ b/gcc/config/i386/linux.h
-@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.
+@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
  <http://www.gnu.org/licenses/>.  */
  
  #define GNU_USER_LINK_EMULATION "elf_i386"
@@ -108,9 +118,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #undef MUSL_DYNAMIC_LINKER
 -#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
 +#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
+diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
+index 2bd9f48e271..dbbe7ca5440 100644
 --- a/gcc/config/i386/linux64.h
 +++ b/gcc/config/i386/linux64.h
-@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI
+@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
  #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
  #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
  
@@ -130,9 +142,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #undef MUSL_DYNAMIC_LINKERX32
 -#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
 +#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index e3aca79cccc..6491c6b84f5 100644
 --- a/gcc/config/linux.h
 +++ b/gcc/config/linux.h
-@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTI
+@@ -86,10 +86,10 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
     GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
     GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
     supporting both 32-bit and 64-bit compilation.  */
@@ -147,9 +161,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
  #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
+diff --git a/gcc/config/loongarch/gnu-user.h b/gcc/config/loongarch/gnu-user.h
+index aecaa02a199..62f88f7f9a2 100644
 --- a/gcc/config/loongarch/gnu-user.h
 +++ b/gcc/config/loongarch/gnu-user.h
-@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.
+@@ -31,11 +31,11 @@ along with GCC; see the file COPYING3.  If not see
  
  #undef GLIBC_DYNAMIC_LINKER
  #define GLIBC_DYNAMIC_LINKER \
@@ -163,6 +179,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #undef GNU_USER_TARGET_LINK_SPEC
  #define GNU_USER_TARGET_LINK_SPEC \
+diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux.h
+index e2e2c421c52..6f26480e3b5 100644
 --- a/gcc/config/microblaze/linux.h
 +++ b/gcc/config/microblaze/linux.h
 @@ -28,7 +28,7 @@
@@ -183,9 +201,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #undef  SUBTARGET_EXTRA_SPECS
  #define SUBTARGET_EXTRA_SPECS \
+diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
+index 5add34ea134..34692b433b8 100644
 --- a/gcc/config/mips/linux.h
 +++ b/gcc/config/mips/linux.h
-@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.
+@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.  If not see
  #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
  
  #define GLIBC_DYNAMIC_LINKER32 \
@@ -224,6 +244,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
  #define GNU_USER_DYNAMIC_LINKERN32 \
+diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
+index 2ce097ebbce..1d45d7b4962 100644
 --- a/gcc/config/nios2/linux.h
 +++ b/gcc/config/nios2/linux.h
 @@ -29,10 +29,10 @@
@@ -239,9 +261,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #undef LINK_SPEC
  #define LINK_SPEC LINK_SPEC_ENDIAN \
+diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
+index 3e625e0f867..dc3afc97e27 100644
 --- a/gcc/config/riscv/linux.h
 +++ b/gcc/config/riscv/linux.h
-@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
+@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
      GNU_USER_TARGET_OS_CPP_BUILTINS();				\
    } while (0)
  
@@ -250,7 +274,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #define MUSL_ABI_SUFFIX \
    "%{mabi=ilp32:-sf}" \
-@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.
+@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.  If not see
    "%{mabi=lp64d:}"
  
  #undef MUSL_DYNAMIC_LINKER
@@ -259,6 +283,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #define ICACHE_FLUSH_FUNC "__riscv_flush_icache"
  
+diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
+index 9e457033d11..2ddab7c99c1 100644
 --- a/gcc/config/rs6000/linux64.h
 +++ b/gcc/config/rs6000/linux64.h
 @@ -339,24 +339,19 @@ extern int dot_symbols;
@@ -291,6 +317,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #undef  DEFAULT_ASM_ENDIAN
  #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
+diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
+index ae932fc22f0..26db003cb3a 100644
 --- a/gcc/config/rs6000/sysv4.h
 +++ b/gcc/config/rs6000/sysv4.h
 @@ -771,10 +771,10 @@ GNU_USER_TARGET_CC1_SPEC
@@ -306,9 +334,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #ifndef GNU_USER_DYNAMIC_LINKER
  #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
+diff --git a/gcc/config/s390/linux.h b/gcc/config/s390/linux.h
+index 02aa1edaff8..fab268d61f4 100644
 --- a/gcc/config/s390/linux.h
 +++ b/gcc/config/s390/linux.h
-@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.
+@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.  If not see
  #define MULTILIB_DEFAULTS { "m31" }
  #endif
  
@@ -326,9 +356,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #undef  LINK_SPEC
  #define LINK_SPEC \
+diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
+index 29f5902b98b..83d1e53e6e2 100644
 --- a/gcc/config/sh/linux.h
 +++ b/gcc/config/sh/linux.h
-@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.
+@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.  If not see
  
  #undef MUSL_DYNAMIC_LINKER
  #define MUSL_DYNAMIC_LINKER \
@@ -341,9 +373,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #undef SUBTARGET_LINK_EMUL_SUFFIX
  #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
+diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
+index 0e33b3cac2c..84f29adbb35 100644
 --- a/gcc/config/sparc/linux.h
 +++ b/gcc/config/sparc/linux.h
-@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu
+@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, const char **argv);
     When the -shared link option is used a final link is not being
     done.  */
  
@@ -352,9 +386,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  #undef  LINK_SPEC
  #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
+diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
+index f1cc0a19e49..94bc2032803 100644
 --- a/gcc/config/sparc/linux64.h
 +++ b/gcc/config/sparc/linux64.h
-@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.
+@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
     When the -shared link option is used a final link is not being
     done.  */
  
diff --git a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
index 72248e64b1f..5b44dc809e8 100644
--- a/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
+++ b/meta/recipes-devtools/gcc/gcc/0008-libtool.patch
@@ -1,4 +1,4 @@
-From 5ce9e36a87974ce5c1c1adb6e4390350233d8770 Mon Sep 17 00:00:00 2001
+From 7608e93ab97e8c33e3b14323d0cabc651926e403 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:29:11 +0400
 Subject: [PATCH] libtool
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
index 871a634d14b..86542bd146f 100644
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
@@ -1,4 +1,4 @@
-From 37c7471aa476dfc591a7123e39e38ef8b049f5c0 Mon Sep 17 00:00:00 2001
+From 4b0efc18e0d91967a3db11d9ef0595a5a76ad67a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:30:32 +0400
 Subject: [PATCH] gcc: armv4: pass fix-v4bx to linker to support EABI.
diff --git a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
index a88abc2fad6..bc3943087c5 100644
--- a/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0010-Use-the-multilib-config-files-from-B-instead-of-usin.patch
@@ -1,4 +1,4 @@
-From 2be15956b4051680aa8da9df97ef032ac8616fb1 Mon Sep 17 00:00:00 2001
+From b015460586e2ea8a35a11d1a607728707bdf6509 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:33:04 +0400
 Subject: [PATCH] Use the multilib config files from ${B} instead of using the
diff --git a/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
index f52e21edc20..974aca5ee41 100644
--- a/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
+++ b/meta/recipes-devtools/gcc/gcc/0011-aarch64-Fix-include-paths-when-S-B.patch
@@ -1,4 +1,4 @@
-From 710d1325474e708e6b34eebe09f3f130420af293 Mon Sep 17 00:00:00 2001
+From b7ce05b2d969b311c6061bda32c3117c76bf7e0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 31 Jan 2023 22:03:38 -0800
 Subject: [PATCH] aarch64: Fix include paths when S != B
@@ -28,7 +28,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
-index 155cace6afe..07d68958908 100644
+index 73b09e20508..10ea3672f20 100644
 --- a/gcc/config/aarch64/aarch64.h
 +++ b/gcc/config/aarch64/aarch64.h
 @@ -161,8 +161,8 @@
diff --git a/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
index b05be59c72c..cf5efcd32db 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
@@ -1,4 +1,4 @@
-From e8e8a0ab572cfceb9758f99599c0db4c962e49c0 Mon Sep 17 00:00:00 2001
+From 39ab6fe76f2788b2c989d29c9016f1fe53cb736e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 09:39:38 +0000
 Subject: [PATCH] Avoid using libdir from .la which usually points to a host
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
index b9a3f05df8b..e2343a3c173 100644
--- a/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0013-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 93ad7cf3ff92771451c2994cab45e34a0c8574a0 Mon Sep 17 00:00:00 2001
+From 531b9df680c4380797e8e7705a8e7f8ed17ebe68 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -13,7 +13,7 @@ command line in order to resolve this.
 
 Extend target gcc headers search to musl too
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 22 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index fe636af3f63..065ce7e9a5b 100644
+index 04f28984b34..8ef996c0f4d 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
 @@ -640,6 +640,7 @@ libexecdir = @libexecdir@
diff --git a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
index 5de0e3e982a..30224d74854 100644
--- a/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
+++ b/meta/recipes-devtools/gcc/gcc/0014-Don-t-search-host-directory-during-relink-if-inst_pr.patch
@@ -1,4 +1,4 @@
-From e0775b77b8d10066e27ab89d15441b39024a29fd Mon Sep 17 00:00:00 2001
+From 793201cebfeb129f6f263e64310b30a0ffa48895 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Mar 2015 08:21:19 +0000
 Subject: [PATCH] Don't search host directory during "relink" if $inst_prefix
diff --git a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
index f1eee4a833b..33c601ac970 100644
--- a/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
+++ b/meta/recipes-devtools/gcc/gcc/0015-libcc1-fix-libcc1-s-install-path-and-rpath.patch
@@ -1,4 +1,4 @@
-From 7776c630e2560bacff7d1e9b04e7916ed4c05d00 Mon Sep 17 00:00:00 2001
+From 5de63874335c1c673dd132f6aca00dc13f1eac51 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Sun, 5 Jul 2015 20:25:18 -0700
 Subject: [PATCH] libcc1: fix libcc1's install path and rpath
diff --git a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
index e05fd4e6a29..bdffcae7dcd 100644
--- a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 4f9c952ad5fa68260d6a40570b0fdb7359c85057 Mon Sep 17 00:00:00 2001
+From bbc75b93bff66891fa7ffb3af5c6ad53df1fff68 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
diff --git a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
index d0aeeb27696..8a11049ca37 100644
--- a/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
+++ b/meta/recipes-devtools/gcc/gcc/0017-Search-target-sysroot-gcc-version-specific-dirs-with.patch
@@ -1,7 +1,8 @@
-From 0058f8a2233d9e96e39d09f4d994da3c96f9e030 Mon Sep 17 00:00:00 2001
+From 7e095089452b6e895ec40981752e9f902f0ad889 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:41:45 +0000
-Subject: [PATCH] Search target sysroot gcc version specific dirs with multilib.
+Subject: [PATCH] Search target sysroot gcc version specific dirs with
+ multilib.
 
 We install the gcc libraries (such as crtbegin.p) into
 <sysroot><libdir>/<target-sys>/5.2.0/
diff --git a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
index 9545e76b05a..9bc77b485fd 100644
--- a/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
+++ b/meta/recipes-devtools/gcc/gcc/0018-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
@@ -1,4 +1,4 @@
-From 0a194b74f0f171b46527ff447c27fbf32406333d Mon Sep 17 00:00:00 2001
+From bf92b290556b7050df0a001cc7ae43cf79990456 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 27 Jun 2017 18:10:54 -0700
 Subject: [PATCH] Add ssp_nonshared to link commandline for musl targets
@@ -13,7 +13,7 @@ are already present in libc_nonshared library therefore
 we do not need any library helper on glibc based systems
 but musl needs the libssp_noshared from gcc
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023-April/615317.html]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
index 409dff3b7eb..f7856886613 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Re-introduce-spe-commandline-options.patch
@@ -1,4 +1,4 @@
-From 0b83874fd8e767248adffd616bcd07aa438b6905 Mon Sep 17 00:00:00 2001
+From 587ac4a59ea56da18a9989c31a75124e974cb37c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 6 Jun 2018 12:10:22 -0700
 Subject: [PATCH] Re-introduce spe commandline options
diff --git a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
index 205fdb66c9c..b86edab5d57 100644
--- a/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
+++ b/meta/recipes-devtools/gcc/gcc/0020-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
@@ -1,4 +1,4 @@
-From d8b6f60d1206a67c640096bac3b348828914163c Mon Sep 17 00:00:00 2001
+From 8c4c59521720f8c1b1e38e38896b47fcb1bf00ac Mon Sep 17 00:00:00 2001
 From: Szabolcs Nagy <nsz@port70.net>
 Date: Sat, 24 Oct 2015 20:09:53 +0000
 Subject: [PATCH] libgcc_s: Use alias for __cpu_indicator_init instead of
@@ -29,7 +29,7 @@ gcc/Changelog:
 	* config/i386/i386-expand.c (ix86_expand_builtin): Make __builtin_cpu_init
 	call __cpu_indicator_init_local instead of __cpu_indicator_init.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2023-February/612559.html]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
index 43df7fcb715..b6707592dc9 100644
--- a/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
+++ b/meta/recipes-devtools/gcc/gcc/0021-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch
@@ -1,4 +1,4 @@
-From 18f400d6c91b800361af633b6b93a9e5881bbb0f Mon Sep 17 00:00:00 2001
+From f15b19d8e058c983c49c4566c1879fdaf5b1ab54 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 10 Mar 2020 08:26:53 -0700
 Subject: [PATCH] gentypes/genmodes: Do not use __LINE__ for maintaining
diff --git a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
index cb8969b193a..0ea8aac543a 100644
--- a/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
+++ b/meta/recipes-devtools/gcc/gcc/0022-libatomic-Do-not-enforce-march-on-aarch64.patch
@@ -1,4 +1,4 @@
-From c3870d073eb9e5d82f9d3067d0fa15038b69713a Mon Sep 17 00:00:00 2001
+From 939a899b862f7a25e52b74d1587fc75fc65779c0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 13 May 2020 15:10:38 -0700
 Subject: [PATCH] libatomic: Do not enforce march on aarch64
diff --git a/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
index 11f42c59c43..cd962d82bd4 100644
--- a/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
+++ b/meta/recipes-devtools/gcc/gcc/0023-Fix-install-path-of-linux64.h.patch
@@ -1,4 +1,4 @@
-From 7bd6e631e4a5273f5ecc41a5a48830a1342e5926 Mon Sep 17 00:00:00 2001
+From 696d696381dd99ec2bddb1170f96f98da36eb418 Mon Sep 17 00:00:00 2001
 From: Andrei Gherzan <andrei.gherzan@huawei.com>
 Date: Wed, 22 Dec 2021 12:49:25 +0100
 Subject: [PATCH] Fix install path of linux64.h
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
-index 065ce7e9a5b..d4c723968aa 100644
+index 8ef996c0f4d..21daf380e34 100644
 --- a/gcc/Makefile.in
 +++ b/gcc/Makefile.in
-@@ -3738,6 +3738,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+@@ -3731,6 +3731,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
  	  "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
  	  | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
  	    base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
diff --git a/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
index ad8269016f0..04d940ae0b0 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch
@@ -1,4 +1,4 @@
-From 4623d87d779853a2862ee92a15a41fded81eddb8 Mon Sep 17 00:00:00 2001
+From 9487b1d6136ea09cce4792d59d0170c712575550 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 20 Aug 2022 09:04:14 -0700
 Subject: [PATCH] Avoid hardcoded build paths into ppc libgcc
diff --git a/meta/recipes-devtools/gcc/gcc_13.1.bb b/meta/recipes-devtools/gcc/gcc_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_13.1.bb
rename to meta/recipes-devtools/gcc/gcc_13.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_13.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_13.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_13.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_13.1.bb b/meta/recipes-devtools/gcc/libgcc_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_13.1.bb
rename to meta/recipes-devtools/gcc/libgcc_13.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_13.1.bb b/meta/recipes-devtools/gcc/libgfortran_13.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_13.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_13.2.bb
-- 
2.41.0


