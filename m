Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgJ-0000Hk-LK
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 May 2011 04:00:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860399"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:00:57 -0700
Message-Id: <227610b6136b4b1191f4cdfc4e7c49f921fb1da7.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:09:49 +0800
Date: Thu, 12 May 2011 19:00:54 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 07/54] xtscal: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:48 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../xtscal/xtscal/change-cross.patch               |    2 ++
 meta/recipes-graphics/xtscal/xtscal/cleanup.patch  |    2 ++
 .../xtscal/dso_linking_change_build_fix.patch      |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xtscal/xtscal/change-cross.patch b/meta/recipes-graphics/xtscal/xtscal/change-cross.patch
index 3ecd36b..1da7717 100644
--- a/meta/recipes-graphics/xtscal/xtscal/change-cross.patch
+++ b/meta/recipes-graphics/xtscal/xtscal/change-cross.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- tmp/main.c.orig	2007-01-02 15:39:54.000000000 +0000
 +++ tmp/main.c	2007-01-02 15:39:54.000000000 +0000
 @@ -131,9 +131,10 @@
diff --git a/meta/recipes-graphics/xtscal/xtscal/cleanup.patch b/meta/recipes-graphics/xtscal/xtscal/cleanup.patch
index ce674ed..f7b0854 100644
--- a/meta/recipes-graphics/xtscal/xtscal/cleanup.patch
+++ b/meta/recipes-graphics/xtscal/xtscal/cleanup.patch
@@ -7,6 +7,8 @@
  xtscal.in    |   19 -----
  6 files changed, 14 insertions(+), 455 deletions(-)
 
+Upstream-Status: Pending
+
 Index: xtscal-0.6.3/xtscal.in
 ===================================================================
 --- xtscal-0.6.3.orig/xtscal.in	2004-09-10 20:10:36.000000000 +0100
diff --git a/meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch b/meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch
index 3ca14d7..3e4533f 100644
--- a/meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch
+++ b/meta/recipes-graphics/xtscal/xtscal/dso_linking_change_build_fix.patch
@@ -10,6 +10,8 @@ This patch avoids this linking error:
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/01/11
 
+Upstream-Status: Pending
+
 Index: xtscal-0.6.3/configure.ac
 ===================================================================
 --- xtscal-0.6.3.orig/configure.ac
-- 
1.7.1



