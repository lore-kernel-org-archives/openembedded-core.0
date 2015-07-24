Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id C149C60962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 20:11:34 +0000 (UTC)
Received: by igk11 with SMTP id 11so14422861igk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 13:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rKjgF/fszOsJKLzHq85P9IyG2hhJywFfwFJUqa4lNIM=;
	b=OZcaqb3UnrAgHwfNj/KMo4p4VCnWkqOb/V2wGsukq6QHOm8GEYrqj+6EfpNsmb/M7C
	jH1OefMLTyEy1VM/qfW3c7Gp72OtJ5euQzlLjZBW4WFcIZ+v+VDFugwBVZQQGz4c/Uwx
	Pic7cy5Pbi5t58Z8UR19c4slMozXoU8uVJfmmDogt0p7Y+TEF4KIaeIcfV8qov5c2C3G
	p3mgm/RMUoH8ArabCs9Pw9Gia+A7estk7qwPuMegGB04q0l5NwT9oe+Ojjzx4PSKHxlN
	8ZfjllFjC74G1pp/syUnXrZikjLEiWVyQadac/AUPDAOC7KJlpZzfP9rJeCvkvwOJY3+
	bP1g==
X-Received: by 10.107.31.77 with SMTP id f74mr28275582iof.8.1437768694625;
	Fri, 24 Jul 2015 13:11:34 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id i75sm5854449iod.0.2015.07.24.13.11.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 13:11:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 13:11:28 -0700
Message-Id: <1437768688-7914-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gcc5: Upgrade from 5.1 to 5.2
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
X-List-Received-Date: Fri, 24 Jul 2015 20:11:37 -0000

