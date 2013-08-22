Return-Path: <lpapp@archlinux.us>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6276B282
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 20:36:31 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id t58so2207192wes.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 13:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding;
	bh=c3UyvVDpDASZOc5SeDmc+B5mtwIOQ9ha7vv8Ehk1PYw=;
	b=j/2S0qigrcNJa6RHJyBjwel6gnwDA8Ud63eusBfn3a6aBpWiKnN5cTa5/yngDpdVuZ
	q/v672xihcLtQ2S+H7FOPQbUm8xWGI3Po9KJ2V93Glo/s1mSf7eLC3aqTGA3vBy8OXUM
	pzifR5mOt5ja6W1Z539TZvEEFvTOBLmBbhCq0+jwruB7T/8cN6imihtGaSZgfDlkOQ+P
	Rp01qv6dr5e1iAbf5B+AROE+W6WiAMnswGHRyvf3DZFmiCTtee0hc0yyarAXhXOCVtqo
	/PlX7yBJAOs6koGakrf6iI/ZrMhRDT6m8mwBIFAJFwq6L4vZMn7smxVyZbFr4FnUFT5D
	LEEw==
X-Gm-Message-State: ALoCoQlF+kQoxXb7c4N93kun7RNVfFOaUSLLD68KbIEzUi7dm7of2pWMnb+FGWWWl3yJPFaVLV4Y
X-Received: by 10.180.187.41 with SMTP id fp9mr11178624wic.33.1377203791252;
	Thu, 22 Aug 2013 13:36:31 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginmedia.com.
	[86.30.245.31])
	by mx.google.com with ESMTPSA id bt8sm19456101wib.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 13:36:30 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Thu, 22 Aug 2013 21:36:39 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 21:36:35 +0100
