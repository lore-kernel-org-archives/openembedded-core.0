Return-Path: <prvs=033a92d29=alistair.francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8747E01C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 23:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1558137295; x=1589673295;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=noO6m95X2aX71YIA/Tx86K3MJaopp3JEJieYECsQN6E=;
	b=e0HVTdI1ITn+XwoolaQkdDVu+5zfD0NTPlNjvDxA1nosX6kF+fECXc2Y
	rdjaf8xK8KXejZrL3zQg1ezvgBQZnyXrLXCQy799QlvPSPBGV1BV/9NwP
	C9peNO14m7MGJdfPsNoW9/bdZJZjDaYf3Tg3BRJY7Jb0RBzI/GT88x71u
	lzf+r5DCRsxqk721YJiE01k0XUmQrJTSHHvUSTGQ1ROS8YxfOHXQXGLza
	tJT7JaXWPob8c4kT8I1i3VimjJAGTDx4H6PBpipXn1OlgEONVh5GpmQV1
	17hPbHZV09E2++YLymGZ0yKcdOFAx+ctcMtbo9C3DFO1cW+X6NcEbsg9E g==;
X-IronPort-AV: E=Sophos;i="5.60,481,1549900800"; d="scan'208";a="109794449"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 May 2019 07:54:55 +0800
IronPort-SDR: UGeeRrA6MbHw6szTgw0GNGhFSu7+XRJP0m4pMnuwZpDlLHicihQ+O8bIBUtu/VtWta0L+kP9iY
	ZSThvflpzqv/RM8LC2qNZHbfaJDJ+D5NlQtoHGu822G3rQC6E4yN5lc9qVIFsbwGRivjK4HOAN
	sfJDkLSmK1551P8HlnuGEBHM7Vyp86ozgfh4yADxNc8763lalytnhS7cihqtxwmuBoQdBMrwC+
	muMVQIgVgWtSANjzCBPb0ZsmEntMojcu9/fQpDeqEXhU1v2+1KUoy0cnqTDvojYS0IKHuZ6evq
	krTPzY5HDCYe6/x5eCL529K5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP; 17 May 2019 16:32:46 -0700
IronPort-SDR: m/wMfD08vdlOOyfK3qPdOm3Kzvd/+kvAWyUPi1CXfeoGRmniHIdLtATLNVlyPKg2H8mb50QkRC
	TJFxZcEx2irIqnIbADTcRgIqWex/OxKJTVXvru/0Evjm0gSfctNPA8FrX7Wsw42EFKdIMpRFHq
	mze/KpIHESR7FOLHDY5EhnjWCnyBPFrBwex5KKEKagRsqKxvkN7OTBVqmP7b3FKZ+vlZZwXpzz
	lNSfRxAUyD+Zsz7IXra8WhI5eJ2AwTRTnABUvLS2KM5miZRH3ruhZcbNvgaY3S01S+lE/RKZQ5
	FSQ=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 May 2019 16:54:56 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 16:53:08 -0700
Message-Id: <20190517235308.4139-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] gdb: Upgrade from 8.2.1 to 8.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2019 23:54:54 -0000
Content-Transfer-Encoding: 8bit

