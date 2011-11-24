Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RTWKO-0005qt-SI
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 11:14:49 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Nov 2011 02:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79496860"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2011 02:08:14 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 18:08:12 +0800
Message-Id: <d4724b4050931ff51499a8808287f04b0091e93e.1322128489.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322128489.git.dexuan.cui@intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322128489.git.dexuan.cui@intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
Subject: [PATCH 2/4] gcc-package-target.inc: add the symbol link /lib/cpp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2011 10:14:49 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 7bf14e3..7cd0850 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r17"
+PR = "r18"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index f0f1a04..3076670 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -122,6 +122,8 @@ do_install () {
 	ln -sf ${TARGET_PREFIX}g++ g++
 	ln -sf ${TARGET_PREFIX}gcc gcc
 	ln -sf ${TARGET_PREFIX}cpp cpp
+	install -d ${D}${base_libdir}
+	ln -sf ${bindir}/${TARGET_PREFIX}cpp ${D}${base_libdir}/cpp
 	ln -sf g++ c++
 	ln -sf gcc cc
 
-- 
1.7.6



