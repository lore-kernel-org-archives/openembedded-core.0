Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1943.1792480403362538226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 00:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YCKEvd1/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xMQn4kDT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a158285ade-1b8ba726-1cf6-4d5f-8932-93d8d61fbfbf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792480402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rIeiAuc+5lp0yOCnicl8mTlTX3fPxT9Gjm4Vrjiu9vI=;
	b=YCKEvd1/n0ngVNnrnVO6WL2mSJCLelbPNwfoGWG2lBzfUZAf+LW+MXbCqJn7l2Tz
	8Xh/gJSyV8tglg2XPXBDq6GELICwDIMYTDwDe9PdlznUKxGTkCXPEsyPHZ2wUsq+Zvg
	MB/4fDxIrbqZGXScAFV+QE29SVrCsQPZo25ocKUM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792480402;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rIeiAuc+5lp0yOCnicl8mTlTX3fPxT9Gjm4Vrjiu9vI=;
	b=xMQn4kDT9s1bKOAtfiYAxT9dMLFEBXM39KgIwl/XRiULFi/01GfXlQP9nsXe9FSL
	r0aQi45457r4A4BvVJnXRGYWUcaeyHVGovbf+AiWQJv4ipu81QOH6m9efQeYC8q2Jh2
	9dvot3qaWtN9wlFr7F3QrkW1IWGHnAzh09e2uqtI=
Content-Type: multipart/mixed; boundary="===============0583498797932005806=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.197 FAILED
Message-ID: <010101a158285ade-1b8ba726-1cf6-4d5f-8932-93d8d61fbfbf-000000@us-west-2.amazonses.com>
Date: Tue, 20 Oct 2026 07:13:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.20-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 07:13:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248228

--===============0583498797932005806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *elfutils* to *0.197* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-elfutils-upgrade-0.196-0.197.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2ba72c1c5cab51627fca90007ca1b8cb3b539a6b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 20 Oct 2026 06:07:02 +0000
Subject: [PATCH] elfutils: upgrade 0.196 -> 0.197

Version 0.197 "Anti-Corruption"

THREAD-SAFETY: New document describing the thread safety model for elfutils
       libraries when built with --enable-thread-safety.  Thread
       safety support remains experimental.

backends: Add unwinding support for alpha core files and processes.

libdebuginfod: The progress callback function is now also invoked when
       waiting for a server's initial response.

libdw: dwarf_begin_elf_type is now exported from libdw.so.  Previously
       this function was missing from the exported symbols.

libelf: Improved handling of corrupt ZSTD compression headers.

readelf: Improved handling of corrupt .gdb_index and .debug_cu_index
 sections.

translations: New Swedish translation.

unstrip: Improved handling of corrupt symbol tables.  When -m is given,
 the -d output path is now built from the module basename to avoid
 writing the reconstructed module image outside the intended
 output directory.
---
 .../{elfutils_0.196.bb => elfutils_0.197.bb}  |  5 +-
 ...s-uio.h-instead-of-linux-uio.h-for-s.patch | 74 -------------------
 ...001-config-eu.am-do-not-force-Werror.patch |  2 +-
 ...-check-data_list.data.d.d_buf-before.patch |  2 +-
 ...-skip-the-test-when-gcc-not-deployed.patch |  2 +-
 ...m-compile-test_nlist-with-standard-C.patch |  4 +-
 ...cvt_gunhash-if-dest-and-src-are-same.patch |  2 +-
 .../elfutils/files/0003-fixheadercheck.patch  |  2 +-
 .../elfutils/files/0003-musl-utils.patch      |  4 +-
 .../elfutils/files/ptest.patch                |  8 +-
 .../elfutils/files/srcfiles.patch             | 65 ----------------
 11 files changed, 15 insertions(+), 155 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.196.bb => elfutils_0.197.bb} (97%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/srcfiles.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.196.bb b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
similarity index 97%
rename from meta/recipes-devtools/elfutils/elfutils_0.196.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.197.bb
index 4541000840..ffb523936a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.196.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.197.bb
@@ -19,13 +19,12 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-config-eu.am-do-not-force-Werror.patch \
-           file://0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch \
-           file://srcfiles.patch \
+           file://0003-musl-utils.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "fd5cc6b77ad6773cac93cb3f415f9318ac3b3455eecf801f6b4a742c4f6c7209"
+SRC_URI[sha256sum] = "1fdf525f22dcf796d99a99ba3ea00a1f7b1ae5421bc62e8443a708920b99b904"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch b/meta/recipes-devtools/elfutils/files/0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch
deleted file mode 100644
index 0461172fcf..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 64e89606ff4967a647525524aec00dd33765ba2a Mon Sep 17 00:00:00 2001
-From: Daeho Ro <email@daeho.ro>
-Date: Sun, 16 Aug 2026 16:27:56 +0900
-Subject: [PATCH] backends: use <sys/uio.h> instead of <linux/uio.h> for
- struct iovec
-
-Since commit 0e8b57a3 ("elfcompress: Handle existing output files
-(symlinks)") lib/system.h includes <fcntl.h>.  When _GNU_SOURCE is
-defined, glibc's <fcntl.h> pulls in <bits/types/struct_iovec.h> (via
-bits/fcntl-linux.h), which defines struct iovec.  The kernel UAPI header
-<linux/uio.h> defines struct iovec unconditionally, so including it
-after "system.h" now breaks the aarch64 backend build:
-
-  In file included from aarch64_initreg.c:36:
-  /usr/include/linux/uio.h:17:8: error: redefinition of 'struct iovec'
-     17 | struct iovec
-        |        ^~~~~
-  In file included from /usr/include/aarch64-linux-gnu/bits/fcntl-linux.h:38,
-                   from /usr/include/aarch64-linux-gnu/bits/fcntl.h:61,
-                   from /usr/include/fcntl.h:35,
-                   from ../lib/system.h:42,
-                   from aarch64_initreg.c:33:
-  /usr/include/aarch64-linux-gnu/bits/types/struct_iovec.h:26:8: note: originally defined here
-
-Seen building 0.196 on aarch64 with glibc 2.39 and gcc 13.3.0.
-
-Both files only need struct iovec to call ptrace (PTRACE_GETREGSET),
-which glibc provides in <sys/uio.h>; that header guards the definition
-with __iovec_defined, so it composes with the rest of system.h.
-arm_initreg.c does not currently include "system.h" and so still builds,
-but it has the same latent conflict.
-
-* backends/aarch64_initreg.c: Include <sys/uio.h> instead of
-  <linux/uio.h>.
-* backends/arm_initreg.c: Likewise.
-
-Signed-off-by: Daeho Ro <email@daeho.ro>
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=patch;h=64e89606ff4967a647525524aec00dd33765ba2a]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- backends/aarch64_initreg.c | 2 +-
- backends/arm_initreg.c     | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/backends/aarch64_initreg.c b/backends/aarch64_initreg.c
-index a6badbb4..539a6366 100644
---- a/backends/aarch64_initreg.c
-+++ b/backends/aarch64_initreg.c
-@@ -33,7 +33,7 @@
- #include "system.h"
- #include <assert.h>
- #if defined(__aarch64__) && defined(__linux__)
--# include <linux/uio.h>
-+# include <sys/uio.h>
- # include <sys/user.h>
- # include <sys/ptrace.h>
- # include <asm/ptrace.h>
-diff --git a/backends/arm_initreg.c b/backends/arm_initreg.c
-index efcabaf6..062bb9e0 100644
---- a/backends/arm_initreg.c
-+++ b/backends/arm_initreg.c
-@@ -38,7 +38,7 @@
- #endif
- 
- #ifdef __aarch64__
--# include <linux/uio.h>
-+# include <sys/uio.h>
- # include <sys/user.h>
- # include <sys/ptrace.h>
- /* Deal with old glibc defining user_pt_regs instead of user_regs_struct.  */
--- 
-2.43.7
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
index d460f2e58b..d145c9e820 100644
--- a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
@@ -1,4 +1,4 @@
-From 975357f7585076a072f61684db20180ef8dd31b7 Mon Sep 17 00:00:00 2001
+From 645351e3057b76d9a76495c7e021b3449cd5cae5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 22 Nov 2024 12:50:48 +0100
 Subject: [PATCH] config/eu.am: do not force -Werror
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index 621be1b37d..47f28885a9 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From bf22ef3c1a559dc0b265a9c7c2fcda4a20519e63 Mon Sep 17 00:00:00 2001
+From 6305e20927bc39367009efd1ecb71ce20a006ed6 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index 093d03c736..330b0565fc 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,4 +1,4 @@
-From db59c8a80a285f9cba3f789b6c2c240481b97db8 Mon Sep 17 00:00:00 2001
+From 1741d5bb8597aaeb6ef6caefc2f4091e3b2ecb2d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index eb2d48e3bb..d5a1f281b0 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From aba735bf19c60ff85731b3bfe79a6c83e17f3436 Mon Sep 17 00:00:00 2001
+From 4af78e885d764bcc4078ccf810c125159ad327f2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 055fea7..ba25e61 100644
+index bb36d3a..3e98162 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -122,7 +122,7 @@ endif
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index cc4c5ab75b..a93fffc32c 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From 0533b0d67ed99fd2a034e497f0c07ff608ca52e7 Mon Sep 17 00:00:00 2001
+From 23c89703e77a000ebed1a4a32e9d52271d25a070 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index 41e4c738f3..d14c5257b3 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 78415c6fc1f464e45222ba588a6cdc0292b4230a Mon Sep 17 00:00:00 2001
+From b1cf6bc617beccc7e15d5ef52749fb7c1d4e163d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index a5d913b2b7..3e2eaab9ec 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 0064679018642a9e0e2c9d36eeeedc3a8278356e Mon Sep 17 00:00:00 2001
+From f2a4493c7ab2d8fca4e4bd43dfed6bbb52922a4e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -74,7 +74,7 @@ index a8ecc80..bf88051 100644
  
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index 5585b0e..adc39a3 100644
+index 39d5bb6..db79236 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -51,6 +51,15 @@
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index b6a9e5bb73..771a6470ac 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From abe164f6242825e827b6b13141883591d059d6fe Mon Sep 17 00:00:00 2001
+From 614489b65f83540644dc88598315458712598476 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 16:37:48 +0100
 Subject: [PATCH] Changes to allow ptest to run standalone on target:
