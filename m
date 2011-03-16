Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Pztam-0006cW-DC
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2011 17:29:00 +0100
Received: by gwb11 with SMTP id 11so721389gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=FhY0o97UNoCcWd07rpr8onoCBb2LwWf0M19CW2YUSGM=;
	b=GcNEqd11rJ5iuWh9wPpNgrv5wmo01kOaKMuOubXTqKlHL9RpN8AnWk3ovoge/EaKKi
	pq+P6C6y69J0VUpwRDbe1lQQeIFLSB8PU8kDNDN78vzJLXuJPXrsU6VXbVvUGHGkfN0X
	5KG0BAwMSd8NOjFBMl2tZxb7qGgWttxb1cUKI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=l/o+rZbi3AhZA+R4pYyk+yNLEfrjihc2qNDa2A4YgzWJWQk0RDuEmRfV/o+fB0YoCq
	aClILPhSpLO7DnDsgWT/dli3EQ9/53tdXO1K6ezpj8qCQu4xr1MVWqcQcGYlWFiQd0Z/
	O7LLU54vrvR7tdqykqW3DESpDfm5L3oxXOJa0=
Received: by 10.91.127.5 with SMTP id e5mr246124agn.190.1300292834504;
	Wed, 16 Mar 2011 09:27:14 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r8sm1433658ane.19.2011.03.16.09.27.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2011 09:27:11 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2011 11:27:04 -0500
Message-Id: <1300292827-21236-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/4][angstrom-layers] matrix-gui-common: update SRCREV and add device support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Mar 2011 16:29:00 -0000

* Update the SRCREV used for the matrix-gui-common_1.4 package.
* Add support for svg image formats
* Add support for the dm368-evm machine type

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 BSP/TI/recipes-bsp/ti/matrix-gui-common.inc    |    7 ++++---
 BSP/TI/recipes-bsp/ti/matrix-gui-common_1.4.bb |    4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/BSP/TI/recipes-bsp/ti/matrix-gui-common.inc b/BSP/TI/recipes-bsp/ti/matrix-gui-common.inc
index 58f41d0..b1c9fb8 100644
--- a/BSP/TI/recipes-bsp/ti/matrix-gui-common.inc
+++ b/BSP/TI/recipes-bsp/ti/matrix-gui-common.inc
@@ -6,11 +6,12 @@ LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=37;md5=a802a01a3a58f2ebb
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
-PLATFORM_dm365 = "dm365"
+PLATFORM_dm365-evm = "dm365"
+PLATFORM_dm368-evm = "dm368"
 PLATFORM_omapl138 = "omapl138"
 PLATFORM_omap3evm = "omap3530"
 PLATFORM_dm37x-evm = "dm3730"
@@ -36,7 +37,7 @@ do_install() {
     install -m 0644 ${S}/${PLATFORM}/html/* ${D}/${datadir}/matrix/html
     install -d ${D}/${datadir}/matrix/images
     install -m 0644 ${S}/images/*.png ${D}/${datadir}/matrix/images/
-
+    install -m 0644 ${S}/images/*.svg ${D}/${datadir}/matrix/images/
 }
 
 FILES_${PN} += "${datadir}/matrix/*"
diff --git a/BSP/TI/recipes-bsp/ti/matrix-gui-common_1.4.bb b/BSP/TI/recipes-bsp/ti/matrix-gui-common_1.4.bb
index c578a47..609a16a 100644
--- a/BSP/TI/recipes-bsp/ti/matrix-gui-common_1.4.bb
+++ b/BSP/TI/recipes-bsp/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "192"
-PR = "${INC_PR}.0"
+SRCREV = "222"
+PR = "${INC_PR}.6"
-- 
1.7.0.4



