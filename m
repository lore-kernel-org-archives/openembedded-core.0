Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1521BC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235503999"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235503999"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298140"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:00 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 17/33] systemd: update 249.6 -> 249.7
Date: Thu,  9 Dec 2021 09:29:16 +0800
Message-Id: 
 <9cdcf59e3356a18ec576eacb5df667682741f374.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159418

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5671ef44cf85df00406b391f7786ffaefd05a701)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{systemd-boot_249.6.bb => systemd-boot_249.7.bb}      | 0
 meta/recipes-core/systemd/systemd.inc                     | 2 +-
 .../systemd/0002-don-t-use-glibc-specific-qsort_r.patch   | 2 +-
 ...ing_type.h-add-__compare_fn_t-and-comparison_fn_.patch | 2 +-
 ...-add-fallback-parse_printf_format-implementation.patch | 2 +-
 ...5-src-basic-missing.h-check-for-missing-strndupa.patch | 8 ++++----
 .../systemd/systemd/0006-Include-netinet-if_ether.h.patch | 2 +-
 ...t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch | 2 +-
 .../systemd/0008-add-missing-FTW_-macros-for-musl.patch   | 2 +-
 ...missing-of-__register_atfork-for-non-glibc-build.patch | 2 +-
 .../systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch  | 2 +-
 ...-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch | 2 +-
 ...don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch | 2 +-
 ...ne-glibc-compatible-basename-for-non-glibc-syste.patch | 2 +-
 ...ot-disable-buffering-when-writing-to-oom_score_a.patch | 2 +-
 ...inguish-XSI-compliant-strerror_r-from-GNU-specif.patch | 2 +-
 ...e-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch | 2 +-
 ...17-missing_type.h-add-__compar_d_fn_t-definition.patch | 2 +-
 ...018-avoid-redefinition-of-prctl_mm_map-structure.patch | 2 +-
 .../systemd/systemd/0019-Handle-missing-LOCK_EX.patch     | 2 +-
 ...Fix-incompatible-pointer-type-struct-sockaddr_un.patch | 2 +-
 .../systemd/systemd/0021-test-json.c-define-M_PIl.patch   | 2 +-
 .../0022-do-not-disable-buffer-in-writing-files.patch     | 4 ++--
 .../systemd/systemd/0025-Handle-__cpu_mask-usage.patch    | 2 +-
 .../systemd/systemd/0026-Handle-missing-gshadow.patch     | 2 +-
 ...ssing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch | 2 +-
 .../systemd/{systemd_249.6.bb => systemd_249.7.bb}        | 0
 27 files changed, 29 insertions(+), 29 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_249.6.bb => systemd-boot_249.7.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_249.6.bb => systemd_249.7.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.6.bb b/meta/recipes-core/systemd/systemd-boot_249.7.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_249.6.bb
rename to meta/recipes-core/systemd/systemd-boot_249.7.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index f3ce32efc2..b77f847abd 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "deda69dad784f9c4367533555ff4d7bf6308c0ff"
+SRCREV = "d4406e94a32d423d8a73deb7757fb09890afe2c4"
 SRCBRANCH = "v249-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index 47ac24ab04..d03a1d9e76 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,4 +1,4 @@
