Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA22A769DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:39:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 19 Aug 2015 06:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="771742212"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2015 06:39:52 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 16:40:48 +0300
Message-Id: <f7506184dd9a66fee2de49b0fb56193f47f20cc8.1439991562.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/22] giflib: add a recipe from meta-oe
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
X-List-Received-Date: Wed, 19 Aug 2015 13:39:52 -0000

This is a dependency of libwebp (which is a dependency of webkit)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/giflib/giflib_5.1.1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/giflib/giflib_5.1.1.bb

diff --git a/meta/recipes-devtools/giflib/giflib_5.1.1.bb b/meta/recipes-devtools/giflib/giflib_5.1.1.bb
new file mode 100644
index 0000000..f1facac
--- /dev/null
+++ b/meta/recipes-devtools/giflib/giflib_5.1.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "shared library for GIF images"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
+
+inherit autotools
+
+PACKAGES += "${PN}-utils"
+FILES_${PN} = "${libdir}/libgif.so.*"
+FILES_${PN}-utils = "${bindir}"
+
+BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN}-utils = "perl"
+
+SRC_URI[md5sum] = "1c39333192712788c6568c78a949f13e"
+SRC_URI[sha256sum] = "391014aceb21c8b489dc7b0d0b6a917c4e32cc014ce2426d47ca376d02fe2ffc"
-- 
2.1.4


