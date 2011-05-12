Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTh7-0000ic-9H
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 04:01:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="746178507"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 04:01:51 -0700
Message-Id: <286113e2e6536798d950c2f4dc1c3936e6f5ddc3.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:46:37 +0800
Date: Thu, 12 May 2011 19:01:48 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 48/54] clipboard-manager: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:38 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../clipboard-manager/files/daemonize.patch        |    2 ++
 .../clipboard-manager/files/makefile.patch         |    2 ++
 .../clipboard-manager/files/script.patch           |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch b/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch
index 51ce478..24c11a9 100644
--- a/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch
+++ b/meta-demoapps/recipes-sato/clipboard-manager/files/daemonize.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature]
+
 Index: 0.6.4/manager.c
 ===================================================================
 --- 0.6.4.orig/manager.c	2007-06-28 12:23:37.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch b/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch
index 6e48da0..17cd742 100644
--- a/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch
+++ b/meta-demoapps/recipes-sato/clipboard-manager/files/makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: 0.6.4/Makefile.am
 ===================================================================
 --- 0.6.4.orig/Makefile.am	2007-06-28 12:23:37.000000000 +0100
diff --git a/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch b/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch
index 09e6862..bdab05a 100644
--- a/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch
+++ b/meta-demoapps/recipes-sato/clipboard-manager/files/script.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [disable feature]
+
 Index: 0.6.4/clipboard.sh
 ===================================================================
 --- 0.6.4.orig/clipboard.sh	2007-06-28 12:23:37.000000000 +0100
-- 
1.7.1



