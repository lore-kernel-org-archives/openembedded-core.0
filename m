Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKThF-0000ic-2T
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:45 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 04:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="641704618"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 04:01:58 -0700
Message-Id: <d2c5fb3bcdb8d202531e76b799ff1ee9f0e1267c.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 18:38:34 +0800
Date: Thu, 12 May 2011 19:01:56 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 54/54] matchbox-panel-2: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:46 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../matchbox-panel-2/gcc-4.6.0-compile.patch       |    2 ++
 .../recipes-sato/matchbox-panel-2/startup_fix.diff |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch b/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch
index 54ca74d..71a4727 100644
--- a/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch
+++ b/meta/recipes-sato/matchbox-panel-2/gcc-4.6.0-compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [other] - need clean up
+
 diff -ur git.ORIG/applets/startup/startup.c git/applets/startup/startup.c
 --- git.ORIG/applets/startup/startup.c	2011-04-28 08:13:25.000000000 -0600
 +++ git/applets/startup/startup.c	2011-04-28 09:36:48.521990746 -0600
diff --git a/meta/recipes-sato/matchbox-panel-2/startup_fix.diff b/meta/recipes-sato/matchbox-panel-2/startup_fix.diff
index 9262d33..d9a0876 100644
--- a/meta/recipes-sato/matchbox-panel-2/startup_fix.diff
+++ b/meta/recipes-sato/matchbox-panel-2/startup_fix.diff
@@ -2,6 +2,8 @@ Fixed the compile error caused by typo, upstream also need this.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Pending
+
 Index: matchbox-panel-2/applets/startup/startup.c
 ===================================================================
 --- matchbox-panel-2/applets/startup/startup.c	(revision 2109)
-- 
1.7.1



