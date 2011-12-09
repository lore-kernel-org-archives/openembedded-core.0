Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RYuvn-0001ou-Vl
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 08:31:44 +0100
Received: by eekb15 with SMTP id b15so1415975eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 23:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=E+PsiS9ixB1q727aX/vbDWRIya8RBNibXgjNCWuhhVg=;
	b=Je7I8ZLsuAzqnKlXDdE0g2eSDkj8qs9Ld8k3YVPa8kSdK60+Qx8LQ3UjOpWzf5Tzis
	ZArcxarBstgZZzrQMqbh461ufBROSLMUPRzgc9dZlRJFhJppwocChCbeYPklqkDO+vrq
	rWYPyBaYD3AXZrOY2UaPGSrZpLlHVN0ep81Uc=
Received: by 10.14.20.3 with SMTP id o3mr667143eeo.102.1323415493028;
	Thu, 08 Dec 2011 23:24:53 -0800 (PST)
Received: from localhost.localdomain (D4B26BC1.static.ziggozakelijk.nl.
	[212.178.107.193])
	by mx.google.com with ESMTPS id 49sm27750946eec.1.2011.12.08.23.24.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 23:24:51 -0800 (PST)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 08:24:35 +0100
Message-Id: <1323415475-21361-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: [PATCH] u-boot: renamed dir from uboot to the more appropriate u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 07:31:44 -0000

recipe dirs normally have the name of the (main) package and the official name is u-boot

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 .../u-boot/files/fix-arm920t-eabi.patch            |   22 +++++
 ...Drop-config.h-include-in-tools-imximage.h.patch |   39 +++++++++
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ++++++++++++++++++++
 ...Drop-config.h-include-in-tools-imximage.h.patch |   39 +++++++++
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 ++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  |   31 ++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  |   29 +++++++
 meta/recipes-bsp/u-boot/u-boot.inc                 |   50 ++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb          |   26 ++++++
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb          |   26 ++++++
 .../recipes-bsp/uboot/files/fix-arm920t-eabi.patch |   22 -----
 ...Drop-config.h-include-in-tools-imximage.h.patch |   39 ---------
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 --------------------
 ...Drop-config.h-include-in-tools-imximage.h.patch |   39 ---------
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |   82 --------------------
 meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb   |   31 --------
 meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb   |   29 -------
 meta/recipes-bsp/uboot/u-boot.inc                  |   50 ------------
 meta/recipes-bsp/uboot/u-boot_2011.03.bb           |   26 ------
 meta/recipes-bsp/uboot/u-boot_2011.06.bb           |   26 ------
 20 files changed, 426 insertions(+), 426 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot.inc
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.03.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.06.bb
 delete mode 100644 meta/recipes-bsp/uboot/files/fix-arm920t-eabi.patch
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
 delete mode 100644 meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
 delete mode 100644 meta/recipes-bsp/uboot/u-boot.inc
 delete mode 100644 meta/recipes-bsp/uboot/u-boot_2011.03.bb
 delete mode 100644 meta/recipes-bsp/uboot/u-boot_2011.06.bb

