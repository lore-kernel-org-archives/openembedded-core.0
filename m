Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QS38p-0006vG-3O
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:20:34 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jun 2011 01:17:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; d="scan'208";a="12444724"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jun 2011 01:17:18 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 16:17:15 +0800
Message-Id: <322f6ce665aae0983fc4b6cc0a0e8d025d122eea.1307002336.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1307002336.git.dexuan.cui@intel.com>
References: <cover.1307002336.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1307002336.git.dexuan.cui@intel.com>
References: <cover.1307002336.git.dexuan.cui@intel.com>
Subject: [PATCH 1/2] recipes: Upstream-status --> Upstream-Status: for multiple patches
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
X-List-Received-Date: Thu, 02 Jun 2011 08:20:34 -0000

As a keyword, Upstream-Status is case sensitive.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../eglibc/eglibc-2.13/IO-acquire-lock-fix.patch   |    2 +-
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    2 +-
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |    2 +-
 .../eglibc-2.13/shorten-build-commands.patch       |    2 +-
 .../eglibc/eglibc-2.13/stack-protector-test.patch  |    2 +-
 .../elfutils/elfutils-0.148/mempcpy.patch          |    2 +-
 .../ghostscript/ghostscript-9.02-genarch.patch     |    2 +-
 .../ghostscript-9.02-prevent_recompiling.patch     |    2 +-
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch b/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
index 7bfb67c..cf58035 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/IO-acquire-lock-fix.patch
@@ -1,6 +1,6 @@
 import http://sourceware.org/ml/libc-ports/2007-12/msg00000.html
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Index: libc/bits/stdio-lock.h
 ===================================================================
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
index a667d56..4313aa5 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-svn-arm-lowlevellock-include-tls.patch
@@ -7,7 +7,7 @@ In file included from ../nptl/sysdeps/unix/sysv/linux/libc-lowlevellock.c:21:
 ../nptl/sysdeps/unix/sysv/linux/lowlevellock.c:34: error: 'header' undeclared (first use in this function)
 make[4]: *** [/var/tmp/portage/sys-libs/glibc-2.7-r1/work/build-default-armv4l-unknown-linux-gnu-nptl/nptl/rtld-libc-lowlevellock.os] Error 1
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 --- libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h.orig
 +++ libc/ports/sysdeps/unix/sysv/linux/arm/nptl/lowlevellock.h
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
index 9740e17..7772e6f 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
@@ -8,7 +8,7 @@ see also: http://sourceware.org/bugilla/show_bug.cgi?id=11615
 
 9/19/2010 - added by Qing He <qing.he@intel.com>
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 ---
 diff -ru glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h glibc-2.10.1/ports/sysdeps/mips/dl-machine.h
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch b/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
index 9153258..c17d58b 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
@@ -24,7 +24,7 @@ CodeSourcery
 	* Makerules ($(common-objpfx)includes.mk): Include and create
 	includes.mk.  Create includes.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Index: libc/Makeconfig
 ===================================================================
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch b/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
index 63a86c9..dbf70a9 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/stack-protector-test.patch
@@ -3,7 +3,7 @@ might have build the compiler with --disable-ssp which means ssp should not be
 enabled. Therefore we change the test to a link time test. It will fail if
 libssp is not available.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
index 2c1e823..218a57b 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
@@ -5,7 +5,7 @@ This patch may make sense for upstream but elfutils uses more
 glibc specific features like obstack_printf which are missing in
 uclibc they need to be fixed along to make it work all the way
 
-Upstream-status: Inappropriate[Elfutils uses more glibc specific features]
+Upstream-Status: Inappropriate[Elfutils uses more glibc specific features]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
index 149f9fc..3c2a4c8 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-genarch.patch
@@ -2,7 +2,7 @@ Import patch from windriver linux for cross compilation, and split patches
 into oe way under different directories such as i586, powerpc etc according 
 to Richard's opinion.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
index def8596..8fde77f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-prevent_recompiling.patch
@@ -2,7 +2,7 @@ Just use commands provided by ghostscript-native, preventing recompile them when
 compile ghostscript.
 Way to enable cross compile.
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
 
diff --git a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
index 7102a69..7ab429c 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
@@ -6,7 +6,7 @@ this header is not needed even in eglibc case so it can be removed
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-status: Pending
+Upstream-Status: Pending
 
 Index: ust-0.12/libust/tracer.h
 ===================================================================
-- 
1.7.2



