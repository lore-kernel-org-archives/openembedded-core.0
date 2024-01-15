Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1936AC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 08:58:25 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.73844.1705309094283374665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 00:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146424792"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146424792"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 17:58:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BDB8D7AD8
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:58:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C94ABF3C5
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:58:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BB2EB202D32A3
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 17:58:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 44A7E1A0070;
	Mon, 15 Jan 2024 16:58:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] elfutils: upgrade 0.189 -> 0.190
Date: Mon, 15 Jan 2024 16:57:25 +0800
Message-Id: <1705309045-23782-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--28.668200-10.000000
X-TMASE-MatchedRID: FmwxYRCGmK+jz0nOeth/yaoXHZz/dXlxBPY4SegK3jwPdZmyx8xAa8Ir
	JyGzvIdDSDtuJ6OxT3klVEVWnldEYC01VXlcjcCUDDzmS9l9fYqqFRxxVM8R+fa9kkGTIwQUXWj
	vA8TpWFhfZPFUbFYJwZI60+HRZpMOTUVpQWpX2Fjqzl3Jh8Md6Ei8rgutezVpOhR0VsdhRrAkHL
	DeBKRzLJC1SIcCpP4B0OKHiGMrPYRqebgqX9mYAAPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEdn5vqTu9lLLcixbwa0CYj9wzzDg33EmMx0gyixf3FjjKIqAq0jIHijJ0xHD2eXNKIF2O
	99KpeDFlq+wV+zQnDhVKcRKr3LVS/625ZdmTyUhitzfafzhYeo5UafLmrvaGh+COkGSdO5HT0Pp
	HDbMis6v7fEULB3BUYqgDm0T2AwYn+2Z4zrb6rtkmt92Rl1nWYU4M4UEhdYrJN4bmpHPMW0AZKe
	HlBfG++xFlvZshf1bOlrk3M/IDPKimPM07Al9S5CghTisABMyouldXwTVPvFQuGn5b9r2ZvpjVi
	G17c8E45PBNB8uybZkUOJSBc5UFHHP94Utx1S3wlvzzUUaf2TK1/qdbjc7Qc3TcFmUDszzv8kZF
	nw+AJ/lfTn0riVzALJE/uNR38Ci8yXEu2oDUma5bb5QEYSkdyeUl7aCTy8iF7G1bHV1SITBCAwy
	9Ft7Jx+qVwXRe/S8bxwa4wJMj8FxBtSwl5Viu3QqJN4m15UFOdKnCeVjjIZsoi2XrUn/JQYMORu
	DWAmQ4BrATwm8hot934/rDAK3zUc1+O1X9AzE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 08:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193640

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-helper-function-for-basename.patch
0001-dso-link-change.patch
0001-libasm-may-link-with-libbz2-if-found.patch
0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
0003-fixheadercheck.patch
ptest.patch
refreshed for 0.190.

Changelog:
===========
-Switch from real name policy to known identity policy.
-libelf: Add RELR support.
-libdw: Recognize .debug_[ct]u_index sections
-readelf: Support readelf -Ds, --use-dynamic --symbol.
 Support .gdb_index version 9
-scrlines: New tool that compiles a list of source files associated
 with a specified dwarf/elf file.
-debuginfod: Schema change for a 60% compression in filename representation,
 which was a large part of the sqlite index; also, more deliberate sqlite
 -wal management during scanning using the --scan-checkpoint option.