-From 10e00305eef277310e9cbb219080b53ea6ea9c6f Mon Sep 17 00:00:00 2001
+From 5d730902f47498a2866b46875352f6810a01d67c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
 Subject: [PATCH] don't use glibc-specific qsort_r
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index 26f05fd50a..eca52d0bda 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -1,4 +1,4 @@
-From 8a64ec1087c161be3985f16e7f37e1beed6623f6 Mon Sep 17 00:00:00 2001
+From 3b42a888685aee1776a12cff84a5fe0063378483 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 51cfc355c0..40ee43b155 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From b5e4f966f95ddb793316fe9d494a8a4c56247e23 Mon Sep 17 00:00:00 2001
+From 3e0df2c22bfd37bc62bf09a01ec498e40d3599de Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
 Subject: [PATCH] add fallback parse_printf_format implementation
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 32b5090d8f..efdd43708b 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 0dfa2bcd34e10b354177a988c8be433de782f1c7 Mon Sep 17 00:00:00 2001
+From cef23a651ea200e30e1e6ed2a2564505e3a42d46 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -165,7 +165,7 @@ index f91f8f7a08..fb31596216 100644
  int mkdir_safe_internal(
                  const char *path,
 diff --git a/src/basic/mountpoint-util.c b/src/basic/mountpoint-util.c
-index e7a5a99551..3cc157f248 100644
+index 7e57d9a226..c0e64f2aca 100644
 --- a/src/basic/mountpoint-util.c
 +++ b/src/basic/mountpoint-util.c
 @@ -11,6 +11,7 @@
@@ -393,7 +393,7 @@ index bfd42aea7d..daefc56e3e 100644
  static int node_vtable_get_userdata(
                  sd_bus *bus,
 diff --git a/src/libsystemd/sd-bus/bus-socket.c b/src/libsystemd/sd-bus/bus-socket.c
-index 378774fe8b..2694c177d5 100644
+index 09eb49c37f..82f1b3d1be 100644
 --- a/src/libsystemd/sd-bus/bus-socket.c
 +++ b/src/libsystemd/sd-bus/bus-socket.c
 @@ -27,6 +27,7 @@
@@ -405,7 +405,7 @@ index 378774fe8b..2694c177d5 100644
  #define SNDBUF_SIZE (8*1024*1024)
  
 diff --git a/src/libsystemd/sd-bus/sd-bus.c b/src/libsystemd/sd-bus/sd-bus.c
-index a32e2f5e20..97fd3aec82 100644
+index ab8d4e4a60..7e35fbe9e6 100644
 --- a/src/libsystemd/sd-bus/sd-bus.c
 +++ b/src/libsystemd/sd-bus/sd-bus.c
 @@ -42,6 +42,7 @@
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index 21d42e38ba..3875753ff4 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,4 +1,4 @@
-From a434f2b4815a48d4cf007482ef64c288c73e120f Mon Sep 17 00:00:00 2001
+From a3be3b7160856ffb8259ede9e2e0168d74bf126e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Oct 2017 22:10:42 -0700
 Subject: [PATCH] Include netinet/if_ether.h
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 7edd5452e7..1d8c481467 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From d566c9afe3a397b3323612641f49e12934c29b6a Mon Sep 17 00:00:00 2001
+From fb068403b25002156435350165ea418a6338a313 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index ecca9682ce..c613581ef9 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From 0c49f309d60aa3751add1b8261bc69840e269c50 Mon Sep 17 00:00:00 2001
+From 7ca9887f84adba065dc2e59b3de55ace2fc72ec0 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 8dfb56fc03..0fc320420e 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,4 +1,4 @@
-From 2d9f6863b676185d43775503cd9b41c74996c543 Mon Sep 17 00:00:00 2001
+From c7453b716ae308b89cf4b2b231a36ddd38a49752 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
 Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index e5e54ce12b..ff981b8c74 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From 7a333b5d0fdf99fc9667ed79dca2b8610b353ea3 Mon Sep 17 00:00:00 2001
+From 856010e268a6aca8e5f02502457afe289bd877f1 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index ac82d4b1ef..0ee871c92d 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,4 +1,4 @@
-From c79b81aea40f3b9edfa208f1350c9c6e4405ee82 Mon Sep 17 00:00:00 2001
+From ad395dda5db9b1ae156be121cfc8a38960de6c55 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
 Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 89f2730d6e..12a92b8739 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From ff17c6edd025250802b41d645d915fe89667e775 Mon Sep 17 00:00:00 2001
+From 5d4c6b2f4b88b69b31f967371d2a6136c65dc3fd Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index fffb89b079..bd7a0c4e8e 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From f8d43bdb082b042f292b57b1b9434eed90160726 Mon Sep 17 00:00:00 2001
+From 1803ea271b93370fdcf7ec497277344f1e775429 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index ea2bbe8a9f..7933b9e76e 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From a3c31153614dfdb033cffa51ef27593cbc422e5b Mon Sep 17 00:00:00 2001
+From 30b08f76ea7f5c324afedf97f0867b76dac9f128 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index fd1725221b..0b0d2a6431 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From 08c8d08e7d235b1ba1fa74a6731fabf9023f7fd0 Mon Sep 17 00:00:00 2001
+From 873202f63f9f117c6e5a98e444cc709057042979 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index de23065814..e6507c5f89 100644
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,4 +1,4 @@
-From 8bf36de4e197add998c6fceeaf22215c5007b6a4 Mon Sep 17 00:00:00 2001
+From e7441559266074e7a33e3c11ff5cdaf5ba9c0e24 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:18:00 +0800
 Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
index d5fb3fbf19..eeff693bc4 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -1,4 +1,4 @@
-From 3c4ae0a4dbec70379e8bc9838ebadbca02f889ab Mon Sep 17 00:00:00 2001
+From 64f4d2eb976b9f23ce85b3655a876f7299eafd58 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:27:54 +0800
 Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
index 0143533973..5ca5386289 100644
--- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From 39de54d812b37865bb4f3ab77c0b9312078c93aa Mon Sep 17 00:00:00 2001
+From d95330f328c23c1cd6c51aeca43f081746cf2899 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
index 818babc386..d51ac4265a 100644
--- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
@@ -1,4 +1,4 @@
-From 34d593d75e0be636d7a1775b038a0d8ff636bbcb Mon Sep 17 00:00:00 2001
+From 2284f2f44b1b30f10b9196e0f5c6d0a2e0c1871f Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:19:27 +0000
 Subject: [PATCH] Handle missing LOCK_EX
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
index 74529428bc..2d272ed3e8 100644
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -1,4 +1,4 @@
-From ddf7d7b0c458c9c11d3952c2850159f413e70592 Mon Sep 17 00:00:00 2001
+From a6a25e1ecae91f48a4f87bf0cc17eaaf0a919ffe Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:20:17 +0000
 Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index 70305641f7..3fe5aeab13 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -1,4 +1,4 @@
-From 776df19769907397f2376f2665e83baac098d396 Mon Sep 17 00:00:00 2001
+From 47472da6e8900773c26da8fd26699367447d97a6 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
 Subject: [PATCH] test-json.c: define M_PIl
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index d9e3a2ad98..4df35d81d1 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From ee566f88b7de42c4c086230859d5c035d687fa9b Mon Sep 17 00:00:00 2001
+From 0f9422780a569c79a4b28e44c79c70b4a354bd92 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
@@ -134,7 +134,7 @@ index 955b18bd2a..6d89c90176 100644
                  log_debug_errno(r, "Failed to turn off coredumps, ignoring: %m");
  }
 diff --git a/src/binfmt/binfmt.c b/src/binfmt/binfmt.c
-index 29530bb691..3ecf6a45a2 100644
+index 981218f52f..436aaaddb4 100644
 --- a/src/binfmt/binfmt.c
 +++ b/src/binfmt/binfmt.c
 @@ -48,7 +48,7 @@ static int delete_rule(const char *rule) {
diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
index 2aa9a59554..e001ed59e8 100644
--- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From 1ab39b2d8c173ee231e673829eeeb113ccba2cef Mon Sep 17 00:00:00 2001
+From e4f9ef547fa342102db15188544daa18e71e9c66 Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index 9e5a91c268..e9b7c1c078 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From d8ff6ef555c942388a3166a4e288da700368af31 Mon Sep 17 00:00:00 2001
+From 66a926cf906260c2fb5ea851e55efe03edd444dc Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index 414c255d67..b7fd3cddbb 100644
--- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From 51b1dd6db0239a1d3cf62aac84685fd02bba69e6 Mon Sep 17 00:00:00 2001
+From 6f0dd2ba75b68036d7b4ebfe47ac5eaf44d26f06 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
diff --git a/meta/recipes-core/systemd/systemd_249.6.bb b/meta/recipes-core/systemd/systemd_249.7.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_249.6.bb
rename to meta/recipes-core/systemd/systemd_249.7.bb
-- 
2.33.1


