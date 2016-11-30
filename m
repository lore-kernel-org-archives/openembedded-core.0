Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 600FE71A84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 16:04:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2016 08:04:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,574,1473145200"; d="scan'208";a="792645847"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Nov 2016 08:04:36 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 10:05:54 -0600
Message-Id: <20161130160554.14737-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] python3-setuptools: upgrade to 29.0.1
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
X-List-Received-Date: Wed, 30 Nov 2016 16:04:38 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

It is a simultaneous upgrade for python 2 and 3 over setuptools.

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/recipes-devtools/python/python-setuptools.inc |   6 +-
 ...tools_22.0.5.bb => python-setuptools_28.8.0.bb} |   0
 ...ools_22.0.5.bb => python3-setuptools_29.0.1.bb} |   0
 tatus                                              | 109 +++++++++++++++++++++
 4 files changed, 112 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-setuptools_22.0.5.bb => python-setuptools_28.8.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-setuptools_22.0.5.bb => python3-setuptools_29.0.1.bb} (100%)
 create mode 100644 tatus

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 92ca9a0..e76484a 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -3,14 +3,14 @@ HOMEPAGE = "https://pypi.python.org/pypi/setuptools"
 SECTION = "devel/python"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://setup.py;beginline=134;endline=134;md5=3e8df024d6c1442d18e84acf8fbbc475"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=146;endline=146;md5=3e8df024d6c1442d18e84acf8fbbc475"
 
 SRCNAME = "setuptools"
 
 SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "869f3029dcc66a64ba39875e2a2f044a"
-SRC_URI[sha256sum] = "19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb"
+SRC_URI[md5sum] = "28ecfd0f2574b489b9a18343879a7324"
+SRC_URI[sha256sum] = "b539118819a4857378398891fa5366e090690e46b3e41421a1e07d6e9fd8feb0"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python-setuptools_28.8.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-setuptools_22.0.5.bb
rename to meta/recipes-devtools/python/python-setuptools_28.8.0.bb
diff --git a/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-setuptools_22.0.5.bb
rename to meta/recipes-devtools/python/python3-setuptools_29.0.1.bb
diff --git a/tatus b/tatus
new file mode 100644
index 0000000..18b9527
--- /dev/null
+++ b/tatus
@@ -0,0 +1,109 @@
+[1mdiff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc[m
+[1mindex 92ca9a0..d3eef13 100644[m
+[1m--- a/meta/recipes-devtools/python/python-setuptools.inc[m
+[1m+++ b/meta/recipes-devtools/python/python-setuptools.inc[m
+[36m@@ -3,14 +3,14 @@[m [mHOMEPAGE = "https://pypi.python.org/pypi/setuptools"[m
+ SECTION = "devel/python"[m
+ LICENSE = "MIT"[m
+ [m
+[31m-LIC_FILES_CHKSUM = "file://setup.py;beginline=134;endline=134;md5=3e8df024d6c1442d18e84acf8fbbc475"[m
+[32m+[m[32mLIC_FILES_CHKSUM = "file://setup.py;beginline=146;endline=146;md5=3e8df024d6c1442d18e84acf8fbbc475"[m
+ [m
+ SRCNAME = "setuptools"[m
+ [m
+ SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"[m
+ [m
+[31m-SRC_URI[md5sum] = "869f3029dcc66a64ba39875e2a2f044a"[m
+[31m-SRC_URI[sha256sum] = "19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb"[m
+[32m+[m[32mSRC_URI[md5sum] = "43d6eb25f60e8a2682a8f826ce9e3f42"[m
+[32m+[m[32mSRC_URI[sha256sum] = "432a1ad4044338c34c2d09b0ff75d509b9849df8cf329f4c1c7706d9c2ba3c61"[m
+ [m
+ UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"[m
+ [m
+[1mdiff --git a/meta/recipes-devtools/python/python-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python-setuptools_22.0.5.bb[m
+[1mdeleted file mode 100644[m
+[1mindex 526474c..0000000[m
+[1m--- a/meta/recipes-devtools/python/python-setuptools_22.0.5.bb[m
+[1m+++ /dev/null[m
+[36m@@ -1,38 +0,0 @@[m
+[31m-require python-setuptools.inc[m
+[31m-[m
+[31m-PROVIDES = "python-distribute"[m
+[31m-[m
+[31m-DEPENDS += "python"[m
+[31m-DEPENDS_class-native += "python-native"[m
+[31m-[m
+[31m-inherit distutils[m
+[31m-[m
+[31m-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"[m
+[31m-[m
+[31m-RDEPENDS_${PN} = "\[m
+[31m-  python-stringold \[m
+[31m-  python-email \[m
+[31m-  python-shell \[m
+[31m-  python-distutils \[m
+[31m-  python-compression \[m
+[31m-  python-pkgutil \[m
+[31m-  python-plistlib \[m
+[31m-  python-numbers \[m
+[31m-  python-html \[m
+[31m-  python-netserver \[m
+[31m-  python-ctypes \[m
+[31m-  python-subprocess \[m
+[31m-  python-unittest \[m
+[31m-  python-compile \[m
+[31m-"[m
+[31m-[m
+[31m-RDEPENDS_${PN}_class-native = "\[m
+[31m-  python-distutils \[m
+[31m-  python-compression \[m
+[31m-"[m
+[31m-[m
+[31m-RREPLACES_${PN} = "python-distribute"[m
+[31m-RPROVIDES_${PN} = "python-distribute"[m
+[31m-RCONFLICTS_${PN} = "python-distribute"[m
+[31m-[m
+[31m-BBCLASSEXTEND = "native nativesdk"[m
+[1mdiff --git a/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb b/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb[m
+[1mdeleted file mode 100644[m
+[1mindex 65af6f0..0000000[m
+[1m--- a/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb[m
+[1m+++ /dev/null[m
+[36m@@ -1,37 +0,0 @@[m
+[31m-require python-setuptools.inc[m
+[31m-[m
+[31m-DEPENDS += "python3"[m
+[31m-DEPENDS_class-native += "python3-native"[m
+[31m-[m
+[31m-inherit distutils3[m
+[31m-[m
+[31m-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"[m
+[31m-[m
+[31m-# The installer puts the wrong path in the setuptools.pth file.  Correct it.[m
+[31m-do_install_append() {[m
+[31m-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth[m
+[31m-    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install[m
+[31m-    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth[m
+[31m-}[m
+[31m-[m
+[31m-RDEPENDS_${PN} = "\[m
+[31m-  python3-distutils \[m
+[31m-  python3-compression \[m
+[31m-"[m
+[31m-RDEPENDS_${PN}_class-target = "\[m
+[31m-  python3-ctypes \[m
+[31m-  python3-distutils \[m
+[31m-  python3-email \[m
+[31m-  python3-importlib \[m
+[31m-  python3-numbers \[m
+[31m-  python3-compression \[m
+[31m-  python3-shell \[m
+[31m-  python3-subprocess \[m
+[31m-  python3-textutils \[m
+[31m-  python3-pkgutil \[m
+[31m-  python3-threading \[m
+[31m-  python3-misc \[m
+[31m-  python3-unittest \[m
+[31m-  python3-xml \[m
+[31m-"[m
+[31m-BBCLASSEXTEND = "native"[m
-- 
2.9.3


