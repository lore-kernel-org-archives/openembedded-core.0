Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA06C3ABDE
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.45969.1747040638105268631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WoaRUKVt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040639; x=1778576639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=R6yi6ObFGKWTPPO82k9AX+7RD02RZSJdeMbsu2p3sP0=;
  b=WoaRUKVtP/H30ygRPKbHNRr2dhb+NyYtJI/QSD88mKCPbYUBtuQCorSP
   /57G8nWLPcu3UbsnY3Bev8v/cWklWVLGTz6YXFQmZZ4fdbDKsGwco6ZaE
   L0vn2aHCzVOVjZ+6ZKTJsb6JrkhKp252dejr/uGfYrkHLN5BbeGqF+z/H
   O7MsCWnhedfXdqRX9wAlfC/RgLI+ZNPKa0Y7SRSQeM09/SQmobR4G0geT
   PL8FdLT8msea2G2cCcaseR92XHa6WKDZG7QX67kvQpSF6AXFpsDWEuWDH
   eLh2mWg1xijwvyFSgqlVTpuV7Ux0l2ahoIvmmdnfv8FSS9rS+ucAe3b1G
   Q==;
X-CSE-ConnectionGUID: q80yOOQyTfamFIIg6g+/dw==
X-CSE-MsgGUID: 9+smqRrgR3S9VEJUKQ72NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="198343065"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="198343065"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FC86D6EFC
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 45CE0CFB76
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CD5A11A009B;
	Mon, 12 May 2025 17:03:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/56] barebox-tools: upgrade 2025.03.0 -> 2025.04.0
Date: Mon, 12 May 2025 17:02:47 +0800
Message-Id: <1747040619-7566-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216306

From: Wang Mingyu <wangmy@fujitsu.com>

0001-scripts-dtc-clean-up-yamltree-from-dtc.patch
removed since it's included in 2025.04.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc   |  4 +-
 meta/recipes-bsp/barebox/barebox-tools.bb     |  4 --
 ...ripts-dtc-clean-up-yamltree-from-dtc.patch | 60 -------------------
 3 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 7fd7a88d71..d6ea1eedfe 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.03.0"
+PV = "2025.04.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "0bf7118004e445bdd57feeef89ee9064982acc221e8a046c4a7994d3da6da2ec"
+SRC_URI[sha256sum] = "3124f3c2b69d9ce0512b2d40fa17cace9c356f65f005a63da0474387b8839c41"
diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
index f6395beb7c..2a117bc9c0 100644
--- a/meta/recipes-bsp/barebox/barebox-tools.bb
+++ b/meta/recipes-bsp/barebox/barebox-tools.bb
@@ -2,10 +2,6 @@ SUMMARY = "barebox bootloader tools"
 
 require barebox-common.inc
 
-SRC_URI += " \
-    file://0001-scripts-dtc-clean-up-yamltree-from-dtc.patch \
-"
-
 LICENSE = "GPL-2.0-only"
 
 DEPENDS = "bison-native flex-native libusb1"
diff --git a/meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch b/meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch
deleted file mode 100644
index fdab21ef72..0000000000
--- a/meta/recipes-bsp/barebox/files/0001-scripts-dtc-clean-up-yamltree-from-dtc.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 77afd065dc58e2f57066ef7f392c571f8136723d Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 7 Apr 2025 14:45:27 +0000
-Subject: [PATCH] scripts/dtc: clean up yamltree from dtc
-
-Refer Linux commit [dt-bindings: kbuild: Use DTB files for validation][1],
-clean up yamltree from dtc to avoid compile failure while include <yaml.h>
-in non-standard path
-
-Since barebox actually doesn't do any dtb binding checks at the moment, just
-remove the test of /usr/include/yaml.h, hard-code the -DNO_YAML and remove
-yamltree.c from DTC_SOURCE
-
-[1] https://github.com/torvalds/linux/commit/ef8795f3f1ce
-
-Upstream-Status: Submitted [https://github.com/barebox/barebox/pull/37]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- scripts/dtc/Makefile             | 9 ---------
- scripts/dtc/update-dtc-source.sh | 2 +-
- 2 files changed, 1 insertion(+), 10 deletions(-)
-
-diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
-index 721e8e2b..da00319f 100644
---- a/scripts/dtc/Makefile
-+++ b/scripts/dtc/Makefile
-@@ -16,16 +16,7 @@ fdtget-objs    += fdtget.o $(libfdt-objs) util.o
- # Source files need to get at the userspace version of libfdt_env.h to compile
- HOST_EXTRACFLAGS += -I$(src)/libfdt
- 
--ifeq ($(wildcard /usr/include/yaml.h),)
--ifneq ($(CHECK_DTBS),)
--$(error dtc needs libyaml for DT schema validation support. \
--	Install the necessary libyaml development package.)
--endif
- HOST_EXTRACFLAGS += -DNO_YAML
--else
--dtc-objs	+= yamltree.o
--HOSTLDLIBS_dtc	:= -lyaml
--endif
- 
- # Generated files need one more search path to include headers in source tree
- HOSTCFLAGS_dtc-lexer.lex.o := -I$(src)
-diff --git a/scripts/dtc/update-dtc-source.sh b/scripts/dtc/update-dtc-source.sh
-index 141d3629..8aa5cd66 100755
---- a/scripts/dtc/update-dtc-source.sh
-+++ b/scripts/dtc/update-dtc-source.sh
-@@ -31,7 +31,7 @@ DTC_UPSTREAM_PATH=`pwd`/../dtc
- DTC_LINUX_PATH=`pwd`/scripts/dtc
- 
- DTC_SOURCE="checks.c data.c dtc.c dtc.h flattree.c fstree.c livetree.c srcpos.c \
--		srcpos.h treesource.c util.c util.h version_gen.h yamltree.c Makefile.dtc \
-+		srcpos.h treesource.c util.c util.h version_gen.h Makefile.dtc \
- 		dtc-lexer.l dtc-parser.y fdtget.c"
- LIBFDT_SOURCE="Makefile.libfdt fdt.c fdt.h fdt_addresses.c fdt_empty_tree.c \
- 		fdt_overlay.c fdt_ro.c fdt_rw.c fdt_strerror.c fdt_sw.c \
--- 
-2.48.1
-
-- 
2.43.0


