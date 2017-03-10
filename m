Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 525EC776E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988143"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:35 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:23:47 +0200
Message-Id: <46e4b66e446add6c8fbd33078d76b718cb84bdd4.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 08/44] python-pygpgme: add a recipe
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:34 -0000

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


