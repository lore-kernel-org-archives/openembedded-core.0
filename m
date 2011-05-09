Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUC-0003hN-Bm
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 May 2011 23:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="432782635"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by azsmga001.ch.intel.com with ESMTP; 08 May 2011 23:59:46 -0700
Message-Id: <5e887d4088056a6f65f2f3bef7ccb179177498fd.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 10:49:33 -0700
Date: Sun, 08 May 2011 23:59:46 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 02/20] clutter-gst-1.4: Add missing patch
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
X-List-Received-Date: Mon, 09 May 2011 07:02:32 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../clutter/clutter-gst/enable_tests-1.4.patch     |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch

diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
new file mode 100644
index 0000000..f1f68ac
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.4.patch
@@ -0,0 +1,15 @@
+Install example binary needed for core-image-clutter
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+Index: git/examples/Makefile.am
+===================================================================
+--- git.orig/examples/Makefile.am	2011-05-04 14:07:21.000000000 -0700
++++ git/examples/Makefile.am	2011-05-04 14:24:38.625984314 -0700
+@@ -1,6 +1,6 @@
+ NULL = #
+ 
+-noinst_PROGRAMS = video-player video-sink audio-player
++bin_PROGRAMS = video-player video-sink audio-player
+ 
+ INCLUDES = -I$(top_srcdir) \
+ 	   $(MAINTAINER_CFLAGS) \
-- 
1.7.1.1



