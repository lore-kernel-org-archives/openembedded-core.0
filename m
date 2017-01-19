Return-Path: <marex@denx.de>
X-Greylist: delayed 366 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Jan 2017 15:28:01 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3A8F071B86
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 15:28:01 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.6.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3v46yD0ttrz3hjJ1;
	Thu, 19 Jan 2017 16:21:56 +0100 (CET)
X-Auth-Info: LG7r/b+Sz6JlvtpV7BCjIzxRY+dY9D+EZoPC3wuawXo=
Received: from kurokawa.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3v46yC5cZBzvdWV;
	Thu, 19 Jan 2017 16:21:55 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:21:51 +0100
Message-Id: <20170119152151.15814-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] u-boot: Update to 2017.01 release
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
X-List-Received-Date: Thu, 19 Jan 2017 15:28:02 -0000

Upgrade U-Boot to the latest version.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
---
 .../u-boot/{u-boot-common_2016.11.inc => u-boot-common_2017.01.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2016.11.bb => u-boot-fw-utils_2017.01.bb}   | 0
 .../u-boot/{u-boot-mkimage_2016.11.bb => u-boot-mkimage_2017.01.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2016.11.bb => u-boot_2017.01.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2016.11.inc => u-boot-common_2017.01.inc} (86%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.11.bb => u-boot-fw-utils_2017.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.11.bb => u-boot-mkimage_2017.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2016.11.bb => u-boot_2017.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
similarity index 86%
rename from meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
index 84adc1c56a..df24c853dd 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.01.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "29e0cfb4f77f7aa369136302cee14a91e22dca71"
+SRCREV = "a705ebc81b7f91bbd0ef7c634284208342901149"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.11.bb b/meta/recipes-bsp/u-boot/u-boot_2017.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2016.11.bb
rename to meta/recipes-bsp/u-boot/u-boot_2017.01.bb
-- 
2.11.0


