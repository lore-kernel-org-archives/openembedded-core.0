Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKTgk-0000a4-TY
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2011 04:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="746178333"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 04:01:26 -0700
Message-Id: <568aaf169c74007fdd2976d7b970f94327615266.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 13:08:11 +0800
Date: Thu, 12 May 2011 19:01:23 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 29/54] clutter: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:17 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../clutter/clutter/build-fix.patch                |    2 ++
 .../clutter/clutter/enable_tests-0.6.patch         |    2 ++
 .../clutter/clutter/enable_tests-0.8.patch         |    2 ++
 .../clutter/clutter/enable_tests-1.0.patch         |    2 ++
 .../clutter/clutter/enable_tests-1.4.patch         |    2 ++
 ...-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch |    2 ++
 .../clutter/clutter/enable_tests.patch             |    2 ++
 .../clutter/clutter/symconflict.patch              |    2 ++
 .../clutter/clutter/test-conformance-fix.patch     |    2 ++
 9 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter/build-fix.patch b/meta/recipes-graphics/clutter/clutter/build-fix.patch
index 68cf84e..08c1845 100644
--- a/meta/recipes-graphics/clutter/clutter/build-fix.patch
+++ b/meta/recipes-graphics/clutter/clutter/build-fix.patch
@@ -2,6 +2,8 @@ Installing the same file twice causes an error in Automake 1.11
 
 JL 19/03/10
 
+Upstream-Status: Pending
+
 Index: git/clutter/Makefile.am
 ===================================================================
 --- git.orig/clutter/Makefile.am	2010-03-19 11:37:51.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch
index 544a7e5..8cff0c5 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-0.6.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: clutter-0-6/tests/Makefile.am
 ===================================================================
 --- clutter.orig/tests/Makefile.am	2007-11-06 12:29:17.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch
index 4f449b1..d3c196f 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-0.8.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: clutter/tests/Makefile.am
 ===================================================================
 --- clutter.orig/tests/Makefile.am	2008-06-26 16:46:26.000000000 +0100
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch
index 953edf6..16460b1 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-1.0.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/tests/interactive/Makefile.am
 ===================================================================
 --- git.orig/tests/interactive/Makefile.am	2009-03-12 11:01:36.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch
index 52fdcb4..2ff7697 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-1.4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/tests/interactive/Makefile.am
 ===================================================================
 --- git.orig/tests/interactive/Makefile.am	2011-01-28 14:06:29.000000000 +0800
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch b/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch
index 953edf6..16460b1 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests-654c26a1301c9bc5f8e3e5e3b68af5eb1b2e0673.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/tests/interactive/Makefile.am
 ===================================================================
 --- git.orig/tests/interactive/Makefile.am	2009-03-12 11:01:36.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/enable_tests.patch b/meta/recipes-graphics/clutter/clutter/enable_tests.patch
index f4af7c9..480b208 100644
--- a/meta/recipes-graphics/clutter/clutter/enable_tests.patch
+++ b/meta/recipes-graphics/clutter/clutter/enable_tests.patch
@@ -4,6 +4,8 @@
  tests/test-text.c   |    2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/tests/interactive/Makefile.am
 ===================================================================
 --- git.orig/tests/interactive/Makefile.am	2009-11-30 17:39:46.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter/symconflict.patch b/meta/recipes-graphics/clutter/clutter/symconflict.patch
index 7685c21..05f3d27 100644
--- a/meta/recipes-graphics/clutter/clutter/symconflict.patch
+++ b/meta/recipes-graphics/clutter/clutter/symconflict.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/tests/test-depth.c
 ===================================================================
 --- git.orig/tests/test-depth.c	2009-05-24 14:54:40.000000000 +0100
diff --git a/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch b/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch
index ce412ff..ccc6c2a 100644
--- a/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch
+++ b/meta/recipes-graphics/clutter/clutter/test-conformance-fix.patch
@@ -30,6 +30,8 @@ Date:   Mon Oct 11 16:16:45 2010 +0100
     
     http://bugzilla.clutter-project.org/show_bug.cgi?id=2363
 
+Upstream-Status: Backport
+
 diff --git a/tests/conform/Makefile.am b/tests/conform/Makefile.am
 index 3036639..1e723e7 100644
 --- a/tests/conform/Makefile.am
-- 
1.7.1



