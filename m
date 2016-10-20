Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 28AE570100
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 13:35:21 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t08vG0fgsz3hjWh;
	Thu, 20 Oct 2016 15:35:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t08vF6sDfzvkjb;
	Thu, 20 Oct 2016 15:35:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id kPD1Ropc5tKb; Thu, 20 Oct 2016 15:35:17 +0200 (CEST)
X-Auth-Info: +cn/pjMjAaxHJv9O6Y3N/0fJdkoC3HHvpqwqjS/BGZ8=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Thu, 20 Oct 2016 15:35:17 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2016 15:35:11 +0200
Message-Id: <20161020133514.3403-1-marex@denx.de>
X-Mailer: git-send-email 2.9.3
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Thu, 20 Oct 2016 13:35:22 -0000

Upgrade U-Boot to the latest version.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
---
 .../{u-boot-common_2016.03.inc => u-boot-common_2016.09.01.inc}   | 8 ++++----
 .../{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.09.01.bb} | 0
 .../{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.09.01.bb}   | 0
 .../u-boot/{u-boot_2016.03.bb => u-boot_2016.09.01.bb}            | 0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2016.03.inc => u-boot-common_2016.09.01.inc} (59%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.09.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.09.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2016.03.bb => u-boot_2016.09.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
similarity index 59%
rename from meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
index 403e316..ead5077 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
@@ -4,13 +4,13 @@ SECTION = "bootloaders"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-# This revision corresponds to the tag "v2016.03"
+# This revision corresponds to the tag "v2016.09.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
+SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
 
-PV = "v2016.03+git${SRCPV}"
+PV = "v2016.09.01+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
-- 
2.9.3


