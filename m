Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHtTc-0002r5-ML
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 10:00:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 May 2011 00:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,318,1301900400"; d="scan'208";a="430915688"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by azsmga001.ch.intel.com with ESMTP; 05 May 2011 00:57:18 -0700
Message-Id: <77e325cffe5b358f8c4deb25c939c2a5100e7b90.1304581770.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
Old-Date: Wed, 4 May 2011 16:38:57 -0700
Date: Thu, 05 May 2011  0:57:18 -0700
To: openembedded-core@lists.openembedded.org,bruce.ashfield@windriver.com
From: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: [PATCH 14/26] clutter-gst-1.4: Rebase patches and update checksum
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
X-List-Received-Date: Thu, 05 May 2011 08:00:00 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../clutter/clutter-gst-1.4/enable_tests.patch     |   15 +++++++++++++++
 .../clutter/clutter-gst-1.4_git.bb                 |    4 ++--
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch

diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch b/meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch
new file mode 100644
index 0000000..f1f68ac
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch
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
diff --git a/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb b/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
index 94d6885..1ab867d 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
+++ b/meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
@@ -4,12 +4,12 @@ SRCREV = "8a087fabc888a6a4a939760c392109dbb610adbf"
 PV = "1.3.4+git${SRCPV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=95baacba194e814c110ea3bdf25ddbf4"
+                    file://clutter-gst/clutter-gst.h;beginline=1;endline=24;md5=3275ae5179d58dccf8852cdad3a44574"
 
 DEPENDS += "clutter-1.4"
 
 SRC_URI = "git://git.clutter-project.org/clutter-gst.git;protocol=git;branch=master \
-           file://enable_tests.patch"
+           file://enable_tests-1.4.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.1.1



