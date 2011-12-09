Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZ5Dh-0004B1-Ao
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 19:30:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2011 10:23:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100564262"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2011 10:23:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Fri,  9 Dec 2011 10:23:48 -0800
Message-Id: <f83bbfca3bcc303532b83659afb11b16cb36f5a8.1323454935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/15] u-boot: renamed dir from uboot to the more appropriate u-boot
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
X-List-Received-Date: Fri, 09 Dec 2011 18:30:54 -0000

From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

recipe dirs normally have the name of the (main) package and the official name is u-boot

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 .../{uboot => u-boot}/files/fix-arm920t-eabi.patch |    0
 ...Drop-config.h-include-in-tools-imximage.h.patch |    0
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    0
 ...Drop-config.h-include-in-tools-imximage.h.patch |    0
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    0
 .../{uboot => u-boot}/u-boot-mkimage_2011.03.bb    |    0
 .../{uboot => u-boot}/u-boot-mkimage_2011.06.bb    |    0
 meta/recipes-bsp/{uboot => u-boot}/u-boot.inc      |    0
 .../{uboot => u-boot}/u-boot_2011.03.bb            |    0
 .../{uboot => u-boot}/u-boot_2011.06.bb            |    0
 10 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-bsp/{uboot => u-boot}/files/fix-arm920t-eabi.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage_2011.03.bb (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot-mkimage_2011.06.bb (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot.inc (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot_2011.03.bb (100%)
 rename meta/recipes-bsp/{uboot => u-boot}/u-boot_2011.06.bb (100%)

diff --git a/meta/recipes-bsp/uboot/files/fix-arm920t-eabi.patch b/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
similarity index 100%
rename from meta/recipes-bsp/uboot/files/fix-arm920t-eabi.patch
rename to meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
rename to meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
rename to meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
rename to meta/recipes-bsp/u-boot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
rename to meta/recipes-bsp/u-boot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot-mkimage_2011.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot-mkimage_2011.06.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
diff --git a/meta/recipes-bsp/uboot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot.inc
rename to meta/recipes-bsp/u-boot/u-boot.inc
diff --git a/meta/recipes-bsp/uboot/u-boot_2011.03.bb b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot_2011.03.bb
rename to meta/recipes-bsp/u-boot/u-boot_2011.03.bb
diff --git a/meta/recipes-bsp/uboot/u-boot_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
similarity index 100%
rename from meta/recipes-bsp/uboot/u-boot_2011.06.bb
rename to meta/recipes-bsp/u-boot/u-boot_2011.06.bb
-- 
1.7.6.4



