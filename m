Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgm-0000ac-65
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 04:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="641704433"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 04:01:27 -0700
Message-Id: <ac514d92cbe19c48e47f806673ed49cb90a79792.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 14:09:47 +0800
Date: Thu, 12 May 2011 19:01:24 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 30/54] clutter-gtk: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:18 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../clutter/clutter-gtk/disable_deprecated.patch   |    2 ++
 .../clutter/clutter-gtk/enable_tests.patch         |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch b/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
index d11c34e..f44755b 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
+++ b/meta/recipes-graphics/clutter/clutter-gtk/disable_deprecated.patch
@@ -4,6 +4,8 @@ This patch enables the macros that clutter-gtk is still using
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/clutter-gtk/Makefile.am
 ===================================================================
 --- git.orig/clutter-gtk/Makefile.am	2011-05-04 14:07:20.000000000 -0700
diff --git a/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
index 8e3e552..bedf80e 100644
--- a/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
+++ b/meta/recipes-graphics/clutter/clutter-gtk/enable_tests.patch
@@ -2,6 +2,8 @@ Install the test binary needed for core-image-clutter
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/examples/Makefile.am
 ===================================================================
 --- git.orig/examples/Makefile.am	2011-05-04 14:07:20.000000000 -0700
-- 
1.7.1



