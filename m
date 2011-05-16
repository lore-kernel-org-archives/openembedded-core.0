Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5cz-0003S5-Q2
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:47:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 May 2011 14:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; 
   d="scan'208";a="2999789"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2011 14:44:07 -0700
Message-Id: <ee633cec452b6f1c9def4f856755cb1c6b7b31fd.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Mon, 16 May 2011 14:04:12 +0800
Date: Mon, 16 May 2011 14:44:07 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 07/14] Upstream-Status update for several recipes
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
X-List-Received-Date: Mon, 16 May 2011 21:47:03 -0000

From: Yu Ke <ke.yu@intel.com>

 - modutils
 - module-init-tools
 - libacpi
 - keymaps
 - initscripts
 - console-tools
 - mesa-demos
 - xserver-xf86-lite

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-bsp/keymaps/files/GPLv2.patch         |    2 ++
 meta/recipes-bsp/libacpi/files/makefile-fix.patch  |    2 ++
 .../console-tools-0.3.2/codepage.patch             |    1 +
 .../console-tools-0.3.2/compile.patch              |    2 ++
 .../console-tools-0.3.2/configure.patch            |    1 +
 .../console-tools-0.3.2/kbdrate.patch              |    2 ++
 .../console-tools-0.3.2/uclibc-fileno.patch        |    2 ++
 .../initscripts/initscripts-1.0/GPLv2.patch        |    2 ++
 .../mesa-demos/dso_linking_change_build_fix.patch  |    1 +
 .../fix_open_max_preprocessor_error.patch          |    2 ++
 .../module-init-tools/files/disable_man.patch      |    2 ++
 .../files/grab_module_memset.patch                 |    2 ++
 .../files/ignore_arch_directory.patch              |    2 ++
 .../files/modutils_extension.patch                 |    3 +++
 .../files/no-static-binaries.patch                 |    2 ++
 meta/recipes-kernel/modutils/files/PD.patch        |    2 ++
 meta/recipes-kernel/modutils/files/armeb.patch     |    2 ++
 meta/recipes-kernel/modutils/files/configure.patch |    1 +
 meta/recipes-kernel/modutils/files/gcc4.patch      |    2 ++
 meta/recipes-kernel/modutils/files/lex.l.diff      |    2 ++
 .../modutils/files/modutils-notest.patch           |    2 ++
 .../modutils/files/program_prefix.patch            |    2 ++
 .../modutils/modutils-cross/module.h.diff          |    2 ++
 23 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/files/GPLv2.patch b/meta/recipes-bsp/keymaps/files/GPLv2.patch
index 2611f22..1ee8181 100644
--- a/meta/recipes-bsp/keymaps/files/GPLv2.patch
+++ b/meta/recipes-bsp/keymaps/files/GPLv2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 diff --git a/COPYING b/COPYING
 new file mode 100644
 index 0000000..d511905
diff --git a/meta/recipes-bsp/libacpi/files/makefile-fix.patch b/meta/recipes-bsp/libacpi/files/makefile-fix.patch
index 9193929..c34ef34 100644
--- a/meta/recipes-bsp/libacpi/files/makefile-fix.patch
+++ b/meta/recipes-bsp/libacpi/files/makefile-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 ---
  Makefile  |    6 +++---
  config.mk |    3 ++-
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/codepage.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/codepage.patch
index f6bd91e..c287014 100644
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/codepage.patch
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/codepage.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 
 #
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/compile.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/compile.patch
index 29012fe..c93f511 100644
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/compile.patch
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/compile.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- console-tools-0.3.2/kbdtools/showkey.c~compile	1999-08-25 17:20:08.000000000 -0400
 +++ console-tools-0.3.2/kbdtools/showkey.c	2004-05-09 03:03:23.000000000 -0400
 @@ -264,7 +264,6 @@
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch
index f5b7532..60ee8ff 100644
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/configure.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 
 #
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/kbdrate.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/kbdrate.patch
index 47d7ea5..f370be8 100644
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/kbdrate.patch
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/kbdrate.patch
@@ -1,6 +1,8 @@
 Patch from Matthias Goebl <oe@m.goebl.net>
 Added via OE bugtracker: bug #478
 
+Upstream-Status: Pending
+
 --- console-tools-0.3.2/kbdtools/kbd_mode.c.orig
 +++ console-tools-0.3.2/kbdtools/kbd_mode.c
 @@ -29,11 +29,16 @@
diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/uclibc-fileno.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/uclibc-fileno.patch
index c73d8a3..0c95068 100644
--- a/meta/recipes-core/console-tools/console-tools-0.3.2/uclibc-fileno.patch
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/uclibc-fileno.patch
@@ -1,6 +1,8 @@
 Fixing the locale issues isn't enough, console-tools also does a couple of
 other pretty stupid things (like FILE *f; f->_fileno instead of fileno(f)),
 
