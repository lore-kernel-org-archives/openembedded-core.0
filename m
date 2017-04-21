Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CEED577BDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:40:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 21 Apr 2017 05:40:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,229,1488873600"; d="scan'208";a="251889269"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2017 05:40:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 15:39:58 +0300
Message-Id: <35c3567755dc869ea0f7f8d2b5f55288104e9541.1492777818.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/11] python3-pygpgme: remove the recipe
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
X-List-Received-Date: Fri, 21 Apr 2017 12:40:26 -0000

It was required only by dnf, which has switched to official gpgme bindings.
pygpgme itself is old and unmaintaned.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/python/python3-pygpgme_0.3.bb | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pygpgme_0.3.bb

diff --git a/meta/recipes-devtools/python/python3-pygpgme_0.3.bb b/meta/recipes-devtools/python/python3-pygpgme_0.3.bb
deleted file mode 100644
index 495f677cfa2..00000000000
--- a/meta/recipes-devtools/python/python3-pygpgme_0.3.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "A Python module for working with OpenPGP messages"
-HOMEPAGE = "https://launchpad.net/pygpgme"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://README;md5=2dc15a76acf01e126188c8de634ae4b3"
-
-SRC_URI = "https://launchpad.net/pygpgme/trunk/${PV}/+download/pygpgme-${PV}.tar.gz"
-SRC_URI[md5sum] = "d38355af73f0352cde3d410b25f34fd0"
-SRC_URI[sha256sum] = "5fd887c407015296a8fd3f4b867fe0fcca3179de97ccde90449853a3dfb802e1"
-
-S = "${WORKDIR}/pygpgme-${PV}"
-
-inherit distutils3
-
-DEPENDS = "gpgme python3"
-
-RDEPENDS_${PN} += "python3-core"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


