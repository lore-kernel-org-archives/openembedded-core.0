Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJuKd-0003Km-Rq
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 23:19:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 14:16:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,347,1301900400"; d="scan'208";a="745285961"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2011 14:16:14 -0700
Message-Id: <73259229fd79a30a4b33e3c509869ba2f34d940d.1305062028.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305062026.git.nitin.a.kamble@intel.com>
References: <cover.1305062026.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 13:15:44 -0700
Date: Tue, 10 May 2011 14:16:14 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 13/16] patch-2.5.9: fix upstream-status format
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
X-List-Received-Date: Tue, 10 May 2011 21:19:04 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/patch/patch/debian.patch     |    2 +-
 .../patch/patch/global-reject-file.diff            |    2 +-
 meta/recipes-devtools/patch/patch/install.patch    |    2 +-
 .../patch/patch/unified-reject-files.diff          |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/patch/patch/debian.patch b/meta/recipes-devtools/patch/patch/debian.patch
index e0106dc..1a07646 100644
--- a/meta/recipes-devtools/patch/patch/debian.patch
+++ b/meta/recipes-devtools/patch/patch/debian.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [debian patch]"
+Upstream-Status: Inappropriate [debian patch]
 
 --- patch-2.5.9.orig/m4/hash.m4
 +++ patch-2.5.9/m4/hash.m4
diff --git a/meta/recipes-devtools/patch/patch/global-reject-file.diff b/meta/recipes-devtools/patch/patch/global-reject-file.diff
index d837896..bb7ca79 100644
--- a/meta/recipes-devtools/patch/patch/global-reject-file.diff
+++ b/meta/recipes-devtools/patch/patch/global-reject-file.diff
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [debian patch]"
+Upstream-Status: Inappropriate [debian patch]
 
 Index: patch-2.5.9/patch.man
 ===================================================================
diff --git a/meta/recipes-devtools/patch/patch/install.patch b/meta/recipes-devtools/patch/patch/install.patch
index 0359ccd..0354ec8 100644
--- a/meta/recipes-devtools/patch/patch/install.patch
+++ b/meta/recipes-devtools/patch/patch/install.patch
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [embedded specific]"
+Upstream-Status: Inappropriate [embedded specific]
 
 Index: patch-2.5.4/Makefile.in
 ===================================================================
diff --git a/meta/recipes-devtools/patch/patch/unified-reject-files.diff b/meta/recipes-devtools/patch/patch/unified-reject-files.diff
index 1608b5e..4b59212 100644
--- a/meta/recipes-devtools/patch/patch/unified-reject-files.diff
+++ b/meta/recipes-devtools/patch/patch/unified-reject-files.diff
@@ -1,4 +1,4 @@
-Upstream-Status="Inappropriate [debian patch]"
+Upstream-Status: Inappropriate [debian patch]
 
 Generate unified diff style reject files. Also include the C function names
 in reject files whenever possible.
-- 
1.7.3.4