+Upstream-Status: Pending
+
 --- console-tools-0.3.2/lib/cfont/fontstruct.c.ark	2005-05-22 19:12:38.000000000 +0000
 +++ console-tools-0.3.2/lib/cfont/fontstruct.c	2005-05-22 19:13:23.000000000 +0000
 @@ -50,8 +50,7 @@
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/GPLv2.patch b/meta/recipes-core/initscripts/initscripts-1.0/GPLv2.patch
index 2611f22..1ee8181 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/GPLv2.patch
+++ b/meta/recipes-core/initscripts/initscripts-1.0/GPLv2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 diff --git a/COPYING b/COPYING
 new file mode 100644
 index 0000000..d511905
diff --git a/meta/recipes-graphics/mesa/mesa-demos/dso_linking_change_build_fix.patch b/meta/recipes-graphics/mesa/mesa-demos/dso_linking_change_build_fix.patch
index aa2faf9..9b5e952 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/dso_linking_change_build_fix.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/dso_linking_change_build_fix.patch
@@ -11,6 +11,7 @@ This patch avoids these linking errors:
 Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/02/03
 
+Upstream-Status: Pending
 
 Index: mesa-demos-8.0.1/src/egl/opengl/Makefile.am
 ===================================================================
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch
index 565832e..2f62972 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/fix_open_max_preprocessor_error.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/os/osdep.h
 ===================================================================
 --- git.orig/os/osdep.h	2008-10-07 18:38:21.000000000 +0100
diff --git a/meta/recipes-kernel/module-init-tools/files/disable_man.patch b/meta/recipes-kernel/module-init-tools/files/disable_man.patch
index daf5824..95ad9cf 100644
--- a/meta/recipes-kernel/module-init-tools/files/disable_man.patch
+++ b/meta/recipes-kernel/module-init-tools/files/disable_man.patch
@@ -2,6 +2,8 @@
 #
 # by Kevin Tian <kevin.tian@intel.com>, 2010-07-21
 
+Upstream-Status: Inappropriate [disable feature]
+
 diff --git a/Makefile.am b/Makefile.am
 index 6f83c12..32972a8 100644
 --- a/Makefile.am
diff --git a/meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch b/meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch
index 9550255..31dc0e9 100644
--- a/meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch
+++ b/meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch
@@ -5,6 +5,8 @@
 #
 # Kevin Tian <kevin.tian@intel.com>, 2010-08-06
 
+Upstream-Status: Pending
+
 diff --git a/depmod.c b/depmod.c
 index 647e5e6..46e03e0 100644
 --- a/depmod.c
diff --git a/meta/recipes-kernel/module-init-tools/files/ignore_arch_directory.patch b/meta/recipes-kernel/module-init-tools/files/ignore_arch_directory.patch
index 7b30824..d29957d 100644
--- a/meta/recipes-kernel/module-init-tools/files/ignore_arch_directory.patch
+++ b/meta/recipes-kernel/module-init-tools/files/ignore_arch_directory.patch
@@ -2,6 +2,8 @@
 #
 # comments added by Kevin Tian <kevin.tian@intel.com>, 2010-07-21
 
+Upstream-Status: Pending
+
 diff -ruN module-init-tools-3.12.orig/modprobe.8 module-init-tools-3.12/modprobe.8
 --- module-init-tools-3.12/modprobe.8.orig
 +++ module-init-tools-3.12/modprobe.8
diff --git a/meta/recipes-kernel/module-init-tools/files/modutils_extension.patch b/meta/recipes-kernel/module-init-tools/files/modutils_extension.patch
index 128c953..4a6e0fe 100644
--- a/meta/recipes-kernel/module-init-tools/files/modutils_extension.patch
+++ b/meta/recipes-kernel/module-init-tools/files/modutils_extension.patch
@@ -1,6 +1,9 @@
 # poky uses new name to differentiate from modutils, so reflect this new name in source
 #
 # comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-21
+
+Upstream-Status: Inappropriate [embedded specific]
+
 --- module-init-tools-3.0-pre10.orig/generate-modprobe.conf
 +++ module-init-tools-3.0-pre10/generate-modprobe.conf
 @@ -45,12 +45,12 @@
diff --git a/meta/recipes-kernel/module-init-tools/files/no-static-binaries.patch b/meta/recipes-kernel/module-init-tools/files/no-static-binaries.patch
index ca83ec0..33fb6e0 100644
--- a/meta/recipes-kernel/module-init-tools/files/no-static-binaries.patch
+++ b/meta/recipes-kernel/module-init-tools/files/no-static-binaries.patch
@@ -9,6 +9,8 @@
 #
 # by Kevin Tian <kevin.tian@intel.com>, 2010-07-21
 
