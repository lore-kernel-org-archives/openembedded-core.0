Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5932671A0C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 23:11:54 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v28so2212448pgk.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 15:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+06vgKI0jobM5po2noe6rPX40LLI7uFYhKSSHTypgdc=;
	b=XPm8ZbTooalJ+8zzpru5Ir72fjVVR+GVva3QY15MFTybqRbedOLtQJkWS1z7Ro31vp
	KQLGBrFXwZcXcFUkztM1DNAQur1qVq6xxKhpZsj9hFTAfwESwE9IIUByU7Y0VBz/vFaz
	sDABhuzbXbqKUMNevfVxc1CWlpu11VzReSiO1wMQfIBFB3IlwP38YPmrwwT+12+ld1oe
	il09T5ACZzkebx6I1gMQbkpXjStlvAF/4TbhlNLaX8j7vzHESUSZpxpkezqn8HCmze46
	+wDzcETaplCPaJlZkzjykxqQgWKx2ReqPZQHOXfa0Z68SvGz54jxUxrYcvHwNBKI01kM
	Npfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+06vgKI0jobM5po2noe6rPX40LLI7uFYhKSSHTypgdc=;
	b=GXEFfUhAms/cUWZROUVXjA4SM16uAmmAr1y+/fxUUT9tf4DakrB53DPJic/OsdrwW9
	/2LMK4JMyIjtC61Spu3Zps1taRNRKI9DwWV3+U0gcLE//7WOgwfUlshnP94fI/+bj22R
	5dfwY7pvAu6HQVCHOVAekMwpUjP3H8d+q9dBiXmTI0SAU29Qyae032Jwm4T9OwepotC/
	z0WQPJX4rH8ZbYGPB+qBP4iHWoQUgZwPvWPOcAtpO+hZhWNYv2DQEJ6apbozkCBPW2hI
	91QbBOxCEt8/vb8Amo5Pt7r6/590n7qCAQqH9QCJZNNnoVl4GEttTURMAHVEwTgNneRZ
	PmYw==
X-Gm-Message-State: AHQUAuYvjq1Lukh7BqJ8Btb3AEsxzIdCIwAgk0iCdwIjv44LcV/ttB5V
	ISj5XKIByPedSvvMQ00hC7uvARfQ
X-Google-Smtp-Source: AHgI3IbPxmBdwOZn4o8FpPMSXkdREpZ+wa0VnKPim2fUmtK8n5uND9iHdyTE2RuAnkFzNzAFr3+7/w==
X-Received: by 2002:a63:a5c:: with SMTP id z28mr18181413pgk.446.1549667514393; 
	Fri, 08 Feb 2019 15:11:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id t3sm4428860pfa.50.2019.02.08.15.11.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 15:11:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:11:45 -0800
Message-Id: <20190208231145.25130-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libunwind: Upgrade to 1.3.1 release
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
X-List-Received-Date: Fri, 08 Feb 2019 23:11:54 -0000
Content-Transfer-Encoding: 8bit

- Drop upstreamed patch to enable/disable tests
- Forward port rest of patches to new version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} | 25 ++++---
 ...01-add-knobs-to-disable-enable-tests.patch | 69 -------------------
 ...race-Use-only-with-glibc-and-uclibc.patch} | 12 ++--
 ... 0003-x86-Stub-out-x86_local_resume.patch} | 18 ++---
 ...atch => 0004-Fix-build-on-mips-musl.patch} | 35 +++++-----
 ...ontext-mismatches-between-glibc-and.patch} | 17 ++---
 ...d-1.1-x32.patch => 0006-Fix-for-X32.patch} | 11 +--
 ...{libunwind_1.2.1.bb => libunwind_1.3.1.bb} | 21 +++---
 8 files changed, 73 insertions(+), 135 deletions(-)
 rename meta/recipes-support/libunwind/libunwind/{Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch => 0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch} (76%)
 delete mode 100644 meta/recipes-support/libunwind/libunwind/0001-add-knobs-to-disable-enable-tests.patch
 rename meta/recipes-support/libunwind/libunwind/{0001-backtrace-Use-only-with-glibc-and-uclibc.patch => 0002-backtrace-Use-only-with-glibc-and-uclibc.patch} (85%)
 rename meta/recipes-support/libunwind/libunwind/{0001-x86-Stub-out-x86_local_resume.patch => 0003-x86-Stub-out-x86_local_resume.patch} (85%)
 rename meta/recipes-support/libunwind/libunwind/{0001-Fix-build-on-mips-musl.patch => 0004-Fix-build-on-mips-musl.patch} (65%)
 rename meta/recipes-support/libunwind/libunwind/{0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch => 0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch} (98%)
 rename meta/recipes-support/libunwind/libunwind/{libunwind-1.1-x32.patch => 0006-Fix-for-X32.patch} (81%)
 rename meta/recipes-support/libunwind/{libunwind_1.2.1.bb => libunwind_1.3.1.bb} (51%)

