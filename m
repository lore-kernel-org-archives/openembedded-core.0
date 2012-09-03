Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8F-0004vH-Aa
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497230"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:39 +0100
Message-Id: <4c41eba9d9591cb8eaa8f5e8ad85b616a7fd6161.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 19/28] packagegroup-core-clutter: remove empty -apps/-tests tasks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 10:43:51 -0000

These aren't useful at the moment, so remove them and all references to
them.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/images/core-image-clutter.bb |    3 +--
 .../packagegroups/packagegroup-core-clutter.bb     |   13 ++-----------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/recipes-graphics/images/core-image-clutter.bb
index 84ceb27..496246e 100644
--- a/meta/recipes-graphics/images/core-image-clutter.bb
+++ b/meta/recipes-graphics/images/core-image-clutter.bb
@@ -8,7 +8,6 @@ LICENSE = "MIT"
 IMAGE_INSTALL = "\
     ${CORE_IMAGE_BASE_INSTALL} \
     packagegroup-core-clutter-core \
-    packagegroup-core-clutter-tests \
-    packagegroup-core-clutter-apps"
+    "
 
 inherit core-image
diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
index b928096..2c62820 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-clutter.bb
@@ -10,20 +10,11 @@ PR = "r4"
 inherit packagegroup
 
 PACKAGES = "\
-    packagegroup-core-clutter-core \
-    packagegroup-core-clutter-apps \
-    packagegroup-core-clutter-tests \
+    ${PN}-core \
     "
 
-RDEPENDS_packagegroup-core-clutter-core = "\
+RDEPENDS_${PN}-core = "\
     clutter-1.8 \
     clutter-gst-1.8 \
     clutter-gtk-1.8 \
     "
-
-#RDEPENDS_packagegroup-core-clutter-tests = "\
-#    clutter-gst-1.8-examples \
-#    clutter-gtk-1.8-examples"
-
-#RDEPENDS_packagegroup-core-clutter-apps = "\
-#    clutter-box2d "
-- 
1.7.9.5



