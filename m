Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgU-0000Oi-Bb
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:00 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 04:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="737572"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 04:01:09 -0700
Message-Id: <c33e2911d9a6f5f41d8ff6b68e18f81d56a911bc.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 09:49:37 +0800
Date: Thu, 12 May 2011 19:01:06 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 16/54] tslib: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:01 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../tslib/tslib/32bitBE-support.patch              |    3 +++
 .../recipes-graphics/tslib/tslib/fix_version.patch |    2 ++
 meta/recipes-graphics/tslib/tslib/multievent.patch |    2 ++
 3 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/tslib/tslib/32bitBE-support.patch b/meta/recipes-graphics/tslib/tslib/32bitBE-support.patch
index 3262f16..49232ef 100644
--- a/meta/recipes-graphics/tslib/tslib/32bitBE-support.patch
+++ b/meta/recipes-graphics/tslib/tslib/32bitBE-support.patch
@@ -5,6 +5,9 @@
 ## DP: See bug #496759 - being tested upstream for 32bit BE devices
 
 @DPATCH@
+
+Upstream-Status: Pending
+
 diff -urNad tslib-1.0~/plugins/input-raw.c tslib-1.0/plugins/input-raw.c
 --- tslib-1.0~/plugins/input-raw.c	2008-12-09 10:56:47.000000000 +0000
 +++ tslib-1.0/plugins/input-raw.c	2008-12-09 11:05:41.000000000 +0000
diff --git a/meta/recipes-graphics/tslib/tslib/fix_version.patch b/meta/recipes-graphics/tslib/tslib/fix_version.patch
index d6a0ebd..c3d658e 100644
--- a/meta/recipes-graphics/tslib/tslib/fix_version.patch
+++ b/meta/recipes-graphics/tslib/tslib/fix_version.patch
@@ -2,6 +2,8 @@
  configure.ac |   10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: tslib-1.0/configure.ac
 ===================================================================
 --- tslib-1.0.orig/configure.ac	2006-08-24 22:02:55.000000000 +0100
diff --git a/meta/recipes-graphics/tslib/tslib/multievent.patch b/meta/recipes-graphics/tslib/tslib/multievent.patch
index 854e7af..e6803f5 100644
--- a/meta/recipes-graphics/tslib/tslib/multievent.patch
+++ b/meta/recipes-graphics/tslib/tslib/multievent.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- tslib/plugins/linear.c~multievent
 +++ tslib/plugins/linear.c
 @@ -39,14 +39,12 @@
-- 
1.7.1



