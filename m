Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D863D7F0EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 05:14:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6J5DIaP022455
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Jul 2019 22:13:39 -0700
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 18 Jul 2019 22:13:21 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2019 13:13:18 +0800
Message-ID: <1563513198-4037-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [PATCH] ltp: upgrade 20190115 -> 20190517
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
X-List-Received-Date: Fri, 19 Jul 2019 05:14:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Drop the following patches since the issues have been fixed upstream:
  0001-file01.sh-Fix-in-was-not-recognized.patch
  0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch
  0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
  0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
  0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
  0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
  0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
  0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
  0026-crash01-Define-_GNU_SOURCE.patch
  0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
  0034-periodic_output.patch
  0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
  define-sigrtmin-and-sigrtmax-for-musl.patch
  setregid01-security-string-formatting.patch

Refresh the following patches:
  0004-build-Add-option-to-select-libc-implementation.patch
  0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
  0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
  0018-guard-mallocopt-with-__GLIBC__.patch
  0020-getdents-define-getdents-getdents64-only-for-glibc.patch
  0035-fix-test_proc_kill-hang.patch
  0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
  0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
  0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
  0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch
  0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch

Add patch:
  0006-rt_tgsigqueueinfo-disable-test-on-musl.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...Add-option-to-select-libc-implementation.patch} |  27 +--
 .../0001-file01.sh-Fix-in-was-not-recognized.patch |  38 ---
 ...efine-TST_ABI-32-64-to-detect-target-type.patch |  74 ------
 ...trlimit03.c-read-proc-sys-fs-nr_open-for-.patch |  70 ------
 ...ollers-Link-with-libfts-explicitly-on-mu.patch} |  13 +-
 ...__GLIBC_PREREQ-is-defined-before-using-it.patch |  58 +++++
 ...h => 0004-guard-mallocopt-with-__GLIBC__.patch} |   9 +-
 ...efine-getdents-getdents64-only-for-glibc.patch} |  12 +-
 ...06-rt_tgsigqueueinfo-disable-test-on-musl.patch |  35 +++
 ...patch => 0007-Fix-test_proc_kill-hanging.patch} |  10 +-
 ...RDSIZE-undeclared-when-building-with-musl.patch |  31 ---
 ...__GLIBC_PREREQ-is-defined-before-using-it.patch | 151 ------------
 ...twork-nfsv4-acl-acl1.c-Security-fix-on-s.patch} |  14 +-
 ...ition-of-struct-msgbuf-error-building-wit.patch |  36 ---
 ...testsuite-mmap24-2-Relax-condition-a-bit.patch} |   6 +-
 ...-t-use-hardcoded-index-0-for-SHM_STAT-te.patch} |   9 +-
 ...> 0011-direct_io-diotest4-drop-MAP_FIXED.patch} |  35 +--
 ...adjust-a-bit-of-code-to-compatiable-with.patch} |   8 +-
 ..._GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch |  73 ------
 ...-Use-int-instead-of-enum-__ptrace_request.patch |  50 ----
 ...gaction-rt_sigprocmark-Define-_GNU_SOURCE.patch |  70 ------
 .../ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch  |  31 ---
 ...n.h-Use-sighandler_t-instead-of-__sighand.patch |  48 ----
 .../ltp/ltp/0034-periodic_output.patch             |  55 -----
 ...s-ar01-Fix-for-test-in-deterministic-mode.patch | 254 ---------------------
 .../define-sigrtmin-and-sigrtmax-for-musl.patch    | 114 ---------
 .../setregid01-security-string-formatting.patch    |  46 ----
 .../ltp/{ltp_20190115.bb => ltp_20190517.bb}       |  39 ++--
 28 files changed, 184 insertions(+), 1232 deletions(-)
 rename meta/recipes-extended/ltp/ltp/{0004-build-Add-option-to-select-libc-implementation.patch => 0001-build-Add-option-to-select-libc-implementation.patch} (90%)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-file01.sh-Fix-in-was-not-recognized.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
 rename meta/recipes-extended/ltp/ltp/{0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch => 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch} (86%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
 rename meta/recipes-extended/ltp/ltp/{0018-guard-mallocopt-with-__GLIBC__.patch => 0004-guard-mallocopt-with-__GLIBC__.patch} (87%)
 rename meta/recipes-extended/ltp/ltp/{0020-getdents-define-getdents-getdents64-only-for-glibc.patch => 0005-getdents-define-getdents-getdents64-only-for-glibc.patch} (87%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0006-rt_tgsigqueueinfo-disable-test-on-musl.patch
 rename meta/recipes-extended/ltp/ltp/{0035-fix-test_proc_kill-hang.patch => 0007-Fix-test_proc_kill-hanging.patch} (86%)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
 rename meta/recipes-extended/ltp/ltp/{0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch => 0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch} (89%)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
 rename meta/recipes-extended/ltp/ltp/{0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch => 0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch} (95%)
 rename meta/recipes-extended/ltp/ltp/{0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch => 0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch} (91%)
 rename meta/recipes-extended/ltp/ltp/{0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch => 0011-direct_io-diotest4-drop-MAP_FIXED.patch} (50%)
 rename meta/recipes-extended/ltp/ltp/{0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch => 0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch} (90%)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/define-sigrtmin-and-sigrtmax-for-musl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/setregid01-security-string-formatting.patch
 rename meta/recipes-extended/ltp/{ltp_20190115.bb => ltp_20190517.bb} (72%)

diff --git a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
similarity index 90%
rename from meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
rename to meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
index 3c66c94..b5c25c5 100644
--- a/meta/recipes-extended/ltp/ltp/0004-build-Add-option-to-select-libc-implementation.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
@@ -1,7 +1,7 @@
-From 53acddddf1b324e06af886ee4639b774e5c8c8bc Mon Sep 17 00:00:00 2001
+From ec282980e6eee96f5b74aba464141f86049263e6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Jan 2016 18:19:03 +0000
-Subject: [PATCH 04/32] build: Add option to select libc implementation
+Subject: [PATCH] build: Add option to select libc implementation
 
 There are more than glibc for C library implementation available on
 linux now a days, uclibc cloaked like glibc but musl e.g. is very
@@ -9,8 +9,9 @@ different and does not implement all GNU extentions
 
 Disable tests specifically not building _yet_ on musl based systems
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile                                    | 5 +++++
  testcases/kernel/Makefile                   | 5 ++++-
@@ -23,10 +24,10 @@ Upstream-Status: Pending
  8 files changed, 35 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 297f8e7..906b280 100644
+index 768ca46..e9d679a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -49,6 +49,11 @@ SKIP_IDCHECK		?= 0
+@@ -41,6 +41,11 @@ vpath %.mk		$(top_srcdir)/mk:$(top_srcdir)/mk/include
  UCLINUX			?= 0
  export UCLINUX
  
@@ -39,7 +40,7 @@ index 297f8e7..906b280 100644
  # COMMON_TARGETS:	Targets which exist in all, clean, and install.
  # INSTALL_TARGETS:	Targets which exist in clean and install (contains
 diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
-index 50a12fa..4f1987f 100644
+index 39d79c7..24a57d9 100644
 --- a/testcases/kernel/Makefile
 +++ b/testcases/kernel/Makefile
 @@ -49,12 +49,15 @@ SUBDIRS			+= connectors \
@@ -60,7 +61,7 @@ index 50a12fa..4f1987f 100644
  SUBDIRS			+= power_management
  endif
 diff --git a/testcases/kernel/sched/Makefile b/testcases/kernel/sched/Makefile
-index 6245ed0..aa4eb7f 100644
+index 6a57d79..74bb933 100644
 --- a/testcases/kernel/sched/Makefile
 +++ b/testcases/kernel/sched/Makefile
 @@ -23,5 +23,7 @@
@@ -73,7 +74,7 @@ index 6245ed0..aa4eb7f 100644
 +endif
  include $(top_srcdir)/include/mk/generic_trunk_target.mk
 diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
-index 8acb395..b749126 100644
+index 45a00cf..d1becd0 100644
 --- a/testcases/kernel/syscalls/Makefile
 +++ b/testcases/kernel/syscalls/Makefile
 @@ -28,6 +28,11 @@ ifeq ($(UCLINUX),1)
@@ -89,7 +90,7 @@ index 8acb395..b749126 100644
  ifeq ($(UCLIBC),1)
  FILTER_OUT_DIRS	+= profil
 diff --git a/testcases/network/nfsv4/acl/Makefile b/testcases/network/nfsv4/acl/Makefile
-index 8bc78c2..c36cf50 100644
+index 8c55a6b..f7cda62 100644
 --- a/testcases/network/nfsv4/acl/Makefile
 +++ b/testcases/network/nfsv4/acl/Makefile
 @@ -26,4 +26,8 @@ include $(top_srcdir)/include/mk/env_pre.mk
@@ -102,7 +103,7 @@ index 8bc78c2..c36cf50 100644
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
 diff --git a/testcases/network/rpc/basic_tests/Makefile b/testcases/network/rpc/basic_tests/Makefile
-index 3160813..9bdf5d0 100644
+index 66e9d56..ea8eb8a 100644
 --- a/testcases/network/rpc/basic_tests/Makefile
 +++ b/testcases/network/rpc/basic_tests/Makefile
 @@ -23,4 +23,9 @@
@@ -116,7 +117,7 @@ index 3160813..9bdf5d0 100644
 +
  include $(top_srcdir)/include/mk/generic_trunk_target.mk
 diff --git a/testcases/realtime/func/pi-tests/Makefile b/testcases/realtime/func/pi-tests/Makefile
-index 7a7a57a..5808866 100644
+index 68616a7..748754b 100644
 --- a/testcases/realtime/func/pi-tests/Makefile
 +++ b/testcases/realtime/func/pi-tests/Makefile
 @@ -27,5 +27,9 @@ include $(top_srcdir)/include/mk/env_pre.mk
@@ -130,7 +131,7 @@ index 7a7a57a..5808866 100644
  
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
 diff --git a/testcases/realtime/stress/pi-tests/Makefile b/testcases/realtime/stress/pi-tests/Makefile
-index 5edc3b4..aa5987a 100644
+index 1881f75..266e0b8 100644
 --- a/testcases/realtime/stress/pi-tests/Makefile
 +++ b/testcases/realtime/stress/pi-tests/Makefile
 @@ -24,4 +24,9 @@ top_srcdir		?= ../../../..
@@ -144,5 +145,5 @@ index 5edc3b4..aa5987a 100644
 +
  include $(top_srcdir)/include/mk/generic_leaf_target.mk
 -- 
-2.7.0
+2.7.4
 
diff --git a/meta/recipes-extended/ltp/ltp/0001-file01.sh-Fix-in-was-not-recognized.patch b/meta/recipes-extended/ltp/ltp/0001-file01.sh-Fix-in-was-not-recognized.patch
deleted file mode 100644
index 5cd9e08..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-file01.sh-Fix-in-was-not-recognized.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 974e9b862e503c50501079e6586f81918e94a849 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Fri, 19 Apr 2019 17:57:48 +0800
-Subject: [PATCH] file01.sh: Fix in was not recognized
-
-Some file has "pie" appending after LSB or MSB, which causes mismatch and the
-following error.
-
-"file01 10 TFAIL: in: was not recognized"
-..."ELF 64-bit LSB pie executable"...
-
-This patches tunes the regulation expression to include those cases.
-
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-April/011758.html]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- testcases/commands/file/file01.sh | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/commands/file/file01.sh b/testcases/commands/file/file01.sh
-index 0a8119e..55c0433 100755
---- a/testcases/commands/file/file01.sh
-+++ b/testcases/commands/file/file01.sh
-@@ -91,7 +91,9 @@ do_test()
- 	 9) file_test in.m4 "M4 macro processor script, ASCII text" \
- 			    "ASCII M4 macro language pre-processor text";;
- 	10) file_test in "ELF .*-bit $TEST_ARCH executable, .*" \
--			 "ELF .*-bit $TEST_ARCH shared object, .*";;
-+			 "ELF .*-bit $TEST_ARCH shared object, .*" \
-+			 "ELF .*-bit $TEST_ARCH pie executable, .*" \
-+			 "ELF .*-bit $TEST_ARCH pie shared object, .*";;
- 	11) file_test in.ar "current ar archive";;
- 	12) file_test in.tar "tar archive";;
- 	13) file_test in.tar.gz "gzip compressed data, .*";;
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch b/meta/recipes-extended/ltp/ltp/0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch
deleted file mode 100644
index a6129d3..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From d5293d73b760268a6b200ab7d9323e37700e6a8c Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Thu, 28 Mar 2019 07:11:25 +0100
-Subject: [PATCH] lapi: Define TST_ABI{,32,64} to detect target type
-
-This is meant to be a replacement of __WORDSIZE definition.
-
-Motivation was instead of finding, where all libc define
-__WORDSIZE, which is usually used for detecting target type
-(at least MUSL defines it in different place than other libc)
-we define our own constant.
-
-Suggested-by: Cyril Hrubis <chrubis@suse.cz>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-
-Upstream-Status: Backport
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- include/lapi/abisize.h | 29 +++++++++++++----------------
- 1 file changed, 13 insertions(+), 16 deletions(-)
-
-diff --git a/include/lapi/abisize.h b/include/lapi/abisize.h
-index 897bdfd..9e6622c 100644
---- a/include/lapi/abisize.h
-+++ b/include/lapi/abisize.h
-@@ -1,25 +1,22 @@
-+// SPDX-License-Identifier: GPL-2.0-or-later
- /*
-- * Copyright (c) 2014 Linux Test Project
-+ * Copyright (c) 2014-2019 Linux Test Project
-  *  Cyril Hrubis <chrubis@suse.cz>
-- *
-- * This program is free software; you can redistribute it and/or
-- * modify it under the terms of the GNU General Public License as
-- * published by the Free Software Foundation; either version 2 of
-- * the License, or (at your option) any later version.
-- *
-- * This program is distributed in the hope that it would be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- * GNU General Public License for more details.
-- *
-- * You should have received a copy of the GNU General Public License
-- * along with this program; if not, write the Free Software Foundation,
-- * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-+ *  Petr Vorel <petr.vorel@gmail.com>
-  */
- 
- #ifndef ABISIZE_H__
- #define ABISIZE_H__
- 
-+/* __WORDSIZE replacement */
-+#if defined(__LP64__) || defined(_LP64)
-+# define TST_ABI64
-+# define TST_ABI 64
-+#else
-+# define TST_ABI32
-+# define TST_ABI 32
-+#endif
-+
- /*
-  * Determines if we have to split up 64 bit arguments or not
-  *
-@@ -29,6 +26,6 @@
-      (defined(__mips__) && _MIPS_SIM == _ABIN32) || \
-      (defined(__x86_64__) && defined(__ILP32__)) || \
-      (defined(__aarch64__) && defined(__ILP32__)) || \
--     __WORDSIZE == 64
-+     defined(TST_ABI64)
- 
- #endif /* ABISIZE_H__ */
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
deleted file mode 100644
index 39623c3..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From db57ddc1497e72947da2b14f471ab521478ef99d Mon Sep 17 00:00:00 2001
-From: Tommi Rantala <tommi.t.rantala@nokia.com>
-Date: Thu, 31 Jan 2019 19:49:00 +0200
-Subject: [PATCH] syscalls/setrlimit03.c: read /proc/sys/fs/nr_open for
- RLIMIT_NOFILE limit
-
-Since kernel v2.6.25 RLIMIT_NOFILE limit is no longer hardcoded to
-NR_OPEN, but can be set via /proc/sys/fs/nr_open, see kernel commit
-9cfe015aa424b3c003baba3841a60dd9b5ad319b ("get rid of NR_OPEN and
-introduce a sysctl_nr_open").
-
-nr_open default value is 1024*1024, so setrlimit03 has been passing fine
-on new kernels, only "unexpectedly succeeding" if nr_open is set to some
-larger value.
-
-Signed-off-by: Tommi Rantala <tommi.t.rantala@nokia.com>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-
-Upstream-Status: Backport [db57ddc1497e ("syscalls/setrlimit03.c: read /proc/sys/fs/nr_open for RLIMIT_NOFILE limit")]
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- testcases/kernel/syscalls/setrlimit/setrlimit03.c | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/setrlimit/setrlimit03.c b/testcases/kernel/syscalls/setrlimit/setrlimit03.c
-index 29b52aa..12455fe 100644
---- a/testcases/kernel/syscalls/setrlimit/setrlimit03.c
-+++ b/testcases/kernel/syscalls/setrlimit/setrlimit03.c
-@@ -35,7 +35,10 @@
- # define NR_OPEN (1024*1024)
- #endif
- 
-+#define NR_OPEN_PATH "/proc/sys/fs/nr_open"
-+
- static struct rlimit rlim1, rlim2;
-+static unsigned int nr_open = NR_OPEN;
- 
- static struct tcase {
- 	struct rlimit *rlimt;
-@@ -51,7 +54,10 @@ static void verify_setrlimit(unsigned int n)
- 
- 	TEST(setrlimit(RLIMIT_NOFILE, tc->rlimt));
- 	if (TST_RET != -1) {
--		tst_res(TFAIL, "call succeeded unexpectedly");
-+		tst_res(TFAIL, "call succeeded unexpectedly "
-+			"(nr_open=%u rlim_cur=%lu rlim_max=%lu)", nr_open,
-+			(unsigned long)(tc->rlimt->rlim_cur),
-+			(unsigned long)(tc->rlimt->rlim_max));
- 		return;
- 	}
- 
-@@ -65,10 +71,13 @@ static void verify_setrlimit(unsigned int n)
- 
- static void setup(void)
- {
-+	if (!access(NR_OPEN_PATH, F_OK))
-+		SAFE_FILE_SCANF(NR_OPEN_PATH, "%u", &nr_open);
-+
- 	SAFE_GETRLIMIT(RLIMIT_NOFILE, &rlim1);
- 	rlim2.rlim_max = rlim1.rlim_cur;
- 	rlim2.rlim_cur = rlim1.rlim_max + 1;
--	rlim1.rlim_max = NR_OPEN + 1;
-+	rlim1.rlim_max = nr_open + 1;
- }
- 
- static struct tst_test test = {
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch b/meta/recipes-extended/ltp/ltp/0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
similarity index 86%
rename from meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
rename to meta/recipes-extended/ltp/ltp/0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
index b9390e2..eff9ed0 100644
--- a/meta/recipes-extended/ltp/ltp/0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
+++ b/meta/recipes-extended/ltp/ltp/0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
@@ -1,20 +1,21 @@
-From 6e3058521b50d91d4b0569c4d491c5af5ff798b2 Mon Sep 17 00:00:00 2001
+From 81e5bd5442337a4a648a0dbbff47eaac0d351287 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Jan 2016 18:22:38 +0000
-Subject: [PATCH 05/32] kernel/controllers: Link with libfts explicitly on musl
+Subject: [PATCH] kernel/controllers: Link with libfts explicitly on musl
 
 musl does not implement fts like glibc and therefore it depends on
 external implementation for all fts APIs
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  testcases/kernel/controllers/Makefile.inc        | 3 +++
  testcases/kernel/controllers/cpuset/Makefile.inc | 3 +++
  2 files changed, 6 insertions(+)
 
 diff --git a/testcases/kernel/controllers/Makefile.inc b/testcases/kernel/controllers/Makefile.inc
-index b106283..ef5fc0c 100644
+index 4ca0b5a..1d85e4d 100644
 --- a/testcases/kernel/controllers/Makefile.inc
 +++ b/testcases/kernel/controllers/Makefile.inc
 @@ -36,6 +36,9 @@ MAKE_DEPS		:= $(LIB)
@@ -28,7 +29,7 @@ index b106283..ef5fc0c 100644
  INSTALL_TARGETS		?= *.sh
  
 diff --git a/testcases/kernel/controllers/cpuset/Makefile.inc b/testcases/kernel/controllers/cpuset/Makefile.inc
-index 9e002f4..e0fcb9c 100644
+index db6a843..86dd2a8 100644
 --- a/testcases/kernel/controllers/cpuset/Makefile.inc
 +++ b/testcases/kernel/controllers/cpuset/Makefile.inc
 @@ -42,6 +42,9 @@ MAKE_DEPS		:= $(LIBCONTROLLERS) $(LIBCPUSET)
@@ -42,5 +43,5 @@ index 9e002f4..e0fcb9c 100644
  INSTALL_TARGETS		?= *.sh
  
 -- 
-2.7.0
+2.7.4
 
diff --git a/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
new file mode 100644
index 0000000..c0f69ec
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
@@ -0,0 +1,58 @@
+From 29ce9fdab3bd34e69d73b5b890795559c06553f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jan 2016 19:40:08 +0000
+Subject: [PATCH] Check if __GLIBC_PREREQ is defined before using it
+
+__GLIBC_PREREQ is specific to glibc so it should be checked if it is
+defined or not.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ testcases/kernel/syscalls/accept4/accept4_01.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
+index dd289cf..76aa969 100644
+--- a/testcases/kernel/syscalls/accept4/accept4_01.c
++++ b/testcases/kernel/syscalls/accept4/accept4_01.c
+@@ -38,6 +38,7 @@
+ static struct sockaddr_in conn_addr;
+ static int listening_fd;
+ 
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if !(__GLIBC_PREREQ(2, 10))
+ static int
+ accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
+@@ -56,6 +57,7 @@ accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
+ #endif
+ }
+ #endif
++#endif
+ 
+ static int create_listening_socket(void)
+ {
+@@ -115,6 +117,7 @@ static void verify_accept4(unsigned int nr)
+ 	SAFE_CONNECT(connfd, (struct sockaddr *)&conn_addr, sizeof(conn_addr));
+ 	addrlen = sizeof(claddr);
+ 
++#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
+ #if !(__GLIBC_PREREQ(2, 10))
+ 	TEST(accept4_01(listening_fd, (struct sockaddr *)&claddr, &addrlen,
+ 				tcase->cloexec | tcase->nonblock));
+@@ -122,6 +125,10 @@ static void verify_accept4(unsigned int nr)
+ 	TEST(accept4(listening_fd, (struct sockaddr *)&claddr, &addrlen,
+ 				tcase->cloexec | tcase->nonblock));
+ #endif
++#else
++	TEST(accept4(listening_fd, (struct sockaddr *)&claddr, &addrlen,
++				tcase->cloexec | tcase->nonblock));
++#endif
+ 	if (TST_RET == -1) {
+ 		if (TST_ERR == ENOSYS)
+ 			tst_brk(TCONF, "syscall __NR_accept4 not supported");
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
similarity index 87%
rename from meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch
rename to meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
index a79763d..5622a64 100644
--- a/meta/recipes-extended/ltp/ltp/0018-guard-mallocopt-with-__GLIBC__.patch
+++ b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch
@@ -1,12 +1,13 @@
-From f42b060e80c9f40627c712d4d56d45221bd7d9fa Mon Sep 17 00:00:00 2001
+From d0fc9ca5d3366f9b8907e463222403cd2327be10 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 8 Jan 2016 06:51:20 +0000
-Subject: [PATCH 18/32] guard mallocopt() with __GLIBC__
+Subject: [PATCH] guard mallocopt() with __GLIBC__
 
 mallocopt is not available on non glibc implementations
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -29,5 +30,5 @@ index 5bb8eff..934d951 100644
  		fprintf(stderr, "Chunk size %u smaller than record size %u\n",
  			chunk_size, record_size);
 -- 
-2.7.0
+2.7.4
 
diff --git a/meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch b/meta/recipes-extended/ltp/ltp/0005-getdents-define-getdents-getdents64-only-for-glibc.patch
similarity index 87%
rename from meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch
rename to meta/recipes-extended/ltp/ltp/0005-getdents-define-getdents-getdents64-only-for-glibc.patch
index 7060a64..d1f7b07 100644
--- a/meta/recipes-extended/ltp/ltp/0020-getdents-define-getdents-getdents64-only-for-glibc.patch
+++ b/meta/recipes-extended/ltp/ltp/0005-getdents-define-getdents-getdents64-only-for-glibc.patch
@@ -1,20 +1,20 @@
-From aa3568e6ac28f377e75ce16b11e3c7738a373e53 Mon Sep 17 00:00:00 2001
+From b996b2480fe3a800ffbdc4a0fdc5e8775c575449 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 8 Jan 2016 06:57:04 +0000
-Subject: [PATCH 20/32] getdents: define getdents/getdents64 only for glibc
+Subject: [PATCH] getdents: define getdents/getdents64 only for glibc
 
 getdents/getdents64 are implemented in musl and when we define static
 functions with same name, it errors out.
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  testcases/kernel/syscalls/getdents/getdents.h | 6 ++++--
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/testcases/kernel/syscalls/getdents/getdents.h b/testcases/kernel/syscalls/getdents/getdents.h
-index abea655..db63d89 100644
+index 702b0bd..860b22e 100644
 --- a/testcases/kernel/syscalls/getdents/getdents.h
 +++ b/testcases/kernel/syscalls/getdents/getdents.h
 @@ -34,12 +34,13 @@ struct linux_dirent {
@@ -46,5 +46,5 @@ index abea655..db63d89 100644
 +#endif
  #endif /* GETDENTS_H */
 -- 
-2.7.0
+2.7.4
 
diff --git a/meta/recipes-extended/ltp/ltp/0006-rt_tgsigqueueinfo-disable-test-on-musl.patch b/meta/recipes-extended/ltp/ltp/0006-rt_tgsigqueueinfo-disable-test-on-musl.patch
new file mode 100644
index 0000000..804edfa
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0006-rt_tgsigqueueinfo-disable-test-on-musl.patch
@@ -0,0 +1,35 @@
+From 60054686e2c1a4bedf1d507af97ebbb7ff491e77 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 18 Jul 2019 15:23:15 +0800
+Subject: [PATCH] rt_tgsigqueueinfo: disable test on musl
+
+Fix build error with musl:
+rt_tgsigqueueinfo01.c: In function 'sigusr1_handler':
+rt_tgsigqueueinfo01.c:42:22: error: 'siginfo_t' {aka 'struct <anonymous>'} has no member named '_sifields'; did you mean '__si_fields'?
+   42 |  sigval_rcv = uinfo->_sifields._rt.SI_SIGVAL.sival_ptr;
+      |                      ^~~~~~~~~
+      |                      __si_fields
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ testcases/kernel/syscalls/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
+index d1becd0..1f3ff34 100644
+--- a/testcases/kernel/syscalls/Makefile
++++ b/testcases/kernel/syscalls/Makefile
+@@ -31,7 +31,7 @@ endif
+ ifeq ($(LIBC),musl)
+ FILTER_OUT_DIRS	+= confstr fmtmsg getcontext ioctl mallopt profil \
+ 		   rt_sigsuspend setdomainname sethostname sigsuspend \
+-		   ustat
++		   ustat rt_tgsigqueueinfo
+ endif
+ 
+ ifeq ($(UCLIBC),1)
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch b/meta/recipes-extended/ltp/ltp/0007-Fix-test_proc_kill-hanging.patch
similarity index 86%
rename from meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
rename to meta/recipes-extended/ltp/ltp/0007-Fix-test_proc_kill-hanging.patch
index 665da3b..0e72645 100644
--- a/meta/recipes-extended/ltp/ltp/0035-fix-test_proc_kill-hang.patch
+++ b/meta/recipes-extended/ltp/ltp/0007-Fix-test_proc_kill-hanging.patch
@@ -1,22 +1,22 @@
-From f7c602b639db0d118e07d3fa7b6deead0be0c72b Mon Sep 17 00:00:00 2001
+From f4fafbdffae3a63c81f65cef98c72dda26283e06 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Wed, 8 Feb 2017 16:17:17 +0800
-Subject: [PATCH 3/5] Fix test_proc_kill hanging
+Subject: [PATCH] Fix test_proc_kill hanging
 
 Sometimes the signal is delivered to memcg_process before the framework took
 into consideration its pid entered in the tasks. Fixed by delaying the signal
 send command.
 
+Upstream-Status: Pending
+
 Signed-off-by: George Nita <george.nita@enea.com>
 Signed-off-by: Dengke Du <dengke.du@windriver.com>
-
-Upstream-Status: Pending
 ---
  testcases/kernel/controllers/memcg/functional/memcg_lib.sh | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
-index b785fe3..2918cc5 100755
+index aadaae4..deea5d6 100755
 --- a/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
 +++ b/testcases/kernel/controllers/memcg/functional/memcg_lib.sh
 @@ -291,6 +291,7 @@ test_proc_kill()
diff --git a/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch b/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
deleted file mode 100644
index 6e6dbf3..0000000
--- a/meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d1a27570457fb6e1d6bafe81bfa0f3507b137e32 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Thu, 9 Feb 2017 18:20:58 +0800
-Subject: [PATCH] fix __WORDSIZE undeclared when building with musl
-
-fix __WORDSIZE undeclared when building with musl.
-
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/177]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- include/old/test.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/include/old/test.h b/include/old/test.h
-index b36764d83..cc6f1b551 100644
---- a/include/old/test.h
-+++ b/include/old/test.h
-@@ -17,6 +17,9 @@
- #include <string.h>
- #include <stdlib.h>
- #include <stdint.h>
-+#ifndef __GLIBC__
-+#include <bits/reg.h>
-+#endif
- 
- #include "usctest.h"
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
deleted file mode 100644
index 7311ee2..0000000
--- a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
+++ /dev/null
@@ -1,151 +0,0 @@
-From fc2b47ad979a87bfbd11aeea3f67c26e7fb39e30 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 19:40:08 +0000
-Subject: [PATCH] Check if __GLIBC_PREREQ is defined before using it
-
-__GLIBC_PREREQ is specific to glibc so it should be checked if it is
-defined or not.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- .../kernel/syscalls/accept4/accept4_01.c      |  9 ++++++-
- .../sched_getaffinity/sched_getaffinity01.c   | 26 +++++++++++++++++++
- 2 files changed, 34 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
-index dec4ef93b..c5d74b07f 100644
---- a/testcases/kernel/syscalls/accept4/accept4_01.c
-+++ b/testcases/kernel/syscalls/accept4/accept4_01.c
-@@ -64,6 +64,7 @@ static void cleanup(void)
- 	tst_rmdir();
- }
- 
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if !(__GLIBC_PREREQ(2, 10))
- static int
- accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
-@@ -82,7 +83,6 @@ accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
- 	}
- 	tst_resm(TINFO, "\n");
- #endif
--
- #if USE_SOCKETCALL
- 	long args[6];
- 
-@@ -97,6 +97,7 @@ accept4_01(int fd, struct sockaddr *sockaddr, socklen_t *addrlen, int flags)
- #endif
- }
- #endif
-+#endif
- 
- static void
- do_test(int lfd, struct sockaddr_in *conn_addr,
-@@ -119,9 +120,15 @@ do_test(int lfd, struct sockaddr_in *conn_addr,
- 		die("Connect Error");
- 
- 	addrlen = sizeof(struct sockaddr_in);
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if !(__GLIBC_PREREQ(2, 10))
- 	acceptfd = accept4_01(lfd, (struct sockaddr *)&claddr, &addrlen,
- 			      closeonexec_flag | nonblock_flag);
-+
-+#else
-+	acceptfd = accept4(lfd, (struct sockaddr *)&claddr, &addrlen,
-+			   closeonexec_flag | nonblock_flag);
-+#endif
- #else
- 	acceptfd = accept4(lfd, (struct sockaddr *)&claddr, &addrlen,
- 			   closeonexec_flag | nonblock_flag);
-diff --git a/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c b/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
-index 02f04b909..d906d7e09 100644
---- a/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
-+++ b/testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c
-@@ -67,9 +67,11 @@ do { \
- 	tst_resm((TEST_RETURN == -1 ? TPASS : TFAIL) | TTERRNO, #t); \
- } while (0)
- 
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if !(__GLIBC_PREREQ(2, 7))
- #define CPU_FREE(ptr)	free(ptr)
- #endif
-+#endif
- 
- int main(int ac, char **av)
- {
-@@ -96,17 +98,26 @@ static void do_test(void)
- 	pid_t unused_pid;
- 	unsigned len;
- 
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if __GLIBC_PREREQ(2, 7)
- realloc:
- 	mask = CPU_ALLOC(nrcpus);
-+#else
-+	mask = malloc(sizeof(cpu_set_t));
-+#endif
- #else
- 	mask = malloc(sizeof(cpu_set_t));
- #endif
- 	if (mask == NULL)
- 		tst_brkm(TFAIL | TTERRNO, cleanup, "fail to get enough memory");
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if __GLIBC_PREREQ(2, 7)
- 	len = CPU_ALLOC_SIZE(nrcpus);
- 	CPU_ZERO_S(len, mask);
-+#else
-+	len = sizeof(cpu_set_t);
-+	CPU_ZERO(mask);
-+#endif
- #else
- 	len = sizeof(cpu_set_t);
- 	CPU_ZERO(mask);
-@@ -115,11 +126,18 @@ realloc:
- 	TEST(sched_getaffinity(0, len, mask));
- 	if (TEST_RETURN == -1) {
- 		CPU_FREE(mask);
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if __GLIBC_PREREQ(2, 7)
- 		if (errno == EINVAL && nrcpus < (1024 << 8)) {
- 			nrcpus = nrcpus << 2;
- 			goto realloc;
- 		}
-+#else
-+		if (errno == EINVAL)
-+			tst_resm(TFAIL, "NR_CPUS > 1024, we'd better use a "
-+				 "newer glibc(>= 2.7)");
-+		else
-+#endif
- #else
- 		if (errno == EINVAL)
- 			tst_resm(TFAIL, "NR_CPUS > 1024, we'd better use a "
-@@ -132,8 +150,12 @@ realloc:
- 		tst_resm(TINFO, "cpusetsize is %d", len);
- 		tst_resm(TINFO, "mask.__bits[0] = %lu ", mask->__bits[0]);
- 		for (i = 0; i < num; i++) {
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if __GLIBC_PREREQ(2, 7)
- 			TEST(CPU_ISSET_S(i, len, mask));
-+#else
-+			TEST(CPU_ISSET(i, mask));
-+#endif
- #else
- 			TEST(CPU_ISSET(i, mask));
- #endif
-@@ -144,8 +166,12 @@ realloc:
- 		}
- 	}
- 
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #if __GLIBC_PREREQ(2, 7)
- 	CPU_ZERO_S(len, mask);
-+#else
-+	CPU_ZERO(mask);
-+#endif
- #else
- 	CPU_ZERO(mask);
- #endif
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch b/meta/recipes-extended/ltp/ltp/0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
similarity index 89%
rename from meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
rename to meta/recipes-extended/ltp/ltp/0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
index e826d48..b46325e 100644
--- a/meta/recipes-extended/ltp/ltp/0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
+++ b/meta/recipes-extended/ltp/ltp/0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
@@ -1,8 +1,8 @@
-From 672a56be14426eae44864673c6c2afca0ab89d46 Mon Sep 17 00:00:00 2001
+From aa7a9185a037ad59012bd46713ac340458e95209 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
 Date: Fri, 13 May 2016 11:11:28 -0500
-Subject: [PATCH] testcases/network/nfsv4/acl/acl1.c: Security fix on string
- printf
+Subject: [PATCH] testcases/network/nfsv4/acl/acl1.c: Security fix on
+ string printf
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -16,15 +16,15 @@ acl1.c:317:2: error: format not a string literal and no format arguments
 
 [YOCTO #9548]
 
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
 Upstream-Status: Pending
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 ---
  testcases/network/nfsv4/acl/acl1.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/testcases/network/nfsv4/acl/acl1.c b/testcases/network/nfsv4/acl/acl1.c
-index b8b67b4..7c7c506 100644
+index bdf0180..898b7ca 100644
 --- a/testcases/network/nfsv4/acl/acl1.c
 +++ b/testcases/network/nfsv4/acl/acl1.c
 @@ -303,7 +303,7 @@ void test_acl_default(char *dir, acl_t acl)
@@ -37,5 +37,5 @@ index b8b67b4..7c7c506 100644
  	system(cmd);
  	acl2 = acl_get_file(path, ACL_TYPE_ACCESS);
 -- 
-2.1.4
+2.7.4
 
diff --git a/meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch b/meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
deleted file mode 100644
index dd7d283..0000000
--- a/meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From bf5dd2932200e0199a38f3028d3bef2253f32e38 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Thu, 9 Feb 2017 17:17:37 +0800
-Subject: [PATCH] fix redefinition of 'struct msgbuf' error building with musl
-
-When building with musl the file "sys/msg.h" already contain 'struct msgbuf'
-
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/177]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
-index a757c0d18..e023114d2 100644
---- a/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
-+++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv08.c
-@@ -47,11 +47,13 @@ const char *TCID = "msgrcv08";
- const int TST_TOTAL = 1;
- 
- #if __WORDSIZE == 32
--
-+#ifdef __GLIBC__
- struct msgbuf {
- 	long mtype;     /* message type, must be > 0 */
- 	char mtext[16]; /* message data */
- };
-+#else
-+#endif
- 
- static void msr(int msqid)
- {
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch b/meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
similarity index 95%
rename from meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
rename to meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
index 8473605..d32ac1d 100644
--- a/meta/recipes-extended/ltp/ltp/0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
+++ b/meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
@@ -1,4 +1,4 @@
-From 85c972f730e8efe891a06ea3a2dfb5cbbdfbfbf4 Mon Sep 17 00:00:00 2001
+From a8715a1446305ffd76406f63c7f160c13a5b2e72 Mon Sep 17 00:00:00 2001
 From: "Hongzhi.Song" <hongzhi.song@windriver.com>
 Date: Wed, 10 Oct 2018 22:07:05 -0400
 Subject: [PATCH] open_posix_testsuite/mmap24-2: Relax condition a bit
@@ -23,7 +23,7 @@ Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
-index de51d43..810e5c8 100644
+index 9cf83d9..55090a6 100644
 --- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
 +++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
 @@ -7,7 +7,7 @@
@@ -64,5 +64,5 @@ index de51d43..810e5c8 100644
  	return PTS_FAIL;
  }
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta/recipes-extended/ltp/ltp/0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch b/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
similarity index 91%
rename from meta/recipes-extended/ltp/ltp/0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
rename to meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
index d837f07..8704e5f 100644
--- a/meta/recipes-extended/ltp/ltp/0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
+++ b/meta/recipes-extended/ltp/ltp/0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
@@ -1,4 +1,4 @@
-From db0a43d9388be2c347a8306751bbe6bec086d062 Mon Sep 17 00:00:00 2001
+From 794933b38354a2612cf2c471f11798b306f35315 Mon Sep 17 00:00:00 2001
 From: Jan Stancek <jstancek@redhat.com>
 Date: Mon, 20 May 2019 20:47:20 +0200
 Subject: [PATCH] shmctl01: don't use hardcoded index == 0 for SHM_STAT test
@@ -21,10 +21,11 @@ Signed-off-by: Jan Stancek <jstancek@redhat.com>
 Reviewed-by: Petr Vorel <pvorel@suse.cz>
 Acked-by: Cyril Hrubis <chrubis@suse.cz>
 
-Upstream-Status: Backport from v20190517
-[https://lists.linux.it/pipermail/ltp/2019-May/012051.html]
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/db0a43d9388be2c347a8306751bbe6bec086d062]
 
 Signed-off-by: Hongzhi Song <hongzhi.song@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  testcases/kernel/syscalls/ipc/shmctl/shmctl01.c | 21 ++++++++++++++++++---
  1 file changed, 18 insertions(+), 3 deletions(-)
@@ -77,5 +78,5 @@ index 1b46977..52bf23a 100644
  
  static void func_lock(int ret)
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta/recipes-extended/ltp/ltp/0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch b/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.patch
similarity index 50%
rename from meta/recipes-extended/ltp/ltp/0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch
rename to meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.patch
index 620027b..9cd188f 100644
--- a/meta/recipes-extended/ltp/ltp/0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch
+++ b/meta/recipes-extended/ltp/ltp/0011-direct_io-diotest4-drop-MAP_FIXED.patch
@@ -1,26 +1,33 @@
-From 785809201ad7dea2872d493efbfd65bb215710d6 Mon Sep 17 00:00:00 2001
-From: "Hongzhi.Song" <hongzhi.song@windriver.com>
-Date: Sun, 30 Jun 2019 21:56:16 -0400
-Subject: [PATCH] diotest4: Let kernel pick an address when calling mmap
+From f210d7e19b721041f31b7f258a169f89dc850303 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Thu, 4 Jul 2019 16:45:23 +0200
+Subject: [PATCH] direct_io/diotest4: drop MAP_FIXED
 
-Error:
-diotest4 10 TBROK : diotest4.c:368: can't mmap file: Invalid argument
-diotest4 11 TBROK : diotest4.c:368: Remaining cases broken
+Hongzhi reports that this test is failing on mips64 with 5.1+:
+  diotest4 10 TBROK : diotest4.c:368: can't mmap file: Invalid argument
+  diotest4 11 TBROK : diotest4.c:368: Remaining cases broken
+I could reproduce it on emulated 5kc-malta, running 5.2.0-rc7.
 
-This is because the specified addr from mmap is invalid.
-We should let kernel itself pick an addrress.
+Test is trying to map into area immediately following heap as MAP_SHARED,
+but it used wrong alignment (fixed by 'lapi/mmap.h: include config.h').
 
+Usage of MAP_FIXED seems unnecessary, so drop that too and let the kernel
+pick an address.
+
+Reported-by: Hongzhi.Song <hongzhi.song@windriver.com>
 Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
 
-Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2019-June/012570.html]
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/f5444eeeabf252b8884b9465d277b6af853819e3]
 
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
  testcases/kernel/io/direct_io/diotest4.c | 8 ++------
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/testcases/kernel/io/direct_io/diotest4.c b/testcases/kernel/io/direct_io/diotest4.c
-index e4616e4..d88c431 100644
+index e4616e4..bf200cd 100644
 --- a/testcases/kernel/io/direct_io/diotest4.c
 +++ b/testcases/kernel/io/direct_io/diotest4.c
 @@ -352,18 +352,14 @@ int main(int argc, char *argv[])
@@ -39,11 +46,11 @@ index e4616e4..d88c431 100644
  	}
 -	shm_base = mmap(shm_base, 0x100000, PROT_READ | PROT_WRITE,
 -			MAP_SHARED | MAP_FIXED, fd, 0);
-+	shm_base = mmap(NULL, 0x100000, PROT_READ | PROT_WRITE,
++	shm_base = mmap(0, 0x100000, PROT_READ | PROT_WRITE,
 +			MAP_SHARED, fd, 0);
  	if (shm_base == (caddr_t) - 1) {
  		tst_brkm(TBROK, cleanup, "can't mmap file: %s",
  			 strerror(errno));
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch b/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
similarity index 90%
rename from meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
rename to meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
index 7b66229..aecbc80 100644
--- a/meta/recipes-extended/ltp/ltp/0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
+++ b/meta/recipes-extended/ltp/ltp/0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch
@@ -1,4 +1,4 @@
-From e79652a3839869b1983d65999e5d5dcb50bc9cd7 Mon Sep 17 00:00:00 2001
+From 4ac747c1f7ff8e2ec2567d6672822e95a9b56e55 Mon Sep 17 00:00:00 2001
 From: "Hongzhi.Song" <hongzhi.song@windriver.com>
 Date: Mon, 15 Jul 2019 03:39:06 -0400
 Subject: [PATCH] getrlimit03: adjust a bit of code to compatiable with mips32
@@ -26,13 +26,15 @@ Signed-off-by: Jan Stancek <jstancek@redhat.com>
 Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 
 Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/7a3bca63cd7f059d490b6274f0fdf3247be93fde]
+
 Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
 ---
  testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
-index e4d56c4..03bd821 100644
+index e4d56c4..319bc49 100644
 --- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
 +++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
 @@ -26,6 +26,7 @@
@@ -58,5 +60,5 @@ index e4d56c4..03bd821 100644
  static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
  {
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch b/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
deleted file mode 100644
index 6c5f360..0000000
--- a/meta/recipes-extended/ltp/ltp/0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From b216435bb362df10c45f544b78d8c884eaa901fd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:01:02 +0000
-Subject: [PATCH 21/32] Define _GNU_SOURCE for MREMAP_MAYMOVE definition
-
-musl guards MREMAP_MAYMOVE with _GNU_SOURCE unlike glibc which uses
-__USE_GNU
-
-Fixes errors like
-error: 'MREMAP_MAYMOVE' undeclared (first use in this function)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- testcases/kernel/syscalls/mremap/mremap01.c | 4 +++-
- testcases/kernel/syscalls/mremap/mremap02.c | 2 ++
- testcases/kernel/syscalls/mremap/mremap03.c | 2 ++
- 3 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/mremap/mremap01.c b/testcases/kernel/syscalls/mremap/mremap01.c
-index d63d1e4..24ca174 100644
---- a/testcases/kernel/syscalls/mremap/mremap01.c
-+++ b/testcases/kernel/syscalls/mremap/mremap01.c
-@@ -76,10 +76,12 @@
-  */
- #include <unistd.h>
- #include <errno.h>
-+#include <fcntl.h>
-+#define _GNU_SOURCE
- #define __USE_GNU
- #include <sys/mman.h>
- #undef __USE_GNU
--#include <fcntl.h>
-+#undef _GNU_SOURCE
- 
- #include "test.h"
- #include "safe_macros.h"
-diff --git a/testcases/kernel/syscalls/mremap/mremap02.c b/testcases/kernel/syscalls/mremap/mremap02.c
-index 5a51b9a..a530a6b 100644
---- a/testcases/kernel/syscalls/mremap/mremap02.c
-+++ b/testcases/kernel/syscalls/mremap/mremap02.c
-@@ -75,9 +75,11 @@
- #include <errno.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#define _GNU_SOURCE
- #define __USE_GNU
- #include <sys/mman.h>
- #undef __USE_GNU
-+#undef _GNU_SOURCE
- 
- #include "test.h"
- 
-diff --git a/testcases/kernel/syscalls/mremap/mremap03.c b/testcases/kernel/syscalls/mremap/mremap03.c
-index 12e3829..9b39f8b 100644
---- a/testcases/kernel/syscalls/mremap/mremap03.c
-+++ b/testcases/kernel/syscalls/mremap/mremap03.c
-@@ -76,9 +76,11 @@
- #include <errno.h>
- #include <unistd.h>
- #include <fcntl.h>
-+#define _GNU_SOURCE
- #define __USE_GNU
- #include <sys/mman.h>
- #undef __USE_GNU
-+#undef _GNU_SOURCE
- 
- #include "test.h"
- 
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch b/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
deleted file mode 100644
index 529f4ed..0000000
--- a/meta/recipes-extended/ltp/ltp/0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 560347f77236616a635b4a997a0596b8da4d0799 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:08:25 +0000
-Subject: [PATCH 23/32] ptrace:  Use int instead of enum __ptrace_request
-
-__ptrace_request is only available with glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- testcases/kernel/syscalls/ptrace/ptrace03.c           | 4 ++++
- testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h | 4 ++++
- 2 files changed, 8 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/ptrace/ptrace03.c b/testcases/kernel/syscalls/ptrace/ptrace03.c
-index a4028fc..f1880cd 100644
---- a/testcases/kernel/syscalls/ptrace/ptrace03.c
-+++ b/testcases/kernel/syscalls/ptrace/ptrace03.c
-@@ -102,7 +102,11 @@ static pid_t unused_pid;
- static pid_t zero_pid;
- 
- struct test_case_t {
-+#ifdef __GLIBC__
- 	enum __ptrace_request request;
-+#else
-+	int request;
-+#endif
- 	pid_t *pid;
- 	int exp_errno;
- } test_cases[] = {
-diff --git a/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h b/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h
-index ae538e9..85aa89d 100644
---- a/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h
-+++ b/testcases/kernel/syscalls/ptrace/spawn_ptrace_child.h
-@@ -130,7 +130,11 @@ static char *strings[] = {
- 	SPT(KILL)
- 	SPT(SINGLESTEP)
- };
-+#ifdef __GLIBC__
- static inline char *strptrace(enum __ptrace_request request)
-+#else
-+static inline char *strptrace(int request)
-+#endif
- {
- 	return strings[request];
- }
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch b/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
deleted file mode 100644
index 03aa45d..0000000
--- a/meta/recipes-extended/ltp/ltp/0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From e01e9862c248dc90a8ec6f2d06f8469d7a50cd8e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:14:58 +0000
-Subject: [PATCH 24/32] rt_sigaction/rt_sigprocmark: Define _GNU_SOURCE
-
-Fixes musl build failure e.g.
-error: 'SA_NOMASK' undeclared here (not in a function)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c     | 1 +
- testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c     | 2 +-
- testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c     | 1 +
- testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c | 1 +
- 4 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c
-index 5cf89cc..bdcb91a 100644
---- a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c
-+++ b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction01.c
-@@ -28,6 +28,7 @@
- /*		sigset_t type.                       			      */
- /******************************************************************************/
- 
-+#define _GNU_SOURCE
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
-diff --git a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c
-index a1da743..8a27a0f 100644
---- a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c
-+++ b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction02.c
-@@ -23,7 +23,7 @@
- /* Description: This tests the rt_sigaction() syscall                         */
- /*		rt_sigaction Expected EFAULT error check                      */
- /******************************************************************************/
--
-+#define _GNU_SOURCE
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
-diff --git a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c
-index 175d220..e7627cd 100644
---- a/testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c
-+++ b/testcases/kernel/syscalls/rt_sigaction/rt_sigaction03.c
-@@ -24,6 +24,7 @@
- /*		rt_sigaction Expected EINVAL error check                      */
- /******************************************************************************/
- 
-+#define _GNU_SOURCE
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
-diff --git a/testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c b/testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c
-index 74e5a61..75c57fc 100644
---- a/testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c
-+++ b/testcases/kernel/syscalls/rt_sigprocmask/rt_sigprocmask01.c
-@@ -39,6 +39,7 @@
- /*		    sigsetsize should indicate the size of a sigset_t type.   */
- /******************************************************************************/
- 
-+#define _GNU_SOURCE
- #include <stdio.h>
- #include <signal.h>
- #include <errno.h>
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch b/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
deleted file mode 100644
index f65fad1..0000000
--- a/meta/recipes-extended/ltp/ltp/0026-crash01-Define-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0133a2b29d6f48d8e2bba6a3be581cdfa91311a6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:21:05 +0000
-Subject: [PATCH 26/32] crash01: Define _GNU_SOURCE
-
-Fixes musl build errors like
-error: 'SA_NOMASK' undeclared (first use in this function)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- testcases/misc/crash/crash01.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/misc/crash/crash01.c b/testcases/misc/crash/crash01.c
-index 0574521..08a02e7 100644
---- a/testcases/misc/crash/crash01.c
-+++ b/testcases/misc/crash/crash01.c
-@@ -49,7 +49,7 @@ stress test at the same time you run other tests, like a multi-user
- benchmark.
- 
- */
--
-+#define _GNU_SOURCE
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.7.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch b/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
deleted file mode 100644
index 40ee894..0000000
--- a/meta/recipes-extended/ltp/ltp/0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 94557fb7e1293c61145c959b8c5ffecf4a2b1069 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 8 Jan 2016 07:24:44 +0000
-Subject: [PATCH 28/32] rt_sigaction.h: Use sighandler_t instead of
- __sighandler_t
-
-When _GNU_SOURCE is used then both typedefs are same and using
-sighandler_t makes it work on musl too
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- include/lapi/rt_sigaction.h                      | 4 ++--
- testcases/kernel/syscalls/rt_sigsuspend/Makefile | 3 +++
- 2 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/include/lapi/rt_sigaction.h b/include/lapi/rt_sigaction.h
-index 18236db..15facda 100644
---- a/include/lapi/rt_sigaction.h
-+++ b/include/lapi/rt_sigaction.h
-@@ -36,12 +36,12 @@
- #if defined(__mips__)
- struct kernel_sigaction {
- 	unsigned int sa_flags;
--	__sighandler_t k_sa_handler;
-+	sighandler_t k_sa_handler;
- 	sigset_t sa_mask;
- };
- #else
- struct kernel_sigaction {
--	__sighandler_t k_sa_handler;
-+	sighandler_t k_sa_handler;
- 	unsigned long sa_flags;
- 	void (*sa_restorer) (void);
- 	sigset_t sa_mask;
-diff --git a/testcases/kernel/syscalls/rt_sigsuspend/Makefile b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
-index 37bc3a9..2ca7f7c 100644
---- a/testcases/kernel/syscalls/rt_sigsuspend/Makefile
-+++ b/testcases/kernel/syscalls/rt_sigsuspend/Makefile
-@@ -19,4 +19,7 @@
- top_srcdir		?= ../../../..
- 
- include $(top_srcdir)/include/mk/testcases.mk
-+
-+CFLAGS	+= -D_GNU_SOURCE
-+
- include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch b/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
deleted file mode 100644
index c2ef899..0000000
--- a/meta/recipes-extended/ltp/ltp/0034-periodic_output.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 5a77e2bdc083f4f842a8ba7c2db1a7ac6e5f0664 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Wed, 31 May 2017 21:26:05 -0400
-Subject: [PATCH] Add periodic output for long time test.
-
-This is needed in context of having scripts running ltp tests and
-waiting with a timeout for the output of the tests.
-
-Signed-off-by: Tudor Florea <tudor.florea@enea.com>
-Upstream-Status: Pending
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- .../kernel/controllers/memcg/stress/memcg_stress_test.sh      | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
-index af1a708..084e628 100755
---- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
-+++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
-@@ -37,7 +37,8 @@ if [ "x$(grep -w memory /proc/cgroups | cut -f4)" != "x1" ]; then
-         exit 0
- fi
- 
--RUN_TIME=$(( 15 * 60 ))
-+ONE_MINUTE=60
-+RUN_TIME=15
- 
- cleanup()
- {
-@@ -62,7 +63,7 @@ do_mount()
- # $1 - Number of cgroups
- # $2 - Allocated how much memory in one process? in MB
- # $3 - The interval to touch memory in a process
--# $4 - How long does this test run ? in second
-+# $4 - How long does this test run ? in minutes
- run_stress()
- {
- 	do_mount;
-@@ -81,7 +82,11 @@ run_stress()
- 		eval /bin/kill -s SIGUSR1 \$pid$i 2> /dev/null
- 	done
- 
--	sleep $4
-+	for i in $(seq 0 $(($4-1)))
-+	do
-+		eval echo "Started $i min ago. Still alive... "
-+		sleep $ONE_MINUTE
-+	done
- 
- 	for i in $(seq 0 $(($1-1)))
- 	do
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch b/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
deleted file mode 100644
index ec5e2ef..0000000
--- a/meta/recipes-extended/ltp/ltp/0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
+++ /dev/null
@@ -1,254 +0,0 @@
-From 04da9478887e705ea38e4f097492da20e651686c Mon Sep 17 00:00:00 2001
-From: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
-Date: Wed, 13 Sep 2017 15:48:42 +0800
-Subject: [PATCH] commands/ar01: Fix for test in deterministic mode
-
-If binutils was configured with --enable-deterministic-archives,
-ar will run in deterministic mode by default, and use zero for
-timestamps and uids/gids, which makes the test case abnormal.
-
-Fix this by add the "U" modifier when deterministic mode is default.
-
-Signed-off-by: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
-Signed-off-by: Fei Jie <feij.fnst@cn.fujitsu.com>
-
-Upstream-Status: Backport
-[http://lists.linux.it/pipermail/ltp/2017-September/005668.html]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- testcases/commands/ar/ar01 | 92 ++++++++++++++++++++++++++--------------------
- 1 file changed, 52 insertions(+), 40 deletions(-)
-
-diff --git a/testcases/commands/ar/ar01 b/testcases/commands/ar/ar01
-index be105f6da..813a51d9c 100644
---- a/testcases/commands/ar/ar01
-+++ b/testcases/commands/ar/ar01
-@@ -24,16 +24,28 @@
- #
- AR="${AR:=ar}"
- TST_CNT=17
-+TST_SETUP=setup
- TST_TESTFUNC=test
- TST_NEEDS_TMPDIR=1
- TST_NEEDS_CMDS="$AR"
- 
- . tst_test.sh
- 
-+setup()
-+{
-+	ar --help | grep "use zero for timestamps and uids/gids (default)" \
-+		>/dev/null
-+	if [ $? -eq 0 ]; then
-+		MOD="U"
-+	else
-+		MOD=""
-+	fi
-+}
-+
- test1()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
--	ROD ar -ra file1.in lib.a $TST_DATAROOT/file2.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
-+	ROD ar -ra"$MOD" file1.in lib.a $TST_DATAROOT/file2.in
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -50,9 +62,9 @@ test1()
- 
- test2()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
--		         $TST_DATAROOT/file3.in $TST_DATAROOT/file4.in
--	ROD ar -ma file1.in lib.a file4.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
-+			       $TST_DATAROOT/file3.in $TST_DATAROOT/file4.in
-+	ROD ar -ma"$MOD" file1.in lib.a file4.in
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file1.in\nfile4.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -69,8 +81,8 @@ test2()
- 
- test3()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
--	ROD ar -rb file3.in lib.a $TST_DATAROOT/file2.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
-+	ROD ar -rb"$MOD" file3.in lib.a $TST_DATAROOT/file2.in
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -87,9 +99,9 @@ test3()
- 
- test4()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
--	                 $TST_DATAROOT/file2.in
--	ROD ar -mb file3.in lib.a file2.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
-+			       $TST_DATAROOT/file2.in
-+	ROD ar -mb"$MOD" file3.in lib.a file2.in
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -106,7 +118,7 @@ test4()
- 
- test5()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in \> ar.out
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in \> ar.out
- 
- 	if [ -s ar.out ]; then
- 		tst_res TFAIL "ar produced output unexpectedly (-c)"
-@@ -120,7 +132,7 @@ test5()
- 
- test6()
- {
--	ROD ar -qc lib.a $TST_DATAROOT/file1.in \> ar.out
-+	ROD ar -qc"$MOD" lib.a $TST_DATAROOT/file1.in \> ar.out
- 
- 	if [ -s ar.out ]; then
- 		tst_res TFAIL "ar produced output unexpectedly (-qc)"
-@@ -134,9 +146,9 @@ test6()
- 
- test7()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
--	                 $TST_DATAROOT/file3.in
--	ROD ar -d lib.a file1.in file2.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
-+			       $TST_DATAROOT/file3.in
-+	ROD ar -d"$MOD" lib.a file1.in file2.in
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file3.in\n" > ar.exp
-@@ -153,9 +165,9 @@ test7()
- 
- test8()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
--	                 $TST_DATAROOT/file3.in
--	ROD ar -d lib.a
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
-+			       $TST_DATAROOT/file3.in
-+	ROD ar -d"$MOD" lib.a
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -172,8 +184,8 @@ test8()
- 
- test9()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
--	ROD ar -ri file3.in lib.a $TST_DATAROOT/file2.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in
-+	ROD ar -ri"$MOD" file3.in lib.a $TST_DATAROOT/file2.in
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -190,9 +202,9 @@ test9()
- 
- test10()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
--	                 $TST_DATAROOT/file2.in
--	ROD ar -mi file3.in lib.a file2.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
-+			       $TST_DATAROOT/file2.in
-+	ROD ar -mi"$MOD" file3.in lib.a file2.in
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -209,9 +221,9 @@ test10()
- 
- test11()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
--	                 $TST_DATAROOT/file2.in
--	ROD ar -m lib.a file3.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file3.in \
-+			       $TST_DATAROOT/file2.in
-+	ROD ar -m"$MOD" lib.a file3.in
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file1.in\nfile2.in\nfile3.in\n" > ar.exp
-@@ -228,9 +240,9 @@ test11()
- 
- test12()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
--	                 $TST_DATAROOT/file3.in
--	ROD ar -p lib.a \> ar.out
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
-+			       $TST_DATAROOT/file3.in
-+	ROD ar -p"$MOD" lib.a \> ar.out
- 
- 	printf "This is file one\nThis is file two\nThis is file three\n" > ar.exp
- 
-@@ -247,9 +259,9 @@ test12()
- test13()
- {
- 
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
--	                 $TST_DATAROOT/file3.in
--	ROD ar -q lib.a $TST_DATAROOT/file4.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
-+			       $TST_DATAROOT/file3.in
-+	ROD ar -q"$MOD" lib.a $TST_DATAROOT/file4.in
- 	ROD ar -t lib.a \> ar.out
- 
- 	printf "file1.in\nfile2.in\nfile3.in\nfile4.in\n" > ar.exp
-@@ -267,14 +279,14 @@ test13()
- test14()
- {
- 	ROD touch file0.in
--	ROD ar -cr lib.a file0.in $TST_DATAROOT/file1.in
-+	ROD ar -cr"$MOD" lib.a file0.in $TST_DATAROOT/file1.in
- 
- 	file0_mtime1=$(ar -tv lib.a | grep file0.in)
- 	file1_mtime1=$(ar -tv lib.a | grep file1.in)
- 
- 	touch -c -t $(date --date='next day' +"%Y%m%d%H%M") file0.in
- 
--	ROD ar -ru lib.a file0.in $TST_DATAROOT/file1.in
-+	ROD ar -ru"$MOD" lib.a file0.in $TST_DATAROOT/file1.in
- 
- 	file0_mtime2=$(ar -tv lib.a | grep file0.in)
- 	file1_mtime2=$(ar -tv lib.a | grep file1.in)
-@@ -296,7 +308,7 @@ test14()
- 
- test15()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in
- 	ROD ar -tv lib.a \> ar.out
- 
- 	if grep -q '[rwx-]\{9\} [0-9].*/[0-9].*\s*[0-9].*.*file1.in' ar.out; then
-@@ -311,9 +323,9 @@ test15()
- 
- test16()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
--	                 $TST_DATAROOT/file3.in
--	ROD ar -xv lib.a \> ar.out
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in \
-+			       $TST_DATAROOT/file3.in
-+	ROD ar -xv"$MOD" lib.a \> ar.out
- 
- 	printf "x - file1.in\nx - file2.in\nx - file3.in\n" > ar.exp
- 
-@@ -335,8 +347,8 @@ test16()
- 
- test17()
- {
--	ROD ar -cr lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in
--	ROD ar -xv lib.a file2.in \> ar.out
-+	ROD ar -cr"$MOD" lib.a $TST_DATAROOT/file1.in $TST_DATAROOT/file2.in
-+	ROD ar -xv"$MOD" lib.a file2.in \> ar.out
- 
- 	printf "x - file2.in\n" > ar.exp
- 
--- 
-2.19.0.rc2
-
diff --git a/meta/recipes-extended/ltp/ltp/define-sigrtmin-and-sigrtmax-for-musl.patch b/meta/recipes-extended/ltp/ltp/define-sigrtmin-and-sigrtmax-for-musl.patch
deleted file mode 100644
index c324463..0000000
--- a/meta/recipes-extended/ltp/ltp/define-sigrtmin-and-sigrtmax-for-musl.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 34b91edc70709f32b44f6b3a32c8f18db393e36c Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Wed, 20 Feb 2019 08:07:27 -0600
-Subject: [PATCH] Define __SIGRTMIN and __SIGRTMAX for MUSL
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Some libc implementations might differ in the definitions they
-include. Exempli gratia: MUSL does not define __SIGRTMAX nor
-__SIGRTMIN.
-
-These two tests fail to build because of the missing
-definitions:
-  testcases/kernel/syscalls/ptrace/ptrace05.c
-  testcases/kernel/syscalls/sighold/sighold02.c
-
-Out of precaution, these two also include this header:
-  lib/tst_sig.c
-  testcases/kernel/syscalls/rt_sigsuspend/rt_sigsuspend01.c
-
-Upstream-Status: Submitted [http://lists.linux.it/pipermail/ltp/2019-February/010916.html]
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
----
- include/lapi/signal.h                         | 24 +++++++++++++++++++
- lib/tst_sig.c                                 |  1 +
- testcases/kernel/syscalls/ptrace/ptrace05.c   |  1 +
- .../syscalls/rt_sigsuspend/rt_sigsuspend01.c  |  1 +
- testcases/kernel/syscalls/sighold/sighold02.c |  1 +
- 5 files changed, 28 insertions(+)
- create mode 100644 include/lapi/signal.h
-
-diff --git a/include/lapi/signal.h b/include/lapi/signal.h
-new file mode 100644
-index 000000000..d22965a94
---- /dev/null
-+++ b/include/lapi/signal.h
-@@ -0,0 +1,24 @@
-+// SPDX-License-Identifier: GPL-2.0-or-later
-+/*
-+ * Copyright (c) 2019 Linaro Limited. All rights reserved.
-+ * Author: Daniel Díaz <daniel.diaz@linaro.org>
-+ */
-+
-+#ifndef LAPI_SIGNAL_H
-+#define LAPI_SIGNAL_H
-+
-+#include <signal.h>
-+
-+/*
-+ * Some libc implementations might differ in the definitions they include. This
-+ * covers those differences for all tests to successfully build.
-+ */
-+
-+#ifndef __SIGRTMIN
-+# define __SIGRTMIN 32
-+#endif
-+#ifndef __SIGRTMAX
-+# define __SIGRTMAX (_NSIG - 1)
-+#endif
-+
-+#endif
-diff --git a/lib/tst_sig.c b/lib/tst_sig.c
-index 36565e13d..6d77aeafd 100644
---- a/lib/tst_sig.c
-+++ b/lib/tst_sig.c
-@@ -72,6 +72,7 @@
- #include <signal.h>
- #include <unistd.h>
- #include "test.h"
-+#include "lapi/signal.h"
- 
- #define MAXMESG 150		/* size of mesg string sent to tst_res */
- 
-diff --git a/testcases/kernel/syscalls/ptrace/ptrace05.c b/testcases/kernel/syscalls/ptrace/ptrace05.c
-index 420330029..54cfa4d7b 100644
---- a/testcases/kernel/syscalls/ptrace/ptrace05.c
-+++ b/testcases/kernel/syscalls/ptrace/ptrace05.c
-@@ -38,6 +38,7 @@
- #include "ptrace.h"
- 
- #include "test.h"
-+#include "lapi/signal.h"
- 
- char *TCID = "ptrace05";
- int TST_TOTAL = 0;
-diff --git a/testcases/kernel/syscalls/rt_sigsuspend/rt_sigsuspend01.c b/testcases/kernel/syscalls/rt_sigsuspend/rt_sigsuspend01.c
-index f17a9aae6..e577cf227 100644
---- a/testcases/kernel/syscalls/rt_sigsuspend/rt_sigsuspend01.c
-+++ b/testcases/kernel/syscalls/rt_sigsuspend/rt_sigsuspend01.c
-@@ -18,6 +18,7 @@
- #include "tst_test.h"
- #include "lapi/syscalls.h"
- #include "lapi/safe_rt_signal.h"
-+#include "lapi/signal.h"
- 
- static void sig_handler(int sig)
- {
-diff --git a/testcases/kernel/syscalls/sighold/sighold02.c b/testcases/kernel/syscalls/sighold/sighold02.c
-index d1d4b0b06..b763142df 100644
---- a/testcases/kernel/syscalls/sighold/sighold02.c
-+++ b/testcases/kernel/syscalls/sighold/sighold02.c
-@@ -49,6 +49,7 @@
- #include <sys/wait.h>
- #include "test.h"
- #include "safe_macros.h"
-+#include "lapi/signal.h"
- 
- /* _XOPEN_SOURCE disables NSIG */
- #ifndef NSIG
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/ltp/ltp/setregid01-security-string-formatting.patch b/meta/recipes-extended/ltp/ltp/setregid01-security-string-formatting.patch
deleted file mode 100644
index 2444914..0000000
--- a/meta/recipes-extended/ltp/ltp/setregid01-security-string-formatting.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 430e05c2169ed15aaa6d7f9459edd607603cee02 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
-Date: Mon, 25 Feb 2019 10:44:33 -0600
-Subject: [PATCH] setregid01: Fix security warning for string formatting
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-GCC 8.2.0 complains with the following:
-  setregid01.c: In function 'run':
-  setregid01.c:47:3: error: format not a string literal and no format arguments [-Werror=format-security]
-     tst_res(TFAIL | TTERRNO, tc->msg);
-     ^~~~~~~
-because there is no string formatting in the message. This can
-be seen with CFLAGS set to:
-  -Wformat -Wformat-security -Werror=format-security
-as Yocto Project's Poky does, e.g.:
-  http://errors.yoctoproject.org/Errors/Details/230043/
-
-Upstream-Status: Backport [46e1eda55f188810e6bf3a939b92d604321807ae]
-
-Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
-Reviewed-by: Enji Cooper <yaneurabeya@gmail.com>
----
- testcases/kernel/syscalls/setregid/setregid01.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/setregid/setregid01.c b/testcases/kernel/syscalls/setregid/setregid01.c
-index f2e41e134..8c9e11918 100644
---- a/testcases/kernel/syscalls/setregid/setregid01.c
-+++ b/testcases/kernel/syscalls/setregid/setregid01.c
-@@ -44,9 +44,9 @@ static void run(unsigned int n)
- 	TEST(SETREGID(*tc->arg1, *tc->arg2));
- 
- 	if (TST_RET == -1)
--		tst_res(TFAIL | TTERRNO, tc->msg);
-+		tst_res(TFAIL | TTERRNO, "%s", tc->msg);
- 	else
--		tst_res(TPASS, tc->msg);
-+		tst_res(TPASS, "%s", tc->msg);
- }
- 
- static void setup(void)
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/ltp/ltp_20190115.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
similarity index 72%
rename from meta/recipes-extended/ltp/ltp_20190115.bb
rename to meta/recipes-extended/ltp/ltp_20190517.bb
index f208b71..1f3a94b 100644
--- a/meta/recipes-extended/ltp/ltp_20190115.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -27,34 +27,21 @@ CFLAGS_append_x86-64 = " -fomit-frame-pointer"
 
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "a6a5caef13632e669dda27b0461726eba546a2f3"
+SRCREV = "ac33ef87f0b9dc56533026435be3ea8c67ce86d2"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-           file://0004-build-Add-option-to-select-libc-implementation.patch \
-           file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
-           file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch \
-           file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
-           file://0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch \
-           file://0018-guard-mallocopt-with-__GLIBC__.patch \
-           file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch \
-           file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch \
-           file://0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch \
-           file://0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch \
-           file://0026-crash01-Define-_GNU_SOURCE.patch \
-           file://0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch \
-           file://0034-periodic_output.patch \
-           file://0035-fix-test_proc_kill-hang.patch \
-           file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-           file://0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch \
-           file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
-           file://define-sigrtmin-and-sigrtmax-for-musl.patch \
-           file://setregid01-security-string-formatting.patch \
-           file://0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch \
-           file://0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch \
-           file://0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch \
-           file://0001-file01.sh-Fix-in-was-not-recognized.patch \
-           file://0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch \
-           file://0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch \
+           file://0001-build-Add-option-to-select-libc-implementation.patch \
+           file://0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
+           file://0003-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
+           file://0004-guard-mallocopt-with-__GLIBC__.patch \
+           file://0005-getdents-define-getdents-getdents64-only-for-glibc.patch \
+           file://0006-rt_tgsigqueueinfo-disable-test-on-musl.patch \
+           file://0007-Fix-test_proc_kill-hanging.patch \
+           file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
+           file://0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
+           file://0010-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch \
+           file://0011-direct_io-diotest4-drop-MAP_FIXED.patch \
+           file://0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


