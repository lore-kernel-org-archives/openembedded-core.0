Return-Path: <djszapi@archlinux.us>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 70DB66A5AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:18:45 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id p58so602800wes.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 06:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=2nNukC/MzyaMxeShOM6tq1ZdFV5K9mXg47oplFVjeAs=;
	b=BARN67PUbJXC52K4n+HHuc8lsDrLP9KXTG8nl9CLmpzmQKcInqhyUYb22wcw07Q4C5
	eH0QcEdmARSI6+vZAy7eJhixikYfBXPBYdq1Y+NZ7tkVNSqzM7fwE9U7lvg71zffZfU0
	GjHXeYrJWudeBtkWEx6kfa4HZykQWat5/SPHxKiHQcvFLRQsQcLh+JMYmeqK62+z35vC
	sy/OUK+egeteR6Go90RMa/Q9bh7FMttAsDgyaujg/xypnKEHZFZ591sYOWgeO/PAuQFg
	YSZY1x3PkXR7ZczqA/hKh+XFLdfmZoCQx20w1wIuKqv1XKv4C3KNizw7/VfADklE8Hqd
	xz/A==
X-Received: by 10.194.190.201 with SMTP id gs9mr8992431wjc.82.1375276725555;
	Wed, 31 Jul 2013 06:18:45 -0700 (PDT)
Received: from djszapi@archlinux.us ([212.44.19.228])
	by mx.google.com with ESMTPSA id
	nb12sm35309212wic.7.2013.07.31.06.18.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Jul 2013 06:18:44 -0700 (PDT)
Sender: Laszlo Papp <djszapi@archlinux.us>
Received: by djszapi@archlinux.us (sSMTP sendmail emulation);
	Wed, 31 Jul 2013 14:16:55 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 14:16:54 +0100
Message-Id: <1375276614-24376-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.3.4
X-Gm-Message-State: ALoCoQm1iIdSCGJ09H1oCkgvb+8aAFz0wVoX69Wv2QLyT4IHfNkPSiC/GxeAdV8ZEeyEuJFDJP/0
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
X-List-Received-Date: Wed, 31 Jul 2013 13:18:46 -0000

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 28 +++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 29 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2013.07.bb          | 26 +++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
new file mode 100644
index 0000000..e20e5f9
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
+SECTION = "bootloader"
+
+DEPENDS = "mtd-utils"
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
+EXTRA_OEMAKE = 'HOSTCC="${CC}"'
+
+do_compile () {
+  oe_runmake env
+}
+
+do_install () {
+  install -d ${D}${base_sbindir}
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
+  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
+}
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
new file mode 100644
index 0000000..abd373f
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "U-boot bootloader mkimage tool"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
+SECTION = "bootloader"
+
+PR = "r0"
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
diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
new file mode 100644
index 0000000..111c066
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
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
+                    file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
+
+FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
+
+# This revision corresponds to the tag "v2013.07"
+# We use the revision in order to avoid having to fetch it from the repo during parse
+SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
+
+PV = "v2013.07+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.8.3.4