-backends: Various LoongArch updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{elfutils_0.189.bb => elfutils_0.190.bb}  |   2 +-
 ...001-Add-helper-function-for-basename.patch | 117 ++++++++++++------
 .../elfutils/files/0001-dso-link-change.patch |  12 +-
 ...libasm-may-link-with-libbz2-if-found.patch |   6 +-
 ...-check-data_list.data.d.d_buf-before.patch |   6 +-
 ...m-compile-test_nlist-with-standard-C.patch |   6 +-
 ...cvt_gunhash-if-dest-and-src-are-same.patch |   8 +-
 .../elfutils/files/0003-fixheadercheck.patch  |   6 +-
 .../elfutils/files/ptest.patch                |  10 +-
 9 files changed, 106 insertions(+), 67 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.189.bb => elfutils_0.190.bb} (98%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.189.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.190.bb
index e9b432e4e9..6753d0ae7d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
@@ -26,7 +26,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "39bd8f1a338e2b7cd4abc3ff11a0eddc6e690f69578a57478d8179b4148708c8"
+SRC_URI[sha256sum] = "8e00a3a9b5f04bc1dc273ae86281d2d26ed412020b391ffcc23198f10231d692"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch b/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
index 3e6033fd75..ebd4576f4a 100644
--- a/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
@@ -1,4 +1,4 @@
-From 666372a5d8d5a23203c70d583904097c9e49c5a0 Mon Sep 17 00:00:00 2001
+From 61773daf61f01105ec30b32a997681084f513aff Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 9 Dec 2023 18:23:03 -0800
 Subject: [PATCH] Add helper function for basename
@@ -12,27 +12,31 @@ libraries which have POSIX implementation only.
 Upstream-Status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2023q4/006727.html]
 [1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  lib/Makefile.am                      |  2 +-
  lib/libeu.h                          |  1 +
- lib/{libeu.h => xbasename.c}         | 31 ++++++++++------------------
+ lib/xbasename.c                      | 39 ++++++++++++++++++++++++++++
  libdw/dwarf_getsrc_file.c            |  3 ++-
  libdwfl/core-file.c                  |  3 ++-
  libdwfl/dwfl_module_getsrc_file.c    |  3 ++-
  libdwfl/dwfl_segment_report_module.c |  3 ++-
- libdwfl/find-debuginfo.c             |  7 ++++---
+ libdwfl/find-debuginfo.c             |  7 ++---
  libdwfl/link_map.c                   |  3 ++-
  libdwfl/linux-kernel-modules.c       |  3 ++-
- src/addr2line.c                      |  5 +++--
- src/ar.c                             |  5 +++--
- src/nm.c                             |  4 ++--
+ src/addr2line.c                      |  5 ++--
+ src/ar.c                             |  5 ++--
+ src/nm.c                             |  4 +--
  src/stack.c                          |  3 ++-
  src/strip.c                          |  2 +-
- tests/show-die-info.c                |  2 +-
- tests/varlocs.c                      |  2 +-
- 17 files changed, 42 insertions(+), 40 deletions(-)
- copy lib/{libeu.h => xbasename.c} (57%)
+ tests/Makefile.am                    |  2 +-
+ tests/show-die-info.c                |  3 ++-
+ tests/varlocs.c                      |  3 ++-
+ 18 files changed, 73 insertions(+), 21 deletions(-)
+ create mode 100644 lib/xbasename.c
 
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index b3bb929..ada51c0 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
 @@ -33,7 +33,7 @@ AM_CPPFLAGS += -I$(srcdir)/../libelf
@@ -44,9 +48,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		  crc32.c crc32_file.c \
  		  color.c error.c printversion.c
  
+diff --git a/lib/libeu.h b/lib/libeu.h
+index e849a79..2a115ac 100644
 --- a/lib/libeu.h
 +++ b/lib/libeu.h
-@@ -42,6 +42,7 @@ extern char *xstrndup (const char *, siz
+@@ -42,6 +42,7 @@ extern char *xstrndup (const char *, size_t) __attribute__ ((__malloc__));
  extern char *xasprintf(const char *fmt, ...)
  	__attribute__ ((format (printf, 1, 2))) __attribute__ ((__malloc__));
  
@@ -54,6 +60,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  extern uint32_t crc32 (uint32_t crc, unsigned char *buf, size_t len);
  extern int crc32_file (int fd, uint32_t *resp);
  
+diff --git a/lib/xbasename.c b/lib/xbasename.c
+new file mode 100644
+index 0000000..68d5161
 --- /dev/null
 +++ b/lib/xbasename.c
 @@ -0,0 +1,39 @@
@@ -96,6 +105,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +    const char *p = strrchr(s, '/');
 +    return p ? p+1 : s;
 +}
+diff --git a/libdw/dwarf_getsrc_file.c b/libdw/dwarf_getsrc_file.c
+index 5289c7d..f75bf7b 100644
 --- a/libdw/dwarf_getsrc_file.c
 +++ b/libdw/dwarf_getsrc_file.c
 @@ -37,6 +37,7 @@
@@ -106,7 +117,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  int
-@@ -98,7 +99,7 @@ dwarf_getsrc_file (Dwarf *dbg, const cha
+@@ -98,7 +99,7 @@ dwarf_getsrc_file (Dwarf *dbg, const char *fname, int lineno, int column,
  	      /* Match the name with the name the user provided.  */
  	      const char *fname2 = line->files->info[lastfile].name;
  	      if (is_basename)
@@ -115,6 +126,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	      else
  		lastmatch = strcmp (fname2, fname) == 0;
  	    }
+diff --git a/libdwfl/core-file.c b/libdwfl/core-file.c
+index 87c940c..52a34b8 100644
 --- a/libdwfl/core-file.c
 +++ b/libdwfl/core-file.c
 @@ -29,6 +29,7 @@
@@ -125,7 +138,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "libdwflP.h"
  #include <gelf.h>
  
-@@ -595,7 +596,7 @@ dwfl_core_file_report (Dwfl *dwfl, Elf *
+@@ -595,7 +596,7 @@ dwfl_core_file_report (Dwfl *dwfl, Elf *elf, const char *executable)
        if (! __libdwfl_dynamic_vaddr_get (module->elf, &file_dynamic_vaddr))
  	continue;
        Dwfl_Module *mod;
@@ -134,6 +147,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  				  module->fd, module->elf,
  				  module->l_ld - file_dynamic_vaddr,
  				  true, true);
+diff --git a/libdwfl/dwfl_module_getsrc_file.c b/libdwfl/dwfl_module_getsrc_file.c
+index 513af6b..0418a26 100644
 --- a/libdwfl/dwfl_module_getsrc_file.c
 +++ b/libdwfl/dwfl_module_getsrc_file.c
 @@ -31,6 +31,7 @@
@@ -144,7 +159,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "libdwP.h"
  
  
-@@ -103,7 +104,7 @@ dwfl_module_getsrc_file (Dwfl_Module *mo
+@@ -103,7 +104,7 @@ dwfl_module_getsrc_file (Dwfl_Module *mod,
  		{
  		  /* Match the name with the name the user provided.  */
  		  lastfile = file;
@@ -153,6 +168,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  				       fname);
  		}
  	    }
+diff --git a/libdwfl/dwfl_segment_report_module.c b/libdwfl/dwfl_segment_report_module.c
+index 3ef62a7..15621ad 100644
 --- a/libdwfl/dwfl_segment_report_module.c
 +++ b/libdwfl/dwfl_segment_report_module.c
 @@ -29,6 +29,7 @@
@@ -163,7 +180,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "libdwflP.h"
  #include "common.h"
  
-@@ -718,7 +719,7 @@ dwfl_segment_report_module (Dwfl *dwfl,
+@@ -718,7 +719,7 @@ dwfl_segment_report_module (Dwfl *dwfl, int ndx, const char *name,
  	      bias += fixup;
  	      if (module->name[0] != '\0')
  		{
@@ -172,6 +189,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		  name_is_final = true;
  		}
  	      break;
+diff --git a/libdwfl/find-debuginfo.c b/libdwfl/find-debuginfo.c
+index 7f7ab63..6aab1a4 100644
 --- a/libdwfl/find-debuginfo.c
 +++ b/libdwfl/find-debuginfo.c
 @@ -31,6 +31,7 @@
@@ -182,7 +201,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <stdio.h>
  #include <fcntl.h>
  #include <sys/stat.h>
-@@ -164,7 +165,7 @@ find_debuginfo_in_path (Dwfl_Module *mod
+@@ -164,7 +165,7 @@ find_debuginfo_in_path (Dwfl_Module *mod, const char *file_name,
  {
    bool cancheck = debuglink_crc != (GElf_Word) 0;
  
@@ -191,7 +210,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    char *localname = NULL;
  
    /* We invent a debuglink .debug name if NULL, but then want to try the
-@@ -278,7 +279,7 @@ find_debuginfo_in_path (Dwfl_Module *mod
+@@ -278,7 +279,7 @@ find_debuginfo_in_path (Dwfl_Module *mod, const char *file_name,
  	  else
  	    {
  	      subdir = NULL;
@@ -200,7 +219,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	    }
  	  try_file_basename = debuglink_null;
  	  break;
-@@ -306,7 +307,7 @@ find_debuginfo_in_path (Dwfl_Module *mod
+@@ -306,7 +307,7 @@ find_debuginfo_in_path (Dwfl_Module *mod, const char *file_name,
  	    if (mod->dw != NULL && (p[0] == '\0' || p[0] == '/'))
  	      {
  		fd = try_open (&main_stat, dir, ".dwz",
@@ -209,6 +228,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		if (fd < 0)
  		  {
  		    if (errno != ENOENT && errno != ENOTDIR)
+diff --git a/libdwfl/link_map.c b/libdwfl/link_map.c
+index 76f2335..cdaa7ed 100644
 --- a/libdwfl/link_map.c
 +++ b/libdwfl/link_map.c
 @@ -29,6 +29,7 @@
@@ -219,7 +240,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "memory-access.h"
  #include "system.h"
  
-@@ -469,7 +470,7 @@ report_r_debug (uint_fast8_t elfclass, u
+@@ -475,7 +476,7 @@ report_r_debug (uint_fast8_t elfclass, uint_fast8_t elfdata,
  		      if (r_debug_info_module == NULL)
  			{
  			  // XXX hook for sysroot
@@ -228,6 +249,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  						      name, fd, elf, base,
  						      true, true);
  			  if (mod != NULL)
+diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
+index 58c0c41..bdbde83 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
 @@ -40,6 +40,7 @@
@@ -238,7 +261,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "libdwflP.h"
  #include <inttypes.h>
  #include <errno.h>
-@@ -116,7 +117,7 @@ try_kernel_name (Dwfl *dwfl, char **fnam
+@@ -116,7 +117,7 @@ try_kernel_name (Dwfl *dwfl, char **fname, bool try_debug)
  	/* Try the file's unadorned basename as DEBUGLINK_FILE,
  	   to look only for "vmlinux" files.  */
  	fd = INTUSE(dwfl_standard_find_debuginfo) (&fakemod, NULL, NULL, 0,
@@ -247,6 +270,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  						   0, &fakemod.debug.name);
  
        if (fakemod.debug.name != NULL)
+diff --git a/src/addr2line.c b/src/addr2line.c
+index d902d79..5345189 100644
 --- a/src/addr2line.c
 +++ b/src/addr2line.c
 @@ -38,6 +38,7 @@
@@ -257,7 +282,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  /* Name and version of program.  */
-@@ -385,7 +386,7 @@ print_dwarf_function (Dwfl_Module *mod,
+@@ -385,7 +386,7 @@ print_dwarf_function (Dwfl_Module *mod, Dwarf_Addr addr)
  		  if (file == NULL)
  		    file = "???";
  		  else if (only_basenames)
@@ -266,7 +291,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  		  else if (use_comp_dir && file[0] != '/')
  		    {
  		      const char *const *dirs;
-@@ -568,7 +569,7 @@ print_src (const char *src, int lineno,
+@@ -568,7 +569,7 @@ print_src (const char *src, int lineno, int linecol, Dwarf_Die *cu)
    const char *comp_dir_sep = "";
  
    if (only_basenames)
@@ -275,6 +300,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
    else if (use_comp_dir && src[0] != '/')
      {
        Dwarf_Attribute attr;
+diff --git a/src/ar.c b/src/ar.c
+index 3bcb18f..8f2dcd0 100644
 --- a/src/ar.c
 +++ b/src/ar.c
 @@ -42,6 +42,7 @@
@@ -285,7 +312,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  
  /* Name and version of program.  */
-@@ -1133,7 +1134,7 @@ do_oper_insert (int oper, const char *ar
+@@ -1133,7 +1134,7 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
        for (int cnt = 0; cnt < argc; ++cnt)
  	{
  	  ENTRY entry;
@@ -294,7 +321,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  entry.data = &argv[cnt];
  	  if (hsearch (entry, ENTER) == NULL)
  	    error_exit (errno, _("cannot insert into hash table"));
-@@ -1242,7 +1243,7 @@ do_oper_insert (int oper, const char *ar
+@@ -1242,7 +1243,7 @@ do_oper_insert (int oper, const char *arfname, char **argv, int argc,
        /* Open all the new files, get their sizes and add all symbols.  */
        for (int cnt = 0; cnt < argc; ++cnt)
  	{
@@ -303,9 +330,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  size_t bnamelen = strlen (bname);
  	  if (found[cnt] == NULL)
  	    {
+diff --git a/src/nm.c b/src/nm.c
+index fbdee8e..3675f59 100644
 --- a/src/nm.c
 +++ b/src/nm.c
-@@ -1417,7 +1417,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehd
+@@ -1417,7 +1417,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehdr *ehdr,
  			  int lineno;
  			  (void) dwarf_lineno (line, &lineno);
  			  const char *file = dwarf_linesrc (line, NULL, NULL);
@@ -314,7 +343,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  			  int n;
  			  n = obstack_printf (&whereob, "%s:%d%c", file,
  					      lineno, '\0');
-@@ -1448,7 +1448,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehd
+@@ -1448,7 +1448,7 @@ show_symbols (int fd, Ebl *ebl, GElf_Ehdr *ehdr,
  		{
  		  /* We found the line.  */
  		  int n = obstack_printf (&whereob, "%s:%" PRIu64 "%c",
@@ -323,6 +352,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  					  (*found)->lineno,
  					  '\0');
  		  sym_mem[nentries_used].where = obstack_finish (&whereob);
+diff --git a/src/stack.c b/src/stack.c
+index 534aa93..3abef98 100644
 --- a/src/stack.c
 +++ b/src/stack.c
 @@ -31,6 +31,7 @@
@@ -333,7 +364,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  /* Name and version of program.  */
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
-@@ -152,7 +153,7 @@ module_callback (Dwfl_Module *mod, void
+@@ -152,7 +153,7 @@ module_callback (Dwfl_Module *mod, void **userdata __attribute__((unused)),
  
    int width = get_addr_width (mod);
    printf ("0x%0*" PRIx64 "-0x%0*" PRIx64 " %s\n",
@@ -342,9 +373,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
    const unsigned char *id;
    GElf_Addr id_vaddr;
+diff --git a/src/strip.c b/src/strip.c
+index 7f4788b..6436443 100644
 --- a/src/strip.c
 +++ b/src/strip.c
-@@ -1807,7 +1807,7 @@ handle_elf (int fd, Elf *elf, const char
+@@ -1800,7 +1800,7 @@ handle_elf (int fd, Elf *elf, const char *prefix, const char *fname,
  		      elf_errmsg (-1));
  	}
  
@@ -353,6 +386,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
        off_t crc_offset = strlen (debug_basename) + 1;
        /* Align to 4 byte boundary */
        crc_offset = ((crc_offset - 1) & ~3) + 4;
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 79105f2..43ef6d9 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -705,7 +705,7 @@ update1_LDADD = $(libelf)
+ update2_LDADD = $(libelf)
+ update3_LDADD = $(libdw) $(libelf)
+ update4_LDADD = $(libdw) $(libelf)
+-show_die_info_LDADD = $(libdw) $(libelf)
++show_die_info_LDADD = $(libeu) $(libdw) $(libelf)
+ get_pubnames_LDADD = $(libdw) $(libelf)
+ show_abbrev_LDADD = $(libdw) $(libelf)
+ get_lines_LDADD = $(libdw) $(libelf)
+diff --git a/tests/show-die-info.c b/tests/show-die-info.c
+index 1a3191c..00a6657 100644
 --- a/tests/show-die-info.c
 +++ b/tests/show-die-info.c
 @@ -26,6 +26,7 @@
@@ -372,6 +420,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
        dbg = dwarf_begin (fd, DWARF_C_READ);
        if (dbg == NULL)
+diff --git a/tests/varlocs.c b/tests/varlocs.c
+index 8e563fd..72c64e2 100644
 --- a/tests/varlocs.c
 +++ b/tests/varlocs.c
 @@ -33,6 +33,7 @@
@@ -391,14 +441,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  	  printf ("module '%s'\n", name);
  	  print_die (&cudie, "CU", 0);
  
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -692,7 +692,7 @@ update1_LDADD = $(libelf)
- update2_LDADD = $(libelf)
- update3_LDADD = $(libdw) $(libelf)
- update4_LDADD = $(libdw) $(libelf)
--show_die_info_LDADD = $(libdw) $(libelf)
-+show_die_info_LDADD = $(libeu) $(libdw) $(libelf)
- get_pubnames_LDADD = $(libdw) $(libelf)
- show_abbrev_LDADD = $(libdw) $(libelf)
- get_lines_LDADD = $(libdw) $(libelf)
diff --git a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
index 6acc036406..62d5c083bd 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From c5fb59ac0819b5b6d8244c613cbcf92cb09840c1 Mon Sep 17 00:00:00 2001
+From 729c0d34044250089518541a398b4cea639717e2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:10:57 +0800
 Subject: [PATCH] dso link change
@@ -23,11 +23,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 88d0ac8..c28d81f 100644
+index d3d9d40..ea61616 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -45,7 +45,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  else
  libasm = ../libasm/libasm.so
 -libdw = ../libdw/libdw.so
@@ -36,11 +36,11 @@ index 88d0ac8..c28d81f 100644
  endif
  libebl = ../libebl/libebl.a ../backends/libebl_backends.a ../libcpu/libcpu.a
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index c145720..72afd0e 100644
+index 7fb8efb..71c1a61 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -554,7 +554,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+@@ -680,7 +680,7 @@ libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) $(libebl) -ldl -lpthread
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  libasm = ../libasm/libasm.a
  else
 -libdw = ../libdw/libdw.so
diff --git a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
index 09c9d3ea24..4f4a2771fe 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From ed1975deeaa47f98d212fd144c8bda075b1a5d36 Mon Sep 17 00:00:00 2001
+From 9ad4a25f5d590e6ff0805c186a2fc23b443e0b10 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 4 Oct 2017 22:30:46 -0700
 Subject: [PATCH] libasm may link with libbz2 if found
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index c28d81f..951e978 100644
+index ea61616..bc6573f 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -40,11 +40,11 @@ EXTRA_DIST += make-debug-archive.in
@@ -27,7 +27,7 @@ index c28d81f..951e978 100644
 -libasm = ../libasm/libasm.a
 +libasm = ../libasm/libasm.a $(zip_LIBS)
  libdw = ../libdw/libdw.a -lz $(zip_LIBS) $(libelf) -ldl -lpthread
- libelf = ../libelf/libelf.a -lz
+ libelf = ../libelf/libelf.a -lz $(zstd_LIBS)
  else
 -libasm = ../libasm/libasm.so
 +libasm = ../libasm/libasm.so $(zip_LIBS)
diff --git a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
index c8d55d583a..1ea1fc5ca1 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From f40cbd43acdb1fefef4fa53a6034296d83cbff7d Mon Sep 17 00:00:00 2001
+From b72ae0eb956c8dd693423ce1fdcf127ccf9aacfc Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Thu, 16 Aug 2018 09:58:26 +0800
 Subject: [PATCH] libelf/elf_end.c: check data_list.data.d.d_buf before free it
@@ -20,10 +20,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf_end.c b/libelf/elf_end.c
-index 160f0b8..5280a70 100644
+index 80f4d13..b103959 100644
 --- a/libelf/elf_end.c
 +++ b/libelf/elf_end.c
-@@ -160,14 +160,16 @@ elf_end (Elf *elf)
+@@ -169,14 +169,16 @@ elf_end (Elf *elf)
  		   architecture doesn't require overly stringent
  		   alignment the raw data buffer is the same as the
  		   one used for presenting to the caller.  */
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index a2c0b90227..b8bd58117e 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From e355ca3b8ddcc6e73ee140f53d25634afdaec0da Mon Sep 17 00:00:00 2001
+From 8cc1f0ab2e04fc3899b5a6e0b4f17e7778fced84 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 23 Jun 2020 07:49:35 +0000
 Subject: [PATCH] tests/Makefile.am: compile test_nlist with standard CFLAGS
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 2ade5d9..f85cdba 100644
+index ac82456..79105f2 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -98,7 +98,7 @@ endif
+@@ -102,7 +102,7 @@ endif
  test-nlist$(EXEEXT): test-nlist.c
  	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
  	  $(AM_CPPFLAGS) $(CPPFLAGS) \
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index be48ef010b..c13104713a 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From 1643d793761216252bb654e28aaa5b8eb1536bca Mon Sep 17 00:00:00 2001
+From 60524c7b7c420ff94cd728f791e44cef84cea7b9 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:13:59 +0800
 Subject: [PATCH] Fix elf_cvt_gunhash if dest and src are same.
@@ -18,10 +18,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libelf/gnuhash_xlate.h b/libelf/gnuhash_xlate.h
-index 6faf113..04d9ca1 100644
+index 3a00ae0..40468fc 100644
 --- a/libelf/gnuhash_xlate.h
 +++ b/libelf/gnuhash_xlate.h
-@@ -40,6 +40,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+@@ -42,6 +42,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
       words.  We must detangle them here.   */
    Elf32_Word *dest32 = dest;
    const Elf32_Word *src32 = src;
@@ -29,7 +29,7 @@ index 6faf113..04d9ca1 100644
  
    /* First four control words, 32 bits.  */
    for (unsigned int cnt = 0; cnt < 4; ++cnt)
-@@ -50,7 +51,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
+@@ -52,7 +53,7 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
        len -= 4;
      }
  
diff --git a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
index 212b358dc2..21256304ef 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 7e1f91c42ef5b0bf10afefec10dd08588df3ab1f Mon Sep 17 00:00:00 2001
+From 8401b50ef3ca9e64f1baaae89750a5accac9cb35 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:17:20 +0800
 Subject: [PATCH] fixheadercheck
@@ -22,10 +22,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/libelf/elf32_updatenull.c b/libelf/elf32_updatenull.c
-index d0d4d1e..4ecf5a5 100644
+index 3594e8b..a3314e5 100644
 --- a/libelf/elf32_updatenull.c
 +++ b/libelf/elf32_updatenull.c
-@@ -354,8 +354,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
+@@ -355,8 +355,8 @@ __elfw2(LIBELFBITS,updatenull_wrlock) (Elf *elf, int *change_bop, size_t shnum)
  		     we test for the alignment of the section being large
  		     enough for the largest alignment required by a data
  		     block.  */
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index fe6f272a83..0b612f734a 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From bfbf393e7d5b1b41df85ce1c37e887776c45d529 Mon Sep 17 00:00:00 2001
+From 2f9788de46ec0619f951d61891d8b123f5c0fa50 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 16:37:48 +0100
 Subject: [PATCH] Changes to allow ptest to run standalone on target:
@@ -22,10 +22,10 @@ Upstream-Status: Inappropriate [oe specific]
  3 files changed, 3 insertions(+), 7 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d345495..67933d1 100644
+index af5b6bf..2ef302f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -48,7 +48,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2021 The elfutils developers.])
+@@ -49,7 +49,7 @@ AC_COPYRIGHT([Copyright (C) 1996-2023 The elfutils developers.])
  AC_PREREQ(2.63)			dnl Minimum Autoconf version required.
  
  dnl We use GNU make extensions; automake 1.10 defaults to -Wportability.
@@ -35,10 +35,10 @@ index d345495..67933d1 100644
  
  AM_SILENT_RULES([yes])
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 72afd0e..a2dfd43 100644
+index 71c1a61..ac82456 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -698,3 +698,5 @@ check: check-am coverage
+@@ -834,3 +834,5 @@ check: check-am coverage
  coverage:
  	-$(srcdir)/coverage.sh
  endif
-- 
2.34.1


