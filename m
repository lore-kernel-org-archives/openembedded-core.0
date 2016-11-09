Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4968360770
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 23:40:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 09 Nov 2016 15:40:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,615,1473145200"; d="scan'208";a="784589693"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2016 15:40:28 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2016 17:41:43 -0600
Message-Id: <20161109234143.2870-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] python3-numpy: upgrade to 1.11.2
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
X-List-Received-Date: Wed, 09 Nov 2016 23:40:28 -0000


Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>

---
 .../python-numpy/{python3-numpy_1.11.0.bb => python3-numpy_1.11.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.11.0.bb => python3-numpy_1.11.2.bb} (95%)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
similarity index 95%
rename from meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb
rename to meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
index 3cca223..c34df6f 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.11.0.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.11.2.bb
@@ -73,8 +73,8 @@ do_compile_prepend_class-target() {
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
-SRC_URI[md5sum] = "bc56fb9fc2895aa4961802ffbdb31d0b"
-SRC_URI[sha256sum] = "a1d1268d200816bfb9727a7a27b78d8e37ecec2e4d5ebd33eb64e2789e0db43e"
+SRC_URI[md5sum] = "03bd7927c314c43780271bf1ab795ebc"
+SRC_URI[sha256sum] = "04db2fbd64e2e7c68e740b14402b25af51418fc43a59d9e54172b38b906b0f69"
 
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python3-unittest \
-- 
1.9.1


