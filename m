Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 98A896067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 23:47:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 16 Nov 2016 15:47:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,650,1473145200"; 
   d="scan'208";a="5285243"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by orsmga002.jf.intel.com with ESMTP; 16 Nov 2016 15:47:28 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 17:48:50 -0600
Message-Id: <20161116234850.15970-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH V2] python3-numpy: upgrade to 1.11.2
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
X-List-Received-Date: Wed, 16 Nov 2016 23:47:28 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

It is a simultaneous upgrade for python 2 and 3 over numpy module.

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
---
 .../python-numpy/{python-numpy_1.11.1.bb => python-numpy_1.11.2.bb}   | 4 ++--
 .../python-numpy/{python3-numpy_1.11.0.bb => python3-numpy_1.11.2.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.11.1.bb => python-numpy_1.11.2.bb} (95%)
 rename meta/recipes-devtools/python-numpy/{python3-numpy_1.11.0.bb => python3-numpy_1.11.2.bb} (95%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.11.1.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb
similarity index 95%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.11.1.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb
index c5af720..dafd7e2 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.11.1.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.11.2.bb
@@ -73,8 +73,8 @@ do_compile_prepend_class-target() {
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
-SRC_URI[md5sum] = "2f44a895a8104ffac140c3a70edbd450"
-SRC_URI[sha256sum] = "dc4082c43979cc856a2bf352a8297ea109ccb3244d783ae067eb2ee5b0d577cd"
+SRC_URI[md5sum] = "03bd7927c314c43780271bf1ab795ebc"
+SRC_URI[sha256sum] = "04db2fbd64e2e7c68e740b14402b25af51418fc43a59d9e54172b38b906b0f69"
 
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python-unittest \
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
2.9.3


