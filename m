Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2E9771F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 07:13:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="15046735"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Jan 2017 15:13:24 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 58F7B47B1521
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 15:13:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 24 Jan 2017 15:13:20 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2017 15:13:10 +0800
Message-ID: <1485241990-67089-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: 58F7B47B1521.AD541
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] elfutils: 0.166->0.168
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
X-List-Received-Date: Tue, 24 Jan 2017 07:13:32 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

1) Upgrade elfutils from 0.166 to 0.168
2) Delete 1 patch below to make it compatible with new version
    elfcmp-fix-self-comparision.patch
3) Modify 4 patches below to make it compatible with new version
    elfutils-0.166/hppa_backend.diff -> elfutils-0.168/hppa_backend.diff
    elfutils-0.166/mips_backend.diff -> elfutils-0.168/mips_backend.diff
    elfutils-0.166/m68k_backend.diff -> elfutils-0.168/m68k_backend.diff
    elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch -> elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...de-alternatives-for-glibc-assumptions-hel.patch | 1163 --------------------
 .../elfcmp-fix-self-comparision.patch              |   41 -
 .../elfutils/elfutils-0.166/m68k_backend.diff      |  492 ---------
 ...ferences-between-mips-machine-identifiers.patch |    0
 ...de-alternatives-for-glibc-assumptions-hel.patch | 1093 ++++++++++++++++++
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
 .../0001-fix-a-stack-usage-warning.patch           |    0
 .../0001-remove-the-unneed-checking.patch          |    0
 ...-support-for-mips64-abis-in-mips_retval.c.patch |    0
 .../0003-Add-mips-n64-relocation-format-hack.patch |    0
 .../aarch64_uio.patch                              |    0
 .../arm_backend.diff                               |    0
 .../fixheadercheck.patch                           |    0
 .../hppa_backend.diff                              |  173 +--
 .../kfreebsd_path.patch                            |    0
 .../elfutils/elfutils-0.168/m68k_backend.diff      |   27 +
 .../mips_backend.diff                              |  168 +--
 .../mips_readelf_w.patch                           |    0
 .../shadow.patch                                   |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../uclibc-support.patch                           |    0
 .../{elfutils_0.166.bb => elfutils_0.168.bb}       |    7 +-
 22 files changed, 1322 insertions(+), 1842 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-Ignore-differences-between-mips-machine-identifiers.patch (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-fix-a-stack-usage-warning.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0003-Add-mips-n64-relocation-format-hack.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/aarch64_uio.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/hppa_backend.diff (88%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/kfreebsd_path.patch (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/m68k_backend.diff
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/mips_backend.diff (88%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/mips_readelf_w.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/shadow.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/uclibc-support.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.166.bb => elfutils_0.168.bb} (94%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
deleted file mode 100644
index 38b31f6..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
+++ /dev/null
@@ -1,1163 +0,0 @@
-From 4b0fe80b3951f044c1c1b14d1d7f5f0b8ab67507 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Dec 2015 06:35:34 +0000
-Subject: [PATCH] build: Provide alternatives for glibc assumptions helps
- compiling it on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- Makefile.am                      |  2 +-
- lib/color.c                      |  2 +-
- lib/crc32_file.c                 |  4 +++-
- lib/fixedsizehash.h              |  4 ++--
- lib/system.h                     | 11 +++++++++++
- lib/xmalloc.c                    |  2 +-
- libasm/asm_end.c                 |  2 +-
- libasm/asm_newscn.c              |  2 +-
- libcpu/i386_gendis.c             |  2 +-
- libcpu/i386_lex.c                |  2 +-
- libcpu/i386_parse.c              |  2 +-
- libdw/Makefile.am                |  2 +-
- libdw/libdw_alloc.c              |  3 ++-
- libdwfl/Makefile.am              |  2 ++
- libdwfl/dwfl_build_id_find_elf.c |  3 ++-
- libdwfl/dwfl_error.c             |  4 +++-
- libdwfl/dwfl_module_getdwarf.c   |  1 +
- libdwfl/find-debuginfo.c         |  2 +-
- libdwfl/libdwfl_crc32_file.c     | 10 ++++++++++
- libdwfl/linux-kernel-modules.c   |  1 +
- libebl/eblopenbackend.c          |  2 +-
- libebl/eblwstrtab.c              |  2 +-
- libelf/elf.h                     |  9 ++++++---
- libelf/libelf.h                  |  1 +
- libelf/libelfP.h                 |  1 +
- src/addr2line.c                  |  2 +-
- src/ar.c                         |  2 +-
- src/arlib.c                      |  2 +-
- src/arlib2.c                     |  2 +-
- src/elfcmp.c                     |  2 +-
- src/elflint.c                    |  2 +-
- src/findtextrel.c                |  2 +-
- src/i386_ld.c                    |  2 +-
- src/ld.c                         |  2 +-
- src/ldgeneric.c                  |  2 +-
- src/ldlex.c                      |  2 +-
- src/ldscript.c                   |  2 +-
- src/nm.c                         |  2 +-
- src/objdump.c                    |  2 +-
- src/ranlib.c                     |  2 +-
- src/readelf.c                    |  2 +-
- src/size.c                       |  2 +-
- src/stack.c                      |  2 +-
- src/strings.c                    |  2 +-
- src/strip.c                      |  2 +-
- src/unstrip.c                    |  2 +-
- tests/addrscopes.c               |  2 +-
- tests/allregs.c                  |  2 +-
- tests/backtrace-data.c           |  2 +-
- tests/backtrace-dwarf.c          |  2 +-
- tests/backtrace.c                |  2 +-
- tests/buildid.c                  |  2 +-
- tests/debugaltlink.c             |  2 +-
- tests/debuglink.c                |  2 +-
- tests/deleted.c                  |  2 +-
- tests/dwfl-addr-sect.c           |  2 +-
- tests/dwfl-bug-addr-overflow.c   |  2 +-
- tests/dwfl-bug-fd-leak.c         |  2 +-
- tests/dwfl-bug-getmodules.c      |  2 +-
- tests/dwfl-report-elf-align.c    |  2 +-
- tests/dwfllines.c                |  2 +-
- tests/dwflmodtest.c              |  2 +-
- tests/dwflsyms.c                 |  2 +-
- tests/early-offscn.c             |  2 +-
- tests/ecp.c                      |  2 +-
- tests/find-prologues.c           |  2 +-
- tests/funcretval.c               |  2 +-
- tests/funcscopes.c               |  2 +-
- tests/getsrc_die.c               |  2 +-
- tests/line2addr.c                |  2 +-
- tests/low_high_pc.c              |  2 +-
- tests/md5-sha1-test.c            |  2 +-
- tests/rdwrmmap.c                 |  2 +-
- tests/saridx.c                   |  2 +-
- tests/sectiondump.c              |  2 +-
- tests/varlocs.c                  |  2 +-
- tests/vdsosyms.c                 |  2 +-
- 77 files changed, 109 insertions(+), 73 deletions(-)
-
-Index: elfutils-0.166/Makefile.am
-===================================================================
---- elfutils-0.166.orig/Makefile.am
-+++ elfutils-0.166/Makefile.am
-@@ -28,7 +28,7 @@ pkginclude_HEADERS = version.h
- 
- # Add doc back when we have some real content.
- SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm \
--	  backends src po tests
-+	  backends po tests
- 
- EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
- 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
-Index: elfutils-0.166/lib/color.c
-===================================================================
---- elfutils-0.166.orig/lib/color.c
-+++ elfutils-0.166/lib/color.c
-@@ -32,7 +32,7 @@
- #endif
- 
- #include <argp.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdlib.h>
- #include <string.h>
-Index: elfutils-0.166/lib/crc32_file.c
-===================================================================
---- elfutils-0.166.orig/lib/crc32_file.c
-+++ elfutils-0.166/lib/crc32_file.c
-@@ -30,12 +30,14 @@
- # include <config.h>
- #endif
- 
--#include "system.h"
- #include <errno.h>
- #include <unistd.h>
-+#include <stdint.h>
- #include <sys/stat.h>
- #include <sys/mman.h>
- 
-+#include "system.h"
-+
- int
- crc32_file (int fd, uint32_t *resp)
- {
-Index: elfutils-0.166/lib/fixedsizehash.h
-===================================================================
---- elfutils-0.166.orig/lib/fixedsizehash.h
-+++ elfutils-0.166/lib/fixedsizehash.h
-@@ -30,12 +30,12 @@
- #include <errno.h>
- #include <stdlib.h>
- #include <string.h>
--#include <sys/cdefs.h>
- #include <sys/param.h>
- 
- #include <system.h>
- 
--#define CONCAT(t1,t2) __CONCAT (t1,t2)
-+#define CONCAT1(x,y) x##y
-+#define CONCAT(x,y) CONCAT1(x,y)
- 
- /* Before including this file the following macros must be defined:
- 
-Index: elfutils-0.166/lib/system.h
-===================================================================
---- elfutils-0.166.orig/lib/system.h
-+++ elfutils-0.166/lib/system.h
-@@ -49,6 +49,16 @@
- #else
- # error "Unknown byte order"
- #endif
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__							      \
-+    ({ long int __result;						      \
-+       do __result = (long int) (expression);				      \
-+       while (__result == -1L && errno == EINTR);			      \
-+       __result; }))
-+#endif
-+
-+#define error(status, errno, ...) err(status, __VA_ARGS__)
- 
- extern void *xmalloc (size_t) __attribute__ ((__malloc__));
- extern void *xcalloc (size_t, size_t) __attribute__ ((__malloc__));
-Index: elfutils-0.166/lib/xmalloc.c
-===================================================================
---- elfutils-0.166.orig/lib/xmalloc.c
-+++ elfutils-0.166/lib/xmalloc.c
-@@ -30,7 +30,7 @@
- # include <config.h>
- #endif
- 
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stddef.h>
- #include <stdlib.h>
-Index: elfutils-0.166/libasm/asm_end.c
-===================================================================
---- elfutils-0.166.orig/libasm/asm_end.c
-+++ elfutils-0.166/libasm/asm_end.c
-@@ -32,7 +32,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdio.h>
- #include <stdlib.h>
-Index: elfutils-0.166/libasm/asm_newscn.c
-===================================================================
---- elfutils-0.166.orig/libasm/asm_newscn.c
-+++ elfutils-0.166/libasm/asm_newscn.c
-@@ -32,7 +32,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdlib.h>
- #include <string.h>
-Index: elfutils-0.166/libcpu/i386_gendis.c
-===================================================================
---- elfutils-0.166.orig/libcpu/i386_gendis.c
-+++ elfutils-0.166/libcpu/i386_gendis.c
-@@ -31,7 +31,7 @@
- # include <config.h>
- #endif
- 
--#include <error.h>
-+#include <err.h>
- #include <errno.h>
- #include <stdio.h>
- #include <stdlib.h>
-Index: elfutils-0.166/libcpu/i386_lex.c
-===================================================================
---- elfutils-0.166.orig/libcpu/i386_lex.c
-+++ elfutils-0.166/libcpu/i386_lex.c
-@@ -578,7 +578,7 @@ char *i386_text;
- #endif
- 
- #include <ctype.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- 
- #include <system.h>
-Index: elfutils-0.166/libcpu/i386_parse.c
-===================================================================
---- elfutils-0.166.orig/libcpu/i386_parse.c
-+++ elfutils-0.166/libcpu/i386_parse.c
-@@ -107,7 +107,7 @@
- #include <assert.h>
- #include <ctype.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <inttypes.h>
- #include <libintl.h>
- #include <math.h>
-Index: elfutils-0.166/libdw/Makefile.am
-===================================================================
---- elfutils-0.166.orig/libdw/Makefile.am
-+++ elfutils-0.166/libdw/Makefile.am
-@@ -117,7 +117,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map l
- 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
- 		-Wl,--version-script,$<,--no-undefined \
- 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
--		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS)
-+		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS) -lfts -largp
- 	@$(textrel_check)
- 	$(AM_V_at)ln -fs $@ $@.$(VERSION)
- 
-Index: elfutils-0.166/libdw/libdw_alloc.c
-===================================================================
---- elfutils-0.166.orig/libdw/libdw_alloc.c
-+++ elfutils-0.166/libdw/libdw_alloc.c
-@@ -31,11 +31,12 @@
- # include <config.h>
- #endif
- 
--#include <error.h>
-+#include <err.h>
- #include <errno.h>
- #include <stdlib.h>
- #include <sys/param.h>
- #include "libdwP.h"
-+#include "system.h"
- 
- 
- void *
-Index: elfutils-0.166/libdwfl/Makefile.am
-===================================================================
---- elfutils-0.166.orig/libdwfl/Makefile.am
-+++ elfutils-0.166/libdwfl/Makefile.am
-@@ -84,6 +84,8 @@ libelf = ../libelf/libelf.so
- libebl = ../libebl/libebl.a
- libeu = ../lib/libeu.a
- 
-+LDADD = -lfts
-+
- libdwfl_pic_a_SOURCES =
- am_libdwfl_pic_a_OBJECTS = $(libdwfl_a_SOURCES:.c=.os)
- 
-Index: elfutils-0.166/libdwfl/dwfl_build_id_find_elf.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/dwfl_build_id_find_elf.c
-+++ elfutils-0.166/libdwfl/dwfl_build_id_find_elf.c
-@@ -27,6 +27,7 @@
-    not, see <http://www.gnu.org/licenses/>.  */
- 
- #include "libdwflP.h"
-+#include "system.h"
- #include <inttypes.h>
- #include <fcntl.h>
- #include <unistd.h>
-@@ -94,7 +95,7 @@ __libdwfl_open_by_build_id (Dwfl_Module
- 	{
- 	  if (*file_name != NULL)
- 	    free (*file_name);
--	  *file_name = canonicalize_file_name (name);
-+	  *file_name = realpath (name, NULL);
- 	  if (*file_name == NULL)
- 	    {
- 	      *file_name = name;
-Index: elfutils-0.166/libdwfl/dwfl_error.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/dwfl_error.c
-+++ elfutils-0.166/libdwfl/dwfl_error.c
-@@ -140,6 +140,7 @@ __libdwfl_seterrno (Dwfl_Error error)
- const char *
- dwfl_errmsg (int error)
- {
-+  static __thread char s[64] = "";
-   if (error == 0 || error == -1)
-     {
-       int last_error = global_error;
-@@ -154,7 +155,8 @@ dwfl_errmsg (int error)
-   switch (error &~ 0xffff)
-     {
-     case OTHER_ERROR (ERRNO):
--      return strerror_r (error & 0xffff, "bad", 0);
-+      strerror_r (error & 0xffff, s, sizeof(s));
-+      return s;
-     case OTHER_ERROR (LIBELF):
-       return elf_errmsg (error & 0xffff);
-     case OTHER_ERROR (LIBDW):
-Index: elfutils-0.166/libdwfl/dwfl_module_getdwarf.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/dwfl_module_getdwarf.c
-+++ elfutils-0.166/libdwfl/dwfl_module_getdwarf.c
-@@ -31,6 +31,7 @@
- #include <fcntl.h>
- #include <string.h>
- #include <unistd.h>
-+#include "system.h"
- #include "../libdw/libdwP.h"	/* DWARF_E_* values are here.  */
- #include "../libelf/libelfP.h"
- 
-Index: elfutils-0.166/libdwfl/find-debuginfo.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/find-debuginfo.c
-+++ elfutils-0.166/libdwfl/find-debuginfo.c
-@@ -385,7 +385,7 @@ dwfl_standard_find_debuginfo (Dwfl_Modul
-       /* If FILE_NAME is a symlink, the debug file might be associated
- 	 with the symlink target name instead.  */
- 
--      char *canon = canonicalize_file_name (file_name);
-+      char *canon = realpath (file_name, NULL);
-       if (canon != NULL && strcmp (file_name, canon))
- 	fd = find_debuginfo_in_path (mod, canon,
- 				     debuglink_file, debuglink_crc,
-Index: elfutils-0.166/libdwfl/libdwfl_crc32_file.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/libdwfl_crc32_file.c
-+++ elfutils-0.166/libdwfl/libdwfl_crc32_file.c
-@@ -31,6 +31,16 @@
- 
- #define crc32_file attribute_hidden __libdwfl_crc32_file
- #define crc32 __libdwfl_crc32
-+
-+#ifndef TEMP_FAILURE_RETRY
-+#define TEMP_FAILURE_RETRY(expression) \
-+  (__extension__							      \
-+    ({ long int __result;						      \
-+       do __result = (long int) (expression);				      \
-+       while (__result == -1L && errno == EINTR);			      \
-+       __result; }))
-+#endif
-+
- #define LIB_SYSTEM_H	1
- #include <libdwflP.h>
- #include "../lib/crc32_file.c"
-Index: elfutils-0.166/libdwfl/linux-kernel-modules.c
-===================================================================
---- elfutils-0.166.orig/libdwfl/linux-kernel-modules.c
-+++ elfutils-0.166/libdwfl/linux-kernel-modules.c
-@@ -34,6 +34,7 @@
- #include <config.h>
- 
- #include "libdwflP.h"
-+#include "system.h"
- #include <inttypes.h>
- #include <errno.h>
- #include <stdio.h>
-Index: elfutils-0.166/libebl/eblopenbackend.c
-===================================================================
---- elfutils-0.166.orig/libebl/eblopenbackend.c
-+++ elfutils-0.166/libebl/eblopenbackend.c
-@@ -32,7 +32,7 @@
- 
- #include <assert.h>
- #include <dlfcn.h>
--#include <error.h>
-+#include <err.h>
- #include <libelfP.h>
- #include <dwarf.h>
- #include <stdlib.h>
-Index: elfutils-0.166/libebl/eblwstrtab.c
-===================================================================
---- elfutils-0.166.orig/libebl/eblwstrtab.c
-+++ elfutils-0.166/libebl/eblwstrtab.c
-@@ -305,7 +305,7 @@ copystrings (struct Ebl_WStrent *nodep,
- 
-   /* Process the current node.  */
-   nodep->offset = *offsetp;
--  *freep = wmempcpy (*freep, nodep->string, nodep->len);
-+  *freep = wmemcpy (*freep, nodep->string, nodep->len) + nodep->len;
-   *offsetp += nodep->len * sizeof (wchar_t);
- 
-   for (subs = nodep->next; subs != NULL; subs = subs->next)
-Index: elfutils-0.166/libelf/elf.h
-===================================================================
---- elfutils-0.166.orig/libelf/elf.h
-+++ elfutils-0.166/libelf/elf.h
-@@ -21,7 +21,9 @@
- 
- #include <features.h>
- 
--__BEGIN_DECLS
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /* Standard ELF types.  */
- 
-@@ -3591,7 +3593,8 @@ enum
- 
- #define R_TILEGX_NUM		130
- 
--
--__END_DECLS
-+#ifdef __cplusplus
-+}
-+#endif
- 
- #endif	/* elf.h */
-Index: elfutils-0.166/libelf/libelf.h
-===================================================================
---- elfutils-0.166.orig/libelf/libelf.h
-+++ elfutils-0.166/libelf/libelf.h
-@@ -29,6 +29,7 @@
- #ifndef _LIBELF_H
- #define _LIBELF_H 1
- 
-+#include <fcntl.h>
- #include <stdint.h>
- #include <sys/types.h>
- 
-Index: elfutils-0.166/libelf/libelfP.h
-===================================================================
---- elfutils-0.166.orig/libelf/libelfP.h
-+++ elfutils-0.166/libelf/libelfP.h
-@@ -36,6 +36,7 @@
- 
- #include <ar.h>
- #include <gelf.h>
-+#include <libelf.h>
- 
- #include <errno.h>
- #include <stdbool.h>
-Index: elfutils-0.166/src/addr2line.c
-===================================================================
---- elfutils-0.166.orig/src/addr2line.c
-+++ elfutils-0.166/src/addr2line.c
-@@ -23,7 +23,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <inttypes.h>
- #include <libdwfl.h>
-Index: elfutils-0.166/src/ar.c
-===================================================================
---- elfutils-0.166.orig/src/ar.c
-+++ elfutils-0.166/src/ar.c
-@@ -22,7 +22,7 @@
- 
- #include <argp.h>
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <libintl.h>
-Index: elfutils-0.166/src/arlib.c
-===================================================================
---- elfutils-0.166.orig/src/arlib.c
-+++ elfutils-0.166/src/arlib.c
-@@ -21,7 +21,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <gelf.h>
- #include <libintl.h>
- #include <stdio.h>
-Index: elfutils-0.166/src/arlib2.c
-===================================================================
---- elfutils-0.166.orig/src/arlib2.c
-+++ elfutils-0.166/src/arlib2.c
-@@ -20,7 +20,7 @@
- # include <config.h>
- #endif
- 
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <limits.h>
- #include <string.h>
-Index: elfutils-0.166/src/elfcmp.c
-===================================================================
---- elfutils-0.166.orig/src/elfcmp.c
-+++ elfutils-0.166/src/elfcmp.c
-@@ -23,7 +23,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <locale.h>
- #include <libintl.h>
-Index: elfutils-0.166/src/elflint.c
-===================================================================
---- elfutils-0.166.orig/src/elflint.c
-+++ elfutils-0.166/src/elflint.c
-@@ -24,7 +24,7 @@
- #include <assert.h>
- #include <byteswap.h>
- #include <endian.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-Index: elfutils-0.166/src/findtextrel.c
-===================================================================
---- elfutils-0.166.orig/src/findtextrel.c
-+++ elfutils-0.166/src/findtextrel.c
-@@ -23,7 +23,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <libdw.h>
-Index: elfutils-0.166/src/i386_ld.c
-===================================================================
---- elfutils-0.166.orig/src/i386_ld.c
-+++ elfutils-0.166/src/i386_ld.c
-@@ -20,7 +20,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdlib.h>
- #include <string.h>
-Index: elfutils-0.166/src/ld.c
-===================================================================
---- elfutils-0.166.orig/src/ld.c
-+++ elfutils-0.166/src/ld.c
-@@ -21,7 +21,7 @@
- 
- #include <argp.h>
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <libelf.h>
- #include <libintl.h>
-Index: elfutils-0.166/src/ldgeneric.c
-===================================================================
---- elfutils-0.166.orig/src/ldgeneric.c
-+++ elfutils-0.166/src/ldgeneric.c
-@@ -23,7 +23,7 @@
- #include <ctype.h>
- #include <dlfcn.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <fnmatch.h>
- #include <gelf.h>
-Index: elfutils-0.166/src/ldlex.c
-===================================================================
---- elfutils-0.166.orig/src/ldlex.c
-+++ elfutils-0.166/src/ldlex.c
-@@ -1106,7 +1106,7 @@ char *ldtext;
- #include <assert.h>
- #include <ctype.h>
- #include <elf.h>
--#include <error.h>
-+#include <err.h>
- #include <inttypes.h>
- #include <libintl.h>
- #include <stdbool.h>
-Index: elfutils-0.166/src/ldscript.c
-===================================================================
---- elfutils-0.166.orig/src/ldscript.c
-+++ elfutils-0.166/src/ldscript.c
-@@ -95,7 +95,7 @@
- #endif
- 
- #include <assert.h>
--#include <error.h>
-+#include <err.h>
- #include <libintl.h>
- #include <stdbool.h>
- #include <stdint.h>
-Index: elfutils-0.166/src/nm.c
-===================================================================
---- elfutils-0.166.orig/src/nm.c
-+++ elfutils-0.166/src/nm.c
-@@ -26,7 +26,7 @@
- #include <ctype.h>
- #include <dwarf.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-Index: elfutils-0.166/src/objdump.c
-===================================================================
---- elfutils-0.166.orig/src/objdump.c
-+++ elfutils-0.166/src/objdump.c
-@@ -21,7 +21,7 @@
- #endif
- 
- #include <argp.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <inttypes.h>
- #include <libintl.h>
-Index: elfutils-0.166/src/ranlib.c
-===================================================================
---- elfutils-0.166.orig/src/ranlib.c
-+++ elfutils-0.166/src/ranlib.c
-@@ -24,7 +24,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <libintl.h>
-Index: elfutils-0.166/src/readelf.c
-===================================================================
---- elfutils-0.166.orig/src/readelf.c
-+++ elfutils-0.166/src/readelf.c
-@@ -25,7 +25,7 @@
- #include <ctype.h>
- #include <dwarf.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-Index: elfutils-0.166/src/size.c
-===================================================================
---- elfutils-0.166.orig/src/size.c
-+++ elfutils-0.166/src/size.c
-@@ -21,7 +21,7 @@
- #endif
- 
- #include <argp.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-Index: elfutils-0.166/src/stack.c
-===================================================================
---- elfutils-0.166.orig/src/stack.c
-+++ elfutils-0.166/src/stack.c
-@@ -18,7 +18,7 @@
- #include <config.h>
- #include <assert.h>
- #include <argp.h>
--#include <error.h>
-+#include <err.h>
- #include <stdlib.h>
- #include <inttypes.h>
- #include <stdio.h>
-Index: elfutils-0.166/src/strings.c
-===================================================================
---- elfutils-0.166.orig/src/strings.c
-+++ elfutils-0.166/src/strings.c
-@@ -25,7 +25,7 @@
- #include <ctype.h>
- #include <endian.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-Index: elfutils-0.166/src/strip.c
-===================================================================
---- elfutils-0.166.orig/src/strip.c
-+++ elfutils-0.166/src/strip.c
-@@ -24,7 +24,7 @@
- #include <assert.h>
- #include <byteswap.h>
- #include <endian.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <libelf.h>
-Index: elfutils-0.166/src/unstrip.c
-===================================================================
---- elfutils-0.166.orig/src/unstrip.c
-+++ elfutils-0.166/src/unstrip.c
-@@ -31,7 +31,7 @@
- #include <argp.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <fnmatch.h>
- #include <libintl.h>
-Index: elfutils-0.166/tests/addrscopes.c
-===================================================================
---- elfutils-0.166.orig/tests/addrscopes.c
-+++ elfutils-0.166/tests/addrscopes.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- 
- 
-Index: elfutils-0.166/tests/allregs.c
-===================================================================
---- elfutils-0.166.orig/tests/allregs.c
-+++ elfutils-0.166/tests/allregs.c
-@@ -21,7 +21,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include <argp.h>
- #include <assert.h>
-Index: elfutils-0.166/tests/backtrace-data.c
-===================================================================
---- elfutils-0.166.orig/tests/backtrace-data.c
-+++ elfutils-0.166/tests/backtrace-data.c
-@@ -27,7 +27,7 @@
- #include <dirent.h>
- #include <stdlib.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <unistd.h>
- #include <dwarf.h>
- #if defined(__x86_64__) && defined(__linux__)
-Index: elfutils-0.166/tests/backtrace-dwarf.c
-===================================================================
---- elfutils-0.166.orig/tests/backtrace-dwarf.c
-+++ elfutils-0.166/tests/backtrace-dwarf.c
-@@ -22,7 +22,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <unistd.h>
- #include <sys/ptrace.h>
- #include <sys/types.h>
-Index: elfutils-0.166/tests/backtrace.c
-===================================================================
---- elfutils-0.166.orig/tests/backtrace.c
-+++ elfutils-0.166/tests/backtrace.c
-@@ -24,7 +24,7 @@
- #include <dirent.h>
- #include <stdlib.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <unistd.h>
- #include <dwarf.h>
- #ifdef __linux__
-Index: elfutils-0.166/tests/buildid.c
-===================================================================
---- elfutils-0.166.orig/tests/buildid.c
-+++ elfutils-0.166/tests/buildid.c
-@@ -23,7 +23,7 @@
- #include ELFUTILS_HEADER(elf)
- #include ELFUTILS_HEADER(dwelf)
- #include <stdio.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <stdlib.h>
- #include <sys/types.h>
-Index: elfutils-0.166/tests/debugaltlink.c
-===================================================================
---- elfutils-0.166.orig/tests/debugaltlink.c
-+++ elfutils-0.166/tests/debugaltlink.c
-@@ -23,7 +23,7 @@
- #include ELFUTILS_HEADER(dw)
- #include ELFUTILS_HEADER(dwelf)
- #include <stdio.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <stdlib.h>
- #include <sys/types.h>
-Index: elfutils-0.166/tests/debuglink.c
-===================================================================
---- elfutils-0.166.orig/tests/debuglink.c
-+++ elfutils-0.166/tests/debuglink.c
-@@ -21,7 +21,7 @@
- #include <errno.h>
- #include ELFUTILS_HEADER(dwelf)
- #include <stdio.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <stdlib.h>
- #include <sys/types.h>
-Index: elfutils-0.166/tests/deleted.c
-===================================================================
---- elfutils-0.166.orig/tests/deleted.c
-+++ elfutils-0.166/tests/deleted.c
-@@ -21,7 +21,7 @@
- #include <unistd.h>
- #include <assert.h>
- #include <stdio.h>
--#include <error.h>
-+#include <err.h>
- #include <errno.h>
- #ifdef __linux__
- #include <sys/prctl.h>
-Index: elfutils-0.166/tests/dwfl-addr-sect.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-addr-sect.c
-+++ elfutils-0.166/tests/dwfl-addr-sect.c
-@@ -23,7 +23,7 @@
- #include <stdio_ext.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include <argp.h>
- #include ELFUTILS_HEADER(dwfl)
-Index: elfutils-0.166/tests/dwfl-bug-addr-overflow.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-bug-addr-overflow.c
-+++ elfutils-0.166/tests/dwfl-bug-addr-overflow.c
-@@ -20,7 +20,7 @@
- #include <inttypes.h>
- #include <stdio.h>
- #include <stdio_ext.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include ELFUTILS_HEADER(dwfl)
- 
-Index: elfutils-0.166/tests/dwfl-bug-fd-leak.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-bug-fd-leak.c
-+++ elfutils-0.166/tests/dwfl-bug-fd-leak.c
-@@ -24,7 +24,7 @@
- #include <dirent.h>
- #include <stdlib.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <unistd.h>
- #include <dwarf.h>
- 
-Index: elfutils-0.166/tests/dwfl-bug-getmodules.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-bug-getmodules.c
-+++ elfutils-0.166/tests/dwfl-bug-getmodules.c
-@@ -18,7 +18,7 @@
- #include <config.h>
- #include ELFUTILS_HEADER(dwfl)
- 
--#include <error.h>
-+#include <err.h>
- 
- static const Dwfl_Callbacks callbacks =
-   {
-Index: elfutils-0.166/tests/dwfl-report-elf-align.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfl-report-elf-align.c
-+++ elfutils-0.166/tests/dwfl-report-elf-align.c
-@@ -20,7 +20,7 @@
- #include <inttypes.h>
- #include <stdio.h>
- #include <stdio_ext.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include <string.h>
- #include <stdlib.h>
-Index: elfutils-0.166/tests/dwfllines.c
-===================================================================
---- elfutils-0.166.orig/tests/dwfllines.c
-+++ elfutils-0.166/tests/dwfllines.c
-@@ -27,7 +27,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- 
- int
- main (int argc, char *argv[])
-Index: elfutils-0.166/tests/dwflmodtest.c
-===================================================================
---- elfutils-0.166.orig/tests/dwflmodtest.c
-+++ elfutils-0.166/tests/dwflmodtest.c
-@@ -23,7 +23,7 @@
- #include <stdio_ext.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- #include <locale.h>
- #include <argp.h>
- #include ELFUTILS_HEADER(dwfl)
-Index: elfutils-0.166/tests/dwflsyms.c
-===================================================================
---- elfutils-0.166.orig/tests/dwflsyms.c
-+++ elfutils-0.166/tests/dwflsyms.c
-@@ -25,7 +25,7 @@
- #include <stdio.h>
- #include <stdio_ext.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- 
- static const char *
-Index: elfutils-0.166/tests/early-offscn.c
-===================================================================
---- elfutils-0.166.orig/tests/early-offscn.c
-+++ elfutils-0.166/tests/early-offscn.c
-@@ -19,7 +19,7 @@
- #endif
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <stdio.h>
-Index: elfutils-0.166/tests/ecp.c
-===================================================================
---- elfutils-0.166.orig/tests/ecp.c
-+++ elfutils-0.166/tests/ecp.c
-@@ -20,7 +20,7 @@
- #endif
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <stdlib.h>
-Index: elfutils-0.166/tests/find-prologues.c
-===================================================================
---- elfutils-0.166.orig/tests/find-prologues.c
-+++ elfutils-0.166/tests/find-prologues.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <fnmatch.h>
- 
-Index: elfutils-0.166/tests/funcretval.c
-===================================================================
---- elfutils-0.166.orig/tests/funcretval.c
-+++ elfutils-0.166/tests/funcretval.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <fnmatch.h>
- 
-Index: elfutils-0.166/tests/funcscopes.c
-===================================================================
---- elfutils-0.166.orig/tests/funcscopes.c
-+++ elfutils-0.166/tests/funcscopes.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <fnmatch.h>
- 
-Index: elfutils-0.166/tests/getsrc_die.c
-===================================================================
---- elfutils-0.166.orig/tests/getsrc_die.c
-+++ elfutils-0.166/tests/getsrc_die.c
-@@ -19,7 +19,7 @@
- #endif
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <inttypes.h>
- #include <libelf.h>
-Index: elfutils-0.166/tests/line2addr.c
-===================================================================
---- elfutils-0.166.orig/tests/line2addr.c
-+++ elfutils-0.166/tests/line2addr.c
-@@ -26,7 +26,7 @@
- #include <locale.h>
- #include <stdlib.h>
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- 
- 
- static void
-Index: elfutils-0.166/tests/low_high_pc.c
-===================================================================
---- elfutils-0.166.orig/tests/low_high_pc.c
-+++ elfutils-0.166/tests/low_high_pc.c
-@@ -25,7 +25,7 @@
- #include <stdio_ext.h>
- #include <locale.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <fnmatch.h>
- 
-Index: elfutils-0.166/tests/md5-sha1-test.c
-===================================================================
---- elfutils-0.166.orig/tests/md5-sha1-test.c
-+++ elfutils-0.166/tests/md5-sha1-test.c
-@@ -19,7 +19,7 @@
- #endif
- 
- #include <string.h>
--#include <error.h>
-+#include <err.h>
- 
- #include "md5.h"
- #include "sha1.h"
-Index: elfutils-0.166/tests/rdwrmmap.c
-===================================================================
---- elfutils-0.166.orig/tests/rdwrmmap.c
-+++ elfutils-0.166/tests/rdwrmmap.c
-@@ -19,7 +19,7 @@
- #endif
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <stdio.h>
- #include <fcntl.h>
- #include <unistd.h>
-Index: elfutils-0.166/tests/saridx.c
-===================================================================
---- elfutils-0.166.orig/tests/saridx.c
-+++ elfutils-0.166/tests/saridx.c
-@@ -17,7 +17,7 @@
- 
- #include <config.h>
- 
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <stdio.h>
-Index: elfutils-0.166/tests/sectiondump.c
-===================================================================
---- elfutils-0.166.orig/tests/sectiondump.c
-+++ elfutils-0.166/tests/sectiondump.c
-@@ -18,7 +18,7 @@
- #include <config.h>
- 
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <fcntl.h>
- #include <gelf.h>
- #include <inttypes.h>
-Index: elfutils-0.166/tests/varlocs.c
-===================================================================
---- elfutils-0.166.orig/tests/varlocs.c
-+++ elfutils-0.166/tests/varlocs.c
-@@ -25,7 +25,7 @@
- #include <dwarf.h>
- #include <stdio.h>
- #include <stdlib.h>
--#include <error.h>
-+#include <err.h>
- #include <string.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-Index: elfutils-0.166/tests/vdsosyms.c
-===================================================================
---- elfutils-0.166.orig/tests/vdsosyms.c
-+++ elfutils-0.166/tests/vdsosyms.c
-@@ -18,7 +18,7 @@
- #include <config.h>
- #include <assert.h>
- #include <errno.h>
--#include <error.h>
-+#include <err.h>
- #include <inttypes.h>
- #include <stdio.h>
- #include <string.h>
-Index: elfutils-0.166/libelf/elf_getarsym.c
-===================================================================
---- elfutils-0.166.orig/libelf/elf_getarsym.c
-+++ elfutils-0.166/libelf/elf_getarsym.c
-@@ -302,7 +302,7 @@ elf_getarsym (Elf *elf, size_t *ptr)
- 		arsym[cnt].as_off = (*u32)[cnt];
- 
- 	      arsym[cnt].as_hash = _dl_elf_hash (str_data);
--	      str_data = rawmemchr (str_data, '\0') + 1;
-+	      str_data = memchr (str_data, '\0', SIZE_MAX) + 1;
- 	    }
- 
- 	  /* At the end a special entry.  */
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch b/meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
deleted file mode 100644
index 6c150bb..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 836a16fe5b5bab4a3afe2c991c104652775ce3a3 Mon Sep 17 00:00:00 2001
-From: David Abdurachmanov <davidlt@cern.ch>
-Date: Mon, 11 Apr 2016 16:00:57 +0200
-Subject: elfcmp: fix self-comparison error with GCC 6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Noticed with Fedora 24 Alpha, gcc (GCC) 6.0.0 20160406
-(Red Hat 6.0.0-0.20).
-
-elfcmp.c: In function ‘main’:
-elfcmp.c:364:199: error: self-comparison always evaluates
-to false [-Werror=tautological-compare]
-        if (unlikely (name1 == NULL || name2 == NULL
-
-Signed-off-by: David Abdurachmanov <davidlt@cern.ch>
----
-
-Upstream-Status: Backport
-
- src/ChangeLog | 4 ++++
- src/elfcmp.c  | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/elfcmp.c b/src/elfcmp.c
-index 852b92f..7b5d39c 100644
---- a/src/elfcmp.c
-+++ b/src/elfcmp.c
-@@ -368,7 +368,7 @@ main (int argc, char *argv[])
- 				&& sym1->st_shndx != SHN_UNDEF)
- 			    || sym1->st_info != sym2->st_info
- 			    || sym1->st_other != sym2->st_other
--			    || sym1->st_shndx != sym1->st_shndx))
-+			    || sym1->st_shndx != sym2->st_shndx))
- 		{
- 		  // XXX Do we want to allow reordered symbol tables?
- 		symtab_mismatch:
--- 
-cgit v0.12
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
deleted file mode 100644
index d73855b..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
+++ /dev/null
@@ -1,492 +0,0 @@
-From: Kurt Roeckx <kurt@roeckx.be>
-From: Thorsten Glaser <tg@mirbsd.de>
-Subject: m68k support
-
-Written by Kurt Roeckx, except for the retval support which was written
-by Thorsten Glaser
-
-
-Index: elfutils-0.164/backends/m68k_init.c
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_init.c
-@@ -0,0 +1,49 @@
-+/* Initialization of m68k specific backend library.
-+   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
-+
-+   This software is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   This softare is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with this software; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+*/
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#define BACKEND		m68k_
-+#define RELOC_PREFIX	R_68K_
-+#include "libebl_CPU.h"
-+
-+/* This defines the common reloc hooks based on m68k_reloc.def.  */
-+#include "common-reloc.c"
-+
-+
-+const char *
-+m68k_init (Elf *elf __attribute__ ((unused)),
-+     GElf_Half machine __attribute__ ((unused)),
-+     Ebl *eh,
-+     size_t ehlen)
-+{
-+  /* Check whether the Elf_BH object has a sufficent size.  */
-+  if (ehlen < sizeof (Ebl))
-+    return NULL;
-+
-+  /* We handle it.  */
-+  eh->name = "m68k";
-+  m68k_init_reloc (eh);
-+  HOOK (eh, reloc_simple_type);
-+  HOOK (eh, return_value_location);
-+  HOOK (eh, register_info);
-+
-+  return MODVERSION;
-+}
-Index: elfutils-0.164/backends/m68k_regs.c
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_regs.c
-@@ -0,0 +1,106 @@
-+/* Register names and numbers for m68k DWARF.
-+   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
-+
-+   This software is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   This software is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with this software; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <string.h>
-+#include <dwarf.h>
-+
-+#define BACKEND m68k_
-+#include "libebl_CPU.h"
-+
-+ssize_t
-+m68k_register_info (Ebl *ebl __attribute__ ((unused)),
-+		   int regno, char *name, size_t namelen,
-+		   const char **prefix, const char **setname,
-+		   int *bits, int *type)
-+{
-+	if (name == NULL)
-+		return 25;
-+
-+	if (regno < 0 || regno > 24 || namelen < 5)
-+		return -1;
-+
-+	*prefix = "%";
-+	*bits = 32;
-+	*type = (regno < 8 ? DW_ATE_signed
-+		: regno < 16 ? DW_ATE_address : DW_ATE_float);
-+
-+	if (regno < 8)
-+	{
-+		*setname = "integer";
-+	}
-+	else if (regno < 16)
-+	{
-+		*setname = "address";
-+	}
-+	else if (regno < 24)
-+	{
-+		*setname = "FPU";
-+	}
-+	else
-+	{
-+		*setname = "address";
-+		*type = DW_ATE_address;
-+	}
-+
-+	switch (regno)
-+	{
-+	case 0 ... 7:
-+		name[0] = 'd';
-+		name[1] = regno + '0';
-+		namelen = 2;
-+		break;
-+
-+	case 8 ... 13:
-+		name[0] = 'a';
-+		name[1] = regno - 8 + '0';
-+		namelen = 2;
-+		break;
-+
-+	case 14:
-+		name[0] = 'f';
-+		name[1] = 'p';
-+   		namelen = 2;
-+		break;
-+
-+	case 15:
-+		name[0] = 's';
-+		name[1] = 'p';
-+   		namelen = 2;
-+		break;
-+
-+	case 16 ... 23:
-+		name[0] = 'f';
-+		name[1] = 'p';
-+		name[2] = regno - 16 + '0';
-+   		namelen = 3;
-+		break;
-+
-+	case 24:
-+		name[0] = 'p';
-+		name[1] = 'c';
-+		namelen = 2;
-+	}
-+
-+	name[namelen++] = '\0';
-+	return namelen;
-+}
-+
-Index: elfutils-0.164/backends/m68k_reloc.def
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_reloc.def
-@@ -0,0 +1,45 @@
-+/* List the relocation types for m68k.  -*- C -*-
-+   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
-+
-+   This software is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   This software is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with this software; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+*/
-+
-+/* 	    NAME,		REL|EXEC|DYN	*/
-+
-+RELOC_TYPE (NONE,		0)
-+RELOC_TYPE (32,			REL|EXEC|DYN)
-+RELOC_TYPE (16,			REL)
-+RELOC_TYPE (8,			REL)
-+RELOC_TYPE (PC32,		REL|EXEC|DYN)
-+RELOC_TYPE (PC16,		REL)
-+RELOC_TYPE (PC8,		REL)
-+RELOC_TYPE (GOT32,		REL)
-+RELOC_TYPE (GOT16,		REL)
-+RELOC_TYPE (GOT8,		REL)
-+RELOC_TYPE (GOT32O,		REL)
-+RELOC_TYPE (GOT16O,		REL)
-+RELOC_TYPE (GOT8O,		REL)
-+RELOC_TYPE (PLT32,		REL)
-+RELOC_TYPE (PLT16,		REL)
-+RELOC_TYPE (PLT8,		REL)
-+RELOC_TYPE (PLT32O,		REL)
-+RELOC_TYPE (PLT16O,		REL)
-+RELOC_TYPE (PLT8O,		REL)
-+RELOC_TYPE (COPY,		EXEC)
-+RELOC_TYPE (GLOB_DAT,		EXEC|DYN)
-+RELOC_TYPE (JMP_SLOT,		EXEC|DYN)
-+RELOC_TYPE (RELATIVE,		EXEC|DYN)
-+RELOC_TYPE (GNU_VTINHERIT,	REL)
-+RELOC_TYPE (GNU_VTENTRY,	REL)
-+
-Index: elfutils-0.164/libelf/elf.h
-===================================================================
---- elfutils-0.164.orig/libelf/elf.h
-+++ elfutils-0.164/libelf/elf.h
-@@ -1158,6 +1158,9 @@ typedef struct
- #define R_68K_GLOB_DAT	20		/* Create GOT entry */
- #define R_68K_JMP_SLOT	21		/* Create PLT entry */
- #define R_68K_RELATIVE	22		/* Adjust by program base */
-+/* The next 2 are GNU extensions to enable C++ vtable garbage collection.  */
-+#define R_68K_GNU_VTINHERIT 23
-+#define R_68K_GNU_VTENTRY   24
- #define R_68K_TLS_GD32      25          /* 32 bit GOT offset for GD */
- #define R_68K_TLS_GD16      26          /* 16 bit GOT offset for GD */
- #define R_68K_TLS_GD8       27          /* 8 bit GOT offset for GD */
-Index: elfutils-0.164/backends/Makefile.am
-===================================================================
---- elfutils-0.164.orig/backends/Makefile.am
-+++ elfutils-0.164/backends/Makefile.am
-@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
- 
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx parisc mips
-+	  tilegx parisc mips m68k
- libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
- 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
- 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
- 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
--	     libebl_parisc_pic.a libebl_mips_pic.a
-+	     libebl_parisc_pic.a libebl_mips_pic.a libebl_m68k_pic.a
- noinst_LIBRARIES = $(libebl_pic)
- noinst_DATA = $(libebl_pic:_pic.a=.so)
- 
-@@ -120,6 +120,10 @@ mips_SRCS = mips_init.c mips_symbol.c mi
- libebl_mips_pic_a_SOURCES = $(mips_SRCS)
- am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
- 
-+m68k_SRCS = m68k_init.c m68k_symbol.c m68k_regs.c m68k_retval.c
-+libebl_m68k_pic_a_SOURCES = $(m68k_SRCS)
-+am_libebl_m68k_pic_a_OBJECTS = $(m68k_SRCS:.c=.os)
-+
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
- 	@rm -f $(@:.so=.map)
- 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
-Index: elfutils-0.164/backends/m68k_symbol.c
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_symbol.c
-@@ -0,0 +1,43 @@
-+/* m68k specific symbolic name handling.
-+   Copyright (C) 2007 Kurt Roeckx <kurt@roeckx.be>
-+
-+   This software is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   This software distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with this software; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+*/
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <elf.h>
-+#include <stddef.h>
-+
-+#define BACKEND		m68k_
-+#include "libebl_CPU.h"
-+
-+/* Check for the simple reloc types.  */
-+Elf_Type
-+m68k_reloc_simple_type (Ebl *ebl __attribute__ ((unused)), int type)
-+{
-+  switch (type)
-+    {
-+    case R_68K_32:
-+      return ELF_T_SWORD;
-+    case R_68K_16:
-+      return ELF_T_HALF;
-+    case R_68K_8:
-+      return ELF_T_BYTE;
-+    default:
-+      return ELF_T_NUM;
-+    }
-+}
-Index: elfutils-0.164/backends/m68k_retval.c
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/m68k_retval.c
-@@ -0,0 +1,172 @@
-+/* Function return value location for Linux/m68k ABI.
-+   Copyright (C) 2005-2010 Red Hat, Inc.
-+   Copyright (c) 2011 Thorsten Glaser, Debian.
-+   This file is part of Red Hat elfutils.
-+
-+   Red Hat elfutils is free software; you can redistribute it and/or modify
-+   it under the terms of the GNU General Public License as published by the
-+   Free Software Foundation; version 2 of the License.
-+
-+   Red Hat elfutils is distributed in the hope that it will be useful, but
-+   WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   General Public License for more details.
-+
-+   You should have received a copy of the GNU General Public License along
-+   with Red Hat elfutils; if not, write to the Free Software Foundation,
-+   Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301 USA.
-+
-+   Red Hat elfutils is an included package of the Open Invention Network.
-+   An included package of the Open Invention Network is a package for which
-+   Open Invention Network licensees cross-license their patents.  No patent
-+   license is granted, either expressly or impliedly, by designation as an
-+   included package.  Should you wish to participate in the Open Invention
-+   Network licensing program, please visit www.openinventionnetwork.com
-+   <http://www.openinventionnetwork.com>.  */
-+
-+#ifdef HAVE_CONFIG_H
-+# include <config.h>
-+#endif
-+
-+#include <assert.h>
-+#include <dwarf.h>
-+
-+#define BACKEND m68k_
-+#include "libebl_CPU.h"
-+
-+
-+/* %d0, or pair %d0, %d1, or %a0 */
-+static const Dwarf_Op loc_intreg[] =
-+  {
-+    { .atom = DW_OP_reg0 }, { .atom = DW_OP_piece, .number = 4 },
-+    { .atom = DW_OP_reg1 }, { .atom = DW_OP_piece, .number = 4 },
-+  };
-+static const Dwarf_Op loc_ptrreg[] =
-+  {
-+    { .atom = DW_OP_reg8 },
-+  };
-+#define nloc_intreg	1
-+#define nloc_intregpair	4
-+#define nloc_ptrreg	1
-+
-+/* %f0 */
-+static const Dwarf_Op loc_fpreg[] =
-+  {
-+    { .atom = DW_OP_reg16 }
-+  };
-+#define nloc_fpreg	1
-+
-+/* Structures are a bit more complicated - small structures are returned
-+   in %d0 / %d1 (-freg-struct-return which is enabled by default), large
-+   structures use %a1 (in constrast to the SYSV psABI which says %a0) as
-+   reentrant storage space indicator.  */
-+static const Dwarf_Op loc_aggregate[] =
-+  {
-+    { .atom = DW_OP_breg9, .number = 0 }
-+  };
-+#define nloc_aggregate 1
-+
-+int
-+m68k_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
-+{
-+  Dwarf_Word size;
-+
-+  /* Start with the function's type, and get the DW_AT_type attribute,
-+     which is the type of the return value.  */
-+
-+  Dwarf_Attribute attr_mem;
-+  Dwarf_Attribute *attr = dwarf_attr_integrate (functypedie, DW_AT_type,
-+						&attr_mem);
-+  if (attr == NULL)
-+    /* The function has no return value, like a `void' function in C.  */
-+    return 0;
-+
-+  Dwarf_Die die_mem;
-+  Dwarf_Die *typedie = dwarf_formref_die (attr, &die_mem);
-+  int tag = dwarf_tag (typedie);
-+
-+  /* Follow typedefs and qualifiers to get to the actual type.  */
-+  while (tag == DW_TAG_typedef
-+	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
-+	 || tag == DW_TAG_restrict_type)
-+    {
-+      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
-+      typedie = dwarf_formref_die (attr, &die_mem);
-+      tag = dwarf_tag (typedie);
-+    }
-+
-+  switch (tag)
-+    {
-+    case -1:
-+      return -1;
-+
-+    case DW_TAG_subrange_type:
-+      if (! dwarf_hasattr_integrate (typedie, DW_AT_byte_size))
-+	{
-+	  attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
-+	  typedie = dwarf_formref_die (attr, &die_mem);
-+	  tag = dwarf_tag (typedie);
-+	}
-+      /* Fall through.  */
-+
-+    case DW_TAG_base_type:
-+    case DW_TAG_enumeration_type:
-+    case DW_TAG_pointer_type:
-+    case DW_TAG_ptr_to_member_type:
-+      if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_byte_size,
-+						 &attr_mem), &size) != 0)
-+	{
-+	  if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
-+	    size = 4;
-+	  else
-+	    return -1;
-+	}
-+      if (tag == DW_TAG_pointer_type || tag == DW_TAG_ptr_to_member_type)
-+	{
-+	  *locp = loc_ptrreg;
-+          return nloc_ptrreg;
-+	}
-+      if (tag == DW_TAG_base_type)
-+	{
-+	  Dwarf_Word encoding;
-+	  if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
-+						     &attr_mem),
-+			       &encoding) != 0)
-+	    return -1;
-+	  if (encoding == DW_ATE_float)
-+	    {
-+	      /* XXX really 10? */
-+              if (size > 10)
-+                return -2;
-+              *locp = loc_fpreg;
-+              return nloc_fpreg;
-+	    }
-+	}
-+      if (size <= 8)
-+	{
-+	intreg:
-+	  /* XXX check endianness of dword pair, int64 vs aggregate */
-+	  *locp = loc_intreg;
-+	  return size <= 4 ? nloc_intreg : nloc_intregpair;
-+	}
-+
-+    aggregate:
-+      *locp = loc_aggregate;
-+      return nloc_aggregate;
-+
-+    case DW_TAG_structure_type:
-+    case DW_TAG_class_type:
-+    case DW_TAG_union_type:
-+    case DW_TAG_array_type:
-+      if (dwarf_aggregate_size (typedie, &size) == 0
-+	  && size > 0 && size <= 8)
-+	/* not accurate for a struct whose only member is a float */
-+	goto intreg;
-+      goto aggregate;
-+    }
-+
-+  /* XXX We don't have a good way to return specific errors from ebl calls.
-+     This value means we do not understand the type, but it is well-formed
-+     DWARF and might be valid.  */
-+  return -2;
-+}
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-Ignore-differences-between-mips-machine-identifiers.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-Ignore-differences-between-mips-machine-identifiers.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0001-Ignore-differences-between-mips-machine-identifiers.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0001-Ignore-differences-between-mips-machine-identifiers.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
new file mode 100644
index 0000000..9e6b782
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -0,0 +1,1093 @@
+Subject: [PATCH] build: Provide alternatives for glibc
+ assumptions helps compiling it on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+Upgrade for elfutils-0.168
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ Makefile.am                      |  2 +-
+ lib/color.c                      |  2 +-
+ lib/crc32_file.c                 |  3 +++
+ lib/fixedsizehash.h              |  4 ++--
+ lib/libeu.h                      | 12 ++++++++++++
+ lib/system.h                     | 10 ++++++++++
+ lib/xmalloc.c                    |  2 +-
+ libasm/asm_end.c                 |  2 +-
+ libasm/asm_newscn.c              |  2 +-
+ libcpu/i386_gendis.c             |  2 +-
+ libcpu/i386_lex.c                |  2 +-
+ libcpu/i386_parse.c              |  2 +-
+ libdw/Makefile.am                |  2 +-
+ libdw/libdw_alloc.c              |  2 +-
+ libdwfl/Makefile.am              |  2 ++
+ libdwfl/dwfl_build_id_find_elf.c |  3 ++-
+ libdwfl/dwfl_error.c             |  4 +++-
+ libdwfl/dwfl_module_getdwarf.c   |  1 +
+ libdwfl/find-debuginfo.c         |  2 +-
+ libdwfl/libdwfl_crc32_file.c     | 10 ++++++++++
+ libdwfl/linux-kernel-modules.c   |  1 +
+ libebl/eblopenbackend.c          |  2 +-
+ libelf/elf.h                     |  6 +++---
+ libelf/elf_getarsym.c            |  2 +-
+ libelf/libelf.h                  |  1 +
+ libelf/libelfP.h                 |  1 +
+ src/addr2line.c                  |  2 +-
+ src/ar.c                         |  2 +-
+ src/arlib.c                      |  2 +-
+ src/arlib2.c                     |  2 +-
+ src/elfcmp.c                     |  2 +-
+ src/elflint.c                    |  2 +-
+ src/findtextrel.c                |  2 +-
+ src/nm.c                         |  2 +-
+ src/objdump.c                    |  2 +-
+ src/ranlib.c                     |  2 +-
+ src/readelf.c                    |  2 +-
+ src/size.c                       |  2 +-
+ src/stack.c                      |  2 +-
+ src/strings.c                    |  2 +-
+ src/strip.c                      |  2 +-
+ src/unstrip.c                    |  2 +-
+ tests/addrscopes.c               |  2 +-
+ tests/allregs.c                  |  2 +-
+ tests/backtrace-data.c           |  2 +-
+ tests/backtrace-dwarf.c          |  2 +-
+ tests/backtrace.c                |  2 +-
+ tests/buildid.c                  |  2 +-
+ tests/debugaltlink.c             |  2 +-
+ tests/debuglink.c                |  2 +-
+ tests/deleted.c                  |  2 +-
+ tests/dwfl-addr-sect.c           |  2 +-
+ tests/dwfl-bug-addr-overflow.c   |  2 +-
+ tests/dwfl-bug-fd-leak.c         |  2 +-
+ tests/dwfl-bug-getmodules.c      |  2 +-
+ tests/dwfl-report-elf-align.c    |  2 +-
+ tests/dwfllines.c                |  2 +-
+ tests/dwflmodtest.c              |  2 +-
+ tests/dwflsyms.c                 |  2 +-
+ tests/early-offscn.c             |  2 +-
+ tests/ecp.c                      |  2 +-
+ tests/find-prologues.c           |  2 +-
+ tests/funcretval.c               |  2 +-
+ tests/funcscopes.c               |  2 +-
+ tests/getsrc_die.c               |  2 +-
+ tests/line2addr.c                |  2 +-
+ tests/low_high_pc.c              |  2 +-
+ tests/md5-sha1-test.c            |  2 +-
+ tests/rdwrmmap.c                 |  2 +-
+ tests/saridx.c                   |  2 +-
+ tests/sectiondump.c              |  2 +-
+ tests/varlocs.c                  |  2 +-
+ tests/vdsosyms.c                 |  2 +-
+ 73 files changed, 111 insertions(+), 67 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2ff444e..41f77df 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -28,7 +28,7 @@ pkginclude_HEADERS = version.h
+ 
+ # Add doc back when we have some real content.
+ SUBDIRS = config m4 lib libelf libebl libdwelf libdwfl libdw libcpu libasm \
+-	  backends src po tests
++	  backends po tests
+ 
+ EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
+ 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
+diff --git a/lib/color.c b/lib/color.c
+index fde2d9d..3ea0b4d 100644
+--- a/lib/color.c
++++ b/lib/color.c
+@@ -32,7 +32,7 @@
+ #endif
+ 
+ #include <argp.h>
+-#include <error.h>
++#include <err.h>
+ #include <libintl.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/lib/crc32_file.c b/lib/crc32_file.c
+index a8434d4..3122a72 100644
+--- a/lib/crc32_file.c
++++ b/lib/crc32_file.c
+@@ -33,9 +33,12 @@
+ #include "libeu.h"
+ #include <errno.h>
+ #include <unistd.h>
++#include <stdint.h>
+ #include <sys/stat.h>
+ #include <sys/mman.h>
+ 
++#include "system.h"
++
+ int
+ crc32_file (int fd, uint32_t *resp)
+ {
+diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
+index dac2a5f..3545f2e 100644
+--- a/lib/fixedsizehash.h
++++ b/lib/fixedsizehash.h
+@@ -30,12 +30,12 @@
+ #include <errno.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/cdefs.h>
+ 
+ #include <system.h>
+ 
+ #ifdef __CONCAT
+-#define CONCAT(t1,t2) __CONCAT (t1,t2)
++#define CONCAT1(x,y) x##y
++#define CONCAT(x,y) CONCAT1(x,y)
+ #else
+ #define STROF(t2) t2
+ #define CONCAT_EXPANDED(t1,t2) t1 ## t2
+diff --git a/lib/libeu.h b/lib/libeu.h
+index 69fe3d7..b7c040f 100644
+--- a/lib/libeu.h
++++ b/lib/libeu.h
+@@ -76,3 +76,15 @@ extern char *color_weak;
+ extern const char color_off[];
+ 
+ #endif
++
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) \
++  (__extension__                                                             \
++    ({ long int __result;                                                    \
++       do __result = (long int) (expression);                                \
++       while (__result == -1L && errno == EINTR);                            \
++       __result; }))
++#endif
++
++#define error(status, errno, ...) err(status, __VA_ARGS__)
++
+diff --git a/lib/system.h b/lib/system.h
+index ccd99d6..0e93e60 100644
+--- a/lib/system.h
++++ b/lib/system.h
+@@ -55,6 +55,16 @@
+ #else
+ # error "Unknown byte order"
+ #endif
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) \
++  (__extension__							      \
++    ({ long int __result;						      \
++       do __result = (long int) (expression);				      \
++       while (__result == -1L && errno == EINTR);			      \
++       __result; }))
++#endif
++
++#define error(status, errno, ...) err(status, __VA_ARGS__)
+ 
+ #ifndef MAX
+ #define MAX(m, n) ((m) < (n) ? (n) : (m))
+diff --git a/lib/xmalloc.c b/lib/xmalloc.c
+index 0cde384..217b054 100644
+--- a/lib/xmalloc.c
++++ b/lib/xmalloc.c
+@@ -30,7 +30,7 @@
+ # include <config.h>
+ #endif
+ 
+-#include <error.h>
++#include <err.h>
+ #include <libintl.h>
+ #include <stddef.h>
+ #include <stdlib.h>
+diff --git a/libasm/asm_end.c b/libasm/asm_end.c
+index 191a535..bf5ab06 100644
+--- a/libasm/asm_end.c
++++ b/libasm/asm_end.c
+@@ -32,7 +32,7 @@
+ #endif
+ 
+ #include <assert.h>
+-#include <error.h>
++#include <err.h>
+ #include <libintl.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/libasm/asm_newscn.c b/libasm/asm_newscn.c
+index ddbb25d..74a598d 100644
+--- a/libasm/asm_newscn.c
++++ b/libasm/asm_newscn.c
+@@ -32,7 +32,7 @@
+ #endif
+ 
+ #include <assert.h>
+-#include <error.h>
++#include <err.h>
+ #include <libintl.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/libcpu/i386_gendis.c b/libcpu/i386_gendis.c
+index aae5eae..6d76016 100644
+--- a/libcpu/i386_gendis.c
++++ b/libcpu/i386_gendis.c
+@@ -31,7 +31,7 @@
+ # include <config.h>
+ #endif
+ 
+-#include <error.h>
++#include <err.h>
+ #include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/libcpu/i386_lex.c b/libcpu/i386_lex.c
+index b670608..b842c25 100644
+--- a/libcpu/i386_lex.c
++++ b/libcpu/i386_lex.c
+@@ -592,7 +592,7 @@ char *i386_text;
+ #endif
+ 
+ #include <ctype.h>
+-#include <error.h>
++#include <err.h>
+ #include <libintl.h>
+ 
+ #include <libeu.h>
+diff --git a/libcpu/i386_parse.c b/libcpu/i386_parse.c
+index 724addf..5b67802 100644
+--- a/libcpu/i386_parse.c
++++ b/libcpu/i386_parse.c
+@@ -107,7 +107,7 @@
+ #include <assert.h>
+ #include <ctype.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <inttypes.h>
+ #include <libintl.h>
+ #include <math.h>
+diff --git a/libdw/Makefile.am b/libdw/Makefile.am
+index ad8ebd0..7ed5ad8 100644
+--- a/libdw/Makefile.am
++++ b/libdw/Makefile.am
+@@ -117,7 +117,7 @@ libdw.so$(EXEEXT): $(srcdir)/libdw.map libdw_pic.a ../libdwelf/libdwelf_pic.a \
+ 		-Wl,--enable-new-dtags,-rpath,$(pkglibdir) \
+ 		-Wl,--version-script,$<,--no-undefined \
+ 		-Wl,--whole-archive $(filter-out $<,$^) -Wl,--no-whole-archive\
+-		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS)
++		-ldl -lz $(argp_LDADD) $(zip_LIBS) $(libdw_so_LDLIBS) -lfts -largp
+ 	@$(textrel_check)
+ 	$(AM_V_at)ln -fs $@ $@.$(VERSION)
+ 
+diff --git a/libdw/libdw_alloc.c b/libdw/libdw_alloc.c
+index 28a8cf6..29aeb3f 100644
+--- a/libdw/libdw_alloc.c
++++ b/libdw/libdw_alloc.c
+@@ -31,7 +31,7 @@
+ # include <config.h>
+ #endif
+ 
+-#include <error.h>
++#include <err.h>
+ #include <errno.h>
+ #include <stdlib.h>
+ #include "libdwP.h"
+diff --git a/libdwfl/Makefile.am b/libdwfl/Makefile.am
+index 89ca92e..e159080 100644
+--- a/libdwfl/Makefile.am
++++ b/libdwfl/Makefile.am
+@@ -84,6 +84,8 @@ libelf = ../libelf/libelf.so
+ libebl = ../libebl/libebl.a
+ libeu = ../lib/libeu.a
+ 
++LDADD = -lfts
++
+ libdwfl_pic_a_SOURCES =
+ am_libdwfl_pic_a_OBJECTS = $(libdwfl_a_SOURCES:.c=.os)
+ 
+diff --git a/libdwfl/dwfl_build_id_find_elf.c b/libdwfl/dwfl_build_id_find_elf.c
+index 903e193..b00d10c 100644
+--- a/libdwfl/dwfl_build_id_find_elf.c
++++ b/libdwfl/dwfl_build_id_find_elf.c
+@@ -27,6 +27,7 @@
+    not, see <http://www.gnu.org/licenses/>.  */
+ 
+ #include "libdwflP.h"
++#include "system.h"
+ #include <inttypes.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+@@ -94,7 +95,7 @@ __libdwfl_open_by_build_id (Dwfl_Module *mod, bool debug, char **file_name,
+ 	{
+ 	  if (*file_name != NULL)
+ 	    free (*file_name);
+-	  *file_name = canonicalize_file_name (name);
++	  *file_name = realpath (name, NULL);
+ 	  if (*file_name == NULL)
+ 	    {
+ 	      *file_name = name;
+diff --git a/libdwfl/dwfl_error.c b/libdwfl/dwfl_error.c
+index 7bcf61c..c345797 100644
+--- a/libdwfl/dwfl_error.c
++++ b/libdwfl/dwfl_error.c
+@@ -140,6 +140,7 @@ __libdwfl_seterrno (Dwfl_Error error)
+ const char *
+ dwfl_errmsg (int error)
+ {
++  static __thread char s[64] = "";
+   if (error == 0 || error == -1)
+     {
+       int last_error = global_error;
+@@ -154,7 +155,8 @@ dwfl_errmsg (int error)
+   switch (error &~ 0xffff)
+     {
+     case OTHER_ERROR (ERRNO):
+-      return strerror_r (error & 0xffff, "bad", 0);
++      strerror_r (error & 0xffff, s, sizeof(s));
++      return s;
+     case OTHER_ERROR (LIBELF):
+       return elf_errmsg (error & 0xffff);
+     case OTHER_ERROR (LIBDW):
+diff --git a/libdwfl/dwfl_module_getdwarf.c b/libdwfl/dwfl_module_getdwarf.c
+index 0e8810b..82ad665 100644
+--- a/libdwfl/dwfl_module_getdwarf.c
++++ b/libdwfl/dwfl_module_getdwarf.c
+@@ -31,6 +31,7 @@
+ #include <fcntl.h>
+ #include <string.h>
+ #include <unistd.h>
++#include "system.h"
+ #include "../libdw/libdwP.h"	/* DWARF_E_* values are here.  */
+ #include "../libelf/libelfP.h"
+ 
+diff --git a/libdwfl/find-debuginfo.c b/libdwfl/find-debuginfo.c
+index 80515db..80b0148 100644
+--- a/libdwfl/find-debuginfo.c
++++ b/libdwfl/find-debuginfo.c
+@@ -385,7 +385,7 @@ dwfl_standard_find_debuginfo (Dwfl_Module *mod,
+       /* If FILE_NAME is a symlink, the debug file might be associated
+ 	 with the symlink target name instead.  */
+ 
+-      char *canon = canonicalize_file_name (file_name);
++      char *canon = realpath (file_name, NULL);
+       if (canon != NULL && strcmp (file_name, canon))
+ 	fd = find_debuginfo_in_path (mod, canon,
+ 				     debuglink_file, debuglink_crc,
+diff --git a/libdwfl/libdwfl_crc32_file.c b/libdwfl/libdwfl_crc32_file.c
+index 6b6b7d3..debc4a4 100644
+--- a/libdwfl/libdwfl_crc32_file.c
++++ b/libdwfl/libdwfl_crc32_file.c
+@@ -31,6 +31,16 @@
+ 
+ #define crc32_file attribute_hidden __libdwfl_crc32_file
+ #define crc32 __libdwfl_crc32
++
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(expression) \
++  (__extension__							      \
++    ({ long int __result;						      \
++       do __result = (long int) (expression);				      \
++       while (__result == -1L && errno == EINTR);			      \
++       __result; }))
++#endif
++
+ #define LIB_SYSTEM_H	1
+ #include <libdwflP.h>
+ #include "../lib/crc32_file.c"
+diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
+index 9cd8ea9..4dbf4c5 100644
+--- a/libdwfl/linux-kernel-modules.c
++++ b/libdwfl/linux-kernel-modules.c
+@@ -36,6 +36,7 @@
+ #include <config.h>
+ 
+ #include "libdwflP.h"
++#include "system.h"
+ #include <inttypes.h>
+ #include <errno.h>
+ #include <stdio.h>
+diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
+index 34d439a..56d2345 100644
+--- a/libebl/eblopenbackend.c
++++ b/libebl/eblopenbackend.c
+@@ -32,7 +32,7 @@
+ 
+ #include <assert.h>
+ #include <dlfcn.h>
+-#include <error.h>
++#include <err.h>
+ #include <libelfP.h>
+ #include <dwarf.h>
+ #include <stdlib.h>
+diff --git a/libelf/elf.h b/libelf/elf.h
+index 563c8b2..6e6e3f7 100644
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -21,7 +21,9 @@
+ 
+ #include <features.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* Standard ELF types.  */
+ 
+@@ -3707,6 +3709,4 @@ enum
+ #define R_BPF_NONE		0	/* No reloc */
+ #define R_BPF_MAP_FD		1	/* Map fd to pointer */
+ 
+-__END_DECLS
+-
+ #endif	/* elf.h */
+diff --git a/libelf/elf_getarsym.c b/libelf/elf_getarsym.c
+index 42ed0d1..6e7a3d5 100644
+--- a/libelf/elf_getarsym.c
++++ b/libelf/elf_getarsym.c
+@@ -303,7 +303,7 @@ elf_getarsym (Elf *elf, size_t *ptr)
+ 
+ 	      arsym[cnt].as_hash = _dl_elf_hash (str_data);
+ #if HAVE_DECL_RAWMEMCHR
+-	      str_data = rawmemchr (str_data, '\0') + 1;
++              str_data = memchr (str_data, '\0', SIZE_MAX) + 1;
+ #else
+ 	      char c;
+ 	      do {
+diff --git a/libelf/libelf.h b/libelf/libelf.h
+index c0d6389..38a68fd 100644
+--- a/libelf/libelf.h
++++ b/libelf/libelf.h
+@@ -29,6 +29,7 @@
+ #ifndef _LIBELF_H
+ #define _LIBELF_H 1
+ 
++#include <fcntl.h>
+ #include <stdint.h>
+ #include <sys/types.h>
+ 
+diff --git a/libelf/libelfP.h b/libelf/libelfP.h
+index 4459982..1296f20 100644
+--- a/libelf/libelfP.h
++++ b/libelf/libelfP.h
+@@ -36,6 +36,7 @@
+ 
+ #include <ar.h>
+ #include <gelf.h>
++#include <libelf.h>
+ 
+ #include <errno.h>
+ #include <stdbool.h>
+diff --git a/src/addr2line.c b/src/addr2line.c
+index 0222088..cd6a9a6 100644
+--- a/src/addr2line.c
++++ b/src/addr2line.c
+@@ -23,7 +23,7 @@
+ #include <argp.h>
+ #include <assert.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <inttypes.h>
+ #include <libdwfl.h>
+diff --git a/src/ar.c b/src/ar.c
+index f2f322b..6e70031 100644
+--- a/src/ar.c
++++ b/src/ar.c
+@@ -22,7 +22,7 @@
+ 
+ #include <argp.h>
+ #include <assert.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <libintl.h>
+diff --git a/src/arlib.c b/src/arlib.c
+index e0839aa..1143658 100644
+--- a/src/arlib.c
++++ b/src/arlib.c
+@@ -21,7 +21,7 @@
+ #endif
+ 
+ #include <assert.h>
+-#include <error.h>
++#include <err.h>
+ #include <gelf.h>
+ #include <inttypes.h>
+ #include <libintl.h>
+diff --git a/src/arlib2.c b/src/arlib2.c
+index 553fc57..46443d0 100644
+--- a/src/arlib2.c
++++ b/src/arlib2.c
+@@ -20,7 +20,7 @@
+ # include <config.h>
+ #endif
+ 
+-#include <error.h>
++#include <err.h>
+ #include <libintl.h>
+ #include <limits.h>
+ #include <string.h>
+diff --git a/src/elfcmp.c b/src/elfcmp.c
+index 401ab31..873d253 100644
+--- a/src/elfcmp.c
++++ b/src/elfcmp.c
+@@ -23,7 +23,7 @@
+ #include <argp.h>
+ #include <assert.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <locale.h>
+ #include <libintl.h>
+diff --git a/src/elflint.c b/src/elflint.c
+index 7d3f227..074d21c 100644
+--- a/src/elflint.c
++++ b/src/elflint.c
+@@ -24,7 +24,7 @@
+ #include <assert.h>
+ #include <byteswap.h>
+ #include <endian.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <inttypes.h>
+diff --git a/src/findtextrel.c b/src/findtextrel.c
+index dc41502..325888c 100644
+--- a/src/findtextrel.c
++++ b/src/findtextrel.c
+@@ -23,7 +23,7 @@
+ #include <argp.h>
+ #include <assert.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <libdw.h>
+diff --git a/src/nm.c b/src/nm.c
+index c54e96f..9e031d9 100644
+--- a/src/nm.c
++++ b/src/nm.c
+@@ -26,7 +26,7 @@
+ #include <ctype.h>
+ #include <dwarf.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <inttypes.h>
+diff --git a/src/objdump.c b/src/objdump.c
+index fff4b81..4b1f966 100644
+--- a/src/objdump.c
++++ b/src/objdump.c
+@@ -21,7 +21,7 @@
+ #endif
+ 
+ #include <argp.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <inttypes.h>
+ #include <libintl.h>
+diff --git a/src/ranlib.c b/src/ranlib.c
+index 41a3bcf..0c7da2c 100644
+--- a/src/ranlib.c
++++ b/src/ranlib.c
+@@ -24,7 +24,7 @@
+ #include <argp.h>
+ #include <assert.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <libintl.h>
+diff --git a/src/readelf.c b/src/readelf.c
+index d18a4b7..a6cfb35 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -25,7 +25,7 @@
+ #include <ctype.h>
+ #include <dwarf.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <inttypes.h>
+diff --git a/src/size.c b/src/size.c
+index de0d791..4639d42 100644
+--- a/src/size.c
++++ b/src/size.c
+@@ -21,7 +21,7 @@
+ #endif
+ 
+ #include <argp.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <inttypes.h>
+diff --git a/src/stack.c b/src/stack.c
+index a5a7beb..4c075bc 100644
+--- a/src/stack.c
++++ b/src/stack.c
+@@ -18,7 +18,7 @@
+ #include <config.h>
+ #include <assert.h>
+ #include <argp.h>
+-#include <error.h>
++#include <err.h>
+ #include <stdlib.h>
+ #include <inttypes.h>
+ #include <stdio.h>
+diff --git a/src/strings.c b/src/strings.c
+index 49aab8b..09d5b1c 100644
+--- a/src/strings.c
++++ b/src/strings.c
+@@ -25,7 +25,7 @@
+ #include <ctype.h>
+ #include <endian.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <inttypes.h>
+diff --git a/src/strip.c b/src/strip.c
+index a875ddf..fd76f7f 100644
+--- a/src/strip.c
++++ b/src/strip.c
+@@ -24,7 +24,7 @@
+ #include <assert.h>
+ #include <byteswap.h>
+ #include <endian.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <libelf.h>
+diff --git a/src/unstrip.c b/src/unstrip.c
+index d838ae9..0108272 100644
+--- a/src/unstrip.c
++++ b/src/unstrip.c
+@@ -31,7 +31,7 @@
+ #include <argp.h>
+ #include <assert.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <fnmatch.h>
+ #include <libintl.h>
+diff --git a/tests/addrscopes.c b/tests/addrscopes.c
+index 791569f..54f4311 100644
+--- a/tests/addrscopes.c
++++ b/tests/addrscopes.c
+@@ -25,7 +25,7 @@
+ #include <stdio_ext.h>
+ #include <locale.h>
+ #include <stdlib.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ 
+ 
+diff --git a/tests/allregs.c b/tests/allregs.c
+index 286f7e3..c9de089 100644
+--- a/tests/allregs.c
++++ b/tests/allregs.c
+@@ -21,7 +21,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <error.h>
++#include <err.h>
+ #include <locale.h>
+ #include <argp.h>
+ #include <assert.h>
+diff --git a/tests/backtrace-data.c b/tests/backtrace-data.c
+index b7158da..354fa6a 100644
+--- a/tests/backtrace-data.c
++++ b/tests/backtrace-data.c
+@@ -27,7 +27,7 @@
+ #include <dirent.h>
+ #include <stdlib.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <unistd.h>
+ #include <dwarf.h>
+ #if defined(__x86_64__) && defined(__linux__)
+diff --git a/tests/backtrace-dwarf.c b/tests/backtrace-dwarf.c
+index a644c8a..b8cbe27 100644
+--- a/tests/backtrace-dwarf.c
++++ b/tests/backtrace-dwarf.c
+@@ -22,7 +22,7 @@
+ #include <stdio_ext.h>
+ #include <locale.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <unistd.h>
+ #include <sys/ptrace.h>
+ #include <sys/types.h>
+diff --git a/tests/backtrace.c b/tests/backtrace.c
+index 1ff6353..47e3f7b 100644
+--- a/tests/backtrace.c
++++ b/tests/backtrace.c
+@@ -24,7 +24,7 @@
+ #include <dirent.h>
+ #include <stdlib.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <unistd.h>
+ #include <dwarf.h>
+ #ifdef __linux__
+diff --git a/tests/buildid.c b/tests/buildid.c
+index 87c1877..2953e6b 100644
+--- a/tests/buildid.c
++++ b/tests/buildid.c
+@@ -23,7 +23,7 @@
+ #include ELFUTILS_HEADER(elf)
+ #include ELFUTILS_HEADER(dwelf)
+ #include <stdio.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ #include <stdlib.h>
+ #include <sys/types.h>
+diff --git a/tests/debugaltlink.c b/tests/debugaltlink.c
+index 6d97d50..ee7e559 100644
+--- a/tests/debugaltlink.c
++++ b/tests/debugaltlink.c
+@@ -23,7 +23,7 @@
+ #include ELFUTILS_HEADER(dw)
+ #include ELFUTILS_HEADER(dwelf)
+ #include <stdio.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ #include <stdlib.h>
+ #include <sys/types.h>
+diff --git a/tests/debuglink.c b/tests/debuglink.c
+index 935d102..741cb81 100644
+--- a/tests/debuglink.c
++++ b/tests/debuglink.c
+@@ -21,7 +21,7 @@
+ #include <errno.h>
+ #include ELFUTILS_HEADER(dwelf)
+ #include <stdio.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ #include <stdlib.h>
+ #include <sys/types.h>
+diff --git a/tests/deleted.c b/tests/deleted.c
+index 6be35bc..0190711 100644
+--- a/tests/deleted.c
++++ b/tests/deleted.c
+@@ -21,7 +21,7 @@
+ #include <unistd.h>
+ #include <assert.h>
+ #include <stdio.h>
+-#include <error.h>
++#include <err.h>
+ #include <errno.h>
+ #ifdef __linux__
+ #include <sys/prctl.h>
+diff --git a/tests/dwfl-addr-sect.c b/tests/dwfl-addr-sect.c
+index 21e470a..1ea1e3b 100644
+--- a/tests/dwfl-addr-sect.c
++++ b/tests/dwfl-addr-sect.c
+@@ -23,7 +23,7 @@
+ #include <stdio_ext.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <error.h>
++#include <err.h>
+ #include <locale.h>
+ #include <argp.h>
+ #include ELFUTILS_HEADER(dwfl)
+diff --git a/tests/dwfl-bug-addr-overflow.c b/tests/dwfl-bug-addr-overflow.c
+index aa8030e..02c8bef 100644
+--- a/tests/dwfl-bug-addr-overflow.c
++++ b/tests/dwfl-bug-addr-overflow.c
+@@ -20,7 +20,7 @@
+ #include <inttypes.h>
+ #include <stdio.h>
+ #include <stdio_ext.h>
+-#include <error.h>
++#include <err.h>
+ #include <locale.h>
+ #include ELFUTILS_HEADER(dwfl)
+ 
+diff --git a/tests/dwfl-bug-fd-leak.c b/tests/dwfl-bug-fd-leak.c
+index 689cdd7..5973da3 100644
+--- a/tests/dwfl-bug-fd-leak.c
++++ b/tests/dwfl-bug-fd-leak.c
+@@ -24,7 +24,7 @@
+ #include <dirent.h>
+ #include <stdlib.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <unistd.h>
+ #include <dwarf.h>
+ 
+diff --git a/tests/dwfl-bug-getmodules.c b/tests/dwfl-bug-getmodules.c
+index 1ee989f..fd62e65 100644
+--- a/tests/dwfl-bug-getmodules.c
++++ b/tests/dwfl-bug-getmodules.c
+@@ -18,7 +18,7 @@
+ #include <config.h>
+ #include ELFUTILS_HEADER(dwfl)
+ 
+-#include <error.h>
++#include <err.h>
+ 
+ static const Dwfl_Callbacks callbacks =
+   {
+diff --git a/tests/dwfl-report-elf-align.c b/tests/dwfl-report-elf-align.c
+index a4e97d3..f471587 100644
+--- a/tests/dwfl-report-elf-align.c
++++ b/tests/dwfl-report-elf-align.c
+@@ -20,7 +20,7 @@
+ #include <inttypes.h>
+ #include <stdio.h>
+ #include <stdio_ext.h>
+-#include <error.h>
++#include <err.h>
+ #include <locale.h>
+ #include <string.h>
+ #include <stdlib.h>
+diff --git a/tests/dwfllines.c b/tests/dwfllines.c
+index 90379dd..cbdf6c4 100644
+--- a/tests/dwfllines.c
++++ b/tests/dwfllines.c
+@@ -27,7 +27,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <error.h>
++#include <err.h>
+ 
+ int
+ main (int argc, char *argv[])
+diff --git a/tests/dwflmodtest.c b/tests/dwflmodtest.c
+index 0027f96..e68d3bc 100644
+--- a/tests/dwflmodtest.c
++++ b/tests/dwflmodtest.c
+@@ -23,7 +23,7 @@
+ #include <stdio_ext.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <error.h>
++#include <err.h>
+ #include <locale.h>
+ #include <argp.h>
+ #include ELFUTILS_HEADER(dwfl)
+diff --git a/tests/dwflsyms.c b/tests/dwflsyms.c
+index 49ac334..cf07830 100644
+--- a/tests/dwflsyms.c
++++ b/tests/dwflsyms.c
+@@ -25,7 +25,7 @@
+ #include <stdio.h>
+ #include <stdio_ext.h>
+ #include <stdlib.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ 
+ static const char *
+diff --git a/tests/early-offscn.c b/tests/early-offscn.c
+index 924cb9e..6f60d5a 100644
+--- a/tests/early-offscn.c
++++ b/tests/early-offscn.c
+@@ -19,7 +19,7 @@
+ #endif
+ 
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <stdio.h>
+diff --git a/tests/ecp.c b/tests/ecp.c
+index 38a6859..743cea5 100644
+--- a/tests/ecp.c
++++ b/tests/ecp.c
+@@ -20,7 +20,7 @@
+ #endif
+ 
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <stdlib.h>
+diff --git a/tests/find-prologues.c b/tests/find-prologues.c
+index ba8ae37..76f5f04 100644
+--- a/tests/find-prologues.c
++++ b/tests/find-prologues.c
+@@ -25,7 +25,7 @@
+ #include <stdio_ext.h>
+ #include <locale.h>
+ #include <stdlib.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ #include <fnmatch.h>
+ 
+diff --git a/tests/funcretval.c b/tests/funcretval.c
+index 8d19d11..c8aaa93 100644
+--- a/tests/funcretval.c
++++ b/tests/funcretval.c
+@@ -25,7 +25,7 @@
+ #include <stdio_ext.h>
+ #include <locale.h>
+ #include <stdlib.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ #include <fnmatch.h>
+ 
+diff --git a/tests/funcscopes.c b/tests/funcscopes.c
+index 9c90185..dbccb89 100644
+--- a/tests/funcscopes.c
++++ b/tests/funcscopes.c
+@@ -25,7 +25,7 @@
+ #include <stdio_ext.h>
+ #include <locale.h>
+ #include <stdlib.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ #include <fnmatch.h>
+ 
+diff --git a/tests/getsrc_die.c b/tests/getsrc_die.c
+index 055aede..9c394dd 100644
+--- a/tests/getsrc_die.c
++++ b/tests/getsrc_die.c
+@@ -19,7 +19,7 @@
+ #endif
+ 
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <inttypes.h>
+ #include <libelf.h>
+diff --git a/tests/line2addr.c b/tests/line2addr.c
+index e0d65d3..9bf0023 100644
+--- a/tests/line2addr.c
++++ b/tests/line2addr.c
+@@ -26,7 +26,7 @@
+ #include <locale.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <error.h>
++#include <err.h>
+ 
+ 
+ static void
+diff --git a/tests/low_high_pc.c b/tests/low_high_pc.c
+index d0f4302..8da4fbd 100644
+--- a/tests/low_high_pc.c
++++ b/tests/low_high_pc.c
+@@ -25,7 +25,7 @@
+ #include <stdio_ext.h>
+ #include <locale.h>
+ #include <stdlib.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ #include <fnmatch.h>
+ 
+diff --git a/tests/md5-sha1-test.c b/tests/md5-sha1-test.c
+index d50355e..3c41f40 100644
+--- a/tests/md5-sha1-test.c
++++ b/tests/md5-sha1-test.c
+@@ -19,7 +19,7 @@
+ #endif
+ 
+ #include <string.h>
+-#include <error.h>
++#include <err.h>
+ 
+ #include "md5.h"
+ #include "sha1.h"
+diff --git a/tests/rdwrmmap.c b/tests/rdwrmmap.c
+index 6f027df..1ce5e6e 100644
+--- a/tests/rdwrmmap.c
++++ b/tests/rdwrmmap.c
+@@ -19,7 +19,7 @@
+ #endif
+ 
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <stdio.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+diff --git a/tests/saridx.c b/tests/saridx.c
+index 8a450d8..b387801 100644
+--- a/tests/saridx.c
++++ b/tests/saridx.c
+@@ -17,7 +17,7 @@
+ 
+ #include <config.h>
+ 
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <stdio.h>
+diff --git a/tests/sectiondump.c b/tests/sectiondump.c
+index 3033fed..8e888db 100644
+--- a/tests/sectiondump.c
++++ b/tests/sectiondump.c
+@@ -18,7 +18,7 @@
+ #include <config.h>
+ 
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <fcntl.h>
+ #include <gelf.h>
+ #include <inttypes.h>
+diff --git a/tests/varlocs.c b/tests/varlocs.c
+index c3fba89..e043ea2 100644
+--- a/tests/varlocs.c
++++ b/tests/varlocs.c
+@@ -25,7 +25,7 @@
+ #include <dwarf.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <error.h>
++#include <err.h>
+ #include <string.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+diff --git a/tests/vdsosyms.c b/tests/vdsosyms.c
+index b876c10..afb2823 100644
+--- a/tests/vdsosyms.c
++++ b/tests/vdsosyms.c
+@@ -18,7 +18,7 @@
+ #include <config.h>
+ #include <assert.h>
+ #include <errno.h>
+-#include <error.h>
++#include <err.h>
+ #include <inttypes.h>
+ #include <stdio.h>
+ #include <string.h>
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-fix-a-stack-usage-warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-fix-a-stack-usage-warning.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0001-fix-a-stack-usage-warning.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0001-fix-a-stack-usage-warning.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0001-remove-the-unneed-checking.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0001-remove-the-unneed-checking.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0001-remove-the-unneed-checking.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0001-remove-the-unneed-checking.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/0003-Add-mips-n64-relocation-format-hack.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/0003-Add-mips-n64-relocation-format-hack.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/0003-Add-mips-n64-relocation-format-hack.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/0003-Add-mips-n64-relocation-format-hack.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/aarch64_uio.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/aarch64_uio.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/aarch64_uio.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/arm_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.168/arm_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/fixheadercheck.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/fixheadercheck.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/hppa_backend.diff
similarity index 88%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.168/hppa_backend.diff
index 4545671..125c5f1 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/hppa_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/hppa_backend.diff
@@ -1,7 +1,86 @@
-Index: elfutils-0.164/backends/parisc_init.c
-===================================================================
+From b646696544141fe278aac656cdb031a9b62d6560 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Thu, 22 Dec 2016 01:43:15 +0900
+Subject: [PATCH] hppa_backend
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ backends/Makefile.am      |  11 ++-
+ backends/libebl_parisc.h  |   9 ++
+ backends/parisc_init.c    |  73 ++++++++++++++++
+ backends/parisc_regs.c    | 159 ++++++++++++++++++++++++++++++++++
+ backends/parisc_reloc.def | 128 ++++++++++++++++++++++++++++
+ backends/parisc_retval.c  | 213 ++++++++++++++++++++++++++++++++++++++++++++++
+ backends/parisc_symbol.c  | 112 ++++++++++++++++++++++++
+ libelf/elf.h              |  11 +++
+ 8 files changed, 714 insertions(+), 2 deletions(-)
+ create mode 100644 backends/libebl_parisc.h
+ create mode 100644 backends/parisc_init.c
+ create mode 100644 backends/parisc_regs.c
+ create mode 100644 backends/parisc_reloc.def
+ create mode 100644 backends/parisc_retval.c
+ create mode 100644 backends/parisc_symbol.c
+
+diff --git a/backends/Makefile.am b/backends/Makefile.am
+index b553ec3..71940a5 100644
+--- a/backends/Makefile.am
++++ b/backends/Makefile.am
+@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
+ 
+ 
+ modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
+-	  tilegx m68k bpf
++	  tilegx parisc m68k bpf
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
+ 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
+ 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
+-	     libebl_m68k_pic.a libebl_bpf_pic.a
++	     libebl_parisc_pic.a libebl_m68k_pic.a libebl_bpf_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -113,6 +113,10 @@ tilegx_SRCS = tilegx_init.c tilegx_symbol.c tilegx_regs.c \
+ libebl_tilegx_pic_a_SOURCES = $(tilegx_SRCS)
+ am_libebl_tilegx_pic_a_OBJECTS = $(tilegx_SRCS:.c=.os)
+ 
++parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
++libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
++am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
++
+ m68k_SRCS = m68k_init.c m68k_symbol.c m68k_regs.c \
+ 	    m68k_retval.c m68k_corenote.c
+ libebl_m68k_pic_a_SOURCES = $(m68k_SRCS)
+@@ -128,6 +132,9 @@ endif
+ libebl_bpf_pic_a_SOURCES = $(bpf_SRCS)
+ am_libebl_bpf_pic_a_OBJECTS = $(bpf_SRCS:.c=.os)
+ 
++parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
++libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
++am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+diff --git a/backends/libebl_parisc.h b/backends/libebl_parisc.h
+new file mode 100644
+index 0000000..f473b79
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_init.c
++++ b/backends/libebl_parisc.h
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
+diff --git a/backends/parisc_init.c b/backends/parisc_init.c
+new file mode 100644
+index 0000000..f1e401c
+--- /dev/null
++++ b/backends/parisc_init.c
 @@ -0,0 +1,73 @@
 +/* Initialization of PA-RISC specific backend library.
 +   Copyright (C) 2002, 2005, 2006 Red Hat, Inc.
@@ -76,10 +155,11 @@ Index: elfutils-0.164/backends/parisc_init.c
 +
 +  return MODVERSION;
 +}
-Index: elfutils-0.164/backends/parisc_regs.c
-===================================================================
+diff --git a/backends/parisc_regs.c b/backends/parisc_regs.c
+new file mode 100644
+index 0000000..3895f8e
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_regs.c
++++ b/backends/parisc_regs.c
 @@ -0,0 +1,159 @@
 +/* Register names and numbers for PA-RISC DWARF.
 +   Copyright (C) 2005, 2006 Red Hat, Inc.
@@ -240,10 +320,11 @@ Index: elfutils-0.164/backends/parisc_regs.c
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-Index: elfutils-0.164/backends/parisc_reloc.def
-===================================================================
+diff --git a/backends/parisc_reloc.def b/backends/parisc_reloc.def
+new file mode 100644
+index 0000000..1f875ba
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_reloc.def
++++ b/backends/parisc_reloc.def
 @@ -0,0 +1,128 @@
 +/* List the relocation types for PA-RISC.  -*- C -*-
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -373,10 +454,11 @@ Index: elfutils-0.164/backends/parisc_reloc.def
 +RELOC_TYPE (TLS_DTPMOD64,	DYN)
 +
 +#define NO_RELATIVE_RELOC       1
-Index: elfutils-0.164/backends/parisc_retval.c
-===================================================================
+diff --git a/backends/parisc_retval.c b/backends/parisc_retval.c
+new file mode 100644
+index 0000000..df7ec3a
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_retval.c
++++ b/backends/parisc_retval.c
 @@ -0,0 +1,213 @@
 +/* Function return value location for Linux/PA-RISC ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -591,10 +673,11 @@ Index: elfutils-0.164/backends/parisc_retval.c
 +  return parisc_return_value_location_ (functypedie, locp, 1);
 +}
 +
-Index: elfutils-0.164/backends/parisc_symbol.c
-===================================================================
+diff --git a/backends/parisc_symbol.c b/backends/parisc_symbol.c
+new file mode 100644
+index 0000000..d111a76
 --- /dev/null
-+++ elfutils-0.164/backends/parisc_symbol.c
++++ b/backends/parisc_symbol.c
 @@ -0,0 +1,112 @@
 +/* PA-RISC specific symbolic name handling.
 +   Copyright (C) 2002, 2005 Red Hat, Inc.
@@ -708,54 +791,11 @@ Index: elfutils-0.164/backends/parisc_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: elfutils-0.164/backends/libebl_parisc.h
-===================================================================
---- /dev/null
-+++ elfutils-0.164/backends/libebl_parisc.h
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
-Index: elfutils-0.164/backends/Makefile.am
-===================================================================
---- elfutils-0.164.orig/backends/Makefile.am
-+++ elfutils-0.164/backends/Makefile.am
-@@ -33,11 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
- 
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx
-+	  tilegx parisc
- libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
- 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
- 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
--	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a
-+	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
-+	     libebl_parisc_pic.a
- noinst_LIBRARIES = $(libebl_pic)
- noinst_DATA = $(libebl_pic:_pic.a=.so)
- 
-@@ -111,6 +112,9 @@ tilegx_SRCS = tilegx_init.c tilegx_symbo
- libebl_tilegx_pic_a_SOURCES = $(tilegx_SRCS)
- am_libebl_tilegx_pic_a_OBJECTS = $(tilegx_SRCS:.c=.os)
- 
-+parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
-+libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
-+am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
- 
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
- 	@rm -f $(@:.so=.map)
-Index: elfutils-0.164/libelf/elf.h
-===================================================================
---- elfutils-0.164.orig/libelf/elf.h
-+++ elfutils-0.164/libelf/elf.h
-@@ -1912,16 +1912,24 @@ enum
+diff --git a/libelf/elf.h b/libelf/elf.h
+index b6112d9..1efde12 100644
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -2055,16 +2055,24 @@ enum
  #define R_PARISC_PCREL17F	12	/* 17 bits of rel. address.  */
  #define R_PARISC_PCREL14R	14	/* Right 14 bits of rel. address.  */
  #define R_PARISC_DPREL21L	18	/* Left 21 bits of rel. address.  */
@@ -780,7 +820,7 @@ Index: elfutils-0.164/libelf/elf.h
  #define R_PARISC_LTOFF_FPTR32	57	/* 32 bits LT-rel. function pointer. */
  #define R_PARISC_LTOFF_FPTR21L	58	/* LT-rel. fct ptr, left 21 bits. */
  #define R_PARISC_LTOFF_FPTR14R	62	/* LT-rel. fct ptr, right 14 bits. */
-@@ -1930,6 +1938,7 @@ enum
+@@ -2073,6 +2081,7 @@ enum
  #define R_PARISC_PLABEL21L	66	/* Left 21 bits of fdesc address.  */
  #define R_PARISC_PLABEL14R	70	/* Right 14 bits of fdesc address.  */
  #define R_PARISC_PCREL64	72	/* 64 bits PC-rel. address.  */
@@ -788,7 +828,7 @@ Index: elfutils-0.164/libelf/elf.h
  #define R_PARISC_PCREL22F	74	/* 22 bits PC-rel. address.  */
  #define R_PARISC_PCREL14WR	75	/* PC-rel. address, right 14 bits.  */
  #define R_PARISC_PCREL14DR	76	/* PC rel. address, right 14 bits.  */
-@@ -1955,6 +1964,8 @@ enum
+@@ -2098,6 +2107,8 @@ enum
  #define R_PARISC_LTOFF16WF	102	/* 16 bits LT-rel. address.  */
  #define R_PARISC_LTOFF16DF	103	/* 16 bits LT-rel. address.  */
  #define R_PARISC_SECREL64	104	/* 64 bits section rel. address.  */
@@ -797,3 +837,6 @@ Index: elfutils-0.164/libelf/elf.h
  #define R_PARISC_SEGREL64	112	/* 64 bits segment rel. address.  */
  #define R_PARISC_PLTOFF14WR	115	/* PLT-rel. address, right 14 bits.  */
  #define R_PARISC_PLTOFF14DR	116	/* PLT-rel. address, right 14 bits.  */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/kfreebsd_path.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/kfreebsd_path.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/kfreebsd_path.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/kfreebsd_path.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.168/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/m68k_backend.diff
new file mode 100644
index 0000000..c09dcaa
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/m68k_backend.diff
@@ -0,0 +1,27 @@
+From fda3a81fe2d4fc0bdf9eb8e3c10571426d2236b2 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Thu, 22 Dec 2016 02:09:31 +0900
+Subject: [PATCH] m68k_backend.diff
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ libelf/elf.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/libelf/elf.h b/libelf/elf.h
+index 74654d6..563c8b2 100644
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -1295,6 +1295,9 @@ typedef struct
+ #define R_68K_GLOB_DAT	20		/* Create GOT entry */
+ #define R_68K_JMP_SLOT	21		/* Create PLT entry */
+ #define R_68K_RELATIVE	22		/* Adjust by program base */
++/* The next 2 are GNU extensions to enable C++ vtable garbage collection.  */
++#define R_68K_GNU_VTINHERIT 23
++#define R_68K_GNU_VTENTRY   24
+ #define R_68K_TLS_GD32      25          /* 32 bit GOT offset for GD */
+ #define R_68K_TLS_GD16      26          /* 16 bit GOT offset for GD */
+ #define R_68K_TLS_GD8       27          /* 8 bit GOT offset for GD */
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/mips_backend.diff
similarity index 88%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.168/mips_backend.diff
index de1237b..47f5e22 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.166/mips_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.168/mips_backend.diff
@@ -1,7 +1,70 @@
-Index: elfutils-0.164/backends/mips_init.c
-===================================================================
+From 1e4674b7a14288cb39853ce57560148f1b17cdb1 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Thu, 22 Dec 2016 02:01:44 +0900
+Subject: [PATCH] mips_backend
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ backends/Makefile.am    |  12 +-
+ backends/mips_init.c    |  59 +++++++++
+ backends/mips_regs.c    | 104 ++++++++++++++++
+ backends/mips_reloc.def |  79 ++++++++++++
+ backends/mips_retval.c  | 321 ++++++++++++++++++++++++++++++++++++++++++++++++
+ backends/mips_symbol.c  |  52 ++++++++
+ libebl/eblopenbackend.c |   2 +
+ 7 files changed, 627 insertions(+), 2 deletions(-)
+ create mode 100644 backends/mips_init.c
+ create mode 100644 backends/mips_regs.c
+ create mode 100644 backends/mips_reloc.def
+ create mode 100644 backends/mips_retval.c
+ create mode 100644 backends/mips_symbol.c
+
+diff --git a/backends/Makefile.am b/backends/Makefile.am
+index 71940a5..e45a9f6 100644
+--- a/backends/Makefile.am
++++ b/backends/Makefile.am
+@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I$(top_srcdir)/libasm \
+ 
+ 
+ modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
+-	  tilegx parisc m68k bpf
++	  tilegx parisc mips m68k bpf
+ libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
+ 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
+ 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
+ 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
+-	     libebl_parisc_pic.a libebl_m68k_pic.a libebl_bpf_pic.a
++	     libebl_parisc_pic.a libebl_mips_pic.a libebl_m68k_pic.a libebl_bpf_pic.a
+ noinst_LIBRARIES = $(libebl_pic)
+ noinst_DATA = $(libebl_pic:_pic.a=.so)
+ 
+@@ -117,6 +117,10 @@ parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
+ libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
+ am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
++mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
++libebl_mips_pic_a_SOURCES = $(mips_SRCS)
++am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
++
+ m68k_SRCS = m68k_init.c m68k_symbol.c m68k_regs.c \
+ 	    m68k_retval.c m68k_corenote.c
+ libebl_m68k_pic_a_SOURCES = $(m68k_SRCS)
+@@ -136,6 +140,10 @@ parisc_SRCS = parisc_init.c parisc_symbol.c parisc_regs.c parisc_retval.c
+ libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
+ am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
+ 
++mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
++libebl_mips_pic_a_SOURCES = $(mips_SRCS)
++am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
++
+ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	@rm -f $(@:.so=.map)
+ 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
+diff --git a/backends/mips_init.c b/backends/mips_init.c
+new file mode 100644
+index 0000000..975c04e
 --- /dev/null
-+++ elfutils-0.164/backends/mips_init.c
++++ b/backends/mips_init.c
 @@ -0,0 +1,59 @@
 +/* Initialization of mips specific backend library.
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -62,10 +125,11 @@ Index: elfutils-0.164/backends/mips_init.c
 +
 +  return MODVERSION;
 +}
-Index: elfutils-0.164/backends/mips_regs.c
-===================================================================
+diff --git a/backends/mips_regs.c b/backends/mips_regs.c
+new file mode 100644
+index 0000000..44f86cb
 --- /dev/null
-+++ elfutils-0.164/backends/mips_regs.c
++++ b/backends/mips_regs.c
 @@ -0,0 +1,104 @@
 +/* Register names and numbers for MIPS DWARF.
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -171,10 +235,11 @@ Index: elfutils-0.164/backends/mips_regs.c
 +  name[namelen++] = '\0';
 +  return namelen;
 +}
-Index: elfutils-0.164/backends/mips_reloc.def
-===================================================================
+diff --git a/backends/mips_reloc.def b/backends/mips_reloc.def
+new file mode 100644
+index 0000000..4579970
 --- /dev/null
-+++ elfutils-0.164/backends/mips_reloc.def
++++ b/backends/mips_reloc.def
 @@ -0,0 +1,79 @@
 +/* List the relocation types for mips.  -*- C -*-
 +   Copyright (C) 2006 Red Hat, Inc.
@@ -255,10 +320,11 @@ Index: elfutils-0.164/backends/mips_reloc.def
 +
 +#define NO_COPY_RELOC 1
 +#define NO_RELATIVE_RELOC 1
-Index: elfutils-0.164/backends/mips_retval.c
-===================================================================
+diff --git a/backends/mips_retval.c b/backends/mips_retval.c
+new file mode 100644
+index 0000000..656cd1f
 --- /dev/null
-+++ elfutils-0.164/backends/mips_retval.c
++++ b/backends/mips_retval.c
 @@ -0,0 +1,321 @@
 +/* Function return value location for Linux/mips ABI.
 +   Copyright (C) 2005 Red Hat, Inc.
@@ -581,10 +647,11 @@ Index: elfutils-0.164/backends/mips_retval.c
 +     DWARF and might be valid.  */
 +  return -2;
 +}
-Index: elfutils-0.164/backends/mips_symbol.c
-===================================================================
+diff --git a/backends/mips_symbol.c b/backends/mips_symbol.c
+new file mode 100644
+index 0000000..ba465fe
 --- /dev/null
-+++ elfutils-0.164/backends/mips_symbol.c
++++ b/backends/mips_symbol.c
 @@ -0,0 +1,52 @@
 +/* MIPS specific symbolic name handling.
 +   Copyright (C) 2002, 2003, 2005 Red Hat, Inc.
@@ -638,10 +705,10 @@ Index: elfutils-0.164/backends/mips_symbol.c
 +      return ELF_T_NUM;
 +    }
 +}
-Index: elfutils-0.164/libebl/eblopenbackend.c
-===================================================================
---- elfutils-0.164.orig/libebl/eblopenbackend.c
-+++ elfutils-0.164/libebl/eblopenbackend.c
+diff --git a/libebl/eblopenbackend.c b/libebl/eblopenbackend.c
+index aa75b95..34d439a 100644
+--- a/libebl/eblopenbackend.c
++++ b/libebl/eblopenbackend.c
 @@ -71,6 +71,8 @@ static const struct
    { "sparc", "elf_sparc", "sparc", 5, EM_SPARC, 0, 0 },
    { "sparc", "elf_sparcv8plus", "sparc", 5, EM_SPARC32PLUS, 0, 0 },
@@ -650,62 +717,7 @@ Index: elfutils-0.164/libebl/eblopenbackend.c
 +  { "mips", "elf_mipsel", "mipsel", 4, EM_MIPS_RS3_LE, 0, 0 },
  
    { "m32", "elf_m32", "m32", 3, EM_M32, 0, 0 },
-   { "m68k", "elf_m68k", "m68k", 4, EM_68K, 0, 0 },
-Index: elfutils-0.164/backends/common-reloc.c
-===================================================================
---- elfutils-0.164.orig/backends/common-reloc.c
-+++ elfutils-0.164/backends/common-reloc.c
-@@ -125,11 +125,13 @@ EBLHOOK(reloc_valid_use) (Elf *elf, int
- }
- 
- 
-+#ifndef NO_COPY_RELOC
- bool
- EBLHOOK(copy_reloc_p) (int reloc)
- {
-   return reloc == R_TYPE (COPY);
- }
-+#endif
- 
- bool
- EBLHOOK(none_reloc_p) (int reloc)
-@@ -151,7 +153,9 @@ EBLHOOK(init_reloc) (Ebl *ebl)
-   ebl->reloc_type_name = EBLHOOK(reloc_type_name);
-   ebl->reloc_type_check = EBLHOOK(reloc_type_check);
-   ebl->reloc_valid_use = EBLHOOK(reloc_valid_use);
-+#ifndef NO_COPY_RELOC
-   ebl->copy_reloc_p = EBLHOOK(copy_reloc_p);
-+#endif
-   ebl->none_reloc_p = EBLHOOK(none_reloc_p);
- #ifndef NO_RELATIVE_RELOC
-   ebl->relative_reloc_p = EBLHOOK(relative_reloc_p);
-Index: elfutils-0.164/backends/Makefile.am
-===================================================================
---- elfutils-0.164.orig/backends/Makefile.am
-+++ elfutils-0.164/backends/Makefile.am
-@@ -33,12 +33,12 @@ AM_CPPFLAGS += -I$(top_srcdir)/libebl -I
- 
- 
- modules = i386 sh x86_64 ia64 alpha arm aarch64 sparc ppc ppc64 s390 \
--	  tilegx parisc
-+	  tilegx parisc mips
- libebl_pic = libebl_i386_pic.a libebl_sh_pic.a libebl_x86_64_pic.a    \
- 	     libebl_ia64_pic.a libebl_alpha_pic.a libebl_arm_pic.a    \
- 	     libebl_aarch64_pic.a libebl_sparc_pic.a libebl_ppc_pic.a \
- 	     libebl_ppc64_pic.a libebl_s390_pic.a libebl_tilegx_pic.a \
--	     libebl_parisc_pic.a
-+	     libebl_parisc_pic.a libebl_mips_pic.a
- noinst_LIBRARIES = $(libebl_pic)
- noinst_DATA = $(libebl_pic:_pic.a=.so)
- 
-@@ -116,6 +116,10 @@ parisc_SRCS = parisc_init.c parisc_symbo
- libebl_parisc_pic_a_SOURCES = $(parisc_SRCS)
- am_libebl_parisc_pic_a_OBJECTS = $(parisc_SRCS:.c=.os)
- 
-+mips_SRCS = mips_init.c mips_symbol.c mips_regs.c mips_retval.c
-+libebl_mips_pic_a_SOURCES = $(mips_SRCS)
-+am_libebl_mips_pic_a_OBJECTS = $(mips_SRCS:.c=.os)
-+
- libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
- 	@rm -f $(@:.so=.map)
- 	$(AM_V_at)echo 'ELFUTILS_$(PACKAGE_VERSION) { global: $*_init; local: *; };' \
+   { "m68k", "elf_m68k", "m68k", 4, EM_68K, ELFCLASS32, ELFDATA2MSB },
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/mips_readelf_w.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/mips_readelf_w.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/shadow.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/shadow.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/shadow.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.168/testsuite-ignore-elflint.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.168/testsuite-ignore-elflint.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch b/meta/recipes-devtools/elfutils/elfutils-0.168/uclibc-support.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.168/uclibc-support.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.166.bb b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
similarity index 94%
rename from meta/recipes-devtools/elfutils/elfutils_0.166.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.168.bb
index 5c436d3..8b273f7 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.166.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
@@ -7,8 +7,8 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "d4e462b7891915dc5326bccefa2024ff"
-SRC_URI[sha256sum] = "3c056914c8a438b210be0d790463b960fc79d234c3f05ce707cbff80e94cba30"
+SRC_URI[md5sum] = "52adfa40758d0d39e5d5c57689bf38d6"
+SRC_URI[sha256sum] = "b88d07893ba1373c7dd69a7855974706d05377766568a7d9002706d5de72c276"
 
 SRC_URI += "\
         file://dso-link-change.patch \
@@ -21,6 +21,8 @@ SRC_URI += "\
         file://shadow.patch \
 "
 
+
+
 # pick the patch from debian
 # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.164-1.debian.tar.xz
 SRC_URI += "\
@@ -35,7 +37,6 @@ SRC_URI += "\
         file://0002-Add-support-for-mips64-abis-in-mips_retval.c.patch \
         file://0003-Add-mips-n64-relocation-format-hack.patch \
         file://uclibc-support.patch \
-        file://elfcmp-fix-self-comparision.patch \
 "
 SRC_URI_append_libc-musl = " file://0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch "
 
-- 
2.7.4




