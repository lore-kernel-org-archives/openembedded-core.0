Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id A0E586FF01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 18:39:40 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id s5so52834685qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=xk0jdjQvecatmMmSjXXpi0ePQQljXx1MHw2M6zlEAFU=;
	b=mOcikdHl3KYoW/nCY3inwmUAl3LgKkUmQU8Lao39IDe6VTwVwRjNkcZWnmxCcHRE16
	H4XiRXO6AkmApKIuYruVehhVnrsFtFKQcwJN9KbsWhEW8OQcEOBuPsjh+LjrLkIKuKUI
	I02yrpstj3U/IESezCtGXAUERxrm8w9VcRxHN4WWYfsBA4Y7USKJ9qAlLFtxRcaz0OSQ
	txTmgqTIFh6NBJGqEkgW30+hJ1V0XBPy92EjjdBGktfWA7js2LKtkavWxIdSWFe6d12y
	ApXrHCCqzjjc0lTpMFfHAzWVcVhqF5gRYqBatc4irHtX9rn+k/tATcmhCCma0C2iHaEy
	xC9Q==
X-Gm-Message-State: AD7BkJIuEfEXy/EfUaJWWOcJCJu98ZHv+vAcoFefgCUk6fhmlUpLvXK7edbLnEH08DIv5A==
X-Received: by 10.55.73.85 with SMTP id w82mr24414933qka.52.1458326381343;
	Fri, 18 Mar 2016 11:39:41 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	z62sm6541452qka.26.2016.03.18.11.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Mar 2016 11:39:39 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 18 Mar 2016 15:39:35 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Mar 2016 15:39:34 -0300
Message-Id: <1458326374-8865-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2016.03 release
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
X-List-Received-Date: Fri, 18 Mar 2016 18:39:41 -0000

The 2016.03 release has been announced in March 14th. This
incorporates a lot of bug fixes and improvements which are useful for
any new embedded development.

Along with the upgrade of U-Boot and its related recipes, this patch
also drops the AM335x environment fix which has been merged into the
release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...utils_2016.01.bb => u-boot-fw-utils_2036.03.bb} |  8 ++---
 ...kimage_2016.01.bb => u-boot-mkimage_2036.03.bb} |  8 ++---
 meta/recipes-bsp/u-boot/u-boot.inc                 |  5 ++--
 .../0001-am335x_evm.h-unsed-CONFIG_BOOTDELAY.patch | 34 ----------------------
 .../{u-boot_2016.01.bb => u-boot_2036.03.bb}       |  6 ++--
 5 files changed, 13 insertions(+), 48 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.01.bb => u-boot-fw-utils_2036.03.bb} (86%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.01.bb => u-boot-mkimage_2036.03.bb} (75%)
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot/0001-am335x_evm.h-unsed-CONFIG_BOOTDELAY.patch
 rename meta/recipes-bsp/u-boot/{u-boot_2016.01.bb => u-boot_2036.03.bb} (50%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2036.03.bb
similarity index 86%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2036.03.bb
index 30b7c7a..dfda5c1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2036.03.bb
@@ -1,15 +1,15 @@
 SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 SECTION = "bootloader"
 DEPENDS = "mtd-utils"
 
-# This revision corresponds to the tag "v2016.01"
+# This revision corresponds to the tag "v2016.03"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "fa85e826c16b9ce1ad302a57e9c4b24db0d8b930"
+SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
 
-PV = "v2016.01+git${SRCPV}"
+PV = "v2016.03+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2036.03.bb
similarity index 75%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2036.03.bb
index 5d163a8..d5921a0 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2036.03.bb
@@ -1,16 +1,16 @@
 SUMMARY = "U-Boot bootloader image creation tool"
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 SECTION = "bootloader"
 
 DEPENDS = "openssl"
 
-# This revision corresponds to the tag "v2016.01"
+# This revision corresponds to the tag "v2016.03"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "fa85e826c16b9ce1ad302a57e9c4b24db0d8b930"
+SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
 
-PV = "v2016.01+git${SRCPV}"
+PV = "v2016.03+git${SRCPV}"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index ac8f338..48be71d 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -4,10 +4,9 @@ SECTION = "bootloaders"
 PROVIDES = "virtual/bootloader"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
-           file://0001-am335x_evm.h-unsed-CONFIG_BOOTDELAY.patch"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot/0001-am335x_evm.h-unsed-CONFIG_BOOTDELAY.patch b/meta/recipes-bsp/u-boot/u-boot/0001-am335x_evm.h-unsed-CONFIG_BOOTDELAY.patch
deleted file mode 100644
index 70c87c4..0000000
--- a/meta/recipes-bsp/u-boot/u-boot/0001-am335x_evm.h-unsed-CONFIG_BOOTDELAY.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 7205442e621db54ea06c3bca2d793e1ae2214f9c Mon Sep 17 00:00:00 2001
-From: Tom Rini <trini@konsulko.com>
-Date: Thu, 10 Dec 2015 16:46:01 -0500
-Subject: [PATCH] am335x_evm.h: unsed CONFIG_BOOTDELAY
-
-Now that ti_armv7_common.h uses config_distro_defaults.h we don't need
-to include it again and then undef CONFIG_BOOTDELAY
-
-Signed-off-by: Tom Rini <trini@konsulko.com>
-
-Upstream-Status: Backport
-
----
- include/configs/am335x_evm.h | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
-index c51db8c..cf6a606 100644
---- a/include/configs/am335x_evm.h
-+++ b/include/configs/am335x_evm.h
-@@ -18,10 +18,6 @@
-
- #include <configs/ti_am335x_common.h>
-
--/* Don't override the distro default bootdelay */
--#undef CONFIG_BOOTDELAY
--#include <config_distro_defaults.h>
--
- #ifndef CONFIG_SPL_BUILD
- #ifndef CONFIG_FIT
- # define CONFIG_FIT
---
-2.7.0
-
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.01.bb b/meta/recipes-bsp/u-boot/u-boot_2036.03.bb
similarity index 50%
rename from meta/recipes-bsp/u-boot/u-boot_2016.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2036.03.bb
index d5c1181..836b0ce 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2016.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2036.03.bb
@@ -2,9 +2,9 @@ require u-boot.inc
 
 DEPENDS += "dtc-native"
 
-# This revision corresponds to the tag "v2016.01"
+# This revision corresponds to the tag "v2016.03"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "fa85e826c16b9ce1ad302a57e9c4b24db0d8b930"
+SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
 
-PV = "v2016.01+git${SRCPV}"
+PV = "v2016.03+git${SRCPV}"
-- 
2.7.3