Bump GDB and change the oeqa selftest expression to allow ptests to
pass.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/lib/oeqa/selftest/cases/package.py       |  2 +-
 .../gdb/{gdb-8.2.1.inc => gdb-8.3.inc}        | 12 +--
 .../gdb/gdb-cross-canadian.inc                |  1 -
 ...ian_8.2.1.bb => gdb-cross-canadian_8.3.bb} |  0
 .../{gdb-cross_8.2.1.bb => gdb-cross_8.3.bb}  |  0
 ...1-Fix-build-with-latest-GCC-9.0-tree.patch | 50 ----------
 ...h => 0001-gdbserver-ctrl-c-handling.patch} |  0
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 23 ++---
 ...-Use-exorted-definitions-of-SIGRTMIN.patch | 16 ++-
 ...h64-Fix-the-gdb-build-with-musl-libc.patch | 52 ----------
 .../gdb/gdb/CVE-2017-9778.patch               | 99 -------------------
 .../gdb/{gdb_8.2.1.bb => gdb_8.3.bb}          |  0
 13 files changed, 23 insertions(+), 234 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-8.2.1.inc => gdb-8.3.inc} (73%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.2.1.bb => gdb-cross-canadian_8.3.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.2.1.bb => gdb-cross_8.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-Fix-build-with-latest-GCC-9.0-tree.patch
 rename meta/recipes-devtools/gdb/gdb/{gdbserver-ctrl-c-handling.patch => 0001-gdbserver-ctrl-c-handling.patch} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
 rename meta/recipes-devtools/gdb/{gdb_8.2.1.bb => gdb_8.3.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 668f31324e..744c6c3247 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "8.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.32%"
-GDBVERSION ?= "8.2%"
+GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.29%"
 LINUXLIBCVERSION ?= "5.0%"
 QEMUVERSION ?= "4.0%"
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 7a00753821..aa13a8df76 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -134,7 +134,7 @@ class PackageTests(OESelftestTestCase):
                     return False
 
                 # Check debugging symbols works correctly
-                elif "Breakpoint 1, main () at hello.c:4" in l:
+                elif re.match("Breakpoint 1.*hello\.c.*4", l):
                     return True
 
             self.logger.error("GDB result:\n%d: %s", status, output)
diff --git a/meta/recipes-devtools/gdb/gdb-8.2.1.inc b/meta/recipes-devtools/gdb/gdb-8.3.inc
similarity index 73%
rename from meta/recipes-devtools/gdb/gdb-8.2.1.inc
rename to meta/recipes-devtools/gdb/gdb-8.3.inc
index f28b57439c..db8d5f349f 100644
--- a/meta/recipes-devtools/gdb/gdb-8.2.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.3.inc
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
 
 SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
+           file://0001-gdbserver-ctrl-c-handling.patch \
            file://0002-make-man-install-relative-to-DESTDIR.patch \
            file://0003-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
            file://0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
@@ -15,11 +16,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-Fix-invalid-sigprocmask-call.patch \
-           file://gdbserver-ctrl-c-handling.patch \
-           file://0001-Fix-build-with-latest-GCC-9.0-tree.patch \
-           file://CVE-2017-9778.patch \
-           file://0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch \
-"
-SRC_URI[md5sum] = "f8b2562e830a4098dd5b5ea9e9296c70"
-SRC_URI[sha256sum] = "0a6a432907a03c5c8eaad3c3cffd50c00a40c3a5e3c4039440624bae703f2202"
-
+           "
+SRC_URI[md5sum] = "bbd95b2f9b34621ad7a19a3965476314"
+SRC_URI[sha256sum] = "802f7ee309dcc547d65a68d61ebd6526762d26c3051f52caebe2189ac1ffd72e"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 475e4f08ef..c9daf25a41 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -40,4 +40,3 @@ do_install_append() {
 	rm -rf ${D}${exec_prefix}/lib
 	cross_canadian_bindirlinks
 }
-
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.2.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.3.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.2.1.bb b/meta/recipes-devtools/gdb/gdb-cross_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_8.2.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_8.3.bb
diff --git a/meta/recipes-devtools/gdb/gdb/0001-Fix-build-with-latest-GCC-9.0-tree.patch b/meta/recipes-devtools/gdb/gdb/0001-Fix-build-with-latest-GCC-9.0-tree.patch
deleted file mode 100644
index 2a962929d7..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0001-Fix-build-with-latest-GCC-9.0-tree.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 7406a50077773e78282a495cb32ef5b8179f6a33 Mon Sep 17 00:00:00 2001
-From: Dimitar Dimitrov <dimitar@dinux.eu>
-Date: Mon, 17 Dec 2018 21:30:52 +0200
-Subject: [PATCH] Fix build with latest GCC 9.0 tree
-
-A recent patch [1] to fix a GCC PR [2] actually broke the GDB build.
-To fix, remove the stack pointer clobber. GCC will ignore the clobber
-marker, and will not save or restore the stack pointer.
-
-I ran "make check-gdb" on x86_64 to ensure there are no regressions.
-
-gdb/ChangeLog:
-
-2018-12-17  Dimitar Dimitrov  <dimitar@dinux.eu>
-
-	* nat/linux-ptrace.c (linux_ptrace_test_ret_to_nx): Remove sp clobbers.
-
-[1] https://gcc.gnu.org/ml/gcc-patches/2018-12/msg00532.html
-[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52813
-
-Upstream-Status: Backport
-Signed-off-by: Dimitar Dimitrov <dimitar@dinux.eu>
----
- gdb/ChangeLog          | 5 +++++
- gdb/nat/linux-ptrace.c | 4 ++--
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
-index d4c1b8f9fd..187cfeb9bc 100644
---- a/gdb/nat/linux-ptrace.c
-+++ b/gdb/nat/linux-ptrace.c
-@@ -161,14 +161,14 @@ linux_ptrace_test_ret_to_nx (void)
- 			".globl linux_ptrace_test_ret_to_nx_instr;"
- 			"linux_ptrace_test_ret_to_nx_instr:"
- 			"ret"
--			: : "r" (return_address) : "%esp", "memory");
-+			: : "r" (return_address) : "memory");
- #elif defined __x86_64__
- 	  asm volatile ("pushq %0;"
- 			".globl linux_ptrace_test_ret_to_nx_instr;"
- 			"linux_ptrace_test_ret_to_nx_instr:"
- 			"ret"
- 			: : "r" ((uint64_t) (uintptr_t) return_address)
--			: "%rsp", "memory");
-+			: "memory");
- #else
- # error "!__i386__ && !__x86_64__"
- #endif
---
-2.20.1
diff --git a/meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch b/meta/recipes-devtools/gdb/gdb/0001-gdbserver-ctrl-c-handling.patch
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb/gdbserver-ctrl-c-handling.patch
rename to meta/recipes-devtools/gdb/gdb/0001-gdbserver-ctrl-c-handling.patch
diff --git a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index bbe0020bf3..170d512ef7 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
@@ -1,24 +1,24 @@
-From 1dd5c44474b01d84de60faded960fef4a0a87e41 Mon Sep 17 00:00:00 2001
+From da30370c1e3ff7728a857e119e0529a9f097086e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
-Subject: [PATCH 04/11] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC
- systems
+Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  gdb/gdbserver/linux-ppc-low.c | 6 ++++++
  gdb/nat/ppc-linux.h           | 6 ++++++
  2 files changed, 12 insertions(+)
 
 diff --git a/gdb/gdbserver/linux-ppc-low.c b/gdb/gdbserver/linux-ppc-low.c
