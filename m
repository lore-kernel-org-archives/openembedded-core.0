Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QK2CV-0006Sb-0B
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 07:43:11 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2011 22:40:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; 
   d="scan'208";a="141249"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2011 22:40:20 -0700
Message-Id: <21b6e87e2085c927823b023335cf04dfab482e70.1305092349.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305092348.git.nitin.a.kamble@intel.com>
References: <cover.1305092348.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 22:19:02 -0700
Date: Tue, 10 May 2011 22:40:20 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 3/5] web: fix typo in Makefile
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
 meta/recipes-sato/web/web/fix_makefile.patch |   20 ++++++++++++++++++++
 meta/recipes-sato/web/web_git.bb             |    3 ++-
 2 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-sato/web/web/fix_makefile.patch

diff --git a/meta/recipes-sato/web/web/fix_makefile.patch b/meta/recipes-sato/web/web/fix_makefile.patch
new file mode 100644
index 0000000..3dd3b15
--- /dev/null
+++ b/meta/recipes-sato/web/web/fix_makefile.patch
@@ -0,0 +1,20 @@
+Upstream-Status: Pending
+
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
+Fix following build error:
+
+| NOTE: make -j 16
+| Makefile:719: *** missing separator (did you mean TAB instead of 8 spaces?).  Stop.
+| ERROR: oe_runmake failed
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -5,5 +5,5 @@ SUBDIRS = src data
+ MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
+ 
+ snapshot:
+-        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
++	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
+ 
diff --git a/meta/recipes-sato/web/web_git.bb b/meta/recipes-sato/web/web_git.bb
index 612a02d..8868bc6 100644
--- a/meta/recipes-sato/web/web_git.bb
+++ b/meta/recipes-sato/web/web_git.bb
@@ -2,13 +2,14 @@ LICENSE = "GPLv2"
 SECTION = "x11"
 DEPENDS = "libxml2 glib-2.0 gtk+ libglade gtkhtml2 curl gconf js libowl"
 DESCRIPTION = "Web is a multi-platform web browsing application."
-PR = "r0"
+PR = "r1"
 
 SRCREV = "96da839f65e17ecc6d5261c1d74accd88423dd7a"
 PV = "0.0+git${SRCPV}"
 
 SRC_URI = 	"git://git.yoctoproject.org/web-sato;protocol=git \
 		file://owl-window-menu.patch \
+		file://fix_makefile.patch \
 		"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-- 
1.7.3.4



