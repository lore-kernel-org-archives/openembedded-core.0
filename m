Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5948F6FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 24 May 2016 04:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498230"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:31 +0300
Message-Id: <01d728657457bd1dda6c7477aba7b6f7469e7ee4.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 42/45] python3-nose: add a recipe
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
X-List-Received-Date: Tue, 24 May 2016 11:54:21 -0000

This is needed for updating piglit to use Python 3.
Python 2 based recipe can be later moved to meta-oe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python3-nose_1.3.7.bb | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-nose_1.3.7.bb

diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
new file mode 100644
index 0000000..a45d2f2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Extends Python unittest to make testing easier"
+DESCRIPTION = "nose extends the test loading and running features of unittest, \
+making it easier to write, find and run tests."
+SECTION = "devel/python"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
+SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/nose/"
+UPSTREAM_CHECK_REGEX = "/nose/(?P<pver>(\d+[\.\-_]*)+)"
+
+S = "${WORKDIR}/nose-${PV}"
+
+inherit setuptools3
+
+RDEPENDS_${PN}_class-target = "\
+  python3-unittest \
+  "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.8.1


