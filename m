Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTh9-0000nB-MP
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:39 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 May 2011 04:01:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860714"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:31 -0700
Message-Id: <2f64d4a1ffb08b5030183765ed8a936767ce19e9.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 14:17:32 +0800
Date: Thu, 12 May 2011 19:01:28 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 33/54] xcursor-transparent-theme: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:40 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../fix_watch_cursor.patch                         |    2 ++
 .../use-relative-symlinks.patch                    |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
index 73a5b2a..722bda3 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/fix_watch_cursor.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -NurP xcursor-transparent-theme-0.1.1-orig/cursors/Makefile.am xcursor-transparent-theme-0.1.1/cursors/Makefile.am
 --- xcursor-transparent-theme-0.1.1-orig/cursors/Makefile.am	2003-10-30 13:13:59.000000000 +0100
 +++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2005-12-20 23:35:17.000000000 +0100
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
index df28dfb..ae9640c 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/use-relative-symlinks.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -ur xcursor-transparent-theme-0.1.1~/cursors/Makefile.am xcursor-transparent-theme-0.1.1/cursors/Makefile.am
 --- xcursor-transparent-theme-0.1.1~/cursors/Makefile.am	2003-10-30 12:13:59.000000000 +0000
 +++ xcursor-transparent-theme-0.1.1/cursors/Makefile.am	2004-07-27 12:56:24.000000000 +0100
-- 
1.7.1



