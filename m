Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TvrAe-0001Ny-4u
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:14:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2013 06:58:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,486,1355126400"; d="scan'208";a="192236314"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2013 06:58:55 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2013 16:58:45 +0200
Message-Id: <d1b54f8f0c08475712f66ae43cf15d79efcb3617.1358432402.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1358432402.git.laurentiu.palcu@intel.com>
References: <cover.1358432402.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/6] hostap-conf: remove dependencies of update-modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Jan 2013 15:14:28 -0000

Also:
 * install the alias file in the correct /etc/modprobe.d directory since
   this is the directory used by modprobe now;
 * rewrite the alias file to be up-to-date with modprobe's syntax;
 * remove the postinst/postrm scriptlets because this is just an alias
   file;

[YOCTO #3598]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-bsp/hostap/files/hostap_cs.modalias |   34 +++++++++++-----------
 meta/recipes-bsp/hostap/hostap-conf_1.0.bb       |   17 ++---------
 2 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-bsp/hostap/files/hostap_cs.modalias b/meta/recipes-bsp/hostap/files/hostap_cs.modalias
index cb9efab..2848351 100644
--- a/meta/recipes-bsp/hostap/files/hostap_cs.modalias
+++ b/meta/recipes-bsp/hostap/files/hostap_cs.modalias
@@ -1,28 +1,28 @@
 # product info: "Pretec", "CompactWLAN Card 802.11b", "2.5"
-pcmcia:m0156c0002f06fn00pfn00pa1CADD3E5pbE697636Cpc7A5BFCF1pd00000000 hostap_cs
+alias pcmcia:m0156c0002f06fn00pfn00pa1CADD3E5pbE697636Cpc7A5BFCF1pd00000000 hostap_cs
 
 # manufacturer ID which exist in orinoco_cs AND in hostap_cs
-pcmcia:m000Bc7100f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:m000Bc7300f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:m0126c8000f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:m0138c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:m0250c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:m0274c1612f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:m0274c1613f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:m028Ac0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:m02AAc0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:m50C2c7300f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:mD601c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
-pcmcia:mD601c0005f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m000Bc7100f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m000Bc7300f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m0126c8000f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m0138c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m0250c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m0274c1612f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m0274c1613f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m028Ac0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m02AAc0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:m50C2c7300f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:mD601c0002f06fn00pfn00pa*pb*pc*pd* hostap_cs
+alias pcmcia:mD601c0005f06fn00pfn00pa*pb*pc*pd* hostap_cs
 
 # product info: "Linksys", "Wireless CompactFlash Card", "", ""
-pcmcia:m028Ac0673f06fn00pfn00pa0733CC81pb0C52F395pc00000000pd00000000 hostap_cs
+alias pcmcia:m028Ac0673f06fn00pfn00pa0733CC81pb0C52F395pc00000000pd00000000 hostap_cs
 
 # product info:"PLANEX COMMUNICATION INC","PLANEX GW-CF11X Wireless CF Card", "", ""
-pcmcia:mD601c0010f06fn00pfn00pa4703CF68pbFAD7318Dpc00000000pd00000000 hostap_cs
+alias pcmcia:mD601c0010f06fn00pfn00pa4703CF68pbFAD7318Dpc00000000pd00000000 hostap_cs
 
 # 0x0156, 0x0002 and "Version 01.02" only appear for Prism based cards.
-pcmcia:m0156c0002f06fn00pfn00pa*pb*pc4B74BAA0pd00000000 hostap_cs
+alias pcmcia:m0156c0002f06fn00pfn00pa*pb*pc4B74BAA0pd00000000 hostap_cs
 
 # "BUFFALO", "WLI-CF-S11G", "", ""
-pcmcia:m026Fc030Bf06fn00pfn00pa2DECECE3pb82067C18pc00000000pd00000000 hostap_cs
+alias pcmcia:m026Fc030Bf06fn00pfn00pa2DECECE3pb82067C18pc00000000pd00000000 hostap_cs
diff --git a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
index f8b2102..466c073 100644
--- a/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
+++ b/meta/recipes-bsp/hostap/hostap-conf_1.0.bb
@@ -2,8 +2,7 @@ DESCRIPTION = "PCMCIA-cs configuration files for wireless LAN cards based on Int
 SECTION = "kernel/modules"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-RDEPENDS_${PN} = "update-modules"
-PR = "r14"
+PR = "r15"
 
 SRC_URI = "file://hostap_cs.modalias \
            file://COPYING.patch"
@@ -14,18 +13,8 @@ do_compile() {
 }
 
 do_install() {
-        install -d ${D}${sysconfdir}/modutils
+	install -d ${D}${sysconfdir}/modprobe.d
 
-	install -m 0644 ${WORKDIR}/hostap_cs.modalias ${D}${sysconfdir}/modutils/hostap_cs.conf
+	install -m 0644 ${WORKDIR}/hostap_cs.modalias ${D}${sysconfdir}/modprobe.d/hostap_cs.conf
 }
 
-pkg_postinst_${PN} () {
-	if [ -n "$D" ]; then
-		exit 1
-	fi
-	update-modules || true
-}
-
-pkg_postrm_${PN} () {
-	update-modules || true
-}
-- 
1.7.9.5



