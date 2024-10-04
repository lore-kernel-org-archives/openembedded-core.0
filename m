Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ECCCF8845
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 15:13:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.24345.1728054818475140413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Oct 2024 08:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bIGzD3bt;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 494FDbf2111448
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Oct 2024 10:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728054817;
	bh=PWLgYAS6zarLOC3uTHZdAPKu8WfIu7Dip0+mUh4FXI0=;
	h=From:To:Subject:Date;
	b=bIGzD3btD4gKMZx9WKlhnyXTPXBxcUjwa+aPP7rzt4J/uog5DL6HoQgxdjBXfsR6M
	 FqANYpEtJ44k/dgNXM7ZmFKdt6QJp07I4cxAPrtmTVlnsXnWdky+3187z2rTFJ5YlY
	 uGfcBu4CaEUlmrDWGDirnQQRIKL7uMnG+9r8DgP4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 494FDbQS042269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Oct 2024 10:13:37 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Oct 2024 10:13:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Oct 2024 10:13:37 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 494FDbXx057251
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Oct 2024 10:13:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1swjzt-0006FV-3f
	for openembedded-core@lists.openembedded.org; Fri, 04 Oct 2024 10:13:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap] cryptodev: upgrade 1.13 -> 1.14
Date: Fri, 4 Oct 2024 10:13:37 -0500
Message-ID: <20241004151337.23981-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Oct 2024 15:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205235

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Disable-installing-header-file-provided-by-another-p.patch
0001-tests-Makefile-do-not-use-Werror.patch
removed since they're included in 1.14

Changelog:
===========
* Fix compilation issues after API changes in several Linux kernels
* Split install targets to help package maintainers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cryptodev/cryptodev-linux_1.13.bb              | 13 -----------
 .../cryptodev/cryptodev-linux_1.14.bb              | 13 +++++++++++
 .../cryptodev/cryptodev-module_1.13.bb             | 16 --------------
 .../cryptodev/cryptodev-module_1.14.bb             | 13 +++++++++++
 .../cryptodev/cryptodev-tests_1.13.bb              | 21 ------------------
 .../cryptodev/cryptodev-tests_1.14.bb              | 17 +++++++++++++++
 meta/recipes-kernel/cryptodev/cryptodev.inc        |  4 ++--
 ...talling-header-file-provided-by-another-p.patch | 25 ----------------------
 .../0001-tests-Makefile-do-not-use-Werror.patch    | 25 ----------------------
 9 files changed, 45 insertions(+), 102 deletions(-)
 delete mode 100644 meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
 delete mode 100644 meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
 delete mode 100644 meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
deleted file mode 100644
index d5ea9d8529..0000000000
--- a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require cryptodev.inc
-
-SUMMARY = "A /dev/crypto device driver header file"
-
-do_compile[noexec] = "1"
-
-# Just install cryptodev.h which is the only header file needed to be exported
-do_install() {
-	install -D ${S}/crypto/cryptodev.h ${D}${includedir}/crypto/cryptodev.h
-}
-
-ALLOW_EMPTY:${PN} = "1"
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
new file mode 100644
index 0000000000..d5ea9d8529
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.14.bb
@@ -0,0 +1,13 @@
+require cryptodev.inc
+
+SUMMARY = "A /dev/crypto device driver header file"
+
+do_compile[noexec] = "1"
+
+# Just install cryptodev.h which is the only header file needed to be exported
+do_install() {
+	install -D ${S}/crypto/cryptodev.h ${D}${includedir}/crypto/cryptodev.h
+}
+
+ALLOW_EMPTY:${PN} = "1"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
deleted file mode 100644
index 5192cf03ed..0000000000
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require cryptodev.inc
-
-SUMMARY = "A /dev/crypto device driver kernel module"
-
-inherit module
-
-# Header file provided by a separate package
-DEPENDS += "cryptodev-linux"
-
-SRC_URI += "file://0001-Disable-installing-header-file-provided-by-another-p.patch \
-           "
-
-EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
-
-RCONFLICTS:${PN} = "ocf-linux"
-RREPLACES:${PN} = "ocf-linux"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
new file mode 100644
index 0000000000..6fb75675bb
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.14.bb
@@ -0,0 +1,13 @@
+require cryptodev.inc
+
+SUMMARY = "A /dev/crypto device driver kernel module"
+
+inherit module
+
+# Header file provided by a separate package
+DEPENDS += "cryptodev-linux"
+
+EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
+
+RCONFLICTS:${PN} = "ocf-linux"
+RREPLACES:${PN} = "ocf-linux"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
deleted file mode 100644
index 458ad8ecf2..0000000000
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require cryptodev.inc
-
-SUMMARY = "A test suite for /dev/crypto device driver"
-
-DEPENDS += "openssl"
-
-SRC_URI += " \
-           file://0001-tests-Makefile-do-not-use-Werror.patch \
-           "
-
-EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
-
-do_compile() {
-	oe_runmake tests
-}
-
-do_install() {
-	oe_runmake install_tests
-}
-
-FILES:${PN} = "${bindir}/*"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
new file mode 100644
index 0000000000..f6a286e1b7
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.14.bb
@@ -0,0 +1,17 @@
+require cryptodev.inc
+
+SUMMARY = "A test suite for /dev/crypto device driver"
+
+DEPENDS += "openssl"
+
+EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
+
+do_compile() {
+	oe_runmake tests
+}
+
+do_install() {
+	oe_runmake install_tests
+}
+
+FILES:${PN} = "${bindir}/*"
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 64a9c2926b..8d0aad4a01 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
-SRCREV = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
-PV = "1.13+git${SRCPV}"
+SRCREV = "135cbff90af2ba97d88f1472be595ce78721972c"
+PV = "1.14"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch b/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
deleted file mode 100644
index c7fdef4da4..0000000000
--- a/meta/recipes-kernel/cryptodev/files/0001-Disable-installing-header-file-provided-by-another-p.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 66d85d3f26e21cf7c38b27de0dcc42376f5d853e Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 6 Apr 2014 19:51:39 -0400
-Subject: [PATCH] Disable installing header file provided by another package
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-
-Upstream-Status: Inappropriate [ OE specific ]
-
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index d83aee6..c8d8ae5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -36,7 +36,6 @@ install: modules_install
- 
- modules_install:
- 	$(MAKE) $(KERNEL_MAKE_OPTS) modules_install
--	install -m 644 -D crypto/cryptodev.h $(DESTDIR)/$(includedir)/crypto/cryptodev.h
- 
- install_tests: tests
- 	$(MAKE) -C tests install DESTDIR=$(PREFIX)
diff --git a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch b/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
deleted file mode 100644
index 3285548a57..0000000000
--- a/meta/recipes-kernel/cryptodev/files/0001-tests-Makefile-do-not-use-Werror.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 47438e53e1156db0916c0f4683a24fe4d82152f2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 10 Sep 2021 10:44:42 +0200
-Subject: [PATCH] tests/Makefile: do not use -Werror
-
-Otherwise, openssl 3 deprecation warnings become errors.
-Reported at https://github.com/cryptodev-linux/cryptodev-linux/issues/67
-
-Upstream-Status: Inappropriate [upstream needs to update the code]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- tests/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/Makefile b/tests/Makefile
-index 2fb7a9a..e94f80e 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -1,4 +1,4 @@
--CFLAGS += -I.. $(CRYPTODEV_CFLAGS) -Wall -Werror
-+CFLAGS += -I.. $(CRYPTODEV_CFLAGS) -Wall
- 
- comp_progs := cipher_comp hash_comp hmac_comp
- 
-- 
cgit 1.2.3-korg


