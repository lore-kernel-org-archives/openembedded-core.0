Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id F129865CA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 23:10:14 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NC000HJVOD3HV40@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 16 Sep 2014 18:10:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 5D20B20015; Tue,
	16 Sep 2014 19:10:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 19:10:00 -0400
Message-id: <1410909001-3284-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2 1/2] u-boot: cleanup indentation and consolidate .inc file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Sep 2014 23:10:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../u-boot/u-boot-fw-utils-cross_2013.07.bb            | 12 ++++++------
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb     | 14 +++++++-------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb      | 12 ++++++------
 meta/recipes-bsp/u-boot/u-boot.inc                     | 10 ++++++++++
 meta/recipes-bsp/u-boot/u-boot_2013.07.bb              | 18 +-----------------
 5 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
index e616397..d686b33 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2013.07.bb
@@ -20,19 +20,19 @@ inherit uboot-config cross
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
 
 do_compile () {
-  oe_runmake ${UBOOT_MACHINE}
-  oe_runmake env
+	oe_runmake ${UBOOT_MACHINE}
+	oe_runmake env
 }
 
 do_install () {
-  install -d ${D}${bindir_cross}
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
+	install -d ${D}${bindir_cross}
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
 }
 
 SYSROOT_PREPROCESS_FUNCS = "uboot_fw_utils_cross"
 uboot_fw_utils_cross() {
-    sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
+	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
index 89fed8b..8bab432 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -20,16 +20,16 @@ EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTSTRIP="true"'
 inherit uboot-config
 
 do_compile () {
-  oe_runmake ${UBOOT_MACHINE}
-  oe_runmake env
+	oe_runmake ${UBOOT_MACHINE}
+	oe_runmake env
 }
 
 do_install () {
-  install -d ${D}${base_sbindir}
-  install -d ${D}${sysconfdir}
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
-  install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
+	install -d ${D}${base_sbindir}
+	install -d ${D}${sysconfdir}
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
index 93c8102..3173b0a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
@@ -17,16 +17,16 @@ S = "${WORKDIR}/git"
 EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
 
 do_compile () {
-  # Make sure the recompile is OK
-  rm -f ${B}/tools/.depend
+	# Make sure the recompile is OK
+	rm -f ${B}/tools/.depend
 
-  oe_runmake tools
+	oe_runmake tools
 }
 
 do_install () {
-  install -d ${D}${bindir}
-  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-  ln -sf uboot-mkimage ${D}${bindir}/mkimage
+	install -d ${D}${bindir}
+	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
+	ln -sf uboot-mkimage ${D}${bindir}/mkimage
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 53c87c2..602b71f 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -3,6 +3,16 @@ HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
 SECTION = "bootloaders"
 PROVIDES = "virtual/bootloader"
 
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit uboot-config deploy
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
index f8a8856..f07fd7c 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -1,25 +1,9 @@
 require u-boot.inc
 
-# To build u-boot for your machine, provide the following lines in your machine
-# config, replacing the assignments as appropriate for your machine.
-# UBOOT_MACHINE = "omap3_beagle_config"
-# UBOOT_ENTRYPOINT = "0x80008000"
-# UBOOT_LOADADDRESS = "0x80008000"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
-
 # This revision corresponds to the tag "v2013.07"
 # We use the revision in order to avoid having to fetch it from the repo during parse
 SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
 
 PV = "v2013.07+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-           file://0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch \
-"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
+SRC_URI += "file://0001-am335x_evm.h-Add-use-DEFAULT_LINUX_BOOT_ENV-environm.patch"
-- 
2.0.4