diff --git a/meta/recipes-support/libunwind/libunwind/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/meta/recipes-support/libunwind/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
similarity index 76%
rename from meta/recipes-support/libunwind/libunwind/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
rename to meta/recipes-support/libunwind/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
index c8faca4724..437b878365 100644
--- a/meta/recipes-support/libunwind/libunwind/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
+++ b/meta/recipes-support/libunwind/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
@@ -1,7 +1,7 @@
-From 24484e80b3e329c9edee1995e102f8612eedb79c Mon Sep 17 00:00:00 2001
+From 599f10ac3a24e419a93f97fddbe14de01b1185ea Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 13 May 2014 23:32:27 +0200
-Subject: [PATCH] Add AO_REQUIRE_CAS to fix build on ARM < v6
+Subject: [PATCH 1/6] Add AO_REQUIRE_CAS to fix build on ARM < v6
 
 ARM earlier than ARMv6, such as ARMv4 and ARMv5 do not provide
 optimize atomic operations in libatomic_ops. Since libunwind is using
@@ -28,10 +28,10 @@ https://raw.githubusercontent.com/rdnetto/teapot-buildroot/master/package/libunw
  include/libunwind_i.h | 1 +
  2 files changed, 2 insertions(+), 7 deletions(-)
 
-Index: libunwind-1.2.1/acinclude.m4
-===================================================================
---- libunwind-1.2.1.orig/acinclude.m4
-+++ libunwind-1.2.1/acinclude.m4
+diff --git a/acinclude.m4 b/acinclude.m4
+index 497f7c2..9c15af1 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
 @@ -22,11 +22,5 @@ fi])
  AC_DEFUN([CHECK_ATOMIC_OPS],
  [dnl Check whether the system has the atomic_ops package installed.
@@ -45,11 +45,11 @@ Index: libunwind-1.2.1/acinclude.m4
 -#  AC_CHECK_LIB(atomic_ops, main)
 +  AC_CHECK_LIB(atomic_ops, main)
  ])
-Index: libunwind-1.2.1/include/libunwind_i.h
-===================================================================
---- libunwind-1.2.1.orig/include/libunwind_i.h
-+++ libunwind-1.2.1/include/libunwind_i.h
-@@ -116,6 +116,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DE
+diff --git a/include/libunwind_i.h b/include/libunwind_i.h
+index 36cf7a1..33b4ca3 100644
+--- a/include/libunwind_i.h
++++ b/include/libunwind_i.h
+@@ -124,6 +124,7 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
          (pthread_mutex_unlock != NULL ? pthread_mutex_unlock (l) : 0)
  
  #ifdef HAVE_ATOMIC_OPS_H
