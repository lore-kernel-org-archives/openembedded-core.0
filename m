Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu1A-0003mK-WA
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:38:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272058"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:34:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:39 -0700
Message-Id: <f78f4ed985e86d8054066ec1c810e915a0d850fd.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Subject: [PATCH V2 07/25] sqlite3: inherit shlibpackaging class
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
X-List-Received-Date: Wed, 13 Jul 2011 07:38:01 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/sqlite/sqlite3.inc |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index a5d122d..f1aa087 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -5,7 +5,7 @@ DEPENDS = "readline ncurses"
 DEPENDS_virtclass-native = ""
 LICENSE = "PD"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig shlibpackaging
 
 EXTRA_OECONF = "--disable-tcl --enable-shared --enable-threadsafe"
 EXTRA_OECONF_virtclass-native = "--disable-tcl --enable-shared --enable-threadsafe --disable-readline --enable-tempstore"
@@ -17,12 +17,6 @@ export config_TARGET_LINK = "${CCLD}"
 export config_TARGET_CFLAGS = "${CFLAGS}"
 export config_TARGET_LFLAGS = "${LDFLAGS}"
 
-PACKAGES = "lib${PN} lib${PN}-dev lib${PN}-doc ${PN} ${PN}-dbg"
-FILES_${PN} = "${bindir}/*"
-FILES_lib${PN} = "${libdir}/*.so.*"
-FILES_lib${PN}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
-		       ${libdir}/pkgconfig ${includedir}"
-FILES_lib${PN}-doc = "${docdir} ${mandir} ${infodir}"
-AUTO_LIBNAME_PKGS = "lib${PN}"
+FILES_lib${PN}-doc += "${docdir} ${mandir} ${infodir}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4