-index 47428c1529..841a5e02b9 100644
+index 1b695e53..1978347c 100644
 --- a/gdb/gdbserver/linux-ppc-low.c
 +++ b/gdb/gdbserver/linux-ppc-low.c
-@@ -21,7 +21,13 @@
- #include "linux-low.h"
- 
+@@ -23,7 +23,13 @@
+ #include "elf/common.h"
+ #include <sys/uio.h>
  #include <elf.h>
 +#if !defined(__GLIBC__)
 +# define pt_regs uapi_pt_regs
@@ -31,12 +31,12 @@ index 47428c1529..841a5e02b9 100644
  #include "arch/ppc-linux-common.h"
  #include "arch/ppc-linux-tdesc.h"
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 3d4d4fdc56..5b93af8d3a 100644
+index f1561b3b..40399361 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
- #ifndef PPC_LINUX_H
- #define PPC_LINUX_H 1
+ #ifndef NAT_PPC_LINUX_H
+ #define NAT_PPC_LINUX_H
  
 +#if !defined(__GLIBC__)
 +# define pt_regs uapi_pt_regs
@@ -48,6 +48,3 @@ index 3d4d4fdc56..5b93af8d3a 100644
  #include <asm/cputable.h>
  
  /* This sometimes isn't defined.  */
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
index d32352b813..95bec5fd60 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Use-exorted-definitions-of-SIGRTMIN.patch
@@ -1,7 +1,7 @@
-From d97878b272bd7c4993f4205983ae8b7ecddbcf82 Mon Sep 17 00:00:00 2001
+From bab0b34672727c50313eb98b8522355cbe1bde36 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:31:40 -0700
-Subject: [PATCH 08/11] Use exorted definitions of SIGRTMIN
+Subject: [PATCH] Use exorted definitions of SIGRTMIN
 
 Define W_STOPCODE if not defined already
 
