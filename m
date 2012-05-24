Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuS-0002yZ-PM
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125502"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:14 -0700
Message-Id: <260dfd9ccbf7d1e0ed60256aaf80fed5bf0c24e2.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 03/32] python: use PKGSUFFIX for libpython2
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
X-List-Received-Date: Thu, 24 May 2012 21:49:31 -0000

From: Andreas Oberritter <obi@opendreambox.org>

* python-nativesdk shouldn't provide libpython2, but
  libpython2-nativesdk.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

[PR Bump - sgw]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index e067ba5..9ba561b 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.14"
+PR = "${INC_PR}.15"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -145,8 +145,8 @@ RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-crypt = "openssl"
 
 # package libpython2
-PACKAGES =+ "lib${BPN}2"
-FILES_lib${BPN}2 = "${libdir}/libpython*.so.*"
+PACKAGES =+ "lib${BPN}2${PKGSUFFIX}"
+FILES_lib${BPN}2${PKGSUFFIX} = "${libdir}/libpython*.so.*"
 
 # catch debug extensions (isn't that already in python-core-dbg?)
 FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
@@ -160,3 +160,6 @@ PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
 BBCLASSEXTEND = "nativesdk"
+
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
-- 
1.7.9.5



