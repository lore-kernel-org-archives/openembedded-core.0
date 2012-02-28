Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhS-0008QZ-6o
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197465"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:17 -0800
Message-Id: <8c99d79a9043e6793e3708430fbc98c48791b624.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 19/36] tiff: Update to version 3.9.5
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:10 -0000

Ensure that OpenGL and friends are disable with the
setting of ax_cv_check_gl_libgl = no.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libtiff/{tiff_3.9.5.bb => tiff_4.0.1.bb}       |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libtiff/{tiff_3.9.5.bb => tiff_4.0.1.bb} (79%)

diff --git a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
similarity index 79%
rename from meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
index bf0a387..6fb4163 100644
--- a/meta/recipes-multimedia/libtiff/tiff_3.9.5.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.1.bb
@@ -3,16 +3,18 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=34da3db46fab7501992f9615d7e158cf"
 HOMEPAGE = "http://www.remotesensing.org/libtiff/"
 DEPENDS = "zlib jpeg lzo"
-PR = "r4"
+PR = "r0"
 
 SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
            file://libtool2.patch"
 
-SRC_URI[md5sum] = "8fc7ce3b4e1d0cc8a319336967815084"
-SRC_URI[sha256sum] = "ecf2e30582698dbc61d269203bbd1e701a1a50fb26c87d709e10d89669badb33"
+SRC_URI[md5sum] = "fae149cc9da35c598d8be897826dfc63"
+SRC_URI[sha256sum] = "9a7a039e516c37478038740f1642818250bfb1414cf404cc8b569e5f9d4bf2f0"
 
 inherit autotools
 
+CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
+
 PACKAGES =+ "tiffxx tiffxx-dbg tiffxx-dev tiffxx-staticdev tiff-utils tiff-utils-dbg"
 FILES_tiffxx = "${libdir}/libtiffxx.so.*"
 FILES_tiffxx-dev = "${libdir}/libtiffxx.so ${libdir}/libtiffxx.la"
-- 
1.7.7.6



