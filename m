Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SI9wS-0004gI-LE
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 04:39:24 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2012 04:30:02 +0200
Message-Id: <1334197802-25482-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] python: use PKGSUFFIX for libpython2
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
X-List-Received-Date: Thu, 12 Apr 2012 02:39:24 -0000

* python-nativesdk shouldn't provide libpython2, but
  libpython2-nativesdk.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 8cf45da..ae08748 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.9"
+PR = "${INC_PR}.10"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -128,8 +128,8 @@ RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-crypt = "openssl"
 
 # package libpython2
-PACKAGES =+ "lib${BPN}2"
-FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
+PACKAGES =+ "lib${BPN}2${PKGSUFFIX}"
+FILES_lib${BPN}2${PKGSUFFIX} = "${libdir}/libpython*.so.*"
 
 # catch debug extensions (isn't that already in python-core-dbg?)
 FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
@@ -143,3 +143,6 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 BBCLASSEXTEND = "nativesdk"
+
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-- 
1.7.5.4