This is second bugfix release in gcc5 series
All backported patches are dropped
no other patches needed any rework

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gcc/gcc-5.1/backport/0001-PR65801.patch        | 89 ----------------------
 .../gcc/gcc-5.1/backport/0002-PR65858.patch        | 63 ---------------
 .../gcc/gcc-5.1/backport/0003-PR66007.patch        | 73 ------------------
 .../gcc/{gcc-5.1.inc => gcc-5.2.inc}               | 17 ++---
 .../0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch     |  0
 .../{gcc-5.1 => gcc-5.2}/0002-uclibc-conf.patch    |  0
 .../0003-gcc-uclibc-locale-ctype_touplow_t.patch   |  0
 .../{gcc-5.1 => gcc-5.2}/0004-uclibc-locale.patch  |  0
 .../0005-uclibc-locale-no__x.patch                 |  0
 .../0006-uclibc-locale-wchar_fix.patch             |  0
 .../0007-uclibc-locale-update.patch                |  0
 .../0008-missing-execinfo_h.patch                  |  0
 .../{gcc-5.1 => gcc-5.2}/0009-c99-snprintf.patch   |  0
 .../0010-gcc-poison-system-directories.patch       |  0
 .../0011-gcc-poison-dir-extend.patch               |  0
 .../0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch |  0
 .../0013-64-bit-multilib-hack.patch                |  0
 .../0014-optional-libstdc.patch                    |  0
 ...0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch |  0
 .../0016-COLLECT_GCC_OPTIONS.patch                 |  0
 ...efaults.h-in-B-instead-of-S-and-t-oe-in-B.patch |  0
 .../0018-fortran-cross-compile-hack.patch          |  0
 .../0019-libgcc-sjlj-check.patch                   |  0
 .../0020-cpp-honor-sysroot.patch                   |  0
 .../0021-MIPS64-Default-to-N64-ABI.patch           |  0
 ...C_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  0
 ...0023-gcc-Fix-argument-list-too-long-error.patch |  0
 .../{gcc-5.1 => gcc-5.2}/0024-Disable-sdt.patch    |  0
 .../gcc/{gcc-5.1 => gcc-5.2}/0025-libtool.patch    |  0
 ...4-pass-fix-v4bx-to-linker-to-support-EABI.patch |  0
 ...tilib-config-files-from-B-instead-of-usin.patch |  0
 ...-libdir-from-.la-which-usually-points-to-.patch |  0
 .../gcc/{gcc-5.1 => gcc-5.2}/0029-export-CPP.patch |  0
 ...AltiVec-generation-on-powepc-linux-target.patch |  0
 ...-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch |  0
 ...Ensure-target-gcc-headers-can-be-included.patch |  0
 ...-t-build-with-disable-dependency-tracking.patch |  0
 ...h-host-directory-during-relink-if-inst_pr.patch |  0
 ...-link-the-plugins-with-libgomp-explicitly.patch |  0
 ...IBS_DIR-replacement-instead-of-hardcoding.patch |  0
 .../gcc/{gcc-5.1 => gcc-5.2}/0037-pr65779.patch    |  0
 .../0038-fix-g++-sysroot.patch                     |  0
 ...s-canadian_5.1.bb => gcc-cross-canadian_5.2.bb} |  0
 ...oss-initial_5.1.bb => gcc-cross-initial_5.2.bb} |  0
 .../gcc/{gcc-cross_5.1.bb => gcc-cross_5.2.bb}     |  0
 ...-initial_5.1.bb => gcc-crosssdk-initial_5.2.bb} |  0
 .../{gcc-crosssdk_5.1.bb => gcc-crosssdk_5.2.bb}   |  0
 .../gcc/{gcc-runtime_5.1.bb => gcc-runtime_5.2.bb} |  0
 ...gcc-sanitizers_5.1.bb => gcc-sanitizers_5.2.bb} |  0
 .../gcc/{gcc-source_5.1.bb => gcc-source_5.2.bb}   |  0
 .../gcc/{gcc_5.1.bb => gcc_5.2.bb}                 |  0
 ...libgcc-initial_5.1.bb => libgcc-initial_5.2.bb} |  0
 .../gcc/{libgcc_5.1.bb => libgcc_5.2.bb}           |  0
 .../gcc/{libgfortran_5.1.bb => libgfortran_5.2.bb} |  0
 54 files changed, 6 insertions(+), 236 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.1/backport/0001-PR65801.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.1/backport/0002-PR65858.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc-5.1/backport/0003-PR66007.patch
 rename meta/recipes-devtools/gcc/{gcc-5.1.inc => gcc-5.2.inc} (91%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0002-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0003-gcc-uclibc-locale-ctype_touplow_t.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0004-uclibc-locale.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0005-uclibc-locale-no__x.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0006-uclibc-locale-wchar_fix.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0007-uclibc-locale-update.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0008-missing-execinfo_h.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0009-c99-snprintf.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0010-gcc-poison-system-directories.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0011-gcc-poison-dir-extend.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0013-64-bit-multilib-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0014-optional-libstdc.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0016-COLLECT_GCC_OPTIONS.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0018-fortran-cross-compile-hack.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0019-libgcc-sjlj-check.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0020-cpp-honor-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0021-MIPS64-Default-to-N64-ABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0023-gcc-Fix-argument-list-too-long-error.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0024-Disable-sdt.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0025-libtool.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0029-export-CPP.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0032-Ensure-target-gcc-headers-can-be-included.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0037-pr65779.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-5.1 => gcc-5.2}/0038-fix-g++-sysroot.patch (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_5.1.bb => gcc-cross-canadian_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross-initial_5.1.bb => gcc-cross-initial_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_5.1.bb => gcc-cross_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk-initial_5.1.bb => gcc-crosssdk-initial_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_5.1.bb => gcc-crosssdk_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_5.1.bb => gcc-runtime_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_5.1.bb => gcc-sanitizers_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_5.1.bb => gcc-source_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_5.1.bb => gcc_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_5.1.bb => libgcc-initial_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_5.1.bb => libgcc_5.2.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_5.1.bb => libgfortran_5.2.bb} (100%)

