Return-Path: <lpapp@archlinux.us>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 79FBA6B302
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 09:48:07 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id t60so331915wes.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 02:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=NM+NrZzqZ4j8gndIkHngJg7aFR7WWs/iFCT4ustQLbE=;
	b=eeEvsEvamfp8I/cFKsDF0z8pPHjSybekkDFFSKnavBaH6yMxz4rGrrla/hz+3P8++0
	2a8ZYiY9+urTDMxEtRJTNBBkKzea7DRLzrRJas30vex30RRwsvOXb79/N6R7QNcUr35w
	M7TZBmPun8f+ab2hrdBPVPI0qLzoe0/nn8bdtcaIM0g//tAd46vRm9Y2mjGy4TaVAght
	r/oYtg1C7eqrTSoEZELPH0qbv1ALO+aGVZApuJa9B7CnB3t78oHTq8l9OpdUNNRbj1mN
	iy2Qb8RlnXGUeA0eB29EqXbfmXsmKBpATCk3R/9tZwD6vTooobLHzWH8eSrHz+azFavm
	XySQ==
X-Gm-Message-State: ALoCoQnJ934yjTFSQyJ1ezKDpzF+RD/pLVJKVEajjdFEL1ebxrQmHiN/SK2W3e8Abqo/2sUwh1w+
X-Received: by 10.194.123.199 with SMTP id mc7mr755612wjb.43.1377251287176;
	Fri, 23 Aug 2013 02:48:07 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginmedia.com.
	[86.30.245.31])
	by mx.google.com with ESMTPSA id gg10sm2573106wib.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 02:48:05 -0700 (PDT)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Fri, 23 Aug 2013 10:48:14 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 10:48:10 +0100
Message-Id: <1377251290-4290-1-git-send-email-lpapp@kde.org>
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
X-List-Received-Date: Fri, 23 Aug 2013 09:48:09 -0000

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb | 27 +++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2013.07.bb         | 23 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb

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


