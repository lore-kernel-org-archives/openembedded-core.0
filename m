Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SH6s6-0007rk-PF
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 07:10:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Apr 2012 22:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="151367379"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2012 22:01:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Apr 2012 22:01:07 -0700
Message-Id: <da4ebcee95ddeed3594220f12cb9addb866b2a57.1333914345.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1333914345.git.sgw@linux.intel.com>
References: <cover.1333914345.git.sgw@linux.intel.com>
In-Reply-To: <cover.1333914345.git.sgw@linux.intel.com>
References: <cover.1333914345.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 3/6] python: multilib header support.
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
X-List-Received-Date: Mon, 09 Apr 2012 05:10:35 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

Add intercept multilib header for pyconfig.h in python.
This is part of the bug fixing [YOCTO #2216].

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../python/python-2.7-manifest.inc                 |    2 +-
 meta/recipes-devtools/python/python.inc            |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    4 +++-
 scripts/contrib/python/generate-manifest-2.7.py    |    2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index ca01553..1e16c6b 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -40,7 +40,7 @@ FILES_${PN}-compression="${libdir}/python2.7/gzip.* ${libdir}/python2.7/zipfile.
 DESCRIPTION_${PN}-core="Python Interpreter and core modules (needed!)"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
 FILES_${PN}-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so \
-${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
+${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* ${libdir}/python2.7/_weakrefset.* ${libdir}/python2.7/sysconfig.* ${libdir}/python2.7/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
 DESCRIPTION_${PN}-crypt="Python Basic Cryptographic and Hashing Support"
 RDEPENDS_${PN}-crypt="${PN}-core"
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index aaf11ac..2f17b00 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 # bump this on every change in contrib/python/generate-manifest-2.7.py
-INC_PR = "r1"
+INC_PR = "r2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2dffb81509b47974467ea23409909b1c"
 
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 8cf45da..49ba13c 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -25,7 +25,7 @@ SRC_URI += "\
 
 S = "${WORKDIR}/Python-${PV}"
 
-inherit autotools
+inherit autotools multilib_header
 
 # The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
@@ -110,6 +110,8 @@ do_install() {
 	if [ -e ${WORKDIR}/sitecustomize.py ]; then
 		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
 	fi
+
+	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
 }
 
 SSTATE_SCAN_FILES += "Makefile"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 267d678..7b43137 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -169,7 +169,7 @@ if __name__ == "__main__":
     "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so " +
     "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python* "  + 
     "_weakrefset.* sysconfig.* config/Makefile " +
-    "${includedir}/python${PYTHON_MAJMIN}/pyconfig.h " +
+    "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
 
     m.addPackage( "${PN}-dev", "Python Development Package", "${PN}-core",
-- 
1.7.7.6