diff --git a/meta/recipes-devtools/gcc/gcc-5.1/backport/0001-PR65801.patch b/meta/recipes-devtools/gcc/gcc-5.1/backport/0001-PR65801.patch
deleted file mode 100644
index 9474287..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.1/backport/0001-PR65801.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 346ee8b5c2bf3bf0f0e681b2df5755f299aa1a68 Mon Sep 17 00:00:00 2001
-From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Thu, 30 Apr 2015 16:31:36 +0000
-Subject: [PATCH] /cp 2015-04-30  Paolo Carlini  <paolo.carlini@oracle.com>
-
-	PR c++/65801
-	* typeck2.c (check_narrowing): In C++11 mode too, -Wno-narrowing
-	suppresses the diagnostic.
-
-2015-04-30  Paolo Carlini  <paolo.carlini@oracle.com>
-
-	PR c++/65801
-	* doc/invoke.texi ([-Wnarrowing]): Update.
-
-/testsuite
-2015-04-30  Paolo Carlini  <paolo.carlini@oracle.com>
-
-	PR c++/65801
-	* g++.dg/cpp0x/Wnarrowing2.C: New.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@222636 138bc75d-0d04-0410-961f-82ee72b054a4
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gcc/ChangeLog                            |  5 +++++
- gcc/cp/ChangeLog                         |  6 ++++++
- gcc/cp/typeck2.c                         | 10 +++++++---
- gcc/doc/invoke.texi                      |  8 ++++----
- gcc/testsuite/ChangeLog                  |  5 +++++
- gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C |  5 +++++
- 6 files changed, 32 insertions(+), 7 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C
-
-diff --git a/gcc/cp/typeck2.c b/gcc/cp/typeck2.c
-index 80a6939..884957b 100644
---- a/gcc/cp/typeck2.c
-+++ b/gcc/cp/typeck2.c
-@@ -957,9 +957,13 @@ check_narrowing (tree type, tree init, tsubst_flags_t complain)
- 	    }
- 	}
-       else if (complain & tf_error)
--	error_at (EXPR_LOC_OR_LOC (init, input_location),
--		  "narrowing conversion of %qE from %qT to %qT inside { }",
--		  init, ftype, type);
-+	{
-+	  global_dc->pedantic_errors = 1;
-+	  pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
-+		   "narrowing conversion of %qE from %qT to %qT inside { }",
-+		   init, ftype, type);
-+	  global_dc->pedantic_errors = flag_pedantic_errors;
-+	}
-     }
- 
-   return cxx_dialect == cxx98 || ok; 
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 520c2c5..4ef8f7f 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
-@@ -2703,10 +2703,10 @@ int i = @{ 2.2 @}; // error: narrowing from double to int
- 
- This flag is included in @option{-Wall} and @option{-Wc++11-compat}.
- 
--With @option{-std=c++11}, @option{-Wno-narrowing} suppresses for
--non-constants the diagnostic required by the standard.  Note that this
--does not affect the meaning of well-formed code; narrowing conversions
--are still considered ill-formed in SFINAE context.
-+With @option{-std=c++11}, @option{-Wno-narrowing} suppresses the diagnostic
-+required by the standard.  Note that this does not affect the meaning
-+of well-formed code; narrowing conversions are still considered
-+ill-formed in SFINAE context.
- 
- @item -Wnoexcept @r{(C++ and Objective-C++ only)}
- @opindex Wnoexcept
-diff --git a/gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C
-new file mode 100644
-index 0000000..fc806f9
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing2.C
-@@ -0,0 +1,5 @@
-+// PR c++/65801
-+// { dg-do compile { target c++11 } }
-+// { dg-options "-Wno-narrowing" }
-+
-+static struct zai { unsigned int x; } x = {-1};
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/backport/0002-PR65858.patch b/meta/recipes-devtools/gcc/gcc-5.1/backport/0002-PR65858.patch
deleted file mode 100644
index e7a4fd7..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.1/backport/0002-PR65858.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 82e461dc9d53927de7dae667880b63c2d497172d Mon Sep 17 00:00:00 2001
-From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Fri, 1 May 2015 18:47:55 +0000
-Subject: [PATCH] /cp 2015-05-01  Paolo Carlini  <paolo.carlini@oracle.com> 
-     Prathamesh Kulharni  <prathamesh.kulkarni@linaro.org>
-
-	PR c++/65858
-	* typeck2.c (check_narrowing): Set ok = true when pedwarn returns
-	false.
-
-/testsuite
-2015-05-01  Paolo Carlini  <paolo.carlini@oracle.com>
-	    Prathamesh Kulharni  <prathamesh.kulkarni@linaro.org>
-
-	PR c++/65858
-	* g++.dg/cpp0x/Wnarrowing3.C: New.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@222700 138bc75d-0d04-0410-961f-82ee72b054a4
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gcc/cp/ChangeLog                         | 7 +++++++
- gcc/cp/typeck2.c                         | 7 ++++---
- gcc/testsuite/ChangeLog                  | 6 ++++++
- gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C | 6 ++++++
- 4 files changed, 23 insertions(+), 3 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C
-
-diff --git a/gcc/cp/typeck2.c b/gcc/cp/typeck2.c
-index 884957b..9a491aa 100644
---- a/gcc/cp/typeck2.c
-+++ b/gcc/cp/typeck2.c
-@@ -959,9 +959,10 @@ check_narrowing (tree type, tree init, tsubst_flags_t complain)
-       else if (complain & tf_error)
- 	{
- 	  global_dc->pedantic_errors = 1;
--	  pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
--		   "narrowing conversion of %qE from %qT to %qT inside { }",
--		   init, ftype, type);
-+	  if (!pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
-+			"narrowing conversion of %qE from %qT to %qT "
-+			"inside { }", init, ftype, type))
-+	    ok = true;
- 	  global_dc->pedantic_errors = flag_pedantic_errors;
- 	}
-     }
-diff --git a/gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C
-new file mode 100644
-index 0000000..d2dd383
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing3.C
-@@ -0,0 +1,6 @@
-+// PR c++/65858
-+// { dg-do compile { target c++11 } }
-+// { dg-require-effective-target lto }
-+// { dg-options "-flto -Wno-narrowing" }
-+
-+int x { 0.5 };
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/backport/0003-PR66007.patch b/meta/recipes-devtools/gcc/gcc-5.1/backport/0003-PR66007.patch
deleted file mode 100644
index 7c1a19c..0000000
--- a/meta/recipes-devtools/gcc/gcc-5.1/backport/0003-PR66007.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 3b1253116b7cb98da33c997bffa5fa2616aee40a Mon Sep 17 00:00:00 2001
-From: paolo <paolo@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 4 May 2015 20:59:03 +0000
-Subject: [PATCH] /cp 2015-05-04  Paolo Carlini  <paolo.carlini@oracle.com> 
-     Jakub Jelinek  <jakub@redhat.com>
-
-	PR c++/66007
-	* typeck2.c (check_narrowing): Check by-hand that the pedwarn didn't
-	result in an actual error.
-
-/testsuite
-2015-05-04  Paolo Carlini  <paolo.carlini@oracle.com>
-	    Jakub Jelinek  <jakub@redhat.com>
-
-	PR c++/66007
-	* g++.dg/cpp0x/Wnarrowing4.C: New.
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@222779 138bc75d-0d04-0410-961f-82ee72b054a4
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gcc/cp/ChangeLog                         |  7 +++++++
- gcc/cp/typeck2.c                         |  8 +++++---
- gcc/testsuite/ChangeLog                  |  6 ++++++
- gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C | 14 ++++++++++++++
- 4 files changed, 32 insertions(+), 3 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C
-
-diff --git a/gcc/cp/typeck2.c b/gcc/cp/typeck2.c
-index 9a491aa..c0df823 100644
---- a/gcc/cp/typeck2.c
-+++ b/gcc/cp/typeck2.c
-@@ -958,10 +958,12 @@ check_narrowing (tree type, tree init, tsubst_flags_t complain)
- 	}
-       else if (complain & tf_error)
- 	{
-+	  int savederrorcount = errorcount;
- 	  global_dc->pedantic_errors = 1;
--	  if (!pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
--			"narrowing conversion of %qE from %qT to %qT "
--			"inside { }", init, ftype, type))
-+	  pedwarn (EXPR_LOC_OR_LOC (init, input_location), OPT_Wnarrowing,
-+		   "narrowing conversion of %qE from %qT to %qT "
-+		   "inside { }", init, ftype, type);
-+	  if (errorcount == savederrorcount)
- 	    ok = true;
- 	  global_dc->pedantic_errors = flag_pedantic_errors;
- 	}
-diff --git a/gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C
-new file mode 100644
-index 0000000..7defce3
---- /dev/null
-+++ b/gcc/testsuite/g++.dg/cpp0x/Wnarrowing4.C
-@@ -0,0 +1,14 @@
-+// PR c++/66007
-+// { dg-do run { target c++11 } }
-+// { dg-options "-Wno-error=narrowing" }
-+
-+extern "C" void abort();
-+
-+int main()
-+{
-+  unsigned foo[] = { 1, -1, 3 };
-+  if (foo[0] != 1 || foo[1] != __INT_MAX__ * 2U + 1 || foo[2] != 3)
-+    abort();
-+}
-+
-+// { dg-prune-output "narrowing conversion" }
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/gcc/gcc-5.1.inc b/meta/recipes-devtools/gcc/gcc-5.2.inc
similarity index 91%
rename from meta/recipes-devtools/gcc/gcc-5.1.inc
rename to meta/recipes-devtools/gcc/gcc-5.2.inc
index 811bd47..34606b9 100644
--- a/meta/recipes-devtools/gcc/gcc-5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
@@ -2,15 +2,15 @@ require gcc-common.inc
 
 # Third digit in PV should be incremented after a minor release
 
