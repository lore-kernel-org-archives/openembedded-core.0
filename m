Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD1D6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 22:17:10 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 27 Jul 2016 15:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="146552633"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2016 15:17:12 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 22:14:28 +0000
Message-Id: <1469657668-8150-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2] python-setuptools: Upgrade to v 25.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jul 2016 22:17:13 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc |  6 ++--
 .../python/python-setuptools_22.0.5.bb             | 38 ----------------------
 .../python/python-setuptools_25.1.0.bb             | 38 ++++++++++++++++++++++
 3 files changed, 41 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-setuptools_22.0.5.bb
 create mode 100644 meta/recipes-devtools/python/python-setuptools_25.1.0.bb

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 53a514b..f435e68 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -3,14 +3,14 @@ HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
 SECTION = "devel/python"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://setup.py;beginline=134;endline=134;md5=3e8df024d6c1442d18e84acf8fbbc475"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=155;endline=155;md5=3e8df024d6c1442d18e84acf8fbbc475"
 
 SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "869f3029dcc66a64ba39875e2a2f044a"
-SRC_URI[sha256sum] = "19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb"
+SRC_URI[md5sum] = "a4814dead37e74a86883c66f7d420d73"
+SRC_URI[sha256sum] = "6a0f8111feb5a3438c6309cda49810a16d23e73c173331281edc37dd1374d1d5"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python-setuptools_22.0.5.bb
deleted file mode 100644
index c172039..0000000
--- a/meta/recipes-devtools/python/python-setuptools_22.0.5.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-require python-setuptools.inc
-
-PROVIDES = "python-distribute"
-
-DEPENDS += "python"
-DEPENDS_class-native += "python-native"
-
-inherit distutils
-
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
-
-RDEPENDS_${PN} = "\
-  python-stringold \
-  python-email \
-  python-shell \
-  python-distutils \
-  python-compression \
-  python-pkgutil \
-  python-plistlib \
-  python-numbers \
-  python-html \
-  python-netserver \
-  python-ctypes \
-  python-subprocess \
-  python-unittest \
-  python-compile \
-"
-
-RDEPENDS_${PN}_class-native = "\
-  python-distutils \
-  python-compression \
-"
-
-RREPLACES_${PN} = "python-distribute"
-RPROVIDES_${PN} = "python-distribute"
-RCONFLICTS_${PN} = "python-distribute"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-setuptools_25.1.0.bb b/meta/recipes-devtools/python/python-setuptools_25.1.0.bb
new file mode 100644
index 0000000..c172039
--- /dev/null
+++ b/meta/recipes-devtools/python/python-setuptools_25.1.0.bb
@@ -0,0 +1,38 @@
+require python-setuptools.inc
+
+PROVIDES = "python-distribute"
+
+DEPENDS += "python"
+DEPENDS_class-native += "python-native"
+
+inherit distutils
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
+
+RDEPENDS_${PN} = "\
+  python-stringold \
+  python-email \
+  python-shell \
+  python-distutils \
+  python-compression \
+  python-pkgutil \
+  python-plistlib \
+  python-numbers \
+  python-html \
+  python-netserver \
+  python-ctypes \
+  python-subprocess \
+  python-unittest \
+  python-compile \
+"
+
+RDEPENDS_${PN}_class-native = "\
+  python-distutils \
+  python-compression \
+"
+
+RREPLACES_${PN} = "python-distribute"
+RPROVIDES_${PN} = "python-distribute"
+RCONFLICTS_${PN} = "python-distribute"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.6.6