+Upstream-Status: Pending
+
 Index: module-init-tools-3.2.2/Makefile.am
 ===================================================================
 --- module-init-tools-3.2.2.orig/Makefile.am	2010-05-26 15:43:16.000000000 -0400
diff --git a/meta/recipes-kernel/modutils/files/PD.patch b/meta/recipes-kernel/modutils/files/PD.patch
index 6e7b76a..21ac49c 100644
--- a/meta/recipes-kernel/modutils/files/PD.patch
+++ b/meta/recipes-kernel/modutils/files/PD.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 Index: modutils-initscripts-1.0/LICENSE
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
diff --git a/meta/recipes-kernel/modutils/files/armeb.patch b/meta/recipes-kernel/modutils/files/armeb.patch
index a26a3a2..3198553 100644
--- a/meta/recipes-kernel/modutils/files/armeb.patch
+++ b/meta/recipes-kernel/modutils/files/armeb.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- modutils-2.4.27/include/elf_arm.h.orig	2004-09-21 18:37:00.000000000 -0400
 +++ modutils-2.4.27/include/elf_arm.h	2004-09-21 18:38:18.000000000 -0400
 @@ -1,7 +1,11 @@
diff --git a/meta/recipes-kernel/modutils/files/configure.patch b/meta/recipes-kernel/modutils/files/configure.patch
index cdf5015..63e80d7 100644
--- a/meta/recipes-kernel/modutils/files/configure.patch
+++ b/meta/recipes-kernel/modutils/files/configure.patch
@@ -1,3 +1,4 @@
+Upstream-Status: Pending
 
 #
 # Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
diff --git a/meta/recipes-kernel/modutils/files/gcc4.patch b/meta/recipes-kernel/modutils/files/gcc4.patch
index 53750bc..4507b03 100644
--- a/meta/recipes-kernel/modutils/files/gcc4.patch
+++ b/meta/recipes-kernel/modutils/files/gcc4.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: modutils-2.4.27/depmod/depmod.c
 ===================================================================
 --- modutils-2.4.27.orig/depmod/depmod.c
diff --git a/meta/recipes-kernel/modutils/files/lex.l.diff b/meta/recipes-kernel/modutils/files/lex.l.diff
index 65904b6..b2419a4 100644
--- a/meta/recipes-kernel/modutils/files/lex.l.diff
+++ b/meta/recipes-kernel/modutils/files/lex.l.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- modutils-2.4.26.orig/genksyms/lex.l
 +++ modutils-2.4.26/genksyms/lex.l
 @@ -130,6 +130,7 @@
diff --git a/meta/recipes-kernel/modutils/files/modutils-notest.patch b/meta/recipes-kernel/modutils/files/modutils-notest.patch
index 0e15a10..ab100f2 100644
--- a/meta/recipes-kernel/modutils/files/modutils-notest.patch
+++ b/meta/recipes-kernel/modutils/files/modutils-notest.patch
@@ -2,6 +2,8 @@ This test disables the annoying
    Note: /etc/modules.conf is more recent than /lib/modules/2.4.19-rmk6-pxa1/modules.dep
 message.
 
+Upstream-Status: Inappropriate [disable feature]
+
 --- modutils-2.4.6/insmod/modprobe.c~notest	Mon Feb 26 02:07:17 2001
 +++ modutils-2.4.6/insmod/modprobe.c	Wed Feb 19 14:31:52 2003
 @@ -785,7 +785,6 @@
diff --git a/meta/recipes-kernel/modutils/files/program_prefix.patch b/meta/recipes-kernel/modutils/files/program_prefix.patch
index 2927a23..973705e 100644
--- a/meta/recipes-kernel/modutils/files/program_prefix.patch
+++ b/meta/recipes-kernel/modutils/files/program_prefix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- modutils-2.4.25/Makefile.common.in	Sun Nov 24 21:23:35 2002
 +++ modutils-2.4.25/Makefile.common.in	Thu Jan 29 17:16:30 2004
 @@ -7,6 +7,7 @@
diff --git a/meta/recipes-kernel/modutils/modutils-cross/module.h.diff b/meta/recipes-kernel/modutils/modutils-cross/module.h.diff
index 077baaf..e9f1224 100644
--- a/meta/recipes-kernel/modutils/modutils-cross/module.h.diff
+++ b/meta/recipes-kernel/modutils/modutils-cross/module.h.diff
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -urN modutils-2.4.27.orig/include/module.h modutils-2.4.27/include/module.h
 --- modutils-2.4.27.orig/include/module.h	2003-01-27 11:22:02.000000000 -0500
 +++ modutils-2.4.27/include/module.h	2004-08-23 19:52:34.756772712 -0400
-- 
1.7.1.1



