Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QLy5E-00085K-OA
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 15:43:41 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2011 06:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,374,1301900400"; d="scan'208";a="436825227"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 06:40:47 -0700
Message-Id: <9bc4ca41e56bca00a7ab7eed20e39f07fc55462e.1305553117.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305553117.git.edwin.zhai@intel.com>
References: <cover.1305553117.git.edwin.zhai@intel.com>
Old-Date: Mon, 16 May 2011 21:12:57 +0800
Date: Mon, 16 May 2011 21:40:36 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 1/1] Upstream-Status: Update patch upstream-status for libfm, eggdbus, screenshot...
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
X-List-Received-Date: Mon, 16 May 2011 13:43:41 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch    |    2 ++
 meta/recipes-core/eggdbus/eggdbus/marshal.patch    |    2 ++
 .../qemu/qemu-git/enable-i386-linux-user.patch     |    2 ++
 meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch |    2 ++
 .../qemu/qemu-git/linker-flags.patch               |    3 +++
 meta/recipes-devtools/qemu/qemu-git/no-strip.patch |    2 ++
 .../qemu/qemu-git/qemu-git-qemugl-host.patch       |    2 ++
 .../qemu/qemu-git/qemu-vmware-vga-depth.patch      |    3 +++
 .../qemu-git/qemugl-allow-glxcontext-release.patch |    2 ++
 .../gtk+/gtk+-2.12.7/filechooser-props.patch       |    2 ++
 .../clutter-box2d/fix-disable-introspection.patch  |    2 ++
 .../screenshot/files/fix_ldadd_order.patch         |    3 +++
 .../libfm/libfm-0.1.14/use_deprecate_func.patch    |    2 ++
 13 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch b/meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
index 0999a85..abd7ff4 100644
--- a/meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
+++ b/meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration] 
+
 Index: eggdbus-0.6/docs/eggdbus/Makefile.am
 ===================================================================
 --- eggdbus-0.6.orig/docs/eggdbus/Makefile.am
diff --git a/meta/recipes-core/eggdbus/eggdbus/marshal.patch b/meta/recipes-core/eggdbus/eggdbus/marshal.patch
index 2b2cb49..a605a34 100644
--- a/meta/recipes-core/eggdbus/eggdbus/marshal.patch
+++ b/meta/recipes-core/eggdbus/eggdbus/marshal.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: eggdbus-0.6/src/eggdbus/Makefile.am
 ===================================================================
 --- eggdbus-0.6.orig/src/eggdbus/Makefile.am
diff --git a/meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch b/meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch
index 3cf0953..76ed3a8 100644
--- a/meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/enable-i386-linux-user.patch
@@ -2,6 +2,8 @@ Enable i386-linux-user
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration] 
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch b/meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch
index 0219cc8..5a65039 100644
--- a/meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/fix-nogl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration] 
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-git/linker-flags.patch b/meta/recipes-devtools/qemu/qemu-git/linker-flags.patch
index 470cf80..4569643 100644
--- a/meta/recipes-devtools/qemu/qemu-git/linker-flags.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/linker-flags.patch
@@ -7,6 +7,9 @@ More information is available on the Fedora Wiki:
 https://fedoraproject.org/wiki/UnderstandingDSOLinkChange
 
 JL - 15/06/10
+
+Upstream-Status: Inappropriate [configuration] 
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-git/no-strip.patch b/meta/recipes-devtools/qemu/qemu-git/no-strip.patch
index cf0d659..098070a 100644
--- a/meta/recipes-devtools/qemu/qemu-git/no-strip.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/no-strip.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration] 
+
 Index: qemu-0.14.0/Makefile
 ===================================================================
 --- qemu-0.14.0.orig/Makefile
diff --git a/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
index 92467a7..bbc9c9e 100644
--- a/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/qemu-git-qemugl-host.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [other] - qemugl patch need huge changes for upstream
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch
index 42ec98f..c4c5424 100644
--- a/meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/qemu-vmware-vga-depth.patch
@@ -1,6 +1,9 @@
 # fix VMware VGA driver depth calculation error, which may cause segmentation fault
 #
 # ktian1, 06/29/2010
+
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/console.h
 ===================================================================
 --- qemu-0.14.0.orig/console.h
diff --git a/meta/recipes-devtools/qemu/qemu-git/qemugl-allow-glxcontext-release.patch b/meta/recipes-devtools/qemu/qemu-git/qemugl-allow-glxcontext-release.patch
index 478b204..837af5b 100644
--- a/meta/recipes-devtools/qemu/qemu-git/qemugl-allow-glxcontext-release.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/qemugl-allow-glxcontext-release.patch
@@ -10,6 +10,8 @@ committer Andrzej Zaborowski <andrew.zaborowski@intel.com> Tue, 16 Jun 2009 22:2
  target-i386/opengl_exec.c |   31 ++++++++++++++++---------------
  1 files changed, 16 insertions(+), 15 deletions(-)
 
+Upstream-Status: Inappropriate [configuration] 
+
 Index: qemu-0.14.0/target-i386/opengl_exec.c
 ===================================================================
 --- qemu-0.14.0.orig/target-i386/opengl_exec.c
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-props.patch b/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-props.patch
index 7d55f3c..53a0894 100644
--- a/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-props.patch
+++ b/meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-props.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [enable feature] 
+
 Index: gtk+-2.12.3/gtk/gtkfilechooser.c
 ===================================================================
 --- gtk+-2.12.3.orig/gtk/gtkfilechooser.c	2007-12-04 16:52:08.000000000 +0000
diff --git a/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch b/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
index cfb50dc..58f2729 100644
--- a/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
+++ b/meta/recipes-graphics/clutter/clutter-box2d/fix-disable-introspection.patch
@@ -6,6 +6,8 @@ introspection is disabled.
 JL 28/03/11
 josh@linux.intel.com
 
+Upstream-Status: Inappropriate [configuration] 
+
 Index: clutter-box2d-0.10.0/clutter-box2d/Makefile.am
 ===================================================================
 --- clutter-box2d-0.10.0.orig/clutter-box2d/Makefile.am
diff --git a/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch b/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch
index 726d590..7d9689e 100644
--- a/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch
+++ b/meta/recipes-sato/screenshot/files/fix_ldadd_order.patch
@@ -1,6 +1,9 @@
 Fix the ordering of LDADD options to fix a compilation failure.
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+Upstream-Status: Inappropriate [configuration] 
+
 diff -urN screenshot.orig//Makefile.am screenshot/Makefile.am
 --- screenshot.orig//Makefile.am	2010-06-29 11:55:00.000000000 -0700
 +++ screenshot/Makefile.am	2011-03-01 11:09:01.215813968 -0800
diff --git a/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch b/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
index fade195..79fc9ce 100644
--- a/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
+++ b/meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -ruN libfm-0.1.14-orig//src/Makefile.am libfm-0.1.14/src/Makefile.am
 --- libfm-0.1.14-orig//src/Makefile.am	2011-04-26 10:01:44.297664993 +0800
 +++ libfm-0.1.14/src/Makefile.am	2011-04-26 10:02:10.637665004 +0800
-- 
1.7.1



