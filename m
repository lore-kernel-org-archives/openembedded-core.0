Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2ISY-0004wt-SG
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:35:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2013 01:19:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="252243117"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Feb 2013 01:19:40 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:20:17 +0200
Message-Id: <79df3d744e1a256fb9f034d39584a09bd71d98f8.1359967266.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
Subject: [PATCH 03/10] syslinux: use BPN instead of PN
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
X-List-Received-Date: Mon, 04 Feb 2013 09:35:33 -0000

Fix the following warning:
WARNING: QA Issue: lib32-syslinux: Files/directories were installed but not shipped
  /usr/lib
  /usr/share/syslinux
  /usr/share/syslinux/com32
  /usr/share/syslinux/com32/libcom32gpl.a
  /usr/share/syslinux/com32/libcom32.a
  ...

[YOCTO #3438]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/syslinux/syslinux_4.03.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index abf2b06..7c3ecda 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/4.xx/syslinux-${PV}.tar.bz2 \
            file://cross-build.patch \
@@ -54,12 +54,12 @@ RDEPENDS_${PN} += "mtools"
 
 FILES_${PN} = "${bindir}/syslinux"
 FILES_${PN}-extlinux = "${sbindir}/extlinux"
-FILES_${PN}-mbr = "${libdir}/${PN}/mbr.bin"
-FILES_${PN}-chain = "${libdir}/${PN}/chain.c32"
-FILES_${PN}-isolinux = "${libdir}/${PN}/isolinux.bin"
-FILES_${PN}-pxelinux = "${libdir}/${PN}/pxelinux.0"
-FILES_${PN}-dev += "${datadir}/${PN}/com32/lib*${SOLIBS} ${datadir}/${PN}/com32/include ${datadir}/${PN}/com32/com32.ld"
-FILES_${PN}-staticdev += "${datadir}/${PN}/com32/lib*.a ${libdir}/${PN}/com32/lib*.a"
-FILES_${PN}-misc = "${libdir}/${PN}/* ${bindir}/*"
+FILES_${PN}-mbr = "${libdir}/${BPN}/mbr.bin"
+FILES_${PN}-chain = "${libdir}/${BPN}/chain.c32"
+FILES_${PN}-isolinux = "${libdir}/${BPN}/isolinux.bin"
+FILES_${PN}-pxelinux = "${libdir}/${BPN}/pxelinux.0"
+FILES_${PN}-dev += "${datadir}/${BPN}/com32/lib*${SOLIBS} ${datadir}/${BPN}/com32/include ${datadir}/${BPN}/com32/com32.ld"
+FILES_${PN}-staticdev += "${datadir}/${BPN}/com32/lib*.a ${libdir}/${BPN}/com32/lib*.a"
+FILES_${PN}-misc = "${libdir}/${BPN}/* ${bindir}/*"
 
 BBCLASSEXTEND = "native"
-- 
1.7.11.7



