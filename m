Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2850D78205
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 05:05:05 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 5163_4272_d407269a_b413_4e2c_b91f_c92a668ce7bc;
	Fri, 26 May 2017 14:05:01 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A08DAC0100
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 14:05:00 +0900 (JST)
Received: from g01jpexchyt35.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	35D6C46E7AC for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 14:04:54 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt35.g01.fujitsu.local (10.128.193.50) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 26 May 2017 14:04:53 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 May 2017 14:06:09 +0900
Message-ID: <1495775169-24954-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] elfutils: Upgrade 0.168 to 0.169
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
X-List-Received-Date: Fri, 26 May 2017 05:05:06 -0000
Content-Type: text/plain

1) Upgrade elfutils from 0.168 to 0.169
2) Delete unnecessary patches which has been merged into 0.169
3) Rebase the patch files for 0.169

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../elfutils-0.168/Fix_one_GCC7_warning.patch      | 44 --------------------
 .../elfutils/elfutils-0.168/aarch64_uio.patch      | 47 ----------------------
 ...de-alternatives-for-glibc-assumptions-hel.patch |  0
 ...m-Silence-Werror-maybe-uninitialized-fals.patch | 18 +++++----
 .../0001-fix-a-stack-usage-warning.patch           |  0
 .../0001-remove-the-unneed-checking.patch          |  0
 ...ferences-between-mips-machine-identifiers.patch |  0
 ...-support-for-mips64-abis-in-mips_retval.c.patch |  0
 .../0003-Add-mips-n64-relocation-format-hack.patch |  0
 .../debian/arm_backend.diff                        |  0
 .../debian/hppa_backend.diff                       |  0
 .../debian/hurd_path.patch                         |  0
 .../debian/ignore_strmerge.diff                    |  0
 .../debian/kfreebsd_path.patch                     |  0
 .../debian/mips_backend.diff                       |  0
 .../debian/mips_readelf_w.patch                    |  0
 .../debian/testsuite-ignore-elflint.diff           | 35 +++++++++++-----
 .../fallthrough.patch                              |  0
 .../fixheadercheck.patch                           |  0
 .../shadow.patch                                   |  0
 .../{elfutils_0.168.bb => elfutils_0.169.bb}       |  5 +--
 21 files changed, 39 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (75%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/0001-fix-a-stack-usage-warning.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/0003-Add-mips-n64-relocation-format-hack.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/hurd_path.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/ignore_strmerge.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/kfreebsd_path.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/mips_readelf_w.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/debian/testsuite-ignore-elflint.diff (48%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/fallthrough.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.168 => elfutils-0.169}/shadow.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.168.bb => elfutils_0.169.bb} (94%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
deleted file mode 100644
index d88f4eb..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/Fix_one_GCC7_warning.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 93c51144c3f664d4e9709da75a1d0fa00ea0fe95 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Sun, 12 Feb 2017 21:51:34 +0100
-Subject: [PATCH] libasm: Fix one GCC7 -Wformat-truncation=2 warning.
-
-Make sure that if we have really lots of labels the tempsym doesn't get
-truncated because it is too small to hold the whole name.
-
-This doesn't enable -Wformat-truncation=2 or fix other "issues" pointed
-out by enabling this warning because there are currently some issues
-with it. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79448
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-
-Upstream-Status: Backport (https://sourceware.org/git/?p=elfutils.git;a=commit;h=93c51144c3f664d4e9709da75a1d0fa00ea0fe95)
-Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
-
----
- libasm/ChangeLog    | 6 +++++-
- libasm/asm_newsym.c | 6 ++++--
- 2 files changed, 9 insertions(+), 3 deletions(-)
-
-Index: elfutils-0.168/libasm/asm_newsym.c
-===================================================================
---- elfutils-0.168.orig/libasm/asm_newsym.c
-+++ elfutils-0.168/libasm/asm_newsym.c
-@@ -1,5 +1,5 @@
- /* Define new symbol for current position in given section.
--   Copyright (C) 2002, 2005, 2016 Red Hat, Inc.
-+   Copyright (C) 2002, 2005, 2016, 2017 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2002.
- 
-@@ -44,7 +44,9 @@ AsmSym_t *
- asm_newsym (AsmScn_t *asmscn, const char *name, GElf_Xword size,
- 	    int type, int binding)
- {
--#define TEMPSYMLEN 10
-+/* We don't really expect labels with many digits, but in theory it could
-+   be 10 digits (plus ".L" and a zero terminator).  */
-+#define TEMPSYMLEN 13
-   char tempsym[TEMPSYMLEN];
-   AsmSym_t *result;
- 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch
deleted file mode 100644
index 38dc57b..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Fix build on aarch64/musl
-
-Errors
-
-invalid operands to binary & (have 'long double' and 'unsigned int')
-
-error: redefinition
- of 'struct iovec'
- struct iovec { void *iov_base; size_t iov_len; };
-        ^
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: elfutils-0.163/backends/aarch64_initreg.c
-===================================================================
---- elfutils-0.163.orig/backends/aarch64_initreg.c
-+++ elfutils-0.163/backends/aarch64_initreg.c
-@@ -33,7 +33,7 @@
- #include "system.h"
- #include <assert.h>
- #ifdef __aarch64__
--# include <linux/uio.h>
-+# include <sys/uio.h>
- # include <sys/user.h>
- # include <sys/ptrace.h>
- /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.  */
-@@ -82,7 +82,7 @@ aarch64_set_initial_registers_tid (pid_t
- 
-   Dwarf_Word dwarf_fregs[32];
-   for (int r = 0; r < 32; r++)
--    dwarf_fregs[r] = fregs.vregs[r] & 0xFFFFFFFF;
-+    dwarf_fregs[r] = (unsigned int)fregs.vregs[r] & 0xFFFFFFFF;
- 
-   if (! setfunc (64, 32, dwarf_fregs, arg))
-     return false;
-Index: elfutils-0.163/backends/arm_initreg.c
-===================================================================
---- elfutils-0.163.orig/backends/arm_initreg.c
-+++ elfutils-0.163/backends/arm_initreg.c
-@@ -37,7 +37,7 @@
- #endif
- 
- #ifdef __aarch64__
--# include <linux/uio.h>
-+# include <sys/uio.h>
- # include <sys/user.h>
- # include <sys/ptrace.h>
- /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.  */
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
similarity index 75%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
index 3754c1c..053e3b8 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
+++ b/meta/recipes-devtools/elfutils/elfutils-0.169/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
@@ -1,25 +1,29 @@
-From 668accf322fd7185e273bfd50b84320e71d9de5a Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 10 Apr 2015 00:29:18 +0200
+From e27c0307e753cd18e28271d5be97908a23f9f568 Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Fri, 26 May 2017 13:35:16 +0900
 Subject: [PATCH] elf_getarsym: Silence -Werror=maybe-uninitialized false
  positive
 
 Upstream-Status: Pending
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Rebase on 0.169
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
 ---
  libelf/elf_getarsym.c | 9 +++++++--
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf_getarsym.c b/libelf/elf_getarsym.c
-index d0bb28a..08954d2 100644
+index 1f031fc..42ed0d1 100644
 --- a/libelf/elf_getarsym.c
 +++ b/libelf/elf_getarsym.c
-@@ -165,8 +165,13 @@ elf_getarsym (elf, ptr)
+@@ -166,8 +166,13 @@ elf_getarsym (Elf *elf, size_t *ptr)
        int w = index64_p ? 8 : 4;
  
        /* We have an archive.  The first word in there is the number of
 -	 entries in the table.  */
--      uint64_t n;
+-      uint64_t n = 0;
 +	 entries in the table.
 +	 Set to SIZE_MAX just to silence -Werror=maybe-uninitialized
 +	 elf_getarsym.c:290:9: error: 'n' may be used uninitialized in this function
@@ -31,5 +35,5 @@ index d0bb28a..08954d2 100644
        if (read_number_entries (&n, elf, &off, index64_p) < 0)
  	{
 -- 
-2.3.5
+1.9.1
 
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/0001-fix-a-stack-usage-warning.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/0001-fix-a-stack-usage-warning.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/0001-fix-a-stack-usage-warning.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-remove-the-unneed-checking.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/0001-remove-the-unneed-checking.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/0001-remove-the-unneed-checking.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/0001-remove-the-unneed-checking.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/0003-Add-mips-n64-relocation-format-hack.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/0003-Add-mips-n64-relocation-format-hack.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/0003-Add-mips-n64-relocation-format-hack.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/arm_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/arm_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/hppa_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/hppa_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/hurd_path.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/hurd_path.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/ignore_strmerge.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/ignore_strmerge.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/kfreebsd_path.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/kfreebsd_path.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/kfreebsd_path.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/mips_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/mips_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/mips_readelf_w.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/mips_readelf_w.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/testsuite-ignore-elflint.diff
similarity index 48%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.169/debian/testsuite-ignore-elflint.diff
index 3df3576..30937f5 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.168/debian/testsuite-ignore-elflint.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.169/debian/testsuite-ignore-elflint.diff
@@ -1,5 +1,9 @@
-On many architectures this test fails because binaries/libs produced by
-binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
+From 16744db558a7275e91a66cea6c99db0c5e5078a3 Mon Sep 17 00:00:00 2001
+From: Fan Xin <fan.xin@jp.fujitsu.com>
+Date: Fri, 26 May 2017 13:50:26 +0900
+Subject: [PATCH] On many architectures this test fails because binaries/libs
+ produced by binutils don't pass elflint. However elfutils shouldn't FTBFS
+ because of this.
 
 So we run the tests on all archs to see what breaks, but if it breaks we ignore
 the result (exitcode 77 means: this test was skipped).
@@ -7,21 +11,30 @@ the result (exitcode 77 means: this test was skipped).
 Upstream-Status: Backport [from debian]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
-Index: b/tests/run-elflint-self.sh
-===================================================================
+Rebase on 0.169
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+---
+ tests/run-elflint-self.sh |  2 +-
+ tests/test-subr.sh        | 16 ++++++++++++++++
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/tests/run-elflint-self.sh b/tests/run-elflint-self.sh
+index 58fa7d0..85d21a5 100755
 --- a/tests/run-elflint-self.sh
 +++ b/tests/run-elflint-self.sh
-@@ -18,4 +18,4 @@
+@@ -18,5 +18,5 @@
  
  . $srcdir/test-subr.sh
  
 -testrun_on_self ${abs_top_builddir}/src/elflint --quiet --gnu-ld
 +testrun_on_self_skip ${abs_top_builddir}/src/elflint --quiet --gnu-ld
-Index: b/tests/test-subr.sh
-===================================================================
+ testrun_on_self_compressed ${abs_top_builddir}/src/elflint --quiet --gnu-ld
+diff --git a/tests/test-subr.sh b/tests/test-subr.sh
+index a765db6..41c8319 100644
 --- a/tests/test-subr.sh
 +++ b/tests/test-subr.sh
-@@ -152,3 +152,18 @@ testrun_on_self_quiet()
+@@ -170,3 +170,19 @@ testrun_on_self_quiet()
    # Only exit if something failed
    if test $exit_status != 0; then exit $exit_status; fi
  }
@@ -33,10 +46,14 @@ Index: b/tests/test-subr.sh
 +
 +  for file in $self_test_files; do
 +      testrun $* $file \
-+	  || { echo "*** failure in $* $file"; exit_status=77; }
++         || { echo "*** failure in $* $file"; exit_status=77; }
 +  done
 +
 +  # Only exit if something failed
 +  if test $exit_status != 0; then exit $exit_status; fi
 +}
 +
++
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/fallthrough.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/fallthrough.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/fallthrough.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/fixheadercheck.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/fixheadercheck.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch b/meta/recipes-devtools/elfutils/elfutils-0.169/shadow.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.169/shadow.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.168.bb b/meta/recipes-devtools/elfutils/elfutils_0.169.bb
similarity index 94%
rename from meta/recipes-devtools/elfutils/elfutils_0.168.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.169.bb
index 3b8f2a3..46967f2 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.168.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.169.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
 SRC_URI = "ftp://sourceware.org/pub/elfutils/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "52adfa40758d0d39e5d5c57689bf38d6"
-SRC_URI[sha256sum] = "b88d07893ba1373c7dd69a7855974706d05377766568a7d9002706d5de72c276"
+SRC_URI[md5sum] = "1ce77c5315d6bba7d883c3c4f0c2697e"
+SRC_URI[sha256sum] = "9412fac7b30872b738bc1ed1ebcaed54493c26ef9a67887913498c17b10f3bc2"
 
 SRC_URI += "\
         file://dso-link-change.patch \
@@ -17,7 +17,6 @@ SRC_URI += "\
         file://0001-remove-the-unneed-checking.patch \
         file://0001-fix-a-stack-usage-warning.patch \
         file://aarch64_uio.patch \
-        file://Fix_one_GCC7_warning.patch \
         file://shadow.patch \
 "
 
-- 
1.9.1


