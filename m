Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QOu83-0003tN-QW
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 18:06:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 May 2011 09:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,261,1304319600"; 
   d="scan'208";a="7845609"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.133])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2011 09:03:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2011 09:02:51 -0700
Message-Id: <341fda24f968b225ae3d4bca5d7d03a8e1778494.1306219274.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306219274.git.sgw@linux.intel.com>
References: <cover.1306219274.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306219274.git.sgw@linux.intel.com>
References: <cover.1306219274.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 04/12] syslinux: rdepends on mtools
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
X-List-Received-Date: Tue, 24 May 2011 16:06:44 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

To be able to install into a disk, mtools are required thus we add it
as rdepends of 'syslinux' package.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/syslinux/syslinux_4.03.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_4.03.bb b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
index dc0785e..e76fe1f 100644
--- a/meta/recipes-devtools/syslinux/syslinux_4.03.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_4.03.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 # If you really want to run syslinux, you need mtools.  We just want the
 # ldlinux.* stuff for now, so skip mtools-native
 DEPENDS = "nasm-native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/boot/syslinux/syslinux-${PV}.tar.bz2 \
            file://cross-build.patch"
@@ -48,6 +48,8 @@ do_install() {
 
 PACKAGES =+ "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux"
 
+RDEPENDS_${PN} += "mtools"
+
 FILES_${PN} = "${bindir}/syslinux"
 FILES_${PN}-extlinux = "${sbindir}/extlinux"
 FILES_${PN}-mbr = "${libdir}/${PN}/mbr.bin"
-- 
1.7.3.4



