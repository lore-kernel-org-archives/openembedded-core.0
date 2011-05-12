Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgz-0000h0-4V
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 04:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="641704512"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2011 04:01:40 -0700
Message-Id: <96ea33e795d0aae2066c83a9be4c3dfb6d15d854.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:29:41 +0800
Date: Thu, 12 May 2011 19:01:37 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 40/54] apr-util: Add Upstream-Status
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

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-support/apr/apr-util/configfix.patch  |    2 +
 .../apr/apr-util/configure_fixes.patch             |    2 +
 .../apr/apr-util/configure_fixes.patch.old         |   25 --------------------
 3 files changed, 4 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr-util/configure_fixes.patch.old

diff --git a/meta/recipes-support/apr/apr-util/configfix.patch b/meta/recipes-support/apr/apr-util/configfix.patch
index a8953e5..dbb1148 100644
--- a/meta/recipes-support/apr/apr-util/configfix.patch
+++ b/meta/recipes-support/apr/apr-util/configfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-util-1.3.4/apu-config.in
 ===================================================================
 --- apr-util-1.3.4.orig/apu-config.in	2009-01-12 17:08:06.000000000 +0000
diff --git a/meta/recipes-support/apr/apr-util/configure_fixes.patch b/meta/recipes-support/apr/apr-util/configure_fixes.patch
index 0b2a090..1925236 100644
--- a/meta/recipes-support/apr/apr-util/configure_fixes.patch
+++ b/meta/recipes-support/apr/apr-util/configure_fixes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-util-1.3.4/configure.in
 ===================================================================
 --- apr-util-1.3.4.orig/configure.in
diff --git a/meta/recipes-support/apr/apr-util/configure_fixes.patch.old b/meta/recipes-support/apr/apr-util/configure_fixes.patch.old
deleted file mode 100644
index 16f88b3..0000000
--- a/meta/recipes-support/apr/apr-util/configure_fixes.patch.old
+++ /dev/null
@@ -1,25 +0,0 @@
-Index: apr-util-1.2.12/configure.in
-===================================================================
---- apr-util-1.2.12.orig/configure.in	2008-03-08 19:15:00.000000000 +0000
-+++ apr-util-1.2.12/configure.in	2008-03-08 19:15:13.000000000 +0000
-@@ -8,13 +8,13 @@
- AC_CONFIG_HEADER(include/private/apu_config.h)
- AC_CONFIG_AUX_DIR(build)
- 
--sinclude(build/apu-conf.m4)
--sinclude(build/apu-iconv.m4)
--sinclude(build/apu-hints.m4)
--sinclude(build/apr_common.m4)
--sinclude(build/find_apr.m4)
--sinclude(build/dbm.m4)
--sinclude(build/dbd.m4)
-+#sinclude(build/apu-conf.m4)
-+#sinclude(build/apu-iconv.m4)
-+#sinclude(build/apu-hints.m4)
-+#sinclude(build/apr_common.m4)
-+#sinclude(build/find_apr.m4)
-+#sinclude(build/dbm.m4)
-+#sinclude(build/dbd.m4)
- 
- dnl Generate ./config.nice for reproducing runs of configure
- dnl 
-- 
1.7.1



