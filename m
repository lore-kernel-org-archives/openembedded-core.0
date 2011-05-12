Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgz-0000gx-16
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 04:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="746178415"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 04:01:39 -0700
Message-Id: <9d3ea411db564353914c84e495a870566967e28e.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:26:44 +0800
Date: Thu, 12 May 2011 19:01:36 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 39/54] webkit: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:33 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Also removed empty fix_im.patch

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-sato/webkit/files/nodolt.patch |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/files/fix_im.patch

diff --git a/meta/recipes-sato/webkit/files/fix_im.patch b/meta/recipes-sato/webkit/files/fix_im.patch
deleted file mode 100644
index e69de29..0000000
diff --git a/meta/recipes-sato/webkit/files/nodolt.patch b/meta/recipes-sato/webkit/files/nodolt.patch
index 5331367..e713e8b 100644
--- a/meta/recipes-sato/webkit/files/nodolt.patch
+++ b/meta/recipes-sato/webkit/files/nodolt.patch
@@ -1,6 +1,9 @@
 Dolt cause build error on some platform, so disable it.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: webkit-gtk-1.3.7+svnr72836-r72836-r0/configure.ac
 ===================================================================
 --- webkit-gtk-1.3.7+svnr72836-r72836-r0.orig/configure.ac	2011-01-21 11:11:07.000000000 +0800
-- 
1.7.1