diff --git a/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch b/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
new file mode 100644
index 0000000..69cb758
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
@@ -0,0 +1,22 @@
+---
+ cpu/arm920t/config.mk |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- u-boot-1.3.2.orig/cpu/arm920t/config.mk
++++ u-boot-1.3.2/cpu/arm920t/config.mk
+@@ -22,13 +22,13 @@
+ #
+ 
+ PLATFORM_RELFLAGS += -fno-strict-aliasing  -fno-common -ffixed-r8 \
+ 	-msoft-float
+ 
+-PLATFORM_CPPFLAGS += -march=armv4
++#PLATFORM_CPPFLAGS += -march=armv4
+ # =========================================================================
+ #
+ # Supply options according to compiler version
+ #
+ # =========================================================================
+-PLATFORM_CPPFLAGS +=$(call cc-option,-mapcs-32,-mabi=apcs-gnu)
++PLATFORM_CPPFLAGS +=$(call cc-option)
+ PLATFORM_RELFLAGS +=$(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,))
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
new file mode 100644
index 0000000..0405834
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
@@ -0,0 +1,39 @@
+From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>
+Date: Thu, 3 Feb 2011 15:07:01 +0100
+Subject: Drop config.h include in tools/imximage.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Accepted
+
+"make tools-all" should allow building tools such as mkimage and the new
+imximage without any config, but imximage.c currently fails to build
+with:
+imximage.h:27:20: error: config.h: No such file or directory
+
+config.h is not needed in imximage.h nor in imximage.c, and imximage.h
+is only included from imximage.c, so drop this include to fix the build.
+
+Signed-off-by: Loïc Minier <loic.minier@linaro.org>
+---
+ tools/imximage.h |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/tools/imximage.h b/tools/imximage.h
+index 38ca6be..d126a46 100644
+--- a/tools/imximage.h
++++ b/tools/imximage.h
+@@ -24,8 +24,6 @@
+ #ifndef _IMXIMAGE_H_
+ #define _IMXIMAGE_H_
+ 
+-#include <config.h>
+-
+ #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for v2 */
+ #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set for v1 */
+ #define APP_CODE_BARKER	0xB1
+-- 
+1.7.4.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
new file mode 100644
index 0000000..5729cd9
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
@@ -0,0 +1,82 @@
+From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001
+From: Ilya Yanok <yanok@emcraft.com>
+Date: Mon, 20 Jun 2011 12:45:37 +0000
+Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
+
+Upstream-Status: Accepted
+
+LDSCRIPT is used only from the top-level Makefile and only when the
+system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
+related logic into the top level Makefile and under configured condition
+to avoid errors when building tools from unconfigured tree.
+
+Signed-off-by: Ilya Yanok <yanok@emcraft.com>
+Acked-by: Mike Frysinger <vapier@gentoo.org>
+---
+ Makefile  |   30 ++++++++++++++++++++++++++++++
+ config.mk |    8 --------
+ 2 files changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ece91ab..358c410 100644
+--- a/Makefile
++++ b/Makefile
+@@ -163,6 +163,36 @@ endif
+ # load other configuration
+ include $(TOPDIR)/config.mk
+ 
++# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT, use
++# that (or fail if absent).  Otherwise, search for a linker script in a
++# standard location.
++
++ifndef LDSCRIPT
++	#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
++	ifdef CONFIG_SYS_LDSCRIPT
++		# need to strip off double quotes
++		LDSCRIPT := $(subst ",,$(CONFIG_SYS_LDSCRIPT))
++	endif
++endif
++
++ifndef LDSCRIPT
++	ifeq ($(CONFIG_NAND_U_BOOT),y)
++		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
++		ifeq ($(wildcard $(LDSCRIPT)),)
++			LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot-nand.lds
++		endif
++	endif
++	ifeq ($(wildcard $(LDSCRIPT)),)
++		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
++	endif
++	ifeq ($(wildcard $(LDSCRIPT)),)
++		LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot.lds
++	endif
++	ifeq ($(wildcard $(LDSCRIPT)),)
++$(error could not find linker script)
++	endif
++endif
++
+ #########################################################################
+ # U-Boot objects....order is important (i.e. start must be first)
+ 
+diff --git a/config.mk b/config.mk
+index fa46ff1..59c4c93 100644
+--- a/config.mk
++++ b/config.mk
+@@ -153,14 +153,6 @@ endif
+ RELFLAGS= $(PLATFORM_RELFLAGS)
+ DBGFLAGS= -g # -DDEBUG
+ OPTFLAGS= -Os #-fomit-frame-pointer
+-ifndef LDSCRIPT
+-#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
+-ifeq ($(CONFIG_NAND_U_BOOT),y)
+-LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
+-else
+-LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
+-endif
+-endif
+ OBJCFLAGS += --gap-fill=0xff
+ 
+ gccincdir := $(shell $(CC) -print-file-name=include)
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
new file mode 100644
index 0000000..0405834
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
@@ -0,0 +1,39 @@
+From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@linaro.org>
+Date: Thu, 3 Feb 2011 15:07:01 +0100
+Subject: Drop config.h include in tools/imximage.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Accepted
+
+"make tools-all" should allow building tools such as mkimage and the new
+imximage without any config, but imximage.c currently fails to build
+with:
+imximage.h:27:20: error: config.h: No such file or directory
+
+config.h is not needed in imximage.h nor in imximage.c, and imximage.h
+is only included from imximage.c, so drop this include to fix the build.
+
+Signed-off-by: Loïc Minier <loic.minier@linaro.org>
+---
+ tools/imximage.h |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/tools/imximage.h b/tools/imximage.h
+index 38ca6be..d126a46 100644
+--- a/tools/imximage.h
++++ b/tools/imximage.h
+@@ -24,8 +24,6 @@
+ #ifndef _IMXIMAGE_H_
+ #define _IMXIMAGE_H_
+ 
+-#include <config.h>
+-
+ #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for v2 */
+ #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set for v1 */
+ #define APP_CODE_BARKER	0xB1
+-- 
+1.7.4.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
new file mode 100644
index 0000000..5729cd9
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
@@ -0,0 +1,82 @@
+From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001
+From: Ilya Yanok <yanok@emcraft.com>
+Date: Mon, 20 Jun 2011 12:45:37 +0000
+Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
+
+Upstream-Status: Accepted
+
+LDSCRIPT is used only from the top-level Makefile and only when the
+system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
+related logic into the top level Makefile and under configured condition
+to avoid errors when building tools from unconfigured tree.
+
+Signed-off-by: Ilya Yanok <yanok@emcraft.com>
+Acked-by: Mike Frysinger <vapier@gentoo.org>
+---
+ Makefile  |   30 ++++++++++++++++++++++++++++++
+ config.mk |    8 --------
+ 2 files changed, 30 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ece91ab..358c410 100644
+--- a/Makefile
++++ b/Makefile
+@@ -163,6 +163,36 @@ endif
+ # load other configuration
+ include $(TOPDIR)/config.mk
+ 
++# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT, use
++# that (or fail if absent).  Otherwise, search for a linker script in a
++# standard location.
++
++ifndef LDSCRIPT
++	#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
++	ifdef CONFIG_SYS_LDSCRIPT
++		# need to strip off double quotes
++		LDSCRIPT := $(subst ",,$(CONFIG_SYS_LDSCRIPT))
++	endif
++endif
++
++ifndef LDSCRIPT
++	ifeq ($(CONFIG_NAND_U_BOOT),y)
++		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
++		ifeq ($(wildcard $(LDSCRIPT)),)
++			LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot-nand.lds
++		endif
++	endif
++	ifeq ($(wildcard $(LDSCRIPT)),)
++		LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
++	endif
++	ifeq ($(wildcard $(LDSCRIPT)),)
++		LDSCRIPT := $(TOPDIR)/$(CPUDIR)/u-boot.lds
++	endif
++	ifeq ($(wildcard $(LDSCRIPT)),)
++$(error could not find linker script)
++	endif
++endif
++
+ #########################################################################
+ # U-Boot objects....order is important (i.e. start must be first)
+ 
+diff --git a/config.mk b/config.mk
+index fa46ff1..59c4c93 100644
+--- a/config.mk
++++ b/config.mk
+@@ -153,14 +153,6 @@ endif
+ RELFLAGS= $(PLATFORM_RELFLAGS)
+ DBGFLAGS= -g # -DDEBUG
+ OPTFLAGS= -Os #-fomit-frame-pointer
+-ifndef LDSCRIPT
+-#LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
+-ifeq ($(CONFIG_NAND_U_BOOT),y)
+-LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
+-else
+-LDSCRIPT := $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
+-endif
+-endif
+ OBJCFLAGS += --gap-fill=0xff
+ 
+ gccincdir := $(shell $(CC) -print-file-name=include)
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
new file mode 100644
index 0000000..34bae8e
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "U-boot bootloader mkimage tool"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
+SECTION = "bootloader"
+
+PR = "r1"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
+           file://0001-Drop-config.h-include-in-tools-imximage.h.patch \
+           file://0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch"
+
+SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
+SRC_URI[sha256sum] = "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
+
+S = "${WORKDIR}/u-boot-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTSTRIP=true'
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
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
new file mode 100644
index 0000000..3ca0c2c
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "U-boot bootloader mkimage tool"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
+SECTION = "bootloader"
+
+PR = "r0"
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
+SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
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
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
new file mode 100644
index 0000000..544acd2
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -0,0 +1,50 @@
+DESCRIPTION = "U-boot bootloader"
+HOMEPAGE = "http://u-boot.sf.net"
+SECTION = "bootloaders"
+PROVIDES = "virtual/bootloader"
+
+inherit deploy
+
+PARALLEL_MAKE=""
+
+# GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
+
+python () {
+	if not d.getVar("UBOOT_MACHINE", True):
+		PN = d.getVar("PN", True)
+		FILE = os.path.basename(d.getVar("FILE", True))
+		bb.debug(1, "To build %s, see %s for instructions on \
+			     setting up your machine config" % (PN, FILE))
+		raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
+}
+
+UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
+UBOOT_BINARY ?= "u-boot.bin"
+UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
+UBOOT_MAKE_TARGET ?= "all"
+
+do_compile () {
+	unset LDFLAGS
+	unset CFLAGS
+	unset CPPFLAGS
+	oe_runmake ${UBOOT_MACHINE}
+	oe_runmake ${UBOOT_MAKE_TARGET}
+}
+
+do_install () {
+    install -d ${D}/boot
+    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+FILES_${PN} = "/boot"
+
+do_deploy () {
+	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
+
+	cd ${DEPLOYDIR}
+	rm -f ${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
+}
+addtask deploy before do_build after do_compile
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
new file mode 100644
index 0000000..1ebdbea
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
@@ -0,0 +1,26 @@
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
+                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
+
+FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
+
+# This revision corresponds to the tag "v2011.03"
+# We use the revision in order to avoid having to fetch it from the repo during parse
+SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
+
+PV = "v2011.03+git${SRCPV}"
+PR = "r5"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
new file mode 100644
index 0000000..8ebdbff
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -0,0 +1,26 @@
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
+                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
+
+FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
+
+# This revision corresponds to the tag "v2011.06"
+# We use the revision in order to avoid having to fetch it from the repo during parse
+SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
+
+PV = "v2011.06+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/uboot/files/fix-arm920t-eabi.patch b/meta/recipes-bsp/uboot/files/fix-arm920t-eabi.patch
deleted file mode 100644
index 69cb758..0000000
--- a/meta/recipes-bsp/uboot/files/fix-arm920t-eabi.patch
+++ /dev/null
@@ -1,22 +0,0 @@
----
- cpu/arm920t/config.mk |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- u-boot-1.3.2.orig/cpu/arm920t/config.mk
-+++ u-boot-1.3.2/cpu/arm920t/config.mk
-@@ -22,13 +22,13 @@
- #
- 
- PLATFORM_RELFLAGS += -fno-strict-aliasing  -fno-common -ffixed-r8 \
- 	-msoft-float
- 
--PLATFORM_CPPFLAGS += -march=armv4
-+#PLATFORM_CPPFLAGS += -march=armv4
- # =========================================================================
- #
- # Supply options according to compiler version
- #
- # =========================================================================
--PLATFORM_CPPFLAGS +=$(call cc-option,-mapcs-32,-mabi=apcs-gnu)
-+PLATFORM_CPPFLAGS +=$(call cc-option)
- PLATFORM_RELFLAGS +=$(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,))
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
deleted file mode 100644
index 0405834..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
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
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
deleted file mode 100644
index 5729cd9..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
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
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
deleted file mode 100644
index 0405834..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
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
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
deleted file mode 100644
index 5729cd9..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
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
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
deleted file mode 100644
index 34bae8e..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
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
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
deleted file mode 100644
index 3ca0c2c..0000000
--- a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
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
diff --git a/meta/recipes-bsp/uboot/u-boot.inc b/meta/recipes-bsp/uboot/u-boot.inc
deleted file mode 100644
index 544acd2..0000000
--- a/meta/recipes-bsp/uboot/u-boot.inc
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION = "U-boot bootloader"
-HOMEPAGE = "http://u-boot.sf.net"
-SECTION = "bootloaders"
-PROVIDES = "virtual/bootloader"
-
-inherit deploy
-
-PARALLEL_MAKE=""
-
-# GCC 4.5.1 builds unusable binaries using -Os, remove it from OPTFLAGS
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} OPTFLAGS='-O2'"
-
-python () {
-	if not d.getVar("UBOOT_MACHINE", True):
-		PN = d.getVar("PN", True)
-		FILE = os.path.basename(d.getVar("FILE", True))
-		bb.debug(1, "To build %s, see %s for instructions on \
-			     setting up your machine config" % (PN, FILE))
-		raise bb.parse.SkipPackage("because UBOOT_MACHINE is not set")
-}
-
-UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
-UBOOT_BINARY ?= "u-boot.bin"
-UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
-UBOOT_MAKE_TARGET ?= "all"
-
-do_compile () {
-	unset LDFLAGS
-	unset CFLAGS
-	unset CPPFLAGS
-	oe_runmake ${UBOOT_MACHINE}
-	oe_runmake ${UBOOT_MAKE_TARGET}
-}
-
-do_install () {
-    install -d ${D}/boot
-    install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-    ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-FILES_${PN} = "/boot"
-
-do_deploy () {
-	install ${S}/u-boot.bin ${DEPLOYDIR}/${UBOOT_IMAGE}
-
-	cd ${DEPLOYDIR}
-	rm -f ${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
-}
-addtask deploy before do_build after do_compile
diff --git a/meta/recipes-bsp/uboot/u-boot_2011.03.bb b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
deleted file mode 100644
index 1ebdbea..0000000
--- a/meta/recipes-bsp/uboot/u-boot_2011.03.bb
+++ /dev/null
@@ -1,26 +0,0 @@
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
-FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
-
-# This revision corresponds to the tag "v2011.03"
-# We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
-
-PV = "v2011.03+git${SRCPV}"
-PR = "r5"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/meta/recipes-bsp/uboot/u-boot_2011.06.bb b/meta/recipes-bsp/uboot/u-boot_2011.06.bb
deleted file mode 100644
index 8ebdbff..0000000
--- a/meta/recipes-bsp/uboot/u-boot_2011.06.bb
+++ /dev/null
@@ -1,26 +0,0 @@
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
-FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
-
-# This revision corresponds to the tag "v2011.06"
-# We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
-
-PV = "v2011.06+git${SRCPV}"
-PR = "r0"
-
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.0.4



