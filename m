Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8351D74845
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 20:14:23 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40mQd81xwnz1qvnD;
	Wed, 16 May 2018 22:14:20 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40mQd81XbSz1rDn3;
	Wed, 16 May 2018 22:14:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id b60M89K58l_K; Wed, 16 May 2018 22:14:16 +0200 (CEST)
X-Auth-Info: VIZcjulKwbvuMXutvtkQNv62wUHgfd/XUBtzgSujsMA=
Received: from kurokawa.lan (ip-86-49-107-50.net.upcbroadband.cz
	[86.49.107.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 16 May 2018 22:14:16 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2018 22:14:15 +0200
Message-Id: <20180516201415.8002-1-marex@denx.de>
X-Mailer: git-send-email 2.16.2
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2018.05 release
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
X-List-Received-Date: Wed, 16 May 2018 20:14:23 -0000

This upgrades the U-Boot from 2018.03 to 2018.05 release.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 .../u-boot/{u-boot-common_2018.03.inc => u-boot-common_2018.05.inc}     | 2 +-
 .../u-boot/{u-boot-fw-utils_2018.03.bb => u-boot-fw-utils_2018.05.bb}   | 0
 .../u-boot/{u-boot-mkimage_2018.03.bb => u-boot-mkimage_2018.05.bb}     | 0
 meta/recipes-bsp/u-boot/{u-boot_2018.03.bb => u-boot_2018.05.bb}        | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2018.03.inc => u-boot-common_2018.05.inc} (86%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.03.bb => u-boot-fw-utils_2018.05.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.03.bb => u-boot-mkimage_2018.05.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2018.03.bb => u-boot_2018.05.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc
similarity index 86%
rename from meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc
index 8ffae365a9..61566f5856 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2018.03.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.05.inc
@@ -7,7 +7,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "f95ab1fb6e37f0601f397091bb011edf7a98b890"
+SRCREV = "890e79f2b1c26c5ba1a86d179706348aec7feef7"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.05.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.05.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.05.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.05.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.03.bb b/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2018.03.bb
rename to meta/recipes-bsp/u-boot/u-boot_2018.05.bb
-- 
2.16.2


