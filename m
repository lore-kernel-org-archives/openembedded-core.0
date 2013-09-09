Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 7251E6BDE8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 12:27:48 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Mon, 9 Sep 2013
	14:27:48 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id DE8F828B833;
	Mon,  9 Sep 2013 14:27:48 +0200 (CEST)
From: <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2013 14:27:47 +0200
Message-ID: <1378729667-40624-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] beagleboard: update the dts location
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
X-List-Received-Date: Mon, 09 Sep 2013 12:27:49 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

Update the dts path for beagleboard

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta-yocto-bsp/conf/machine/beagleboard.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/conf/machine/beagleboard.conf b/meta-yocto-bsp/conf/machine/beagleboard.conf
index dd0c222..d034ee4 100644
--- a/meta-yocto-bsp/conf/machine/beagleboard.conf
+++ b/meta-yocto-bsp/conf/machine/beagleboard.conf
@@ -32,7 +32,7 @@ PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "3.10%"
 
 KERNEL_IMAGETYPE = "zImage"
-KERNEL_DEVICETREE = "${S}/arch/powerpc/boot/dts/omap3-beagle.dts ${S}/arch/powerpc/boot/dts/omap3-beagle-xm.dts"
+KERNEL_DEVICETREE = "${S}/arch/arm/boot/dts/omap3-beagle.dts ${S}/arch/arm/boot/dts/omap3-beagle-xm.dts"
 
 SPL_BINARY = "MLO"
 UBOOT_SUFFIX = "img"
-- 
1.7.10.4


