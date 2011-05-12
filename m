Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgd-0000Tu-81
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 May 2011 04:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860616"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:18 -0700
Message-Id: <b69a04c8737067cea14f5232f5c947d6f2350079.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 10:05:09 +0800
Date: Thu, 12 May 2011 19:01:15 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 23/54] pcmanfm: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:08 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../pcmanfm/files/cross-compile-fix.patch          |    2 ++
 .../pcmanfm/files/owl-window-menu.patch            |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch b/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch
index 2f654a5..0118081 100644
--- a/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch
+++ b/meta/recipes-sato/pcmanfm/files/cross-compile-fix.patch
@@ -4,6 +4,8 @@ remove it to work aound this issue.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: pcmanfm-0.9.7/data/ui/Makefile.am
 ===================================================================
 --- pcmanfm-0.9.7.orig/data/ui/Makefile.am	2010-07-29 15:10:18.000000000 +0800
diff --git a/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch b/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
index f3d4e61..0826a16 100644
--- a/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
+++ b/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
@@ -3,6 +3,8 @@ enable owl menu
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [enable feature]
+
 Index: pcmanfm-0.9.7/configure.ac
 ===================================================================
 --- pcmanfm-0.9.7.orig/configure.ac	2010-07-27 10:28:12.000000000 +0800
-- 
1.7.1