@@ -57,3 +57,6 @@ Index: libunwind-1.2.1/include/libunwind_i.h
  # include <atomic_ops.h>
  static inline int
  cmpxchg_ptr (void *addr, void *old, void *new)
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/libunwind/libunwind/0001-add-knobs-to-disable-enable-tests.patch b/meta/recipes-support/libunwind/libunwind/0001-add-knobs-to-disable-enable-tests.patch
deleted file mode 100644
index 673a5bb995..0000000000
--- a/meta/recipes-support/libunwind/libunwind/0001-add-knobs-to-disable-enable-tests.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 459e471fcc33d300f7bbcdaf3e0dc338d9dc15b9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Apr 2016 16:56:34 +0000
-Subject: [PATCH] add knobs to disable/enable tests
-
-Some tests do not compile on musl libc
-in general its good to have such a knob
-since not all builds may want to enable
-tests
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am  |  6 +++++-
- configure.ac | 12 ++++++++++--
- 2 files changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 6a3ed9e..0c29b3e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -42,7 +42,11 @@ endif
- 
- nodist_include_HEADERS = include/libunwind-common.h
- 
--SUBDIRS = src tests
-+SUBDIRS = src
-+
-+if CONFIG_TESTS
-+SUBDIRS += tests
-+endif
- 
- if CONFIG_DOCS
- SUBDIRS += doc
-diff --git a/configure.ac b/configure.ac
-index 85d78f8..d362387 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,6 +129,10 @@ AC_ARG_ENABLE(documentation,
- 	AS_HELP_STRING([--disable-documentation],[Disable generating the man pages]),,
- 	[enable_documentation=yes])
- 
-+AC_ARG_ENABLE(tests,
-+	AS_HELP_STRING([--disable-tests],[Disable building tests]),,
-+	[enable_tests=yes])
-+
- AC_MSG_CHECKING([if we should build libunwind-setjmp])
- AC_MSG_RESULT([$enable_setjmp])
- 
-@@ -395,9 +399,13 @@ AM_CONDITIONAL([CONFIG_DOCS], [test x$enable_documentation = xyes])
- if test "x$enable_documentation" = "xyes"; then
-   AC_CONFIG_FILES(doc/Makefile doc/common.tex)
- fi
-+AM_CONDITIONAL([CONFIG_TESTS], [test x$enable_tests = xyes])
-+if test "x$enable_tests" = "xyes"; then
-+  AC_CONFIG_FILES(tests/Makefile tests/check-namespace.sh)
-+fi
-+
- 
--AC_CONFIG_FILES(Makefile src/Makefile tests/Makefile tests/check-namespace.sh
--		include/libunwind-common.h
-+AC_CONFIG_FILES(Makefile src/Makefile include/libunwind-common.h
-                 include/libunwind.h include/tdep/libunwind_i.h)
- AC_CONFIG_FILES(src/unwind/libunwind.pc src/coredump/libunwind-coredump.pc
-                 src/ptrace/libunwind-ptrace.pc src/setjmp/libunwind-setjmp.pc
--- 
-1.8.3.1
-
diff --git a/meta/recipes-support/libunwind/libunwind/0001-backtrace-Use-only-with-glibc-and-uclibc.patch b/meta/recipes-support/libunwind/libunwind/0002-backtrace-Use-only-with-glibc-and-uclibc.patch
similarity index 85%
rename from meta/recipes-support/libunwind/libunwind/0001-backtrace-Use-only-with-glibc-and-uclibc.patch
rename to meta/recipes-support/libunwind/libunwind/0002-backtrace-Use-only-with-glibc-and-uclibc.patch
index 9aed419a12..1b862dccb1 100644
--- a/meta/recipes-support/libunwind/libunwind/0001-backtrace-Use-only-with-glibc-and-uclibc.patch
+++ b/meta/recipes-support/libunwind/libunwind/0002-backtrace-Use-only-with-glibc-and-uclibc.patch
@@ -1,20 +1,20 @@
-From 04437142399662b576bd55a85485c6dcc14d0812 Mon Sep 17 00:00:00 2001
+From b61446add7ae1c041266c2fa5ba2f51cb3b65d35 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 06:44:07 +0000
-Subject: [PATCH] backtrace: Use only with glibc and uclibc
+Subject: [PATCH 2/6] backtrace: Use only with glibc and uclibc
 
 backtrace API is glibc specific not linux specific
 so make it behave so.
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  tests/test-coredump-unwind.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/tests/test-coredump-unwind.c b/tests/test-coredump-unwind.c
-index 5254708..8767b42 100644
+index 5349823..3b153cb 100644
 --- a/tests/test-coredump-unwind.c
 +++ b/tests/test-coredump-unwind.c
 @@ -57,7 +57,9 @@
@@ -41,5 +41,5 @@ index 5254708..8767b42 100644
  #endif
    }
 -- 
-2.6.4
+2.20.1
 
diff --git a/meta/recipes-support/libunwind/libunwind/0001-x86-Stub-out-x86_local_resume.patch b/meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x86_local_resume.patch
similarity index 85%
rename from meta/recipes-support/libunwind/libunwind/0001-x86-Stub-out-x86_local_resume.patch
rename to meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x86_local_resume.patch
index 371013aaaa..508ed6af38 100644
--- a/meta/recipes-support/libunwind/libunwind/0001-x86-Stub-out-x86_local_resume.patch
+++ b/meta/recipes-support/libunwind/libunwind/0003-x86-Stub-out-x86_local_resume.patch
@@ -1,7 +1,7 @@
-From f5df01655a4b76d4fe415747de581d94ac593e6a Mon Sep 17 00:00:00 2001
+From f6866b9e4a6341c50eb1d923dbf48eca2ca40140 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 22 Mar 2016 16:19:29 +0000
-Subject: [PATCH] x86: Stub out x86_local_resume()
+Subject: [PATCH 3/6] x86: Stub out x86_local_resume()
 
 its purpose seems
 to be unwinding across signal handler boundaries, which cannot happen
@@ -9,18 +9,18 @@ in correct programs anyway. Replacing the whole function with
 something like *(volatile char *)0=0; (i.e. crash), gets a working
 libunwind
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+---
  src/x86/Gos-linux.c | 22 +---------------------
  1 file changed, 1 insertion(+), 21 deletions(-)
 
 diff --git a/src/x86/Gos-linux.c b/src/x86/Gos-linux.c
-index 31f83ba..3aaa34e 100644
+index fb9a5e3..c25ae0c 100644
 --- a/src/x86/Gos-linux.c
 +++ b/src/x86/Gos-linux.c
-@@ -281,27 +281,7 @@ x86_r_uc_addr (ucontext_t *uc, int reg)
+@@ -284,27 +284,7 @@ x86_r_uc_addr (ucontext_t *uc, int reg)
  HIDDEN int
  x86_local_resume (unw_addr_space_t as, unw_cursor_t *cursor, void *arg)
  {
@@ -38,7 +38,7 @@ index 31f83ba..3aaa34e 100644
 -      struct sigcontext *sc = (struct sigcontext *) c->sigcontext_addr;
 -
 -      Debug (8, "resuming at ip=%x via sigreturn(%p)\n", c->dwarf.ip, sc);
--      sigreturn (sc);
+-      x86_sigreturn (sc);
 -    }
 -  else
 -    {
@@ -48,7 +48,7 @@ index 31f83ba..3aaa34e 100644
 +  *(volatile char *)0=0;
    return -UNW_EINVAL;
  }
- #endif
+ 
 -- 
-1.8.3.1
+2.20.1
 
diff --git a/meta/recipes-support/libunwind/libunwind/0001-Fix-build-on-mips-musl.patch b/meta/recipes-support/libunwind/libunwind/0004-Fix-build-on-mips-musl.patch
similarity index 65%
rename from meta/recipes-support/libunwind/libunwind/0001-Fix-build-on-mips-musl.patch
rename to meta/recipes-support/libunwind/libunwind/0004-Fix-build-on-mips-musl.patch
index 8bcc252bad..124d0e00b1 100644
--- a/meta/recipes-support/libunwind/libunwind/0001-Fix-build-on-mips-musl.patch
+++ b/meta/recipes-support/libunwind/libunwind/0004-Fix-build-on-mips-musl.patch
@@ -1,25 +1,25 @@
-From e623c7703945a5eb6c9a30586ec5e23b2f7396f6 Mon Sep 17 00:00:00 2001
+From 6bdab5cc8f1e2ec5f84fc9f59f1699a726980709 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:08:59 +0000
-Subject: [PATCH] Fix build on mips/musl
+Subject: [PATCH 4/6] Fix build on mips/musl
 
 Do not include endian.h on musl it includes
 further headers which can not be compiled in __ASSEMBLER__
  mode
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
- src/coredump/_UCD_internal.h | 34 ++++++++++++++++++++++++++++++++++
+---
+ src/coredump/_UCD_internal.h | 35 +++++++++++++++++++++++++++++++++++
  src/mips/getcontext.S        |  3 +--
- 2 files changed, 35 insertions(+), 2 deletions(-)
+ 2 files changed, 36 insertions(+), 2 deletions(-)
 
-Index: git/src/coredump/_UCD_internal.h
-===================================================================
---- git.orig/src/coredump/_UCD_internal.h
-+++ git/src/coredump/_UCD_internal.h
-@@ -44,6 +44,41 @@ WITH THE SOFTWARE OR THE USE OR OTHER DE
+diff --git a/src/coredump/_UCD_internal.h b/src/coredump/_UCD_internal.h
+index 3c95a2a..21ed1c3 100644
+--- a/src/coredump/_UCD_internal.h
++++ b/src/coredump/_UCD_internal.h
+@@ -44,6 +44,41 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
  
  #include "libunwind_i.h"
  
@@ -61,11 +61,11 @@ Index: git/src/coredump/_UCD_internal.h
  
  #if SIZEOF_OFF_T == 4
  typedef uint32_t uoff_t;
-Index: git/src/mips/getcontext.S
-===================================================================
---- git.orig/src/mips/getcontext.S
-+++ git/src/mips/getcontext.S
-@@ -24,12 +24,11 @@ OF CONTRACT, TORT OR OTHERWISE, ARISING
+diff --git a/src/mips/getcontext.S b/src/mips/getcontext.S
+index d1dbd57..de9b681 100644
+--- a/src/mips/getcontext.S
++++ b/src/mips/getcontext.S
+@@ -24,12 +24,11 @@ OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
  
  #include "offsets.h"
@@ -79,3 +79,6 @@ Index: git/src/mips/getcontext.S
  #  define OFFSET 4
  # else
  #  define OFFSET 0
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/libunwind/libunwind/0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch b/meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
similarity index 98%
rename from meta/recipes-support/libunwind/libunwind/0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
rename to meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
index ca0641f5ac..edaa822be1 100644
--- a/meta/recipes-support/libunwind/libunwind/0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
+++ b/meta/recipes-support/libunwind/libunwind/0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch
@@ -1,7 +1,8 @@
-From e0eea53c77fce8537c58a072b684043507987bcc Mon Sep 17 00:00:00 2001
+From 02919d74b1599979884f9cee466ed392d9fc4819 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 9 Jul 2016 01:07:53 +0000
-Subject: [PATCH] ppc32: Consider ucontext mismatches between glibc and musl
+Subject: [PATCH 5/6] ppc32: Consider ucontext mismatches between glibc and
+ musl
 
 This helps in porting libunwind onto musl based systems
 ptrace.h change is required again an error that surfaces
@@ -18,17 +19,17 @@ In file included from /mnt/oe/openembedded-core/build/tmp-musl/sysroots/qemuppc/
  struct pt_regs {
         ^~~~~~~
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+---
  src/ppc32/Ginit.c            |   6 +-
- src/ppc32/ucontext_i.h       | 158 ++++++++++++++++++++++---------------------
+ src/ppc32/ucontext_i.h       | 158 ++++++++++++++++++-----------------
  src/ptrace/_UPT_reg_offset.c |   7 ++
  3 files changed, 92 insertions(+), 79 deletions(-)
 
 diff --git a/src/ppc32/Ginit.c b/src/ppc32/Ginit.c
-index f2e6e82..617aaa1 100644
+index ba30244..c5312d9 100644
 --- a/src/ppc32/Ginit.c
 +++ b/src/ppc32/Ginit.c
 @@ -48,12 +48,12 @@ uc_addr (ucontext_t *uc, int reg)
@@ -226,7 +227,7 @@ index c6ba806..b79f15c 100644
  
  #endif
 diff --git a/src/ptrace/_UPT_reg_offset.c b/src/ptrace/_UPT_reg_offset.c
-index 68461a2..fcc43f7 100644
+index c82d1c9..6c31baa 100644
 --- a/src/ptrace/_UPT_reg_offset.c
 +++ b/src/ptrace/_UPT_reg_offset.c
 @@ -27,6 +27,13 @@ WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
@@ -244,5 +245,5 @@ index 68461a2..fcc43f7 100644
  #ifdef HAVE_ASM_PTRACE_OFFSETS_H
  # include <asm/ptrace_offsets.h>
 -- 
-1.8.3.1
+2.20.1
 
diff --git a/meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch b/meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch
similarity index 81%
rename from meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch
rename to meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch
index 32516464cd..37ae8124cc 100644
--- a/meta/recipes-support/libunwind/libunwind/libunwind-1.1-x32.patch
+++ b/meta/recipes-support/libunwind/libunwind/0006-Fix-for-X32.patch
@@ -1,21 +1,22 @@
-From 506bd37bd580d7382d7c58257dac4b1e502a887c Mon Sep 17 00:00:00 2001
+From 7a4fd5933cc795df85cdd85168fe54fbaec4dcec Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Tue, 13 Dec 2016 09:50:34 -0700
-Subject: [PATCH] Fix for X32
+Subject: [PATCH 6/6] Fix for X32
 
 Apply patch to fix the X32 build from https://github.com/sjnewbury/x32.
 
 Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
 ---
  src/x86_64/Gos-linux.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/x86_64/Gos-linux.c b/src/x86_64/Gos-linux.c
-index 9e1acfc..8169d5a 100644
+index bd14234..be1cb5b 100644
 --- a/src/x86_64/Gos-linux.c
 +++ b/src/x86_64/Gos-linux.c
-@@ -143,8 +143,8 @@ x86_64_sigreturn (unw_cursor_t *cursor)
+@@ -145,8 +145,8 @@ x86_64_sigreturn (unw_cursor_t *cursor)
  
    Debug (8, "resuming at ip=%llx via sigreturn(%p)\n",
               (unsigned long long) c->dwarf.ip, sc);
@@ -27,5 +28,5 @@ index 9e1acfc..8169d5a 100644
                          :: "r"(sc), "i"(SYS_rt_sigreturn)
                          : "memory");
 -- 
-2.8.0
+2.20.1
 
diff --git a/meta/recipes-support/libunwind/libunwind_1.2.1.bb b/meta/recipes-support/libunwind/libunwind_1.3.1.bb
similarity index 51%
rename from meta/recipes-support/libunwind/libunwind_1.2.1.bb
rename to meta/recipes-support/libunwind/libunwind_1.3.1.bb
index c9239b695e..037e04c3c0 100644
--- a/meta/recipes-support/libunwind/libunwind_1.2.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.3.1.bb
@@ -1,19 +1,18 @@
 require libunwind.inc
 
-SRC_URI[md5sum] = "06ba9e60d92fd6f55cd9dadb084df19e"
-SRC_URI[sha256sum] = "3f3ecb90e28cbe53fba7a4a27ccce7aad188d3210bb1964a923a731a27a75acb"
-
 SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV}.tar.gz \
-           file://Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
-           file://0001-backtrace-Use-only-with-glibc-and-uclibc.patch \
-           file://0001-x86-Stub-out-x86_local_resume.patch \
-           file://0001-Fix-build-on-mips-musl.patch \
-           file://0001-add-knobs-to-disable-enable-tests.patch \
-           file://0001-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
-           file://libunwind-1.1-x32.patch \
+           file://0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch \
+           file://0002-backtrace-Use-only-with-glibc-and-uclibc.patch \
+           file://0003-x86-Stub-out-x86_local_resume.patch \
+           file://0004-Fix-build-on-mips-musl.patch \
+           file://0005-ppc32-Consider-ucontext-mismatches-between-glibc-and.patch \
+           file://0006-Fix-for-X32.patch \
            "
-
 SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
+
+SRC_URI[md5sum] = "a04f69d66d8e16f8bf3ab72a69112cd6"
+SRC_URI[sha256sum] = "43997a3939b6ccdf2f669b50fdb8a4d3205374728c2923ddc2354c65260214f8"
+
 EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests --enable-static"
 
 # http://errors.yoctoproject.org/Errors/Details/20487/
-- 
2.20.1


