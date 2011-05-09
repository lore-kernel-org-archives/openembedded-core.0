Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUD-0003hO-2V
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2011 23:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="744305260"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2011 23:59:50 -0700
Message-Id: <634649e150af01e303553295d0fbdab48efecae7.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 15:57:14 -0700
Date: Sun, 08 May 2011 23:59:49 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 08/20] subversion: update upstream status for patches
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
X-List-Received-Date: Mon, 09 May 2011 07:02:33 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../subversion/disable-revision-install.patch      |    2 ++
 .../subversion/subversion/libtool2.patch           |    2 ++
 .../subversion/subversion/neon-detection.patch     |    2 ++
 3 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch b/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
index ad716d0..ffe6330 100644
--- a/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
+++ b/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [embedded specific]"
+
 Index: subversion-1.6.15/Makefile.in
 ===================================================================
 --- subversion-1.6.15.orig/Makefile.in	2010-11-17 06:47:23.000000000 -0800
diff --git a/meta/recipes-devtools/subversion/subversion/libtool2.patch b/meta/recipes-devtools/subversion/subversion/libtool2.patch
index 08343b0..12872db 100644
--- a/meta/recipes-devtools/subversion/subversion/libtool2.patch
+++ b/meta/recipes-devtools/subversion/subversion/libtool2.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [embedded specific]"
+
 Index: subversion-1.5.5/configure.ac
 ===================================================================
 --- subversion-1.5.5.orig/configure.ac	2008-08-26 18:27:56.000000000 +0100
diff --git a/meta/recipes-devtools/subversion/subversion/neon-detection.patch b/meta/recipes-devtools/subversion/subversion/neon-detection.patch
index eaf6de0..3d28fb2 100644
--- a/meta/recipes-devtools/subversion/subversion/neon-detection.patch
+++ b/meta/recipes-devtools/subversion/subversion/neon-detection.patch
@@ -1,3 +1,5 @@
+Upstream-Status="Inappropriate [embedded specific]"
+
 Index: subversion-1.6.13/build/ac-macros/neon.m4
 ===================================================================
 --- subversion-1.6.13.orig/build/ac-macros/neon.m4
-- 
1.7.1.1



