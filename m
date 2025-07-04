Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEA2C83F05
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 09:10:26 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8519.1751620222749632602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 02:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ED3+MU6F;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751620223; x=1783156223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+NJY3YPyxr7NPFnXF38Qz05THEB6SB1s3SumuRQUi4Y=;
  b=ED3+MU6FatF5yTJwC1I3Eiagg8ElP3+SDV4F++Q3DIvlB8D0keceLj0r
   ZxTbOOePKK4lK7Lj2Xp6Lu7owJSnDl9gtbgWd+V0loBP+qhwWgxgAdGEd
   tPFlTZdQ79Xm/LT7bYg9+J+tXzDgTLIrkKQeXDSO4xnVoWUvxASi82Ycs
   7FSCmyHrvAVXgZmvr3kkCVl+plVaek/rFV+FVdfcAJUHDDDdQOTeJxbqw
   mdDW277xbgjy+u0Vcoo2rVzV8pa3a1hSCp2aYXz4kSUiKUPStXBuv9Rkz
   SVAdmNNMJsaJBL5AaJSaBw+IwftzDATMqq/k3cnfNuny+415ofouaaV5/
   A==;
X-CSE-ConnectionGUID: RVCeN/4XTQy6QlApoSsLsw==
X-CSE-MsgGUID: NOqeqCBfT2WXLoBaKMqUMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="192654228"
X-IronPort-AV: E=Sophos;i="6.16,286,1744038000"; 
   d="scan'208";a="192654228"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 18:10:21 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id DF42BC01828
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Jul 2025 09:10:20 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTP id 2D5C714003CF
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Jul 2025 09:10:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F09C606347
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Jul 2025 18:10:18 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ECF451A006C;
	Fri,  4 Jul 2025 17:10:17 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/3] lttng-modules: upgrade 2.13.19 -> 2.14.0
Date: Fri,  4 Jul 2025 17:10:08 +0800
Message-ID: <20250704091015.707-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 09:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219907

From: Wang Mingyu <wangmy@fujitsu.com>

0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
removed since it's not available in 2.14.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...x-sigaction-build-without-CONFIG_COM.patch | 35 -------------------
 ...e-missing-CONFIG_TRACEPOINTS-to-warn.patch | 21 ++++++-----
 ...les_2.13.19.bb => lttng-modules_2.14.0.bb} | 10 +++---
 3 files changed, 16 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.19.bb => lttng-modules_2.14.0.bb} (78%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
deleted file mode 100644
index eb43abbae2..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 0e2095bcc50e7a07d3478f8d3c0ae5ad46575594 Mon Sep 17 00:00:00 2001
-From: Mikko Rapeli <mikko.rapeli@linaro.org>
-Date: Mon, 28 Apr 2025 12:07:24 +0000
-Subject: [PATCH] lttng-modules: fix sigaction build without
- CONFIG_COMPAT_OLD_SIGACTION
-
-Workaround build failure when CONFIG_COMPAT_OLD_SIGACTION is not enabled
-in kernel config.
-
-Upstream-Status: Submitted [https://bugs.lttng.org/issues/1426]
-
-Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
----
- .../instrumentation/syscalls/headers/arm-32-syscalls_pointers.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/instrumentation/syscalls/headers/arm-32-syscalls_pointers.h b/include/instrumentation/syscalls/headers/arm-32-syscalls_pointers.h
-index 5f4ca5b..1514cae 100644
---- a/include/instrumentation/syscalls/headers/arm-32-syscalls_pointers.h
-+++ b/include/instrumentation/syscalls/headers/arm-32-syscalls_pointers.h
-@@ -1890,9 +1890,11 @@ TRACE_SYSCALL_TABLE(chroot, chroot, 61, 1)
- #ifndef OVERRIDE_TABLE_32_ustat
- TRACE_SYSCALL_TABLE(ustat, ustat, 62, 2)
- #endif
-+#ifdef CONFIG_COMPAT_OLD_SIGACTION
- #ifndef OVERRIDE_TABLE_32_sigaction
- TRACE_SYSCALL_TABLE(sigaction, sigaction, 67, 3)
- #endif
-+#endif /* CONFIG_COMPAT_OLD_SIGACTION */
- #ifndef OVERRIDE_TABLE_32_sigpending
- TRACE_SYSCALL_TABLE(sigpending, sigpending, 73, 1)
- #endif
--- 
-2.49.0
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index 4911982461..9167d657f2 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -16,14 +16,14 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
 ---
- src/Kbuild | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
+ src/Kbuild | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/src/Kbuild b/src/Kbuild
-index 7137874..04eb5c9 100644
+index f33d0d5..ef50941 100644
 --- a/src/Kbuild
 +++ b/src/Kbuild
-@@ -2,10 +2,13 @@
+@@ -3,10 +3,13 @@
  
  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
    ifeq ($(CONFIG_TRACEPOINTS),)
@@ -38,9 +38,12 @@ index 7137874..04eb5c9 100644
  TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))/..
  
  lttng_check_linux_version = $(shell pwd)/include/linux/version.h
-@@ -150,3 +153,5 @@ lttng-statedump-objs := lttng-statedump-impl.o
- obj-$(CONFIG_LTTNG) += probes/
- obj-$(CONFIG_LTTNG) += lib/
- obj-$(CONFIG_LTTNG) += tests/
-+
+@@ -167,4 +170,5 @@ obj-$(CONFIG_LTTNG) += tests/
+ 
+ obj-$(CONFIG_LTTNG_SYSCALLS_EXTRACTOR) += lttng-syscalls-extractor.o
+ 
 +endif # DISABLE_MODULE
+ # vim:syntax=make
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.19.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.0.bb
similarity index 78%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.19.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.14.0.bb
index 63ba488515..c3d9620636 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.19.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.0.bb
@@ -3,21 +3,19 @@ SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 HOMEPAGE = "https://lttng.org/"
 LICENSE = "LGPL-2.1-only & GPL-2.0-only & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8d0d9f08888046474772a5d745d89d6a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=018e002dbdda3306682e394ddd65fa32"
 
 inherit module
 
 include lttng-platforms.inc
 
-SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-lttng-modules-fix-sigaction-build-without-CONFIG_COM.patch \
-           "
+SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2"
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
 
-SRC_URI[sha256sum] = "06d704633749039f8fa72a954bec6486058386e2a0c3557b22c484698f9b34d5"
+SRC_URI[sha256sum] = "f2261e738b1dd1027640e5ba3040dee292241b847d5745766b3ba640e168c94a"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
@@ -38,6 +36,6 @@ python do_package:prepend() {
 }
 
 BBCLASSEXTEND = "devupstream:target"
-SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13;protocol=https"
+SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.14;protocol=https;tag=v${PV}"
 SRCREV:class-devupstream = "7584cfc04914cb0842a986e9808686858b9c8630"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.43.0


