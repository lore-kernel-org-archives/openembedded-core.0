Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTga-0000Oi-Vr
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2011 04:01:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="737600"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 12 May 2011 04:01:15 -0700
Message-Id: <a91c1cbf52f3ac4846770729a4a6097f755b80b4.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 10:00:30 +0800
Date: Thu, 12 May 2011 19:01:13 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 21/54] apr: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:05 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-support/apr/apr/buildconf_fix.patch   |    2 ++
 meta/recipes-support/apr/apr/cleanup.patch         |    2 ++
 meta/recipes-support/apr/apr/configfix.patch       |    2 ++
 meta/recipes-support/apr/apr/configure_fixes.patch |    2 ++
 4 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/apr/apr/buildconf_fix.patch b/meta/recipes-support/apr/apr/buildconf_fix.patch
index 641340b..2c9d62e 100644
--- a/meta/recipes-support/apr/apr/buildconf_fix.patch
+++ b/meta/recipes-support/apr/apr/buildconf_fix.patch
@@ -4,6 +4,8 @@ so fall back to old detection.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-1.4.2/buildconf
 ===================================================================
 --- apr-1.4.2.orig/buildconf	2009-11-13 06:19:49.000000000 +0800
diff --git a/meta/recipes-support/apr/apr/cleanup.patch b/meta/recipes-support/apr/apr/cleanup.patch
index 47f1c42..b6784e0 100644
--- a/meta/recipes-support/apr/apr/cleanup.patch
+++ b/meta/recipes-support/apr/apr/cleanup.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-1.4.2/build/buildcheck.sh
 ===================================================================
 --- apr-1.4.2.orig/build/buildcheck.sh	2009-11-13 08:27:16.000000000 +0800
diff --git a/meta/recipes-support/apr/apr/configfix.patch b/meta/recipes-support/apr/apr/configfix.patch
index 995555e..605c4f6 100644
--- a/meta/recipes-support/apr/apr/configfix.patch
+++ b/meta/recipes-support/apr/apr/configfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-1.3.3/apr-config.in
 ===================================================================
 --- apr-1.3.3.orig/apr-config.in	2009-01-12 15:16:31.000000000 +0000
diff --git a/meta/recipes-support/apr/apr/configure_fixes.patch b/meta/recipes-support/apr/apr/configure_fixes.patch
index 86ceb8c..0514000 100644
--- a/meta/recipes-support/apr/apr/configure_fixes.patch
+++ b/meta/recipes-support/apr/apr/configure_fixes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: apr-1.3.3/configure.in
 ===================================================================
 --- apr-1.3.3.orig/configure.in
-- 
1.7.1



