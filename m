Return-Path: <marex@denx.de>
X-Greylist: delayed 475 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Feb 2019 00:04:18 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B241E6BDDC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 00:04:18 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 445BFg6jtCz1qxQ8;
	Fri, 22 Feb 2019 00:56:23 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 445BFg6FdHz1qswx;
	Fri, 22 Feb 2019 00:56:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id ZM6_tVMRvvMy; Fri, 22 Feb 2019 00:56:22 +0100 (CET)
X-Auth-Info: ruR1plXXeXYU48feR9I8KAJtaVT24//oEn3NJIL6OaQ=
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz
	[86.49.110.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 22 Feb 2019 00:56:22 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 00:56:18 +0100
Message-Id: <20190221235618.29059-1-marex@denx.de>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Upgrade to 2019.01 release
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
X-List-Received-Date: Fri, 22 Feb 2019 00:04:19 -0000
Content-Transfer-Encoding: 8bit

This upgrades the U-Boot to latest 2019.01 release.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../{u-boot-fw-utils_2018.11.bb => u-boot-fw-utils_2019.01.bb}  | 0
 .../u-boot/{u-boot-tools_2018.11.bb => u-boot-tools_2019.01.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2018.11.bb => u-boot_2019.01.bb} | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.11.bb => u-boot-fw-utils_2019.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2018.11.bb => u-boot-tools_2019.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2018.11.bb => u-boot_2019.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 6f4a10b7a4..dcfb9cc63f 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -8,7 +8,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "0157013f4a4945bbdb70bb4d98d680e0845fd784"
+SRCREV = "d3689267f92c5956e09cc7d1baa4700141662bff"
 
 SRC_URI = "git://git.denx.de/u-boot.git"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.11.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2019.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2018.11.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2019.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.11.bb b/meta/recipes-bsp/u-boot/u-boot_2019.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2018.11.bb
rename to meta/recipes-bsp/u-boot/u-boot_2019.01.bb
-- 
2.19.2


