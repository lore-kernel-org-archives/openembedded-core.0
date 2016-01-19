Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E4D4E731F4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:55:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 13:55:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="32546167"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 13:55:41 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:56:30 +0000
Message-Id: <62d291680810d68b0b9d5d452ad8631ffcd7fc5f.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 7/9] python-numpy: upgrade to 1.10.4
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
X-List-Received-Date: Tue, 19 Jan 2016 21:55:50 -0000

Updates runtime dependencies, numpy now depends on python-ctypes and python-threading.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/{python-numpy_1.10.1.bb => python-numpy_1.10.4.bb}       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-numpy_1.10.1.bb => python-numpy_1.10.4.bb} (92%)

diff --git a/meta/recipes-devtools/python/python-numpy_1.10.1.bb b/meta/recipes-devtools/python/python-numpy_1.10.4.bb
similarity index 92%
rename from meta/recipes-devtools/python/python-numpy_1.10.1.bb
rename to meta/recipes-devtools/python/python-numpy_1.10.4.bb
index 693020e..01bf9fb 100644
--- a/meta/recipes-devtools/python/python-numpy_1.10.1.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.10.4.bb
@@ -69,8 +69,8 @@ do_compile_prepend_class-target() {
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
 
-SRC_URI[md5sum] = "3fed2b50906bc19018cec5fa26168aa5"
-SRC_URI[sha256sum] = "8b9f453f29ce96a14e625100d3dcf8926301d36c5f622623bf8820e748510858"
+SRC_URI[md5sum] = "90bb9034652cefbada19cf7d141a6a61"
+SRC_URI[sha256sum] = "f7f91842056a7cf680b0eaf8cefc5e46c69e2521e651128d2e6aaaccec8652ae"
 
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python-unittest \
@@ -91,6 +91,8 @@ RDEPENDS_${PN} = "python-unittest \
                   python-email \
                   python-subprocess \
                   python-compression \
+                  python-ctypes \
+                  python-threading \
 "
 
 RDEPENDS_${PN}_class-native = ""
-- 
1.8.4.5


