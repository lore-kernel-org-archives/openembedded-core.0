Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id C4B1F605FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 19:30:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3tL7PM3Wgbz3hjMy;
	Fri, 18 Nov 2016 20:30:15 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3tL7PM2ZdZzvkhn;
	Fri, 18 Nov 2016 20:30:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id h6T9OFyLl2EM; Fri, 18 Nov 2016 20:30:12 +0100 (CET)
X-Auth-Info: a/U55dhagimKW8lGOU1iMmBFI+CzYLq88EHW1fioeGg=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Fri, 18 Nov 2016 20:30:12 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2016 20:29:55 +0100
Message-Id: <20161118192955.17284-1-marex@denx.de>
X-Mailer: git-send-email 2.10.2
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] u-boot: Update to v2016.11 release
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
X-List-Received-Date: Fri, 18 Nov 2016 19:30:18 -0000

Upgrade U-Boot to the latest version.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 .../{u-boot-common_2016.09.01.inc => u-boot-common_2016.11.inc}       | 4 ++--
 .../{u-boot-fw-utils_2016.09.01.bb => u-boot-fw-utils_2016.11.bb}     | 0
 .../{u-boot-mkimage_2016.09.01.bb => u-boot-mkimage_2016.11.bb}       | 0
 meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb => u-boot_2016.11.bb}   | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2016.09.01.inc => u-boot-common_2016.11.inc} (71%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.09.01.bb => u-boot-fw-utils_2016.11.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.09.01.bb => u-boot-mkimage_2016.11.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb => u-boot_2016.11.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
similarity index 71%
rename from meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
index f706a6b..84adc1c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
@@ -7,8 +7,8 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
+SRCREV = "29e0cfb4f77f7aa369136302cee14a91e22dca71"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
+SRC_URI = "git://git.denx.de/u-boot.git"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot_2016.11.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2016.11.bb
-- 
2.10.2


