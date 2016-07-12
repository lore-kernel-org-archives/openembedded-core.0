Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9E48173195
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:14:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jul 2016 04:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,351,1464678000"; d="scan'208";a="1005225648"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2016 04:14:57 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 14:14:51 +0300
Message-Id: <1db1fda82b07a5750e581f05d967e01f1f0906b2.1468310468.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1468310468.git.jussi.kukkonen@intel.com>
References: <cover.1468310468.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 1/5] python-six: Add to oe-core
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
X-List-Received-Date: Tue, 12 Jul 2016 11:14:57 -0000

Recipes are moved from meta-openembedded/meta-python

Changes compared to meta-python version:
* Modified to not inherit pypi
* Fix python-io dependency for python3
* Support native, nativesdk
* Do not install .egg

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-devtools/python/python-six.inc        | 16 ++++++++++++++++
 meta/recipes-devtools/python/python-six_1.10.0.bb  |  4 ++++
 meta/recipes-devtools/python/python3-six_1.10.0.bb |  4 ++++
 3 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-six.inc
 create mode 100644 meta/recipes-devtools/python/python-six_1.10.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-six_1.10.0.bb

diff --git a/meta/recipes-devtools/python/python-six.inc b/meta/recipes-devtools/python/python-six.inc
new file mode 100644
index 0000000..bd12fa9
--- /dev/null
+++ b/meta/recipes-devtools/python/python-six.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Python 2 and 3 compatibility library"
+HOMEPAGE = "https://pypi.python.org/pypi/six/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/s/six/six-${PV}.tar.gz"
+SRC_URI[md5sum] = "34eed507548117b2ab523ab14b2f8b55"
+SRC_URI[sha256sum] = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/six/"
+UPSTREAM_CHECK_REGEX = "/six/(?P<pver>(\d+[\.\-_]*)+)"
+
+BBCLASSEXTEND = "native nativesdk"
+
+S = "${WORKDIR}/six-${PV}"
diff --git a/meta/recipes-devtools/python/python-six_1.10.0.bb b/meta/recipes-devtools/python/python-six_1.10.0.bb
new file mode 100644
index 0000000..4350485
--- /dev/null
+++ b/meta/recipes-devtools/python/python-six_1.10.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools
+require python-six.inc
+
+RDEPENDS_${PN} += "python-io"
diff --git a/meta/recipes-devtools/python/python3-six_1.10.0.bb b/meta/recipes-devtools/python/python3-six_1.10.0.bb
new file mode 100644
index 0000000..38a47b7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-six_1.10.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-six.inc
+
+RDEPENDS_${PN} += "python3-io"
-- 
2.1.4


