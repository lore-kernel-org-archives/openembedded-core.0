Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 136F7772F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 18:59:04 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 15 Dec 2016 10:59:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,353,1477983600"; d="scan'208";a="43050735"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2016 10:59:05 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 13:00:22 -0600
Message-Id: <1481828422-15950-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH V2] python3-setuptools: upgrade to 31.0.0
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
X-List-Received-Date: Thu, 15 Dec 2016 18:59:05 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

It is a simultaneous upgrade for python 2 and 3 over setuptools.

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc |  4 +--
 .../python/python-setuptools_29.0.1.bb             | 38 ----------------------
 .../python/python-setuptools_31.0.0.bb             | 38 ++++++++++++++++++++++
 .../python/python3-setuptools_29.0.1.bb            | 37 ---------------------
 .../python/python3-setuptools_31.0.0.bb            | 37 +++++++++++++++++++++
 5 files changed, 77 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-setuptools_29.0.1.bb
 create mode 100644 meta/recipes-devtools/python/python-setuptools_31.0.0.bb
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-setuptools_31.0.0.bb

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index e76484a..858595c 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -9,8 +9,8 @@ SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "28ecfd0f2574b489b9a18343879a7324"
-SRC_URI[sha256sum] = "b539118819a4857378398891fa5366e090690e46b3e41421a1e07d6e9fd8feb0"
+SRC_URI[md5sum] = "66da89eeb1f33c2b947f316cfb3d7c7e"
+SRC_URI[sha256sum] = "0818cc0de692c3a5c83ca83aa7ec7ba6bc206f278735f1e0267b8d0e095cfe7a"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_29.0.1.bb b/meta/recipes-devtools/python/python-setuptools_29.0.1.bb
deleted file mode 100644
index 526474c..0000000
--- a/meta/recipes-devtools/python/python-setuptools_29.0.1.bb
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
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
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
diff --git a/meta/recipes-devtools/python/python-setuptools_31.0.0.bb b/meta/recipes-devtools/python/python-setuptools_31.0.0.bb
new file mode 100644
index 0000000..526474c
--- /dev/null
+++ b/meta/recipes-devtools/python/python-setuptools_31.0.0.bb
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
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
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
diff --git a/meta/recipes-devtools/python/python3-setuptools_29.0.1.bb b/meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
deleted file mode 100644
index 65af6f0..0000000
--- a/meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require python-setuptools.inc
-
-DEPENDS += "python3"
-DEPENDS_class-native += "python3-native"
-
-inherit distutils3
-
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
-
-# The installer puts the wrong path in the setuptools.pth file.  Correct it.
-do_install_append() {
-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
-    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
-    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
-}
-
-RDEPENDS_${PN} = "\
-  python3-distutils \
-  python3-compression \
-"
-RDEPENDS_${PN}_class-target = "\
-  python3-ctypes \
-  python3-distutils \
-  python3-email \
-  python3-importlib \
-  python3-numbers \
-  python3-compression \
-  python3-shell \
-  python3-subprocess \
-  python3-textutils \
-  python3-pkgutil \
-  python3-threading \
-  python3-misc \
-  python3-unittest \
-  python3-xml \
-"
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
new file mode 100644
index 0000000..65af6f0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools_31.0.0.bb
@@ -0,0 +1,37 @@
+require python-setuptools.inc
+
+DEPENDS += "python3"
+DEPENDS_class-native += "python3-native"
+
+inherit distutils3
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
+
+# The installer puts the wrong path in the setuptools.pth file.  Correct it.
+do_install_append() {
+    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
+    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+}
+
+RDEPENDS_${PN} = "\
+  python3-distutils \
+  python3-compression \
+"
+RDEPENDS_${PN}_class-target = "\
+  python3-ctypes \
+  python3-distutils \
+  python3-email \
+  python3-importlib \
+  python3-numbers \
+  python3-compression \
+  python3-shell \
+  python3-subprocess \
+  python3-textutils \
+  python3-pkgutil \
+  python3-threading \
+  python3-misc \
+  python3-unittest \
+  python3-xml \
+"
+BBCLASSEXTEND = "native"
-- 
2.1.4


