Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMO3-0000dV-Ri
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926375"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:27:56 -0700
Message-Id: <20a6c7ed8fc0031487e776c1b051c314d2fac7eb.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/14] libproxy: utilize libdir when configured
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
X-List-Received-Date: Fri, 05 Aug 2011 15:32:36 -0000

From: Kumar Gala <galak@kernel.crashing.org>

Pass $libdir through when we configure to support a location other
than /lib.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-support/libproxy/libproxy_0.4.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
index b24e8ba..5ee4979 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
@@ -14,12 +14,12 @@ SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
 SRC_URI[md5sum] = "199c6b120baf1f7258a55f38d5ec74f5"
 SRC_URI[sha256sum] = "9ad912e63b1efca98fb442240a2bc7302e6021c1d0b1b9363327729f29462f30"
 
-PR = "r1"
+PR = "r2"
 
 inherit cmake pkgconfig
 
 EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
-	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no"
+	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${libdir}"
 
 FILES_${PN}-dbg += "${libdir}/libproxy/${PV}/plugins/.debug/ ${libdir}/libproxy/${PV}/modules/.debug/"
 
-- 
1.7.3.4



