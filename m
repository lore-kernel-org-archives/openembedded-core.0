Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcXgW-0004GP-70
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 08:58:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2011 23:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,456,1304319600"; d="scan'208";a="25080509"
Received: from unknown (HELO swold-MOBL.localdomain) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2011 23:54:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 23:54:29 -0700
Message-Id: <1b743a32b4fc3ccdea5ebbb94691d6441bdd706a.1309503004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309503004.git.sgw@linux.intel.com>
References: <cover.1309503004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1309503004.git.sgw@linux.intel.com>
References: <cover.1309503004.git.sgw@linux.intel.com>
Subject: [PATCH 2/4] uboot: Update to 2011.06
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
X-List-Received-Date: Fri, 01 Jul 2011 06:58:41 -0000

[YOCTO #1198]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...Drop-config.h-include-in-tools-imximage.h.patch |    0
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    0
 ...kimage_2011.03.bb => u-boot-mkimage_2011.06.bb} |   12 +++++-------
 .../uboot/{u-boot_2011.03.bb => u-boot_2011.06.bb} |   10 +++++-----
 4 files changed, 10 insertions(+), 12 deletions(-)
 rename meta/recipes-bsp/uboot/{u-boot-mkimage-2011.03 => u-boot-mkimage-2011.06}/0001-Drop-config.h-include-in-tools-imximage.h.patch (100%)
 rename meta/recipes-bsp/uboot/{u-boot-mkimage-2011.03 => u-boot-mkimage-2011.06}/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch (100%)
 rename meta/recipes-bsp/uboot/{u-boot-mkimage_2011.03.bb => u-boot-mkimage_2011.06.bb} (51%)
 rename meta/recipes-bsp/uboot/{u-boot_2011.03.bb => u-boot_2011.06.bb} (74%)

diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.06/0001-Drop-config.h-include-in-tools-imximage.h.patch
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
rename to meta/recipes-bsp/uboot/u-boot-mkimage-2011.06/0001-Drop-config.h-include-in-tools-imximage.h.patch
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.06/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
rename to meta/recipes-bsp/uboot/u-boot-mkimage-2011.06/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
similarity index 51%
rename from meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
rename to meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
index 34bae8e..6f2a2ca 100644
--- a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
@@ -1,17 +1,15 @@
 DESCRIPTION = "U-boot bootloader mkimage tool"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
+                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
 SECTION = "bootloader"
 
-PR = "r1"
+PR = "r0"
 
-SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
-           file://0001-Drop-config.h-include-in-tools-imximage.h.patch \
-           file://0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch"
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "91d02124c94368557d0e9ac05fb8c33f"
-SRC_URI[sha256sum] = "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
+SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
+SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
 
 S = "${WORKDIR}/u-boot-${PV}"
 
diff --git a/meta/recipes-bsp/uboot/u-boot_2011.03.bb b/meta/recipes-bsp/uboot/u-boot_2011.06.bb
similarity index 74%
rename from meta/recipes-bsp/uboot/u-boot_2011.03.bb
rename to meta/recipes-bsp/uboot/u-boot_2011.06.bb
index 34655ea..acd0944 100644
--- a/meta/recipes-bsp/uboot/u-boot_2011.03.bb
+++ b/meta/recipes-bsp/uboot/u-boot_2011.06.bb
@@ -8,16 +8,16 @@ require u-boot.inc
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
-                    file://README;beginline=1;endline=22;md5=3a00ef51d3fc96e9d6c1bc4708ccd3b5"
+                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE}"
 
-# This revision corresponds to the tag "v2011.03"
+# This revision corresponds to the tag "v2011.06"
 # We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "19b54a701811220221fc4d5089a2bb18892018ca"
+SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
 
-PV = "v2011.03+git${SRCPV}"
-PR = "r5"
+PV = "v2011.06+git${SRCPV}"
+PR = "r0"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 
-- 
1.7.3.4