@@ -21,7 +21,7 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index b0d1b48..acc29f0 100644
+index d3c0292..76bdda2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -43,7 +43,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2026 The elfutils developers.])
@@ -34,10 +34,10 @@ index b0d1b48..acc29f0 100644
  
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 137e961..055fea7 100644
+index 261649f..bb36d3a 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -981,3 +981,5 @@ check: check-am coverage
+@@ -998,3 +998,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
diff --git a/meta/recipes-devtools/elfutils/files/srcfiles.patch b/meta/recipes-devtools/elfutils/files/srcfiles.patch
deleted file mode 100644
index abd0226b0f..0000000000
--- a/meta/recipes-devtools/elfutils/files/srcfiles.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From: Mark Wielaard <mark@klomp.org>
-To: elfutils-devel@sourceware.org
-Cc: ross@burtonini.com, Mark Wielaard <mark@klomp.org>
-Subject: [PATCH] srcfiles: Always process the "zero" file table entry (CU comp_dir/name)
-Date: Tue, 22 Sep 2026 13:46:06 +0200
-Message-ID: <20260922114606.2865660-1-mark@klomp.org>
-X-Mailer: git-send-email 2.55.0
-MIME-Version: 1.0
-Content-Transfer-Encoding: 8bit
-X-Spam-Flag: NO
-X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00 autolearn=ham autolearn_force=no version=3.4.0
-X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on gnu.wildebeest.org
-
-If the main CU file doesn't contain any references to the file table
-it wouldn't show up in the src files list (except if --cu-only was
-given). This is because file entry "zero" is special. It cannot be
-referred to by DW_AT file attributes (because zero means, no
-file). But technically it should be equal to (implicitly before
-DWARF5) the DW_AT_name of the main CU DIE (using a zero directory
-entry, equal to DW_AT_comp_dir). collect_sourcefiles skipped this
-implicit zero entry unless --cu-only was given.
-
-Fix this by always handling the zero file table entry. And for
---cu-only to just exit the loop early, so no other entries are handled
-This is also an optimization, before --cu-only would go through all
-indexes, but always added the CU name. Which worked, because
-duplicates were removed, but was somewhat inefficient.
-
-	   * src/srcfiles.cxx (collect_sourcefiles): Go from index
-	   zero, exit after zero index for CU_only, always handle
-	   index zero specially.
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=34666
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-
-Upstream-Status: Backport [7b675cbdb0d1f216938b4b33aea30fd35fb1ae0a]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/srcfiles.cxx | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/srcfiles.cxx b/src/srcfiles.cxx
-index 9bbb6ef10473..e2fc0f128d71 100644
---- a/src/srcfiles.cxx
-+++ b/src/srcfiles.cxx
-@@ -273,10 +273,14 @@ collect_sourcefiles (Dwfl_Module *dwflmod,
-             clog << "skipping cu=" << cuname << " due to empty comp_dir" << endl;
-           continue;
-         }
--      for (size_t f = 1; f < nfiles; ++f)
-+      for (size_t f = 0; f < nfiles; ++f)
-         {
-+	  /* For --cu-only we are only interested in the "zero" entry.  */
-+	  if (CU_only && f != 0)
-+	    break;
-+
-           const char *hat;
--          if (CU_only)
-+          if (f == 0)
-           {
-             if (strcmp(cuname, "<unknown>") == 0 || strcmp(cuname, "<artificial>") == 0 )
-               continue;
--- 
-2.55.0
-- 
2.47.1


--===============0583498797932005806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1993 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-07cbefd3d03b1bf5feaa9c34e95d16abfbd17b0e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:07cbefd3d03b1bf5feaa9c34e95d16abfbd17b0e"
meta-yocto-bsp       
meta-poky            = "master:82013b83db7ba41da07694e201a7c43f561a9e00"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 632 Local 357 Mirrors 0 Missed 275 Current 239 (56% match, 68% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 328 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 396 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 447 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 449 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 451 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 465 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 469 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 470 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 476 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 477 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 478 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 486 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 490 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 497 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe findutils-4.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 498 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 500 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 513 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 517 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 519 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 521 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 524 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 525 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 526 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 531 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 538 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 540 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 543 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 545 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sed-4.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 549 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 550 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 556 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe iptables-1.8.13-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 557 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 562 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 564 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 566 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 567 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gawk-5.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 571 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 575 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe iptables-1.8.13-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-7.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.78-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 582 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 586 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iproute2-7.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 587 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 593 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 595 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 597 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 600 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 603 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 604 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_recipe_spdx_setscene)
NOTE: recipe json-c-0.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 612 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 613 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_create_recipe_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 616 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 618 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 620 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 621 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 625 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 627 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 630 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 635 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 638 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 642 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 644 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 646 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 647 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 649 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 651 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 652 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe iptables-1.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 653 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 658 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.9.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 659 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 660 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 663 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 668 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe iptables-1.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 672 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 673 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 675 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 677 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 678 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 679 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 680 of 871 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_recipe_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-native-4.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 681 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 685 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 689 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 694 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 698 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 703 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-native-4.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-native-5.48-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 705 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 706 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 707 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 709 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 710 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-native-5.48-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 711 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 712 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 713 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.78-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 714 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 717 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 718 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 722 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 725 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 728 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 736 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 738 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 743 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 744 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 746 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 749 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 751 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 752 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 753 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 755 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 757 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 760 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 762 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 763 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 766 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 768 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 769 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 773 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.20.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 776 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 777 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 780 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 783 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe file-5.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 786 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 787 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 789 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 792 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 793 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 794 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 800 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 801 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.23.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 802 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 803 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 805 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.48-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running setscene task 807 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpsl-0.23.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 809 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 811 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 817 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 820 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 821 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 822 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 823 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 824 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.8.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 827 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 828 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 829 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 830 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 831 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 553 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 835 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 647 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_fetch)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 695 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: Running task 762 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 764 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 766 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 768 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_fetch)
NOTE: Running task 771 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_fetch)
NOTE: recipe attr-2.6.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 772 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_fetch)
NOTE: Running task 774 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_fetch)
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.6.0-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 824 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_unpack)
NOTE: Running task 832 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_fetch)
NOTE: Running task 838 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_fetch)
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 839 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_fetch: Started
NOTE: Running setscene task 836 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: Running setscene task 837 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_fetch: Started
NOTE: recipe nettle-4.0-r0: task do_fetch: Started
NOTE: Running setscene task 838 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 839 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe xz-5.8.4-r0: task do_fetch: Started
NOTE: recipe acl-2.4.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-4.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_fetch)
NOTE: Running task 842 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_unpack)
NOTE: Running task 843 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_unpack)
NOTE: Running task 844 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 841 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Started
NOTE: Running setscene task 842 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Started
NOTE: recipe attr-2.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 845 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_patch)
NOTE: Running task 846 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 847 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe openssl-4.0.3-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 848 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_unpack)
NOTE: recipe xz-5.8.4-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 850 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_fetch)
NOTE: Running task 851 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running task 852 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_patch: Started
NOTE: recipe nettle-4.0-r0: task do_unpack: Started
NOTE: Running task 885 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 850 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.4.0-r0: task do_unpack: Started
NOTE: Running task 886 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: Running task 887 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Started
NOTE: Running task 888 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_unpack)
NOTE: recipe attr-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_unpack: Succeeded
NOTE: Running task 891 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_fetch)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Started
NOTE: Running task 892 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_fetch: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 896 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe xz-5.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 904 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_patch)
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 912 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_patch)
NOTE: Running task 913 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_unpack)
NOTE: Running task 914 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 916 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_fetch)
NOTE: recipe curl-8.23.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_unpack: Succeeded
NOTE: recipe nettle-4.0-r0: task do_patch: Started
NOTE: Running task 917 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_patch)
NOTE: recipe curl-8.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 918 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_unpack)
NOTE: recipe acl-2.4.0-r0: task do_patch: Started
NOTE: recipe xz-5.8.4-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 919 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_unpack)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 851 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.23.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 852 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 853 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 920 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: recipe libunistring-1.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 921 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_patch)
NOTE: Running task 924 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_patch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_patch: Succeeded
NOTE: Running task 930 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_fetch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 935 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 937 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.7.3-r0: task do_patch: Started
NOTE: Running task 944 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_fetch)
NOTE: Running task 945 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_patch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 947 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.19-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.21.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.19-r0: task do_fetch: Succeeded
NOTE: Running task 951 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_write_config)
NOTE: Running task 952 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_unpack)
NOTE: recipe libunistring-1.4.2-r0: task do_patch: Succeeded
NOTE: Running task 954 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Started
NOTE: recipe libpam-1.7.3-r0: task do_patch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Started
NOTE: Running task 956 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_write_config)
NOTE: Running setscene task 854 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running setscene task 855 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.13-r0: task do_fetch: Succeeded
NOTE: Running setscene task 856 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_write_config: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.9-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 957 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 958 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_patch)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_unpack: Succeeded
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 959 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_patch)
NOTE: recipe libpam-1.7.3-r0: task do_write_config: Succeeded
NOTE: Running task 960 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 961 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_write_config: Succeeded
NOTE: recipe curl-8.23.0-r0: task do_patch: Started
NOTE: Running task 963 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 965 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_fetch)
NOTE: Running task 983 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_fetch)
NOTE: recipe libgcc-16.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: Running task 991 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_fetch)
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Started
NOTE: Running task 992 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.19-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Started
NOTE: Running task 993 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 858 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Started
NOTE: recipe gdbm-1.26-r0: task do_fetch: Started
NOTE: recipe libcap-2.78-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: Running setscene task 859 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Started
NOTE: recipe libpsl-0.23.3-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.23.0-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 860 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 996 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_patch)
NOTE: Running task 999 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_unpack)
NOTE: recipe libtasn1-4.21.0-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1000 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_patch)
NOTE: Running task 1003 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_fetch)
NOTE: recipe json-c-0.19-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1005 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_generate_toolchain_file)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_fetch: Started
NOTE: recipe openssl-4.0.3-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 862 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: Running task 1006 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.16-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1009 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_fetch)
NOTE: Running setscene task 863 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_unpack: Succeeded
NOTE: Running task 1023 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_fetch)
NOTE: recipe libcap-2.78-r0: task do_unpack: Succeeded
NOTE: Running task 1029 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1030 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 1031 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_patch)
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Started
NOTE: Running setscene task 866 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1032 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_patch)
NOTE: recipe libpsl-0.23.3-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1034 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_fetch)
NOTE: Running setscene task 867 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1035 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_fetch: Started
NOTE: recipe openssl-4.0.3-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.54.1-r0: task do_fetch: Succeeded
NOTE: recipe file-5.48-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: Running task 1036 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1038 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_fetch)
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Started
NOTE: recipe libcap-2.78-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Started
NOTE: Running setscene task 868 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 869 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-initial-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1041 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_unpack)
NOTE: Running task 1042 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_recipe_qa)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: Running task 1054 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_unpack)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: Running task 1056 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_fetch)
NOTE: recipe expat-2.9.0-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 870 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_fetch: Succeeded
NOTE: recipe libcap-2.78-r0: task do_patch: Succeeded
NOTE: Running task 1057 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_unpack)
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1058 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_unpack)
NOTE: recipe elfutils-0.197-r0: task do_recipe_qa: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_unpack: Started
NOTE: recipe lzlib-1.16-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_fetch: Started
NOTE: Running task 1059 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1061 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_fetch)
NOTE: Running setscene task 871 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_unpack: Started
NOTE: recipe file-5.48-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_unpack: Started
NOTE: Running task 1062 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_unpack)
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: recipe openssl-4.0.3-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_unpack: Succeeded
NOTE: Running task 1067 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_fetch)
NOTE: Running task 1068 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: recipe lzlib-1.16-r0: task do_patch: Started
NOTE: Running task 1069 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1070 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_unpack)
NOTE: Running task 1071 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_unpack)
NOTE: recipe elfutils-0.197-r0: task do_recipe_qa: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Running task 1072 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: Running task 1073 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_unpack)
NOTE: recipe file-5.48-r0: task do_unpack: Started
NOTE: Running task 1075 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.1.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Started
NOTE: Running task 1076 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_fetch: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe expat-2.9.0-r0: task do_unpack: Succeeded
NOTE: Running task 1078 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_fetch)
NOTE: Running task 1079 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_unpack)
NOTE: Running task 1080 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_patch)
NOTE: recipe gdbm-1.26-r0: task do_patch: Started
NOTE: recipe lzlib-1.16-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Started
NOTE: Running task 1081 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 1082 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bsd-headers-1.0-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_unpack: Started
NOTE: Running task 1083 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_patch)
NOTE: recipe sqlite3-3_3.54.1-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: recipe elfutils-0.197-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Started
NOTE: Running task 1084 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe libarchive-3.8.9-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1087 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_unpack)
NOTE: Running task 1088 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_patch)
NOTE: recipe expat-2.9.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1089 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: Running task 1090 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Started
NOTE: recipe gdbm-1.26-r0: task do_patch: Succeeded
NOTE: Running task 1093 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.197-r0: task do_unpack: Started
NOTE: Running noexec task 1095 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_configure)
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Started
NOTE: Running noexec task 1096 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_compile)
NOTE: Running task 1097 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_install)
NOTE: recipe expat-2.9.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.54.1-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe file-5.48-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: Running task 1098 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_patch)
NOTE: Running task 1101 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_patch)
NOTE: Running task 1102 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: Running task 1103 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_patch)
NOTE: Running task 1104 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: Running task 1105 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 1112 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_unpack)
NOTE: Running task 1114 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1116 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_generate_toolchain_file)
NOTE: Running task 1122 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: Running task 1123 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_fetch)
NOTE: Running task 1126 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: Running task 1128 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_fetch)
NOTE: recipe file-5.48-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Started
NOTE: recipe expat-2.9.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running noexec task 1130 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 1131 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 1132 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: Running task 1134 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_fetch)
NOTE: Running task 1136 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_fetch)
NOTE: recipe base-passwd-3.6.8-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_fetch: Started
NOTE: Running task 1138 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: recipe file-5.48-r0: task do_patch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe expat-2.9.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1143 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: Running task 1145 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_unpack)
NOTE: Running task 1149 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_fetch)
NOTE: recipe coreutils-9.12-r0: task do_fetch: Succeeded
NOTE: Running task 1150 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_fetch)
NOTE: Running task 1151 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_install: Succeeded
NOTE: Running task 1153 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_create_recipe_spdx)
NOTE: Running task 1155 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_package)
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Started
NOTE: Running task 1158 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_fetch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_fetch: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Started
NOTE: Running task 1159 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_unpack)
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Started
NOTE: Running task 1160 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_unpack)
NOTE: recipe elfutils-0.197-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 1161 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_patch)
NOTE: Running task 1165 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_fetch)
NOTE: Running task 1166 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-4.20.3-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Started
NOTE: Running task 1167 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_fetch)
NOTE: Running task 1168 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Started
NOTE: Running task 1171 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: Running task 1172 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe elfutils-0.197-r0: task do_patch: Started
NOTE: Running task 1176 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_unpack)
NOTE: recipe sed-4.10-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1177 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_unpack)
NOTE: recipe perl-5.44.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_fetch: Succeeded
NOTE: Running task 1178 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_unpack)
NOTE: Running task 1179 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe bash-completion-2.18.0-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.4.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_fetch: Succeeded
NOTE: Running task 1180 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.18.0.bb:do_patch)
NOTE: Running task 1181 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_unpack)
NOTE: Running task 1182 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_unpack)
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1183 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe shadow-4.20.3-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.10-r0: task do_unpack: Started
NOTE: Running task 1185 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_unpack)
NOTE: Running task 1186 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_patch)
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1187 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe perl-5.44.0-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.18.0-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_patch: Started
NOTE: Running task 1192 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe sed-4.10-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_patch: Succeeded
NOTE: Running task 1193 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_patch)
NOTE: Running task 1194 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1195 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: recipe coreutils-9.12-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Started
NOTE: Running task 1196 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1200 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_fetch)
NOTE: recipe libffi-3.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1201 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_patch: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: Running task 1202 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_fetch)
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe coreutils-9.12-r0: task do_patch: Started
NOTE: recipe iptables-1.8.13-r0: task do_fetch: Started
NOTE: recipe ncurses-6.6-r0: task do_unpack: Succeeded
NOTE: Running task 1203 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_patch)
NOTE: recipe iptables-1.8.13-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_create_recipe_spdx)
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe sed-4.10-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Started
NOTE: recipe libmpc-1.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 1209 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_fetch)
NOTE: Running task 1210 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_fetch)
NOTE: Running task 1211 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_fetch)
NOTE: recipe libcap-ng-0.9.6-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_patch: Succeeded
NOTE: Running task 1212 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_fetch)
NOTE: Running task 1223 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe ncurses-6.6-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Started
NOTE: recipe psmisc-23.7-r0: task do_fetch: Started
NOTE: Running task 1225 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_fetch)
NOTE: recipe findutils-4.11.0-r0: task do_fetch: Started
NOTE: recipe util-linux-2.42.4-r0: task do_fetch: Succeeded
NOTE: Running task 1227 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_unpack)
NOTE: recipe gawk-5.4.1-r0: task do_fetch: Started
NOTE: recipe coreutils-9.12-r0: task do_patch: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 1229 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: Running task 1231 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_unpack)
NOTE: recipe gawk-5.4.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_unpack: Succeeded
NOTE: Running task 1232 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 1233 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_patch)
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: Running task 1235 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_unpack)
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.13-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.8-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Started
NOTE: Running task 1236 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_fetch)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1237 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_patch)
NOTE: recipe psmisc-23.7-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.13-r0: task do_unpack: Succeeded
NOTE: Running task 1238 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: Running task 1241 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe libmpc-1.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_patch)
NOTE: Running task 1243 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_fetch: Started
NOTE: recipe make-4.4.1-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.3-r0: task do_patch: Started
NOTE: Running task 1244 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_unpack)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe iptables-1.8.13-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1245 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe shadow-4.20.3-r0: task do_unpack: Succeeded
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Started
NOTE: Running task 1246 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_patch)
NOTE: recipe iptables-1.8.13-r0: task do_patch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_patch: Succeeded
NOTE: Running task 1247 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_unpack)
NOTE: Running task 1249 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_unpack)
NOTE: Running task 1256 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_fetch)
NOTE: recipe psmisc-23.7-r0: task do_unpack: Started
NOTE: recipe libmpc-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Started
NOTE: Running task 1259 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.20.3-r0: task do_patch: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Started
NOTE: recipe gawk-5.4.1-r0: task do_unpack: Started
NOTE: recipe findutils-4.11.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.47-r0: task do_fetch: Succeeded
NOTE: Running task 1261 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1262 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe readline-8.3-r0: task do_patch: Succeeded
NOTE: Running task 1263 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_patch: Succeeded
NOTE: Running task 1264 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: Running task 1268 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1270 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1271 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb:do_patch)
NOTE: recipe make-4.4.1-r0: task do_unpack: Started
NOTE: Running task 1272 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe iproute2-7.2.0-r0: task do_fetch: Started
NOTE: recipe findutils-4.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1273 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_patch: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1278 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_unpack)
NOTE: Running task 1283 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1284 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_patch)
NOTE: Running task 1285 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe findutils-4.11.0-r0: task do_patch: Started
NOTE: recipe make-4.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libcap-ng-0.9.6-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.47-r0: task do_unpack: Started
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1286 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_patch)
NOTE: Running task 1288 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-3.14.7-r0: task do_unpack: Succeeded
NOTE: Running task 1289 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_patch)
NOTE: recipe gawk-5.4.1-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Started
NOTE: recipe psmisc-23.7-r0: task do_unpack: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_patch: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1290 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_patch)
NOTE: Running task 1291 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_deploy_source_date_epoch)
NOTE: recipe perl-5.44.0-r0: task do_unpack: Succeeded
NOTE: Running task 1292 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_package unihash changed to 359e92d27dc7b6f6d817e41a145c113dd00933c39c531340c9d763b21d6a97cd
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata became valid
NOTE: recipe libpsl-0.23.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Started
NOTE: recipe python3-3.14.7-r0: task do_patch: Started
NOTE: recipe iptables-1.8.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.4.1-r0: task do_patch: Succeeded
NOTE: recipe perl-5.44.0-r0: task do_patch: Started
NOTE: recipe util-linux-2.42.4-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe make-4.4.1-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch unihash changed to aa063ac73930f9993a29ed9021ae2d22fad0ee06a82a0d373f1654ed932dd133
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/iptables/iptables_1.8.13.bb:do_deploy_source_date_epoch unihash changed to 173358e5e1dabb3e4a38455309526549f67cc5abd67320a7efd77ff477428b23
NOTE: recipe perl-5.44.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 845 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_create_spdx_setscene)
NOTE: Running task 1293 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.42.4.bb:do_patch)
NOTE: Running task 1294 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1295 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_patch)
NOTE: Running task 1296 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1298 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_unpack)
NOTE: Running task 1300 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 1302 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1303 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1304 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1320 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.23.0.bb:do_create_recipe_spdx)
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-7.2.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Started
NOTE: recipe findutils-4.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe bsd-headers-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 871 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1322 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe python3-3.14.7-r0: task do_patch: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_patch)
NOTE: Running task 1327 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch unihash changed to 12abc4b3cf2acb9dab2fc74f7c6e898a956f34979126a641001b33a817eaa406
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe perl-5.44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe findutils-4.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 17d20b66bc4b3677e29411c8f6514f450dc782c967828a77dc44e9776e98176f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.44.0.bb:do_deploy_source_date_epoch unihash changed to f26e85312dde59c5f383ba359474b3e00226a5bf2c428871fdd7fb41805baf77
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx became valid
NOTE: recipe psmisc-23.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_patch: Started
NOTE: recipe curl-8.23.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/findutils/findutils_4.11.0.bb:do_deploy_source_date_epoch unihash changed to de8f0d8db5d278f863e0f1464bef8321a175ea1a30a24d1f40f64cc7e66887c0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_deploy_source_date_epoch unihash changed to e3eda05194a031e5c7d8e8d606146fe758dfdcea81a4eacba4542b78b1a23829
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.4.1.bb:do_deploy_source_date_epoch unihash changed to 40c0a82712dbdc4e90fb70f0589583e404b99b9ea1bfe9b5975e97479274421b
NOTE: Running setscene task 861 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running task 1334 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_create_recipe_spdx)
NOTE: Running task 1335 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_create_recipe_spdx)
NOTE: Running task 1336 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_create_recipe_spdx)
NOTE: Running task 1344 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_create_recipe_spdx)
NOTE: Running noexec task 1346 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_fetch)
NOTE: Running task 1349 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_create_recipe_spdx)
NOTE: Running task 1352 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_create_recipe_spdx)
NOTE: Running task 1376 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_create_recipe_spdx)
NOTE: recipe make-4.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_deploy_source_date_epoch unihash changed to 9065b99eef1299eafcace9d93146c25343890bee727624c09df4ce1efc35d41d
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.42.4-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx: Started
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Started
NOTE: recipe libarchive-3.8.9-r0: task do_create_recipe_spdx: Started
NOTE: recipe json-c-0.19-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1378 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1389 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_create_recipe_spdx)
NOTE: Running task 1390 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_recipe_spdx)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 871 of 871 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe iproute2-7.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_recipe_spdx: Started
NOTE: recipe nettle-4.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libseccomp-2.6.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1392 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_create_recipe_spdx)
NOTE: recipe json-c-0.19-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libcap-2.78-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1393 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_create_recipe_spdx)
NOTE: recipe libtasn1-4.21.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe file-5.48-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1394 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_create_recipe_spdx)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe iproute2-7.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_deploy_source_date_epoch unihash changed to 05790a14a94067cf032c45150e195b0d6d13cb591914406ab56e59a51f39c88e
NOTE: recipe coreutils-9.12-r0: task do_create_recipe_spdx: Started
NOTE: recipe gcc-16.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Started
NOTE: recipe make-4.4.1-r0: task do_create_recipe_spdx: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bash-5.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe coreutils-9.12-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe gnutls-3.8.13-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1397 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_create_recipe_spdx)
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_create_recipe_spdx: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1398 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_create_recipe_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f0aa88e3c9fe4568c522cd7c8c986e1f301d8f6a83227a8313f97a5121401199
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.197-r0: task do_create_recipe_spdx: Started
NOTE: recipe elfutils-0.197-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1399 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/iproute2/iproute2_7.2.0.bb:do_create_recipe_spdx)
NOTE: Running task 1400 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_create_recipe_spdx)
NOTE: recipe binutils-2.47-r0: task do_create_recipe_spdx: Started
NOTE: recipe iproute2-7.2.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1401 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe binutils-2.47-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe iproute2-7.2.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Setscene tasks completed
NOTE: Running task 1402 of 2046 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.197-r0: task do_patch: Failed
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.47-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 1402 tasks of which 1153 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261020060635.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261020060635.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/elfutils/0.197/temp/log.do_patch.1425990
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: elfutils-0.197-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/elfutils/0.197/sources/elfutils-0.197'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/elfutils/0.197/recipe-sysroot-native/etc/quiltrc push', 1, 'stdout: Patch 0003-musl-utils.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/elfutils/0.197/temp/log.do_patch.1425990
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.197.bb:do_patch) failed with exit code '1'