-PV = "5.1.0"
+PV = "5.2.0"
 
 #SNAP = "5-20150405"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-BINV = "5.1.0"
+BINV = "5.2.0"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-5.1:${FILE_DIRNAME}/gcc-5.1/backport:"
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc-5.2:${FILE_DIRNAME}/gcc-5.2/backport:"
 
 DEPENDS =+ "mpfr gmp libmpc zlib"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
@@ -26,9 +26,8 @@ LIC_FILES_CHKSUM = "\
 "
 #BASEURI = "http://www.netgull.com/gcc/snapshots/${SNAP}/gcc-${SNAP}.tar.bz2"
 BASEURI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "d5525b1127d07d215960e6051c5da35e"
-SRC_URI[sha256sum] = "b7dafdf89cbb0e20333dbf5b5349319ae06e3d1a30bf3515b5488f7e89dca5ad"
+SRC_URI[md5sum] = "a51bcfeb3da7dd4c623e27207ed43467"
+SRC_URI[sha256sum] = "5f835b04b5f7dd4f4d2dc96190ec1621b8d89f2dc6f638f9f8bc1b1014ba8cad"
 
 SRC_URI = "\
            ${BASEURI} \
@@ -73,11 +72,7 @@ SRC_URI = "\
            file://0038-fix-g++-sysroot.patch \
           "
 
