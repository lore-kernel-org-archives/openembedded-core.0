Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RoTT8-0001l8-NC
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jan 2012 06:26:28 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Jan 2012 21:18:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="101117511"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.79])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2012 21:18:42 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2012 21:18:26 -0800
Message-Id: <def93fa566b27f47dc47a0a6d0395f8d85f32813.1327123057.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327123057.git.sgw@linux.intel.com>
References: <cover.1327123057.git.sgw@linux.intel.com>
Subject: [PATCH 08/20] sqlite3: refactor packages for staticdev
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
 meta/recipes-support/sqlite/sqlite3.inc      |    6 ++++--
 meta/recipes-support/sqlite/sqlite3_3.7.9.bb |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index ece35c5..79542fe 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -20,12 +20,14 @@ export config_TARGET_LFLAGS = "${LDFLAGS}"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "lib${BPN}${PKGSUFFIX} lib${BPN}${PKGSUFFIX}-dev lib${BPN}${PKGSUFFIX}-doc ${PN}-dbg ${PN}"
+PACKAGES = "lib${BPN}${PKGSUFFIX} lib${BPN}${PKGSUFFIX}-dev lib${BPN}${PKGSUFFIX}-doc ${PN}-dbg lib${BPN}${PKGSUFFIX}-staticdev ${PN}"
+
 FILES_${PN} = "${bindir}/*"
 FILES_lib${BPN}${PKGSUFFIX} = "${libdir}/*.so.*"
-FILES_lib${BPN}${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
+FILES_lib${BPN}${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*.so \
 	                	   ${libdir}/pkgconfig ${includedir}"
 FILES_lib${BPN}${PKGSUFFIX}-doc = "${docdir} ${mandir} ${infodir}"
+FILES_lib${BPN}${PKGSUFFIX}-staticdev = "${libdir}/lib*.a"
 AUTO_LIBNAME_PKGS = "lib${BPN}${PKGSUFFIX}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.9.bb b/meta/recipes-support/sqlite/sqlite3_3.7.9.bb
index f6c2f9e..8f7348d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.9.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.9.bb
@@ -1,6 +1,6 @@
 require sqlite3.inc
 
-PR = "r0"
+PR = "r1"
 
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
 
-- 
1.7.6.5