--===============0583498797932005806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/elfutils/elfutils-binutils: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-binutils: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-binutils: PKGSIZE changed from 1491624 to 1503912 (+1%)
packages/x86-64-v3-poky-linux/elfutils/elfutils-dbg: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-dbg: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-dbg: FILELIST: removed "/usr/lib/.debug/libelf-0.196.so /usr/lib/.debug/libasm-0.196.so /usr/lib/.debug/libdw-0.196.so /usr/lib/.debug/libdebuginfod-0.196.so", added "/usr/lib/elfutils/ptest/tests/.debug/dwflst-tracker-concurrent /usr/lib/.debug/libdebuginfod-0.197.so /usr/lib/.debug/libdw-0.197.so /usr/lib/.debug/libasm-0.197.so /usr/lib/.debug/libelf-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/elfutils-dbg: PKGSIZE changed from 40740400 to 40953888 (+1%)
packages/x86-64-v3-poky-linux/elfutils/elfutils-dev: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-dev: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-dev: PKGSIZE changed from 247305 to 247666 (+0%)
packages/x86-64-v3-poky-linux/elfutils/elfutils-doc: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-doc: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-de: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-de: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-en+boldquot: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-en+boldquot: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-en+boldquot: PKGSIZE changed from 195204 to 195960 (+0%)
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-en+quot: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-en+quot: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-en+quot: PKGSIZE changed from 192608 to 193364 (+0%)
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-es: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-es: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-ja: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-ja: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-ka: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-ka: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-pl: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-pl: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-uk: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-locale-uk: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-ptest: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-ptest: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-ptest: FILELIST: added "/usr/lib/elfutils/ptest/tests/testfile-unstrip-symtab0.stripped.bz2 /usr/lib/elfutils/ptest/tests/dwflst-tracker-concurrent.c /usr/lib/elfutils/ptest/tests/dwflst-tracker-concurrent /usr/lib/elfutils/ptest/tests/testfile-unstrip-symtab1.stripped.bz2 /usr/lib/elfutils/ptest/tests/run-unstrip-symtab-count.sh /usr/lib/elfutils/ptest/backends/alpha_initreg.o /usr/lib/elfutils/ptest/tests/dwflst_tracker_concurrent-dwflst-tracker-concurrent.o /usr/lib/elfutils/ptest/backends/alpha_cfi.o /usr/lib/elfutils/ptest/tests/testfile-unstrip-symtab0.debug.bz2 /usr/lib/elfutils/ptest/tests/run-dwflst-tracker-concurrent.sh /usr/lib/elfutils/ptest/backends/alpha_initreg_.os /usr/lib/elfutils/ptest/backends/alpha_initreg_sample.o /usr/lib/elfutils/ptest/tests/testfile-unstrip-symtab1.debug.bz2 /usr/lib/elfutils/ptest/backends/alpha_cfi_.os /usr/lib/elfutils/ptest/backends/alpha_initreg_sample_.os"
packages/x86-64-v3-poky-linux/elfutils/elfutils-ptest: PKGSIZE changed from 84935845 to 85263455 (+0%)
packages/x86-64-v3-poky-linux/elfutils/elfutils-src: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-src: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-src: FILELIST: directory renamed /usr/src/debug/elfutils/0.196/libdwfl -> /usr/src/debug/elfutils/0.197/libdwfl, directory renamed /usr/src/debug/elfutils/0.196/libdw -> /usr/src/debug/elfutils/0.197/libdw, directory renamed /usr/src/debug/elfutils/0.196/libdwfl_stacktrace -> /usr/src/debug/elfutils/0.197/libdwfl_stacktrace, directory renamed /usr/src/debug/elfutils/0.196/debuginfod -> /usr/src/debug/elfutils/0.197/debuginfod, directory renamed /usr/src/debug/elfutils/0.196/libasm -> /usr/src/debug/elfutils/0.197/libasm, directory renamed /usr/src/debug/elfutils/0.196/src -> /usr/src/debug/elfutils/0.197/src, directory renamed /usr/src/debug/elfutils/0.196/lib -> /usr/src/debug/elfutils/0.197/lib, directory renamed /usr/src/debug/elfutils/0.196/libcpu -> /usr/src/debug/elfutils/0.197/libcpu, directory renamed /usr/src/debug/elfutils/0.196/libelf -> /usr/src/debug/elfutils/0.197/libelf, directory renamed /usr/src/debug/elfutils/0.196/lib
 dwelf -> /usr/src/debug/elfutils/0.197/libdwelf, directory renamed /usr/src/debug/elfutils/0.196/libebl -> /usr/src/debug/elfutils/0.197/libebl, removed "/usr/src/debug/elfutils/0.196/tests/funcretval_test_struct.c /usr/src/debug/elfutils/0.196/tests/dwarf_default_lower_bound.c /usr/src/debug/elfutils/0.196/backends/bpf_reloc.def /usr/src/debug/elfutils/0.196/backends/arm_corenote.c /usr/src/debug/elfutils/0.196/backends/s390x_corenote.c /usr/src/debug/elfutils/0.196/tests/update3.c /usr/src/debug/elfutils/0.196/tests/alldts.c /usr/src/debug/elfutils/0.196/tests/ar-extract-ar.c /usr/src/debug/elfutils/0.196/tests/sectiondump.c /usr/src/debug/elfutils/0.196/backends/alpha_symbol.c /usr/src/debug/elfutils/0.196/backends/i386_initreg.c /usr/src/debug/elfutils/0.196/backends/x86_64_corenote.c /usr/src/debug/elfutils/0.196/backends/ppc64_reloc.def /usr/src/debug/elfutils/0.196/backends/sparc_reloc.def /usr/src/debug/elfutils/0.196/tests/scnnames.c /usr/src/debug/elfutils/0.196/backends/p
 pc_cfi.c /usr/src/debug/elfutils/0.196/backends/i386_auxv.c /usr/src/debug/elfutils/0.196/backends/i386_init.c /usr/src/debug/elfutils/0.196/backends/i386_regs.c /usr/src/debug/elfutils/0.196/backends/s390_cfi.c /usr/src/debug/elfutils/0.196/backends/s390_retval.c /usr/src/debug/elfutils/0.196/backends/s390_unwind.c /usr/src/debug/elfutils/0.196/tests/aggregate_size.c /usr/src/debug/elfutils/0.196/tests/dwfl-report-elf-align.c /usr/src/debug/elfutils/0.196/backends/bpf_init.c /usr/src/debug/elfutils/0.196/backends/bpf_regs.c /usr/src/debug/elfutils/0.196/tests/backtrace.c /usr/src/debug/elfutils/0.196/tests/test-elf_cntl_gelf_getshdr.c /usr/src/debug/elfutils/0.196/tests/get-files-define-file.c /usr/src/debug/elfutils/0.196/tests/dwfl-core-noncontig.c /usr/src/debug/elfutils/0.196/backends/m68k_init.c /usr/src/debug/elfutils/0.196/backends/m68k_regs.c /usr/src/debug/elfutils/0.196/tests/asm-tst5.c /usr/src/debug/elfutils/0.196/backends/mips_cfi.c /usr/src/debug/elfutils/0.196/backen
 ds/alpha_retval.c /usr/src/debug/elfutils/0.196/backends/aarch64_corenote.c /usr/src/debug/elfutils/0.196/backends/s390_symbol.c /usr/src/debug/elfutils/0.196/backends/sh_corenote.c /usr/src/debug/elfutils/0.196/tests/dwarf-die-addr-die.c /usr/src/debug/elfutils/0.196/tests/funcretval_test++11.cxx /usr/src/debug/elfutils/0.196/tests/saridx.c /usr/src/debug/elfutils/0.196/backends/m68k_corenote.c /usr/src/debug/elfutils/0.196/backends/sh_reloc.def /usr/src/debug/elfutils/0.196/tests/dwfl-bug-report.c /usr/src/debug/elfutils/0.196/tests/elf-from-memory.c /usr/src/debug/elfutils/0.196/backends/csky_initreg.c /usr/src/debug/elfutils/0.196/tests/asm-tst3.c /usr/src/debug/elfutils/0.196/tests/eu_search_macros.c /usr/src/debug/elfutils/0.196/tests/show-abbrev.c /usr/src/debug/elfutils/0.196/backends/ppc64_symbol.c /usr/src/debug/elfutils/0.196/backends/ppc_corenote.c /usr/src/debug/elfutils/0.196/backends/sparc_symbol.c /usr/src/debug/elfutils/0.196/backends/aarch64_symbol.c /usr/src/debug
 /elfutils/0.196/tests/showptable.c /usr/src/debug/elfutils/0.196/tests/debuginfod_build_id_find.c /usr/src/debug/elfutils/0.196/backends/riscv_retval.c /usr/src/debug/elfutils/0.196/backends/alpha_reloc.def /usr/src/debug/elfutils/0.196/tests/dwelfgnucompressed.c /usr/src/debug/elfutils/0.196/backends/loongarch_unwind.c /usr/src/debug/elfutils/0.196/backends/loongarch_symbol.c /usr/src/debug/elfutils/0.196/backends/common-reloc.c /usr/src/debug/elfutils/0.196/backends/ia64_retval.c /usr/src/debug/elfutils/0.196/backends/riscv_reloc.def /usr/src/debug/elfutils/0.196/tests/asm-tst7.c /usr/src/debug/elfutils/0.196/backends/riscv_initreg.c /usr/src/debug/elfutils/0.196/tests/attr-integrate-skel.c /usr/src/debug/elfutils/0.196/backends/x86_64_retval.c /usr/src/debug/elfutils/0.196/tests/getsrc_die.c /usr/src/debug/elfutils/0.196/backends/arm_machineflagname.c /usr/src/debug/elfutils/0.196/backends/x86_initreg_sample.c /usr/src/debug/elfutils/0.196/backends/loongarch_regs.c /usr/src/debug
 /elfutils/0.196/backends/m68k_symbol.c /usr/src/debug/elfutils/0.196/backends/loongarch_cfi.c /usr/src/debug/elfutils/0.196/tests/declfiles.c /usr/src/debug/elfutils/0.196/tests/get-files.c /usr/src/debug/elfutils/0.196/tests/typeiter2.c /usr/src/debug/elfutils/0.196/backends/ppc64_corenote.c /usr/src/debug/elfutils/0.196/backends/sparc_corenote.c /usr/src/debug/elfutils/0.196/tests/get-units-invalid.c /usr/src/debug/elfutils/0.196/backends/i386_reloc.def /usr/src/debug/elfutils/0.196/backends/arc_reloc.def /usr/src/debug/elfutils/0.196/backends/arm_reloc.def /usr/src/debug/elfutils/0.196/backends/i386_corenote.c /usr/src/debug/elfutils/0.196/backends/sparc_auxv.c /usr/src/debug/elfutils/0.196/tests/dwarfcfi.c /usr/src/debug/elfutils/0.196/tests/dwelf_elf_e_machine_string.c /usr/src/debug/elfutils/0.196/backends/loongarch_initreg.c /usr/src/debug/elfutils/0.196/tests/newzdata.c /usr/src/debug/elfutils/0.196/backends/sparc_initreg.c /usr/src/debug/elfutils/0.196/tests/peel_type.c /us
 r/src/debug/elfutils/0.196/backends/loongarch_init.c /usr/src/debug/elfutils/0.196/backends/ppc64_init.c /usr/src/debug/elfutils/0.196/backends/sparc_init.c /usr/src/debug/elfutils/0.196/backends/x86_64_init.c /usr/src/debug/elfutils/0.196/backends/x86_64_reloc.def /usr/src/debug/elfutils/0.196/tests/arsymtest.c /usr/src/debug/elfutils/0.196/tests/line2addr.c /usr/src/debug/elfutils/0.196/tests/next-files.c /usr/src/debug/elfutils/0.196/backends/loongarch_reloc.def /usr/src/debug/elfutils/0.196/backends/riscv_cfi.c /usr/src/debug/elfutils/0.196/tests/debuglink.c /usr/src/debug/elfutils/0.196/backends/ia64_reloc.def /usr/src/debug/elfutils/0.196/tests/newfile.c /usr/src/debug/elfutils/0.196/tests/find-prologues.c /usr/src/debug/elfutils/0.196/tests/core-ioperm-huge.c /usr/src/debug/elfutils/0.196/backends/aarch64_regs.c /usr/src/debug/elfutils/0.196/backends/m68k_initreg.c /usr/src/debug/elfutils/0.196/tests/dwfl-bug-addr-overflow.c /usr/src/debug/elfutils/0.196/tests/next_cfi.c /usr
 /src/debug/elfutils/0.196/tests/elfputzdata.c /usr/src/debug/elfutils/0.196/tests/rerequest_tag.c /usr/src/debug/elfutils/0.196/tests/zstrptr.c /usr/src/debug/elfutils/0.196/backends/ia64_init.c /usr/src/debug/elfutils/0.196/backends/ia64_regs.c /usr/src/debug/elfutils/0.196/backends/mips_symbol.c /usr/src/debug/elfutils/0.196/backends/aarch64_unwind.c /usr/src/debug/elfutils/0.196/backends/aarch64_initreg.c /usr/src/debug/elfutils/0.196/tests/newdata.c /usr/src/debug/elfutils/0.196/backends/x86_64_symbol.c /usr/src/debug/elfutils/0.196/backends/sh_init.c /usr/src/debug/elfutils/0.196/backends/csky_corenote.c /usr/src/debug/elfutils/0.196/tests/ar-getarsym-mem.c /usr/src/debug/elfutils/0.196/tests/eu_search_die.c /usr/src/debug/elfutils/0.196/backends/ppc_retval.c /usr/src/debug/elfutils/0.196/backends/ppc_symbol.c /usr/src/debug/elfutils/0.196/backends/m68k_cfi.c /usr/src/debug/elfutils/0.196/backends/ppc_initreg.c /usr/src/debug/elfutils/0.196/tests/dwarf-getstring.c /usr/src/debu
 g/elfutils/0.196/tests/dwfl-kernel-module-section-address.c /usr/src/debug/elfutils/0.196/tests/low_high_pc.c /usr/src/debug/elfutils/0.196/tests/system-elf-gelf-test.c /usr/src/debug/elfutils/0.196/tests/update1.c /usr/src/debug/elfutils/0.196/backends/sparc64_corenote.c /usr/src/debug/elfutils/0.196/tests/typeiter.c /usr/src/debug/elfutils/0.196/backends/alpha_regs.c /usr/src/debug/elfutils/0.196/backends/linux-core-note.c /usr/src/debug/elfutils/0.196/backends/mips_retval.c /usr/src/debug/elfutils/0.196/backends/ppc64_resolve_sym.c /usr/src/debug/elfutils/0.196/backends/libebl_PERF_FLAGS.h /usr/src/debug/elfutils/0.196/backends/x32_corenote.c /usr/src/debug/elfutils/0.196/backends/ppc64_unwind.c /usr/src/debug/elfutils/0.196/backends/x86_64_regs.c /usr/src/debug/elfutils/0.196/tests/elfgetzdata.c /usr/src/debug/elfutils/0.196/tests/asm-tst8.c /usr/src/debug/elfutils/0.196/backends/aarch64_init.c /usr/src/debug/elfutils/0.196/tests/addrscopes.c /usr/src/debug/elfutils/0.196/backen
 ds/mips_corenote.c /usr/src/debug/elfutils/0.196/tests/dwfl-bug-fd-leak.c /usr/src/debug/elfutils/0.196/tests/funcscopes.c /usr/src/debug/elfutils/0.196/tests/next-lines.c /usr/src/debug/elfutils/0.196/tests/unit-info.c /usr/src/debug/elfutils/0.196/backends/ppc_reloc.def /usr/src/debug/elfutils/0.196/tests/asm-tst2.c /usr/src/debug/elfutils/0.196/tests/get-aranges.c /usr/src/debug/elfutils/0.196/tests/addrcfi.c /usr/src/debug/elfutils/0.196/tests/emptyfile.c /usr/src/debug/elfutils/0.196/tests/dwelf-dwarf-debug-sup.c /usr/src/debug/elfutils/0.196/backends/s390_initreg.c /usr/src/debug/elfutils/0.196/tests/dwflmodtest.c /usr/src/debug/elfutils/0.196/backends/hexagon_symbol.c /usr/src/debug/elfutils/0.196/tests/dwfl-proc-attach.c /usr/src/debug/elfutils/0.196/tests/debugaltlink.c /usr/src/debug/elfutils/0.196/tests/dwfl-report-segment-contiguous.c /usr/src/debug/elfutils/0.196/backends/ia64_symbol.c /usr/src/debug/elfutils/0.196/backends/sh_retval.c /usr/src/debug/elfutils/0.196/back
 ends/sh_symbol.c /usr/src/debug/elfutils/0.196/tests/get-lines.c /usr/src/debug/elfutils/0.196/tests/ecp.c /usr/src/debug/elfutils/0.196/backends/i386_retval.c /usr/src/debug/elfutils/0.196/backends/i386_unwind.c /usr/src/debug/elfutils/0.196/backends/s390_init.c /usr/src/debug/elfutils/0.196/backends/s390_regs.c /usr/src/debug/elfutils/0.196/backends/i386_cfi.c /usr/src/debug/elfutils/0.196/backends/ppc_auxv.c /usr/src/debug/elfutils/0.196/backends/ppc_init.c /usr/src/debug/elfutils/0.196/backends/ppc_regs.c /usr/src/debug/elfutils/0.196/backends/x86_64_initreg_sample.c /usr/src/debug/elfutils/0.196/tests/dwfl-report-offline-memory.c /usr/src/debug/elfutils/0.196/tests/elfgetchdr.c /usr/src/debug/elfutils/0.196/tests/getphdrnum.c /usr/src/debug/elfutils/0.196/tests/newscn.c /usr/src/debug/elfutils/0.196/tests/rdwrmmap.c /usr/src/debug/elfutils/0.196/tests/dwarf_language_lower_bound.c /usr/src/debug/elfutils/0.196/tests/cu-dwp-section-info.c /usr/src/debug/elfutils/0.196/tests/build
 id.c /usr/src/debug/elfutils/0.196/tests/elfrdwrnop.c /usr/src/debug/elfutils/0.196/tests/dwarf-type.c /usr/src/debug/elfutils/0.196/backends/i386_symbol.c /usr/src/debug/elfutils/0.196/tests/elf-print-reloc-syms.c /usr/src/debug/elfutils/0.196/backends/riscv_init.c /usr/src/debug/elfutils/0.196/backends/i386_initreg_sample.c /usr/src/debug/elfutils/0.196/backends/m68k_retval.c /usr/src/debug/elfutils/0.196/tests/allfcts.c /usr/src/debug/elfutils/0.196/tests/dwarf-getmacros.c /usr/src/debug/elfutils/0.196/backends/hexagon_reloc.def /usr/src/debug/elfutils/0.196/tests/all-dwarf-ranges.c /usr/src/debug/elfutils/0.196/backends/arm_attrs.c /usr/src/debug/elfutils/0.196/backends/alpha_init.c /usr/src/debug/elfutils/0.196/backends/alpha_corenote.c /usr/src/debug/elfutils/0.196/backends/aarch64_cfi.c /usr/src/debug/elfutils/0.196/tests/read_unaligned.c /usr/src/debug/elfutils/0.196/backends/csky_init.c /usr/src/debug/elfutils/0.196/backends/csky_regs.c /usr/src/debug/elfutils/0.196/backend
 s/mips_reloc.def /usr/src/debug/elfutils/0.196/tests/fillfile.c /usr/src/debug/elfutils/0.196/backends/loongarch_retval.c /usr/src/debug/elfutils/0.196/tests/strptr.c /usr/src/debug/elfutils/0.196/tests/asm-tst9.c /usr/src/debug/elfutils/0.196/backends/libebl_CPU.h /usr/src/debug/elfutils/0.196/tests/dwfl-bug-getmodules.c /usr/src/debug/elfutils/0.196/tests/deleted-lib.c /usr/src/debug/elfutils/0.196/tests/asm-tst1.c /usr/src/debug/elfutils/0.196/tests/vendorelf.c /usr/src/debug/elfutils/0.196/backends/csky_symbol.c /usr/src/debug/elfutils/0.196/backends/mips_unwind.c /usr/src/debug/elfutils/0.196/backends/s390_reloc.def /usr/src/debug/elfutils/0.196/backends/s390_corenote.c /usr/src/debug/elfutils/0.196/tests/update2.c /usr/src/debug/elfutils/0.196/tests/elfcopy.c /usr/src/debug/elfutils/0.196/tests/update4.c /usr/src/debug/elfutils/0.196/backends/sparc_attrs.c /usr/src/debug/elfutils/0.196/backends/x86_64_initreg.c /usr/src/debug/elfutils/0.196/tests/test-flag-nobits.c /usr/src/de
 bug/elfutils/0.196/backends/arc_init.c /usr/src/debug/elfutils/0.196/backends/arm_auxv.c /usr/src/debug/elfutils/0.196/backends/arm_init.c /usr/src/debug/elfutils/0.196/backends/arm_regs.c /usr/src/debug/elfutils/0.196/backends/loongarch_corenote.c /usr/src/debug/elfutils/0.196/backends/arm_cfi.c /usr/src/debug/elfutils/0.196/tests/arls.c /usr/src/debug/elfutils/0.196/tests/hash.c /usr/src/debug/elfutils/0.196/tests/dwarf-ranges.c /usr/src/debug/elfutils/0.196/tests/dwfl-addr-sect.c /usr/src/debug/elfutils/0.196/backends/riscv64_corenote.c /usr/src/debug/elfutils/0.196/backends/riscv_symbol.c /usr/src/debug/elfutils/0.196/backends/x86_corenote.c /usr/src/debug/elfutils/0.196/tests/eu_search_lines.c /usr/src/debug/elfutils/0.196/backends/ppc64_retval.c /usr/src/debug/elfutils/0.196/backends/mips_init.c /usr/src/debug/elfutils/0.196/backends/mips_regs.c /usr/src/debug/elfutils/0.196/backends/sparc_retval.c /usr/src/debug/elfutils/0.196/backends/aarch64_retval.c /usr/src/debug/elfutils
 /0.196/tests/get-units-split.c /usr/src/debug/elfutils/0.196/tests/nvidia_extended_linemap_libdw.c /usr/src/debug/elfutils/0.196/tests/msg_tst.c /usr/src/debug/elfutils/0.196/backends/arm_initreg.c /usr/src/debug/elfutils/0.196/backends/mips_initreg.c /usr/src/debug/elfutils/0.196/backends/arm_initreg_sample.c /usr/src/debug/elfutils/0.196/backends/riscv_regs.c /usr/src/debug/elfutils/0.196/tests/show-die-info.c /usr/src/debug/elfutils/0.196/tests/asm-tst4.c /usr/src/debug/elfutils/0.196/backends/x86_64_cfi.c /usr/src/debug/elfutils/0.196/tests/dwflsyms.c /usr/src/debug/elfutils/0.196/tests/allregs.c /usr/src/debug/elfutils/0.196/tests/vdsosyms.c /usr/src/debug/elfutils/0.196/backends/csky_attrs.c /usr/src/debug/elfutils/0.196/backends/csky_reloc.def /usr/src/debug/elfutils/0.196/tests/early-offscn.c /usr/src/debug/elfutils/0.196/tests/eu_search_cfi.c /usr/src/debug/elfutils/0.196/backends/riscv_corenote.c /usr/src/debug/elfutils/0.196/backends/x86_64_unwind.c /usr/src/debug/elfutil
 s/0.196/tests/funcretval.c /usr/src/debug/elfutils/0.196/backends/bpf_symbol.c /usr/src/debug/elfutils/0.196/backends/hexagon_init.c /usr/src/debug/elfutils/0.196/tests/elfshphehdr.c /usr/src/debug/elfutils/0.196/backends/m68k_reloc.def /usr/src/debug/elfutils/0.196/tests/arextract.c /usr/src/debug/elfutils/0.196/backends/aarch64_reloc.def /usr/src/debug/elfutils/0.196/tests/elfstrtab.c /usr/src/debug/elfutils/0.196/tests/varlocs.c /usr/src/debug/elfutils/0.196/backends/ppc_attrs.c /usr/src/debug/elfutils/0.196/backends/alpha_auxv.c /usr/src/debug/elfutils/0.196/backends/csky_cfi.c /usr/src/debug/elfutils/0.196/backends/sparc_cfi.c /usr/src/debug/elfutils/0.196/backends/arc_symbol.c /usr/src/debug/elfutils/0.196/backends/arm_retval.c /usr/src/debug/elfutils/0.196/backends/arm_symbol.c /usr/src/debug/elfutils/0.196/tests/addsections.c /usr/src/debug/elfutils/0.196/backends/aarch64_initreg_sample.c /usr/src/debug/elfutils/0.196/tests/test-manyfuncs.c /usr/src/debug/elfutils/0.196/test
 s/xlate_notes.c /usr/src/debug/elfutils/0.196/backends/sparc_regs.c /usr/src/debug/elfutils/0.196/backends/sh_regs.c /usr/src/debug/elfutils/0.196/tests/asm-tst6.c /usr/src/debug/elfutils/0.196/tests/get-pubnames.c /usr/src/debug/elfutils/0.196/tests/leb128.c /usr/src/debug/elfutils/0.196/tests/system-elf-libelf-test.c", added "/usr/src/debug/elfutils/0.197/tests/funcretval_test_struct.c /usr/src/debug/elfutils/0.197/tests/dwarf_default_lower_bound.c /usr/src/debug/elfutils/0.197/backends/bpf_reloc.def /usr/src/debug/elfutils/0.197/backends/arm_corenote.c /usr/src/debug/elfutils/0.197/backends/s390x_corenote.c /usr/src/debug/elfutils/0.197/tests/update3.c /usr/src/debug/elfutils/0.197/tests/alldts.c /usr/src/debug/elfutils/0.197/tests/ar-extract-ar.c /usr/src/debug/elfutils/0.197/tests/sectiondump.c /usr/src/debug/elfutils/0.197/backends/alpha_symbol.c /usr/src/debug/elfutils/0.197/backends/i386_initreg.c /usr/src/debug/elfutils/0.197/backends/x86_64_corenote.c /usr/src/debug/elfuti
 ls/0.197/backends/ppc64_reloc.def /usr/src/debug/elfutils/0.197/backends/sparc_reloc.def /usr/src/debug/elfutils/0.197/tests/scnnames.c /usr/src/debug/elfutils/0.197/backends/ppc_cfi.c /usr/src/debug/elfutils/0.197/backends/i386_auxv.c /usr/src/debug/elfutils/0.197/backends/i386_init.c /usr/src/debug/elfutils/0.197/backends/i386_regs.c /usr/src/debug/elfutils/0.197/backends/s390_cfi.c /usr/src/debug/elfutils/0.197/backends/s390_retval.c /usr/src/debug/elfutils/0.197/backends/s390_unwind.c /usr/src/debug/elfutils/0.197/tests/aggregate_size.c /usr/src/debug/elfutils/0.197/tests/dwfl-report-elf-align.c /usr/src/debug/elfutils/0.197/backends/bpf_init.c /usr/src/debug/elfutils/0.197/backends/bpf_regs.c /usr/src/debug/elfutils/0.197/tests/dwflst-tracker-concurrent.c /usr/src/debug/elfutils/0.197/tests/backtrace.c /usr/src/debug/elfutils/0.197/tests/test-elf_cntl_gelf_getshdr.c /usr/src/debug/elfutils/0.197/tests/get-files-define-file.c /usr/src/debug/elfutils/0.197/tests/dwfl-core-noncont
 ig.c /usr/src/debug/elfutils/0.197/backends/m68k_init.c /usr/src/debug/elfutils/0.197/backends/m68k_regs.c /usr/src/debug/elfutils/0.197/tests/asm-tst5.c /usr/src/debug/elfutils/0.197/backends/alpha_cfi.c /usr/src/debug/elfutils/0.197/backends/mips_cfi.c /usr/src/debug/elfutils/0.197/backends/alpha_retval.c /usr/src/debug/elfutils/0.197/backends/aarch64_corenote.c /usr/src/debug/elfutils/0.197/backends/s390_symbol.c /usr/src/debug/elfutils/0.197/backends/sh_corenote.c /usr/src/debug/elfutils/0.197/tests/dwarf-die-addr-die.c /usr/src/debug/elfutils/0.197/tests/funcretval_test++11.cxx /usr/src/debug/elfutils/0.197/tests/saridx.c /usr/src/debug/elfutils/0.197/backends/m68k_corenote.c /usr/src/debug/elfutils/0.197/backends/sh_reloc.def /usr/src/debug/elfutils/0.197/tests/dwfl-bug-report.c /usr/src/debug/elfutils/0.197/tests/elf-from-memory.c /usr/src/debug/elfutils/0.197/backends/alpha_initreg.c /usr/src/debug/elfutils/0.197/backends/csky_initreg.c /usr/src/debug/elfutils/0.197/tests/as
 m-tst3.c /usr/src/debug/elfutils/0.197/tests/eu_search_macros.c /usr/src/debug/elfutils/0.197/backends/ppc64_symbol.c /usr/src/debug/elfutils/0.197/backends/ppc_corenote.c /usr/src/debug/elfutils/0.197/backends/sparc_symbol.c /usr/src/debug/elfutils/0.197/backends/aarch64_symbol.c /usr/src/debug/elfutils/0.197/tests/show-abbrev.c /usr/src/debug/elfutils/0.197/tests/debuginfod_build_id_find.c /usr/src/debug/elfutils/0.197/tests/showptable.c /usr/src/debug/elfutils/0.197/backends/riscv_retval.c /usr/src/debug/elfutils/0.197/backends/alpha_reloc.def /usr/src/debug/elfutils/0.197/tests/dwelfgnucompressed.c /usr/src/debug/elfutils/0.197/backends/loongarch_symbol.c /usr/src/debug/elfutils/0.197/backends/loongarch_unwind.c /usr/src/debug/elfutils/0.197/backends/common-reloc.c /usr/src/debug/elfutils/0.197/backends/ia64_retval.c /usr/src/debug/elfutils/0.197/backends/riscv_reloc.def /usr/src/debug/elfutils/0.197/tests/asm-tst7.c /usr/src/debug/elfutils/0.197/backends/riscv_initreg.c /usr/sr
 c/debug/elfutils/0.197/tests/attr-integrate-skel.c /usr/src/debug/elfutils/0.197/backends/x86_64_retval.c /usr/src/debug/elfutils/0.197/tests/getsrc_die.c /usr/src/debug/elfutils/0.197/backends/arm_machineflagname.c /usr/src/debug/elfutils/0.197/backends/x86_initreg_sample.c /usr/src/debug/elfutils/0.197/backends/loongarch_regs.c /usr/src/debug/elfutils/0.197/backends/m68k_symbol.c /usr/src/debug/elfutils/0.197/backends/loongarch_cfi.c /usr/src/debug/elfutils/0.197/tests/declfiles.c /usr/src/debug/elfutils/0.197/tests/get-files.c /usr/src/debug/elfutils/0.197/tests/typeiter2.c /usr/src/debug/elfutils/0.197/backends/ppc64_corenote.c /usr/src/debug/elfutils/0.197/backends/sparc_corenote.c /usr/src/debug/elfutils/0.197/tests/get-units-invalid.c /usr/src/debug/elfutils/0.197/backends/i386_reloc.def /usr/src/debug/elfutils/0.197/backends/arc_reloc.def /usr/src/debug/elfutils/0.197/backends/arm_reloc.def /usr/src/debug/elfutils/0.197/backends/i386_corenote.c /usr/src/debug/elfutils/0.197/
 backends/sparc_auxv.c /usr/src/debug/elfutils/0.197/tests/dwarfcfi.c /usr/src/debug/elfutils/0.197/tests/dwelf_elf_e_machine_string.c /usr/src/debug/elfutils/0.197/backends/loongarch_initreg.c /usr/src/debug/elfutils/0.197/tests/newzdata.c /usr/src/debug/elfutils/0.197/backends/sparc_initreg.c /usr/src/debug/elfutils/0.197/tests/peel_type.c /usr/src/debug/elfutils/0.197/backends/loongarch_init.c /usr/src/debug/elfutils/0.197/backends/ppc64_init.c /usr/src/debug/elfutils/0.197/backends/sparc_init.c /usr/src/debug/elfutils/0.197/backends/x86_64_init.c /usr/src/debug/elfutils/0.197/backends/x86_64_reloc.def /usr/src/debug/elfutils/0.197/tests/arsymtest.c /usr/src/debug/elfutils/0.197/backends/alpha_initreg_sample.c /usr/src/debug/elfutils/0.197/tests/line2addr.c /usr/src/debug/elfutils/0.197/backends/loongarch_reloc.def /usr/src/debug/elfutils/0.197/backends/riscv_cfi.c /usr/src/debug/elfutils/0.197/tests/debuglink.c /usr/src/debug/elfutils/0.197/backends/ia64_reloc.def /usr/src/debug/
 elfutils/0.197/tests/newfile.c /usr/src/debug/elfutils/0.197/tests/next-files.c /usr/src/debug/elfutils/0.197/tests/find-prologues.c /usr/src/debug/elfutils/0.197/tests/core-ioperm-huge.c /usr/src/debug/elfutils/0.197/backends/aarch64_regs.c /usr/src/debug/elfutils/0.197/backends/m68k_initreg.c /usr/src/debug/elfutils/0.197/tests/dwfl-bug-addr-overflow.c /usr/src/debug/elfutils/0.197/tests/next_cfi.c /usr/src/debug/elfutils/0.197/tests/elfputzdata.c /usr/src/debug/elfutils/0.197/tests/rerequest_tag.c /usr/src/debug/elfutils/0.197/tests/zstrptr.c /usr/src/debug/elfutils/0.197/backends/ia64_init.c /usr/src/debug/elfutils/0.197/backends/ia64_regs.c /usr/src/debug/elfutils/0.197/backends/mips_symbol.c /usr/src/debug/elfutils/0.197/backends/aarch64_unwind.c /usr/src/debug/elfutils/0.197/backends/aarch64_initreg.c /usr/src/debug/elfutils/0.197/tests/newdata.c /usr/src/debug/elfutils/0.197/backends/x86_64_symbol.c /usr/src/debug/elfutils/0.197/backends/sh_init.c /usr/src/debug/elfutils/0.1
 97/backends/csky_corenote.c /usr/src/debug/elfutils/0.197/tests/ar-getarsym-mem.c /usr/src/debug/elfutils/0.197/tests/eu_search_die.c /usr/src/debug/elfutils/0.197/backends/ppc_retval.c /usr/src/debug/elfutils/0.197/backends/ppc_symbol.c /usr/src/debug/elfutils/0.197/backends/m68k_cfi.c /usr/src/debug/elfutils/0.197/backends/ppc_initreg.c /usr/src/debug/elfutils/0.197/tests/dwarf-getstring.c /usr/src/debug/elfutils/0.197/tests/dwfl-kernel-module-section-address.c /usr/src/debug/elfutils/0.197/tests/low_high_pc.c /usr/src/debug/elfutils/0.197/tests/system-elf-gelf-test.c /usr/src/debug/elfutils/0.197/tests/update1.c /usr/src/debug/elfutils/0.197/backends/sparc64_corenote.c /usr/src/debug/elfutils/0.197/tests/typeiter.c /usr/src/debug/elfutils/0.197/backends/alpha_regs.c /usr/src/debug/elfutils/0.197/backends/linux-core-note.c /usr/src/debug/elfutils/0.197/backends/mips_retval.c /usr/src/debug/elfutils/0.197/backends/ppc64_resolve_sym.c /usr/src/debug/elfutils/0.197/backends/libebl_PE
 RF_FLAGS.h /usr/src/debug/elfutils/0.197/backends/x32_corenote.c /usr/src/debug/elfutils/0.197/backends/ppc64_unwind.c /usr/src/debug/elfutils/0.197/backends/x86_64_regs.c /usr/src/debug/elfutils/0.197/tests/elfgetzdata.c /usr/src/debug/elfutils/0.197/tests/asm-tst8.c /usr/src/debug/elfutils/0.197/backends/aarch64_init.c /usr/src/debug/elfutils/0.197/tests/addrscopes.c /usr/src/debug/elfutils/0.197/backends/mips_corenote.c /usr/src/debug/elfutils/0.197/tests/dwfl-bug-fd-leak.c /usr/src/debug/elfutils/0.197/tests/funcscopes.c /usr/src/debug/elfutils/0.197/tests/next-lines.c /usr/src/debug/elfutils/0.197/tests/unit-info.c /usr/src/debug/elfutils/0.197/backends/ppc_reloc.def /usr/src/debug/elfutils/0.197/tests/asm-tst2.c /usr/src/debug/elfutils/0.197/tests/get-aranges.c /usr/src/debug/elfutils/0.197/tests/addrcfi.c /usr/src/debug/elfutils/0.197/tests/emptyfile.c /usr/src/debug/elfutils/0.197/tests/dwelf-dwarf-debug-sup.c /usr/src/debug/elfutils/0.197/backends/s390_initreg.c /usr/src/de
 bug/elfutils/0.197/tests/dwflmodtest.c /usr/src/debug/elfutils/0.197/backends/hexagon_symbol.c /usr/src/debug/elfutils/0.197/tests/dwfl-proc-attach.c /usr/src/debug/elfutils/0.197/tests/debugaltlink.c /usr/src/debug/elfutils/0.197/tests/dwfl-report-segment-contiguous.c /usr/src/debug/elfutils/0.197/backends/ia64_symbol.c /usr/src/debug/elfutils/0.197/backends/sh_retval.c /usr/src/debug/elfutils/0.197/backends/sh_symbol.c /usr/src/debug/elfutils/0.197/tests/get-lines.c /usr/src/debug/elfutils/0.197/tests/ecp.c /usr/src/debug/elfutils/0.197/backends/i386_retval.c /usr/src/debug/elfutils/0.197/backends/i386_unwind.c /usr/src/debug/elfutils/0.197/backends/s390_init.c /usr/src/debug/elfutils/0.197/backends/s390_regs.c /usr/src/debug/elfutils/0.197/backends/i386_cfi.c /usr/src/debug/elfutils/0.197/backends/ppc_auxv.c /usr/src/debug/elfutils/0.197/backends/ppc_init.c /usr/src/debug/elfutils/0.197/backends/ppc_regs.c /usr/src/debug/elfutils/0.197/backends/x86_64_initreg_sample.c /usr/src/de
 bug/elfutils/0.197/tests/dwfl-report-offline-memory.c /usr/src/debug/elfutils/0.197/tests/elfgetchdr.c /usr/src/debug/elfutils/0.197/tests/getphdrnum.c /usr/src/debug/elfutils/0.197/tests/newscn.c /usr/src/debug/elfutils/0.197/tests/rdwrmmap.c /usr/src/debug/elfutils/0.197/tests/dwarf_language_lower_bound.c /usr/src/debug/elfutils/0.197/tests/cu-dwp-section-info.c /usr/src/debug/elfutils/0.197/tests/buildid.c /usr/src/debug/elfutils/0.197/tests/elfrdwrnop.c /usr/src/debug/elfutils/0.197/tests/dwarf-type.c /usr/src/debug/elfutils/0.197/backends/i386_symbol.c /usr/src/debug/elfutils/0.197/tests/elf-print-reloc-syms.c /usr/src/debug/elfutils/0.197/backends/riscv_init.c /usr/src/debug/elfutils/0.197/backends/i386_initreg_sample.c /usr/src/debug/elfutils/0.197/backends/m68k_retval.c /usr/src/debug/elfutils/0.197/tests/allfcts.c /usr/src/debug/elfutils/0.197/tests/dwarf-getmacros.c /usr/src/debug/elfutils/0.197/backends/hexagon_reloc.def /usr/src/debug/elfutils/0.197/tests/all-dwarf-range
 s.c /usr/src/debug/elfutils/0.197/backends/arm_attrs.c /usr/src/debug/elfutils/0.197/backends/alpha_init.c /usr/src/debug/elfutils/0.197/backends/alpha_corenote.c /usr/src/debug/elfutils/0.197/backends/aarch64_cfi.c /usr/src/debug/elfutils/0.197/tests/read_unaligned.c /usr/src/debug/elfutils/0.197/backends/csky_init.c /usr/src/debug/elfutils/0.197/backends/csky_regs.c /usr/src/debug/elfutils/0.197/backends/mips_reloc.def /usr/src/debug/elfutils/0.197/tests/fillfile.c /usr/src/debug/elfutils/0.197/backends/loongarch_retval.c /usr/src/debug/elfutils/0.197/tests/strptr.c /usr/src/debug/elfutils/0.197/tests/asm-tst9.c /usr/src/debug/elfutils/0.197/backends/libebl_CPU.h /usr/src/debug/elfutils/0.197/tests/dwfl-bug-getmodules.c /usr/src/debug/elfutils/0.197/tests/deleted-lib.c /usr/src/debug/elfutils/0.197/tests/asm-tst1.c /usr/src/debug/elfutils/0.197/tests/vendorelf.c /usr/src/debug/elfutils/0.197/backends/csky_symbol.c /usr/src/debug/elfutils/0.197/backends/mips_unwind.c /usr/src/debug
 /elfutils/0.197/backends/s390_reloc.def /usr/src/debug/elfutils/0.197/backends/s390_corenote.c /usr/src/debug/elfutils/0.197/tests/update2.c /usr/src/debug/elfutils/0.197/tests/elfcopy.c /usr/src/debug/elfutils/0.197/tests/update4.c /usr/src/debug/elfutils/0.197/backends/sparc_attrs.c /usr/src/debug/elfutils/0.197/backends/x86_64_initreg.c /usr/src/debug/elfutils/0.197/tests/test-flag-nobits.c /usr/src/debug/elfutils/0.197/backends/arc_init.c /usr/src/debug/elfutils/0.197/backends/arm_auxv.c /usr/src/debug/elfutils/0.197/backends/arm_init.c /usr/src/debug/elfutils/0.197/backends/arm_regs.c /usr/src/debug/elfutils/0.197/backends/loongarch_corenote.c /usr/src/debug/elfutils/0.197/backends/arm_cfi.c /usr/src/debug/elfutils/0.197/tests/arls.c /usr/src/debug/elfutils/0.197/tests/hash.c /usr/src/debug/elfutils/0.197/tests/dwarf-ranges.c /usr/src/debug/elfutils/0.197/tests/dwfl-addr-sect.c /usr/src/debug/elfutils/0.197/backends/riscv64_corenote.c /usr/src/debug/elfutils/0.197/backends/risc
 v_symbol.c /usr/src/debug/elfutils/0.197/backends/x86_corenote.c /usr/src/debug/elfutils/0.197/tests/eu_search_lines.c /usr/src/debug/elfutils/0.197/backends/ppc64_retval.c /usr/src/debug/elfutils/0.197/backends/mips_init.c /usr/src/debug/elfutils/0.197/backends/mips_regs.c /usr/src/debug/elfutils/0.197/backends/sparc_retval.c /usr/src/debug/elfutils/0.197/backends/aarch64_retval.c /usr/src/debug/elfutils/0.197/tests/get-units-split.c /usr/src/debug/elfutils/0.197/tests/nvidia_extended_linemap_libdw.c /usr/src/debug/elfutils/0.197/tests/msg_tst.c /usr/src/debug/elfutils/0.197/backends/arm_initreg.c /usr/src/debug/elfutils/0.197/backends/mips_initreg.c /usr/src/debug/elfutils/0.197/backends/arm_initreg_sample.c /usr/src/debug/elfutils/0.197/backends/riscv_regs.c /usr/src/debug/elfutils/0.197/tests/show-die-info.c /usr/src/debug/elfutils/0.197/tests/asm-tst4.c /usr/src/debug/elfutils/0.197/backends/x86_64_cfi.c /usr/src/debug/elfutils/0.197/tests/dwflsyms.c /usr/src/debug/elfutils/0.1
 97/tests/allregs.c /usr/src/debug/elfutils/0.197/tests/vdsosyms.c /usr/src/debug/elfutils/0.197/backends/csky_attrs.c /usr/src/debug/elfutils/0.197/backends/csky_reloc.def /usr/src/debug/elfutils/0.197/tests/early-offscn.c /usr/src/debug/elfutils/0.197/tests/eu_search_cfi.c /usr/src/debug/elfutils/0.197/backends/riscv_corenote.c /usr/src/debug/elfutils/0.197/backends/x86_64_unwind.c /usr/src/debug/elfutils/0.197/tests/funcretval.c /usr/src/debug/elfutils/0.197/backends/bpf_symbol.c /usr/src/debug/elfutils/0.197/backends/hexagon_init.c /usr/src/debug/elfutils/0.197/tests/elfshphehdr.c /usr/src/debug/elfutils/0.197/backends/m68k_reloc.def /usr/src/debug/elfutils/0.197/tests/arextract.c /usr/src/debug/elfutils/0.197/backends/aarch64_reloc.def /usr/src/debug/elfutils/0.197/tests/elfstrtab.c /usr/src/debug/elfutils/0.197/tests/varlocs.c /usr/src/debug/elfutils/0.197/backends/ppc_attrs.c /usr/src/debug/elfutils/0.197/backends/alpha_auxv.c /usr/src/debug/elfutils/0.197/backends/csky_cfi.c 
 /usr/src/debug/elfutils/0.197/backends/sparc_cfi.c /usr/src/debug/elfutils/0.197/backends/arc_symbol.c /usr/src/debug/elfutils/0.197/backends/arm_retval.c /usr/src/debug/elfutils/0.197/backends/arm_symbol.c /usr/src/debug/elfutils/0.197/tests/addsections.c /usr/src/debug/elfutils/0.197/backends/aarch64_initreg_sample.c /usr/src/debug/elfutils/0.197/tests/test-manyfuncs.c /usr/src/debug/elfutils/0.197/tests/xlate_notes.c /usr/src/debug/elfutils/0.197/backends/sparc_regs.c /usr/src/debug/elfutils/0.197/backends/sh_regs.c /usr/src/debug/elfutils/0.197/tests/asm-tst6.c /usr/src/debug/elfutils/0.197/tests/get-pubnames.c /usr/src/debug/elfutils/0.197/tests/leb128.c /usr/src/debug/elfutils/0.197/tests/system-elf-libelf-test.c"
