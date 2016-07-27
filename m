Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 29832606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 21:55:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jul 2016 14:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,431,1464678000"; d="scan'208";a="854815524"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga003.jf.intel.com with ESMTP; 27 Jul 2016 14:55:44 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 21:52:57 +0000
Message-Id: <a3e42644f10b61eb3dce9f12ca91a8e52cbce576.1469656341.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
References: <cover.1469656341.git.alejandro.hernandez@linux.intel.com>
Cc: Upgrade Helper <auh@auh.yoctoproject.org>
Subject: [PATCH 1/5] python-numpy: upgrade to 1.11.1
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
X-List-Received-Date: Wed, 27 Jul 2016 21:55:44 -0000

From: Upgrade Helper <auh@auh.yoctoproject.org>

---
 .../python-numpy/{python-numpy_1.11.0.bb => python-numpy_1.11.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python-numpy/{python-numpy_1.11.0.bb => python-numpy_1.11.1.bb} (95%)

diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.11.1.bb
similarity index 95%
rename from meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb
rename to meta/recipes-devtools/python-numpy/python-numpy_1.11.1.bb
index 7c70a10..c5af720 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.11.0.bb
+++ b/meta/recipes-devtools/python-numpy/python-numpy_1.11.1.bb
@@ -73,8 +73,8 @@ do_compile_prepend_class-target() {
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
-SRC_URI[md5sum] = "bc56fb9fc2895aa4961802ffbdb31d0b"
-SRC_URI[sha256sum] = "a1d1268d200816bfb9727a7a27b78d8e37ecec2e4d5ebd33eb64e2789e0db43e"
+SRC_URI[md5sum] = "2f44a895a8104ffac140c3a70edbd450"
+SRC_URI[sha256sum] = "dc4082c43979cc856a2bf352a8297ea109ccb3244d783ae067eb2ee5b0d577cd"
 
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python-unittest \
-- 
2.6.6


