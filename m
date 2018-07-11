Return-Path: <marex@denx.de>
X-Greylist: delayed 442 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 11 Jul 2018 15:10:45 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 813B9771B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 15:10:45 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41Qj4X32Tpz1qxx6;
	Wed, 11 Jul 2018 17:03:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41Qj4X2NX8z1qr9P;
	Wed, 11 Jul 2018 17:03:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id Hfup28jyjiKe; Wed, 11 Jul 2018 17:03:23 +0200 (CEST)
X-Auth-Info: 54GdA/L1uJgypBEDtxFWRJorB9+PPCS3yOPHcDeAaTs=
Received: from kurokawa.lan (ip-86-49-107-50.net.upcbroadband.cz
	[86.49.107.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 11 Jul 2018 17:03:23 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2018 17:03:05 +0200
Message-Id: <20180711150308.30275-1-marex@denx.de>
X-Mailer: git-send-email 2.16.2
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/4] u-boot: Add missing dependency on swig
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
X-List-Received-Date: Wed, 11 Jul 2018 15:10:45 -0000

The U-Boot build, in particular the pylibfdt, depends on swig-native.
Add the missing dependency.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot_2018.05.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.05.bb b/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
index 37c21dcaa3..3cdec00cbd 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2018.05.bb
@@ -1,4 +1,4 @@
 require u-boot-common_${PV}.inc
 require u-boot.inc
 
-DEPENDS += "bc-native dtc-native"
+DEPENDS += "bc-native dtc-native swig-native"
-- 
2.16.2


