Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgE-0000Fk-FJ
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:03:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 04:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="746178073"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 04:00:53 -0700
Message-Id: <4f7c0eb123bfffd56a02dfb6a57b4718ddbfc145.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 08:49:36 +0800
Date: Thu, 12 May 2011 19:00:50 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 04/54] libmatchbox: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:03:42 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../libmatchbox/files/16bppfixes-2.patch           |    2 ++
 .../libmatchbox/files/16bppfixes.patch             |    2 ++
 .../libmatchbox/files/autofoo.patch                |    2 ++
 .../libmatchbox/files/configure_fixes.patch        |    2 ++
 .../libmatchbox/files/fix-configure-for-1.9.patch  |    2 ++
 .../libmatchbox/files/matchbox-start-fix.patch     |    2 ++
 6 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch b/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch
index ab9cdc7..9bcd582 100644
--- a/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch
+++ b/meta/recipes-graphics/libmatchbox/files/16bppfixes-2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- libmatchbox/libmb/mbpixbuf.c.orig	2007-05-04 14:41:55.000000000 +0100
 +++ libmatchbox/libmb/mbpixbuf.c	2007-05-04 14:41:55.000000000 +0100
 @@ -710,46 +710,19 @@
diff --git a/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch b/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
index 09a0347..284318c 100644
--- a/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
+++ b/meta/recipes-graphics/libmatchbox/files/16bppfixes.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: libmb/mbpixbuf.c
 ===================================================================
 --- libmatchbox/libmb.orig/mbpixbuf.c	2006-02-01 12:45:55.000000000 +0000
diff --git a/meta/recipes-graphics/libmatchbox/files/autofoo.patch b/meta/recipes-graphics/libmatchbox/files/autofoo.patch
index ad3be57..78849a4 100644
--- a/meta/recipes-graphics/libmatchbox/files/autofoo.patch
+++ b/meta/recipes-graphics/libmatchbox/files/autofoo.patch
@@ -3,6 +3,8 @@
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
 #
 
+Upstream-Status: Inappropriate [configuration]
+
 --- libmatchbox-1.5/configure.ac~autofoo	2004-12-21 12:56:46.000000000 -0500
 +++ libmatchbox-1.5/configure.ac	2005-01-18 16:40:04.421179624 -0500
 @@ -1,10 +1,10 @@
diff --git a/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch b/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch
index 083d32a..30fd67b 100644
--- a/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch
+++ b/meta/recipes-graphics/libmatchbox/files/configure_fixes.patch
@@ -3,6 +3,8 @@
  libmb.pc.in  |    2 +-
  2 files changed, 8 insertions(+), 9 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: libmatchbox-1.9/configure.ac
 ===================================================================
 --- libmatchbox-1.9.orig/configure.ac	2007-11-11 22:26:43.000000000 +0000
diff --git a/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch b/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch
index 990b738..2f147eb 100644
--- a/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch
+++ b/meta/recipes-graphics/libmatchbox/files/fix-configure-for-1.9.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -urNd ../libmatchbox-1.6-r1/libmatchbox-1.6/configure.ac libmatchbox-1.6/configure.ac
 --- ../libmatchbox-1.6-r1/libmatchbox-1.6/configure.ac	2005-01-11 21:47:39 +00:00
 +++ libmatchbox-1.6/configure.ac	2005-03-14 03:06:25 +00:00
diff --git a/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch b/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
index 04460a3..058342c 100644
--- a/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
+++ b/meta/recipes-graphics/libmatchbox/files/matchbox-start-fix.patch
@@ -6,6 +6,8 @@ on x86-64. This patch forces a NULL pointer as terminator to fix it.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Pending
+
 Index: libmatchbox-1.9/libmb/mbexp.c
 ===================================================================
 --- libmatchbox-1.9.orig/libmb/mbexp.c	2010-08-28 06:33:25.000000000 +0800
-- 
1.7.1



