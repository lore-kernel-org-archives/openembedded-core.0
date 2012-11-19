Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TaKXs-00043w-Qw
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 07:09:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2012 21:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,276,1352102400"; d="scan'208";a="221530217"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.202])
	by orsmga001.jf.intel.com with ESMTP; 18 Nov 2012 21:54:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2012 21:54:50 -0800
Message-Id: <cac75b0cd951792ef32d23bb8534b2b0e72644b4.1353304234.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
In-Reply-To: <cover.1353304234.git.sgw@linux.intel.com>
References: <cover.1353304234.git.sgw@linux.intel.com>
Subject: [PATCH 17/17] libproxy: set LIBEXEC_INSTALL_DIR
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
X-List-Received-Date: Mon, 19 Nov 2012 06:09:25 -0000

WARNING: QA Issue: libproxy: Files/directories were installed but not shipped
  /usr/libexec
  /usr/libexec/pxgsettings
  /usr/libexec/.debug
  /usr/libexec/.debug/pxgsettings

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
index 7e3cf27..c6a733a 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.7.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
 
 DEPENDS = "gconf"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz \
            file://g++-namepace.patch \
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "8fe0a58810139ba3c2e186deccf3e68adcd127aa0e972b0862b30b3dde
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
-	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${libdir}"
+	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${libdir} -DLIBEXEC_INSTALL_DIR=${libexecdir}"
 
 FILES_${PN} += "${libdir}/${BPN}/${PV}/modules"
 FILES_${PN}-dev += "${datadir}/cmake"
-- 
1.7.7.6