@@ -14,16 +14,17 @@ https://sourceware.org/bugzilla/show_bug.cgi?id=13012
 Upstream-Status: Submitted
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  gdb/linux-nat.c     | 4 ++--
  gdb/nat/linux-nat.h | 4 ++++
  2 files changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/gdb/linux-nat.c b/gdb/linux-nat.c
-index 64015e7520..acf950c38b 100644
+index 063afe26..fb1d2d5d 100644
 --- a/gdb/linux-nat.c
 +++ b/gdb/linux-nat.c
-@@ -4724,6 +4724,6 @@ lin_thread_get_thread_signals (sigset_t *set)
+@@ -4713,6 +4713,6 @@ lin_thread_get_thread_signals (sigset_t *set)
    /* NPTL reserves the first two RT signals, but does not provide any
       way for the debugger to query the signal numbers - fortunately
       they don't change.  */
@@ -33,7 +34,7 @@ index 64015e7520..acf950c38b 100644
 +  sigaddset (set, SIGRTMIN + 1);
  }
 diff --git a/gdb/nat/linux-nat.h b/gdb/nat/linux-nat.h
-index a90a124d3a..4f3e681962 100644
+index 1e32dd9e..b886305d 100644
 --- a/gdb/nat/linux-nat.h
 +++ b/gdb/nat/linux-nat.h
 @@ -90,4 +90,8 @@ extern void linux_stop_lwp (struct lwp_info *lwp);
@@ -44,7 +45,4 @@ index a90a124d3a..4f3e681962 100644
 +#define W_STOPCODE(sig) ((sig) << 8 | 0x7f)
 +#endif
 +
