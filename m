Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUF-0003hP-Ae
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 May 2011 23:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="690004837"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by fmsmga002.fm.intel.com with ESMTP; 08 May 2011 23:59:48 -0700
Message-Id: <66599b6cc6272f25840807b4e1164f4fe5af75ee.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 15:52:51 -0700
Date: Sun, 08 May 2011 23:59:48 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 06/20] patch: update upstream status for patches
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
X-List-Received-Date: Mon, 09 May 2011 07:02:35 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/patch/patch/debian.patch     |    2 ++
 .../patch/patch/global-reject-file.diff            |    2 ++
 meta/recipes-devtools/patch/patch/install.patch    |    2 ++
 .../patch/patch/unified-reject-files.diff          |    2 ++
 4 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/patch/patch/debian.patch b/meta/recipes-devtools/patch/patch/debian.patch
index 4601858..e0106dc 100644
--- a/meta/recipes-devtools/patch/patch/debian.patch
+++ b/meta/recipes-devtools/patch/patch/debian.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [debian patch]"
+
 --- patch-2.5.9.orig/m4/hash.m4
 +++ patch-2.5.9/m4/hash.m4
 @@ -0,0 +1,15 @@
diff --git a/meta/recipes-devtools/patch/patch/global-reject-file.diff b/meta/recipes-devtools/patch/patch/global-reject-file.diff
index 66065fc..d837896 100644
--- a/meta/recipes-devtools/patch/patch/global-reject-file.diff
+++ b/meta/recipes-devtools/patch/patch/global-reject-file.diff
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [debian patch]"
+
 Index: patch-2.5.9/patch.man
 ===================================================================
 --- patch-2.5.9.orig/patch.man
diff --git a/meta/recipes-devtools/patch/patch/install.patch b/meta/recipes-devtools/patch/patch/install.patch
index c959189..0359ccd 100644
--- a/meta/recipes-devtools/patch/patch/install.patch
+++ b/meta/recipes-devtools/patch/patch/install.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [embedded specific]"
+
 Index: patch-2.5.4/Makefile.in
 ===================================================================
 --- patch-2.5.4.orig/Makefile.in	2005-03-09 07:23:54.779311824 -0500
diff --git a/meta/recipes-devtools/patch/patch/unified-reject-files.diff b/meta/recipes-devtools/patch/patch/unified-reject-files.diff
index 6bfa00d..1608b5e 100644
--- a/meta/recipes-devtools/patch/patch/unified-reject-files.diff
+++ b/meta/recipes-devtools/patch/patch/unified-reject-files.diff
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [debian patch]"
+
 Generate unified diff style reject files. Also include the C function names
 in reject files whenever possible.
 
-- 
1.7.1.1



