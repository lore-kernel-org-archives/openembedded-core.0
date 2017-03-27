Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDF377357
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 14:33:06 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.6.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3vsGhz4zlZz1qr46;
	Mon, 27 Mar 2017 16:33:07 +0200 (CEST)
X-Auth-Info: 2AP/gGVL2iYX7Rp+W/J2wp/IZzWcbtRO/RBqODa/0IE=
Received: from kurokawa.lan (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3vsGhy6VHRzvdWQ;
	Mon, 27 Mar 2017 16:33:06 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 16:32:55 +0200
Message-Id: <20170327143255.3423-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Mon, 27 Mar 2017 14:33:07 -0000

Upgrade U-Boot to the latest version.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Denys Dmytriyenko <denis@denix.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 .../u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb}   | 0
 .../u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2017.01.inc => u-boot-common_2017.03.inc} (86%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.01.bb => u-boot-fw-utils_2017.03.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.01.bb => u-boot-mkimage_2017.03.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2017.01.bb => u-boot_2017.03.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
similarity index 86%
rename from meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
index df24c853dd..c115f36831 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.03.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
+SRCREV = "8537ddd769f460d7fb7a62a3dcc9669049702e51"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.03.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.03.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot_2017.03.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2017.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.03.bb
-- 
2.11.0


