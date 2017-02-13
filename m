Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E15A871E5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:47 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546579"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:48 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:39 +0200
Message-Id: <05a4bc167ab5afdd49fa494c8bc9b6e3c7426daa.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/36] python-pygpgme: add a recipe
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:48 -0000

python-pygpgme is required by dnf.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python-pygpgme_0.3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-pygpgme_0.3.bb

diff --git a/meta/recipes-devtools/python/python-pygpgme_0.3.bb b/meta/recipes-devtools/python/python-pygpgme_0.3.bb
new file mode 100644
index 00000000000..f7dd835eee9
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A Python module for working with OpenPGP messages"
+HOMEPAGE = "https://launchpad.net/pygpgme"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://README;md5=2dc15a76acf01e126188c8de634ae4b3"
+
+SRC_URI = "https://launchpad.net/pygpgme/trunk/${PV}/+download/pygpgme-${PV}.tar.gz"
+SRC_URI[md5sum] = "d38355af73f0352cde3d410b25f34fd0"
+SRC_URI[sha256sum] = "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3dfb802e1"
+
+S = "${WORKDIR}/pygpgme-${PV}"
+
+inherit distutils
+
+DEPENDS = "gpgme python"
+
+RDEPENDS_${PN} += "python-core"
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