Message-Id: <1377203796-1744-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
Subject: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Thu, 22 Aug 2013 20:36:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb | 28 --------
 ...Drop-config.h-include-in-tools-imximage.h.patch | 39 ----------
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch | 82 ----------------------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  | 31 --------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  | 29 --------
 .../u-boot/u-boot-mkimage_2013.01.01.bb            | 33 ---------
 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 27 +++++++
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb          | 24 -------
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb          | 24 -------
 meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb       | 29 --------
 meta/recipes-bsp/u-boot/u-boot_2013.07.bb          | 23 ++++++
 11 files changed, 50 insertions(+), 319 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.03.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.06.bb
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
deleted file mode 100644
index 7c4df1a..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
-SECTION = "bootloader"
-
-DEPENDS = "mtd-utils"
-
-PR = "r1"
-
-SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
-SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
-
-S = "${WORKDIR}/u-boot-${PV}"
-
-EXTRA_OEMAKE = 'HOSTCC="${CC}"'
-
-do_compile () {
-  oe_runmake env
-}
-
-do_install () {
-  install -d ${D}${base_sbindir}
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
-  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
-}
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
deleted file mode 100644
index 0405834..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>
-Date: Thu, 3 Feb 2011 15:07:01 +0100
-Subject: Drop config.h include in tools/imximage.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Accepted
-
-"make tools-all" should allow building tools such as mkimage and the new
-imximage without any config, but imximage.c currently fails to build
-with:
-imximage.h:27:20: error: config.h: No such file or directory
-
-config.h is not needed in imximage.h nor in imximage.c, and imximage.h
-is only included from imximage.c, so drop this include to fix the build.
-
-Signed-off-by: Loïc Minier <loic.minier@linaro.org>
----
- tools/imximage.h |    2 --
- 1 files changed, 0 insertions(+), 2 deletions(-)
-
-diff --git a/tools/imximage.h b/tools/imximage.h
-index 38ca6be..d126a46 100644
---- a/tools/imximage.h
-+++ b/tools/imximage.h
-@@ -24,8 +24,6 @@
- #ifndef _IMXIMAGE_H_
- #define _IMXIMAGE_H_
- 
--#include <config.h>
--
- #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for v2 */
- #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set for v1 */
- #define APP_CODE_BARKER	0xB1
--- 
-1.7.4.4
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
deleted file mode 100644
index 5729cd9..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001
-From: Ilya Yanok <yanok@emcraft.com>
-Date: Mon, 20 Jun 2011 12:45:37 +0000
-Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
-
-Upstream-Status: Accepted
-
-LDSCRIPT is used only from the top-level Makefile and only when the
-system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
-related logic into the top level Makefile and under configured condition
-to avoid errors when building tools from unconfigured tree.
-
-Signed-off-by: Ilya Yanok <yanok@emcraft.com>
-Acked-by: Mike Frysinger <vapier@gentoo.org>
----
- Makefile  |   30 ++++++++++++++++++++++++++++++
- config.mk |    8 --------
- 2 files changed, 30 insertions(+), 8 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index ece91ab..358c410 100644
---- a/Makefile
-+++ b/Makefile
-@@ -163,6 +163,36 @@ endif
- # load other configuration
- include $(TOPDIR)/config.mk
- 
-+# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT, use
-+# that (or fail if absent).  Otherwise, search for a linker script in a
-+# standard location.
-+
-+ifndef LDSCRIPT
-+	#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
-+	ifdef CONFIG_SYS_LDSCRIPT
-+		# need to strip off double quotes
-+		LDSCRIPT := $(subst ",,$(CONFIG_SYS_LDSCRIPT))
-+	endif
-+endif
-+
-+ifndef LDSCRIPT
-+	ifeq ($(CONFIG_NAND_U_BOOT),y)
-+		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
-+		ifeq ($(wildcard $(LDSCRIPT)),)
-+			LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot-nand.lds
-+		endif
-+	endif
-+	ifeq ($(wildcard $(LDSCRIPT)),)
-+		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
-+	endif
-+	ifeq ($(wildcard $(LDSCRIPT)),)
-+		LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot.lds
-+	endif
-+	ifeq ($(wildcard $(LDSCRIPT)),)
-+$(error could not find linker script)
-+	endif
-+endif
-+
- #########################################################################
- # U-Boot objects....order is important (i.e. start must be first)
- 
-diff --git a/config.mk b/config.mk
-index fa46ff1..59c4c93 100644
---- a/config.mk
-+++ b/config.mk
-@@ -153,14 +153,6 @@ endif
- RELFLAGS= $(PLATFORM_RELFLAGS)
- DBGFLAGS= -g # -DDEBUG
- OPTFLAGS= -Os #-fomit-frame-pointer
--ifndef LDSCRIPT
--#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
--ifeq ($(CONFIG_NAND_U_BOOT),y)
--LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
--else
--LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
--endif
--endif
- OBJCFLAGS += --gap-fill=0xff
- 
- gccincdir := $(shell $(CC) -print-file-name=include)
--- 
-1.7.5.4
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
deleted file mode 100644
index 34bae8e..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "U-boot bootloader mkimage tool"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
-SECTION = "bootloader"
-
-PR = "r1"
-
-SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
-           file://0001-Drop-config.h-include-in-tools-imximage.h.patch \
-           file://0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch"
-
-SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
-SRC_URI[sha256sum] = "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
-
-S = "${WORKDIR}/u-boot-${PV}"
-
-BBCLASSEXTEND = "native nativesdk"
-
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTSTRIP=true'
-
-do_compile () {
-  oe_runmake tools
-}
-
-do_install () {
-  install -d ${D}${bindir}
-  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-  ln -sf uboot-mkimage ${D}${bindir}/mkimage
-}
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
deleted file mode 100644
index 3ca0c2c..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "U-boot bootloader mkimage tool"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
-SECTION = "bootloader"
-
-PR = "r0"
-
-SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
-SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
-
-S = "${WORKDIR}/u-boot-${PV}"
-
-BBCLASSEXTEND = "native nativesdk"
-
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
-
-do_compile () {
-  oe_runmake tools
-}
-
-do_install () {
-  install -d ${D}${bindir}
-  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-  ln -sf uboot-mkimage ${D}${bindir}/mkimage
-}
-
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
deleted file mode 100644
index 2b39998..0000000
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-DESCRIPTION = "U-boot bootloader mkimage tool"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-SECTION = "bootloader"
-
-# This is needs to be validated among supported BSP's before we can
-# make it default
-DEFAULT_PREFERENCE = "-1"
-
-# This revision corresponds to the tag "v2013.01.01"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
-
-PV = "v2013.01.01+git${SRCPV}"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
-
-do_compile () {
-  oe_runmake tools
-}
-
-do_install () {
-  install -d ${D}${bindir}
-  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
-  ln -sf uboot-mkimage ${D}${bindir}/mkimage
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
new file mode 100644
index 0000000..0108e00
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "U-boot bootloader mkimage tool"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
+SECTION = "bootloader"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "8445162690052e6afd4b8f87af2bb557"
+SRC_URI[sha256sum] = "2bbd440c1b29928d230604eac372fda5152d3ae23f52b1910c77fc5bf531250b"
+
+S = "${WORKDIR}/u-boot-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
+
+do_compile () {
+  oe_runmake tools
+}
+
+do_install () {
+  install -d ${D}${bindir}
+  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
+  ln -sf uboot-mkimage ${D}${bindir}/mkimage
+}
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
deleted file mode 100644
index a9cbeca..0000000
--- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require u-boot.inc
-
-# To build u-boot for your machine, provide the following lines in your machine
-# config, replacing the assignments as appropriate for your machine.
-# UBOOT_MACHINE = "omap3_beagle_config"
-# UBOOT_ENTRYPOINT = "0x80008000"
-# UBOOT_LOADADDRESS = "0x80008000"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
-
-# This revision corresponds to the tag "v2011.03"
-# We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
-
-PV = "v2011.03+git${SRCPV}"
-PR = "r8"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
deleted file mode 100644
index a115ed2..0000000
--- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require u-boot.inc
-
-# To build u-boot for your machine, provide the following lines in your machine
-# config, replacing the assignments as appropriate for your machine.
-# UBOOT_MACHINE = "omap3_beagle_config"
-# UBOOT_ENTRYPOINT = "0x80008000"
-# UBOOT_LOADADDRESS = "0x80008000"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
-
-# This revision corresponds to the tag "v2011.06"
-# We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
-
-PV = "v2011.06+git${SRCPV}"
-PR = "r3"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb b/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
deleted file mode 100644
index 8ffb8f3..0000000
--- a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require u-boot.inc
-
-# This is needs to be validated among supported BSP's before we can
-# make it default
-DEFAULT_PREFERENCE = "-1"
-
-# To build u-boot for your machine, provide the following lines in
-# your machine config, replacing the assignments as appropriate for
-# your machine.
-# UBOOT_MACHINE = "omap3_beagle_config"
-# UBOOT_ENTRYPOINT = "0x80008000"
-# UBOOT_LOADADDRESS = "0x80008000"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
-
-# This revision corresponds to the tag "v2013.01.01"
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV = "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
-
-PV = "v2013.01.01+git${SRCPV}"
-PR = "r0"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
new file mode 100644
index 0000000..f3f4b62
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -0,0 +1,23 @@
+require u-boot.inc
+
+# To build u-boot for your machine, provide the following lines in your machine
+# config, replacing the assignments as appropriate for your machine.
+# UBOOT_MACHINE = "omap3_beagle_config"
+# UBOOT_ENTRYPOINT = "0x80008000"
+# UBOOT_LOADADDRESS = "0x80008000"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
+
+# This revision corresponds to the tag "v2013.07"
+# We use the revision in order to avoid having to fetch it from the repo during parse
+SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+
+PV = "v2013.07+git${SRCPV}"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.8.3.4


