Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4206173D27
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 18:52:47 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 03 Aug 2016 11:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,466,1464678000"; d="scan'208";a="150127688"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga004.fm.intel.com with ESMTP; 03 Aug 2016 11:52:43 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 18:49:44 +0000
Message-Id: <55778877eaae6a104135626a87b09fefd4bec5e0.1470158817.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <94406436e753a3b5c6b85552578f97a704f825be.1470158817.git.alejandro.hernandez@linux.intel.com>
References: <94406436e753a3b5c6b85552578f97a704f825be.1470158817.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1470158817.git.alejandro.hernandez@linux.intel.com>
References: <cover.1470158817.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 4/4] Python3: Upgrade from 3.5.1 to 3.5.2
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
X-List-Received-Date: Wed, 03 Aug 2016 18:52:48 -0000

    LICENSE did not change, only dates were changed

    Upstream:
     - use_packed_importlib.patch
     - CVE-2016-5636.patch

Other patches were rebased on python3-natives patch

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/{python3_3.5.1.bb => python3_3.5.2.bb}              | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.5.1.bb => python3_3.5.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3_3.5.1.bb
rename to meta/recipes-devtools/python/python3_3.5.2.bb
index bf29d12..a41e110 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -35,18 +35,16 @@ SRC_URI += "\
             file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
             file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
             file://setup.py-find-libraries-in-staging-dirs.patch \
-            file://use_packed_importlib.patch \
             file://configure.ac-fix-LIBPL.patch \
-            file://CVE-2016-5636.patch \
            "
-SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
-SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
+SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
+SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6b60258130e4ed10d3101517eb5b9385"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
-
 S = "${WORKDIR}/Python-${PV}"
 
 inherit autotools multilib_header python3native pkgconfig
-- 
2.6.6


