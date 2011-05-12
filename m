Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgN-0000Lc-Oq
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 04:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="641703868"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 04:01:02 -0700
Message-Id: <16ab566b6bbc18930ca5b4847c26b658daa64b1e.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:34:30 +0800
Date: Thu, 12 May 2011 19:01:00 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 11/54] matchbox-stroke: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:52 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../matchbox-stroke/files/configure_fix.patch      |    2 ++
 .../files/dso_linking_change_build_fix.patch       |    1 +
 .../matchbox-stroke/files/single-instance.patch    |    1 +
 3 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch b/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
index 52cea0e..800bf3b 100644
--- a/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
+++ b/meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: matchbox-window-manager/configure.ac
 ===================================================================
 --- matchbox-window-manager.orig/configure.ac	2007-11-14 12:02:28.000000000 +0000
diff --git a/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
index dd45341..cbfa7de 100644
--- a/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
+++ b/meta/recipes-sato/matchbox-stroke/files/dso_linking_change_build_fix.patch
@@ -13,6 +13,7 @@ This patch avoids these linking errors:
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/11
 
+Upstream-Status: Pending
 
 Index: matchbox-stroke/configure.ac
 ===================================================================
diff --git a/meta/recipes-sato/matchbox-stroke/files/single-instance.patch b/meta/recipes-sato/matchbox-stroke/files/single-instance.patch
index f4fec07..239aadb 100644
--- a/meta/recipes-sato/matchbox-stroke/files/single-instance.patch
+++ b/meta/recipes-sato/matchbox-stroke/files/single-instance.patch
@@ -6,6 +6,7 @@ in matchbox-desktop.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
 
 Index: matchbox-stroke/matchbox-stroke.desktop
 ===================================================================
-- 
1.7.1



