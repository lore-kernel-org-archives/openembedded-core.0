Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id DB8F071DAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:48 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546593"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:48 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:40 +0200
Message-Id: <fdbf3b3b0359b99eb4d9d23e573facb2a4f0c0c3.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/36] python-iniparse: add a recipe
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:49 -0000

python-iniparse is required by dnf.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python-iniparse_0.4.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-iniparse_0.4.bb

diff --git a/meta/recipes-devtools/python/python-iniparse_0.4.bb b/meta/recipes-devtools/python/python-iniparse_0.4.bb
new file mode 100644
index 00000000000..f2515759b13
--- /dev/null
+++ b/meta/recipes-devtools/python/python-iniparse_0.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Accessing and Modifying INI files"
+HOMEPAGE = "https://pypi.python.org/pypi/iniparse/"
+LICENSE = "MIT & PSF"
+LIC_FILES_CHKSUM = "file://LICENSE-PSF;md5=1c78a5bb3584b353496d5f6f34edb4b2 \
+                    file://LICENSE;md5=52f28065af11d69382693b45b5a8eb54"
+
+SRC_URI = "https://files.pythonhosted.org/packages/source/i/iniparse/iniparse-${PV}.tar.gz"
+SRC_URI[md5sum] = "5e573e9e9733d97623881ce9bbe5eca6"
+SRC_URI[sha256sum] = "abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054"
+
+inherit distutils
+
+RDEPENDS_${PN} += "python-core"
+
+BBCLASSEXTEND = "native"
+
+S = "${WORKDIR}/iniparse-${PV}"
-- 
2.11.0