-BACKPORTS = "\
-           file://0001-PR65801.patch \
-           file://0002-PR65858.patch \
-           file://0003-PR66007.patch \
-          "
+BACKPORTS = ""
 #S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${SNAP}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-5.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0002-uclibc-conf.patch b/meta/recipes-devtools/gcc/gcc-5.2/0002-uclibc-conf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0002-uclibc-conf.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0002-uclibc-conf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch b/meta/recipes-devtools/gcc/gcc-5.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0003-gcc-uclibc-locale-ctype_touplow_t.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0003-gcc-uclibc-locale-ctype_touplow_t.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0004-uclibc-locale.patch b/meta/recipes-devtools/gcc/gcc-5.2/0004-uclibc-locale.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0004-uclibc-locale.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0004-uclibc-locale.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0005-uclibc-locale-no__x.patch b/meta/recipes-devtools/gcc/gcc-5.2/0005-uclibc-locale-no__x.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0005-uclibc-locale-no__x.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0005-uclibc-locale-no__x.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0006-uclibc-locale-wchar_fix.patch b/meta/recipes-devtools/gcc/gcc-5.2/0006-uclibc-locale-wchar_fix.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0006-uclibc-locale-wchar_fix.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0006-uclibc-locale-wchar_fix.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0007-uclibc-locale-update.patch b/meta/recipes-devtools/gcc/gcc-5.2/0007-uclibc-locale-update.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0007-uclibc-locale-update.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0007-uclibc-locale-update.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0008-missing-execinfo_h.patch b/meta/recipes-devtools/gcc/gcc-5.2/0008-missing-execinfo_h.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0008-missing-execinfo_h.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0008-missing-execinfo_h.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0009-c99-snprintf.patch b/meta/recipes-devtools/gcc/gcc-5.2/0009-c99-snprintf.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0009-c99-snprintf.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0009-c99-snprintf.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0010-gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-5.2/0010-gcc-poison-system-directories.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0010-gcc-poison-system-directories.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0010-gcc-poison-system-directories.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0011-gcc-poison-dir-extend.patch b/meta/recipes-devtools/gcc/gcc-5.2/0011-gcc-poison-dir-extend.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0011-gcc-poison-dir-extend.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0011-gcc-poison-dir-extend.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch b/meta/recipes-devtools/gcc/gcc-5.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0012-gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0013-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc-5.2/0013-64-bit-multilib-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0013-64-bit-multilib-hack.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0013-64-bit-multilib-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0014-optional-libstdc.patch b/meta/recipes-devtools/gcc/gcc-5.2/0014-optional-libstdc.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0014-optional-libstdc.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0014-optional-libstdc.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch b/meta/recipes-devtools/gcc/gcc-5.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0015-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0016-COLLECT_GCC_OPTIONS.patch b/meta/recipes-devtools/gcc/gcc-5.2/0016-COLLECT_GCC_OPTIONS.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0016-COLLECT_GCC_OPTIONS.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0016-COLLECT_GCC_OPTIONS.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch b/meta/recipes-devtools/gcc/gcc-5.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0017-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0018-fortran-cross-compile-hack.patch b/meta/recipes-devtools/gcc/gcc-5.2/0018-fortran-cross-compile-hack.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0018-fortran-cross-compile-hack.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0018-fortran-cross-compile-hack.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0019-libgcc-sjlj-check.patch b/meta/recipes-devtools/gcc/gcc-5.2/0019-libgcc-sjlj-check.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0019-libgcc-sjlj-check.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0019-libgcc-sjlj-check.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0020-cpp-honor-sysroot.patch b/meta/recipes-devtools/gcc/gcc-5.2/0020-cpp-honor-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0020-cpp-honor-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0020-cpp-honor-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0021-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc-5.2/0021-MIPS64-Default-to-N64-ABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0021-MIPS64-Default-to-N64-ABI.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0021-MIPS64-Default-to-N64-ABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-5.2/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0022-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0023-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc-5.2/0023-gcc-Fix-argument-list-too-long-error.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0023-gcc-Fix-argument-list-too-long-error.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0023-gcc-Fix-argument-list-too-long-error.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0024-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc-5.2/0024-Disable-sdt.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0024-Disable-sdt.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0024-Disable-sdt.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0025-libtool.patch b/meta/recipes-devtools/gcc/gcc-5.2/0025-libtool.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0025-libtool.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0025-libtool.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc-5.2/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0026-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch b/meta/recipes-devtools/gcc/gcc-5.2/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0027-Use-the-multilib-config-files-from-B-instead-of-usin.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch b/meta/recipes-devtools/gcc/gcc-5.2/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0028-Avoid-using-libdir-from-.la-which-usually-points-to-.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0029-export-CPP.patch b/meta/recipes-devtools/gcc/gcc-5.2/0029-export-CPP.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0029-export-CPP.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0029-export-CPP.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-5.2/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0030-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch b/meta/recipes-devtools/gcc/gcc-5.2/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0031-Disable-the-MULTILIB_OSDIRNAMES-and-other-multilib-o.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0032-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc-5.2/0032-Ensure-target-gcc-headers-can-be-included.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0032-Ensure-target-gcc-headers-can-be-included.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0032-Ensure-target-gcc-headers-can-be-included.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch b/meta/recipes-devtools/gcc/gcc-5.2/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0033-gcc-4.8-won-t-build-with-disable-dependency-tracking.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch b/meta/recipes-devtools/gcc/gcc-5.2/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0034-Don-t-search-host-directory-during-relink-if-inst_pr.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch b/meta/recipes-devtools/gcc/gcc-5.2/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0035-Dont-link-the-plugins-with-libgomp-explicitly.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch b/meta/recipes-devtools/gcc/gcc-5.2/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0036-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0037-pr65779.patch b/meta/recipes-devtools/gcc/gcc-5.2/0037-pr65779.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0037-pr65779.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0037-pr65779.patch
