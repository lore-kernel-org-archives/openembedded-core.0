Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QKThD-0000lZ-7Z
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 13:04:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 12 May 2011 04:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,357,1301900400"; d="scan'208";a="434860889"
Received: from yocto-build3.sh.intel.com (HELO localhost) ([10.239.48.58])
	by azsmga001.ch.intel.com with ESMTP; 12 May 2011 04:01:55 -0700
Message-Id: <f1febeec1c6e422cec0907b440522553c7162484.1305197864.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1305197864.git.edwin.zhai@intel.com>
References: <cover.1305197864.git.edwin.zhai@intel.com>
Old-Date: Thu, 12 May 2011 15:54:11 +0800
Date: Thu, 12 May 2011 19:01:52 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Zhai Edwin <edwin.zhai@intel.com>
Subject: [PATCH 51/54] qemu: Add Upstream-Status
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
X-List-Received-Date: Thu, 12 May 2011 11:04:44 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 ...t-and-use-GCC-atomic-builtins-for-locking.patch |    2 ++
 .../qemu/qemu-0.14.0/enable-i386-linux-user.patch  |    2 ++
 .../fallback-to-safe-mmap_min_addr.patch           |    2 ++
 .../qemu/qemu-0.14.0/fix-configure-checks.patch    |    2 ++
 .../qemu/qemu-0.14.0/fix-nogl.patch                |    2 ++
 .../qemu/qemu-0.14.0/glflags.patch                 |    2 ++
 .../qemu/qemu-0.14.0/init-info.patch               |    2 ++
 .../qemu/qemu-0.14.0/larger_default_ram_size.patch |    2 ++
 .../qemu/qemu-0.14.0/linker-flags.patch            |    3 +++
 .../qemu/qemu-0.14.0/no-strip.patch                |    2 ++
 .../qemu/qemu-0.14.0/opengl-sdl-fix.patch          |    2 ++
 .../qemu/qemu-0.14.0/qemu-git-qemugl-host.patch    |    2 ++
 .../qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch   |    3 +++
 .../qemugl-allow-glxcontext-release.patch          |    2 ++
 .../qemu/qemu-0.14.0/qemugl-fix.patch              |    2 ++
 .../spice-qxl-locking-fix-for-qemu-kvm.patch       |    2 ++
 16 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
index dc69bfb..eb107b8 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/Detect-and-use-GCC-atomic-builtins-for-locking.patch
@@ -8,6 +8,8 @@ Subject: [PATCH] Detect and use GCC atomic builtins for locking
  qemu-lock.h |   13 +++++++++++++
  2 files changed, 30 insertions(+), 0 deletions(-)
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/configure
 ===================================================================
 --- qemu-0.14.0.orig/configure
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
index 3cf0953..bb0d6a3 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/enable-i386-linux-user.patch
@@ -2,6 +2,8 @@ Enable i386-linux-user
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
index 4b1a64f..2075386 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/fallback-to-safe-mmap_min_addr.patch
@@ -8,6 +8,8 @@ Subject: [PATCH] linux-user: use default mmap_min_addr 65536 when /proc/sys/vm/m
  linux-user/main.c |    5 +++++
  1 files changed, 5 insertions(+), 0 deletions(-)
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/linux-user/main.c
 ===================================================================
 --- qemu-0.14.0.orig/linux-user/main.c
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
index 574b430..96881bb 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-configure-checks.patch
@@ -6,6 +6,8 @@ added and files in the sysroot can be found.
 
 Patch from Paul Eggleton, Comments by RP 28/11/10
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Index: qemu-0.14.0/configure
 ===================================================================
 --- qemu-0.14.0.orig/configure
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
index 0219cc8..83b2752 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/fix-nogl.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/glflags.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/glflags.patch
index f99c6d1..0ad5551 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/glflags.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/glflags.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target	2011-04-04 12:12:19.142871742 +0100
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
index 8df60e8..2250444 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/init-info.patch
@@ -2,6 +2,8 @@
 # makes info.info.x11.display zero and avoids the calls to
 # opengl_exec_set_parent_window, one of which is crashing.
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/ui/sdl.c
 ===================================================================
 --- qemu-0.14.0.orig/ui/sdl.c
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
index 8928bd5..711c360 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/larger_default_ram_size.patch
@@ -5,6 +5,8 @@ It has not been applied to upstream qemu
 
 Khem Raj <raj.khem@gmail.com>
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/vl.c
 ===================================================================
 --- qemu-0.14.0.orig/vl.c
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
index 470cf80..c0d1e55 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/linker-flags.patch
@@ -7,6 +7,9 @@ More information is available on the Fedora Wiki:
 https://fedoraproject.org/wiki/UnderstandingDSOLinkChange
 
 JL - 15/06/10
+
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
index cf0d659..d6a4377 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/no-strip.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/Makefile
 ===================================================================
 --- qemu-0.14.0.orig/Makefile
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
index 1f34f07..e73bb7b 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -u -r qemu-0.14.0/Makefile.target qemu-0.14.0-fixed/Makefile.target
 --- qemu-0.14.0/Makefile.target 2011-04-26 21:22:17.627637741 -0700
 +++ qemu-0.14.0-fixed/Makefile.target   2011-04-26 21:23:02.767637747 -0700
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
index 92467a7..bbc9c9e 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-git-qemugl-host.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [other] - qemugl patch need huge changes for upstream
+
 Index: qemu-0.14.0/Makefile.target
 ===================================================================
 --- qemu-0.14.0.orig/Makefile.target
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
index 42ec98f..c4c5424 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemu-vmware-vga-depth.patch
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
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
index 478b204..d808eaa 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-allow-glxcontext-release.patch
@@ -10,6 +10,8 @@ committer Andrzej Zaborowski <andrew.zaborowski@intel.com> Tue, 16 Jun 2009 22:2
  target-i386/opengl_exec.c |   31 ++++++++++++++++---------------
  1 files changed, 16 insertions(+), 15 deletions(-)
 
+Upstream-Status: Inappropriate [configuration]
+
 Index: qemu-0.14.0/target-i386/opengl_exec.c
 ===================================================================
 --- qemu-0.14.0.orig/target-i386/opengl_exec.c
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
index 029aacf..76aae2f 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
@@ -9,6 +9,8 @@ Upstream-Status: other (logical part of qemu-git-qemugl-host.patch)
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
+Upstream-Status: Inappropriate [other] - depends on qemu gl patch
+
 Index: qemu-0.14.0/target-i386/opengl_func.h
 ===================================================================
 --- qemu-0.14.0.orig/target-i386/opengl_func.h	2011-04-08 16:43:46.000000000 +0800
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
index 87d5927..4113fc2 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/spice-qxl-locking-fix-for-qemu-kvm.patch
@@ -3,6 +3,8 @@ Author: Gerd Hoffmann <kraxel@redhat.com>
 Source: upstream, http://patchwork.ozlabs.org/patch/84704/
 Forwarding: not-needed
 
+Upstream-Status: Pending
+
 Index: qemu-0.14.0/hw/qxl.c
 ===================================================================
 --- qemu-0.14.0.orig/hw/qxl.c
-- 
1.7.1



