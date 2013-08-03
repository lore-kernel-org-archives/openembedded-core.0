Return-Path: <lpapp@archlinux.us>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 181056A59D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 09:17:38 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so1186874wgg.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 02:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=NANHsnYKGm8BiAmAREI8CIsbSYLMjDbS3mMO85Ne5Cc=;
	b=jV0ZoIqFahfnrTD65cTr/2gnCDvQ8YtoPGgh/UkiSicJ6BraZf3r8WEmDf8n7KixUP
	pJg5fv11x3z7e0G403ZqLNg2BaUzP2WF8a74Iqg3b2zGiHZJQ9LV58UwduhYXs1a+hHF
	LaZU1odMWEwQyXBvN+d5fHcq5vpc+/7p2BSq5+qC+fTLi6mRtPo1TxvloVEMwGBzBrJC
	NH2nOUG7NPjamnnGoQ1cmNhno6w1baHmRdcRwVAL5hbMK3Oz+MN3OfgH3Fz0zK+6Kw2p
	8pqHwBpoQACtGOCEcqIqekowsw7jbXsAE5HDCMbQJTDybbfXAFJn05Ha1CeumGnf84KF
	Vtlw==
X-Gm-Message-State: ALoCoQlCWnypmIi6Oe1huZG6k4CY7wiIgAIMoi0x1rjWF7QMbqZavoWdyZbXYkOPvETvNvpcmjyC
X-Received: by 10.180.12.45 with SMTP id v13mr1351086wib.7.1375521459057;
	Sat, 03 Aug 2013 02:17:39 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginmedia.com.
	[86.30.245.31])
	by mx.google.com with ESMTPSA id b13sm8218298wic.9.2013.08.03.02.17.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 02:17:38 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Sat, 03 Aug 2013 10:17:50 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Aug 2013 10:17:49 +0100
Message-Id: <1375521469-1654-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.3.4
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
X-List-Received-Date: Sat, 03 Aug 2013 09:17:39 -0000

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 26 +++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 27 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2013.07.bb          | 25 ++++++++++++++++++++
 3 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
new file mode 100644
index 0000000..8d13151
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
+                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
+SECTION = "bootloader"
+
+DEPENDS = "mtd-utils"
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
diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
new file mode 100644
index 0000000..8e05558
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -0,0 +1,25 @@
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
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.8.3.4


