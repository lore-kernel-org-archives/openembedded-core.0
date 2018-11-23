Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC5D6C0BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 07:30:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN7UUoL003466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 23:30:31 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 22 Nov 2018 23:30:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 15:47:20 +0800
Message-ID: <aa8c3e3a72e1ecf20031c944b7fdfd82bbf969e5.1542959097.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542959097.git.hongxu.jia@windriver.com>
References: <cover.1542959097.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] elfutils: 0.174 -> 0.175
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
X-List-Received-Date: Fri, 23 Nov 2018 07:30:30 -0000
Content-Type: text/plain

- Drop backport CVE patches
  0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch
  0001-size-Handle-recursive-ELF-ar-files.patch
  0001-arlib-Check-that-sh_entsize-isn-t-zero.patch

- Drop patches that upstream has fixed
  0005-fix-a-stack-usage-warning.patch [9a74c19 backends: ppc use define
  instead of const for size of dwarf_regs array.]

- Update debian patches to 0.175

- Rebase local patch to 0.175
  0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{elfutils_0.174.bb => elfutils_0.175.bb}       |  24 +-
 ...01-arlib-Check-that-sh_entsize-isn-t-zero.patch |  36 ---
 ...Sanity-check-partial-core-file-data-reads.patch |  60 ----
 .../0001-size-Handle-recursive-ELF-ar-files.patch  |  40 ---
 .../files/0005-fix-a-stack-usage-warning.patch     |  35 ---
 ...de-alternatives-for-glibc-assumptions-hel.patch |  14 +-
 ...ferences-between-mips-machine-identifiers.patch |   5 +-
 .../files/debian/0001-fix-gcc7-ftbfs.patch         |  57 ----
 .../debian/0001-testsuite-ignore-elflint.patch     |  57 ----
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   5 +-
 .../0003-Add-mips-n64-relocation-format-hack.patch |  41 ++-
 .../{0001-arm_backend.patch => arm_backend.diff}   | 342 ++++++++++-----------
 ...1-disable_werror.patch => disable_werror.patch} |  29 +-
 .../{0001-hppa_backend.patch => hppa_backend.diff} | 174 +++++------
 .../elfutils/files/debian/hurd_path.patch          |  16 +
 .../elfutils/files/debian/kfreebsd_path.patch      |  19 ++
 .../{0001-mips_backend.patch => mips_backend.diff} | 139 ++++-----
 ...1-mips_readelf_w.patch => mips_readelf_w.patch} |  26 +-
 18 files changed, 371 insertions(+), 748 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.174.bb => elfutils_0.175.bb} (76%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
 rename meta/recipes-devtools/elfutils/files/debian/{0001-arm_backend.patch => arm_backend.diff} (85%)
 rename meta/recipes-devtools/elfutils/files/debian/{0001-disable_werror.patch => disable_werror.patch} (46%)
 rename meta/recipes-devtools/elfutils/files/debian/{0001-hppa_backend.patch => hppa_backend.diff} (90%)
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
 rename meta/recipes-devtools/elfutils/files/debian/{0001-mips_backend.patch => mips_backend.diff} (91%)
 rename meta/recipes-devtools/elfutils/files/debian/{0001-mips_readelf_w.patch => mips_readelf_w.patch} (48%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.174.bb b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
similarity index 76%
rename from meta/recipes-devtools/elfutils/elfutils_0.174.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.175.bb
index c30265b..b0b9ddc 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.174.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
@@ -6,36 +6,32 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
 # The Debian patches below are from:
-# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
+# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.175-1.debian.tar.xz
 SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-dso-link-change.patch \
            file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch \
            file://0003-fixheadercheck.patch \
            file://0004-Disable-the-test-to-convert-euc-jp.patch \
-           file://0005-fix-a-stack-usage-warning.patch \
            file://0006-Fix-build-on-aarch64-musl.patch \
            file://0007-Fix-control-path-where-we-have-str-as-uninitialized-.patch \
            file://0001-libasm-may-link-with-libbz2-if-found.patch \
            file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch \
-           file://0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch \
-           file://0001-size-Handle-recursive-ELF-ar-files.patch \
-           file://0001-arlib-Check-that-sh_entsize-isn-t-zero.patch \
-           file://debian/0001-hppa_backend.patch \
-           file://debian/0001-arm_backend.patch \
-           file://debian/0001-mips_backend.patch \
-           file://debian/0001-testsuite-ignore-elflint.patch \
-           file://debian/0001-mips_readelf_w.patch \
+           file://debian/hppa_backend.diff \
+           file://debian/arm_backend.diff \
+           file://debian/mips_backend.diff \
+           file://debian/mips_readelf_w.patch \
+           file://debian/kfreebsd_path.patch \
            file://debian/0001-Ignore-differences-between-mips-machine-identifiers.patch \
            file://debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
            file://debian/0003-Add-mips-n64-relocation-format-hack.patch \
+           file://debian/hurd_path.patch \
            file://debian/ignore_strmerge.diff \
-           file://debian/0001-fix-gcc7-ftbfs.patch \
-           file://debian/0001-disable_werror.patch \
+           file://debian/disable_werror.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
-SRC_URI[md5sum] = "48bec24c0c8b2c16820326956dff9378"
-SRC_URI[sha256sum] = "cdf27e70076e10a29539d89e367101d516bc4aa11b0d7777fe52139e3fcad08a"
+SRC_URI[md5sum] = "9a02b0382b78cc2d515fb950275d4c02"
+SRC_URI[sha256sum] = "f7ef925541ee32c6d15ae5cb27da5f119e01a5ccdbe9fe57bf836730d7b7a65b"
 
 inherit autotools gettext
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch b/meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch
deleted file mode 100644
index 86cf7c8..0000000
--- a/meta/recipes-devtools/elfutils/files/0001-arlib-Check-that-sh_entsize-isn-t-zero.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b518841fbc1431d7c5baa016e35f10fb647b5958 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Thu, 18 Oct 2018 19:01:52 +0200
-Subject: [PATCH] arlib: Check that sh_entsize isn't zero.
-
-A bogus ELF file could have sh_entsize as zero. Don't divide by zero,
-but just assume there are no symbols in the section.
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=23786
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-
-CVE: CVE-2018-18521
-Upstream-Status: Backport [http://sourceware.org/git/elfutils.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/arlib.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/arlib.c b/src/arlib.c
-index 778e087..a6521e3 100644
---- a/src/arlib.c
-+++ b/src/arlib.c
-@@ -252,6 +252,9 @@ arlib_add_symbols (Elf *elf, const char *arfname, const char *membername,
-       if (data == NULL)
- 	continue;
- 
-+      if (shdr->sh_entsize == 0)
-+	continue;
-+
-       int nsyms = shdr->sh_size / shdr->sh_entsize;
-       for (int ndx = shdr->sh_info; ndx < nsyms; ++ndx)
- 	{
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch b/meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch
deleted file mode 100644
index 2c74a8d..0000000
--- a/meta/recipes-devtools/elfutils/files/0001-libdwfl-Sanity-check-partial-core-file-data-reads.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 8cbb2f8de89d65ca52d4242f213a6206b48d2c8d Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 2 Nov 2018 14:22:31 +0800
-Subject: [PATCH] libdwfl: Sanity check partial core file data reads.
-
-There were two issues when reading note data from a core file.
-We didn't check if the data we already had in a buffer was big
-enough. And if we did get the data, we should check if we got
-everything, or just a part of the data.
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=23752
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-
-CVE: CVE-2018-18310
-Upstream-Status: Backport [http://sourceware.org/git/elfutils.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- libdwfl/dwfl_segment_report_module.c | 13 +++++++++++--
- 1 file changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/libdwfl/dwfl_segment_report_module.c b/libdwfl/dwfl_segment_report_module.c
-index 36e5c82..8749884 100644
---- a/libdwfl/dwfl_segment_report_module.c
-+++ b/libdwfl/dwfl_segment_report_module.c
-@@ -1,5 +1,5 @@
- /* Sniff out modules from ELF headers visible in memory segments.
--   Copyright (C) 2008-2012, 2014, 2015 Red Hat, Inc.
-+   Copyright (C) 2008-2012, 2014, 2015, 2018 Red Hat, Inc.
-    This file is part of elfutils.
- 
-    This file is free software; you can redistribute it and/or modify
-@@ -301,7 +301,10 @@ dwfl_segment_report_module (Dwfl *dwfl, int ndx, const char *name,
-   inline bool read_portion (void **data, size_t *data_size,
- 			    GElf_Addr vaddr, size_t filesz)
-   {
--    if (vaddr - start + filesz > buffer_available
-+    /* Check whether we will have to read the segment data, or if it
-+       can be returned from the existing buffer.  */
-+    if (filesz > buffer_available
-+	|| vaddr - start > buffer_available - filesz
- 	/* If we're in string mode, then don't consider the buffer we have
- 	   sufficient unless it contains the terminator of the string.  */
- 	|| (filesz == 0 && memchr (vaddr - start + buffer, '\0',
-@@ -459,6 +462,12 @@ dwfl_segment_report_module (Dwfl *dwfl, int ndx, const char *name,
-     if (read_portion (&data, &data_size, vaddr, filesz))
-       return;
- 
-+    /* data_size will be zero if we got everything from the initial
-+       buffer, otherwise it will be the size of the new buffer that
-+       could be read.  */
-+    if (data_size != 0)
-+      filesz = data_size;
-+
-     assert (sizeof (Elf32_Nhdr) == sizeof (Elf64_Nhdr));
- 
-     void *notes;
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch b/meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch
deleted file mode 100644
index 6fed826..0000000
--- a/meta/recipes-devtools/elfutils/files/0001-size-Handle-recursive-ELF-ar-files.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 440d34d0ee37964453245895d38d7fc31bcf3d7d Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Thu, 18 Oct 2018 23:15:48 +0200
-Subject: [PATCH] size: Handle recursive ELF ar files.
-
-eu-size didn't handle an ELF ar file that contained an ar file itself
-correctly. handle_ar would recursively call itself but close the ELF
-file before returning. Only close the ELF file at the top-level.
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=23787
-
-Signed-off-by: Mark Wielaard <mark@klomp.org>
-
-CVE: CVE-2018-18520
-Upstream-Status: Backport [http://sourceware.org/git/elfutils.git]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/size.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/size.c b/src/size.c
-index 5ff3f2a..f01fd88 100644
---- a/src/size.c
-+++ b/src/size.c
-@@ -374,8 +374,10 @@ handle_ar (int fd, Elf *elf, const char *prefix, const char *fname)
- 	INTERNAL_ERROR (fname);
-     }
- 
--  if (unlikely (elf_end (elf) != 0))
--    INTERNAL_ERROR (fname);
-+  /* Only close ELF handle if this was a "top level" ar file.  */
-+  if (prefix == NULL)
-+    if (unlikely (elf_end (elf) != 0))
-+      INTERNAL_ERROR (fname);
- 
-   return result;
- }
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
deleted file mode 100644
index e2966cb..0000000
--- a/meta/recipes-devtools/elfutils/files/0005-fix-a-stack-usage-warning.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 4d7ea681932556ad881f6841de90d0bfff56f8d7 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 15 Aug 2017 17:25:16 +0800
-Subject: [PATCH 5/7] fix a stack-usage warning
-
-Upstream-Status: Pending
-
-not use a variable to as a array size, otherwise the warning to error
-that
-stack usage might be unbounded [-Werror=stack-usage=] will happen
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
-Rebase to 0.170
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/ppc_initreg.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
-index 3e4432f..59c2d97 100644
---- a/backends/ppc_initreg.c
-+++ b/backends/ppc_initreg.c
-@@ -94,7 +94,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__ ((unused)),
- 	return false;
-     }
-   const size_t gprs = sizeof (user_regs.r.gpr) / sizeof (*user_regs.r.gpr);
--  Dwarf_Word dwarf_regs[gprs];
-+  Dwarf_Word dwarf_regs[sizeof (user_regs.r.gpr) / sizeof (*user_regs.r.gpr)];
-   for (unsigned gpr = 0; gpr < gprs; gpr++)
-     dwarf_regs[gpr] = user_regs.r.gpr[gpr];
-   if (! setfunc (0, gprs, dwarf_regs, arg))
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
index 0f01a32..41981f4 100644
--- a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -7,7 +7,7 @@ Subject: [PATCH] build: Provide alternatives for glibc assumptions helps
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Rebase to 0.174
+Rebase to 0.175
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
@@ -129,7 +129,7 @@ index 7bcf61c..c345797 100644
        return elf_errmsg (error & 0xffff);
      case OTHER_ERROR (LIBDW):
 diff --git a/libdwfl/dwfl_module_getdwarf.c b/libdwfl/dwfl_module_getdwarf.c
-index af6838a..c079d6a 100644
+index 56e6105..f4a0649 100644
 --- a/libdwfl/dwfl_module_getdwarf.c
 +++ b/libdwfl/dwfl_module_getdwarf.c
 @@ -35,6 +35,7 @@
@@ -161,12 +161,12 @@ index f849128..6f0aca1 100644
  #define crc32 __libdwfl_crc32
  #include <libdwflP.h>
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
-index 9d0fef2..9fc09b8 100644
+index 360e4ee..b5aa397 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
-@@ -40,6 +40,7 @@
- #include <system.h>
+@@ -41,6 +41,7 @@
  
+ #include "libelfP.h"
  #include "libdwflP.h"
 +#include "system.h"
  #include <inttypes.h>
@@ -198,7 +198,7 @@ index 5dc632b..14da1b7 100644
  
  #endif	/* elf.h */
 diff --git a/libelf/libelf.h b/libelf/libelf.h
-index d11358c..4cf9272 100644
+index 1ff11c9..c21e018 100644
 --- a/libelf/libelf.h
 +++ b/libelf/libelf.h
 @@ -29,6 +29,7 @@
@@ -210,7 +210,7 @@ index d11358c..4cf9272 100644
  #include <sys/types.h>
  
 diff --git a/libelf/libelfP.h b/libelf/libelfP.h
-index ed216c8..415e6f6 100644
+index 9f3e8e9..10a347a 100644
 --- a/libelf/libelfP.h
 +++ b/libelf/libelfP.h
 @@ -32,6 +32,7 @@
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
index 8c48f4d..fa3a3c6 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0001-Ignore-differences-between-mips-machine-identifiers.patch
@@ -1,6 +1,3 @@
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 From 77cb4a53c270d5854d3af24f19547bc3de825233 Mon Sep 17 00:00:00 2001
 From: James Cowgill <james410@cowgill.org.uk>
 Date: Mon, 5 Jan 2015 15:16:58 +0000
@@ -11,6 +8,8 @@ from the elf machine id. Also, the EM_MIPS_RS3_LE machine is dead anyway (the
 kernel will not load binaries containing it).
 
 Signed-off-by: James Cowgill <james410@cowgill.org.uk>
+Upstream-Status: Pending [from debian]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  backends/mips_init.c | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch b/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
deleted file mode 100644
index 26869a3..0000000
--- a/meta/recipes-devtools/elfutils/files/debian/0001-fix-gcc7-ftbfs.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 91c0a0da2a8932f163d57db5d9d847bed6822502 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 29 Jun 2018 15:59:57 +0800
-Subject: [PATCH] fix gcc7 ftbfs
-
-Upstream-Status: Pending [from debian]
-fix-gcc7-ftbfs.diff and rebase to 0.172
-
-http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/mips_retval.c   | 1 +
- backends/parisc_retval.c | 1 +
- src/ar.c                 | 2 +-
- 3 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/backends/mips_retval.c b/backends/mips_retval.c
-index 57487bb..e7973a8 100644
---- a/backends/mips_retval.c
-+++ b/backends/mips_retval.c
-@@ -390,6 +390,7 @@ mips_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-         }
- 
-       /* Fallthrough to handle large types */
-+      /* Fall through.  */
- 
-     case DW_TAG_array_type:
-     large:
-diff --git a/backends/parisc_retval.c b/backends/parisc_retval.c
-index df7ec3a..988e1fe 100644
---- a/backends/parisc_retval.c
-+++ b/backends/parisc_retval.c
-@@ -167,6 +167,7 @@ parisc_return_value_location_ (Dwarf_Die *functypedie, const Dwarf_Op **locp, in
- 
- 	/* Else fall through.  */
-       }
-+      /* Fall through.  */
- 
-     case DW_TAG_structure_type:
-     case DW_TAG_class_type:
-diff --git a/src/ar.c b/src/ar.c
-index 818115b..c77e9f4 100644
---- a/src/ar.c
-+++ b/src/ar.c
-@@ -1073,7 +1073,7 @@ do_oper_delete (const char *arfname, char **argv, int argc,
- static bool
- no0print (bool ofmt, char *buf, int bufsize, long int val)
- {
--  char tmpbuf[bufsize + 1];
-+  char tmpbuf[bufsize + 1 + 4];
-   int ret = snprintf (tmpbuf, sizeof (tmpbuf), ofmt ? "%-*lo" : "%-*ld",
- 		      bufsize, val);
-   if (ret >= (int) sizeof (tmpbuf))
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch b/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
deleted file mode 100644
index f4c6f40..0000000
--- a/meta/recipes-devtools/elfutils/files/debian/0001-testsuite-ignore-elflint.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From fe7613a3b9f2443cc11917826348d4521f267c96 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 29 Jun 2018 15:48:33 +0800
-Subject: [PATCH] testsuite ignore elflint
-
-On many architectures this test fails because binaries/libs produced by
-binutils don't pass elflint. However elfutils shouldn't FTBFS because of this.
-
-So we run the tests on all archs to see what breaks, but if it breaks we ignore
-the result (exitcode 77 means: this test was skipped).
-
-Upstream-Status: Pending [from debian]
-testsuite-ignore-elflint.diff and rebase to 0.172
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tests/run-elflint-self.sh |  2 +-
- tests/test-subr.sh        | 15 +++++++++++++++
- 2 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/tests/run-elflint-self.sh b/tests/run-elflint-self.sh
-index 58fa7d0..85d21a5 100755
---- a/tests/run-elflint-self.sh
-+++ b/tests/run-elflint-self.sh
-@@ -18,5 +18,5 @@
- 
- . $srcdir/test-subr.sh
- 
--testrun_on_self ${abs_top_builddir}/src/elflint --quiet --gnu-ld
-+testrun_on_self_skip ${abs_top_builddir}/src/elflint --quiet --gnu-ld
- testrun_on_self_compressed ${abs_top_builddir}/src/elflint --quiet --gnu-ld
-diff --git a/tests/test-subr.sh b/tests/test-subr.sh
-index 09f428d..26f61f1 100644
---- a/tests/test-subr.sh
-+++ b/tests/test-subr.sh
-@@ -201,3 +201,18 @@ testrun_on_self_quiet()
-   # Only exit if something failed
-   if test $exit_status != 0; then exit $exit_status; fi
- }
-+
-+# Same as testrun_on_self(), but skip on failure.
-+testrun_on_self_skip()
-+{
-+  exit_status=0
-+
-+  for file in $self_test_files; do
-+      testrun $* $file \
-+	  || { echo "*** failure in $* $file"; exit_status=77; }
-+  done
-+
-+  # Only exit if something failed
-+  if test $exit_status != 0; then exit $exit_status; fi
-+}
-+
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
index 4bdb1ff..1ab704e 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
@@ -1,12 +1,11 @@
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 From fdaab18a65ed2529656baa64cb6169f34d7e507b Mon Sep 17 00:00:00 2001
 From: James Cowgill <james410@cowgill.org.uk>
 Date: Mon, 5 Jan 2015 15:17:01 +0000
 Subject: [PATCH 2/3] Add support for mips64 abis in mips_retval.c
 
 Signed-off-by: James Cowgill <james410@cowgill.org.uk>
+Upstream-Status: Pending [from debian]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  backends/mips_retval.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-----
  1 file changed, 94 insertions(+), 10 deletions(-)
diff --git a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
index d27ce6d..b196802 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/0003-Add-mips-n64-relocation-format-hack.patch
@@ -1,6 +1,3 @@
-Upstream-Status: Pending [from debian]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 From 59d4b8c48e5040af7e02b34eb26ea602ec82a38e Mon Sep 17 00:00:00 2001
 From: James Cowgill <james410@cowgill.org.uk>
 Date: Mon, 5 Jan 2015 15:17:02 +0000
@@ -15,6 +12,8 @@ This patch also ensures that strip.c sets the correct value of e_machine
 before manipulating relocations so that these changes take effect.
 
 Signed-off-by: James Cowgill <james410@cowgill.org.uk>
+Upstream-Status: Pending [from debian]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  libelf/gelf_getrel.c      | 25 +++++++++++++++++++++++--
  libelf/gelf_getrela.c     | 25 +++++++++++++++++++++++--
@@ -23,10 +22,10 @@ Signed-off-by: James Cowgill <james410@cowgill.org.uk>
  src/strip.c               | 17 +++++++++++++++++
  5 files changed, 101 insertions(+), 6 deletions(-)
 
-Index: b/libelf/gelf_getrel.c
+Index: elfutils-0.175/libelf/gelf_getrel.c
 ===================================================================
---- a/libelf/gelf_getrel.c
-+++ b/libelf/gelf_getrel.c
+--- elfutils-0.175.orig/libelf/gelf_getrel.c
++++ elfutils-0.175/libelf/gelf_getrel.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -66,10 +65,10 @@ Index: b/libelf/gelf_getrel.c
      }
  
    rwlock_unlock (scn->elf->lock);
-Index: b/libelf/gelf_getrela.c
+Index: elfutils-0.175/libelf/gelf_getrela.c
 ===================================================================
---- a/libelf/gelf_getrela.c
-+++ b/libelf/gelf_getrela.c
+--- elfutils-0.175.orig/libelf/gelf_getrela.c
++++ elfutils-0.175/libelf/gelf_getrela.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -109,10 +108,10 @@ Index: b/libelf/gelf_getrela.c
      }
  
    rwlock_unlock (scn->elf->lock);
-Index: b/libelf/gelf_update_rel.c
+Index: elfutils-0.175/libelf/gelf_update_rel.c
 ===================================================================
---- a/libelf/gelf_update_rel.c
-+++ b/libelf/gelf_update_rel.c
+--- elfutils-0.175.orig/libelf/gelf_update_rel.c
++++ elfutils-0.175/libelf/gelf_update_rel.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -154,10 +153,10 @@ Index: b/libelf/gelf_update_rel.c
      }
  
    result = 1;
-Index: b/libelf/gelf_update_rela.c
+Index: elfutils-0.175/libelf/gelf_update_rela.c
 ===================================================================
---- a/libelf/gelf_update_rela.c
-+++ b/libelf/gelf_update_rela.c
+--- elfutils-0.175.orig/libelf/gelf_update_rela.c
++++ elfutils-0.175/libelf/gelf_update_rela.c
 @@ -36,6 +36,7 @@
  
  #include "libelfP.h"
@@ -199,11 +198,11 @@ Index: b/libelf/gelf_update_rela.c
      }
  
    result = 1;
-Index: b/src/strip.c
+Index: elfutils-0.175/src/strip.c
 ===================================================================
---- a/src/strip.c
-+++ b/src/strip.c
-@@ -598,6 +598,23 @@ handle_elf (int fd, Elf *elf, const char
+--- elfutils-0.175.orig/src/strip.c
++++ elfutils-0.175/src/strip.c
+@@ -1062,6 +1062,23 @@ handle_elf (int fd, Elf *elf, const char
        goto fail;
      }
  
@@ -225,5 +224,5 @@ Index: b/src/strip.c
 +    }
 +
    /* Copy over the old program header if needed.  */
-   if (ehdr->e_type != ET_REL)
-     for (cnt = 0; cnt < phnum; ++cnt)
+   if (phnum > 0)
+     {
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch b/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
similarity index 85%
rename from meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch
rename to meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
index 4ed8119..f7258a8 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-arm_backend.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/arm_backend.diff
@@ -1,30 +1,10 @@
-From a95f370bc2690c150c46f215543de278469900eb Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 29 Jun 2018 15:42:39 +0800
-Subject: [PATCH] arm_backend
-
 Upstream-Status: Pending [from debian]
-arm_backend.diff and rebase to 0.172
-
-http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
-
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/arm_init.c                 |  18 ++++-
- backends/arm_regs.c                 | 132 ++++++++++++++++++++++++++++++++++++
- backends/arm_retval.c               |  43 +++++++++++-
- backends/libebl_arm.h               |   9 +++
- libelf/elf.h                        |  11 +++
- tests/run-addrcfi.sh                |  93 ++++++++++++++++++++++++-
- tests/run-allregs.sh                |  95 +++++++++++++++++++++++++-
- tests/run-readelf-mixed-corenote.sh |  11 ++-
- 8 files changed, 400 insertions(+), 12 deletions(-)
- create mode 100644 backends/libebl_arm.h
 
-diff --git a/backends/arm_init.c b/backends/arm_init.c
-index f2b1b11..1b71f16 100644
---- a/backends/arm_init.c
-+++ b/backends/arm_init.c
+Index: elfutils-0.175/backends/arm_init.c
+===================================================================
+--- elfutils-0.175.orig/backends/arm_init.c
++++ elfutils-0.175/backends/arm_init.c
 @@ -35,20 +35,31 @@
  #define RELOC_PREFIX	R_ARM_
  #include "libebl_CPU.h"
@@ -58,7 +38,7 @@ index f2b1b11..1b71f16 100644
    /* We handle it.  */
    eh->name = "ARM";
    arm_init_reloc (eh);
-@@ -60,7 +71,10 @@ arm_init (Elf *elf __attribute__ ((unused)),
+@@ -60,7 +71,10 @@ arm_init (Elf *elf __attribute__ ((unuse
    HOOK (eh, core_note);
    HOOK (eh, auxv_info);
    HOOK (eh, check_object_attribute);
@@ -70,10 +50,10 @@ index f2b1b11..1b71f16 100644
    HOOK (eh, abi_cfi);
    HOOK (eh, check_reloc_target_type);
    HOOK (eh, symbol_type_name);
-diff --git a/backends/arm_regs.c b/backends/arm_regs.c
-index a46a4c9..418c931 100644
---- a/backends/arm_regs.c
-+++ b/backends/arm_regs.c
+Index: elfutils-0.175/backends/arm_regs.c
+===================================================================
+--- elfutils-0.175.orig/backends/arm_regs.c
++++ elfutils-0.175/backends/arm_regs.c
 @@ -31,6 +31,7 @@
  #endif
  
@@ -82,7 +62,7 @@ index a46a4c9..418c931 100644
  #include <dwarf.h>
  
  #define BACKEND arm_
-@@ -76,6 +77,9 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
+@@ -76,6 +77,9 @@ arm_register_info (Ebl *ebl __attribute_
        break;
  
      case 16 + 0 ... 16 + 7:
@@ -92,7 +72,7 @@ index a46a4c9..418c931 100644
        regno += 96 - 16;
        FALLTHROUGH;
      case 96 + 0 ... 96 + 7:
-@@ -87,11 +91,139 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
+@@ -87,11 +91,139 @@ arm_register_info (Ebl *ebl __attribute_
        namelen = 2;
        break;
  
@@ -232,10 +212,10 @@ index a46a4c9..418c931 100644
        *setname = "VFP";
        *type = DW_ATE_float;
        *bits = 64;
-diff --git a/backends/arm_retval.c b/backends/arm_retval.c
-index 1c28f01..313e4eb 100644
---- a/backends/arm_retval.c
-+++ b/backends/arm_retval.c
+Index: elfutils-0.175/backends/arm_retval.c
+===================================================================
+--- elfutils-0.175.orig/backends/arm_retval.c
++++ elfutils-0.175/backends/arm_retval.c
 @@ -48,6 +48,13 @@ static const Dwarf_Op loc_intreg[] =
  #define nloc_intreg	1
  #define nloc_intregs(n)	(2 * (n))
@@ -262,7 +242,7 @@ index 1c28f01..313e4eb 100644
  {
    /* Start with the function's type, and get the DW_AT_type attribute,
       which is the type of the return value.  */
-@@ -98,6 +106,21 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+@@ -98,6 +106,21 @@ arm_return_value_location (Dwarf_Die *fu
  	    else
  	      return -1;
  	  }
@@ -284,7 +264,7 @@ index 1c28f01..313e4eb 100644
  	if (size <= 16)
  	  {
  	  intreg:
-@@ -106,6 +129,7 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+@@ -106,6 +129,7 @@ arm_return_value_location (Dwarf_Die *fu
  	  }
  
        aggregate:
@@ -292,7 +272,7 @@ index 1c28f01..313e4eb 100644
  	*locp = loc_aggregate;
  	return nloc_aggregate;
        }
-@@ -125,3 +149,18 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+@@ -125,3 +149,18 @@ arm_return_value_location (Dwarf_Die *fu
       DWARF and might be valid.  */
    return -2;
  }
@@ -311,26 +291,11 @@ index 1c28f01..313e4eb 100644
 +   return arm_return_value_location_ (functypedie, locp, 0);
 +}
 +
-diff --git a/backends/libebl_arm.h b/backends/libebl_arm.h
-new file mode 100644
-index 0000000..c00770c
---- /dev/null
-+++ b/backends/libebl_arm.h
-@@ -0,0 +1,9 @@
-+#ifndef _LIBEBL_ARM_H
-+#define _LIBEBL_ARM_H 1
-+
-+#include <libdw.h>
-+
-+extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
-+extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
-+
-+#endif
-diff --git a/libelf/elf.h b/libelf/elf.h
-index 6c9f61e..6d82fef 100644
---- a/libelf/elf.h
-+++ b/libelf/elf.h
-@@ -2692,6 +2692,9 @@ enum
+Index: elfutils-0.175/libelf/elf.h
+===================================================================
+--- elfutils-0.175.orig/libelf/elf.h
++++ elfutils-0.175/libelf/elf.h
+@@ -2694,6 +2694,9 @@ enum
  #define EF_ARM_EABI_VER4	0x04000000
  #define EF_ARM_EABI_VER5	0x05000000
  
@@ -340,7 +305,7 @@ index 6c9f61e..6d82fef 100644
  /* Additional symbol types for Thumb.  */
  #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
  #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
-@@ -2709,12 +2712,19 @@ enum
+@@ -2711,12 +2714,19 @@ enum
  
  /* Processor specific values for the Phdr p_type field.  */
  #define PT_ARM_EXIDX		(PT_LOPROC + 1)	/* ARM unwind segment.  */
@@ -360,7 +325,7 @@ index 6c9f61e..6d82fef 100644
  
  /* AArch64 relocs.  */
  
-@@ -3007,6 +3017,7 @@ enum
+@@ -3009,6 +3019,7 @@ enum
  					   TLS block (LDR, STR).  */
  #define R_ARM_TLS_IE12GP	111	/* 12 bit GOT entry relative
  					   to GOT origin (LDR).  */
@@ -368,121 +333,24 @@ index 6c9f61e..6d82fef 100644
  #define R_ARM_ME_TOO		128	/* Obsolete.  */
  #define R_ARM_THM_TLS_DESCSEQ	129
  #define R_ARM_THM_TLS_DESCSEQ16	129
-diff --git a/tests/run-addrcfi.sh b/tests/run-addrcfi.sh
-index fd89d02..462d7c5 100755
---- a/tests/run-addrcfi.sh
-+++ b/tests/run-addrcfi.sh
-@@ -3554,6 +3554,38 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
- 	FPA reg21 (f5): undefined
- 	FPA reg22 (f6): undefined
- 	FPA reg23 (f7): undefined
-+	VFP reg64 (s0): undefined
-+	VFP reg65 (s1): undefined
-+	VFP reg66 (s2): undefined
-+	VFP reg67 (s3): undefined
-+	VFP reg68 (s4): undefined
-+	VFP reg69 (s5): undefined
-+	VFP reg70 (s6): undefined
-+	VFP reg71 (s7): undefined
-+	VFP reg72 (s8): undefined
-+	VFP reg73 (s9): undefined
-+	VFP reg74 (s10): undefined
-+	VFP reg75 (s11): undefined
-+	VFP reg76 (s12): undefined
-+	VFP reg77 (s13): undefined
-+	VFP reg78 (s14): undefined
-+	VFP reg79 (s15): undefined
-+	VFP reg80 (s16): undefined
-+	VFP reg81 (s17): undefined
-+	VFP reg82 (s18): undefined
-+	VFP reg83 (s19): undefined
-+	VFP reg84 (s20): undefined
-+	VFP reg85 (s21): undefined
-+	VFP reg86 (s22): undefined
-+	VFP reg87 (s23): undefined
-+	VFP reg88 (s24): undefined
-+	VFP reg89 (s25): undefined
-+	VFP reg90 (s26): undefined
-+	VFP reg91 (s27): undefined
-+	VFP reg92 (s28): undefined
-+	VFP reg93 (s29): undefined
-+	VFP reg94 (s30): undefined
-+	VFP reg95 (s31): undefined
- 	FPA reg96 (f0): undefined
- 	FPA reg97 (f1): undefined
- 	FPA reg98 (f2): undefined
-@@ -3562,7 +3594,66 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
- 	FPA reg101 (f5): undefined
- 	FPA reg102 (f6): undefined
- 	FPA reg103 (f7): undefined
--	integer reg128 (spsr): undefined
-+	MMX reg104 (wcgr0): undefined
-+	MMX reg105 (wcgr1): undefined
-+	MMX reg106 (wcgr2): undefined
-+	MMX reg107 (wcgr3): undefined
-+	MMX reg108 (wcgr4): undefined
-+	MMX reg109 (wcgr5): undefined
-+	MMX reg110 (wcgr6): undefined
-+	MMX reg111 (wcgr7): undefined
-+	MMX reg112 (wr0): undefined
-+	MMX reg113 (wr1): undefined
-+	MMX reg114 (wr2): undefined
-+	MMX reg115 (wr3): undefined
-+	MMX reg116 (wr4): undefined
-+	MMX reg117 (wr5): undefined
-+	MMX reg118 (wr6): undefined
-+	MMX reg119 (wr7): undefined
-+	MMX reg120 (wr8): undefined
-+	MMX reg121 (wr9): undefined
-+	MMX reg122 (wr10): undefined
-+	MMX reg123 (wr11): undefined
-+	MMX reg124 (wr12): undefined
-+	MMX reg125 (wr13): undefined
-+	MMX reg126 (wr14): undefined
-+	MMX reg127 (wr15): undefined
-+	state reg128 (spsr): undefined
-+	state reg129 (spsr_fiq): undefined
-+	state reg130 (spsr_irq): undefined
-+	state reg131 (spsr_abt): undefined
-+	state reg132 (spsr_und): undefined
-+	state reg133 (spsr_svc): undefined
-+	integer reg144 (r8_usr): undefined
-+	integer reg145 (r9_usr): undefined
-+	integer reg146 (r10_usr): undefined
-+	integer reg147 (r11_usr): undefined
-+	integer reg148 (r12_usr): undefined
-+	integer reg149 (r13_usr): undefined
-+	integer reg150 (r14_usr): undefined
-+	integer reg151 (r8_fiq): undefined
-+	integer reg152 (r9_fiq): undefined
-+	integer reg153 (r10_fiq): undefined
-+	integer reg154 (r11_fiq): undefined
-+	integer reg155 (r12_fiq): undefined
-+	integer reg156 (r13_fiq): undefined
-+	integer reg157 (r14_fiq): undefined
-+	integer reg158 (r13_irq): undefined
-+	integer reg159 (r14_irq): undefined
-+	integer reg160 (r13_abt): undefined
-+	integer reg161 (r14_abt): undefined
-+	integer reg162 (r13_und): undefined
-+	integer reg163 (r14_und): undefined
-+	integer reg164 (r13_svc): undefined
-+	integer reg165 (r14_svc): undefined
-+	MMX reg192 (wc0): undefined
-+	MMX reg193 (wc1): undefined
-+	MMX reg194 (wc2): undefined
-+	MMX reg195 (wc3): undefined
-+	MMX reg196 (wc4): undefined
-+	MMX reg197 (wc5): undefined
-+	MMX reg198 (wc6): undefined
-+	MMX reg199 (wc7): undefined
- 	VFP reg256 (d0): undefined
- 	VFP reg257 (d1): undefined
- 	VFP reg258 (d2): undefined
-diff --git a/tests/run-allregs.sh b/tests/run-allregs.sh
-index 7ddd452..a31dba4 100755
---- a/tests/run-allregs.sh
-+++ b/tests/run-allregs.sh
+Index: elfutils-0.175/backends/libebl_arm.h
+===================================================================
+--- /dev/null
++++ elfutils-0.175/backends/libebl_arm.h
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_ARM_H
++#define _LIBEBL_ARM_H 1
++
++#include <libdw.h>
++
++extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
++extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
+Index: elfutils-0.175/tests/run-allregs.sh
+===================================================================
+--- elfutils-0.175.orig/tests/run-allregs.sh
++++ elfutils-0.175/tests/run-allregs.sh
 @@ -2672,7 +2672,28 @@ integer registers:
  	 13: sp (sp), address 32 bits
  	 14: lr (lr), address 32 bits
@@ -600,11 +468,11 @@ index 7ddd452..a31dba4 100755
  EOF
  
  # See run-readelf-mixed-corenote.sh for instructions to regenerate
-diff --git a/tests/run-readelf-mixed-corenote.sh b/tests/run-readelf-mixed-corenote.sh
-index 86171c4..018612f 100755
---- a/tests/run-readelf-mixed-corenote.sh
-+++ b/tests/run-readelf-mixed-corenote.sh
-@@ -31,12 +31,11 @@ Note segment of 892 bytes at offset 0x274:
+Index: elfutils-0.175/tests/run-readelf-mixed-corenote.sh
+===================================================================
+--- elfutils-0.175.orig/tests/run-readelf-mixed-corenote.sh
++++ elfutils-0.175/tests/run-readelf-mixed-corenote.sh
+@@ -31,12 +31,11 @@ Note segment of 892 bytes at offset 0x27
      pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
      utime: 0.000000, stime: 0.010000, cutime: 0.000000, cstime: 0.000000
      orig_r0: -1, fpvalid: 1
@@ -622,6 +490,114 @@ index 86171c4..018612f 100755
    CORE                 124  PRPSINFO
      state: 0, sname: R, zomb: 0, nice: 0, flag: 0x00400500
      uid: 0, gid: 0, pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
--- 
-2.7.4
-
+Index: elfutils-0.175/tests/run-addrcfi.sh
+===================================================================
+--- elfutils-0.175.orig/tests/run-addrcfi.sh
++++ elfutils-0.175/tests/run-addrcfi.sh
+@@ -3554,6 +3554,38 @@ dwarf_cfi_addrframe (.eh_frame): no matc
+ 	FPA reg21 (f5): undefined
+ 	FPA reg22 (f6): undefined
+ 	FPA reg23 (f7): undefined
++	VFP reg64 (s0): undefined
++	VFP reg65 (s1): undefined
++	VFP reg66 (s2): undefined
++	VFP reg67 (s3): undefined
++	VFP reg68 (s4): undefined
++	VFP reg69 (s5): undefined
++	VFP reg70 (s6): undefined
++	VFP reg71 (s7): undefined
++	VFP reg72 (s8): undefined
++	VFP reg73 (s9): undefined
++	VFP reg74 (s10): undefined
++	VFP reg75 (s11): undefined
++	VFP reg76 (s12): undefined
++	VFP reg77 (s13): undefined
++	VFP reg78 (s14): undefined
++	VFP reg79 (s15): undefined
++	VFP reg80 (s16): undefined
++	VFP reg81 (s17): undefined
++	VFP reg82 (s18): undefined
++	VFP reg83 (s19): undefined
++	VFP reg84 (s20): undefined
++	VFP reg85 (s21): undefined
++	VFP reg86 (s22): undefined
++	VFP reg87 (s23): undefined
++	VFP reg88 (s24): undefined
++	VFP reg89 (s25): undefined
++	VFP reg90 (s26): undefined
++	VFP reg91 (s27): undefined
++	VFP reg92 (s28): undefined
++	VFP reg93 (s29): undefined
++	VFP reg94 (s30): undefined
++	VFP reg95 (s31): undefined
+ 	FPA reg96 (f0): undefined
+ 	FPA reg97 (f1): undefined
+ 	FPA reg98 (f2): undefined
+@@ -3562,7 +3594,66 @@ dwarf_cfi_addrframe (.eh_frame): no matc
+ 	FPA reg101 (f5): undefined
+ 	FPA reg102 (f6): undefined
+ 	FPA reg103 (f7): undefined
+-	integer reg128 (spsr): undefined
++	MMX reg104 (wcgr0): undefined
++	MMX reg105 (wcgr1): undefined
++	MMX reg106 (wcgr2): undefined
++	MMX reg107 (wcgr3): undefined
++	MMX reg108 (wcgr4): undefined
++	MMX reg109 (wcgr5): undefined
++	MMX reg110 (wcgr6): undefined
++	MMX reg111 (wcgr7): undefined
++	MMX reg112 (wr0): undefined
++	MMX reg113 (wr1): undefined
++	MMX reg114 (wr2): undefined
++	MMX reg115 (wr3): undefined
++	MMX reg116 (wr4): undefined
++	MMX reg117 (wr5): undefined
++	MMX reg118 (wr6): undefined
++	MMX reg119 (wr7): undefined
++	MMX reg120 (wr8): undefined
++	MMX reg121 (wr9): undefined
++	MMX reg122 (wr10): undefined
++	MMX reg123 (wr11): undefined
++	MMX reg124 (wr12): undefined
++	MMX reg125 (wr13): undefined
++	MMX reg126 (wr14): undefined
++	MMX reg127 (wr15): undefined
++	state reg128 (spsr): undefined
++	state reg129 (spsr_fiq): undefined
++	state reg130 (spsr_irq): undefined
++	state reg131 (spsr_abt): undefined
++	state reg132 (spsr_und): undefined
++	state reg133 (spsr_svc): undefined
++	integer reg144 (r8_usr): undefined
++	integer reg145 (r9_usr): undefined
++	integer reg146 (r10_usr): undefined
++	integer reg147 (r11_usr): undefined
++	integer reg148 (r12_usr): undefined
++	integer reg149 (r13_usr): undefined
++	integer reg150 (r14_usr): undefined
++	integer reg151 (r8_fiq): undefined
++	integer reg152 (r9_fiq): undefined
++	integer reg153 (r10_fiq): undefined
++	integer reg154 (r11_fiq): undefined
++	integer reg155 (r12_fiq): undefined
++	integer reg156 (r13_fiq): undefined
++	integer reg157 (r14_fiq): undefined
++	integer reg158 (r13_irq): undefined
++	integer reg159 (r14_irq): undefined
++	integer reg160 (r13_abt): undefined
++	integer reg161 (r14_abt): undefined
++	integer reg162 (r13_und): undefined
++	integer reg163 (r14_und): undefined
++	integer reg164 (r13_svc): undefined
++	integer reg165 (r14_svc): undefined
++	MMX reg192 (wc0): undefined
++	MMX reg193 (wc1): undefined
++	MMX reg194 (wc2): undefined
++	MMX reg195 (wc3): undefined
++	MMX reg196 (wc4): undefined
++	MMX reg197 (wc5): undefined
++	MMX reg198 (wc6): undefined
++	MMX reg199 (wc7): undefined
+ 	VFP reg256 (d0): undefined
+ 	VFP reg257 (d1): undefined
+ 	VFP reg258 (d2): undefined
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch b/meta/recipes-devtools/elfutils/files/debian/disable_werror.patch
similarity index 46%
rename from meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch
rename to meta/recipes-devtools/elfutils/files/debian/disable_werror.patch
index 0f32b87..75736bf 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-disable_werror.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/disable_werror.patch
@@ -1,28 +1,16 @@
-From 5d45565e71ddab3d7848077b61eb0ca73c0bcbcc Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 29 Jun 2018 16:01:14 +0800
-Subject: [PATCH] disable -Werror as it tends to break with new gcc versions
-
+From: Helmut Grohne <helmut@subdivi.de>
+Subject: disable -Werror as it tends to break with new gcc versions
 Bug-Debian: https://bugs.debian.org/886004
 Last-Update: 2018-01-01
 
-Signed-off-by: Helmut Grohne <helmut@subdivi.de>
-
 Upstream-Status: Pending [from debian]
-mdisable_werror.patc and rebase to 0.172
-
-http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
-
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- config/eu.am | 1 -
- 1 file changed, 1 deletion(-)
 
-diff --git a/config/eu.am b/config/eu.am
-index c2cc349..99b368e 100644
---- a/config/eu.am
-+++ b/config/eu.am
-@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+Index: elfutils-0.175/config/eu.am
+===================================================================
+--- elfutils-0.175.orig/config/eu.am
++++ elfutils-0.175/config/eu.am
+@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -W
  	    -Wold-style-definition -Wstrict-prototypes \
  	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
@@ -30,6 +18,3 @@ index c2cc349..99b368e 100644
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
  	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
similarity index 90%
rename from meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch
rename to meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
index 2c5d4fa..105e3f4 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-hppa_backend.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/hppa_backend.diff
@@ -1,84 +1,10 @@
-From c510c6c8523246dd79c6ea28d1646b153c23e491 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 29 Jun 2018 15:39:46 +0800
-Subject: [PATCH] hppa_backend
-
 Upstream-Status: Pending [from debian]
-hppa_backend.diff and rebase to 0.172
-
-http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/Makefile.am      |   9 +-
- backends/libebl_parisc.h  |   9 ++
- backends/parisc_init.c    |  73 ++++++++++++++++
- backends/parisc_regs.c    | 159 ++++++++++++++++++++++++++++++++++
- backends/parisc_reloc.def | 128 ++++++++++++++++++++++++++++
- backends/parisc_retval.c  | 213 ++++++++++++++++++++++++++++++++++++++++++++++
- backends/parisc_symbol.c  | 112 ++++++++++++++++++++++++
- libelf/elf.h              |  11 +++
- 8 files changed, 711 insertions(+), 3 deletions(-)
- create mode 100644 backends/libebl_parisc.h
- create mode 100644 backends/parisc_init.c
- create mode 100644 backends/parisc_regs.c
- create mode 100644 backends/parisc_reloc.def
- create mode 100644 backends/parisc_retval.c
- create mode 100644 backends/parisc_symbol.c
 
-diff --git a/backends/Makefile.am b/backends/Makefile.am
-index 80aa00e..1e4b8e9 100644
---- a/backends/Makefile.am
-+++ b/backends/Makefile.am
-@@ -33,16 +33,16 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
- 
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx m68k bpf riscv
-+	  tilegx m68k bpf riscv parisc
- libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
- 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
- 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
- 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
--	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a
-+	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a \
-+	     libebl_parisc_pic.a
- noinst_LIBRARIES = $(libebl_pic)
- noinst_DATA = $(libebl_pic:_pic.a=.so)
- 
--
- libelf = ../libelf/libelf.so
- libdw = ../libdw/libdw.so
- libeu = ../lib/libeu.a
-@@ -135,6 +135,9 @@ riscv_SRCS = riscv_init.c riscv_symbol.c
- libebl_riscv_pic_a_SOURCES = $(riscv_SRCS)
- am_libebl_riscv_pic_a_OBJECTS = $(riscv_SRCS:.c=.os)
- 
-+parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
-+libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
-+am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
- 
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
- 	@rm -f $(@:.so=.map)
-diff --git a/backends/libebl_parisc.h b/backends/libebl_parisc.h
-new file mode 100644
-index 0000000..f473b79
---- /dev/null
-+++ b/backends/libebl_parisc.h
-@@ -0,0 +1,9 @@
-+#ifndef _LIBEBL_HPPA_H
-+#define _LIBEBL_HPPA_H 1
-+
-+#include <libdw.h>
-+
-+extern int parisc_return_value_location_32(Dwarf_Die *, const Dwarf_Op **locp);
-+extern int parisc_return_value_location_64(Dwarf_Die *, const Dwarf_Op **locp);
-+
-+#endif
-diff --git a/backends/parisc_init.c b/backends/parisc_init.c
-new file mode 100644
-index 0000000..f1e401c
+Index: elfutils-0.175/backends/parisc_init.c
+===================================================================
 --- /dev/null
-+++ b/backends/parisc_init.c
++++ elfutils-0.175/backends/parisc_init.c
 @@ -0,0 +1,73 @@
 +/* Initialization of PA-RISC specific backend library.
 +   Copyright (C) 2002, 2005, 2006 Red Hat, Inc.
@@ -153,11 +79,10 @@ index 0000000..f1e401c
 +
 +  return MODVERSION;
 +}
-diff --git a/backends/parisc_regs.c b/backends/parisc_regs.c
-new file mode 100644
-index 0000000..3895f8e
+Index: elfutils-0.175/backends/parisc_regs.c
+===================================================================
 --- /dev/null
-+++ b/backends/parisc_regs.c
++++ elfutils-0.175/backends/parisc_regs.c
 @@ -0,0 +1,159 @@
 +/* Register names and numbers for PA-RISC DWARF.
 +   Copyright (C) 2005, 2006 Red Hat, Inc.
@@ -318,11 +243,10 @@ index 0000000..3895f8e
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-diff --git a/backends/parisc_reloc.def b/backends/parisc_reloc.def
-new file mode 100644
-index 0000000..1f875ba
+Index: elfutils-0.175/backends/parisc_reloc.def
+===================================================================
 --- /dev/null
-+++ b/backends/parisc_reloc.def
++++ elfutils-0.175/backends/parisc_reloc.def
 @@ -0,0 +1,128 @@
 +/* List the relocation types for PA-RISC.  -*- C -*-
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -452,11 +376,10 @@ index 0000000..1f875ba
 +RELOC_TYPE (TLS_DTPMOD64,	DYN)
 +
 +#define NO_RELATIVE_RELOC       1
-diff --git a/backends/parisc_retval.c b/backends/parisc_retval.c
-new file mode 100644
-index 0000000..df7ec3a
+Index: elfutils-0.175/backends/parisc_retval.c
+===================================================================
 --- /dev/null
-+++ b/backends/parisc_retval.c
++++ elfutils-0.175/backends/parisc_retval.c
 @@ -0,0 +1,213 @@
 +/* Function return value location for Linux/PA-RISC ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -671,12 +594,11 @@ index 0000000..df7ec3a
 +  return parisc_return_value_location_ (functypedie, locp, 1);
 +}
 +
-diff --git a/backends/parisc_symbol.c b/backends/parisc_symbol.c
-new file mode 100644
-index 0000000..d111a76
+Index: elfutils-0.175/backends/parisc_symbol.c
+===================================================================
 --- /dev/null
-+++ b/backends/parisc_symbol.c
-@@ -0,0 +1,112 @@
++++ elfutils-0.175/backends/parisc_symbol.c
+@@ -0,0 +1,113 @@
 +/* PA-RISC specific symbolic name handling.
 +   Copyright (C) 2002, 2005 Red Hat, Inc.
 +   This file is part of Red Hat elfutils.
@@ -775,7 +697,8 @@ index 0000000..d111a76
 +
 +/* Check for the simple reloc types.  */
 +Elf_Type
-+parisc_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
++parisc_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type,
++                          int *addsub __attribute__ ((unused)))
 +{
 +  switch (type)
 +    {
@@ -789,11 +712,55 @@ index 0000000..d111a76
 +      return ELF_T_NUM;
 +    }
 +}
-diff --git a/libelf/elf.h b/libelf/elf.h
-index f774898..6c9f61e 100644
---- a/libelf/elf.h
-+++ b/libelf/elf.h
-@@ -2153,16 +2153,24 @@ enum
+Index: elfutils-0.175/backends/libebl_parisc.h
+===================================================================
+--- /dev/null
++++ elfutils-0.175/backends/libebl_parisc.h
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_HPPA_H
++#define _LIBEBL_HPPA_H 1
++
++#include <libdw.h>
++
++extern int parisc_return_value_location_32(Dwarf_Die *, const Dwarf_Op **locp);
++extern int parisc_return_value_location_64(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
+Index: elfutils-0.175/backends/Makefile.am
+===================================================================
+--- elfutils-0.175.orig/backends/Makefile.am
++++ elfutils-0.175/backends/Makefile.am
+@@ -33,12 +33,13 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
+ 
+ 
+ modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
+-	  tilegx m68k bpf riscv
++	  tilegx m68k bpf riscv parisc
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
+ 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
+ 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
+-	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a
++	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a \
++	     libebl_parisc_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -136,6 +137,9 @@ riscv_SRCS = riscv_init.c riscv_symbol.c
+ libebl_riscv_pic_a_SOURCES = $(riscv_SRCS)
+ am_libebl_riscv_pic_a_OBJECTS = $(riscv_SRCS:.c=.os)
+ 
++parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
++libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
++am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
+ 	@rm -f $(@:.so=.map)
+Index: elfutils-0.175/libelf/elf.h
+===================================================================
+--- elfutils-0.175.orig/libelf/elf.h
++++ elfutils-0.175/libelf/elf.h
+@@ -2155,16 +2155,24 @@ enum
  #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
  #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
  #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
@@ -818,7 +785,7 @@ index f774898..6c9f61e 100644
  #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
  #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
  #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-@@ -2171,6 +2179,7 @@ enum
+@@ -2173,6 +2181,7 @@ enum
  #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
  #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
  #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
@@ -826,7 +793,7 @@ index f774898..6c9f61e 100644
  #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
  #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
  #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-@@ -2196,6 +2205,8 @@ enum
+@@ -2198,6 +2207,8 @@ enum
  #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
  #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
  #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
@@ -835,6 +802,3 @@ index f774898..6c9f61e 100644
  #define R_PARISC_SEGREL64	112	/* 64 bits segment rel. address.  */
  #define R_PARISC_PLTOFF14WR	115	/* PLT-rel. address, right 14 bits.  */
  #define R_PARISC_PLTOFF14DR	116	/* PLT-rel. address, right 14 bits.  */
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch b/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
new file mode 100644
index 0000000..8fa35a4
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/hurd_path.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending [from debian]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Index: elfutils-0.165/tests/run-native-test.sh
+===================================================================
+--- elfutils-0.165.orig/tests/run-native-test.sh
++++ elfutils-0.165/tests/run-native-test.sh
+@@ -83,6 +83,9 @@ native_test()
+ # "cannot attach to process: Function not implemented".
+ [ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
+ 
++# hurd's /proc/$PID/maps does not give paths yet.
++[ "$(uname)" = "GNU" ] && exit 77
++
+ native_test ${abs_builddir}/allregs
+ native_test ${abs_builddir}/funcretval
+ 
diff --git a/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
new file mode 100644
index 0000000..fe5159f
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/debian/kfreebsd_path.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Pending [from debian]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Index: b/tests/run-native-test.sh
+===================================================================
+--- a/tests/run-native-test.sh
++++ b/tests/run-native-test.sh
+@@ -77,6 +77,12 @@ native_test()
+   test $native -eq 0 || testrun "$@" -p $native > /dev/null
+ }
+ 
++# On the Debian buildds, GNU/kFreeBSD linprocfs /proc/$PID/maps does
++# not give absolute paths due to sbuild's bind mounts (bug #570805)
++# therefore the next two test programs are expected to fail with
++# "cannot attach to process: Function not implemented".
++[ "$(uname)" = "GNU/kFreeBSD" ] && exit 77
++
+ native_test ${abs_builddir}/allregs
+ native_test ${abs_builddir}/funcretval
+ 
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch b/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
similarity index 91%
rename from meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch
rename to meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
index d04da72..998fa04 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-mips_backend.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/mips_backend.diff
@@ -1,65 +1,9 @@
-From 59ffb86bda845a68d3686afa7bc784131df678f7 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 29 Jun 2018 15:45:58 +0800
-Subject: [PATCH] mips_backend
-
 Upstream-Status: Pending [from debian]
-mips_backend.diff and rebase to 0.172
-
-http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
-
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- backends/Makefile.am    |   8 +-
- backends/mips_init.c    |  59 +++++++++
- backends/mips_regs.c    | 104 ++++++++++++++++
- backends/mips_reloc.def |  79 ++++++++++++
- backends/mips_retval.c  | 321 ++++++++++++++++++++++++++++++++++++++++++++++++
- backends/mips_symbol.c  |  52 ++++++++
- libebl/eblopenbackend.c |   2 +
- 7 files changed, 623 insertions(+), 2 deletions(-)
- create mode 100644 backends/mips_init.c
- create mode 100644 backends/mips_regs.c
- create mode 100644 backends/mips_reloc.def
- create mode 100644 backends/mips_retval.c
- create mode 100644 backends/mips_symbol.c
-
-diff --git a/backends/Makefile.am b/backends/Makefile.am
-index 1e4b8e9..e7bccf8 100644
---- a/backends/Makefile.am
-+++ b/backends/Makefile.am
-@@ -33,13 +33,13 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
- 
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx m68k bpf riscv parisc
-+	  tilegx m68k bpf riscv parisc mips
- libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
- 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
- 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
- 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
- 	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a \
--	     libebl_parisc_pic.a
-+	     libebl_parisc_pic.a libebl_mips_pic.a
- noinst_LIBRARIES = $(libebl_pic)
- noinst_DATA = $(libebl_pic:_pic.a=.so)
- 
-@@ -139,6 +139,10 @@ parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
- libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
- am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
- 
-+mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
-+libebl_mips_pic_a_SOURCES = $(mips_SRCS)
-+am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
-+
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
- 	@rm -f $(@:.so=.map)
- 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
-diff --git a/backends/mips_init.c b/backends/mips_init.c
-new file mode 100644
-index 0000000..975c04e
+Index: elfutils-0.175/backends/mips_init.c
+===================================================================
 --- /dev/null
-+++ b/backends/mips_init.c
++++ elfutils-0.175/backends/mips_init.c
 @@ -0,0 +1,59 @@
 +/* Initialization of mips specific backend library.
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -120,11 +64,10 @@ index 0000000..975c04e
 +
 +  return MODVERSION;
 +}
-diff --git a/backends/mips_regs.c b/backends/mips_regs.c
-new file mode 100644
-index 0000000..44f86cb
+Index: elfutils-0.175/backends/mips_regs.c
+===================================================================
 --- /dev/null
-+++ b/backends/mips_regs.c
++++ elfutils-0.175/backends/mips_regs.c
 @@ -0,0 +1,104 @@
 +/* Register names and numbers for MIPS DWARF.
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -230,11 +173,10 @@ index 0000000..44f86cb
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-diff --git a/backends/mips_reloc.def b/backends/mips_reloc.def
-new file mode 100644
-index 0000000..4579970
+Index: elfutils-0.175/backends/mips_reloc.def
+===================================================================
 --- /dev/null
-+++ b/backends/mips_reloc.def
++++ elfutils-0.175/backends/mips_reloc.def
 @@ -0,0 +1,79 @@
 +/* List the relocation types for mips.  -*- C -*-
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -315,11 +257,10 @@ index 0000000..4579970
 +
 +#define NO_COPY_RELOC 1
 +#define NO_RELATIVE_RELOC 1
-diff --git a/backends/mips_retval.c b/backends/mips_retval.c
-new file mode 100644
-index 0000000..656cd1f
+Index: elfutils-0.175/backends/mips_retval.c
+===================================================================
 --- /dev/null
-+++ b/backends/mips_retval.c
++++ elfutils-0.175/backends/mips_retval.c
 @@ -0,0 +1,321 @@
 +/* Function return value location for Linux/mips ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -642,12 +583,11 @@ index 0000000..656cd1f
 +     DWARF and might be valid.  */
 +  return -2;
 +}
-diff --git a/backends/mips_symbol.c b/backends/mips_symbol.c
-new file mode 100644
-index 0000000..ba465fe
+Index: elfutils-0.175/backends/mips_symbol.c
+===================================================================
 --- /dev/null
-+++ b/backends/mips_symbol.c
-@@ -0,0 +1,52 @@
++++ elfutils-0.175/backends/mips_symbol.c
+@@ -0,0 +1,53 @@
 +/* MIPS specific symbolic name handling.
 +   Copyright (C) 2002, 2003, 2005 Red Hat, Inc.
 +   This file is part of Red Hat elfutils.
@@ -686,7 +626,8 @@ index 0000000..ba465fe
 +
 +/* Check for the simple reloc types.  */
 +Elf_Type
-+mips_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
++mips_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type,
++                        int *addsub __attribute__ ((unused)))
 +{
 +  switch (type)
 +    {
@@ -700,11 +641,11 @@ index 0000000..ba465fe
 +      return ELF_T_NUM;
 +    }
 +}
-diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
-index 8b063f4..5405b0c 100644
---- a/libebl/eblopenbackend.c
-+++ b/libebl/eblopenbackend.c
-@@ -72,6 +72,8 @@ static const struct
+Index: elfutils-0.175/libebl/eblopenbackend.c
+===================================================================
+--- elfutils-0.175.orig/libebl/eblopenbackend.c
++++ elfutils-0.175/libebl/eblopenbackend.c
+@@ -71,6 +71,8 @@ static const struct
    { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
    { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
    { "s390", "ebl_s390", "s390", 4, EM_S390, 0, 0 },
@@ -713,6 +654,34 @@ index 8b063f4..5405b0c 100644
  
    { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
    { "m68k", "elf_m68k", "m68k", 4, EM_68K, ELFCLASS32, ELFDATA2MSB },
--- 
-2.7.4
-
+Index: elfutils-0.175/backends/Makefile.am
+===================================================================
+--- elfutils-0.175.orig/backends/Makefile.am
++++ elfutils-0.175/backends/Makefile.am
+@@ -33,13 +33,13 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
+ 
+ 
+ modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
+-	  tilegx m68k bpf riscv parisc
++	  tilegx m68k bpf riscv parisc mips
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
+ 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
+ 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
+ 	     libebl_m68k_pic.a libebl_bpf_pic.a libebl_riscv_pic.a \
+-	     libebl_parisc_pic.a
++	     libebl_parisc_pic.a libebl_mips_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -141,6 +141,10 @@ parisc_SRCS = parisc_init.c parisc_symbo
+ libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
+ am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
++mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
++libebl_mips_pic_a_SOURCES = $(mips_SRCS)
++am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
++
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw) $(libeu)
+ 	@rm -f $(@:.so=.map)
+ 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
diff --git a/meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch b/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
similarity index 48%
rename from meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
index f3ab3da..d26e72e 100644
--- a/meta/recipes-devtools/elfutils/files/debian/0001-mips_readelf_w.patch
+++ b/meta/recipes-devtools/elfutils/files/debian/mips_readelf_w.patch
@@ -1,30 +1,19 @@
-From a188ea1ada6b990b72b91266ae02da058dcd9523 Mon Sep 17 00:00:00 2001
 From: Kurt Roeckx <kurt@roeckx.be>
-Date: Fri, 29 Jun 2018 15:49:32 +0800
-Subject: [PATCH] Make readelf -w output debug information on mips
-
+Subject: Make readelf -w output debug information on mips
 Bug-Debian: http://bugs.debian.org/662041
 Forwarded: not-needed
 
 Upstreams wants a change where this is handled by a hook that needs
 to be filled in by the backend for the arch.
 
-Signed-off-by: Kurt Roeckx <kurt@roeckx.be>
-
 Upstream-Status: Pending [from debian]
-mips_readelf_w.patch and rebase to 0.172
-
-http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.170-0.5.debian.tar.xz
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/readelf.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/src/readelf.c b/src/readelf.c
-index f185897..0db197c 100644
---- a/src/readelf.c
-+++ b/src/readelf.c
-@@ -10979,7 +10979,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *ebl, GElf_Ehdr *ehdr)
+Index: elfutils-0.175/src/readelf.c
+===================================================================
+--- elfutils-0.175.orig/src/readelf.c
++++ elfutils-0.175/src/readelf.c
+@@ -11133,7 +11133,8 @@ print_debug (Dwfl_Module *dwflmod, Ebl *
        GElf_Shdr shdr_mem;
        GElf_Shdr *shdr = gelf_getshdr (scn, &shdr_mem);
  
@@ -34,6 +23,3 @@ index f185897..0db197c 100644
  	{
  	  static const struct
  	  {
--- 
-2.7.4
-
-- 
2.7.4


