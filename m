Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DB7C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:29:58 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235503989"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235503989"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298111"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:29:56 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/33] systemd: update 249.3 -> 249.4
Date: Thu,  9 Dec 2021 09:29:13 +0800
Message-Id: 
 <25450886b48772ab88085b519bf06ea8a9bbfc3e.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:29:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159415

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 14c6e5a4b72d0e4665279158a0740dd1dc21f72f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ystemd-boot_249.3.bb => systemd-boot_249.4.bb} |  0
 meta/recipes-core/systemd/systemd.inc             |  2 +-
 .../0002-don-t-use-glibc-specific-qsort_r.patch   |  2 +-
 ....h-add-__compare_fn_t-and-comparison_fn_.patch |  2 +-
 ...lback-parse_printf_format-implementation.patch |  2 +-
 ...sic-missing.h-check-for-missing-strndupa.patch |  2 +-
 .../systemd/0006-Include-netinet-if_ether.h.patch | 15 ++++++++-------
 ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  2 +-
 .../0008-add-missing-FTW_-macros-for-musl.patch   |  2 +-
 ...of-__register_atfork-for-non-glibc-build.patch |  2 +-
 .../0010-Use-uintmax_t-for-handling-rlim_t.patch  |  2 +-
 ...c-Disable-tests-for-missing-typedefs-in-.patch |  4 ++--
 ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  2 +-
 ...-compatible-basename-for-non-glibc-syste.patch |  2 +-
 ...le-buffering-when-writing-to-oom_score_a.patch |  2 +-
 ...XSI-compliant-strerror_r-from-GNU-specif.patch |  2 +-
 ...t_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  2 +-
 ...ng_type.h-add-__compar_d_fn_t-definition.patch |  2 +-
 ...d-redefinition-of-prctl_mm_map-structure.patch |  2 +-
 .../systemd/0019-Handle-missing-LOCK_EX.patch     |  2 +-
 ...mpatible-pointer-type-struct-sockaddr_un.patch |  2 +-
 .../systemd/0021-test-json.c-define-M_PIl.patch   |  2 +-
 ...2-do-not-disable-buffer-in-writing-files.patch |  2 +-
 .../systemd/0025-Handle-__cpu_mask-usage.patch    |  4 ++--
 .../systemd/0026-Handle-missing-gshadow.patch     |  2 +-
 ...scall.h-Define-MIPS-ABI-defines-for-musl.patch |  2 +-
 .../{systemd_249.3.bb => systemd_249.4.bb}        |  0
 27 files changed, 34 insertions(+), 33 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_249.3.bb => systemd-boot_249.4.bb} (100%)
 rename meta/recipes-core/systemd/{systemd_249.3.bb => systemd_249.4.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_249.3.bb b/meta/recipes-core/systemd/systemd-boot_249.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_249.3.bb
rename to meta/recipes-core/systemd/systemd-boot_249.4.bb
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 13b8b61af6..d9752ef024 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "090378dcb1de5ca66900503210e85d63075fa70a"
+SRCREV = "4d8fd88b9641fce81272f60f556543f713175403"
 SRCBRANCH = "v249-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
 "
diff --git a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
index 15fa0c4546..bd2312c3b3 100644
--- a/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
+++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
@@ -1,4 +1,4 @@
-From 40acdb90031cfeb7140cee5205bce24f8c91d857 Mon Sep 17 00:00:00 2001
+From 0be164b79315998e719971db86ed79128ffb4a0b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:41:41 +0800
 Subject: [PATCH] don't use glibc-specific qsort_r
diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
index d0110a2388..7b14316134 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
@@ -1,4 +1,4 @@
-From 2a2f95b6dc16d2ea7a8e9349c6b19cc50c34777b Mon Sep 17 00:00:00 2001
+From dfcae6aacf2790bdceac3f25fcabf7c6daee176c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
 Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
diff --git a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
index 1d61367da4..d83fe903b8 100644
--- a/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
+++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
@@ -1,4 +1,4 @@
-From b19f800e178516d4f4d344457647e4a018bd6855 Mon Sep 17 00:00:00 2001
+From fcac5d47366085b29460590d36efafa87ccfe3b2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sat, 22 May 2021 20:26:24 +0200
 Subject: [PATCH] add fallback parse_printf_format implementation
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 0462d52d5e..1541d0b53c 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From db6551741a3654d8e75aff93ea00fbff579f7b02 Mon Sep 17 00:00:00 2001
+From 5b90aba2eb7340085d657493bf8ec1a9f0e25108 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
diff --git a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
index 855607e6a8..4ce168b6ef 100644
--- a/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
+++ b/meta/recipes-core/systemd/systemd/0006-Include-netinet-if_ether.h.patch
@@ -1,4 +1,4 @@
-From d7ae3aadc70555932e03349907f8be04d03a50ee Mon Sep 17 00:00:00 2001
+From 8983334730df280a4e4dcb08e586b453bc1d53bd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 26 Oct 2017 22:10:42 -0700
 Subject: [PATCH] Include netinet/if_ether.h
@@ -103,7 +103,7 @@ index 5ad396a57e..1dc007fe13 100644
 -#endif /* _UAPI_LINUX_IN6_H */
 +#endif /* _LINUX_IN6_H */
 diff --git a/src/libsystemd-network/sd-dhcp6-client.c b/src/libsystemd-network/sd-dhcp6-client.c
-index e8c47f429a..359922c1b3 100644
+index f99c12620b..4966d62656 100644
 --- a/src/libsystemd-network/sd-dhcp6-client.c
 +++ b/src/libsystemd-network/sd-dhcp6-client.c
 @@ -5,7 +5,6 @@
@@ -274,12 +274,13 @@ index 2b72b618fc..d0d4cfb384 100644
  #include "sd-dhcp6-client.h"
  
 diff --git a/src/network/networkd-link.c b/src/network/networkd-link.c
-index 9421ce1aa6..3e37cbcc39 100644
+index d58b700050..bba1ca1cab 100644
 --- a/src/network/networkd-link.c
 +++ b/src/network/networkd-link.c
-@@ -1,8 +1,8 @@
+@@ -1,9 +1,9 @@
  /* SPDX-License-Identifier: LGPL-2.1-or-later */
  
+ #include <net/if.h>
 +#include <netinet/if_ether.h>
  #include <netinet/in.h>
  #include <linux/if.h>
@@ -299,7 +300,7 @@ index 850b4f449e..6f85d41328 100644
  #include <netinet/in.h>
  #include <linux/netdevice.h>
 diff --git a/src/network/networkd-route.c b/src/network/networkd-route.c
-index 77a93beca9..3bf9ae8837 100644
+index b7852f6eec..72514f6a0d 100644
 --- a/src/network/networkd-route.c
 +++ b/src/network/networkd-route.c
 @@ -1,5 +1,6 @@
@@ -310,7 +311,7 @@ index 77a93beca9..3bf9ae8837 100644
  #include <linux/ipv6_route.h>
  #include <linux/nexthop.h>
 diff --git a/src/network/networkd-setlink.c b/src/network/networkd-setlink.c
-index 10c312c480..e44fbb5c35 100644
+index 13c4cedd10..6558d551ab 100644
 --- a/src/network/networkd-setlink.c
 +++ b/src/network/networkd-setlink.c
 @@ -1,8 +1,8 @@
@@ -369,7 +370,7 @@ index 8dfe23691b..e269856337 100644
  #include <netinet/ether.h>
  #include <unistd.h>
 diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
-index d40251331c..89566c05f5 100644
+index 5964e30bf1..52a18d7a7f 100644
 --- a/src/udev/udev-builtin-net_setup_link.c
 +++ b/src/udev/udev-builtin-net_setup_link.c
 @@ -1,5 +1,6 @@
diff --git a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
index 28846935e0..8b56f52989 100644
--- a/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
+++ b/meta/recipes-core/systemd/systemd/0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
@@ -1,4 +1,4 @@
-From e2d70a1735fc6b9d3c079814831ab0b1b2a9d1e0 Mon Sep 17 00:00:00 2001
+From ea800e99dba3a6013269853540b5d491c7c18d36 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:56:21 +0800
 Subject: [PATCH] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not defined
diff --git a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
index 444e123854..792727ed8e 100644
--- a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl.patch
@@ -1,4 +1,4 @@
-From 3410d82c9d07aee3e951fc6ae0b41fc1a594e00d Mon Sep 17 00:00:00 2001
+From c25f3f1324a5961348f8df9c1d0441804604a0ff Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:00:06 +0800
 Subject: [PATCH] add missing FTW_ macros for musl
diff --git a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
index 4670c232a5..24cd0897f9 100644
--- a/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
+++ b/meta/recipes-core/systemd/systemd/0009-fix-missing-of-__register_atfork-for-non-glibc-build.patch
@@ -1,4 +1,4 @@
-From 1e3bc870ded807cff0d3771dd89a850d020df032 Mon Sep 17 00:00:00 2001
+From c6cd600f859960c6e22a7e1c8b3d9ba92021e63a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:03:47 +0800
 Subject: [PATCH] fix missing of __register_atfork for non-glibc builds
diff --git a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
index e6bb37a65e..fec5f18e1a 100644
--- a/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
+++ b/meta/recipes-core/systemd/systemd/0010-Use-uintmax_t-for-handling-rlim_t.patch
@@ -1,4 +1,4 @@
-From eeacb75025d8f537d54c35256c5730c9aab15cde Mon Sep 17 00:00:00 2001
+From a47f363edf31142724b8c8773eee9bbdcacbb389 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:12:41 +0800
 Subject: [PATCH] Use uintmax_t for handling rlim_t
diff --git a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
index 897e332f33..08ac2fdbdb 100644
--- a/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
+++ b/meta/recipes-core/systemd/systemd/0011-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
@@ -1,4 +1,4 @@
-From fa29a572faaeb6fb9ed0bc6802d17139773e1908 Mon Sep 17 00:00:00 2001
+From 1089bdf56990586e734ecabd53d088011ff58b90 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 28 Feb 2018 21:25:22 -0800
 Subject: [PATCH] test-sizeof.c: Disable tests for missing typedefs in musl
@@ -13,7 +13,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index 3c9dc180fa..e1a59d408c 100644
+index e36bee4e8f..4403c0aa52 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -55,8 +55,10 @@ int main(void) {
diff --git a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
index 3bf706fc55..a821dfc453 100644
--- a/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
+++ b/meta/recipes-core/systemd/systemd/0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
@@ -1,4 +1,4 @@
-From 88c8922f9e4d221402d9cb2e04b9c82e89125827 Mon Sep 17 00:00:00 2001
+From d95ba8d9a880258d1fc74b19aa8dc13141699efb Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 10 Oct 2017 14:33:30 -0700
 Subject: [PATCH] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
diff --git a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
index 74008714c1..95c1f422ba 100644
--- a/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
+++ b/meta/recipes-core/systemd/systemd/0013-Define-glibc-compatible-basename-for-non-glibc-syste.patch
@@ -1,4 +1,4 @@
-From e07e9b998ad61b09555bc809aa15de9d2516787a Mon Sep 17 00:00:00 2001
+From c03f527bb1973993a3b446b006f5bad71be30786 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 27 May 2018 08:36:44 -0700
 Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
diff --git a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
index c5e20cbb80..b9ad3da5cd 100644
--- a/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
+++ b/meta/recipes-core/systemd/systemd/0014-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
@@ -1,4 +1,4 @@
-From 2f048d13e100158320bda248635b3c533ac9717b Mon Sep 17 00:00:00 2001
+From 87387970dfbf07c728a7d11f2ea422bc84de80e8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jul 2018 15:00:44 +0800
 Subject: [PATCH] Do not disable buffering when writing to oom_score_adj
diff --git a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
index 39804bd364..aad7c25c78 100644
--- a/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
+++ b/meta/recipes-core/systemd/systemd/0015-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
@@ -1,4 +1,4 @@
-From 45148529792c0cda32fdd61610c8d5a700d541fa Mon Sep 17 00:00:00 2001
+From fb1b946c610a0d4fa464c5cb2c4a0daee1e51cea Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 10 Jul 2018 15:40:17 +0800
 Subject: [PATCH] distinguish XSI-compliant strerror_r from GNU-specifi
diff --git a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
index 365e2a36f1..c1e6787ee9 100644
--- a/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
+++ b/meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
@@ -1,4 +1,4 @@
-From 02a2772889d6cb08c9ca0561b52e7a9a80e50497 Mon Sep 17 00:00:00 2001
+From a24336f917e1b66160f148722554600ff85ac1b8 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:18:00 +0800
 Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
diff --git a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
index 8a6c03f312..95f2086f7b 100644
--- a/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
+++ b/meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
@@ -1,4 +1,4 @@
-From 47c4ac80689077b1eb86cf05b4326b1ac345aedf Mon Sep 17 00:00:00 2001
+From e0acbce4195c99d876e71a4cc20167681822f177 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:27:54 +0800
 Subject: [PATCH] missing_type.h: add __compar_d_fn_t definition
diff --git a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
index e75935a280..898f6d5c6a 100644
--- a/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
+++ b/meta/recipes-core/systemd/systemd/0018-avoid-redefinition-of-prctl_mm_map-structure.patch
@@ -1,4 +1,4 @@
-From 2cb33d8896a4ad2d3b489fed51f17d5e45dfb4fc Mon Sep 17 00:00:00 2001
+From 7a0435a185e931061a2ee6147347db8966233df4 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 15:44:54 +0800
 Subject: [PATCH] avoid redefinition of prctl_mm_map structure
diff --git a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
index 629c103627..60b36b23b9 100644
--- a/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
+++ b/meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
@@ -1,4 +1,4 @@
-From 200a2a2e4f04a7b7078dd455fafbd6774240e30b Mon Sep 17 00:00:00 2001
+From 0c566970ea4fac0e3e597cfce0479c7b3502cff7 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:19:27 +0000
 Subject: [PATCH] Handle missing LOCK_EX
diff --git a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
index ea6e82f466..ac8e7f691f 100644
--- a/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
+++ b/meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
@@ -1,4 +1,4 @@
-From 6445b7737a89256f35adc56701a5c47b48618ced Mon Sep 17 00:00:00 2001
+From e063abdbe73d38302533c02ce5b82116b909b888 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Fri, 7 Aug 2020 15:20:17 +0000
 Subject: [PATCH] Fix incompatible pointer type struct sockaddr_un *
diff --git a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
index 60c12b0740..b965cd63b5 100644
--- a/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
+++ b/meta/recipes-core/systemd/systemd/0021-test-json.c-define-M_PIl.patch
@@ -1,4 +1,4 @@
-From ae71bf2b97dc9d4760defd83463c1d305f332f22 Mon Sep 17 00:00:00 2001
+From 82f509e29039966e942d1e8eb6283d0828d68b8a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 16:53:06 +0800
 Subject: [PATCH] test-json.c: define M_PIl
diff --git a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
index 6998bf0dd0..e0f31e8ad8 100644
--- a/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
+++ b/meta/recipes-core/systemd/systemd/0022-do-not-disable-buffer-in-writing-files.patch
@@ -1,4 +1,4 @@
-From 3198690c2dbb4b457a04ef21914dc4d531540273 Mon Sep 17 00:00:00 2001
+From 1f2b7e65dc96d01c84d0f33a7edb776988b28f4f Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Fri, 1 Mar 2019 15:22:15 +0800
 Subject: [PATCH] do not disable buffer in writing files
diff --git a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
index 06702765ee..a986de7fd2 100644
--- a/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
+++ b/meta/recipes-core/systemd/systemd/0025-Handle-__cpu_mask-usage.patch
@@ -1,4 +1,4 @@
-From b04518c464b526f8b9adc9ce3c08b1881db47989 Mon Sep 17 00:00:00 2001
+From 6f72861193824c5d170ec252857bca040a72c7ab Mon Sep 17 00:00:00 2001
 From: Scott Murray <scott.murray@konsulko.com>
 Date: Fri, 13 Sep 2019 19:26:27 -0400
 Subject: [PATCH] Handle __cpu_mask usage
@@ -38,7 +38,7 @@ index 3c63a58826..4c2d4347fc 100644
  typedef struct CPUSet {
          cpu_set_t *set;
 diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
-index e1a59d408c..c269ea6e8c 100644
+index 4403c0aa52..e7e4ae112d 100644
 --- a/src/test/test-sizeof.c
 +++ b/src/test/test-sizeof.c
 @@ -1,6 +1,5 @@
diff --git a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
index dc63305825..347ec4182d 100644
--- a/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
+++ b/meta/recipes-core/systemd/systemd/0026-Handle-missing-gshadow.patch
@@ -1,4 +1,4 @@
-From 0c8935128b39864b07dfee39cfa9d35d48f056aa Mon Sep 17 00:00:00 2001
+From 7fd5621608c312313a3be09f934a713176f739a8 Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alex.kiernan@gmail.com>
 Date: Tue, 10 Mar 2020 11:05:20 +0000
 Subject: [PATCH] Handle missing gshadow
diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
index ff96a720c5..9349844db2 100644
--- a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -1,4 +1,4 @@
-From f5d7fee9620cbcf52be8f8ba477890d28cadfbc8 Mon Sep 17 00:00:00 2001
+From 6690522f5096ec68f4a508242e4432e8b1ef07cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 12 Apr 2021 23:44:53 -0700
 Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-core/systemd/systemd_249.4.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd_249.3.bb
rename to meta/recipes-core/systemd/systemd_249.4.bb
-- 
2.33.1


