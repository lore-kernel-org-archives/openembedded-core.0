Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3BC6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 18:04:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 28 Jul 2016 11:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,434,1464678000"; d="scan'208";a="1015698489"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2016 11:03:28 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 18:00:42 +0000
Message-Id: <1469728842-20557-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2] python-pexpect: Upgrade to 4.2.0
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
X-List-Received-Date: Thu, 28 Jul 2016 18:04:32 -0000

LICENCE checksum changed, although license didnt change,
it says PEXPECT license instead of ISC, but its still ISC.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/python-pexpect_4.1.0.bb                 | 28 ----------------------
 .../python/python-pexpect_4.2.0.bb                 | 28 ++++++++++++++++++++++
 2 files changed, 28 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-pexpect_4.1.0.bb
 create mode 100644 meta/recipes-devtools/python/python-pexpect_4.2.0.bb

diff --git a/meta/recipes-devtools/python/python-pexpect_4.1.0.bb b/meta/recipes-devtools/python/python-pexpect_4.1.0.bb
deleted file mode 100644
index 10590e4..0000000
--- a/meta/recipes-devtools/python/python-pexpect_4.1.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "A Pure Python Expect like Module for Python"
-HOMEPAGE = "http://pexpect.readthedocs.org/"
-SECTION = "devel/python"
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=66c2378a96b307d56bfb3a9e58edafa8"
-
-SRCNAME = "pexpect"
-
-SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[md5sum] = "562a1a21f2a60b36dfd5d906dbf0943e"
-SRC_URI[sha256sum] = "c381c60f1987355b65df8f08a27f428831914c8a81091bd1778ac336fa2f27e7"
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
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python-pexpect_4.2.0.bb b/meta/recipes-devtools/python/python-pexpect_4.2.0.bb
new file mode 100644
index 0000000..82e0fa8
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pexpect_4.2.0.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A Pure Python Expect like Module for Python"
+HOMEPAGE = "http://pexpect.readthedocs.org/"
+SECTION = "devel/python"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c7a725251880af8c6a148181665385b"
+
+SRCNAME = "pexpect"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "8071ec5df0f3d515daedafad672d1632"
+SRC_URI[sha256sum] = "bf6816b8cc8d301a499e7adf338828b39bc7548eb64dbed4dd410ed93d95f853"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/pexpect"
+
+S = "${WORKDIR}/pexpect-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "\
+    python-core \
+    python-io \
+    python-terminal \
+    python-resource \
+    python-fcntl \
+    python-ptyprocess \
+"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.6.6


