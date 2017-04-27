Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 14B6077D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884590"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:33 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:28:08 +0300
Message-Id: <2c3d44502565e7b0a17b028f08f67b402c16d80d.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/13] python: remove unused 2.x versions of several packages
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:32 -0000

Nothing is using them in oe-core or meta-oe layers (except python-six is used by
and provided in meta-oe, so there was recipe duplication).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python-async_0.6.2.bb |  5 ----
 meta/recipes-devtools/python/python-git_2.1.1.bb   |  7 ------
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb |  7 ------
 meta/recipes-devtools/python/python-mako_1.0.6.bb  | 17 -------------
 .../python/python-pexpect_4.2.1.bb                 | 28 ----------------------
 .../python/python-ptyprocess_0.5.1.bb              | 23 ------------------
 meta/recipes-devtools/python/python-six_1.10.0.bb  |  4 ----
 meta/recipes-devtools/python/python-smmap_0.9.0.bb |  5 ----
 8 files changed, 96 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-async_0.6.2.bb
 delete mode 100644 meta/recipes-devtools/python/python-git_2.1.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-gitdb_0.6.4.bb
 delete mode 100644 meta/recipes-devtools/python/python-mako_1.0.6.bb
 delete mode 100644 meta/recipes-devtools/python/python-pexpect_4.2.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-six_1.10.0.bb
 delete mode 100644 meta/recipes-devtools/python/python-smmap_0.9.0.bb

diff --git a/meta/recipes-devtools/python/python-async_0.6.2.bb b/meta/recipes-devtools/python/python-async_0.6.2.bb
deleted file mode 100644
index d855e42a79f..00000000000
--- a/meta/recipes-devtools/python/python-async_0.6.2.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-async.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-threading python-lang"
diff --git a/meta/recipes-devtools/python/python-git_2.1.1.bb b/meta/recipes-devtools/python/python-git_2.1.1.bb
deleted file mode 100644
index e49dbea544b..00000000000
--- a/meta/recipes-devtools/python/python-git_2.1.1.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python-git.inc
-
-DEPENDS = "python-gitdb"
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-gitdb python-lang python-io python-shell python-math python-re python-subprocess python-stringold python-unixadmin"
diff --git a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
deleted file mode 100644
index 17773957930..00000000000
--- a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require python-gitdb.inc
-
-DEPENDS = "python-async python-smmap"
-
-inherit distutils
-
-RDEPENDS_${PN} += "python-smmap python-async python-mmap python-lang python-zlib python-io python-shell"
diff --git a/meta/recipes-devtools/python/python-mako_1.0.6.bb b/meta/recipes-devtools/python/python-mako_1.0.6.bb
deleted file mode 100644
index 230044e1a25..00000000000
--- a/meta/recipes-devtools/python/python-mako_1.0.6.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require python-mako.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} = "python-threading \
-                  python-netclient \
-                  python-html \
-"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
-
-# The same utility is packaged in python3-mako, so it would conflict
-do_install_append() {
-    rm -f ${D}${bindir}/mako-render
-    rmdir ${D}${bindir}
-}
diff --git a/meta/recipes-devtools/python/python-pexpect_4.2.1.bb b/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
deleted file mode 100644
index 1321797ef9c..00000000000
--- a/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "A Pure Python Expect like Module for Python"
-HOMEPAGE = "http://pexpect.readthedocs.org/"
-SECTION = "devel/python"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
-
-SRCNAME = "pexpect"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "3694410001a99dff83f0b500a1ca1c95"
-SRC_URI[sha256sum] = "3d132465a75b57aa818341c6521392a06cc660feb3988d7f1074f39bd23c9a92"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
-
-S = "${WORKDIR}/pexpect-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} = "\
-    python-core \
-    python-io \
-    python-terminal \
-    python-resource \
-    python-fcntl \
-    python-ptyprocess \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb b/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
deleted file mode 100644
index eed24ad2ecd..00000000000
--- a/meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Run a subprocess in a pseudo terminal"
-HOMEPAGE = "http://ptyprocess.readthedocs.io/en/latest/"
-SECTION = "devel/python"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cfdcd51fa7d5808da4e74346ee394490"
-
-SRCNAME = "ptyprocess"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "94e537122914cc9ec9c1eadcd36e73a1"
-SRC_URI[sha256sum] = "0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/ptyprocess"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
-
-RDEPENDS_${PN} = "\
-    python-core \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-six_1.10.0.bb b/meta/recipes-devtools/python/python-six_1.10.0.bb
deleted file mode 100644
index 4350485f734..00000000000
--- a/meta/recipes-devtools/python/python-six_1.10.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools
-require python-six.inc
-
-RDEPENDS_${PN} += "python-io"
diff --git a/meta/recipes-devtools/python/python-smmap_0.9.0.bb b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
deleted file mode 100644
index c118dd8d636..00000000000
--- a/meta/recipes-devtools/python/python-smmap_0.9.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-smmap.inc
-
-inherit setuptools
-
-RDEPENDS_${PN} += "python-codecs python-mmap python-lang"
-- 
2.11.0


