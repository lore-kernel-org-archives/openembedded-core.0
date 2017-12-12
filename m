Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A1C8E7886E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:04:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 21:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,394,1508828400"; d="scan'208";a="15240460"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2017 21:04:32 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 21:04:08 -0800
Message-Id: <23bb73104548d0bf15ba52ee7dbff4ab7f693beb.1513054233.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
References: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v3 03/14] python-*-manifest/generators: add runpy; python3-plistlib
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
X-List-Received-Date: Tue, 12 Dec 2017 05:04:33 -0000

* runpy allows running modules/scripts with 'python -m foo'
* python3-setuptools RDEPENDS on plistlib (present in python2)
* pip3 RDEPENDS on _markupbase (add to python3-core)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-devtools/python/python-2.7-manifest.inc |  9 +++++++++
 .../recipes-devtools/python/python-3.5-manifest.inc | 21 +++++++++++++++++++++
 scripts/contrib/python/generate-manifest-2.7.py     |  3 +++
 scripts/contrib/python/generate-manifest-3.5.py     |  7 +++++++
 4 files changed, 40 insertions(+)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 6198e2d1c3..7c3fc1b73a 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -56,6 +56,7 @@ PROVIDES+=" \
   ${PN}-readline \
   ${PN}-resource \
   ${PN}-robotparser \
+  ${PN}-runpy \
   ${PN}-shell \
   ${PN}-smtpd \
   ${PN}-sqlite3 \
@@ -127,6 +128,7 @@ PACKAGES=" \
   ${PN}-readline \
   ${PN}-resource \
   ${PN}-robotparser \
+  ${PN}-runpy \
   ${PN}-shell \
   ${PN}-smtpd \
   ${PN}-sqlite3 \
@@ -625,6 +627,12 @@ FILES_${PN}-robotparser=" \
     ${libdir}/python2.7/robotparser.* \
 "
 
+SUMMARY_${PN}-runpy="Python script for locating/executing scripts in module namespace"
+RDEPENDS_${PN}-runpy="${PN}-core ${PN}-pkgutil"
+FILES_${PN}-runpy=" \
+    ${libdir}/python2.7/runpy.* \
+"
+
 SUMMARY_${PN}-shell="Python shell-like functionality"
 RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
 FILES_${PN}-shell=" \
@@ -809,6 +817,7 @@ RDEPENDS_${PN}-modules=" \
   ${PN}-readline \
   ${PN}-resource \
   ${PN}-robotparser \
+  ${PN}-runpy \
   ${PN}-shell \
   ${PN}-smtpd \
   ${PN}-sqlite3 \
diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 686b5f9842..1fce070290 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -46,6 +46,7 @@ PROVIDES+="\
   ${PN}-numbers \
   ${PN}-pickle \
   ${PN}-pkgutil \
+  ${PN}-plistlib \
   ${PN}-pprint \
   ${PN}-profile \
   ${PN}-pydoc \
@@ -53,6 +54,7 @@ PROVIDES+="\
   ${PN}-readline \
   ${PN}-reprlib \
   ${PN}-resource \
+  ${PN}-runpy \
   ${PN}-selectors \
   ${PN}-shell \
   ${PN}-signal \
@@ -117,6 +119,7 @@ ${PN}-distutils \
   ${PN}-numbers \
   ${PN}-pickle \
   ${PN}-pkgutil \
+  ${PN}-plistlib \
   ${PN}-pprint \
   ${PN}-profile \
   ${PN}-pydoc \
@@ -124,6 +127,7 @@ ${PN}-distutils \
   ${PN}-readline \
   ${PN}-reprlib \
   ${PN}-resource \
+  ${PN}-runpy \
   ${PN}-selectors \
   ${PN}-shell \
   ${PN}-signal \
@@ -310,6 +314,7 @@ FILES_${PN}-core="\
   ${includedir}/python${PYTHON_BINABI}/pyconfig*.h \
   ${libdir}/python${PYTHON_MAJMIN}/collections \
   ${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* \
+  ${libdir}/python${PYTHON_MAJMIN}/_markupbase.* \
   ${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* \
   ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py \
 "
@@ -768,6 +773,13 @@ FILES_${PN}-pkgutil="\
   ${libdir}/python3.5/__pycache__/pkgutil.* \
 "
 
+SUMMARY_${PN}-plistlib="Generate and parse Mac OS X .plist files"
+RDEPENDS_${PN}-plistlib="${PN}-core ${PN}-datetime ${PN}-io"
+FILES_${PN}-plistlib="\
+  ${libdir}/python3.5/plistlib.* \
+  ${libdir}/python3.5/__pycache__/plistlib.* \
+"
+
 SUMMARY_${PN}-pprint="Python pretty-print support"
 RDEPENDS_${PN}-pprint="${PN}-core ${PN}-io"
 FILES_${PN}-pprint="\
@@ -836,6 +848,13 @@ FILES_${PN}-resource="\
   ${libdir}/python3.5/lib-dynload/__pycache__/resource.*.so \
 "
 
+SUMMARY_${PN}-runpy="Python script for locating/executing scripts in module namespace"
+RDEPENDS_${PN}-runpy="${PN}-core ${PN}-pkgutil"
+FILES_${PN}-runpy="\
+  ${libdir}/python3.5/runpy.* \
+  ${libdir}/python3.5/__pycache__/runpy.* \
+"
+
 SUMMARY_${PN}-selectors="Python High-level I/O multiplexing"
 RDEPENDS_${PN}-selectors="${PN}-core"
 FILES_${PN}-selectors="\
@@ -1077,6 +1096,7 @@ RDEPENDS_${PN}-modules=" \
   ${PN}-numbers \
   ${PN}-pickle \
   ${PN}-pkgutil \
+  ${PN}-plistlib \
   ${PN}-pprint \
   ${PN}-profile \
   ${PN}-pydoc \
@@ -1084,6 +1104,7 @@ RDEPENDS_${PN}-modules=" \
   ${PN}-readline \
   ${PN}-reprlib \
   ${PN}-resource \
+  ${PN}-runpy \
   ${PN}-selectors \
   ${PN}-shell \
   ${PN}-signal \
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 2491bd0bc4..ee7540399f 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -368,6 +368,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-robotparser", "Python robots.txt parser", "${PN}-core ${PN}-netclient",
     "robotparser.*")
 
+    m.addPackage( "${PN}-runpy", "Python script for locating/executing scripts in module namespace", "${PN}-core ${PN}-pkgutil",
+    "runpy.*")
+
     m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
     "subprocess.*" )
 
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 33779cffab..7dfae46992 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -213,6 +213,7 @@ if __name__ == "__main__":
     "${includedir}/python${PYTHON_BINABI}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/collections " +
     "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.* " +
+    "${libdir}/python${PYTHON_MAJMIN}/_markupbase.* " +
     "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.* " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
 
@@ -360,6 +361,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
     "pkgutil.*")
 
+    m.addPackage( "${PN}-plistlib", "Generate and parse Mac OS X .plist files", "${PN}-core ${PN}-datetime ${PN}-io",
+    "plistlib.*")
+
     m.addPackage( "${PN}-pprint", "Python pretty-print support", "${PN}-core ${PN}-io",
     "pprint.*" )
 
@@ -378,6 +382,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
     "lib-dynload/resource.*.so" )
 
+    m.addPackage( "${PN}-runpy", "Python script for locating/executing scripts in module namespace", "${PN}-core ${PN}-pkgutil",
+    "runpy.*" )
+
     m.addPackage( "${PN}-selectors", "Python High-level I/O multiplexing", "${PN}-core",
     "selectors.*" )
 
-- 
2.14.3


