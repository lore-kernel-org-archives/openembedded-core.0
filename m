Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S10Ue-0000GI-1b
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 20:07:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2012 10:59:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129141167"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.58])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2012 10:59:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 10:59:21 -0800
Message-Id: <441d5b0afed2faa6f94c1806f7d9117fa395215c.1330109787.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330109787.git.sgw@linux.intel.com>
References: <cover.1330109787.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330109787.git.sgw@linux.intel.com>
References: <cover.1330109787.git.sgw@linux.intel.com>
Subject: [PATCH 2/2] syslinux: Package unpackaged files in -misc
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
X-List-Received-Date: Fri, 24 Feb 2012 19:07:48 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/syslinux/syslinux_4.03.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index 97bf7ce..862ea8b 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -46,7 +46,7 @@ do_install() {
 	install -m 644 ${S}/core/ldlinux.bss ${D}${libdir}/syslinux/
 }
 
-PACKAGES =+ "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux"
+PACKAGES =+ "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
 
 RDEPENDS_${PN} += "mtools"
 
@@ -58,5 +58,6 @@ FILES_${PN}-isolinux = "${libdir}/${PN}/isolinux.bin"
 FILES_${PN}-pxelinux = "${libdir}/${PN}/pxelinux.0"
 FILES_${PN}-dev += "${datadir}/${PN}/com32/lib*${SOLIBS} ${datadir}/${PN}/com32/include ${datadir}/${PN}/com32/com32.ld"
 FILES_${PN}-staticdev += "${datadir}/${PN}/com32/lib*.a"
+FILES_${PN}-misc = "${libdir}/${PN}/* ${bindir}/*"
 
 BBCLASSEXTEND = "native"
-- 
1.7.7.6



