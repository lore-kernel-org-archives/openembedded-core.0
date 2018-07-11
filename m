Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 5E33478568
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 15:10:46 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41Qj4b1QWKz1qyLM;
	Wed, 11 Jul 2018 17:03:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41Qj4b11fqz1qr9H;
	Wed, 11 Jul 2018 17:03:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 78hY2UB6TlsG; Wed, 11 Jul 2018 17:03:26 +0200 (CEST)
X-Auth-Info: ZxXDpZwXwEwz8eSFSZaqIY/R4TtsHMEfxjW5vGypBSg=
Received: from kurokawa.lan (ip-86-49-107-50.net.upcbroadband.cz
	[86.49.107.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 11 Jul 2018 17:03:26 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 17:03:07 +0200
Message-Id: <20180711150308.30275-3-marex@denx.de>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180711150308.30275-1-marex@denx.de>
References: <20180711150308.30275-1-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] u-boot: Upgrade to 2018.07 release
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
X-List-Received-Date: Wed, 11 Jul 2018 15:10:46 -0000

This upgrades the U-Boot from 2018.05 to 2018.07 release.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 .../u-boot/{u-boot-common_2018.05.inc => u-boot-common_2018.07.inc}   | 4 ++--
 .../u-boot/{u-boot-fw-utils_2018.05.bb => u-boot-fw-utils_2018.07.bb} | 0
 .../u-boot/{u-boot-mkimage_2018.05.bb => u-boot-mkimage_2018.07.bb}   | 0
 meta/recipes-bsp/u-boot/{u-boot_2018.05.bb => u-boot_2018.07.bb}      | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2018.05.inc => u-boot-common_2018.07.inc} (68%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.05.bb => u-boot-fw-utils_2018.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.05.bb => u-boot-mkimage_2018.07.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2018.05.bb => u-boot_2018.07.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc
similarity index 68%
rename from meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc
index deec6e4890..d945253475 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc
@@ -3,12 +3,12 @@ SECTION = "bootloaders"
 DEPENDS += "flex-native bison-native"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "890e79f2b1c26c5ba1a86d179706348aec7feef7"
+SRCREV = "8c5d4fd0ec222701598a27b26ab7265d4cee45a3"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.05.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.05.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.05.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.05.bb b/meta/recipes-bsp/u-boot/u-boot_2018.07.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2018.05.bb
rename to meta/recipes-bsp/u-boot/u-boot_2018.07.bb
-- 
2.16.2