- #endif /* LINUX_NAT_H */
--- 
-2.18.0
-
+ #endif /* NAT_LINUX_NAT_H */
diff --git a/meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch b/meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch
deleted file mode 100644
index f35033c122..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-the-gdb-build-with-musl-libc.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From cbbf1a8ba7f037ba3b83f090829edcbab542c285 Mon Sep 17 00:00:00 2001
-From: Szabolcs Nagy <szabolcs.nagy@arm.com>
-Date: Thu, 13 Dec 2018 17:47:17 +0000
-Subject: [PATCH] AArch64: Fix the gdb build with musl libc
-
-Including asm/sigcontext.h together with libc headers is not valid. In
-general linux headers may not work with libc headers, so mixing them
-should be avoided, especially when the linux header defines types that
-are also exposed in libc headers.
-
-In case of asm/sigcontext.h glibc happens to work because glibc signal.h
-directly includes it, but e.g. in musl libc signal.h replicates the
-sigcontext.h definitions in an abi compatible way which are in conflict
-with the linux definitions when both headers are included.
-
-Since old linux headers or old libc headers may not have the necessary
-definitions, gdb has to replicate the definitions it relies on anyway.
-Which is fine since all definitions must be ABI stable. For linux apis
-that are not available via libc headers, replicating the definitions in
-gdb is the most reliable way to use them.
-
-Note: asm/ptrace.h includes asm/sigcontext.h in some versions of linux
-headers, which is just as problematic and should be fixed in linux.
-
-gdb/ChangeLog:
-
-	* nat/aarch64-sve-linux-ptrace.h: Include signal.h instead of
-	asm/sigcontext.h.
-
-[ChangeLog entry stripped so that patch applies cleanly]
-Upstream-Status: Backport
-Signed-off-by: Paul Barker <paul@betafive.co.uk>
----
- gdb/nat/aarch64-sve-linux-ptrace.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gdb/nat/aarch64-sve-linux-ptrace.h b/gdb/nat/aarch64-sve-linux-ptrace.h
-index 029e753ffe..172ae39432 100644
---- a/gdb/nat/aarch64-sve-linux-ptrace.h
-+++ b/gdb/nat/aarch64-sve-linux-ptrace.h
-@@ -20,7 +20,7 @@
- #ifndef AARCH64_SVE_LINUX_PTRACE_H
- #define AARCH64_SVE_LINUX_PTRACE_H
- 
--#include <asm/sigcontext.h>
-+#include <signal.h>
- #include <sys/utsname.h>
- #include <sys/ptrace.h>
- #include <asm/ptrace.h>
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch b/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
deleted file mode 100644
index 935f2661fe..0000000000
--- a/meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From a608b79f30ab3f670095e14ba3d3b5b24a19fe68 Mon Sep 17 00:00:00 2001
-From: Sandra Loosemore <sandra@codesourcery.com>
-Date: Thu, 25 Apr 2019 07:27:02 -0700
-Subject: [PATCH] Detect invalid length field in debug frame FDE header.
-
-GDB was failing to catch cases where a corrupt ELF or core file
-contained an invalid length value in a Dwarf debug frame FDE header.
-It was checking for buffer overflow but not cases where the length was
-negative or caused pointer wrap-around.
-
-In addition to the additional validity check, this patch cleans up the
-multiple signed/unsigned conversions on the length field so that an
-unsigned representation is used consistently throughout.
-
-This patch fixes CVE-2017-9778 and PR gdb/21600.
-
-2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
-	    Kang Li <kanglictf@gmail.com>
-
-	PR gdb/21600
-
-	* dwarf2-frame.c (read_initial_length): Be consistent about using
-	unsigned representation of length.
-	(decode_frame_entry_1): Likewise.  Check for wraparound of
-	end pointer as well as buffer overflow.
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=723adb650a31859d7cc45832cb8adca0206455ed]
-CVE: CVE-2017-9778
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- gdb/ChangeLog      | 11 +++++++++++
- gdb/dwarf2-frame.c | 14 +++++++-------
- 2 files changed, 18 insertions(+), 7 deletions(-)
-
-diff --git a/gdb/ChangeLog b/gdb/ChangeLog
-index 3711dc7..0a9720b 100644
---- a/gdb/ChangeLog
-+++ b/gdb/ChangeLog
-@@ -1,3 +1,14 @@
-+2019-04-25  Sandra Loosemore  <sandra@codesourcery.com>
-+	    Kang Li <kanglictf@gmail.com>
-+
-+	PR gdb/21600
-+
-+	* dwarf2-frame.c (read_initial_length): Be consistent about using
-+	unsigned representation of length.
-+	(decode_frame_entry_1): Likewise.  Check for wraparound of
-+	end pointer as well as buffer overflow.
-+
-+
- 2018-12-23  Joel Brobecker  <brobecker@adacore.com>
- 
- 	* version.in: Set GDB version number to 8.2.1.
-diff --git a/gdb/dwarf2-frame.c b/gdb/dwarf2-frame.c
-index 91e16cf..a7b99fd 100644
---- a/gdb/dwarf2-frame.c
-+++ b/gdb/dwarf2-frame.c
-@@ -1477,7 +1477,7 @@ static ULONGEST
- read_initial_length (bfd *abfd, const gdb_byte *buf,
- 		     unsigned int *bytes_read_ptr)
- {
--  LONGEST result;
-+  ULONGEST result;
- 
-   result = bfd_get_32 (abfd, buf);
-   if (result == 0xffffffff)
-@@ -1780,7 +1780,7 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
- {
-   struct gdbarch *gdbarch = get_objfile_arch (unit->objfile);
-   const gdb_byte *buf, *end;
--  LONGEST length;
-+  ULONGEST length;
-   unsigned int bytes_read;
-   int dwarf64_p;
-   ULONGEST cie_id;
-@@ -1791,15 +1791,15 @@ decode_frame_entry_1 (struct comp_unit *unit, const gdb_byte *start,
-   buf = start;
-   length = read_initial_length (unit->abfd, buf, &bytes_read);
-   buf += bytes_read;
--  end = buf + length;
--
--  /* Are we still within the section?  */
--  if (end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
--    return NULL;
-+  end = buf + (size_t) length;
- 
-   if (length == 0)
-     return end;
- 
-+  /* Are we still within the section?  */
-+  if (end <= buf || end > unit->dwarf_frame_buffer + unit->dwarf_frame_size)
-+    return NULL;
-+
-   /* Distinguish between 32 and 64-bit encoded frame info.  */
-   dwarf64_p = (bytes_read == 12);
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/gdb/gdb_8.2.1.bb b/meta/recipes-devtools/gdb/gdb_8.3.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_8.2.1.bb
rename to meta/recipes-devtools/gdb/gdb_8.3.bb
-- 
2.21.0


