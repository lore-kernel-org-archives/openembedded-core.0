Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrP-0004vP-8R
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212171"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:13 -0800
Message-Id: <f7c4f6e4e30daec8e97c58a0a7003d77d61d17b8.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 08/21] sqlite3: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:20 -0000

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