packages/x86-64-v3-poky-linux/elfutils/elfutils-src: PKGSIZE changed from 5396645 to 5418786 (+0%)
packages/x86-64-v3-poky-linux/elfutils/elfutils-staticdev: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils-staticdev: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/elfutils-staticdev: PKGSIZE changed from 12149556 to 12196358 (+0%)
packages/x86-64-v3-poky-linux/elfutils/elfutils: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/elfutils: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils: SRC_URI changed from "https://sourceware.org/elfutils/ftp/0.196/elfutils-0.196.tar.bz2 file://run-ptest file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch file://0003-fixheadercheck.patch file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch file://0001-skip-the-test-when-gcc-not-deployed.patch file://ptest.patch file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch file://0001-config-eu.am-do-not-force-Werror.patch file://0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-s.patch file://srcfiles.patch" to "https://sourceware.org/elfutils/ftp/0.197/elfutils-0.197.tar.bz2 file://run-ptest file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch file://0003-fixheadercheck.patch file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch file://0001-skip-the-test-when-gcc-not-deployed.patch file://ptest.patch file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch fi
 le://0001-config-eu.am-do-not-force-Werror.patch file://0003-musl-utils.patch"
packages/x86-64-v3-poky-linux/elfutils: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils: PACKAGES: added "elfutils-locale-sv"
packages/x86-64-v3-poky-linux/elfutils/libasm: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/libasm: FILES: removed "/usr/lib/libasm-0.196.so", added "/usr/lib/libasm-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libasm: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/libasm: FILELIST: removed "/usr/lib/libasm-0.196.so", added "/usr/lib/libasm-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libdebuginfod: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/libdebuginfod: FILES: removed "/usr/lib/libdebuginfod-0.196.so", added "/usr/lib/libdebuginfod-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libdebuginfod: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/libdebuginfod: FILELIST: removed "/usr/lib/libdebuginfod-0.196.so", added "/usr/lib/libdebuginfod-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libdw: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/libdw: FILES: removed "/usr/lib/libdw-0.196.so", added "/usr/lib/libdw-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libdw: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/libdw: FILELIST: removed "/usr/lib/libdw-0.196.so", added "/usr/lib/libdw-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libdw: PKGSIZE changed from 748606 to 752702 (+1%)
packages/x86-64-v3-poky-linux/elfutils/libelf: PV changed from "0.196" to "0.197"
packages/x86-64-v3-poky-linux/elfutils/libelf: FILES: removed "/usr/lib/libelf-0.196.so", added "/usr/lib/libelf-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libelf: PKGV changed from 0.196 [default] to 0.197 [default]
packages/x86-64-v3-poky-linux/elfutils/libelf: FILELIST: removed "/usr/lib/libelf-0.196.so", added "/usr/lib/libelf-0.197.so"
Changes to packages/x86-64-v3-poky-linux/elfutils (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.196.so to libasm-0.197.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.196.so to libdebuginfod-0.197.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.196.so to libdebuginfod-0.197.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.196.so to libdw-0.197.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.196.so to libelf-0.197.so
  /usr/lib/libasm-0.196.so moved to /usr/lib/libasm-0.197.so
  /usr/lib/libdebuginfod-0.196.so moved to /usr/lib/libdebuginfod-0.197.so
  /usr/lib/libdw-0.196.so moved to /usr/lib/libdw-0.197.so
  /usr/lib/libelf-0.196.so moved to /usr/lib/libelf-0.197.so
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.196.so to libasm-0.197.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.196.so to libdebuginfod-0.197.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.196.so to libdebuginfod-0.197.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.196.so to libdw-0.197.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.196.so to libelf-0.197.so
  /usr/lib/libasm-0.196.so moved to /usr/lib/libasm-0.197.so
  /usr/lib/libdebuginfod-0.196.so moved to /usr/lib/libdebuginfod-0.197.so
  /usr/lib/libdw-0.196.so moved to /usr/lib/libdw-0.197.so
  /usr/lib/libelf-0.196.so moved to /usr/lib/libelf-0.197.so

--===============0583498797932005806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="elfutils-changelog.txt"

Version 0.197 "Anti-Corruption"

THREAD-SAFETY: New document describing the thread safety model for elfutils
       libraries when built with --enable-thread-safety.  Thread
       safety support remains experimental.

backends: Add unwinding support for alpha core files and processes.

libdebuginfod: The progress callback function is now also invoked when
       waiting for a server's initial response.

libdw: dwarf_begin_elf_type is now exported from libdw.so.  Previously
       this function was missing from the exported symbols.

libelf: Improved handling of corrupt ZSTD compression headers.

readelf: Improved handling of corrupt .gdb_index and .debug_cu_index
 sections.

translations: New Swedish translation.

unstrip: Improved handling of corrupt symbol tables.  When -m is given,
 the -d output path is now built from the module basename to avoid
 writing the reconstructed module image outside the intended
 output directory.

--===============0583498797932005806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/elfutils/elfutils-ptest: FILELIST: added "/usr/lib/elfutils/ptest/tests/testfile-unstrip-symtab0.stripped.bz2 /usr/lib/elfutils/ptest/tests/testfile-unstrip-symtab1.stripped.bz2 /usr/lib/elfutils/ptest/backends/alpha_initreg_.os /usr/lib/elfutils/ptest/backends/alpha_initreg_sample.o /usr/lib/elfutils/ptest/tests/testfile-unstrip-symtab0.debug.bz2 /usr/lib/elfutils/ptest/tests/testfile-unstrip-symtab1.debug.bz2 /usr/lib/elfutils/ptest/backends/alpha_cfi_.os /usr/lib/elfutils/ptest/backends/alpha_initreg_sample_.os /usr/lib/elfutils/ptest/tests/dwflst-tracker-concurrent /usr/lib/elfutils/ptest/backends/alpha_initreg.o /usr/lib/elfutils/ptest/tests/dwflst-tracker-concurrent.c /usr/lib/elfutils/ptest/tests/run-dwflst-tracker-concurrent.sh /usr/lib/elfutils/ptest/tests/run-unstrip-symtab-count.sh /usr/lib/elfutils/ptest/tests/dwflst_tracker_concurrent-dwflst-tracker-concurrent.o /usr/lib/elfutils/ptest/backends/alpha_cfi.o"
packages/x86-64-v3-poky-linux/elfutils: PACKAGES: added "elfutils-locale-sv"
packages/x86-64-v3-poky-linux/elfutils/libasm: FILELIST: removed "/usr/lib/libasm-0.196.so", added "/usr/lib/libasm-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libdebuginfod: FILELIST: removed "/usr/lib/libdebuginfod-0.196.so", added "/usr/lib/libdebuginfod-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libdw: FILELIST: removed "/usr/lib/libdw-0.196.so", added "/usr/lib/libdw-0.197.so"
packages/x86-64-v3-poky-linux/elfutils/libelf: FILELIST: removed "/usr/lib/libelf-0.196.so", added "/usr/lib/libelf-0.197.so"
Changes to packages/x86-64-v3-poky-linux/elfutils (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.196.so to libasm-0.197.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.196.so to libdebuginfod-0.197.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.196.so to libdebuginfod-0.197.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.196.so to libdw-0.197.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.196.so to libelf-0.197.so
  /usr/lib/libasm-0.196.so moved to /usr/lib/libasm-0.197.so
  /usr/lib/libdebuginfod-0.196.so moved to /usr/lib/libdebuginfod-0.197.so
  /usr/lib/libdw-0.196.so moved to /usr/lib/libdw-0.197.so
  /usr/lib/libelf-0.196.so moved to /usr/lib/libelf-0.197.so
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.196.so to libasm-0.197.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.196.so to libdebuginfod-0.197.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.196.so to libdebuginfod-0.197.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.196.so to libdw-0.197.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.196.so to libelf-0.197.so
  /usr/lib/libasm-0.196.so moved to /usr/lib/libasm-0.197.so
  /usr/lib/libdebuginfod-0.196.so moved to /usr/lib/libdebuginfod-0.197.so
  /usr/lib/libdw-0.196.so moved to /usr/lib/libdw-0.197.so
  /usr/lib/libelf-0.196.so moved to /usr/lib/libelf-0.197.so

--===============0583498797932005806==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-elfutils-upgrade-0.196-0.197.patch"

RnJvbSAyYmE3MmMxYzVjYWI1MTYyN2ZjYTkwMDA3Y2ExYjhjYjNiNTM5YTZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjAgT2N0IDIwMjYgMDY6MDc6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGZ1dGlsczogdXBncmFkZSAwLjE5NiAtPiAwLjE5NwoKVmVyc2lvbiAwLjE5NyAiQW50aS1Db3Jy
dXB0aW9uIgoKVEhSRUFELVNBRkVUWTogTmV3IGRvY3VtZW50IGRlc2NyaWJpbmcgdGhlIHRocmVh
ZCBzYWZldHkgbW9kZWwgZm9yIGVsZnV0aWxzCiAgICAgICBsaWJyYXJpZXMgd2hlbiBidWlsdCB3
aXRoIC0tZW5hYmxlLXRocmVhZC1zYWZldHkuICBUaHJlYWQKICAgICAgIHNhZmV0eSBzdXBwb3J0
IHJlbWFpbnMgZXhwZXJpbWVudGFsLgoKYmFja2VuZHM6IEFkZCB1bndpbmRpbmcgc3VwcG9ydCBm
b3IgYWxwaGEgY29yZSBmaWxlcyBhbmQgcHJvY2Vzc2VzLgoKbGliZGVidWdpbmZvZDogVGhlIHBy
b2dyZXNzIGNhbGxiYWNrIGZ1bmN0aW9uIGlzIG5vdyBhbHNvIGludm9rZWQgd2hlbgogICAgICAg
d2FpdGluZyBmb3IgYSBzZXJ2ZXIncyBpbml0aWFsIHJlc3BvbnNlLgoKbGliZHc6IGR3YXJmX2Jl
Z2luX2VsZl90eXBlIGlzIG5vdyBleHBvcnRlZCBmcm9tIGxpYmR3LnNvLiAgUHJldmlvdXNseQog
ICAgICAgdGhpcyBmdW5jdGlvbiB3YXMgbWlzc2luZyBmcm9tIHRoZSBleHBvcnRlZCBzeW1ib2xz
LgoKbGliZWxmOiBJbXByb3ZlZCBoYW5kbGluZyBvZiBjb3JydXB0IFpTVEQgY29tcHJlc3Npb24g
aGVhZGVycy4KCnJlYWRlbGY6IEltcHJvdmVkIGhhbmRsaW5nIG9mIGNvcnJ1cHQgLmdkYl9pbmRl
eCBhbmQgLmRlYnVnX2N1X2luZGV4CiBzZWN0aW9ucy4KCnRyYW5zbGF0aW9uczogTmV3IFN3ZWRp
c2ggdHJhbnNsYXRpb24uCgp1bnN0cmlwOiBJbXByb3ZlZCBoYW5kbGluZyBvZiBjb3JydXB0IHN5
bWJvbCB0YWJsZXMuICBXaGVuIC1tIGlzIGdpdmVuLAogdGhlIC1kIG91dHB1dCBwYXRoIGlzIG5v
dyBidWlsdCBmcm9tIHRoZSBtb2R1bGUgYmFzZW5hbWUgdG8gYXZvaWQKIHdyaXRpbmcgdGhlIHJl
Y29uc3RydWN0ZWQgbW9kdWxlIGltYWdlIG91dHNpZGUgdGhlIGludGVuZGVkCiBvdXRwdXQgZGly
ZWN0b3J5LgotLS0KIC4uLi97ZWxmdXRpbHNfMC4xOTYuYmIgPT4gZWxmdXRpbHNfMC4xOTcuYmJ9
ICB8ICA1ICstCiAuLi5zLXVpby5oLWluc3RlYWQtb2YtbGludXgtdWlvLmgtZm9yLXMucGF0Y2gg
fCA3NCAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4wMDEtY29uZmlnLWV1LmFtLWRvLW5vdC1mb3Jj
ZS1XZXJyb3IucGF0Y2ggfCAgMiArLQogLi4uLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYt
YmVmb3JlLnBhdGNoIHwgIDIgKy0KIC4uLi1za2lwLXRoZS10ZXN0LXdoZW4tZ2NjLW5vdC1kZXBs
b3llZC5wYXRjaCB8ICAyICstCiAuLi5tLWNvbXBpbGUtdGVzdF9ubGlzdC13aXRoLXN0YW5kYXJk
LUMucGF0Y2ggfCAgNCArLQogLi4uY3Z0X2d1bmhhc2gtaWYtZGVzdC1hbmQtc3JjLWFyZS1zYW1l
LnBhdGNoIHwgIDIgKy0KIC4uLi9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRlcmNoZWNrLnBh
dGNoICB8ICAyICstCiAuLi4vZWxmdXRpbHMvZmlsZXMvMDAwMy1tdXNsLXV0aWxzLnBhdGNoICAg
ICAgfCAgNCArLQogLi4uL2VsZnV0aWxzL2ZpbGVzL3B0ZXN0LnBhdGNoICAgICAgICAgICAgICAg
IHwgIDggKy0KIC4uLi9lbGZ1dGlscy9maWxlcy9zcmNmaWxlcy5wYXRjaCAgICAgICAgICAgICB8
IDY1IC0tLS0tLS0tLS0tLS0tLS0KIDExIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyks
IDE1NSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMv
e2VsZnV0aWxzXzAuMTk2LmJiID0+IGVsZnV0aWxzXzAuMTk3LmJifSAoOTclKQogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWJhY2tl
bmRzLXVzZS1zeXMtdWlvLmgtaW5zdGVhZC1vZi1saW51eC11aW8uaC1mb3Itcy5wYXRjaAogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy9zcmNm
aWxlcy5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9l
bGZ1dGlsc18wLjE5Ni5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9lbGZ1dGls
c18wLjE5Ny5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4xOTYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9lbGZ1dGlscy9lbGZ1dGlsc18wLjE5Ny5iYgppbmRleCA0NTQxMDAwODQwLi5m
ZmI1MjM5MzZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxm
dXRpbHNfMC4xOTYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2VsZnV0
aWxzXzAuMTk3LmJiCkBAIC0xOSwxMyArMTksMTIgQEAgU1JDX1VSSSA9ICJodHRwczovL3NvdXJj
ZXdhcmUub3JnL2VsZnV0aWxzL2Z0cC8ke1BWfS8ke0JQfS50YXIuYnoyIFwKICAgICAgICAgICAg
ZmlsZTovL3B0ZXN0LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdGVzdHMtTWFrZWZp
bGUuYW0tY29tcGlsZS10ZXN0X25saXN0LXdpdGgtc3RhbmRhcmQtQy5wYXRjaCBcCiAgICAgICAg
ICAgIGZpbGU6Ly8wMDAxLWNvbmZpZy1ldS5hbS1kby1ub3QtZm9yY2UtV2Vycm9yLnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDEtYmFja2VuZHMtdXNlLXN5cy11aW8uaC1pbnN0ZWFkLW9m
LWxpbnV4LXVpby5oLWZvci1zLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovL3NyY2ZpbGVzLnBh
dGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDMtbXVzbC11dGlscy5wYXRjaCBcCiAgICAgICAg
ICAgICIKIFNSQ19VUkk6YXBwZW5kOmxpYmMtbXVzbCA9ICIgXAogICAgICAgICAgICBmaWxlOi8v
MDAwMy1tdXNsLXV0aWxzLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImZkNWNjNmI3N2FkNjc3M2NhYzkzY2IzZjQxNWY5MzE4YWMzYjM0NTVlZWNmODAxZjZiNGE3
NDJjNGY2YzcyMDkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMWZkZjUyNWYyMmRjZjc5NmQ5OWE5
OWJhM2VhMDBhMWY3YjFhZTU0MjFiYzYyZTg0NDNhNzA4OTIwYjk5YjkwNCIKIAogaW5oZXJpdCBh
dXRvdG9vbHMgZ2V0dGV4dCBwdGVzdCBwa2djb25maWcKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtYmFja2VuZHMtdXNlLXN5cy11aW8uaC1p
bnN0ZWFkLW9mLWxpbnV4LXVpby5oLWZvci1zLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2VsZnV0aWxzL2ZpbGVzLzAwMDEtYmFja2VuZHMtdXNlLXN5cy11aW8uaC1pbnN0ZWFkLW9mLWxp
bnV4LXVpby5oLWZvci1zLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwNDYx
MTcyZmNmLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy8wMDAxLWJhY2tlbmRzLXVzZS1zeXMtdWlvLmgtaW5zdGVhZC1vZi1saW51eC11aW8uaC1m
b3Itcy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDc0ICswLDAgQEAKLUZyb20gNjRlODk2MDZm
ZjQ5NjdhNjQ3NTI1NTI0YWVjMDBkZDMzNzY1YmEyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IERhZWhvIFJvIDxlbWFpbEBkYWVoby5ybz4KLURhdGU6IFN1biwgMTYgQXVnIDIwMjYg
MTY6Mjc6NTYgKzA5MDAKLVN1YmplY3Q6IFtQQVRDSF0gYmFja2VuZHM6IHVzZSA8c3lzL3Vpby5o
PiBpbnN0ZWFkIG9mIDxsaW51eC91aW8uaD4gZm9yCi0gc3RydWN0IGlvdmVjCi0KLVNpbmNlIGNv
bW1pdCAwZThiNTdhMyAoImVsZmNvbXByZXNzOiBIYW5kbGUgZXhpc3Rpbmcgb3V0cHV0IGZpbGVz
Ci0oc3ltbGlua3MpIikgbGliL3N5c3RlbS5oIGluY2x1ZGVzIDxmY250bC5oPi4gIFdoZW4gX0dO
VV9TT1VSQ0UgaXMKLWRlZmluZWQsIGdsaWJjJ3MgPGZjbnRsLmg+IHB1bGxzIGluIDxiaXRzL3R5
cGVzL3N0cnVjdF9pb3ZlYy5oPiAodmlhCi1iaXRzL2ZjbnRsLWxpbnV4LmgpLCB3aGljaCBkZWZp
bmVzIHN0cnVjdCBpb3ZlYy4gIFRoZSBrZXJuZWwgVUFQSSBoZWFkZXIKLTxsaW51eC91aW8uaD4g
ZGVmaW5lcyBzdHJ1Y3QgaW92ZWMgdW5jb25kaXRpb25hbGx5LCBzbyBpbmNsdWRpbmcgaXQKLWFm
dGVyICJzeXN0ZW0uaCIgbm93IGJyZWFrcyB0aGUgYWFyY2g2NCBiYWNrZW5kIGJ1aWxkOgotCi0g
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBhYXJjaDY0X2luaXRyZWcuYzozNjoKLSAgL3Vzci9pbmNs
dWRlL2xpbnV4L3Vpby5oOjE3Ojg6IGVycm9yOiByZWRlZmluaXRpb24gb2YgJ3N0cnVjdCBpb3Zl
YycKLSAgICAgMTcgfCBzdHJ1Y3QgaW92ZWMKLSAgICAgICAgfCAgICAgICAgXn5+fn4KLSAgSW4g
ZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5jbHVkZS9hYXJjaDY0LWxpbnV4LWdudS9iaXRzL2Zj
bnRsLWxpbnV4Lmg6MzgsCi0gICAgICAgICAgICAgICAgICAgZnJvbSAvdXNyL2luY2x1ZGUvYWFy
Y2g2NC1saW51eC1nbnUvYml0cy9mY250bC5oOjYxLAotICAgICAgICAgICAgICAgICAgIGZyb20g
L3Vzci9pbmNsdWRlL2ZjbnRsLmg6MzUsCi0gICAgICAgICAgICAgICAgICAgZnJvbSAuLi9saWIv
c3lzdGVtLmg6NDIsCi0gICAgICAgICAgICAgICAgICAgZnJvbSBhYXJjaDY0X2luaXRyZWcuYzoz
MzoKLSAgL3Vzci9pbmNsdWRlL2FhcmNoNjQtbGludXgtZ251L2JpdHMvdHlwZXMvc3RydWN0X2lv
dmVjLmg6MjY6ODogbm90ZTogb3JpZ2luYWxseSBkZWZpbmVkIGhlcmUKLQotU2VlbiBidWlsZGlu
ZyAwLjE5NiBvbiBhYXJjaDY0IHdpdGggZ2xpYmMgMi4zOSBhbmQgZ2NjIDEzLjMuMC4KLQotQm90
aCBmaWxlcyBvbmx5IG5lZWQgc3RydWN0IGlvdmVjIHRvIGNhbGwgcHRyYWNlIChQVFJBQ0VfR0VU
UkVHU0VUKSwKLXdoaWNoIGdsaWJjIHByb3ZpZGVzIGluIDxzeXMvdWlvLmg+OyB0aGF0IGhlYWRl
ciBndWFyZHMgdGhlIGRlZmluaXRpb24KLXdpdGggX19pb3ZlY19kZWZpbmVkLCBzbyBpdCBjb21w
b3NlcyB3aXRoIHRoZSByZXN0IG9mIHN5c3RlbS5oLgotYXJtX2luaXRyZWcuYyBkb2VzIG5vdCBj
dXJyZW50bHkgaW5jbHVkZSAic3lzdGVtLmgiIGFuZCBzbyBzdGlsbCBidWlsZHMsCi1idXQgaXQg
aGFzIHRoZSBzYW1lIGxhdGVudCBjb25mbGljdC4KLQotKiBiYWNrZW5kcy9hYXJjaDY0X2luaXRy
ZWcuYzogSW5jbHVkZSA8c3lzL3Vpby5oPiBpbnN0ZWFkIG9mCi0gIDxsaW51eC91aW8uaD4uCi0q
IGJhY2tlbmRzL2FybV9pbml0cmVnLmM6IExpa2V3aXNlLgotCi1TaWduZWQtb2ZmLWJ5OiBEYWVo
byBSbyA8ZW1haWxAZGFlaG8ucm8+Ci0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBz
Oi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWVsZnV0aWxzLmdpdDthPXBhdGNoO2g9NjRlODk2MDZm
ZjQ5NjdhNjQ3NTI1NTI0YWVjMDBkZDMzNzY1YmEyYV0KLVNpZ25lZC1vZmYtYnk6IEphaXBhdWwg
Q2hlZXJuYW0gPGphaXBhdWwuY2hlZXJuYW1AZXN0LnRlY2g+Ci0tLS0KLSBiYWNrZW5kcy9hYXJj
aDY0X2luaXRyZWcuYyB8IDIgKy0KLSBiYWNrZW5kcy9hcm1faW5pdHJlZy5jICAgICB8IDIgKy0K
LSAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlm
ZiAtLWdpdCBhL2JhY2tlbmRzL2FhcmNoNjRfaW5pdHJlZy5jIGIvYmFja2VuZHMvYWFyY2g2NF9p
bml0cmVnLmMKLWluZGV4IGE2YmFkYmI0Li41MzlhNjM2NiAxMDA2NDQKLS0tLSBhL2JhY2tlbmRz
L2FhcmNoNjRfaW5pdHJlZy5jCi0rKysgYi9iYWNrZW5kcy9hYXJjaDY0X2luaXRyZWcuYwotQEAg
LTMzLDcgKzMzLDcgQEAKLSAjaW5jbHVkZSAic3lzdGVtLmgiCi0gI2luY2x1ZGUgPGFzc2VydC5o
PgotICNpZiBkZWZpbmVkKF9fYWFyY2g2NF9fKSAmJiBkZWZpbmVkKF9fbGludXhfXykKLS0jIGlu
Y2x1ZGUgPGxpbnV4L3Vpby5oPgotKyMgaW5jbHVkZSA8c3lzL3Vpby5oPgotICMgaW5jbHVkZSA8
c3lzL3VzZXIuaD4KLSAjIGluY2x1ZGUgPHN5cy9wdHJhY2UuaD4KLSAjIGluY2x1ZGUgPGFzbS9w
dHJhY2UuaD4KLWRpZmYgLS1naXQgYS9iYWNrZW5kcy9hcm1faW5pdHJlZy5jIGIvYmFja2VuZHMv
YXJtX2luaXRyZWcuYwotaW5kZXggZWZjYWJhZjYuLjA2MmJiOWUwIDEwMDY0NAotLS0tIGEvYmFj
a2VuZHMvYXJtX2luaXRyZWcuYwotKysrIGIvYmFja2VuZHMvYXJtX2luaXRyZWcuYwotQEAgLTM4
LDcgKzM4LDcgQEAKLSAjZW5kaWYKLSAKLSAjaWZkZWYgX19hYXJjaDY0X18KLS0jIGluY2x1ZGUg
PGxpbnV4L3Vpby5oPgotKyMgaW5jbHVkZSA8c3lzL3Vpby5oPgotICMgaW5jbHVkZSA8c3lzL3Vz
ZXIuaD4KLSAjIGluY2x1ZGUgPHN5cy9wdHJhY2UuaD4KLSAvKiBEZWFsIHdpdGggb2xkIGdsaWJj
IGRlZmluaW5nIHVzZXJfcHRfcmVncyBpbnN0ZWFkIG9mIHVzZXJfcmVnc19zdHJ1Y3QuICAqLwot
LS0gCi0yLjQzLjcKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxz
L2ZpbGVzLzAwMDEtY29uZmlnLWV1LmFtLWRvLW5vdC1mb3JjZS1XZXJyb3IucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1jb25maWctZXUuYW0tZG8tbm90
LWZvcmNlLVdlcnJvci5wYXRjaAppbmRleCBkNDYwZjJlNThiLi5kMTQ1YzllODIwIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1jb25maWctZXUu
YW0tZG8tbm90LWZvcmNlLVdlcnJvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZWxmdXRpbHMvZmlsZXMvMDAwMS1jb25maWctZXUuYW0tZG8tbm90LWZvcmNlLVdlcnJvci5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTc1MzU3Zjc1ODUwNzZhMDcyZjYxNjg0ZGIyMDE4MGVm
OGRkMzFiNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjQ1MzUxZTMwNTdiNzZkOWE3
NjQ5NWM3ZTAyMWIzNDQ5Y2Q1Y2FlNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFs
ZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBEYXRlOiBGcmksIDIyIE5vdiAy
MDI0IDEyOjUwOjQ4ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZy9ldS5hbTogZG8gbm90
IGZvcmNlIC1XZXJyb3IKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGls
cy9maWxlcy8wMDAxLWxpYmVsZi1lbGZfZW5kLmMtY2hlY2stZGF0YV9saXN0LmRhdGEuZC5kX2J1
Zi1iZWZvcmUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAw
MS1saWJlbGYtZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYtYmVmb3JlLnBh
dGNoCmluZGV4IDYyMWJlMWIzN2QuLjQ3ZjI4ODg1YTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWxpYmVsZi1lbGZfZW5kLmMtY2hlY2stZGF0
YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtbGliZWxmLWVsZl9lbmQuYy1jaGVjay1kYXRhX2xpc3Qu
ZGF0YS5kLmRfYnVmLWJlZm9yZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYmYyMmVmM2Mx
YTU1OWRjMGIyNjVhOWM3YzJmY2RhNGEyMDUxOWU2MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gNjMwNWUyMDkyN2JjMzkzNjcwMDllZmQxZWNiNzFjZTIwYTAwNmVkNiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIu
Y29tPgogRGF0ZTogVGh1LCAxNiBBdWcgMjAxOCAwOTo1ODoyNiArMDgwMAogU3ViamVjdDogW1BB
VENIXSBsaWJlbGYvZWxmX2VuZC5jOiBjaGVjayBkYXRhX2xpc3QuZGF0YS5kLmRfYnVmIGJlZm9y
ZSBmcmVlIGl0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmls
ZXMvMDAwMS1za2lwLXRoZS10ZXN0LXdoZW4tZ2NjLW5vdC1kZXBsb3llZC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNraXAtdGhlLXRlc3Qtd2hlbi1n
Y2Mtbm90LWRlcGxveWVkLnBhdGNoCmluZGV4IDA5M2QwM2M3MzYuLjMzMGIwNTY1ZmMgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNraXAtdGhl
LXRlc3Qtd2hlbi1nY2Mtbm90LWRlcGxveWVkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXNraXAtdGhlLXRlc3Qtd2hlbi1nY2Mtbm90LWRlcGxv
eWVkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkYjU5YzhhODBhMjg1ZjljYmEzZjc4OWI2
YzJjMjQwNDgxYjk3ZGI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxNzQxZDViYjg1
OTdhYWViNmVmNmNhZWZjMmY0MDkxZTNiMmVjYjJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogTWluZ2xpIFl1IDxNaW5nbGkuWXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjEg
TWF5IDIwMTkgMTU6MjA6MzQgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gc2tpcCB0aGUgdGVzdCB3
aGVuIGdjYyBub3QgZGVwbG95ZWQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9l
bGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLU1ha2VmaWxlLmFtLWNvbXBpbGUtdGVzdF9ubGlzdC13
aXRoLXN0YW5kYXJkLUMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmls
ZXMvMDAwMS10ZXN0cy1NYWtlZmlsZS5hbS1jb21waWxlLXRlc3Rfbmxpc3Qtd2l0aC1zdGFuZGFy
ZC1DLnBhdGNoCmluZGV4IGViMmQ0OGUzYmIuLmQ1YTFmMjgxYjAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLU1ha2VmaWxlLmFtLWNv
bXBpbGUtdGVzdF9ubGlzdC13aXRoLXN0YW5kYXJkLUMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtdGVzdHMtTWFrZWZpbGUuYW0tY29tcGlsZS10
ZXN0X25saXN0LXdpdGgtc3RhbmRhcmQtQy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWJh
NzM1YmYxOWM2MGZmODU3MzFiM2JmZTc5YTZjODNlMTdmMzQzNiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNGFmNzhlODg1ZDc2NGJjYzQwNzhjY2Y4MTBjMTI1MTU5YWQzMjdmMiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogVHVlLCAyMyBKdW4gMjAyMCAwNzo0OTozNSArMDAwMAogU3Vi
amVjdDogW1BBVENIXSB0ZXN0cy9NYWtlZmlsZS5hbTogY29tcGlsZSB0ZXN0X25saXN0IHdpdGgg
c3RhbmRhcmQgQ0ZMQUdTCkBAIC0xMyw3ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZpbGUu
YW0gYi90ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggMDU1ZmVhNy4uYmEyNWU2MSAxMDA2NDQKK2lu
ZGV4IGJiMzZkM2EuLjNlOTgxNjIgMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQogKysr
IGIvdGVzdHMvTWFrZWZpbGUuYW0KIEBAIC0xMjIsNyArMTIyLDcgQEAgZW5kaWYKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAyLUZpeC1lbGZfY3Z0
X2d1bmhhc2gtaWYtZGVzdC1hbmQtc3JjLWFyZS1zYW1lLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDItRml4LWVsZl9jdnRfZ3VuaGFzaC1pZi1kZXN0LWFu
ZC1zcmMtYXJlLXNhbWUucGF0Y2gKaW5kZXggY2M0YzVhYjc1Yi4uYTkzZmZmYzMyYyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDItRml4LWVsZl9j
dnRfZ3VuaGFzaC1pZi1kZXN0LWFuZC1zcmMtYXJlLXNhbWUucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDItRml4LWVsZl9jdnRfZ3VuaGFzaC1pZi1k
ZXN0LWFuZC1zcmMtYXJlLXNhbWUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDA1MzNiMGQ2
N2VkOTlmZDJhMDM0ZTQ5N2YwYzA3ZmY2MDhjYTUyZTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDIzYzg5NzAzZTc3YTAwMGViZWQxYTRhMzJlOWQ1MjI3MWQyNWEwNzAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBUdWUsIDE1IEF1ZyAyMDE3IDE3OjEzOjU5ICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIEZpeCBlbGZfY3Z0X2d1bmhhc2ggaWYgZGVzdCBhbmQgc3JjIGFyZSBzYW1lLgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtZml4aGVhZGVy
Y2hlY2sucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1m
aXhoZWFkZXJjaGVjay5wYXRjaAppbmRleCA0MWU0YzczOGYzLi5kMTRjNTI1N2IzIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1maXhoZWFkZXJj
aGVjay5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAw
My1maXhoZWFkZXJjaGVjay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzg0MTVjNmZjMWY0
NjRlNDUyMjJiYTU4OGE2Y2RjMDI5MmI0MjMwYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gYjFjZjZiYzYxN2JlY2NjN2UxNWQ1ZWY1Mjc0OWZiN2MxZDRlMTYzZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4K
IERhdGU6IFR1ZSwgMTUgQXVnIDIwMTcgMTc6MTc6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0g
Zml4aGVhZGVyY2hlY2sKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGls
cy9maWxlcy8wMDAzLW11c2wtdXRpbHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxm
dXRpbHMvZmlsZXMvMDAwMy1tdXNsLXV0aWxzLnBhdGNoCmluZGV4IGE1ZDkxM2IyYjcuLjNlMmVh
YWI5ZWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8w
MDAzLW11c2wtdXRpbHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxz
L2ZpbGVzLzAwMDMtbXVzbC11dGlscy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMDA2NDY3
OTAxODY0MmE5ZTBlMmM5ZDM2ZWVlZWRjM2E4Mjc4MzU2ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gZjJhNDQ5M2M3YWIyZDhmY2E0ZTRiZDQzZGZlZDZiYmI1MjkyMmE0ZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVy
LmNvbT4KIERhdGU6IEZyaSwgMjMgQXVnIDIwMTkgMTA6MTk6NDggKzA4MDAKIFN1YmplY3Q6IFtQ
QVRDSF0gbXVzbC11dGlscwpAQCAtNzQsNyArNzQsNyBAQCBpbmRleCBhOGVjYzgwLi5iZjg4MDUx
IDEwMDY0NAogIAogIC8qIE5hbWUgYW5kIHZlcnNpb24gb2YgcHJvZ3JhbS4gICovCiBkaWZmIC0t
Z2l0IGEvc3JjL3Vuc3RyaXAuYyBiL3NyYy91bnN0cmlwLmMKLWluZGV4IDU1ODViMGUuLmFkYzM5
YTMgMTAwNjQ0CitpbmRleCAzOWQ1YmI2Li5kYjc5MjM2IDEwMDY0NAogLS0tIGEvc3JjL3Vuc3Ry
aXAuYwogKysrIGIvc3JjL3Vuc3RyaXAuYwogQEAgLTUxLDYgKzUxLDE1IEBACmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvcHRlc3QucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvcHRlc3QucGF0Y2gKaW5kZXggYjZhOWU1
YmI3My4uNzcxYTY0NzBhYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0
aWxzL2ZpbGVzL3B0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGls
cy9maWxlcy9wdGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYWJlMTY0ZjYyNDI4MjVl
ODI3YjZiMTMxNDE4ODM1OTFkMDU5ZDZmZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NjE0NDg5YjY1ZjgzNTQwNjQ0ZGM4ODU5ODMxNTQ1ODcxMjU5ODQ3NiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPgogRGF0ZTogV2VkLCAxIE1heSAyMDE5IDE2OjM3OjQ4ICswMTAwCiBTdWJqZWN0
OiBbUEFUQ0hdIENoYW5nZXMgdG8gYWxsb3cgcHRlc3QgdG8gcnVuIHN0YW5kYWxvbmUgb24gdGFy
Z2V0OgpAQCAtMjEsNyArMjEsNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29l
IHNwZWNpZmljXQogIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBi
MGQxYjQ4Li5hY2MyOWYwIDEwMDY0NAoraW5kZXggZDNjMDI5Mi4uNzZiZGRhMiAxMDA2NDQKIC0t
LSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtNDMsNyArNDMsNyBAQCBB
Q19DT1BZUklHSFQoW0NvcHlyaWdodCAoQykgMTk5Ni0yMDI2IFRoZSBlbGZ1dGlscyBkZXZlbG9w
ZXJzLl0pCkBAIC0zNCwxMCArMzQsMTAgQEAgaW5kZXggYjBkMWI0OC4uYWNjMjlmMCAxMDA2NDQK
ICAKICBBTV9TSUxFTlRfUlVMRVMoW3llc10pCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZpbGUu
YW0gYi90ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggMTM3ZTk2MS4uMDU1ZmVhNyAxMDA2NDQKK2lu
ZGV4IDI2MTY0OWYuLmJiMzZkM2EgMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQogKysr
IGIvdGVzdHMvTWFrZWZpbGUuYW0KLUBAIC05ODEsMyArOTgxLDUgQEAgY2hlY2s6IGNoZWNrLWFt
IGNvdmVyYWdlCitAQCAtOTk4LDMgKzk5OCw1IEBAIGNoZWNrOiBjaGVjay1hbSBjb3ZlcmFnZQog
IGNvdmVyYWdlOgogIAktJChzcmNkaXIpL2NvdmVyYWdlLnNoCiAgZW5kaWYKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy9zcmNmaWxlcy5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy9zcmNmaWxlcy5wYXRjaApkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYWJkMDIyNmIwZi4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvc3JjZmlsZXMucGF0Y2gKKysrIC9kZXYv
bnVsbApAQCAtMSw2NSArMCwwIEBACi1Gcm9tOiBNYXJrIFdpZWxhYXJkIDxtYXJrQGtsb21wLm9y
Zz4KLVRvOiBlbGZ1dGlscy1kZXZlbEBzb3VyY2V3YXJlLm9yZwotQ2M6IHJvc3NAYnVydG9uaW5p
LmNvbSwgTWFyayBXaWVsYWFyZCA8bWFya0BrbG9tcC5vcmc+Ci1TdWJqZWN0OiBbUEFUQ0hdIHNy
Y2ZpbGVzOiBBbHdheXMgcHJvY2VzcyB0aGUgInplcm8iIGZpbGUgdGFibGUgZW50cnkgKENVIGNv
bXBfZGlyL25hbWUpCi1EYXRlOiBUdWUsIDIyIFNlcCAyMDI2IDEzOjQ2OjA2ICswMjAwCi1NZXNz
YWdlLUlEOiA8MjAyNjA5MjIxMTQ2MDYuMjg2NTY2MC0xLW1hcmtAa2xvbXAub3JnPgotWC1NYWls
ZXI6IGdpdC1zZW5kLWVtYWlsIDIuNTUuMAotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHJh
bnNmZXItRW5jb2Rpbmc6IDhiaXQKLVgtU3BhbS1GbGFnOiBOTwotWC1TcGFtLVN0YXR1czogTm8s
IHNjb3JlPS0yLjkgcmVxdWlyZWQ9NS4wIHRlc3RzPUFMTF9UUlVTVEVELEJBWUVTXzAwIGF1dG9s
ZWFybj1oYW0gYXV0b2xlYXJuX2ZvcmNlPW5vIHZlcnNpb249My40LjAKLVgtU3BhbS1DaGVja2Vy
LVZlcnNpb246IFNwYW1Bc3Nhc3NpbiAzLjQuMCAoMjAxNC0wMi0wNykgb24gZ251LndpbGRlYmVl
c3Qub3JnCi0KLUlmIHRoZSBtYWluIENVIGZpbGUgZG9lc24ndCBjb250YWluIGFueSByZWZlcmVu
Y2VzIHRvIHRoZSBmaWxlIHRhYmxlCi1pdCB3b3VsZG4ndCBzaG93IHVwIGluIHRoZSBzcmMgZmls
ZXMgbGlzdCAoZXhjZXB0IGlmIC0tY3Utb25seSB3YXMKLWdpdmVuKS4gVGhpcyBpcyBiZWNhdXNl
IGZpbGUgZW50cnkgInplcm8iIGlzIHNwZWNpYWwuIEl0IGNhbm5vdCBiZQotcmVmZXJyZWQgdG8g
YnkgRFdfQVQgZmlsZSBhdHRyaWJ1dGVzIChiZWNhdXNlIHplcm8gbWVhbnMsIG5vCi1maWxlKS4g
QnV0IHRlY2huaWNhbGx5IGl0IHNob3VsZCBiZSBlcXVhbCB0byAoaW1wbGljaXRseSBiZWZvcmUK
LURXQVJGNSkgdGhlIERXX0FUX25hbWUgb2YgdGhlIG1haW4gQ1UgRElFICh1c2luZyBhIHplcm8g
ZGlyZWN0b3J5Ci1lbnRyeSwgZXF1YWwgdG8gRFdfQVRfY29tcF9kaXIpLiBjb2xsZWN0X3NvdXJj
ZWZpbGVzIHNraXBwZWQgdGhpcwotaW1wbGljaXQgemVybyBlbnRyeSB1bmxlc3MgLS1jdS1vbmx5
IHdhcyBnaXZlbi4KLQotRml4IHRoaXMgYnkgYWx3YXlzIGhhbmRsaW5nIHRoZSB6ZXJvIGZpbGUg
dGFibGUgZW50cnkuIEFuZCBmb3IKLS0tY3Utb25seSB0byBqdXN0IGV4aXQgdGhlIGxvb3AgZWFy
bHksIHNvIG5vIG90aGVyIGVudHJpZXMgYXJlIGhhbmRsZWQKLVRoaXMgaXMgYWxzbyBhbiBvcHRp
bWl6YXRpb24sIGJlZm9yZSAtLWN1LW9ubHkgd291bGQgZ28gdGhyb3VnaCBhbGwKLWluZGV4ZXMs
IGJ1dCBhbHdheXMgYWRkZWQgdGhlIENVIG5hbWUuIFdoaWNoIHdvcmtlZCwgYmVjYXVzZQotZHVw
bGljYXRlcyB3ZXJlIHJlbW92ZWQsIGJ1dCB3YXMgc29tZXdoYXQgaW5lZmZpY2llbnQuCi0KLQkg
ICAqIHNyYy9zcmNmaWxlcy5jeHggKGNvbGxlY3Rfc291cmNlZmlsZXMpOiBHbyBmcm9tIGluZGV4
Ci0JICAgemVybywgZXhpdCBhZnRlciB6ZXJvIGluZGV4IGZvciBDVV9vbmx5LCBhbHdheXMgaGFu
ZGxlCi0JICAgaW5kZXggemVybyBzcGVjaWFsbHkuCi0KLWh0dHBzOi8vc291cmNld2FyZS5vcmcv
YnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTM0NjY2Ci0KLVNpZ25lZC1vZmYtYnk6IE1hcmsgV2ll
bGFhcmQgPG1hcmtAa2xvbXAub3JnPgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFs3YjY3
NWNiZGIwZDFmMjE2OTM4YjRiMzNhZWEzMGZkMzVmYjFhZTBhXQotU2lnbmVkLW9mZi1ieTogUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ci0tLS0KLSBzcmMvc3JjZmlsZXMuY3h4IHwg
OCArKysrKystLQotIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvc3JjZmlsZXMuY3h4IGIvc3JjL3NyY2ZpbGVzLmN4eAot
aW5kZXggOWJiYjZlZjEwNDczLi5lMmZjMGYxMjhkNzEgMTAwNjQ0Ci0tLS0gYS9zcmMvc3JjZmls
ZXMuY3h4Ci0rKysgYi9zcmMvc3JjZmlsZXMuY3h4Ci1AQCAtMjczLDEwICsyNzMsMTQgQEAgY29s
bGVjdF9zb3VyY2VmaWxlcyAoRHdmbF9Nb2R1bGUgKmR3Zmxtb2QsCi0gICAgICAgICAgICAgY2xv
ZyA8PCAic2tpcHBpbmcgY3U9IiA8PCBjdW5hbWUgPDwgIiBkdWUgdG8gZW1wdHkgY29tcF9kaXIi
IDw8IGVuZGw7Ci0gICAgICAgICAgIGNvbnRpbnVlOwotICAgICAgICAgfQotLSAgICAgIGZvciAo
c2l6ZV90IGYgPSAxOyBmIDwgbmZpbGVzOyArK2YpCi0rICAgICAgZm9yIChzaXplX3QgZiA9IDA7
IGYgPCBuZmlsZXM7ICsrZikKLSAgICAgICAgIHsKLSsJICAvKiBGb3IgLS1jdS1vbmx5IHdlIGFy
ZSBvbmx5IGludGVyZXN0ZWQgaW4gdGhlICJ6ZXJvIiBlbnRyeS4gICovCi0rCSAgaWYgKENVX29u
bHkgJiYgZiAhPSAwKQotKwkgICAgYnJlYWs7Ci0rCi0gICAgICAgICAgIGNvbnN0IGNoYXIgKmhh
dDsKLS0gICAgICAgICAgaWYgKENVX29ubHkpCi0rICAgICAgICAgIGlmIChmID09IDApCi0gICAg
ICAgICAgIHsKLSAgICAgICAgICAgICBpZiAoc3RyY21wKGN1bmFtZSwgIjx1bmtub3duPiIpID09
IDAgfHwgc3RyY21wKGN1bmFtZSwgIjxhcnRpZmljaWFsPiIpID09IDAgKQotICAgICAgICAgICAg
ICAgY29udGludWU7Ci0tLSAKLTIuNTUuMAotLSAKMi40Ny4xCgo=

--===============0583498797932005806==--
