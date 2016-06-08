Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC72731D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2016 05:57:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jun 2016 22:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,437,1459839600"; d="scan'208";a="993287626"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2016 22:57:09 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2016 05:56:10 +0000
Message-Id: <6aab12e6fe4621feed0950c97284fd6d35962af2.1465365165.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <12b9dd4338999b75a21fd1d293fa911e9dca3f1e.1465365165.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
References: <cover.1465365165.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 4/9] python-mako: Upgrade python-mako and python3-mako to 1.0.4
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
X-List-Received-Date: Wed, 08 Jun 2016 05:57:10 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python-mako.inc       | 15 ++++++++++++++
 .../{python-mako_1.0.3.bb => python-mako_1.0.4.bb} | 15 +-------------
 meta/recipes-devtools/python/python3-mako_1.0.3.bb | 24 ----------------------
 meta/recipes-devtools/python/python3-mako_1.0.4.bb | 11 ++++++++++
 4 files changed, 27 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-mako.inc
 rename meta/recipes-devtools/python/{python-mako_1.0.3.bb => python-mako_1.0.4.bb} (40%)
 delete mode 100644 meta/recipes-devtools/python/python3-mako_1.0.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-mako_1.0.4.bb

diff --git a/meta/recipes-devtools/python/python-mako.inc b/meta/recipes-devtools/python/python-mako.inc
new file mode 100644
index 0000000..85ec217
--- /dev/null
+++ b/meta/recipes-devtools/python/python-mako.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Templating library for Python"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1bb21fa2d2f7a534c884b990430a6863"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c5fc31a323dd4990683d2f2da02d4e20"
+SRC_URI[sha256sum] = "fed99dbe4d0ddb27a33ee4910d8708aca9ef1fe854e668387a9ab9a90cbf9059"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
+UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
+
+S = "${WORKDIR}/Mako-${PV}"
+
diff --git a/meta/recipes-devtools/python/python-mako_1.0.3.bb b/meta/recipes-devtools/python/python-mako_1.0.4.bb
similarity index 40%
rename from meta/recipes-devtools/python/python-mako_1.0.3.bb
rename to meta/recipes-devtools/python/python-mako_1.0.4.bb
index d4f426d..b10b3c3 100644
--- a/meta/recipes-devtools/python/python-mako_1.0.3.bb
+++ b/meta/recipes-devtools/python/python-mako_1.0.4.bb
@@ -1,17 +1,4 @@
-SUMMARY = "Templating library for Python"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=deb3ff8e4c17aaf7b80889b6b2bf4c83"
-
-SRC_URI = "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "a78f20f6366a8a0659ce5532f8614e53"
-SRC_URI[sha256sum] = "7644bc0ee35965d2e146dde31827b8982ed70a58281085fac42869a09764d38c"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
-UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/Mako-${PV}"
+require python-mako.inc
 
 inherit setuptools
 
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.3.bb b/meta/recipes-devtools/python/python3-mako_1.0.3.bb
deleted file mode 100644
index c770603..0000000
--- a/meta/recipes-devtools/python/python3-mako_1.0.3.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Templating library for Python"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=deb3ff8e4c17aaf7b80889b6b2bf4c83"
-
-SRC_URI = "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "a78f20f6366a8a0659ce5532f8614e53"
-SRC_URI[sha256sum] = "7644bc0ee35965d2e146dde31827b8982ed70a58281085fac42869a09764d38c"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/mako/"
-UPSTREAM_CHECK_REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
-
-S = "${WORKDIR}/Mako-${PV}"
-
-inherit setuptools3
-
-RDEPENDS_${PN} = "python3-threading \
-                  python3-netclient \
-                  python3-html \
-"
-RDEPENDS_${PN}_class-native = ""
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-mako_1.0.4.bb b/meta/recipes-devtools/python/python3-mako_1.0.4.bb
new file mode 100644
index 0000000..2b50ffd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-mako_1.0.4.bb
@@ -0,0 +1,11 @@
+require python-mako.inc
+
+inherit setuptools3
+
+RDEPENDS_${PN} = "python3-threading \
+                  python3-netclient \
+                  python3-html \
+"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.6.6


