Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWO1-0005Br-9s
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2011 23:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="632967543"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 23:29:12 -0700
Message-Id: <10dc656eb1ef3e0d36424c440e6ec42cccb08a47.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Thu, 14 Apr 2011 15:41:30 +0800
Date: Fri, 22 Apr 2011 23:29:12 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 19/37] puzzles: Upgrade to svn r9151 (from r9084)
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:09 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../puzzles/files/oh-puzzles-owl-menu.patch        |    5 +++++
 .../puzzles/{puzzles_r9084.bb => puzzles_r9151.bb} |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)
 rename meta/recipes-sato/puzzles/{puzzles_r9084.bb => puzzles_r9151.bb} (94%)

diff --git a/meta/recipes-sato/puzzles/files/oh-puzzles-owl-menu.patch b/meta/recipes-sato/puzzles/files/oh-puzzles-owl-menu.patch
index 61da919..7e2c3ab 100644
--- a/meta/recipes-sato/puzzles/files/oh-puzzles-owl-menu.patch
+++ b/meta/recipes-sato/puzzles/files/oh-puzzles-owl-menu.patch
@@ -1,3 +1,8 @@
+This patch enable owl menu, which is hidden in the title bar to save space on
+small screen. It has not been used for a long time, rebase needed.
+
+Upstream-Status: Inappropriate [enable feature]
+
 Index: src/gtk.c
 ===================================================================
 --- src/gtk.c	(revision 22)
diff --git a/meta/recipes-sato/puzzles/puzzles_r9084.bb b/meta/recipes-sato/puzzles/puzzles_r9151.bb
similarity index 94%
rename from meta/recipes-sato/puzzles/puzzles_r9084.bb
rename to meta/recipes-sato/puzzles/puzzles_r9151.bb
index fbd0e37..5cd8bb9 100644
--- a/meta/recipes-sato/puzzles/puzzles_r9084.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r9151.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=9928b60f3b78be315b7ab699c1b03ff5"
 
 SRC_URI = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-${PV}.tar.gz"
 
-# Checksums seem to be changing regularly right now, need to verify with upstream
+# Upstream updates puzzles.tar.gz for the new release, so checksums seem to be changing regularly right now
 #SRC_URI[md5sum] = "e8b4c7e2341264789f3cd6733857bf1c"
 #SRC_URI[sha256sum] = "69f37e497e63b2f7ab44e7bbd50aee078269c16dbc2d78ec1b00257678f2cbd2"
 #SRC_URI = "svn://ixion.tartarus.org/main;module=puzzles;rev=${MOD_PV}"
-- 
1.7.1.1



