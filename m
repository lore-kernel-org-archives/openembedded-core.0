Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QK2CV-0006Si-9C
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 07:43:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 May 2011 22:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="434092094"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2011 22:40:20 -0700
Message-Id: <c6f9857df1a8971ad71df4ac2a8fd8b2828e0ac5.1305092349.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305092348.git.nitin.a.kamble@intel.com>
References: <cover.1305092348.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 22:12:57 -0700
Date: Tue, 10 May 2011 22:40:20 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 2/5] matchbox-wm-2: fix typo in Makefile
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
X-List-Received-Date: Wed, 11 May 2011 05:43:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../matchbox-wm-2/matchbox-wm-2/fix_makefile.patch |   19 +++++++++++++++++++
 .../matchbox-wm-2/matchbox-wm-2_svn.bb             |    3 ++-
 2 files changed, 21 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch

diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
new file mode 100644
index 0000000..8c40e85
--- /dev/null
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2/fix_makefile.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Pending
+
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
+Fix following build error:
+| Makefile:734: *** missing separator (did you mean TAB instead of 8 spaces?).  Stop.
+| ERROR: oe_runmake failed
+
+Index: matchbox-window-manager-2/Makefile.am
+===================================================================
+--- matchbox-window-manager-2.orig/Makefile.am
++++ matchbox-window-manager-2/Makefile.am
+@@ -3,6 +3,6 @@ SUBDIRS = matchbox data doc util
+ # Extra clean files so that maintainer-clean removes *everything*
+ 
+ snapshot:
+-        $(MAKE) dist distdir=$(PACKAGE)-snapshot-`date +"%Y%m%d"`
++	$(MAKE) dist distdir=$(PACKAGE)-snapshot-`date +"%Y%m%d"`
+ 
+ MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb
index 3332891..0b5e3f1 100644
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_svn.bb
@@ -7,9 +7,10 @@ DEPENDS = "virtual/libx11 libxext libxrender startup-notification expat gconf pa
 
 SRCREV = "2106"
 PV = "0.0+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "svn://svn.o-hand.com/repos/matchbox/trunk;module=matchbox-window-manager-2;proto=http \
+	file://fix_makefile.patch \
 	  "
 
 S = "${WORKDIR}/matchbox-window-manager-2"
-- 
1.7.3.4



