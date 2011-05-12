Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKThF-0000vo-BF
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2011 04:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; 
   d="scan'208";a="1286080"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2011 04:01:56 -0700
Message-Id: <9adc314733ab9a4929dca614a589f6d1ec2fda97.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 16:28:40 +0800
Date: Thu, 12 May 2011 19:01:53 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 52/54] clutter-gst: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:46 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../clutter/clutter-gst/autofoo-0.4.patch          |    2 ++
 ...-9db4a61a25677764bb927369c5c68ada958fb65c.patch |    2 ++
 .../clutter/clutter-gst/autofoo.patch              |    2 ++
 .../clutter/clutter-gst/enable_tests-1.4.patch     |    3 +++
 .../clutter/clutter-gst/enable_tests.patch         |    3 +++
 5 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
index 54df63d..875d3c0 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
@@ -3,6 +3,8 @@
  examples/Makefile.am      |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: clutter-gst/examples/Makefile.am
 ===================================================================
 --- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
index 569b0d8..380fcb3 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
@@ -3,6 +3,8 @@
  examples/Makefile.am      |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: clutter-gst/examples/Makefile.am
 ===================================================================
 --- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
index ad77d63..7f3682b 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
@@ -3,6 +3,8 @@
  examples/Makefile.am      |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/examples/Makefile.am
 ===================================================================
 --- git.orig/examples/Makefile.am	2009-06-30 16:41:53.000000000 +0100
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
index f1f68ac..3fc1378 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
@@ -1,6 +1,9 @@
 Install example binary needed for core-image-clutter
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/examples/Makefile.am
 ===================================================================
 --- git.orig/examples/Makefile.am	2011-05-04 14:07:21.000000000 -0700
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch
index e9dc8a2..6175a52 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/enable_tests.patch
@@ -1,6 +1,9 @@
 Install example binary needed for core-image-clutter
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/examples/Makefile.am
 ===================================================================
 --- git.orig/examples/Makefile.am	2011-01-31 10:14:23.000000000 +0800
-- 
1.7.1



