Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RoTTB-0001l8-CO
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 06:26:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 21:18:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101117516"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.79])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 21:18:43 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 21:18:29 -0800
Message-Id: <c67b930d31eb943850fb901ab4e4e10e34f91805.1327123057.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
Subject: [PATCH 11/20] tiff: refactor packages for staticdev
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
X-List-Received-Date: Sat, 21 Jan 2012 05:26:29 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/libtiff/tiff_3.9.5.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
index 7d60326..78a4859 100644
--- a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg lzo"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"
@@ -13,9 +13,10 @@ SRC_URI[sha256sum] = "ecf2e30582698dbc61d269203bbd1e701a1a50fb26c87d709e10d89669
 
 inherit autotools
 
-PACKAGES =+ "tiffxx tiffxx-dbg tiffxx-dev tiff-utils tiff-utils-dbg"
+PACKAGES =+ "tiffxx tiffxx-dbg tiffxx-dev tiffxx-staticdev tiff-utils tiff-utils-dbg"
 FILES_tiffxx = "${libdir}/libtiffxx.so.*"
-FILES_tiffxx-dev = "${libdir}/libtiffxx.so ${libdir}/libtiffxx.*a"
+FILES_tiffxx-dev = "${libdir}/libtiffxx.so ${libdir}/libtiffxx.la"
+FILES_tiffxx-staticdev = "${libdir}/libtiffxx.a"
 FILES_tiffxx-dbg += "${libdir}/.debug/libtiffxx.so*"
 FILES_tiff-utils = "${bindir}/*"
 FILES_tiff-utils-dbg += "${bindir}/.debug/"
-- 
1.7.6.5



