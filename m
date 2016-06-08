Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A399A731E0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:57:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 22:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,437,1459839600"; d="scan'208";a="993287630"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 05:56:14 +0000
Message-Id: <16493d933a78c7958daa7c117ff66d0bbeb19cb1.1465365165.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 8/9] python-scons: Upgrade from 2.4.1 to 2.5.0
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
X-List-Received-Date: Wed, 08 Jun 2016 05:57:11 -0000

Upgrades both python-scons and python-scons-native to 2.5.0,
also fixes a runtime dependency issue when calling scons

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 ...ative_2.4.1.bb => python-scons-native_2.5.0.bb} |  0
 meta/recipes-devtools/python/python-scons_2.4.1.bb | 22 --------------------
 meta/recipes-devtools/python/python-scons_2.5.0.bb | 24 ++++++++++++++++++++++
 3 files changed, 24 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_2.4.1.bb => python-scons-native_2.5.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python-scons_2.4.1.bb
 create mode 100644 meta/recipes-devtools/python/python-scons_2.5.0.bb

diff --git a/meta/recipes-devtools/python/python-scons-native_2.4.1.bb b/meta/recipes-devtools/python/python-scons-native_2.5.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_2.4.1.bb
rename to meta/recipes-devtools/python/python-scons-native_2.5.0.bb
diff --git a/meta/recipes-devtools/python/python-scons_2.4.1.bb b/meta/recipes-devtools/python/python-scons_2.4.1.bb
deleted file mode 100644
index 096cf5c..0000000
--- a/meta/recipes-devtools/python/python-scons_2.4.1.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Software Construction tool (make/autotools replacement)"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=23bc1530c55e9f0d1b709056bcea237d"
-SRCNAME = "scons"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "9a0ddf33d9839f04380e0fae87cc4b40"
-SRC_URI[sha256sum] = "8fc4f42928c69bcbb33e1be94b646f2c700b659693fabc778c192d4d22f753a7"
-
-UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/scons/files/scons/"
-UPSTREAM_CHECK_REGEX = "/scons/(?P<pver>(\d+[\.\-_]*)+)/"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-RDEPENDS_${PN} = "\
-  python-fcntl \
-  python-io \
-  "
diff --git a/meta/recipes-devtools/python/python-scons_2.5.0.bb b/meta/recipes-devtools/python/python-scons_2.5.0.bb
new file mode 100644
index 0000000..c0a1cd4
--- /dev/null
+++ b/meta/recipes-devtools/python/python-scons_2.5.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Software Construction tool (make/autotools replacement)"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a885dff6d14e4cd876d9008a09a42de"
+SRCNAME = "scons"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "bda5530a70a41a7831d83c8b191c021e"
+SRC_URI[sha256sum] = "01f1b3d6023516a8e1b5e77799e5a82a23b32953b1102d339059ffeca8600493"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/SCons/"
+UPSTREAM_CHECK_REGEX = "/scons/(?P<pver>(\d+[\.\-_]*)+)/"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "\
+  python-fcntl \
+  python-io \
+  python-json \
+  python-subprocess \
+  "
-- 
2.6.6


