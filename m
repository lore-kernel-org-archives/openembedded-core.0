Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgPjQ-0005b2-CA
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 01:17:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jul 2011 16:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,517,1304319600"; d="scan'208";a="26491813"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2011 16:13:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 16:13:19 -0700
Message-Id: <febb9488289e43ac06b9383dfffa2d584f49aa16.1310425837.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310425837.git.sgw@linux.intel.com>
References: <cover.1310425837.git.sgw@linux.intel.com>
Subject: [PATCH 12/26] libxft: use default bitbake.conf FILES Packaging to handle staticdev
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
X-List-Received-Date: Mon, 11 Jul 2011 23:17:41 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
index 1a56702..997db3e 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90b90b60eb30f65fc9c2673d7cf59e24"
 DEPENDS += "libxrender freetype fontconfig"
 PROVIDES = "xft"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXft"
@@ -28,10 +28,7 @@ python () {
             bb.data.setVar('PKG_${PN}', 'libxft2', d)
 }
 
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-		${libdir}/*.a ${libdir}/pkgconfig \
-		${datadir}/aclocal ${bindir} ${sbindir}"
+FILES_${PN}-dev += "${bindir} ${sbindir}"
 
 SRC_URI[md5sum] = "cce3c327258116493b753f157e0360c7"
 SRC_URI[sha256sum] = "c8685ae56da0c1dcc2bc1e34607e7d76ae98b86a1a71baba3a6b76dbcf5ff9b2"
-- 
1.7.3.4



