Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697E7C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 08:18:46 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.26226.1698913117629147419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 01:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="126396921"
X-IronPort-AV: E=Sophos;i="6.03,270,1694703600"; 
   d="scan'208";a="126396921"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:18:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 99231D6186
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:18:32 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C8839D3F37
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:18:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 959F188899;
	Thu,  2 Nov 2023 17:18:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] base-passwd: upgrade 3.6.1 -> 3.6.2
Date: Thu,  2 Nov 2023 16:17:50 +0800
Message-Id: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27972.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27972.006
X-TMASE-Result: 10--11.586900-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yTo39wOA02LhGEfoClqBl87fUZT83lbkEDQX
	TkSM3COG/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQB1e
	gkZdCJXdsXqCizdUSQ9o7nBvaGi9BXSJ4c3nT+QfGL//8mlodA32/mTu5B5RIYbzeJiynYnFAaf
	cxQhn7ew/zhaXEgL8LKZ+Qp3Wez9rVm14t84/DtLGWmeVAULKHF4r8H5YrEqxShcWO/83xovo1c
	6H9DbojIIojcDWvXq55OPD8XJFfpB8TzIzimOwPC24oEZ6SpSkj80Za3RRg8G4TPqaZzR0uEWdP
	ANHtuvkgj5U2ySbKzGO7lyOy2AH84V0C77/ykZU=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190060

From: Wang Mingyu <wangmy@fujitsu.com>

0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
removed since it's included in 3.6.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-to-configure-whether-to-use-SELinux.patch | 35 -------------------
 ...e-passwd_3.6.1.bb => base-passwd_3.6.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
 rename meta/recipes-core/base-passwd/{base-passwd_3.6.1.bb => base-passwd_3.6.2.bb} (96%)

diff --git a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch b/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
deleted file mode 100644
index 2cc6174e2a..0000000000
--- a/meta/recipes-core/base-passwd/base-passwd/0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 25e3bf09bbbb04aa930ea0fd9f28809a24fb7194 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <pkj@axis.com>
-Date: Sun, 2 Oct 2022 17:47:29 +0200
-Subject: [PATCH] Make it possible to configure whether to use SELinux or not
-
-Upstream-Status: Backport [https://salsa.debian.org/debian/base-passwd/-/commit/396c41bb35e03c5dcc727aa9f74218a45874ac1f]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- configure.ac | 13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 589df88..e46403b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -13,7 +13,18 @@ AC_SYS_LARGEFILE
- 
- dnl Scan for things we need
- AC_CHECK_FUNCS([putgrent])
--AC_CHECK_LIB([selinux], [is_selinux_enabled])
-+
-+dnl Check for SELinux
-+AC_MSG_CHECKING([whether to enable SELinux support])
-+AC_ARG_ENABLE([selinux],
-+  [AS_HELP_STRING([--disable-selinux], [disable support for SELinux])],
-+  [],
-+  [enable_selinux=yes])
-+AC_MSG_RESULT($enable_selinux)
-+AS_IF([test "x$enable_selinux" != xno],
-+  [AC_CHECK_LIB([selinux], [is_selinux_enabled], [],
-+    [AC_MSG_ERROR(
-+      [SELinux support not available (use --disable-selinux to disable)])])])
- 
- dnl Check for debconf
- AC_MSG_CHECKING([whether to enable debconf support])
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb b/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
similarity index 96%
rename from meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
rename to meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
index 44bcfb0199..bb4b49e6ab 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.6.2.bb
@@ -11,12 +11,11 @@ SRC_URI = "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
            file://0003-Remove-for-root-since-we-do-not-have-an-etc-shadow.patch \
            file://0004-Add-an-input-group-for-the-dev-input-devices.patch \
            file://0005-Add-kvm-group.patch \
-           file://0006-Make-it-possible-to-configure-whether-to-use-SELinux.patch \
            file://0007-Add-wheel-group.patch \
            file://0001-base-passwd-Add-the-sgx-group.patch \
            "
 
-SRC_URI[sha256sum] = "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6c6428f2c92866f79af"
+SRC_URI[sha256sum] = "06dc78352bf38a8df76ff295e15ab5654cdefe41e62368b15bfcbbab8e4ec2a0"
 
 # the package is taken from launchpad; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
-- 
2.34.1