diff --git a/meta/recipes-devtools/gcc/gcc-5.1/0038-fix-g++-sysroot.patch b/meta/recipes-devtools/gcc/gcc-5.2/0038-fix-g++-sysroot.patch
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-5.1/0038-fix-g++-sysroot.patch
rename to meta/recipes-devtools/gcc/gcc-5.2/0038-fix-g++-sysroot.patch
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_5.1.bb b/meta/recipes-devtools/gcc/gcc-cross-canadian_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-canadian_5.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-canadian_5.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial_5.1.bb b/meta/recipes-devtools/gcc/gcc-cross-initial_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross-initial_5.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross-initial_5.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-cross_5.1.bb b/meta/recipes-devtools/gcc/gcc-cross_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-cross_5.1.bb
rename to meta/recipes-devtools/gcc/gcc-cross_5.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk-initial_5.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk_5.1.bb b/meta/recipes-devtools/gcc/gcc-crosssdk_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-crosssdk_5.1.bb
rename to meta/recipes-devtools/gcc/gcc-crosssdk_5.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_5.1.bb b/meta/recipes-devtools/gcc/gcc-runtime_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-runtime_5.1.bb
rename to meta/recipes-devtools/gcc/gcc-runtime_5.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_5.1.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-sanitizers_5.1.bb
rename to meta/recipes-devtools/gcc/gcc-sanitizers_5.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc-source_5.1.bb b/meta/recipes-devtools/gcc/gcc-source_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc-source_5.1.bb
rename to meta/recipes-devtools/gcc/gcc-source_5.2.bb
diff --git a/meta/recipes-devtools/gcc/gcc_5.1.bb b/meta/recipes-devtools/gcc/gcc_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/gcc_5.1.bb
rename to meta/recipes-devtools/gcc/gcc_5.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc-initial_5.1.bb b/meta/recipes-devtools/gcc/libgcc-initial_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc-initial_5.1.bb
rename to meta/recipes-devtools/gcc/libgcc-initial_5.2.bb
diff --git a/meta/recipes-devtools/gcc/libgcc_5.1.bb b/meta/recipes-devtools/gcc/libgcc_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgcc_5.1.bb
rename to meta/recipes-devtools/gcc/libgcc_5.2.bb
diff --git a/meta/recipes-devtools/gcc/libgfortran_5.1.bb b/meta/recipes-devtools/gcc/libgfortran_5.2.bb
similarity index 100%
rename from meta/recipes-devtools/gcc/libgfortran_5.1.bb
rename to meta/recipes-devtools/gcc/libgfortran_5.2.bb
-- 
2.1.4


