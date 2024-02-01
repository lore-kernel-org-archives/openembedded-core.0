Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9602C48292
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2147.1706810404343627901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Wl9Uht1S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bbBnnoiv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018d65d3f2d4-c2e60f75-2edd-4a9c-8a11-02f4f7a90f2b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q3+4TsuY3OJrOTgZoNyl2p6QBqAQZ8kg+5msjCqR4YI=;
	b=Wl9Uht1S0fE/cDqCSBkeDmYwc9BbbiHZFgfqPsMY+62u+QTvD2XS6GZnPe4JMgFI
	bsFzXPDuj2d41LGu5mNjsI8K6/8GseKINIpc7ovKaUBriRnW+jxYTH9iCO/e5+BW9QC
	5xAUNn8fQrwyfhdMCr0mRqarHXQJkRwaPdqV25qE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q3+4TsuY3OJrOTgZoNyl2p6QBqAQZ8kg+5msjCqR4YI=;
	b=bbBnnoivhKgOXy7LMS+t8xSjtEUtE/+NlyuBIx2+6KTu5XJiqGa2ZoCH1rceYdgy
	87s9UQELaQJ6tRle9aEtH2d9UFLtykVaCG7ZjlWxajjZGhoS0qfmtx7tMiJVGlyXkjn
	Tg6n3e14yNjoJjkYBUdlPTdOuL53C7nRn8q21HIE=
Content-Type: multipart/mixed; boundary="===============5969807256642563416=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.190 SUCCEEDED
Message-ID: <0101018d65d3f2d4-c2e60f75-2edd-4a9c-8a11-02f4f7a90f2b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194635

--===============5969807256642563416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *elfutils* to *0.190* has Succeeded.

Next steps:
    - apply the patch: git am 0001-elfutils-upgrade-0.189-0.190.patch
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
From 7ec3531936e080ccf604acdd38c832e911769496 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 07:09:25 +0000
Subject: [PATCH] elfutils: upgrade 0.189 -> 0.190

---
 .../{elfutils_0.189.bb => elfutils_0.190.bb}  |   2 +-
 ...001-Add-helper-function-for-basename.patch | 117 ++++++++++++------
 .../elfutils/files/0001-dso-link-change.patch |  12 +-
 ...libasm-may-link-with-libbz2-if-found.patch |   6 +-
 ...-check-data_list.data.d.d_buf-before.patch |   6 +-
 ...-skip-the-test-when-gcc-not-deployed.patch |   2 +-
 ...m-compile-test_nlist-with-standard-C.patch |   6 +-
 ...against-upcoming-gcc-14-Werror-callo.patch |   6 +-
 ...cvt_gunhash-if-dest-and-src-are-same.patch |   8 +-
 .../elfutils/files/0003-fixheadercheck.patch  |   6 +-
 .../elfutils/files/0003-musl-utils.patch      |   6 +-
 .../0006-Fix-build-on-aarch64-musl.patch      |   2 +-
 .../elfutils/files/ptest.patch                |  10 +-
 13 files changed, 113 insertions(+), 76 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.189.bb => elfutils_0.190.bb} (98%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.189.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.190.bb
index 076ba47358..8c54c78fc1 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.190.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            "
-SRC_URI[sha256sum] = "39bd8f1a338e2b7cd4abc3ff11a0eddc6e690f69578a57478d8179b4148708c8"
+SRC_URI[sha256sum] = "8e00a3a9b5f04bc1dc273ae86281d2d26ed412020b391ffcc23198f10231d692"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch b/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
index 3e6033fd75..1eb053bdd4 100644
--- a/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
@@ -1,4 +1,4 @@
-From 666372a5d8d5a23203c70d583904097c9e49c5a0 Mon Sep 17 00:00:00 2001
+From 61dda59032a062f4474dbbdf30dc5684bb5ee4b9 Mon Sep 17 00:00:00 2001
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
index 6acc036406..654c26e720 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From c5fb59ac0819b5b6d8244c613cbcf92cb09840c1 Mon Sep 17 00:00:00 2001
+From 2e51b0e1bbef5332ab74eb1e8224211e0336d452 Mon Sep 17 00:00:00 2001
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
index 09c9d3ea24..76b3f8bcc8 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From ed1975deeaa47f98d212fd144c8bda075b1a5d36 Mon Sep 17 00:00:00 2001
+From 2eff8e57187cfecc2f87d2303f0caac32396d82d Mon Sep 17 00:00:00 2001
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
index c8d55d583a..0c7684687b 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From f40cbd43acdb1fefef4fa53a6034296d83cbff7d Mon Sep 17 00:00:00 2001
+From c14e3ab75ad2096734cb0752e7453a34b1d3bb75 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
index 0e6bf5573c..b3914e4a29 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,4 +1,4 @@
-From 2fa52d61b1abdf4a3f3b153c771fb2081666430c Mon Sep 17 00:00:00 2001
+From 8e6b017a6f7ca535d8cf41a3af4337fb12e18494 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index a2c0b90227..8750822028 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From e355ca3b8ddcc6e73ee140f53d25634afdaec0da Mon Sep 17 00:00:00 2001
+From 0e186aed08ef861a70b5c264645c105f60251e03 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch b/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch
index 5e0c7e9766..d709166777 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch
@@ -1,4 +1,4 @@
-From 901c6a8c78c3c4eee244b9d5298cbd7b9aa713d1 Mon Sep 17 00:00:00 2001
+From fc374695e7e4ff7e1d9912971f20bd5e4bf1027f Mon Sep 17 00:00:00 2001
 From: Sergei Trofimovich <slyich@gmail.com>
 Date: Thu, 21 Dec 2023 09:23:30 +0000
 Subject: [PATCH] tests: fix build against upcoming `gcc-14`
@@ -17,6 +17,7 @@ detected minor infelicity in `calloc()` API usage in `elfutils`:
 Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=ae580d48278b9924da7503886b37be34378e1b04]
 Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  tests/elfstrmerge.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -34,6 +35,3 @@ index 56350bb..4eb58bb 100644
    if (newscnbufs == NULL)
      fail_errno ("Couldn't allocate memory for new section buffers", NULL);
  
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
index be48ef010b..047ce44876 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From 1643d793761216252bb654e28aaa5b8eb1536bca Mon Sep 17 00:00:00 2001
+From 38538b2e34b6d04f29a8e7b48aaecbc30f8d33cf Mon Sep 17 00:00:00 2001
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
index 212b358dc2..bc19fb4730 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 7e1f91c42ef5b0bf10afefec10dd08588df3ab1f Mon Sep 17 00:00:00 2001
+From fd7460da374646a0e63531f11c1ef45460ef083f Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 93f5bdcd00..967cdf2319 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 262ac90394e36e0b4e86042d9c5385703f5b6536 Mon Sep 17 00:00:00 2001
+From 20fbee4724181b8c24f8ef9b905be92d65b346da Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -39,7 +39,7 @@ index d4a4221..f6336d9 100644
  /* State of -D/-U flags.  */
  extern bool arlib_deterministic_output;
 diff --git a/src/elfcompress.c b/src/elfcompress.c
-index 18ade66..a6ed4e1 100644
+index f771b92..263de62 100644
 --- a/src/elfcompress.c
 +++ b/src/elfcompress.c
 @@ -37,6 +37,13 @@
@@ -57,7 +57,7 @@ index 18ade66..a6ed4e1 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/strip.c b/src/strip.c
-index 2a2cc80..8e9f773 100644
+index 6436443..1608496 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -45,6 +45,13 @@
diff --git a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
index 8942ad7828..580dd83501 100644
--- a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
@@ -1,4 +1,4 @@
-From 2396fd67d81e54e18fbad67a5ff67d5684a01013 Mon Sep 17 00:00:00 2001
+From 773ada0bce252a5a67bf8bea544b153f3952f2ef Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:27:30 +0800
 Subject: [PATCH] Fix build on aarch64/musl
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index fe6f272a83..dbc49d8cbf 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From bfbf393e7d5b1b41df85ce1c37e887776c45d529 Mon Sep 17 00:00:00 2001
+From 7b4330bc5dd69f2b4fa8ee40919f24c910ecc0aa Mon Sep 17 00:00:00 2001
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
2.42.0


--===============5969807256642563416==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-elfutils-upgrade-0.189-0.190.patch"

RnJvbSA3ZWMzNTMxOTM2ZTA4MGNjZjYwNGFjZGQzOGM4MzJlOTExNzY5NDk2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNzowOToyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVs
ZnV0aWxzOiB1cGdyYWRlIDAuMTg5IC0+IDAuMTkwCgotLS0KIC4uLi97ZWxmdXRpbHNfMC4xODku
YmIgPT4gZWxmdXRpbHNfMC4xOTAuYmJ9ICB8ICAgMiArLQogLi4uMDAxLUFkZC1oZWxwZXItZnVu
Y3Rpb24tZm9yLWJhc2VuYW1lLnBhdGNoIHwgMTE3ICsrKysrKysrKysrKy0tLS0tLQogLi4uL2Vs
ZnV0aWxzL2ZpbGVzLzAwMDEtZHNvLWxpbmstY2hhbmdlLnBhdGNoIHwgIDEyICstCiAuLi5saWJh
c20tbWF5LWxpbmstd2l0aC1saWJiejItaWYtZm91bmQucGF0Y2ggfCAgIDYgKy0KIC4uLi1jaGVj
ay1kYXRhX2xpc3QuZGF0YS5kLmRfYnVmLWJlZm9yZS5wYXRjaCB8ICAgNiArLQogLi4uLXNraXAt
dGhlLXRlc3Qtd2hlbi1nY2Mtbm90LWRlcGxveWVkLnBhdGNoIHwgICAyICstCiAuLi5tLWNvbXBp
bGUtdGVzdF9ubGlzdC13aXRoLXN0YW5kYXJkLUMucGF0Y2ggfCAgIDYgKy0KIC4uLmFnYWluc3Qt
dXBjb21pbmctZ2NjLTE0LVdlcnJvci1jYWxsby5wYXRjaCB8ICAgNiArLQogLi4uY3Z0X2d1bmhh
c2gtaWYtZGVzdC1hbmQtc3JjLWFyZS1zYW1lLnBhdGNoIHwgICA4ICstCiAuLi4vZWxmdXRpbHMv
ZmlsZXMvMDAwMy1maXhoZWFkZXJjaGVjay5wYXRjaCAgfCAgIDYgKy0KIC4uLi9lbGZ1dGlscy9m
aWxlcy8wMDAzLW11c2wtdXRpbHMucGF0Y2ggICAgICB8ICAgNiArLQogLi4uLzAwMDYtRml4LWJ1
aWxkLW9uLWFhcmNoNjQtbXVzbC5wYXRjaCAgICAgIHwgICAyICstCiAuLi4vZWxmdXRpbHMvZmls
ZXMvcHRlc3QucGF0Y2ggICAgICAgICAgICAgICAgfCAgMTAgKy0KIDEzIGZpbGVzIGNoYW5nZWQs
IDExMyBpbnNlcnRpb25zKCspLCA3NiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZWxmdXRpbHMve2VsZnV0aWxzXzAuMTg5LmJiID0+IGVsZnV0aWxzXzAuMTkwLmJi
fSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9lbGZ1
dGlsc18wLjE4OS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9lbGZ1dGlsc18w
LjE5MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4xODkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9lbGZ1dGlscy9lbGZ1dGlsc18wLjE5MC5iYgppbmRleCAwNzZiYTQ3MzU4Li44YzU0
Yzc4ZmMxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRp
bHNfMC4xODkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2VsZnV0aWxz
XzAuMTkwLmJiCkBAIC0yNyw3ICsyNyw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9zb3VyY2V3YXJl
Lm9yZy9lbGZ1dGlscy9mdHAvJHtQVn0vJHtCUH0udGFyLmJ6MiBcCiBTUkNfVVJJOmFwcGVuZDps
aWJjLW11c2wgPSAiIFwKICAgICAgICAgICAgZmlsZTovLzAwMDMtbXVzbC11dGlscy5wYXRjaCBc
CiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzOWJkOGYxYTMzOGUyYjdjZDRh
YmMzZmYxMWEwZWRkYzZlNjkwZjY5NTc4YTU3NDc4ZDgxNzliNDE0ODcwOGM4IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjhlMDBhM2E5YjVmMDRiYzFkYzI3M2FlODYyODFkMmQyNmVkNDEyMDIwYjM5
MWZmY2MyMzE5OGYxMDIzMWQ2OTIiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGdldHRleHQgcHRlc3Qg
cGtnY29uZmlnCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy8wMDAxLUFkZC1oZWxwZXItZnVuY3Rpb24tZm9yLWJhc2VuYW1lLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtQWRkLWhlbHBlci1mdW5jdGlvbi1m
b3ItYmFzZW5hbWUucGF0Y2gKaW5kZXggM2U2MDMzZmQ3NS4uMWViMDUzYmRkNCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtQWRkLWhlbHBlci1m
dW5jdGlvbi1mb3ItYmFzZW5hbWUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vs
ZnV0aWxzL2ZpbGVzLzAwMDEtQWRkLWhlbHBlci1mdW5jdGlvbi1mb3ItYmFzZW5hbWUucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDY2NjM3MmE1ZDhkNWEyMzIwM2M3MGQ1ODM5MDQwOTdjOWU0
OWM1YTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDYxZGRhNTkwMzJhMDYyZjQ0NzRk
YmJkZjMwZGM1Njg0YmI1ZWU0YjkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0LCA5IERlYyAyMDIzIDE4OjIzOjAz
IC0wODAwCiBTdWJqZWN0OiBbUEFUQ0hdIEFkZCBoZWxwZXIgZnVuY3Rpb24gZm9yIGJhc2VuYW1l
CkBAIC0xMiwyNyArMTIsMzEgQEAgbGlicmFyaWVzIHdoaWNoIGhhdmUgUE9TSVggaW1wbGVtZW50
YXRpb24gb25seS4KIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL3NvdXJjZXdh
cmUub3JnL3BpcGVybWFpbC9lbGZ1dGlscy1kZXZlbC8yMDIzcTQvMDA2NzI3Lmh0bWxdCiBbMV0g
aHR0cHM6Ly9naXQubXVzbC1saWJjLm9yZy9jZ2l0L211c2wvY29tbWl0Lz9pZD03MjVlMTdlZDZk
ZmY0ZDBjZDIyNDg3YmI2NDQ3MDg4MWU4NmE5MmU3CiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgorCiAtLS0KICBsaWIvTWFrZWZpbGUuYW0gICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQogIGxpYi9saWJldS5oICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAxICsKLSBsaWIve2xpYmV1LmggPT4geGJhc2VuYW1lLmN9ICAgICAgICAgfCAzMSArKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tCisgbGliL3hiYXNlbmFtZS5jICAgICAgICAgICAgICAgICAg
ICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogIGxpYmR3L2R3YXJmX2dldHNy
Y19maWxlLmMgICAgICAgICAgICB8ICAzICsrLQogIGxpYmR3ZmwvY29yZS1maWxlLmMgICAgICAg
ICAgICAgICAgICB8ICAzICsrLQogIGxpYmR3ZmwvZHdmbF9tb2R1bGVfZ2V0c3JjX2ZpbGUuYyAg
ICB8ICAzICsrLQogIGxpYmR3ZmwvZHdmbF9zZWdtZW50X3JlcG9ydF9tb2R1bGUuYyB8ICAzICsr
LQotIGxpYmR3ZmwvZmluZC1kZWJ1Z2luZm8uYyAgICAgICAgICAgICB8ICA3ICsrKystLS0KKyBs
aWJkd2ZsL2ZpbmQtZGVidWdpbmZvLmMgICAgICAgICAgICAgfCAgNyArKy0tLQogIGxpYmR3Zmwv
bGlua19tYXAuYyAgICAgICAgICAgICAgICAgICB8ICAzICsrLQogIGxpYmR3ZmwvbGludXgta2Vy
bmVsLW1vZHVsZXMuYyAgICAgICB8ICAzICsrLQotIHNyYy9hZGRyMmxpbmUuYyAgICAgICAgICAg
ICAgICAgICAgICB8ICA1ICsrKy0tCi0gc3JjL2FyLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDUgKysrLS0KLSBzcmMvbm0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArKy0tCisgc3JjL2FkZHIybGluZS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKystLQor
IHNyYy9hci5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrLS0KKyBzcmMvbm0u
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KICBzcmMvc3RhY2suYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMyArKy0KICBzcmMvc3RyaXAuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQotIHRlc3RzL3Nob3ctZGllLWluZm8uYyAgICAgICAgICAgICAg
ICB8ICAyICstCi0gdGVzdHMvdmFybG9jcy5jICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
LSAxNyBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkKLSBj
b3B5IGxpYi97bGliZXUuaCA9PiB4YmFzZW5hbWUuY30gKDU3JSkKKyB0ZXN0cy9NYWtlZmlsZS5h
bSAgICAgICAgICAgICAgICAgICAgfCAgMiArLQorIHRlc3RzL3Nob3ctZGllLWluZm8uYyAgICAg
ICAgICAgICAgICB8ICAzICsrLQorIHRlc3RzL3ZhcmxvY3MuYyAgICAgICAgICAgICAgICAgICAg
ICB8ICAzICsrLQorIDE4IGZpbGVzIGNoYW5nZWQsIDczIGluc2VydGlvbnMoKyksIDIxIGRlbGV0
aW9ucygtKQorIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIveGJhc2VuYW1lLmMKIAorZGlmZiAtLWdp
dCBhL2xpYi9NYWtlZmlsZS5hbSBiL2xpYi9NYWtlZmlsZS5hbQoraW5kZXggYjNiYjkyOS4uYWRh
NTFjMCAxMDA2NDQKIC0tLSBhL2xpYi9NYWtlZmlsZS5hbQogKysrIGIvbGliL01ha2VmaWxlLmFt
CiBAQCAtMzMsNyArMzMsNyBAQCBBTV9DUFBGTEFHUyArPSAtSSQoc3JjZGlyKS8uLi9saWJlbGYK
QEAgLTQ0LDkgKzQ4LDExIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAgCQkgIGNyYzMyLmMgY3JjMzJfZmlsZS5jIFwKICAJCSAgY29sb3IuYyBlcnJvci5j
IHByaW50dmVyc2lvbi5jCiAgCitkaWZmIC0tZ2l0IGEvbGliL2xpYmV1LmggYi9saWIvbGliZXUu
aAoraW5kZXggZTg0OWE3OS4uMmExMTVhYyAxMDA2NDQKIC0tLSBhL2xpYi9saWJldS5oCiArKysg
Yi9saWIvbGliZXUuaAotQEAgLTQyLDYgKzQyLDcgQEAgZXh0ZXJuIGNoYXIgKnhzdHJuZHVwIChj
b25zdCBjaGFyICosIHNpegorQEAgLTQyLDYgKzQyLDcgQEAgZXh0ZXJuIGNoYXIgKnhzdHJuZHVw
IChjb25zdCBjaGFyICosIHNpemVfdCkgX19hdHRyaWJ1dGVfXyAoKF9fbWFsbG9jX18pKTsKICBl
eHRlcm4gY2hhciAqeGFzcHJpbnRmKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQogIAlfX2F0dHJpYnV0
ZV9fICgoZm9ybWF0IChwcmludGYsIDEsIDIpKSkgX19hdHRyaWJ1dGVfXyAoKF9fbWFsbG9jX18p
KTsKICAKQEAgLTU0LDYgKzYwLDkgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KICBleHRlcm4gdWludDMyX3QgY3JjMzIgKHVpbnQzMl90IGNyYywgdW5zaWdu
ZWQgY2hhciAqYnVmLCBzaXplX3QgbGVuKTsKICBleHRlcm4gaW50IGNyYzMyX2ZpbGUgKGludCBm
ZCwgdWludDMyX3QgKnJlc3ApOwogIAorZGlmZiAtLWdpdCBhL2xpYi94YmFzZW5hbWUuYyBiL2xp
Yi94YmFzZW5hbWUuYworbmV3IGZpbGUgbW9kZSAxMDA2NDQKK2luZGV4IDAwMDAwMDAuLjY4ZDUx
NjEKIC0tLSAvZGV2L251bGwKICsrKyBiL2xpYi94YmFzZW5hbWUuYwogQEAgLTAsMCArMSwzOSBA
QApAQCAtOTYsNiArMTA1LDggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KICsgICAgY29uc3QgY2hhciAqcCA9IHN0cnJjaHIocywgJy8nKTsKICsgICAgcmV0
dXJuIHAgPyBwKzEgOiBzOwogK30KK2RpZmYgLS1naXQgYS9saWJkdy9kd2FyZl9nZXRzcmNfZmls
ZS5jIGIvbGliZHcvZHdhcmZfZ2V0c3JjX2ZpbGUuYworaW5kZXggNTI4OWM3ZC4uZjc1YmY3YiAx
MDA2NDQKIC0tLSBhL2xpYmR3L2R3YXJmX2dldHNyY19maWxlLmMKICsrKyBiL2xpYmR3L2R3YXJm
X2dldHNyY19maWxlLmMKIEBAIC0zNyw2ICszNyw3IEBACkBAIC0xMDYsNyArMTE3LDcgQEAgU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAKICAKICBpbnQKLUBA
IC05OCw3ICs5OSw3IEBAIGR3YXJmX2dldHNyY19maWxlIChEd2FyZiAqZGJnLCBjb25zdCBjaGEK
K0BAIC05OCw3ICs5OSw3IEBAIGR3YXJmX2dldHNyY19maWxlIChEd2FyZiAqZGJnLCBjb25zdCBj
aGFyICpmbmFtZSwgaW50IGxpbmVubywgaW50IGNvbHVtbiwKICAJICAgICAgLyogTWF0Y2ggdGhl
IG5hbWUgd2l0aCB0aGUgbmFtZSB0aGUgdXNlciBwcm92aWRlZC4gICovCiAgCSAgICAgIGNvbnN0
IGNoYXIgKmZuYW1lMiA9IGxpbmUtPmZpbGVzLT5pbmZvW2xhc3RmaWxlXS5uYW1lOwogIAkgICAg
ICBpZiAoaXNfYmFzZW5hbWUpCkBAIC0xMTUsNiArMTI2LDggQEAgU2lnbmVkLW9mZi1ieTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAJICAgICAgZWxzZQogIAkJbGFzdG1hdGNoID0g
c3RyY21wIChmbmFtZTIsIGZuYW1lKSA9PSAwOwogIAkgICAgfQorZGlmZiAtLWdpdCBhL2xpYmR3
ZmwvY29yZS1maWxlLmMgYi9saWJkd2ZsL2NvcmUtZmlsZS5jCitpbmRleCA4N2M5NDBjLi41MmEz
NGI4IDEwMDY0NAogLS0tIGEvbGliZHdmbC9jb3JlLWZpbGUuYwogKysrIGIvbGliZHdmbC9jb3Jl
LWZpbGUuYwogQEAgLTI5LDYgKzI5LDcgQEAKQEAgLTEyNSw3ICsxMzgsNyBAQCBTaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogICNpbmNsdWRlICJsaWJkd2ZsUC5o
IgogICNpbmNsdWRlIDxnZWxmLmg+CiAgCi1AQCAtNTk1LDcgKzU5Niw3IEBAIGR3ZmxfY29yZV9m
aWxlX3JlcG9ydCAoRHdmbCAqZHdmbCwgRWxmICoKK0BAIC01OTUsNyArNTk2LDcgQEAgZHdmbF9j
b3JlX2ZpbGVfcmVwb3J0IChEd2ZsICpkd2ZsLCBFbGYgKmVsZiwgY29uc3QgY2hhciAqZXhlY3V0
YWJsZSkKICAgICAgICBpZiAoISBfX2xpYmR3ZmxfZHluYW1pY192YWRkcl9nZXQgKG1vZHVsZS0+
ZWxmLCAmZmlsZV9keW5hbWljX3ZhZGRyKSkKICAJY29udGludWU7CiAgICAgICAgRHdmbF9Nb2R1
bGUgKm1vZDsKQEAgLTEzNCw2ICsxNDcsOCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFq
LmtoZW1AZ21haWwuY29tPgogIAkJCQkgIG1vZHVsZS0+ZmQsIG1vZHVsZS0+ZWxmLAogIAkJCQkg
IG1vZHVsZS0+bF9sZCAtIGZpbGVfZHluYW1pY192YWRkciwKICAJCQkJICB0cnVlLCB0cnVlKTsK
K2RpZmYgLS1naXQgYS9saWJkd2ZsL2R3ZmxfbW9kdWxlX2dldHNyY19maWxlLmMgYi9saWJkd2Zs
L2R3ZmxfbW9kdWxlX2dldHNyY19maWxlLmMKK2luZGV4IDUxM2FmNmIuLjA0MThhMjYgMTAwNjQ0
CiAtLS0gYS9saWJkd2ZsL2R3ZmxfbW9kdWxlX2dldHNyY19maWxlLmMKICsrKyBiL2xpYmR3Zmwv
ZHdmbF9tb2R1bGVfZ2V0c3JjX2ZpbGUuYwogQEAgLTMxLDYgKzMxLDcgQEAKQEAgLTE0NCw3ICsx
NTksNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogICNp
bmNsdWRlICJsaWJkd1AuaCIKICAKICAKLUBAIC0xMDMsNyArMTA0LDcgQEAgZHdmbF9tb2R1bGVf
Z2V0c3JjX2ZpbGUgKER3ZmxfTW9kdWxlICptbworQEAgLTEwMyw3ICsxMDQsNyBAQCBkd2ZsX21v
ZHVsZV9nZXRzcmNfZmlsZSAoRHdmbF9Nb2R1bGUgKm1vZCwKICAJCXsKICAJCSAgLyogTWF0Y2gg
dGhlIG5hbWUgd2l0aCB0aGUgbmFtZSB0aGUgdXNlciBwcm92aWRlZC4gICovCiAgCQkgIGxhc3Rm
aWxlID0gZmlsZTsKQEAgLTE1Myw2ICsxNjgsOCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogIAkJCQkgICAgICAgZm5hbWUpOwogIAkJfQogIAkgICAgfQor
ZGlmZiAtLWdpdCBhL2xpYmR3ZmwvZHdmbF9zZWdtZW50X3JlcG9ydF9tb2R1bGUuYyBiL2xpYmR3
ZmwvZHdmbF9zZWdtZW50X3JlcG9ydF9tb2R1bGUuYworaW5kZXggM2VmNjJhNy4uMTU2MjFhZCAx
MDA2NDQKIC0tLSBhL2xpYmR3ZmwvZHdmbF9zZWdtZW50X3JlcG9ydF9tb2R1bGUuYwogKysrIGIv
bGliZHdmbC9kd2ZsX3NlZ21lbnRfcmVwb3J0X21vZHVsZS5jCiBAQCAtMjksNiArMjksNyBAQApA
QCAtMTYzLDcgKzE4MCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAgI2luY2x1ZGUgImxpYmR3ZmxQLmgiCiAgI2luY2x1ZGUgImNvbW1vbi5oIgogIAot
QEAgLTcxOCw3ICs3MTksNyBAQCBkd2ZsX3NlZ21lbnRfcmVwb3J0X21vZHVsZSAoRHdmbCAqZHdm
bCwKK0BAIC03MTgsNyArNzE5LDcgQEAgZHdmbF9zZWdtZW50X3JlcG9ydF9tb2R1bGUgKER3Zmwg
KmR3ZmwsIGludCBuZHgsIGNvbnN0IGNoYXIgKm5hbWUsCiAgCSAgICAgIGJpYXMgKz0gZml4dXA7
CiAgCSAgICAgIGlmIChtb2R1bGUtPm5hbWVbMF0gIT0gJ1wwJykKICAJCXsKQEAgLTE3Miw2ICsx
ODksOCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAkJ
ICBuYW1lX2lzX2ZpbmFsID0gdHJ1ZTsKICAJCX0KICAJICAgICAgYnJlYWs7CitkaWZmIC0tZ2l0
IGEvbGliZHdmbC9maW5kLWRlYnVnaW5mby5jIGIvbGliZHdmbC9maW5kLWRlYnVnaW5mby5jCitp
bmRleCA3ZjdhYjYzLi42YWFiMWE0IDEwMDY0NAogLS0tIGEvbGliZHdmbC9maW5kLWRlYnVnaW5m
by5jCiArKysgYi9saWJkd2ZsL2ZpbmQtZGVidWdpbmZvLmMKIEBAIC0zMSw2ICszMSw3IEBACkBA
IC0xODIsNyArMjAxLDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KICAjaW5jbHVkZSA8c3RkaW8uaD4KICAjaW5jbHVkZSA8ZmNudGwuaD4KICAjaW5jbHVk
ZSA8c3lzL3N0YXQuaD4KLUBAIC0xNjQsNyArMTY1LDcgQEAgZmluZF9kZWJ1Z2luZm9faW5fcGF0
aCAoRHdmbF9Nb2R1bGUgKm1vZAorQEAgLTE2NCw3ICsxNjUsNyBAQCBmaW5kX2RlYnVnaW5mb19p
bl9wYXRoIChEd2ZsX01vZHVsZSAqbW9kLCBjb25zdCBjaGFyICpmaWxlX25hbWUsCiAgewogICAg
Ym9vbCBjYW5jaGVjayA9IGRlYnVnbGlua19jcmMgIT0gKEdFbGZfV29yZCkgMDsKICAKQEAgLTE5
MSw3ICsyMTAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogICAgY2hhciAqbG9jYWxuYW1lID0gTlVMTDsKICAKICAgIC8qIFdlIGludmVudCBhIGRlYnVn
bGluayAuZGVidWcgbmFtZSBpZiBOVUxMLCBidXQgdGhlbiB3YW50IHRvIHRyeSB0aGUKLUBAIC0y
NzgsNyArMjc5LDcgQEAgZmluZF9kZWJ1Z2luZm9faW5fcGF0aCAoRHdmbF9Nb2R1bGUgKm1vZAor
QEAgLTI3OCw3ICsyNzksNyBAQCBmaW5kX2RlYnVnaW5mb19pbl9wYXRoIChEd2ZsX01vZHVsZSAq
bW9kLCBjb25zdCBjaGFyICpmaWxlX25hbWUsCiAgCSAgZWxzZQogIAkgICAgewogIAkgICAgICBz
dWJkaXIgPSBOVUxMOwpAQCAtMjAwLDcgKzIxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCSAgICB9CiAgCSAgdHJ5X2ZpbGVfYmFzZW5hbWUgPSBk
ZWJ1Z2xpbmtfbnVsbDsKICAJICBicmVhazsKLUBAIC0zMDYsNyArMzA3LDcgQEAgZmluZF9kZWJ1
Z2luZm9faW5fcGF0aCAoRHdmbF9Nb2R1bGUgKm1vZAorQEAgLTMwNiw3ICszMDcsNyBAQCBmaW5k
X2RlYnVnaW5mb19pbl9wYXRoIChEd2ZsX01vZHVsZSAqbW9kLCBjb25zdCBjaGFyICpmaWxlX25h
bWUsCiAgCSAgICBpZiAobW9kLT5kdyAhPSBOVUxMICYmIChwWzBdID09ICdcMCcgfHwgcFswXSA9
PSAnLycpKQogIAkgICAgICB7CiAgCQlmZCA9IHRyeV9vcGVuICgmbWFpbl9zdGF0LCBkaXIsICIu
ZHd6IiwKQEAgLTIwOSw2ICsyMjgsOCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogIAkJaWYgKGZkIDwgMCkKICAJCSAgewogIAkJICAgIGlmIChlcnJubyAh
PSBFTk9FTlQgJiYgZXJybm8gIT0gRU5PVERJUikKK2RpZmYgLS1naXQgYS9saWJkd2ZsL2xpbmtf
bWFwLmMgYi9saWJkd2ZsL2xpbmtfbWFwLmMKK2luZGV4IDc2ZjIzMzUuLmNkYWE3ZWQgMTAwNjQ0
CiAtLS0gYS9saWJkd2ZsL2xpbmtfbWFwLmMKICsrKyBiL2xpYmR3ZmwvbGlua19tYXAuYwogQEAg
LTI5LDYgKzI5LDcgQEAKQEAgLTIxOSw3ICsyNDAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogICNpbmNsdWRlICJtZW1vcnktYWNjZXNzLmgiCiAgI2lu
Y2x1ZGUgInN5c3RlbS5oIgogIAotQEAgLTQ2OSw3ICs0NzAsNyBAQCByZXBvcnRfcl9kZWJ1ZyAo
dWludF9mYXN0OF90IGVsZmNsYXNzLCB1CitAQCAtNDc1LDcgKzQ3Niw3IEBAIHJlcG9ydF9yX2Rl
YnVnICh1aW50X2Zhc3Q4X3QgZWxmY2xhc3MsIHVpbnRfZmFzdDhfdCBlbGZkYXRhLAogIAkJICAg
ICAgaWYgKHJfZGVidWdfaW5mb19tb2R1bGUgPT0gTlVMTCkKICAJCQl7CiAgCQkJICAvLyBYWFgg
aG9vayBmb3Igc3lzcm9vdApAQCAtMjI4LDYgKzI0OSw4IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCQkJCQkJICAgICAgbmFtZSwgZmQsIGVsZiwgYmFz
ZSwKICAJCQkJCQkgICAgICB0cnVlLCB0cnVlKTsKICAJCQkgIGlmIChtb2QgIT0gTlVMTCkKK2Rp
ZmYgLS1naXQgYS9saWJkd2ZsL2xpbnV4LWtlcm5lbC1tb2R1bGVzLmMgYi9saWJkd2ZsL2xpbnV4
LWtlcm5lbC1tb2R1bGVzLmMKK2luZGV4IDU4YzBjNDEuLmJkYmRlODMgMTAwNjQ0CiAtLS0gYS9s
aWJkd2ZsL2xpbnV4LWtlcm5lbC1tb2R1bGVzLmMKICsrKyBiL2xpYmR3ZmwvbGludXgta2VybmVs
LW1vZHVsZXMuYwogQEAgLTQwLDYgKzQwLDcgQEAKQEAgLTIzOCw3ICsyNjEsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogICNpbmNsdWRlICJsaWJkd2Zs
UC5oIgogICNpbmNsdWRlIDxpbnR0eXBlcy5oPgogICNpbmNsdWRlIDxlcnJuby5oPgotQEAgLTEx
Niw3ICsxMTcsNyBAQCB0cnlfa2VybmVsX25hbWUgKER3ZmwgKmR3ZmwsIGNoYXIgKipmbmFtCitA
QCAtMTE2LDcgKzExNyw3IEBAIHRyeV9rZXJuZWxfbmFtZSAoRHdmbCAqZHdmbCwgY2hhciAqKmZu
YW1lLCBib29sIHRyeV9kZWJ1ZykKICAJLyogVHJ5IHRoZSBmaWxlJ3MgdW5hZG9ybmVkIGJhc2Vu
YW1lIGFzIERFQlVHTElOS19GSUxFLAogIAkgICB0byBsb29rIG9ubHkgZm9yICJ2bWxpbnV4IiBm
aWxlcy4gICovCiAgCWZkID0gSU5UVVNFKGR3Zmxfc3RhbmRhcmRfZmluZF9kZWJ1Z2luZm8pICgm
ZmFrZW1vZCwgTlVMTCwgTlVMTCwgMCwKQEAgLTI0Nyw2ICsyNzAsOCBAQCBTaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAkJCQkJCSAgIDAsICZmYWtlbW9kLmRl
YnVnLm5hbWUpOwogIAogICAgICAgIGlmIChmYWtlbW9kLmRlYnVnLm5hbWUgIT0gTlVMTCkKK2Rp
ZmYgLS1naXQgYS9zcmMvYWRkcjJsaW5lLmMgYi9zcmMvYWRkcjJsaW5lLmMKK2luZGV4IGQ5MDJk
NzkuLjUzNDUxODkgMTAwNjQ0CiAtLS0gYS9zcmMvYWRkcjJsaW5lLmMKICsrKyBiL3NyYy9hZGRy
MmxpbmUuYwogQEAgLTM4LDYgKzM4LDcgQEAKQEAgLTI1Nyw3ICsyODIsNyBAQCBTaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAogIAogIC8qIE5hbWUgYW5kIHZl
cnNpb24gb2YgcHJvZ3JhbS4gICovCi1AQCAtMzg1LDcgKzM4Niw3IEBAIHByaW50X2R3YXJmX2Z1
bmN0aW9uIChEd2ZsX01vZHVsZSAqbW9kLAorQEAgLTM4NSw3ICszODYsNyBAQCBwcmludF9kd2Fy
Zl9mdW5jdGlvbiAoRHdmbF9Nb2R1bGUgKm1vZCwgRHdhcmZfQWRkciBhZGRyKQogIAkJICBpZiAo
ZmlsZSA9PSBOVUxMKQogIAkJICAgIGZpbGUgPSAiPz8/IjsKICAJCSAgZWxzZSBpZiAob25seV9i
YXNlbmFtZXMpCkBAIC0yNjYsNyArMjkxLDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KICAJCSAgZWxzZSBpZiAodXNlX2NvbXBfZGlyICYmIGZpbGVbMF0g
IT0gJy8nKQogIAkJICAgIHsKICAJCSAgICAgIGNvbnN0IGNoYXIgKmNvbnN0ICpkaXJzOwotQEAg
LTU2OCw3ICs1NjksNyBAQCBwcmludF9zcmMgKGNvbnN0IGNoYXIgKnNyYywgaW50IGxpbmVubywK
K0BAIC01NjgsNyArNTY5LDcgQEAgcHJpbnRfc3JjIChjb25zdCBjaGFyICpzcmMsIGludCBsaW5l
bm8sIGludCBsaW5lY29sLCBEd2FyZl9EaWUgKmN1KQogICAgY29uc3QgY2hhciAqY29tcF9kaXJf
c2VwID0gIiI7CiAgCiAgICBpZiAob25seV9iYXNlbmFtZXMpCkBAIC0yNzUsNiArMzAwLDggQEAg
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAgIGVsc2UgaWYg
KHVzZV9jb21wX2RpciAmJiBzcmNbMF0gIT0gJy8nKQogICAgICB7CiAgICAgICAgRHdhcmZfQXR0
cmlidXRlIGF0dHI7CitkaWZmIC0tZ2l0IGEvc3JjL2FyLmMgYi9zcmMvYXIuYworaW5kZXggM2Jj
YjE4Zi4uOGYyZGNkMCAxMDA2NDQKIC0tLSBhL3NyYy9hci5jCiArKysgYi9zcmMvYXIuYwogQEAg
LTQyLDYgKzQyLDcgQEAKQEAgLTI4NSw3ICszMTIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAogIAogIC8qIE5hbWUgYW5kIHZlcnNpb24gb2YgcHJv
Z3JhbS4gICovCi1AQCAtMTEzMyw3ICsxMTM0LDcgQEAgZG9fb3Blcl9pbnNlcnQgKGludCBvcGVy
LCBjb25zdCBjaGFyICphcgorQEAgLTExMzMsNyArMTEzNCw3IEBAIGRvX29wZXJfaW5zZXJ0IChp
bnQgb3BlciwgY29uc3QgY2hhciAqYXJmbmFtZSwgY2hhciAqKmFyZ3YsIGludCBhcmdjLAogICAg
ICAgIGZvciAoaW50IGNudCA9IDA7IGNudCA8IGFyZ2M7ICsrY250KQogIAl7CiAgCSAgRU5UUlkg
ZW50cnk7CkBAIC0yOTQsNyArMzIxLDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KICAJICBlbnRyeS5kYXRhID0gJmFyZ3ZbY250XTsKICAJICBpZiAoaHNl
YXJjaCAoZW50cnksIEVOVEVSKSA9PSBOVUxMKQogIAkgICAgZXJyb3JfZXhpdCAoZXJybm8sIF8o
ImNhbm5vdCBpbnNlcnQgaW50byBoYXNoIHRhYmxlIikpOwotQEAgLTEyNDIsNyArMTI0Myw3IEBA
IGRvX29wZXJfaW5zZXJ0IChpbnQgb3BlciwgY29uc3QgY2hhciAqYXIKK0BAIC0xMjQyLDcgKzEy
NDMsNyBAQCBkb19vcGVyX2luc2VydCAoaW50IG9wZXIsIGNvbnN0IGNoYXIgKmFyZm5hbWUsIGNo
YXIgKiphcmd2LCBpbnQgYXJnYywKICAgICAgICAvKiBPcGVuIGFsbCB0aGUgbmV3IGZpbGVzLCBn
ZXQgdGhlaXIgc2l6ZXMgYW5kIGFkZCBhbGwgc3ltYm9scy4gICovCiAgICAgICAgZm9yIChpbnQg
Y250ID0gMDsgY250IDwgYXJnYzsgKytjbnQpCiAgCXsKQEAgLTMwMyw5ICszMzAsMTEgQEAgU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAJICBzaXplX3QgYm5h
bWVsZW4gPSBzdHJsZW4gKGJuYW1lKTsKICAJICBpZiAoZm91bmRbY250XSA9PSBOVUxMKQogIAkg
ICAgeworZGlmZiAtLWdpdCBhL3NyYy9ubS5jIGIvc3JjL25tLmMKK2luZGV4IGZiZGVlOGUuLjM2
NzVmNTkgMTAwNjQ0CiAtLS0gYS9zcmMvbm0uYwogKysrIGIvc3JjL25tLmMKLUBAIC0xNDE3LDcg
KzE0MTcsNyBAQCBzaG93X3N5bWJvbHMgKGludCBmZCwgRWJsICplYmwsIEdFbGZfRWhkCitAQCAt
MTQxNyw3ICsxNDE3LDcgQEAgc2hvd19zeW1ib2xzIChpbnQgZmQsIEVibCAqZWJsLCBHRWxmX0Vo
ZHIgKmVoZHIsCiAgCQkJICBpbnQgbGluZW5vOwogIAkJCSAgKHZvaWQpIGR3YXJmX2xpbmVubyAo
bGluZSwgJmxpbmVubyk7CiAgCQkJICBjb25zdCBjaGFyICpmaWxlID0gZHdhcmZfbGluZXNyYyAo
bGluZSwgTlVMTCwgTlVMTCk7CkBAIC0zMTQsNyArMzQzLDcgQEAgU2lnbmVkLW9mZi1ieTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAJCQkgIGludCBuOwogIAkJCSAgbiA9IG9ic3Rh
Y2tfcHJpbnRmICgmd2hlcmVvYiwgIiVzOiVkJWMiLCBmaWxlLAogIAkJCQkJICAgICAgbGluZW5v
LCAnXDAnKTsKLUBAIC0xNDQ4LDcgKzE0NDgsNyBAQCBzaG93X3N5bWJvbHMgKGludCBmZCwgRWJs
ICplYmwsIEdFbGZfRWhkCitAQCAtMTQ0OCw3ICsxNDQ4LDcgQEAgc2hvd19zeW1ib2xzIChpbnQg
ZmQsIEVibCAqZWJsLCBHRWxmX0VoZHIgKmVoZHIsCiAgCQl7CiAgCQkgIC8qIFdlIGZvdW5kIHRo
ZSBsaW5lLiAgKi8KICAJCSAgaW50IG4gPSBvYnN0YWNrX3ByaW50ZiAoJndoZXJlb2IsICIlczol
IiBQUkl1NjQgIiVjIiwKQEAgLTMyMyw2ICszNTIsOCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAkJCQkJICAoKmZvdW5kKS0+bGluZW5vLAogIAkJCQkJ
ICAnXDAnKTsKICAJCSAgc3ltX21lbVtuZW50cmllc191c2VkXS53aGVyZSA9IG9ic3RhY2tfZmlu
aXNoICgmd2hlcmVvYik7CitkaWZmIC0tZ2l0IGEvc3JjL3N0YWNrLmMgYi9zcmMvc3RhY2suYwor
aW5kZXggNTM0YWE5My4uM2FiZWY5OCAxMDA2NDQKIC0tLSBhL3NyYy9zdGFjay5jCiArKysgYi9z
cmMvc3RhY2suYwogQEAgLTMxLDYgKzMxLDcgQEAKQEAgLTMzMyw3ICszNjQsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIC8qIE5hbWUgYW5kIHZlcnNp
b24gb2YgcHJvZ3JhbS4gICovCiAgQVJHUF9QUk9HUkFNX1ZFUlNJT05fSE9PS19ERUYgPSBwcmlu
dF92ZXJzaW9uOwogIAotQEAgLTE1Miw3ICsxNTMsNyBAQCBtb2R1bGVfY2FsbGJhY2sgKER3Zmxf
TW9kdWxlICptb2QsIHZvaWQKK0BAIC0xNTIsNyArMTUzLDcgQEAgbW9kdWxlX2NhbGxiYWNrIChE
d2ZsX01vZHVsZSAqbW9kLCB2b2lkICoqdXNlcmRhdGEgX19hdHRyaWJ1dGVfXygodW51c2VkKSks
CiAgCiAgICBpbnQgd2lkdGggPSBnZXRfYWRkcl93aWR0aCAobW9kKTsKICAgIHByaW50ZiAoIjB4
JTAqIiBQUkl4NjQgIi0weCUwKiIgUFJJeDY0ICIgJXNcbiIsCkBAIC0zNDIsOSArMzczLDExIEBA
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCiAgICBjb25z
dCB1bnNpZ25lZCBjaGFyICppZDsKICAgIEdFbGZfQWRkciBpZF92YWRkcjsKK2RpZmYgLS1naXQg
YS9zcmMvc3RyaXAuYyBiL3NyYy9zdHJpcC5jCitpbmRleCA3ZjQ3ODhiLi42NDM2NDQzIDEwMDY0
NAogLS0tIGEvc3JjL3N0cmlwLmMKICsrKyBiL3NyYy9zdHJpcC5jCi1AQCAtMTgwNyw3ICsxODA3
LDcgQEAgaGFuZGxlX2VsZiAoaW50IGZkLCBFbGYgKmVsZiwgY29uc3QgY2hhcgorQEAgLTE4MDAs
NyArMTgwMCw3IEBAIGhhbmRsZV9lbGYgKGludCBmZCwgRWxmICplbGYsIGNvbnN0IGNoYXIgKnBy
ZWZpeCwgY29uc3QgY2hhciAqZm5hbWUsCiAgCQkgICAgICBlbGZfZXJybXNnICgtMSkpOwogIAl9
CiAgCkBAIC0zNTMsNiArMzg2LDIxIEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiAgICAgICAgb2ZmX3QgY3JjX29mZnNldCA9IHN0cmxlbiAoZGVidWdfYmFz
ZW5hbWUpICsgMTsKICAgICAgICAvKiBBbGlnbiB0byA0IGJ5dGUgYm91bmRhcnkgKi8KICAgICAg
ICBjcmNfb2Zmc2V0ID0gKChjcmNfb2Zmc2V0IC0gMSkgJiB+MykgKyA0OworZGlmZiAtLWdpdCBh
L3Rlc3RzL01ha2VmaWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0KK2luZGV4IDc5MTA1ZjIuLjQz
ZWY2ZDkgMTAwNjQ0CistLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQorKysrIGIvdGVzdHMvTWFrZWZp
bGUuYW0KK0BAIC03MDUsNyArNzA1LDcgQEAgdXBkYXRlMV9MREFERCA9ICQobGliZWxmKQorIHVw
ZGF0ZTJfTERBREQgPSAkKGxpYmVsZikKKyB1cGRhdGUzX0xEQUREID0gJChsaWJkdykgJChsaWJl
bGYpCisgdXBkYXRlNF9MREFERCA9ICQobGliZHcpICQobGliZWxmKQorLXNob3dfZGllX2luZm9f
TERBREQgPSAkKGxpYmR3KSAkKGxpYmVsZikKKytzaG93X2RpZV9pbmZvX0xEQUREID0gJChsaWJl
dSkgJChsaWJkdykgJChsaWJlbGYpCisgZ2V0X3B1Ym5hbWVzX0xEQUREID0gJChsaWJkdykgJChs
aWJlbGYpCisgc2hvd19hYmJyZXZfTERBREQgPSAkKGxpYmR3KSAkKGxpYmVsZikKKyBnZXRfbGlu
ZXNfTERBREQgPSAkKGxpYmR3KSAkKGxpYmVsZikKK2RpZmYgLS1naXQgYS90ZXN0cy9zaG93LWRp
ZS1pbmZvLmMgYi90ZXN0cy9zaG93LWRpZS1pbmZvLmMKK2luZGV4IDFhMzE5MWMuLjAwYTY2NTcg
MTAwNjQ0CiAtLS0gYS90ZXN0cy9zaG93LWRpZS1pbmZvLmMKICsrKyBiL3Rlc3RzL3Nob3ctZGll
LWluZm8uYwogQEAgLTI2LDYgKzI2LDcgQEAKQEAgLTM3Miw2ICs0MjAsOCBAQCBTaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAogICAgICAgIGRiZyA9IGR3YXJm
X2JlZ2luIChmZCwgRFdBUkZfQ19SRUFEKTsKICAgICAgICBpZiAoZGJnID09IE5VTEwpCitkaWZm
IC0tZ2l0IGEvdGVzdHMvdmFybG9jcy5jIGIvdGVzdHMvdmFybG9jcy5jCitpbmRleCA4ZTU2M2Zk
Li43MmM2NGUyIDEwMDY0NAogLS0tIGEvdGVzdHMvdmFybG9jcy5jCiArKysgYi90ZXN0cy92YXJs
b2NzLmMKIEBAIC0zMyw2ICszMyw3IEBACkBAIC0zOTEsMTQgKzQ0MSwzIEBAIFNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCSAgcHJpbnRmICgibW9kdWxlICcl
cydcbiIsIG5hbWUpOwogIAkgIHByaW50X2RpZSAoJmN1ZGllLCAiQ1UiLCAwKTsKICAKLS0tLSBh
L3Rlc3RzL01ha2VmaWxlLmFtCi0rKysgYi90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTY5Miw3ICs2
OTIsNyBAQCB1cGRhdGUxX0xEQUREID0gJChsaWJlbGYpCi0gdXBkYXRlMl9MREFERCA9ICQobGli
ZWxmKQotIHVwZGF0ZTNfTERBREQgPSAkKGxpYmR3KSAkKGxpYmVsZikKLSB1cGRhdGU0X0xEQURE
ID0gJChsaWJkdykgJChsaWJlbGYpCi0tc2hvd19kaWVfaW5mb19MREFERCA9ICQobGliZHcpICQo
bGliZWxmKQotK3Nob3dfZGllX2luZm9fTERBREQgPSAkKGxpYmV1KSAkKGxpYmR3KSAkKGxpYmVs
ZikKLSBnZXRfcHVibmFtZXNfTERBREQgPSAkKGxpYmR3KSAkKGxpYmVsZikKLSBzaG93X2FiYnJl
dl9MREFERCA9ICQobGliZHcpICQobGliZWxmKQotIGdldF9saW5lc19MREFERCA9ICQobGliZHcp
ICQobGliZWxmKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2Zp
bGVzLzAwMDEtZHNvLWxpbmstY2hhbmdlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vs
ZnV0aWxzL2ZpbGVzLzAwMDEtZHNvLWxpbmstY2hhbmdlLnBhdGNoCmluZGV4IDZhY2MwMzY0MDYu
LjY1NGMyNmU3MjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy8wMDAxLWRzby1saW5rLWNoYW5nZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1kc28tbGluay1jaGFuZ2UucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIGM1ZmI1OWFjMDgxOWI1YjZkODI0NGM2MTNjYmNmOTJjYjA5ODQwYzEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJlNTFiMGUxYmJlZjUzMzJhYjc0ZWIxZTgyMjQyMTFl
MDMzNmQ0NTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25n
eHUuamlhQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE1IEF1ZyAyMDE3IDE3OjEwOjU3ICsw
ODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGRzbyBsaW5rIGNoYW5nZQpAQCAtMjMsMTEgKzIzLDExIEBA
IFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL3NyYy9NYWtlZmlsZS5hbSBiL3NyYy9NYWtlZmlsZS5hbQotaW5kZXggODhkMGFjOC4u
YzI4ZDgxZiAxMDA2NDQKK2luZGV4IGQzZDlkNDAuLmVhNjE2MTYgMTAwNjQ0CiAtLS0gYS9zcmMv
TWFrZWZpbGUuYW0KICsrKyBiL3NyYy9NYWtlZmlsZS5hbQogQEAgLTQ1LDcgKzQ1LDcgQEAgbGli
ZHcgPSAuLi9saWJkdy9saWJkdy5hIC1seiAkKHppcF9MSUJTKSAkKGxpYmVsZikgLWxkbCAtbHB0
aHJlYWQKLSBsaWJlbGYgPSAuLi9saWJlbGYvbGliZWxmLmEgLWx6CisgbGliZWxmID0gLi4vbGli
ZWxmL2xpYmVsZi5hIC1seiAkKHpzdGRfTElCUykKICBlbHNlCiAgbGliYXNtID0gLi4vbGliYXNt
L2xpYmFzbS5zbwogLWxpYmR3ID0gLi4vbGliZHcvbGliZHcuc28KQEAgLTM2LDExICszNiwxMSBA
QCBpbmRleCA4OGQwYWM4Li5jMjhkODFmIDEwMDY0NAogIGVuZGlmCiAgbGliZWJsID0gLi4vbGli
ZWJsL2xpYmVibC5hIC4uL2JhY2tlbmRzL2xpYmVibF9iYWNrZW5kcy5hIC4uL2xpYmNwdS9saWJj
cHUuYQogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2VmaWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0K
LWluZGV4IGMxNDU3MjAuLjcyYWZkMGUgMTAwNjQ0CitpbmRleCA3ZmI4ZWZiLi43MWMxYTYxIDEw
MDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0KICsrKyBiL3Rlc3RzL01ha2VmaWxlLmFtCi1A
QCAtNTU0LDcgKzU1NCw3IEBAIGxpYmR3ID0gLi4vbGliZHcvbGliZHcuYSAtbHogJCh6aXBfTElC
UykgJChsaWJlbGYpICQobGliZWJsKSAtbGRsIC1scHRocmVhZAotIGxpYmVsZiA9IC4uL2xpYmVs
Zi9saWJlbGYuYSAtbHoKK0BAIC02ODAsNyArNjgwLDcgQEAgbGliZHcgPSAuLi9saWJkdy9saWJk
dy5hIC1seiAkKHppcF9MSUJTKSAkKGxpYmVsZikgJChsaWJlYmwpIC1sZGwgLWxwdGhyZWFkCisg
bGliZWxmID0gLi4vbGliZWxmL2xpYmVsZi5hIC1seiAkKHpzdGRfTElCUykKICBsaWJhc20gPSAu
Li9saWJhc20vbGliYXNtLmEKICBlbHNlCiAtbGliZHcgPSAuLi9saWJkdy9saWJkdy5zbwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtbGliYXNt
LW1heS1saW5rLXdpdGgtbGliYnoyLWlmLWZvdW5kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtbGliYXNtLW1heS1saW5rLXdpdGgtbGliYnoyLWlmLWZv
dW5kLnBhdGNoCmluZGV4IDA5YzlkM2VhMjQuLjc2YjNmOGJjYzggMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWxpYmFzbS1tYXktbGluay13aXRo
LWxpYmJ6Mi1pZi1mb3VuZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRp
bHMvZmlsZXMvMDAwMS1saWJhc20tbWF5LWxpbmstd2l0aC1saWJiejItaWYtZm91bmQucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGVkMTk3NWRlZWFhNDdmOThkMjEyZmQxNDRjOGJkYTA3NWIx
YTVkMzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJlZmY4ZTU3MTg3Y2ZlY2MyZjg3
ZDIzMDNmMGNhYWMzMjM5NmQ4MmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCA0IE9jdCAyMDE3IDIyOjMwOjQ2
IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYmFzbSBtYXkgbGluayB3aXRoIGxpYmJ6MiBpZiBm
b3VuZApAQCAtMTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvTWFrZWZpbGUuYW0gYi9zcmMvTWFrZWZpbGUuYW0KLWlu
ZGV4IGMyOGQ4MWYuLjk1MWU5NzggMTAwNjQ0CitpbmRleCBlYTYxNjE2Li5iYzY1NzNmIDEwMDY0
NAogLS0tIGEvc3JjL01ha2VmaWxlLmFtCiArKysgYi9zcmMvTWFrZWZpbGUuYW0KIEBAIC00MCwx
MSArNDAsMTEgQEAgRVhUUkFfRElTVCArPSBtYWtlLWRlYnVnLWFyY2hpdmUuaW4KQEAgLTI3LDcg
KzI3LDcgQEAgaW5kZXggYzI4ZDgxZi4uOTUxZTk3OCAxMDA2NDQKIC1saWJhc20gPSAuLi9saWJh
c20vbGliYXNtLmEKICtsaWJhc20gPSAuLi9saWJhc20vbGliYXNtLmEgJCh6aXBfTElCUykKICBs
aWJkdyA9IC4uL2xpYmR3L2xpYmR3LmEgLWx6ICQoemlwX0xJQlMpICQobGliZWxmKSAtbGRsIC1s
cHRocmVhZAotIGxpYmVsZiA9IC4uL2xpYmVsZi9saWJlbGYuYSAtbHoKKyBsaWJlbGYgPSAuLi9s
aWJlbGYvbGliZWxmLmEgLWx6ICQoenN0ZF9MSUJTKQogIGVsc2UKIC1saWJhc20gPSAuLi9saWJh
c20vbGliYXNtLnNvCiArbGliYXNtID0gLi4vbGliYXNtL2xpYmFzbS5zbyAkKHppcF9MSUJTKQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtbGli
ZWxmLWVsZl9lbmQuYy1jaGVjay1kYXRhX2xpc3QuZGF0YS5kLmRfYnVmLWJlZm9yZS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWxpYmVsZi1lbGZfZW5k
LmMtY2hlY2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUucGF0Y2gKaW5kZXggYzhkNTVk
NTgzYS4uMGM3Njg0Njg3YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0
aWxzL2ZpbGVzLzAwMDEtbGliZWxmLWVsZl9lbmQuYy1jaGVjay1kYXRhX2xpc3QuZGF0YS5kLmRf
YnVmLWJlZm9yZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmls
ZXMvMDAwMS1saWJlbGYtZWxmX2VuZC5jLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYtYmVm
b3JlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmNDBjYmQ0M2FjZGIxZmVmZWY0ZmE1M2E2
MDM0Mjk2ZDgzY2JmZjdkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjMTRlM2FiNzVh
ZDIwOTY3MzRjYjA3NTJlNzQ1M2EzNGIxZDNiYjc1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUs
IDE2IEF1ZyAyMDE4IDA5OjU4OjI2ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxpYmVsZi9lbGZf
ZW5kLmM6IGNoZWNrIGRhdGFfbGlzdC5kYXRhLmQuZF9idWYgYmVmb3JlIGZyZWUgaXQKQEAgLTIw
LDEwICsyMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgWWFuZyA8bGllemhpLnlhbmdAd2lu
ZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvbGliZWxmL2VsZl9lbmQuYyBiL2xpYmVsZi9lbGZfZW5kLmMK
LWluZGV4IDE2MGYwYjguLjUyODBhNzAgMTAwNjQ0CitpbmRleCA4MGY0ZDEzLi5iMTAzOTU5IDEw
MDY0NAogLS0tIGEvbGliZWxmL2VsZl9lbmQuYwogKysrIGIvbGliZWxmL2VsZl9lbmQuYwotQEAg
LTE2MCwxNCArMTYwLDE2IEBAIGVsZl9lbmQgKEVsZiAqZWxmKQorQEAgLTE2OSwxNCArMTY5LDE2
IEBAIGVsZl9lbmQgKEVsZiAqZWxmKQogIAkJICAgYXJjaGl0ZWN0dXJlIGRvZXNuJ3QgcmVxdWly
ZSBvdmVybHkgc3RyaW5nZW50CiAgCQkgICBhbGlnbm1lbnQgdGhlIHJhdyBkYXRhIGJ1ZmZlciBp
cyB0aGUgc2FtZSBhcyB0aGUKICAJCSAgIG9uZSB1c2VkIGZvciBwcmVzZW50aW5nIHRvIHRoZSBj
YWxsZXIuICAqLwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2Zp
bGVzLzAwMDEtc2tpcC10aGUtdGVzdC13aGVuLWdjYy1ub3QtZGVwbG95ZWQucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1za2lwLXRoZS10ZXN0LXdoZW4t
Z2NjLW5vdC1kZXBsb3llZC5wYXRjaAppbmRleCAwZTZiZjU1NzNjLi5iMzkxNGU0YTI5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1za2lwLXRo
ZS10ZXN0LXdoZW4tZ2NjLW5vdC1kZXBsb3llZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1za2lwLXRoZS10ZXN0LXdoZW4tZ2NjLW5vdC1kZXBs
b3llZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmZhNTJkNjFiMWFiZGY0YTNmM2IxNTNj
NzcxZmIyMDgxNjY2NDMwYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGU2YjAxN2E2
ZjdjYTUzNWQ4Y2Y0MWEzYWY0MzM3ZmIxMmUxODQ5NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IE1pbmdsaSBZdSA8TWluZ2xpLll1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDIx
IE1heSAyMDE5IDE1OjIwOjM0ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNraXAgdGhlIHRlc3Qg
d2hlbiBnY2Mgbm90IGRlcGxveWVkCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZWxmdXRpbHMvZmlsZXMvMDAwMS10ZXN0cy1NYWtlZmlsZS5hbS1jb21waWxlLXRlc3Rfbmxpc3Qt
d2l0aC1zdGFuZGFyZC1DLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2Zp
bGVzLzAwMDEtdGVzdHMtTWFrZWZpbGUuYW0tY29tcGlsZS10ZXN0X25saXN0LXdpdGgtc3RhbmRh
cmQtQy5wYXRjaAppbmRleCBhMmMwYjkwMjI3Li44NzUwODIyMDI4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS10ZXN0cy1NYWtlZmlsZS5hbS1j
b21waWxlLXRlc3Rfbmxpc3Qtd2l0aC1zdGFuZGFyZC1DLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLU1ha2VmaWxlLmFtLWNvbXBpbGUt
dGVzdF9ubGlzdC13aXRoLXN0YW5kYXJkLUMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGUz
NTVjYTNiOGRkY2M2ZTczZWUxNDBmNTNkMjU2MzRhZmRhZWMwZGEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIDBlMTg2YWVkMDhlZjg2MWE3MGI1YzI2NDY0NWMxMDVmNjAyNTFlMDMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMjMgSnVuIDIwMjAgMDc6NDk6MzUgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gdGVzdHMvTWFrZWZpbGUuYW06IGNvbXBpbGUgdGVzdF9ubGlzdCB3aXRo
IHN0YW5kYXJkIENGTEFHUwpAQCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvTWFrZWZp
bGUuYW0gYi90ZXN0cy9NYWtlZmlsZS5hbQotaW5kZXggMmFkZTVkOS4uZjg1Y2RiYSAxMDA2NDQK
K2luZGV4IGFjODI0NTYuLjc5MTA1ZjIgMTAwNjQ0CiAtLS0gYS90ZXN0cy9NYWtlZmlsZS5hbQog
KysrIGIvdGVzdHMvTWFrZWZpbGUuYW0KLUBAIC05OCw3ICs5OCw3IEBAIGVuZGlmCitAQCAtMTAy
LDcgKzEwMiw3IEBAIGVuZGlmCiAgdGVzdC1ubGlzdCQoRVhFRVhUKTogdGVzdC1ubGlzdC5jCiAg
CSQoQU1fVl9DQykkKENDKSAkKERFRlMpICQoREVGQVVMVF9JTkNMVURFUykgJChJTkNMVURFUykg
XAogIAkgICQoQU1fQ1BQRkxBR1MpICQoQ1BQRkxBR1MpIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLWZpeC1idWlsZC1hZ2FpbnN0
LXVwY29taW5nLWdjYy0xNC1XZXJyb3ItY2FsbG8ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvZWxmdXRpbHMvZmlsZXMvMDAwMS10ZXN0cy1maXgtYnVpbGQtYWdhaW5zdC11cGNvbWluZy1n
Y2MtMTQtV2Vycm9yLWNhbGxvLnBhdGNoCmluZGV4IDVlMGM3ZTk3NjYuLmQ3MDkxNjY3NzcgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3Rz
LWZpeC1idWlsZC1hZ2FpbnN0LXVwY29taW5nLWdjYy0xNC1XZXJyb3ItY2FsbG8ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtdGVzdHMtZml4LWJ1
aWxkLWFnYWluc3QtdXBjb21pbmctZ2NjLTE0LVdlcnJvci1jYWxsby5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOTAxYzZhOGM3OGMzYzRlZWUyNDRiOWQ1Mjk4Y2JkN2I5YWE3MTNkMSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmMzNzQ2OTVlN2U0ZmY3ZTFkOTkxMjk3MWYyMGJk
NWU0YmYxMDI3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFNlcmdlaSBUcm9maW1v
dmljaCA8c2x5aWNoQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjEgRGVjIDIwMjMgMDk6MjM6MzAg
KzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVzdHM6IGZpeCBidWlsZCBhZ2FpbnN0IHVwY29taW5n
IGBnY2MtMTRgCkBAIC0xNyw2ICsxNyw3IEBAIGRldGVjdGVkIG1pbm9yIGluZmVsaWNpdHkgaW4g
YGNhbGxvYygpYCBBUEkgdXNhZ2UgaW4gYGVsZnV0aWxzYDoKIFVwc3RyZWFtLVN0YXR1czogQmFj
a3BvcnQgW2h0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWVsZnV0aWxzLmdpdDthPWNvbW1p
dDtoPWFlNTgwZDQ4Mjc4Yjk5MjRkYTc1MDM4ODZiMzdiZTM0Mzc4ZTFiMDRdCiBTaWduZWQtb2Zm
LWJ5OiBTZXJnZWkgVHJvZmltb3ZpY2ggPHNseWljaEBnbWFpbC5jb20+CiBTaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorCiAtLS0KICB0ZXN0cy9lbGZzdHJtZXJn
ZS5jIHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQpAQCAtMzQsNiArMzUsMyBAQCBpbmRleCA1NjM1MGJiLi40ZWI1OGJiIDEwMDY0NAogICAgaWYg
KG5ld3NjbmJ1ZnMgPT0gTlVMTCkKICAgICAgZmFpbF9lcnJubyAoIkNvdWxkbid0IGFsbG9jYXRl
IG1lbW9yeSBmb3IgbmV3IHNlY3Rpb24gYnVmZmVycyIsIE5VTEwpOwogIAotLS0gCi0yLjQzLjAK
LQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDIt
Rml4LWVsZl9jdnRfZ3VuaGFzaC1pZi1kZXN0LWFuZC1zcmMtYXJlLXNhbWUucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMi1GaXgtZWxmX2N2dF9ndW5oYXNo
LWlmLWRlc3QtYW5kLXNyYy1hcmUtc2FtZS5wYXRjaAppbmRleCBiZTQ4ZWYwMTBiLi4wNDdjZTQ0
ODc2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAw
Mi1GaXgtZWxmX2N2dF9ndW5oYXNoLWlmLWRlc3QtYW5kLXNyYy1hcmUtc2FtZS5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMi1GaXgtZWxmX2N2dF9n
dW5oYXNoLWlmLWRlc3QtYW5kLXNyYy1hcmUtc2FtZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMTY0M2Q3OTM3NjEyMTYyNTJiYjY1NGUyOGFhYTViOGViMTUzNmJjYSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMzg1MzhiMmUzNGI2ZDA0ZjI5YThlN2I0OGFhZWNiYzMwZjhkMzNj
ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFA
d2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTUgQXVnIDIwMTcgMTc6MTM6NTkgKzA4MDAKIFN1
YmplY3Q6IFtQQVRDSF0gRml4IGVsZl9jdnRfZ3VuaGFzaCBpZiBkZXN0IGFuZCBzcmMgYXJlIHNh
bWUuCkBAIC0xOCwxMCArMTgsMTAgQEAgU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1
LmppYUB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xpYmVsZi9nbnVoYXNoX3hsYXRlLmggYi9saWJl
bGYvZ251aGFzaF94bGF0ZS5oCi1pbmRleCA2ZmFmMTEzLi4wNGQ5Y2ExIDEwMDY0NAoraW5kZXgg
M2EwMGFlMC4uNDA0NjhmYyAxMDA2NDQKIC0tLSBhL2xpYmVsZi9nbnVoYXNoX3hsYXRlLmgKICsr
KyBiL2xpYmVsZi9nbnVoYXNoX3hsYXRlLmgKLUBAIC00MCw2ICs0MCw3IEBAIGVsZl9jdnRfZ251
aGFzaCAodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3JjLCBzaXplX3QgbGVuLCBpbnQgZW5jb2Rl
KQorQEAgLTQyLDYgKzQyLDcgQEAgZWxmX2N2dF9nbnVoYXNoICh2b2lkICpkZXN0LCBjb25zdCB2
b2lkICpzcmMsIHNpemVfdCBsZW4sIGludCBlbmNvZGUpCiAgICAgICB3b3Jkcy4gIFdlIG11c3Qg
ZGV0YW5nbGUgdGhlbSBoZXJlLiAgICovCiAgICBFbGYzMl9Xb3JkICpkZXN0MzIgPSBkZXN0Owog
ICAgY29uc3QgRWxmMzJfV29yZCAqc3JjMzIgPSBzcmM7CkBAIC0yOSw3ICsyOSw3IEBAIGluZGV4
IDZmYWYxMTMuLjA0ZDljYTEgMTAwNjQ0CiAgCiAgICAvKiBGaXJzdCBmb3VyIGNvbnRyb2wgd29y
ZHMsIDMyIGJpdHMuICAqLwogICAgZm9yICh1bnNpZ25lZCBpbnQgY250ID0gMDsgY250IDwgNDsg
KytjbnQpCi1AQCAtNTAsNyArNTEsNyBAQCBlbGZfY3Z0X2dudWhhc2ggKHZvaWQgKmRlc3QsIGNv
bnN0IHZvaWQgKnNyYywgc2l6ZV90IGxlbiwgaW50IGVuY29kZSkKK0BAIC01Miw3ICs1Myw3IEBA
IGVsZl9jdnRfZ251aGFzaCAodm9pZCAqZGVzdCwgY29uc3Qgdm9pZCAqc3JjLCBzaXplX3QgbGVu
LCBpbnQgZW5jb2RlKQogICAgICAgIGxlbiAtPSA0OwogICAgICB9CiAgCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1maXhoZWFkZXJjaGVjay5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRl
cmNoZWNrLnBhdGNoCmluZGV4IDIxMmIzNThkYzIuLmJjMTlmYjQ3MzAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhlYWRlcmNoZWNrLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLWZpeGhl
YWRlcmNoZWNrLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3ZTFmOTFjNDJlZjViMGJmMTBh
ZmVmZWMxMGRkMDg1ODhkZjNhYjFmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmZDc0
NjBkYTM3NDY0NmEwZTYzNTMxZjExYzFlZjQ1NDYwZWYwODNmIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTog
VHVlLCAxNSBBdWcgMjAxNyAxNzoxNzoyMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBmaXhoZWFk
ZXJjaGVjawpAQCAtMjIsMTAgKzIyLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhv
bmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGliZWxmL2VsZjMyX3VwZGF0ZW51bGwu
YyBiL2xpYmVsZi9lbGYzMl91cGRhdGVudWxsLmMKLWluZGV4IGQwZDRkMWUuLjRlY2Y1YTUgMTAw
NjQ0CitpbmRleCAzNTk0ZThiLi5hMzMxNGU1IDEwMDY0NAogLS0tIGEvbGliZWxmL2VsZjMyX3Vw
ZGF0ZW51bGwuYwogKysrIGIvbGliZWxmL2VsZjMyX3VwZGF0ZW51bGwuYwotQEAgLTM1NCw4ICsz
NTQsOCBAQCBfX2VsZncyKExJQkVMRkJJVFMsdXBkYXRlbnVsbF93cmxvY2spIChFbGYgKmVsZiwg
aW50ICpjaGFuZ2VfYm9wLCBzaXplX3Qgc2hudW0pCitAQCAtMzU1LDggKzM1NSw4IEBAIF9fZWxm
dzIoTElCRUxGQklUUyx1cGRhdGVudWxsX3dybG9jaykgKEVsZiAqZWxmLCBpbnQgKmNoYW5nZV9i
b3AsIHNpemVfdCBzaG51bSkKICAJCSAgICAgd2UgdGVzdCBmb3IgdGhlIGFsaWdubWVudCBvZiB0
aGUgc2VjdGlvbiBiZWluZyBsYXJnZQogIAkJICAgICBlbm91Z2ggZm9yIHRoZSBsYXJnZXN0IGFs
aWdubWVudCByZXF1aXJlZCBieSBhIGRhdGEKICAJCSAgICAgYmxvY2suICAqLwpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtbXVzbC11dGlscy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLW11c2wtdXRp
bHMucGF0Y2gKaW5kZXggOTNmNWJkY2QwMC4uOTY3Y2RmMjMxOSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtbXVzbC11dGlscy5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1tdXNsLXV0aWxzLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNjJhYzkwMzk0ZTM2ZTBiNGU4NjA0MmQ5YzUzODU3
MDNmNWI2NTM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyMGZiZWU0NzI0MTgxYjhj
MjRmOGVmOWI5MDViZTkyZDY1YjM0NmRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
SG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogRnJpLCAyMyBBdWcg
MjAxOSAxMDoxOTo0OCArMDgwMAogU3ViamVjdDogW1BBVENIXSBtdXNsLXV0aWxzCkBAIC0zOSw3
ICszOSw3IEBAIGluZGV4IGQ0YTQyMjEuLmY2MzM2ZDkgMTAwNjQ0CiAgLyogU3RhdGUgb2YgLUQv
LVUgZmxhZ3MuICAqLwogIGV4dGVybiBib29sIGFybGliX2RldGVybWluaXN0aWNfb3V0cHV0Owog
ZGlmZiAtLWdpdCBhL3NyYy9lbGZjb21wcmVzcy5jIGIvc3JjL2VsZmNvbXByZXNzLmMKLWluZGV4
IDE4YWRlNjYuLmE2ZWQ0ZTEgMTAwNjQ0CitpbmRleCBmNzcxYjkyLi4yNjNkZTYyIDEwMDY0NAog
LS0tIGEvc3JjL2VsZmNvbXByZXNzLmMKICsrKyBiL3NyYy9lbGZjb21wcmVzcy5jCiBAQCAtMzcs
NiArMzcsMTMgQEAKQEAgLTU3LDcgKzU3LDcgQEAgaW5kZXggMThhZGU2Ni4uYTZlZDRlMSAxMDA2
NDQKICBBUkdQX1BST0dSQU1fVkVSU0lPTl9IT09LX0RFRiA9IHByaW50X3ZlcnNpb247CiAgCiBk
aWZmIC0tZ2l0IGEvc3JjL3N0cmlwLmMgYi9zcmMvc3RyaXAuYwotaW5kZXggMmEyY2M4MC4uOGU5
Zjc3MyAxMDA2NDQKK2luZGV4IDY0MzY0NDMuLjE2MDg0OTYgMTAwNjQ0CiAtLS0gYS9zcmMvc3Ry
aXAuYwogKysrIGIvc3JjL3N0cmlwLmMKIEBAIC00NSw2ICs0NSwxMyBAQApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDYtRml4LWJ1aWxkLW9uLWFh
cmNoNjQtbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8w
MDA2LUZpeC1idWlsZC1vbi1hYXJjaDY0LW11c2wucGF0Y2gKaW5kZXggODk0MmFkNzgyOC4uNTgw
ZGQ4MzUwMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVz
LzAwMDYtRml4LWJ1aWxkLW9uLWFhcmNoNjQtbXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwNi1GaXgtYnVpbGQtb24tYWFyY2g2NC1tdXNsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyMzk2ZmQ2N2Q4MWU1NGUxOGZiYWQ2N2E1ZmY2N2Q1
Njg0YTAxMDEzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3NzNhZGEwYmNlMjUyYTVh
NjdiZjhiZWE1NDRiMTUzZjM5NTJmMmVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
SG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNSBBdWcg
MjAxNyAxNzoyNzozMCArMDgwMAogU3ViamVjdDogW1BBVENIXSBGaXggYnVpbGQgb24gYWFyY2g2
NC9tdXNsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMv
cHRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvcHRlc3Qu
cGF0Y2gKaW5kZXggZmU2ZjI3MmE4My4uZGJjNDlkOGNiZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzL3B0ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy9wdGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gYmZiZjM5M2U3ZDViMWI0MWRmODVjZTFjMzdlODg3Nzc2YzQ1ZDUyOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gN2I0MzMwYmM1ZGQ2OWYyYjRmYThlZTQwOTE5ZjI0YzkxMGVjYzBh
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCAxIE1heSAyMDE5IDE2OjM3
OjQ4ICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIENoYW5nZXMgdG8gYWxsb3cgcHRlc3QgdG8gcnVu
IHN0YW5kYWxvbmUgb24gdGFyZ2V0OgpAQCAtMjIsMTAgKzIyLDEwIEBAIFVwc3RyZWFtLVN0YXR1
czogSW5hcHByb3ByaWF0ZSBbb2Ugc3BlY2lmaWNdCiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9j
b25maWd1cmUuYWMKLWluZGV4IGQzNDU0OTUuLjY3OTMzZDEgMTAwNjQ0CitpbmRleCBhZjViNmJm
Li4yZWYzMDJmIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMK
LUBAIC00OCw3ICs0OCw3IEBAIEFDX0NPUFlSSUdIVChbQ29weXJpZ2h0IChDKSAxOTk2LTIwMjEg
VGhlIGVsZnV0aWxzIGRldmVsb3BlcnMuXSkKK0BAIC00OSw3ICs0OSw3IEBAIEFDX0NPUFlSSUdI
VChbQ29weXJpZ2h0IChDKSAxOTk2LTIwMjMgVGhlIGVsZnV0aWxzIGRldmVsb3BlcnMuXSkKICBB
Q19QUkVSRVEoMi42MykJCQlkbmwgTWluaW11bSBBdXRvY29uZiB2ZXJzaW9uIHJlcXVpcmVkLgog
IAogIGRubCBXZSB1c2UgR05VIG1ha2UgZXh0ZW5zaW9uczsgYXV0b21ha2UgMS4xMCBkZWZhdWx0
cyB0byAtV3BvcnRhYmlsaXR5LgpAQCAtMzUsMTAgKzM1LDEwIEBAIGluZGV4IGQzNDU0OTUuLjY3
OTMzZDEgMTAwNjQ0CiAgCiAgQU1fU0lMRU5UX1JVTEVTKFt5ZXNdKQogZGlmZiAtLWdpdCBhL3Rl
c3RzL01ha2VmaWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IDcyYWZkMGUuLmEyZGZk
NDMgMTAwNjQ0CitpbmRleCA3MWMxYTYxLi5hYzgyNDU2IDEwMDY0NAogLS0tIGEvdGVzdHMvTWFr
ZWZpbGUuYW0KICsrKyBiL3Rlc3RzL01ha2VmaWxlLmFtCi1AQCAtNjk4LDMgKzY5OCw1IEBAIGNo
ZWNrOiBjaGVjay1hbSBjb3ZlcmFnZQorQEAgLTgzNCwzICs4MzQsNSBAQCBjaGVjazogY2hlY2st
YW0gY292ZXJhZ2UKICBjb3ZlcmFnZToKICAJLSQoc3JjZGlyKS9jb3ZlcmFnZS5zaAogIGVuZGlm
Ci0tIAoyLjQyLjAKCg==

--===============5969807256642563416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/elfutils/elfutils-doc: FILELIST: added "/usr/share/man/man1/eu-srcfiles.1"
packages/core2-64-poky-linux/elfutils/elfutils-ptest: FILELIST: removed "/usr/lib/elfutils/ptest/tests/run-copymany-sections.sh /usr/lib/elfutils/ptest/tests/run-strip-reloc.sh", added "/usr/lib/elfutils/ptest/backends/loongarch_initreg.os /usr/lib/elfutils/ptest/backends/loongarch_retval.os /usr/lib/elfutils/ptest/tests/run-strip-reloc-ko.sh /usr/lib/elfutils/ptest/tests/run-srcfiles-self.sh /usr/lib/elfutils/ptest/tests/strip-reloc-subr.sh /usr/lib/elfutils/ptest/tests/testfilegdbindex9-no-maininfo.bz2 /usr/lib/elfutils/ptest/backends/loongarch_regs.os /usr/lib/elfutils/ptest/backends/loongarch_corenote.o /usr/lib/elfutils/ptest/tests/run-strip-reloc-ppc64.sh /usr/lib/elfutils/ptest/backends/loongarch_unwind.o /usr/lib/elfutils/ptest/backends/loongarch_corenote.os /usr/lib/elfutils/ptest/backends/loongarch_retval.o /usr/lib/elfutils/ptest/tests/run-strip-reloc-self.sh /usr/lib/elfutils/ptest/tests/test-copymany-subr.sh /usr/lib/elfutils/ptest/backends/loongarch_unwind.os /usr/lib/e
 lfutils/ptest/tests/system_elf_gelf_test-system-elf-gelf-test.o /usr/lib/elfutils/ptest/backends/loongarch_cfi.o /usr/lib/elfutils/ptest/tests/system-elf-gelf-test.c /usr/lib/elfutils/ptest/backends/loongarch_regs.o /usr/lib/elfutils/ptest/backends/loongarch_cfi.os /usr/lib/elfutils/ptest/tests/run-debuginfod-IXr.sh /usr/lib/elfutils/ptest/libelf/elf32_getchdr.h /usr/lib/elfutils/ptest/tests/run-copymany-be64.sh /usr/lib/elfutils/ptest/tests/run-copymany-le32.sh /usr/lib/elfutils/ptest/tests/run-copymany-le64.sh /usr/lib/elfutils/ptest/tests/run-copymany-be32.sh /usr/lib/elfutils/ptest/tests/system-elf-gelf-test /usr/lib/elfutils/ptest/tests/libelf.h /usr/lib/elfutils/ptest/backends/loongarch_initreg.o /usr/lib/elfutils/ptest/tests/testfilegdbindex9.bz2"
packages/core2-64-poky-linux/elfutils/elfutils: FILELIST: added "/usr/bin/eu-srcfiles"
packages/core2-64-poky-linux/elfutils/libasm: FILELIST: removed "/usr/lib/libasm-0.189.so", added "/usr/lib/libasm-0.190.so"
packages/core2-64-poky-linux/elfutils/libdebuginfod: FILELIST: removed "/usr/lib/libdebuginfod-0.189.so", added "/usr/lib/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/libdw: FILELIST: removed "/usr/lib/libdw-0.189.so", added "/usr/lib/libdw-0.190.so"
packages/core2-64-poky-linux/elfutils/libelf: FILELIST: removed "/usr/lib/libelf-0.189.so", added "/usr/lib/libelf-0.190.so"
Changes to packages/core2-64-poky-linux/elfutils (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.189.so to libasm-0.190.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.189.so to libdw-0.190.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.189.so to libelf-0.190.so
  /usr/lib/libasm-0.189.so moved to /usr/lib/libasm-0.190.so
  /usr/lib/libdebuginfod-0.189.so moved to /usr/lib/libdebuginfod-0.190.so
  /usr/lib/libdw-0.189.so moved to /usr/lib/libdw-0.190.so
  /usr/lib/libelf-0.189.so moved to /usr/lib/libelf-0.190.so
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.189.so to libasm-0.190.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.189.so to libdw-0.190.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.189.so to libelf-0.190.so
  /usr/lib/libasm-0.189.so moved to /usr/lib/libasm-0.190.so
  /usr/lib/libdebuginfod-0.189.so moved to /usr/lib/libdebuginfod-0.190.so
  /usr/lib/libdw-0.189.so moved to /usr/lib/libdw-0.190.so
  /usr/lib/libelf-0.189.so moved to /usr/lib/libelf-0.190.so
  /usr/bin/eu-srcfiles was added

--===============5969807256642563416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/curl/curl-ptest: PKGSIZE changed from 18511517 to 18510558 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-binutils: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-binutils: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-binutils: PKGSIZE changed from 1331808 to 1360480 (+2%)
packages/core2-64-poky-linux/elfutils/elfutils-dbg: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-dbg: FILELIST: removed "/usr/lib/.debug/libdw-0.189.so /usr/lib/.debug/libdebuginfod-0.189.so /usr/lib/.debug/libasm-0.189.so /usr/lib/.debug/libelf-0.189.so", added "/usr/lib/elfutils/ptest/tests/.debug/system-elf-gelf-test /usr/lib/.debug/libasm-0.190.so /usr/lib/.debug/libelf-0.190.so /usr/bin/.debug/eu-srcfiles /usr/lib/.debug/libdw-0.190.so /usr/lib/.debug/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/elfutils-dbg: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-dbg: PKGSIZE changed from 28457112 to 29406912 (+3%)
packages/core2-64-poky-linux/elfutils/elfutils-dev: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-dev: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-dev: PKGSIZE changed from 215674 to 216322 (+0%)
packages/core2-64-poky-linux/elfutils/elfutils-doc: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-doc: FILELIST: added "/usr/share/man/man1/eu-srcfiles.1"
packages/core2-64-poky-linux/elfutils/elfutils-doc: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-doc: PKGSIZE changed from 69790 to 73546 (+5%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-de: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-de: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+boldquot: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+boldquot: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+boldquot: PKGSIZE changed from 157322 to 157744 (+0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+quot: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+quot: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+quot: PKGSIZE changed from 155486 to 155908 (+0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-es: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-es: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-es: PKGSIZE changed from 106776 to 106582 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-ja: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-ja: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-ja: PKGSIZE changed from 92248 to 92046 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-pl: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-pl: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-pl: PKGSIZE changed from 165530 to 165373 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-uk: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-uk: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-uk: PKGSIZE changed from 193954 to 193756 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-ptest: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-ptest: FILELIST: removed "/usr/lib/elfutils/ptest/tests/run-copymany-sections.sh /usr/lib/elfutils/ptest/tests/run-strip-reloc.sh", added "/usr/lib/elfutils/ptest/libelf/elf32_getchdr.h /usr/lib/elfutils/ptest/tests/run-strip-reloc-ko.sh /usr/lib/elfutils/ptest/tests/run-debuginfod-IXr.sh /usr/lib/elfutils/ptest/backends/loongarch_regs.o /usr/lib/elfutils/ptest/backends/loongarch_cfi.os /usr/lib/elfutils/ptest/backends/loongarch_unwind.os /usr/lib/elfutils/ptest/tests/strip-reloc-subr.sh /usr/lib/elfutils/ptest/tests/testfilegdbindex9-no-maininfo.bz2 /usr/lib/elfutils/ptest/tests/testfilegdbindex9.bz2 /usr/lib/elfutils/ptest/tests/system-elf-gelf-test.c /usr/lib/elfutils/ptest/backends/loongarch_retval.os /usr/lib/elfutils/ptest/backends/loongarch_regs.os /usr/lib/elfutils/ptest/backends/loongarch_corenote.os /usr/lib/elfutils/ptest/tests/run-strip-reloc-ppc64.sh /usr/lib/elfutils/ptest/tests/system_elf_gelf_test-system-elf-gelf-test.o /
 usr/lib/elfutils/ptest/tests/run-strip-reloc-self.sh /usr/lib/elfutils/ptest/backends/loongarch_initreg.os /usr/lib/elfutils/ptest/tests/system-elf-gelf-test /usr/lib/elfutils/ptest/backends/loongarch_cfi.o /usr/lib/elfutils/ptest/backends/loongarch_retval.o /usr/lib/elfutils/ptest/tests/test-copymany-subr.sh /usr/lib/elfutils/ptest/backends/loongarch_corenote.o /usr/lib/elfutils/ptest/tests/libelf.h /usr/lib/elfutils/ptest/tests/run-copymany-be32.sh /usr/lib/elfutils/ptest/tests/run-copymany-be64.sh /usr/lib/elfutils/ptest/tests/run-copymany-le32.sh /usr/lib/elfutils/ptest/backends/loongarch_unwind.o /usr/lib/elfutils/ptest/tests/run-copymany-le64.sh /usr/lib/elfutils/ptest/tests/run-srcfiles-self.sh /usr/lib/elfutils/ptest/backends/loongarch_initreg.o"
packages/core2-64-poky-linux/elfutils/elfutils-ptest: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-ptest: PKGSIZE changed from 46650699 to 47672612 (+2%)
packages/core2-64-poky-linux/elfutils/elfutils-src: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-src: FILELIST: directory renamed /usr/src/debug/elfutils/0.189/libdwelf -> /usr/src/debug/elfutils/0.190/libdwelf, directory renamed /usr/src/debug/elfutils/0.189/libebl -> /usr/src/debug/elfutils/0.190/libebl, directory renamed /usr/src/debug/elfutils/0.189/libcpu -> /usr/src/debug/elfutils/0.190/libcpu, directory renamed /usr/src/debug/elfutils/0.189/debuginfod -> /usr/src/debug/elfutils/0.190/debuginfod, directory renamed /usr/src/debug/elfutils/0.189/libdw -> /usr/src/debug/elfutils/0.190/libdw, directory renamed /usr/src/debug/elfutils/0.189/libasm -> /usr/src/debug/elfutils/0.190/libasm, directory renamed /usr/src/debug/elfutils/0.189/libdwfl -> /usr/src/debug/elfutils/0.190/libdwfl, directory renamed /usr/src/debug/elfutils/0.189/lib -> /usr/src/debug/elfutils/0.190/lib, removed "/usr/src/debug/elfutils/0.189/tests/dwflsyms.c /usr/src/debug/elfutils/0.189/tests/vdsosyms.c /usr/src/debug/elfutils/0.189/tests/fillfile.c /usr/src/deb
 ug/elfutils/0.189/backends/csky_regs.c /usr/src/debug/elfutils/0.189/backends/csky_reloc.def /usr/src/debug/elfutils/0.189/tests/asm-tst8.c /usr/src/debug/elfutils/0.189/backends/csky_init.c /usr/src/debug/elfutils/0.189/backends/riscv_cfi.c /usr/src/debug/elfutils/0.189/tests/get-files.c /usr/src/debug/elfutils/0.189/tests/unit-info.c /usr/src/debug/elfutils/0.189/backends/arc_symbol.c /usr/src/debug/elfutils/0.189/backends/x86_64_initreg.c /usr/src/debug/elfutils/0.189/backends/s390_symbol.c /usr/src/debug/elfutils/0.189/libelf/elf32_offscn.c /usr/src/debug/elfutils/0.189/backends/bpf_symbol.c /usr/src/debug/elfutils/0.189/libelf/elf_ndxscn.c /usr/src/debug/elfutils/0.189/libelf/elf_newscn.c /usr/src/debug/elfutils/0.189/libelf/elf_rawdata.c /usr/src/debug/elfutils/0.189/libelf/elf_rawfile.c /usr/src/debug/elfutils/0.189/libelf/elf_readall.c /usr/src/debug/elfutils/0.189/src/ar.c /usr/src/debug/elfutils/0.189/backends/ia64_retval.c /usr/src/debug/elfutils/0.189/tests/rerequest_tag
 .c /usr/src/debug/elfutils/0.189/backends/ppc_reloc.def /usr/src/debug/elfutils/0.189/tests/attr-integrate-skel.c /usr/src/debug/elfutils/0.189/libelf/chdr_xlate.h /usr/src/debug/elfutils/0.189/src/objdump.c /usr/src/debug/elfutils/0.189/src/unstrip.c /usr/src/debug/elfutils/0.189/libelf/elf_end.c /usr/src/debug/elfutils/0.189/libelf/elf_scnshndx.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_move.c /usr/src/debug/elfutils/0.189/backends/ia64_symbol.c /usr/src/debug/elfutils/0.189/backends/sparc_regs.c /usr/src/debug/elfutils/0.189/backends/aarch64_reloc.def /usr/src/debug/elfutils/0.189/backends/sh_retval.c /usr/src/debug/elfutils/0.189/backends/sh_symbol.c /usr/src/debug/elfutils/0.189/backends/sparc_symbol.c /usr/src/debug/elfutils/0.189/backends/loongarch_symbol.c /usr/src/debug/elfutils/0.189/libelf/elf_getshdrstrndx.c /usr/src/debug/elfutils/0.189/tests/newdata.c /usr/src/debug/elfutils/0.189/libelf/gelf_getverdef.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_rela.c /
 usr/src/debug/elfutils/0.189/tests/debuginfod_build_id_find.c /usr/src/debug/elfutils/0.189/tests/asm-tst2.c /usr/src/debug/elfutils/0.189/backends/m68k_retval.c /usr/src/debug/elfutils/0.189/libelf/nlist.c /usr/src/debug/elfutils/0.189/libelf/nlist.h /usr/src/debug/elfutils/0.189/tests/get-pubnames.c /usr/src/debug/elfutils/0.189/tests/funcretval_test++11.cxx /usr/src/debug/elfutils/0.189/tests/system-elf-libelf-test.c /usr/src/debug/elfutils/0.189/tests/get-aranges.c /usr/src/debug/elfutils/0.189/tests/dwflmodtest.c /usr/src/debug/elfutils/0.189/backends/sparc_corenote.c /usr/src/debug/elfutils/0.189/backends/x86_corenote.c /usr/src/debug/elfutils/0.189/libelf/gelf_checksum.c /usr/src/debug/elfutils/0.189/tests/next-files.c /usr/src/debug/elfutils/0.189/tests/dwfl-bug-report.c /usr/src/debug/elfutils/0.189/backends/sparc_attrs.c /usr/src/debug/elfutils/0.189/backends/i386_symbol.c /usr/src/debug/elfutils/0.189/backends/ppc_retval.c /usr/src/debug/elfutils/0.189/backends/ppc_symbol
 .c /usr/src/debug/elfutils/0.189/libelf/elf_strptr.c /usr/src/debug/elfutils/0.189/libelf/libelfP.h /usr/src/debug/elfutils/0.189/src/strip.c /usr/src/debug/elfutils/0.189/src/arlib.c /usr/src/debug/elfutils/0.189/src/stack.c /usr/src/debug/elfutils/0.189/tests/debugaltlink.c /usr/src/debug/elfutils/0.189/src/arlib.h /usr/src/debug/elfutils/0.189/tests/elfstrtab.c /usr/src/debug/elfutils/0.189/libelf/gelf.h /usr/src/debug/elfutils/0.189/src/arlib-argp.c /usr/src/debug/elfutils/0.189/backends/aarch64_retval.c /usr/src/debug/elfutils/0.189/backends/ppc64_init.c /usr/src/debug/elfutils/0.189/backends/alpha_regs.c /usr/src/debug/elfutils/0.189/backends/arc_init.c /usr/src/debug/elfutils/0.189/tests/get-units-split.c /usr/src/debug/elfutils/0.189/backends/sparc_initreg.c /usr/src/debug/elfutils/0.189/tests/debuglink.c /usr/src/debug/elfutils/0.189/backends/alpha_symbol.c /usr/src/debug/elfutils/0.189/backends/m68k_init.c /usr/src/debug/elfutils/0.189/backends/m68k_regs.c /usr/src/debug/e
 lfutils/0.189/backends/csky_attrs.c /usr/src/debug/elfutils/0.189/backends/alpha_retval.c /usr/src/debug/elfutils/0.189/tests/newscn.c /usr/src/debug/elfutils/0.189/tests/leb128.c /usr/src/debug/elfutils/0.189/backends/csky_corenote.c /usr/src/debug/elfutils/0.189/backends/arc_reloc.def /usr/src/debug/elfutils/0.189/tests/dwarf-ranges.c /usr/src/debug/elfutils/0.189/backends/riscv_regs.c /usr/src/debug/elfutils/0.189/tests/asm-tst6.c /usr/src/debug/elfutils/0.189/backends/aarch64_corenote.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_rel.c /usr/src/debug/elfutils/0.189/backends/ppc64_retval.c /usr/src/debug/elfutils/0.189/backends/x86_64_init.c /usr/src/debug/elfutils/0.189/tests/sectiondump.c /usr/src/debug/elfutils/0.189/tests/arls.c /usr/src/debug/elfutils/0.189/tests/hash.c /usr/src/debug/elfutils/0.189/backends/aarch64_regs.c /usr/src/debug/elfutils/0.189/libelf/elf_getphdrnum.c /usr/src/debug/elfutils/0.189/libelf/elf_getshdrnum.c /usr/src/debug/elfutils/0.189/tests/elfge
 tzdata.c /usr/src/debug/elfutils/0.189/libelf/elf_compress_gnu.c /usr/src/debug/elfutils/0.189/tests/dwfl-report-offline-memory.c /usr/src/debug/elfutils/0.189/tests/low_high_pc.c /usr/src/debug/elfutils/0.189/backends/s390_reloc.def /usr/src/debug/elfutils/0.189/tests/update2.c /usr/src/debug/elfutils/0.189/libelf/gnuhash_xlate.h /usr/src/debug/elfutils/0.189/backends/arm_machineflagname.c /usr/src/debug/elfutils/0.189/tests/update4.c /usr/src/debug/elfutils/0.189/backends/ia64_reloc.def /usr/src/debug/elfutils/0.189/libelf/elf32_fsize.c /usr/src/debug/elfutils/0.189/libelf/gelf_getverdaux.c /usr/src/debug/elfutils/0.189/libelf/gelf_getauxv.c /usr/src/debug/elfutils/0.189/tests/dwfl-addr-sect.c /usr/src/debug/elfutils/0.189/tests/all-dwarf-ranges.c /usr/src/debug/elfutils/0.189/backends/common-reloc.c /usr/src/debug/elfutils/0.189/libelf/elf_cntl.c /usr/src/debug/elfutils/0.189/tests/allregs.c /usr/src/debug/elfutils/0.189/libelf/gelf_getchdr.c /usr/src/debug/elfutils/0.189/libelf/
 gelf_getehdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_getphdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_getshdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_newehdr.c /usr/src/debug/elfutils/0.189/backends/riscv_initreg.c /usr/src/debug/elfutils/0.189/libelf/elf32_updatefile.c /usr/src/debug/elfutils/0.189/libelf/gelf_newphdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_phdr.c /usr/src/debug/elfutils/0.189/backends/x86_64_reloc.def /usr/src/debug/elfutils/0.189/libelf/libelf.h /usr/src/debug/elfutils/0.189/tests/dwfl-bug-addr-overflow.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlatetof.c /usr/src/debug/elfutils/0.189/backends/s390_retval.c /usr/src/debug/elfutils/0.189/libelf/elf_hash.c /usr/src/debug/elfutils/0.189/backends/m68k_symbol.c /usr/src/debug/elfutils/0.189/backends/ppc64_resolve_sym.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_verdef.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_versym.c /usr/src/debug/elfutils/0.189/src/strings.c /usr/src/debug/elf
 utils/0.189/backends/x86_64_unwind.c /usr/src/debug/elfutils/0.189/src/elfcompress.c /usr/src/debug/elfutils/0.189/tests/typeiter.c /usr/src/debug/elfutils/0.189/backends/alpha_init.c /usr/src/debug/elfutils/0.189/tests/emptyfile.c /usr/src/debug/elfutils/0.189/backends/aarch64_unwind.c /usr/src/debug/elfutils/0.189/tests/line2addr.c /usr/src/debug/elfutils/0.189/tests/dwfl-report-elf-align.c /usr/src/debug/elfutils/0.189/tests/addsections.c /usr/src/debug/elfutils/0.189/tests/elfcopy.c /usr/src/debug/elfutils/0.189/libelf/elf_gnu_hash.c /usr/src/debug/elfutils/0.189/tests/next-lines.c /usr/src/debug/elfutils/0.189/backends/sparc_auxv.c /usr/src/debug/elfutils/0.189/libelf/gelf_getsymshndx.c /usr/src/debug/elfutils/0.189/libelf/elf_getbase.c /usr/src/debug/elfutils/0.189/libelf/elf_getaroff.c /usr/src/debug/elfutils/0.189/libelf/elf_getdata.c /usr/src/debug/elfutils/0.189/backends/csky_cfi.c /usr/src/debug/elfutils/0.189/backends/aarch64_initreg.c /usr/src/debug/elfutils/0.189/libel
 f/gelf_getverneed.c /usr/src/debug/elfutils/0.189/tests/allfcts.c /usr/src/debug/elfutils/0.189/backends/loongarch_reloc.def /usr/src/debug/elfutils/0.189/backends/aarch64_init.c /usr/src/debug/elfutils/0.189/backends/aarch64_symbol.c /usr/src/debug/elfutils/0.189/backends/sparc_cfi.c /usr/src/debug/elfutils/0.189/tests/asm-tst1.c /usr/src/debug/elfutils/0.189/libelf/elf_getarhdr.c /usr/src/debug/elfutils/0.189/tests/asm-tst3.c /usr/src/debug/elfutils/0.189/tests/get-lines.c /usr/src/debug/elfutils/0.189/tests/next_cfi.c /usr/src/debug/elfutils/0.189/tests/asm-tst5.c /usr/src/debug/elfutils/0.189/backends/sparc_init.c /usr/src/debug/elfutils/0.189/libelf/gelf_getclass.c /usr/src/debug/elfutils/0.189/libelf/elf_begin.c /usr/src/debug/elfutils/0.189/tests/dwarf-getmacros.c /usr/src/debug/elfutils/0.189/libelf/elf32_xlatetof.c /usr/src/debug/elfutils/0.189/tests/aggregate_size.c /usr/src/debug/elfutils/0.189/backends/x86_64_corenote.c /usr/src/debug/elfutils/0.189/tests/vendorelf.c /us
 r/src/debug/elfutils/0.189/tests/showptable.c /usr/src/debug/elfutils/0.189/backends/s390_initreg.c /usr/src/debug/elfutils/0.189/backends/i386_retval.c /usr/src/debug/elfutils/0.189/backends/arm_reloc.def /usr/src/debug/elfutils/0.189/tests/msg_tst.c /usr/src/debug/elfutils/0.189/libelf/elf_flagdata.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_ehdr.c /usr/src/debug/elfutils/0.189/src/elfclassify.c /usr/src/debug/elfutils/0.189/tests/dwarfcfi.c /usr/src/debug/elfutils/0.189/backends/s390_corenote.c /usr/src/debug/elfutils/0.189/backends/sparc_retval.c /usr/src/debug/elfutils/0.189/backends/aarch64_cfi.c /usr/src/debug/elfutils/0.189/backends/s390_cfi.c /usr/src/debug/elfutils/0.189/tests/dwarf_default_lower_bound.c /usr/src/debug/elfutils/0.189/backends/s390_unwind.c /usr/src/debug/elfutils/0.189/backends/sh_init.c /usr/src/debug/elfutils/0.189/backends/sh_reloc.def /usr/src/debug/elfutils/0.189/tests/funcretval.c /usr/src/debug/elfutils/0.189/libelf/gelf_getversym.c /usr/src/
 debug/elfutils/0.189/libelf/gelf_update_verdaux.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_vernaux.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_verneed.c /usr/src/debug/elfutils/0.189/libelf/common.h /usr/src/debug/elfutils/0.189/libelf/elf_newdata.c /usr/src/debug/elfutils/0.189/libelf/elf_nextscn.c /usr/src/debug/elfutils/0.189/libelf/elf_flagelf.c /usr/src/debug/elfutils/0.189/libelf/elf_version.c /usr/src/debug/elfutils/0.189/libelf/elf_flagscn.c /usr/src/debug/elfutils/0.189/backends/m68k_cfi.c /usr/src/debug/elfutils/0.189/backends/s390_init.c /usr/src/debug/elfutils/0.189/backends/s390_regs.c /usr/src/debug/elfutils/0.189/tests/show-abbrev.c /usr/src/debug/elfutils/0.189/libelf/elf32_checksum.c /usr/src/debug/elfutils/0.189/libelf/elf_getident.c /usr/src/debug/elfutils/0.189/tests/asm-tst7.c /usr/src/debug/elfutils/0.189/tests/show-die-info.c /usr/src/debug/elfutils/0.189/libelf/gelf_getrela.c /usr/src/debug/elfutils/0.189/tests/asm-tst9.c /usr/src/debug/elfutil
 s/0.189/tests/test-flag-nobits.c /usr/src/debug/elfutils/0.189/backends/riscv_reloc.def /usr/src/debug/elfutils/0.189/backends/m68k_initreg.c /usr/src/debug/elfutils/0.189/backends/libebl_CPU.h /usr/src/debug/elfutils/0.189/tests/backtrace.c /usr/src/debug/elfutils/0.189/tests/elfgetchdr.c /usr/src/debug/elfutils/0.189/libelf/dl-hash.h /usr/src/debug/elfutils/0.189/libelf/gelf_update_auxv.c /usr/src/debug/elfutils/0.189/backends/riscv_corenote.c /usr/src/debug/elfutils/0.189/tests/alldts.c /usr/src/debug/elfutils/0.189/src/addr2line.c /usr/src/debug/elfutils/0.189/backends/x86_64_cfi.c /usr/src/debug/elfutils/0.189/libelf/elf_getdata_rawchunk.c /usr/src/debug/elfutils/0.189/tests/saridx.c /usr/src/debug/elfutils/0.189/tests/get-units-invalid.c /usr/src/debug/elfutils/0.189/backends/alpha_auxv.c /usr/src/debug/elfutils/0.189/backends/m68k_corenote.c /usr/src/debug/elfutils/0.189/libelf/elf_compress.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_shdr.c /usr/src/debug/elfutils/0.18
 9/tests/test-elf_cntl_gelf_getshdr.c /usr/src/debug/elfutils/0.189/backends/i386_corenote.c /usr/src/debug/elfutils/0.189/tests/peel_type.c /usr/src/debug/elfutils/0.189/tests/dwfl-report-segment-contiguous.c /usr/src/debug/elfutils/0.189/backends/alpha_corenote.c /usr/src/debug/elfutils/0.189/tests/update1.c /usr/src/debug/elfutils/0.189/backends/i386_unwind.c /usr/src/debug/elfutils/0.189/libelf/gelf_getvernaux.c /usr/src/debug/elfutils/0.189/tests/update3.c /usr/src/debug/elfutils/0.189/tests/typeiter2.c /usr/src/debug/elfutils/0.189/libelf/elf_getscn.c /usr/src/debug/elfutils/0.189/backends/sh_regs.c /usr/src/debug/elfutils/0.189/backends/x86_64_symbol.c /usr/src/debug/elfutils/0.189/backends/i386_regs.c /usr/src/debug/elfutils/0.189/backends/i386_reloc.def /usr/src/debug/elfutils/0.189/backends/i386_auxv.c /usr/src/debug/elfutils/0.189/backends/i386_init.c /usr/src/debug/elfutils/0.189/backends/linux-core-note.c /usr/src/debug/elfutils/0.189/backends/bpf_reloc.def /usr/src/debu
 g/elfutils/0.189/backends/ppc_attrs.c /usr/src/debug/elfutils/0.189/tests/dwfl-bug-getmodules.c /usr/src/debug/elfutils/0.189/backends/m68k_reloc.def /usr/src/debug/elfutils/0.189/tests/dwelf_elf_e_machine_string.c /usr/src/debug/elfutils/0.189/tests/early-offscn.c /usr/src/debug/elfutils/0.189/backends/riscv_init.c /usr/src/debug/elfutils/0.189/libelf/gelf_fsize.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlate.c /usr/src/debug/elfutils/0.189/libelf/version_xlate.h /usr/src/debug/elfutils/0.189/libelf/gelf_xlate.h /usr/src/debug/elfutils/0.189/tests/addrcfi.c /usr/src/debug/elfutils/0.189/backends/x86_64_retval.c /usr/src/debug/elfutils/0.189/libelf/elf_kind.c /usr/src/debug/elfutils/0.189/tests/arsymtest.c /usr/src/debug/elfutils/0.189/tests/nvidia_extended_linemap_libdw.c /usr/src/debug/elfutils/0.189/libelf/elf_error.c /usr/src/debug/elfutils/0.189/libelf/gelf_getmove.c /usr/src/debug/elfutils/0.189/libelf/gelf_getnote.c /usr/src/debug/elfutils/0.189/backends/arm_initreg.c /usr/
 src/debug/elfutils/0.189/tests/getsrc_die.c /usr/src/debug/elfutils/0.189/backends/ppc_corenote.c /usr/src/debug/elfutils/0.189/backends/sparc_reloc.def /usr/src/debug/elfutils/0.189/backends/bpf_init.c /usr/src/debug/elfutils/0.189/backends/bpf_regs.c /usr/src/debug/elfutils/0.189/tests/dwfl-proc-attach.c /usr/src/debug/elfutils/0.189/libelf/elf.h /usr/src/debug/elfutils/0.189/libelf/gelf_getsyminfo.c /usr/src/debug/elfutils/0.189/tests/getphdrnum.c /usr/src/debug/elfutils/0.189/tests/rdwrmmap.c /usr/src/debug/elfutils/0.189/backends/riscv_symbol.c /usr/src/debug/elfutils/0.189/tests/ecp.c /usr/src/debug/elfutils/0.189/backends/arm_retval.c /usr/src/debug/elfutils/0.189/backends/arm_symbol.c /usr/src/debug/elfutils/0.189/tests/elfputzdata.c /usr/src/debug/elfutils/0.189/libelf/note_xlate.h /usr/src/debug/elfutils/0.189/libelf/gelf_update_symshndx.c /usr/src/debug/elfutils/0.189/backends/riscv_retval.c /usr/src/debug/elfutils/0.189/libelf/gelf_getdyn.c /usr/src/debug/elfutils/0.189/
 libelf/gelf_getlib.c /usr/src/debug/elfutils/0.189/libelf/gelf_getrel.c /usr/src/debug/elfutils/0.189/libelf/gelf_getsym.c /usr/src/debug/elfutils/0.189/libelf/gelf_offscn.c /usr/src/debug/elfutils/0.189/src/arlib2.c /usr/src/debug/elfutils/0.189/src/elfcmp.c /usr/src/debug/elfutils/0.189/src/ranlib.c /usr/src/debug/elfutils/0.189/libelf/elf_flagehdr.c /usr/src/debug/elfutils/0.189/libelf/elf_flagphdr.c /usr/src/debug/elfutils/0.189/libelf/elf_flagshdr.c /usr/src/debug/elfutils/0.189/tests/read_unaligned.c /usr/src/debug/elfutils/0.189/libelf/elf_next.c /usr/src/debug/elfutils/0.189/backends/ia64_init.c /usr/src/debug/elfutils/0.189/backends/ia64_regs.c /usr/src/debug/elfutils/0.189/backends/arm_attrs.c /usr/src/debug/elfutils/0.189/tests/dwfl-bug-fd-leak.c /usr/src/debug/elfutils/0.189/backends/ppc_cfi.c /usr/src/debug/elfutils/0.189/backends/ppc_initreg.c /usr/src/debug/elfutils/0.189/backends/ppc64_symbol.c /usr/src/debug/elfutils/0.189/tests/dwarf-getstring.c /usr/src/debug/elfu
 tils/0.189/tests/varlocs.c /usr/src/debug/elfutils/0.189/backends/i386_initreg.c /usr/src/debug/elfutils/0.189/tests/dwelfgnucompressed.c /usr/src/debug/elfutils/0.189/backends/ppc64_unwind.c /usr/src/debug/elfutils/0.189/tests/scnnames.c /usr/src/debug/elfutils/0.189/tests/find-prologues.c /usr/src/debug/elfutils/0.189/backends/ppc_auxv.c /usr/src/debug/elfutils/0.189/backends/ppc_init.c /usr/src/debug/elfutils/0.189/backends/ppc_regs.c /usr/src/debug/elfutils/0.189/libelf/elf_fill.c /usr/src/debug/elfutils/0.189/backends/csky_symbol.c /usr/src/debug/elfutils/0.189/libelf/elf32_xlatetom.c /usr/src/debug/elfutils/0.189/tests/asm-tst4.c /usr/src/debug/elfutils/0.189/libelf/elf_rand.c /usr/src/debug/elfutils/0.189/backends/i386_cfi.c /usr/src/debug/elfutils/0.189/tests/buildid.c /usr/src/debug/elfutils/0.189/libelf/elf_getarsym.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlatetom.c /usr/src/debug/elfutils/0.189/tests/dwarf-die-addr-die.c /usr/src/debug/elfutils/0.189/tests/xlate_notes
 .c /usr/src/debug/elfutils/0.189/src/readelf.c /usr/src/debug/elfutils/0.189/tests/strptr.c /usr/src/debug/elfutils/0.189/libelf/elf32_updatenull.c /usr/src/debug/elfutils/0.189/libelf/elf_memory.c /usr/src/debug/elfutils/0.189/libelf/elf_update.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_syminfo.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_lib.c /usr/src/debug/elfutils/0.189/src/size.c /usr/src/debug/elfutils/0.189/tests/elfshphehdr.c /usr/src/debug/elfutils/0.189/src/nm.c /usr/src/debug/elfutils/0.189/backends/sh_corenote.c /usr/src/debug/elfutils/0.189/tests/elfrdwrnop.c /usr/src/debug/elfutils/0.189/tests/addrscopes.c /usr/src/debug/elfutils/0.189/tests/funcscopes.c /usr/src/debug/elfutils/0.189/src/elflint.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_sym.c /usr/src/debug/elfutils/0.189/backends/csky_initreg.c /usr/src/debug/elfutils/0.189/backends/x86_64_regs.c /usr/src/debug/elfutils/0.189/tests/deleted-lib.c /usr/src/debug/elfutils/0.189/backends/arm_auxv.c
  /usr/src/debug/elfutils/0.189/backends/arm_corenote.c /usr/src/debug/elfutils/0.189/backends/arm_init.c /usr/src/debug/elfutils/0.189/backends/arm_regs.c /usr/src/debug/elfutils/0.189/src/findtextrel.c /usr/src/debug/elfutils/0.189/libelf/elf_clone.c /usr/src/debug/elfutils/0.189/libelf/elf32_newphdr.c /usr/src/debug/elfutils/0.189/backends/arm_cfi.c /usr/src/debug/elfutils/0.189/libelf/elf32_getchdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_getehdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_getphdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_getshdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_newehdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_dyn.c /usr/src/debug/elfutils/0.189/tests/arextract.c /usr/src/debug/elfutils/0.189/tests/newfile.c /usr/src/debug/elfutils/0.189/backends/loongarch_init.c /usr/src/debug/elfutils/0.189/backends/alpha_reloc.def /usr/src/debug/elfutils/0.189/tests/zstrptr.c /usr/src/debug/elfutils/0.189/backends/ppc64_reloc.def", added "/usr/src
 /debug/elfutils/0.190/tests/dwflsyms.c /usr/src/debug/elfutils/0.190/tests/vdsosyms.c /usr/src/debug/elfutils/0.190/tests/fillfile.c /usr/src/debug/elfutils/0.190/backends/csky_regs.c /usr/src/debug/elfutils/0.190/backends/csky_reloc.def /usr/src/debug/elfutils/0.190/tests/asm-tst8.c /usr/src/debug/elfutils/0.190/backends/csky_init.c /usr/src/debug/elfutils/0.190/backends/riscv_cfi.c /usr/src/debug/elfutils/0.190/tests/get-files.c /usr/src/debug/elfutils/0.190/tests/unit-info.c /usr/src/debug/elfutils/0.190/backends/arc_symbol.c /usr/src/debug/elfutils/0.190/backends/x86_64_initreg.c /usr/src/debug/elfutils/0.190/backends/s390_symbol.c /usr/src/debug/elfutils/0.190/libelf/elf32_offscn.c /usr/src/debug/elfutils/0.190/backends/bpf_symbol.c /usr/src/debug/elfutils/0.190/libelf/elf_ndxscn.c /usr/src/debug/elfutils/0.190/libelf/elf_newscn.c /usr/src/debug/elfutils/0.190/libelf/elf_rawdata.c /usr/src/debug/elfutils/0.190/libelf/elf_rawfile.c /usr/src/debug/elfutils/0.190/libelf/elf_readal
 l.c /usr/src/debug/elfutils/0.190/src/ar.c /usr/src/debug/elfutils/0.190/backends/ia64_retval.c /usr/src/debug/elfutils/0.190/tests/rerequest_tag.c /usr/src/debug/elfutils/0.190/backends/ppc_reloc.def /usr/src/debug/elfutils/0.190/tests/attr-integrate-skel.c /usr/src/debug/elfutils/0.190/libelf/chdr_xlate.h /usr/src/debug/elfutils/0.190/src/objdump.c /usr/src/debug/elfutils/0.190/src/unstrip.c /usr/src/debug/elfutils/0.190/libelf/elf_end.c /usr/src/debug/elfutils/0.190/libelf/elf_scnshndx.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_move.c /usr/src/debug/elfutils/0.190/backends/ia64_symbol.c /usr/src/debug/elfutils/0.190/backends/sparc_regs.c /usr/src/debug/elfutils/0.190/backends/aarch64_reloc.def /usr/src/debug/elfutils/0.190/backends/sh_retval.c /usr/src/debug/elfutils/0.190/backends/sh_symbol.c /usr/src/debug/elfutils/0.190/backends/sparc_symbol.c /usr/src/debug/elfutils/0.190/backends/loongarch_symbol.c /usr/src/debug/elfutils/0.190/libelf/elf_getshdrstrndx.c /usr/src/deb
 ug/elfutils/0.190/tests/newdata.c /usr/src/debug/elfutils/0.190/libelf/gelf_getverdef.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_rela.c /usr/src/debug/elfutils/0.190/tests/debuginfod_build_id_find.c /usr/src/debug/elfutils/0.190/tests/asm-tst2.c /usr/src/debug/elfutils/0.190/backends/m68k_retval.c /usr/src/debug/elfutils/0.190/libelf/nlist.c /usr/src/debug/elfutils/0.190/libelf/nlist.h /usr/src/debug/elfutils/0.190/tests/get-pubnames.c /usr/src/debug/elfutils/0.190/tests/funcretval_test++11.cxx /usr/src/debug/elfutils/0.190/tests/system-elf-libelf-test.c /usr/src/debug/elfutils/0.190/tests/get-aranges.c /usr/src/debug/elfutils/0.190/tests/dwflmodtest.c /usr/src/debug/elfutils/0.190/backends/sparc_corenote.c /usr/src/debug/elfutils/0.190/backends/x86_corenote.c /usr/src/debug/elfutils/0.190/libelf/gelf_checksum.c /usr/src/debug/elfutils/0.190/tests/next-files.c /usr/src/debug/elfutils/0.190/tests/dwfl-bug-report.c /usr/src/debug/elfutils/0.190/backends/sparc_attrs.c /usr/src/
 debug/elfutils/0.190/backends/i386_symbol.c /usr/src/debug/elfutils/0.190/backends/ppc_retval.c /usr/src/debug/elfutils/0.190/backends/ppc_symbol.c /usr/src/debug/elfutils/0.190/libelf/elf_strptr.c /usr/src/debug/elfutils/0.190/libelf/libelfP.h /usr/src/debug/elfutils/0.190/src/strip.c /usr/src/debug/elfutils/0.190/src/arlib.c /usr/src/debug/elfutils/0.190/src/stack.c /usr/src/debug/elfutils/0.190/tests/debugaltlink.c /usr/src/debug/elfutils/0.190/src/arlib.h /usr/src/debug/elfutils/0.190/tests/elfstrtab.c /usr/src/debug/elfutils/0.190/libelf/gelf.h /usr/src/debug/elfutils/0.190/src/arlib-argp.c /usr/src/debug/elfutils/0.190/backends/aarch64_retval.c /usr/src/debug/elfutils/0.190/backends/ppc64_init.c /usr/src/debug/elfutils/0.190/backends/alpha_regs.c /usr/src/debug/elfutils/0.190/backends/arc_init.c /usr/src/debug/elfutils/0.190/tests/get-units-split.c /usr/src/debug/elfutils/0.190/backends/sparc_initreg.c /usr/src/debug/elfutils/0.190/tests/debuglink.c /usr/src/debug/elfutils/0.1
 90/backends/alpha_symbol.c /usr/src/debug/elfutils/0.190/backends/m68k_init.c /usr/src/debug/elfutils/0.190/backends/m68k_regs.c /usr/src/debug/elfutils/0.190/backends/csky_attrs.c /usr/src/debug/elfutils/0.190/backends/alpha_retval.c /usr/src/debug/elfutils/0.190/tests/newscn.c /usr/src/debug/elfutils/0.190/tests/leb128.c /usr/src/debug/elfutils/0.190/backends/csky_corenote.c /usr/src/debug/elfutils/0.190/backends/arc_reloc.def /usr/src/debug/elfutils/0.190/tests/dwarf-ranges.c /usr/src/debug/elfutils/0.190/backends/riscv_regs.c /usr/src/debug/elfutils/0.190/tests/asm-tst6.c /usr/src/debug/elfutils/0.190/backends/aarch64_corenote.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_rel.c /usr/src/debug/elfutils/0.190/backends/ppc64_retval.c /usr/src/debug/elfutils/0.190/backends/x86_64_init.c /usr/src/debug/elfutils/0.190/tests/sectiondump.c /usr/src/debug/elfutils/0.190/tests/arls.c /usr/src/debug/elfutils/0.190/tests/hash.c /usr/src/debug/elfutils/0.190/backends/aarch64_regs.c /usr
 /src/debug/elfutils/0.190/libelf/elf_getphdrnum.c /usr/src/debug/elfutils/0.190/libelf/elf_getshdrnum.c /usr/src/debug/elfutils/0.190/tests/elfgetzdata.c /usr/src/debug/elfutils/0.190/libelf/elf_compress_gnu.c /usr/src/debug/elfutils/0.190/tests/dwfl-report-offline-memory.c /usr/src/debug/elfutils/0.190/tests/low_high_pc.c /usr/src/debug/elfutils/0.190/backends/s390_reloc.def /usr/src/debug/elfutils/0.190/tests/update2.c /usr/src/debug/elfutils/0.190/libelf/gnuhash_xlate.h /usr/src/debug/elfutils/0.190/backends/arm_machineflagname.c /usr/src/debug/elfutils/0.190/tests/update4.c /usr/src/debug/elfutils/0.190/backends/ia64_reloc.def /usr/src/debug/elfutils/0.190/libelf/elf32_fsize.c /usr/src/debug/elfutils/0.190/libelf/gelf_getverdaux.c /usr/src/debug/elfutils/0.190/libelf/gelf_getauxv.c /usr/src/debug/elfutils/0.190/tests/dwfl-addr-sect.c /usr/src/debug/elfutils/0.190/tests/all-dwarf-ranges.c /usr/src/debug/elfutils/0.190/backends/common-reloc.c /usr/src/debug/elfutils/0.190/libelf/e
 lf_cntl.c /usr/src/debug/elfutils/0.190/tests/allregs.c /usr/src/debug/elfutils/0.190/libelf/gelf_getchdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_getehdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_getphdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_getshdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_newehdr.c /usr/src/debug/elfutils/0.190/backends/riscv_initreg.c /usr/src/debug/elfutils/0.190/libelf/elf32_updatefile.c /usr/src/debug/elfutils/0.190/libelf/gelf_newphdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_phdr.c /usr/src/debug/elfutils/0.190/backends/x86_64_reloc.def /usr/src/debug/elfutils/0.190/libelf/libelf.h /usr/src/debug/elfutils/0.190/tests/dwfl-bug-addr-overflow.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlatetof.c /usr/src/debug/elfutils/0.190/backends/s390_retval.c /usr/src/debug/elfutils/0.190/libelf/elf_hash.c /usr/src/debug/elfutils/0.190/backends/m68k_symbol.c /usr/src/debug/elfutils/0.190/backends/ppc64_resolve_sym.c /usr/src/debug/elfutils/0.190/lib
 elf/gelf_update_verdef.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_versym.c /usr/src/debug/elfutils/0.190/src/strings.c /usr/src/debug/elfutils/0.190/backends/x86_64_unwind.c /usr/src/debug/elfutils/0.190/src/elfcompress.c /usr/src/debug/elfutils/0.190/tests/typeiter.c /usr/src/debug/elfutils/0.190/backends/alpha_init.c /usr/src/debug/elfutils/0.190/tests/emptyfile.c /usr/src/debug/elfutils/0.190/backends/aarch64_unwind.c /usr/src/debug/elfutils/0.190/tests/line2addr.c /usr/src/debug/elfutils/0.190/tests/dwfl-report-elf-align.c /usr/src/debug/elfutils/0.190/tests/addsections.c /usr/src/debug/elfutils/0.190/tests/elfcopy.c /usr/src/debug/elfutils/0.190/libelf/elf_gnu_hash.c /usr/src/debug/elfutils/0.190/tests/next-lines.c /usr/src/debug/elfutils/0.190/backends/sparc_auxv.c /usr/src/debug/elfutils/0.190/libelf/gelf_getsymshndx.c /usr/src/debug/elfutils/0.190/backends/loongarch_initreg.c /usr/src/debug/elfutils/0.190/libelf/elf_getbase.c /usr/src/debug/elfutils/0.190/libelf/elf_
 getaroff.c /usr/src/debug/elfutils/0.190/libelf/elf_getdata.c /usr/src/debug/elfutils/0.190/backends/csky_cfi.c /usr/src/debug/elfutils/0.190/backends/aarch64_initreg.c /usr/src/debug/elfutils/0.190/libelf/gelf_getverneed.c /usr/src/debug/elfutils/0.190/tests/allfcts.c /usr/src/debug/elfutils/0.190/backends/loongarch_reloc.def /usr/src/debug/elfutils/0.190/backends/aarch64_init.c /usr/src/debug/elfutils/0.190/backends/aarch64_symbol.c /usr/src/debug/elfutils/0.190/backends/sparc_cfi.c /usr/src/debug/elfutils/0.190/tests/asm-tst1.c /usr/src/debug/elfutils/0.190/libelf/elf_getarhdr.c /usr/src/debug/elfutils/0.190/tests/asm-tst3.c /usr/src/debug/elfutils/0.190/tests/get-lines.c /usr/src/debug/elfutils/0.190/tests/next_cfi.c /usr/src/debug/elfutils/0.190/tests/asm-tst5.c /usr/src/debug/elfutils/0.190/backends/sparc_init.c /usr/src/debug/elfutils/0.190/libelf/gelf_getclass.c /usr/src/debug/elfutils/0.190/libelf/elf_begin.c /usr/src/debug/elfutils/0.190/tests/dwarf-getmacros.c /usr/src/de
 bug/elfutils/0.190/libelf/elf32_xlatetof.c /usr/src/debug/elfutils/0.190/tests/aggregate_size.c /usr/src/debug/elfutils/0.190/backends/x86_64_corenote.c /usr/src/debug/elfutils/0.190/tests/vendorelf.c /usr/src/debug/elfutils/0.190/tests/showptable.c /usr/src/debug/elfutils/0.190/backends/loongarch_regs.c /usr/src/debug/elfutils/0.190/backends/s390_initreg.c /usr/src/debug/elfutils/0.190/backends/i386_retval.c /usr/src/debug/elfutils/0.190/backends/arm_reloc.def /usr/src/debug/elfutils/0.190/tests/msg_tst.c /usr/src/debug/elfutils/0.190/libelf/elf_flagdata.c /usr/src/debug/elfutils/0.190/src/srcfiles.cxx /usr/src/debug/elfutils/0.190/libelf/gelf_update_ehdr.c /usr/src/debug/elfutils/0.190/src/elfclassify.c /usr/src/debug/elfutils/0.190/tests/dwarfcfi.c /usr/src/debug/elfutils/0.190/backends/s390_corenote.c /usr/src/debug/elfutils/0.190/backends/sparc_retval.c /usr/src/debug/elfutils/0.190/backends/aarch64_cfi.c /usr/src/debug/elfutils/0.190/backends/s390_cfi.c /usr/src/debug/elfutils
 /0.190/tests/libelf.h /usr/src/debug/elfutils/0.190/backends/loongarch_corenote.c /usr/src/debug/elfutils/0.190/tests/dwarf_default_lower_bound.c /usr/src/debug/elfutils/0.190/backends/s390_unwind.c /usr/src/debug/elfutils/0.190/backends/sh_init.c /usr/src/debug/elfutils/0.190/backends/sh_reloc.def /usr/src/debug/elfutils/0.190/tests/funcretval.c /usr/src/debug/elfutils/0.190/libelf/gelf_getversym.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_verdaux.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_vernaux.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_verneed.c /usr/src/debug/elfutils/0.190/libelf/common.h /usr/src/debug/elfutils/0.190/libelf/elf_newdata.c /usr/src/debug/elfutils/0.190/libelf/elf_nextscn.c /usr/src/debug/elfutils/0.190/libelf/elf_flagelf.c /usr/src/debug/elfutils/0.190/libelf/elf_version.c /usr/src/debug/elfutils/0.190/libelf/elf_flagscn.c /usr/src/debug/elfutils/0.190/backends/m68k_cfi.c /usr/src/debug/elfutils/0.190/backends/s390_init.c /usr/src/debug/
 elfutils/0.190/backends/s390_regs.c /usr/src/debug/elfutils/0.190/tests/show-abbrev.c /usr/src/debug/elfutils/0.190/libelf/elf32_checksum.c /usr/src/debug/elfutils/0.190/libelf/elf_getident.c /usr/src/debug/elfutils/0.190/tests/asm-tst7.c /usr/src/debug/elfutils/0.190/tests/show-die-info.c /usr/src/debug/elfutils/0.190/libelf/gelf_getrela.c /usr/src/debug/elfutils/0.190/tests/asm-tst9.c /usr/src/debug/elfutils/0.190/tests/test-flag-nobits.c /usr/src/debug/elfutils/0.190/backends/riscv_reloc.def /usr/src/debug/elfutils/0.190/backends/m68k_initreg.c /usr/src/debug/elfutils/0.190/backends/libebl_CPU.h /usr/src/debug/elfutils/0.190/tests/backtrace.c /usr/src/debug/elfutils/0.190/tests/elfgetchdr.c /usr/src/debug/elfutils/0.190/libelf/dl-hash.h /usr/src/debug/elfutils/0.190/libelf/gelf_update_auxv.c /usr/src/debug/elfutils/0.190/backends/riscv_corenote.c /usr/src/debug/elfutils/0.190/tests/alldts.c /usr/src/debug/elfutils/0.190/src/addr2line.c /usr/src/debug/elfutils/0.190/backends/x86_6
 4_cfi.c /usr/src/debug/elfutils/0.190/libelf/elf_getdata_rawchunk.c /usr/src/debug/elfutils/0.190/tests/saridx.c /usr/src/debug/elfutils/0.190/tests/get-units-invalid.c /usr/src/debug/elfutils/0.190/backends/alpha_auxv.c /usr/src/debug/elfutils/0.190/backends/m68k_corenote.c /usr/src/debug/elfutils/0.190/libelf/elf_compress.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_shdr.c /usr/src/debug/elfutils/0.190/tests/test-elf_cntl_gelf_getshdr.c /usr/src/debug/elfutils/0.190/backends/i386_corenote.c /usr/src/debug/elfutils/0.190/tests/peel_type.c /usr/src/debug/elfutils/0.190/tests/dwfl-report-segment-contiguous.c /usr/src/debug/elfutils/0.190/backends/alpha_corenote.c /usr/src/debug/elfutils/0.190/tests/update1.c /usr/src/debug/elfutils/0.190/backends/i386_unwind.c /usr/src/debug/elfutils/0.190/libelf/gelf_getvernaux.c /usr/src/debug/elfutils/0.190/tests/update3.c /usr/src/debug/elfutils/0.190/tests/typeiter2.c /usr/src/debug/elfutils/0.190/libelf/elf_getscn.c /usr/src/debug/elfutil
 s/0.190/backends/sh_regs.c /usr/src/debug/elfutils/0.190/backends/x86_64_symbol.c /usr/src/debug/elfutils/0.190/backends/i386_regs.c /usr/src/debug/elfutils/0.190/backends/i386_reloc.def /usr/src/debug/elfutils/0.190/backends/i386_auxv.c /usr/src/debug/elfutils/0.190/backends/i386_init.c /usr/src/debug/elfutils/0.190/backends/linux-core-note.c /usr/src/debug/elfutils/0.190/backends/bpf_reloc.def /usr/src/debug/elfutils/0.190/backends/ppc_attrs.c /usr/src/debug/elfutils/0.190/tests/dwfl-bug-getmodules.c /usr/src/debug/elfutils/0.190/backends/m68k_reloc.def /usr/src/debug/elfutils/0.190/tests/dwelf_elf_e_machine_string.c /usr/src/debug/elfutils/0.190/tests/early-offscn.c /usr/src/debug/elfutils/0.190/backends/riscv_init.c /usr/src/debug/elfutils/0.190/libelf/gelf_fsize.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlate.c /usr/src/debug/elfutils/0.190/libelf/version_xlate.h /usr/src/debug/elfutils/0.190/libelf/gelf_xlate.h /usr/src/debug/elfutils/0.190/tests/addrcfi.c /usr/src/debug/elf
 utils/0.190/backends/x86_64_retval.c /usr/src/debug/elfutils/0.190/libelf/elf_kind.c /usr/src/debug/elfutils/0.190/backends/loongarch_retval.c /usr/src/debug/elfutils/0.190/tests/arsymtest.c /usr/src/debug/elfutils/0.190/tests/nvidia_extended_linemap_libdw.c /usr/src/debug/elfutils/0.190/libelf/elf_error.c /usr/src/debug/elfutils/0.190/libelf/gelf_getmove.c /usr/src/debug/elfutils/0.190/libelf/gelf_getnote.c /usr/src/debug/elfutils/0.190/backends/arm_initreg.c /usr/src/debug/elfutils/0.190/tests/getsrc_die.c /usr/src/debug/elfutils/0.190/backends/ppc_corenote.c /usr/src/debug/elfutils/0.190/backends/sparc_reloc.def /usr/src/debug/elfutils/0.190/backends/bpf_init.c /usr/src/debug/elfutils/0.190/backends/bpf_regs.c /usr/src/debug/elfutils/0.190/tests/dwfl-proc-attach.c /usr/src/debug/elfutils/0.190/libelf/elf.h /usr/src/debug/elfutils/0.190/libelf/gelf_getsyminfo.c /usr/src/debug/elfutils/0.190/tests/getphdrnum.c /usr/src/debug/elfutils/0.190/tests/rdwrmmap.c /usr/src/debug/elfutils/0
 .190/backends/riscv_symbol.c /usr/src/debug/elfutils/0.190/tests/ecp.c /usr/src/debug/elfutils/0.190/tests/system-elf-gelf-test.c /usr/src/debug/elfutils/0.190/backends/arm_retval.c /usr/src/debug/elfutils/0.190/backends/arm_symbol.c /usr/src/debug/elfutils/0.190/tests/elfputzdata.c /usr/src/debug/elfutils/0.190/libelf/note_xlate.h /usr/src/debug/elfutils/0.190/libelf/gelf_update_symshndx.c /usr/src/debug/elfutils/0.190/backends/riscv_retval.c /usr/src/debug/elfutils/0.190/libelf/gelf_getdyn.c /usr/src/debug/elfutils/0.190/libelf/gelf_getlib.c /usr/src/debug/elfutils/0.190/libelf/gelf_getrel.c /usr/src/debug/elfutils/0.190/libelf/gelf_getsym.c /usr/src/debug/elfutils/0.190/libelf/gelf_offscn.c /usr/src/debug/elfutils/0.190/src/arlib2.c /usr/src/debug/elfutils/0.190/src/elfcmp.c /usr/src/debug/elfutils/0.190/src/ranlib.c /usr/src/debug/elfutils/0.190/backends/loongarch_cfi.c /usr/src/debug/elfutils/0.190/libelf/elf_flagehdr.c /usr/src/debug/elfutils/0.190/libelf/elf_flagphdr.c /usr/s
 rc/debug/elfutils/0.190/libelf/elf_flagshdr.c /usr/src/debug/elfutils/0.190/tests/read_unaligned.c /usr/src/debug/elfutils/0.190/libelf/elf_next.c /usr/src/debug/elfutils/0.190/backends/ia64_init.c /usr/src/debug/elfutils/0.190/backends/ia64_regs.c /usr/src/debug/elfutils/0.190/backends/arm_attrs.c /usr/src/debug/elfutils/0.190/backends/ppc_cfi.c /usr/src/debug/elfutils/0.190/tests/dwfl-bug-fd-leak.c /usr/src/debug/elfutils/0.190/backends/ppc_initreg.c /usr/src/debug/elfutils/0.190/backends/ppc64_symbol.c /usr/src/debug/elfutils/0.190/tests/dwarf-getstring.c /usr/src/debug/elfutils/0.190/backends/loongarch_unwind.c /usr/src/debug/elfutils/0.190/tests/varlocs.c /usr/src/debug/elfutils/0.190/backends/i386_initreg.c /usr/src/debug/elfutils/0.190/tests/dwelfgnucompressed.c /usr/src/debug/elfutils/0.190/backends/ppc64_unwind.c /usr/src/debug/elfutils/0.190/tests/scnnames.c /usr/src/debug/elfutils/0.190/tests/find-prologues.c /usr/src/debug/elfutils/0.190/backends/ppc_auxv.c /usr/src/debu
 g/elfutils/0.190/backends/ppc_init.c /usr/src/debug/elfutils/0.190/backends/ppc_regs.c /usr/src/debug/elfutils/0.190/libelf/elf_fill.c /usr/src/debug/elfutils/0.190/backends/csky_symbol.c /usr/src/debug/elfutils/0.190/libelf/elf32_xlatetom.c /usr/src/debug/elfutils/0.190/tests/asm-tst4.c /usr/src/debug/elfutils/0.190/libelf/elf_rand.c /usr/src/debug/elfutils/0.190/backends/i386_cfi.c /usr/src/debug/elfutils/0.190/tests/buildid.c /usr/src/debug/elfutils/0.190/libelf/elf_getarsym.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlatetom.c /usr/src/debug/elfutils/0.190/tests/dwarf-die-addr-die.c /usr/src/debug/elfutils/0.190/tests/xlate_notes.c /usr/src/debug/elfutils/0.190/src/readelf.c /usr/src/debug/elfutils/0.190/tests/strptr.c /usr/src/debug/elfutils/0.190/libelf/elf32_updatenull.c /usr/src/debug/elfutils/0.190/libelf/elf_memory.c /usr/src/debug/elfutils/0.190/libelf/elf_update.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_syminfo.c /usr/src/debug/elfutils/0.190/libelf/gelf_update
 _lib.c /usr/src/debug/elfutils/0.190/src/size.c /usr/src/debug/elfutils/0.190/tests/elfshphehdr.c /usr/src/debug/elfutils/0.190/src/nm.c /usr/src/debug/elfutils/0.190/backends/sh_corenote.c /usr/src/debug/elfutils/0.190/tests/elfrdwrnop.c /usr/src/debug/elfutils/0.190/tests/addrscopes.c /usr/src/debug/elfutils/0.190/tests/funcscopes.c /usr/src/debug/elfutils/0.190/src/elflint.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_sym.c /usr/src/debug/elfutils/0.190/backends/csky_initreg.c /usr/src/debug/elfutils/0.190/backends/x86_64_regs.c /usr/src/debug/elfutils/0.190/tests/deleted-lib.c /usr/src/debug/elfutils/0.190/backends/arm_auxv.c /usr/src/debug/elfutils/0.190/backends/arm_corenote.c /usr/src/debug/elfutils/0.190/backends/arm_init.c /usr/src/debug/elfutils/0.190/backends/arm_regs.c /usr/src/debug/elfutils/0.190/src/findtextrel.c /usr/src/debug/elfutils/0.190/libelf/elf_clone.c /usr/src/debug/elfutils/0.190/libelf/elf32_newphdr.c /usr/src/debug/elfutils/0.190/backends/arm_cfi.c /
 usr/src/debug/elfutils/0.190/libelf/elf32_getehdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_getphdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_getshdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_newehdr.c /usr/src/debug/elfutils/0.190/tests/arextract.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_dyn.c /usr/src/debug/elfutils/0.190/tests/newfile.c /usr/src/debug/elfutils/0.190/libelf/elf32_getchdr.h /usr/src/debug/elfutils/0.190/backends/loongarch_init.c /usr/src/debug/elfutils/0.190/backends/alpha_reloc.def /usr/src/debug/elfutils/0.190/tests/zstrptr.c /usr/src/debug/elfutils/0.190/backends/ppc64_reloc.def"
packages/core2-64-poky-linux/elfutils/elfutils-src: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-src: PKGSIZE changed from 4784766 to 4873827 (+2%)
packages/core2-64-poky-linux/elfutils/elfutils-staticdev: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-staticdev: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-staticdev: PKGSIZE changed from 10693708 to 10784886 (+1%)
packages/core2-64-poky-linux/elfutils/elfutils: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils: FILELIST: added "/usr/bin/eu-srcfiles"
packages/core2-64-poky-linux/elfutils/elfutils: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils: PKGSIZE changed from 1586405 to 1641909 (+3%)
packages/core2-64-poky-linux/elfutils: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils: SRC_URI changed from "https://sourceware.org/elfutils/ftp/0.189/elfutils-0.189.tar.bz2 file://run-ptest file://0001-dso-link-change.patch file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch file://0003-fixheadercheck.patch file://0006-Fix-build-on-aarch64-musl.patch file://0001-libasm-may-link-with-libbz2-if-found.patch file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch file://0001-skip-the-test-when-gcc-not-deployed.patch file://ptest.patch file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch file://0001-Add-helper-function-for-basename.patch file://0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch" to "https://sourceware.org/elfutils/ftp/0.190/elfutils-0.190.tar.bz2 file://run-ptest file://0001-dso-link-change.patch file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch file://0003-fixheadercheck.patch file://0006-Fix-build-on-aarch64-musl.patch file://0001-libasm-may-link-
 with-libbz2-if-found.patch file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch file://0001-skip-the-test-when-gcc-not-deployed.patch file://ptest.patch file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch file://0001-Add-helper-function-for-basename.patch file://0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch"
packages/core2-64-poky-linux/elfutils/libasm: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libasm: FILELIST: removed "/usr/lib/libasm-0.189.so", added "/usr/lib/libasm-0.190.so"
packages/core2-64-poky-linux/elfutils/libasm: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libasm: FILES: removed "/usr/lib/libasm-0.189.so", added "/usr/lib/libasm-0.190.so"
packages/core2-64-poky-linux/elfutils/libdebuginfod: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libdebuginfod: FILELIST: removed "/usr/lib/libdebuginfod-0.189.so", added "/usr/lib/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/libdebuginfod: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libdebuginfod: FILES: removed "/usr/lib/libdebuginfod-0.189.so", added "/usr/lib/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/libdw: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libdw: FILELIST: removed "/usr/lib/libdw-0.189.so", added "/usr/lib/libdw-0.190.so"
packages/core2-64-poky-linux/elfutils/libdw: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libdw: PKGSIZE changed from 642078 to 646174 (+1%)
packages/core2-64-poky-linux/elfutils/libdw: FILES: removed "/usr/lib/libdw-0.189.so", added "/usr/lib/libdw-0.190.so"
packages/core2-64-poky-linux/elfutils/libelf: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libelf: FILELIST: removed "/usr/lib/libelf-0.189.so", added "/usr/lib/libelf-0.190.so"
packages/core2-64-poky-linux/elfutils/libelf: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libelf: PKGSIZE changed from 104575 to 108671 (+4%)
packages/core2-64-poky-linux/elfutils/libelf: FILES: removed "/usr/lib/libelf-0.189.so", added "/usr/lib/libelf-0.190.so"
Changes to packages/core2-64-poky-linux/elfutils (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.189.so to libasm-0.190.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.189.so to libdw-0.190.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.189.so to libelf-0.190.so
  /usr/lib/libasm-0.189.so moved to /usr/lib/libasm-0.190.so
  /usr/lib/libdebuginfod-0.189.so moved to /usr/lib/libdebuginfod-0.190.so
  /usr/lib/libdw-0.189.so moved to /usr/lib/libdw-0.190.so
  /usr/lib/libelf-0.189.so moved to /usr/lib/libelf-0.190.so
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 8294216 to 8294256 (+0%)
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/lib/libasm.so.1 changed symlink target from libasm-0.189.so to libasm-0.190.so
  /usr/lib/libdebuginfod.so.1 changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdebuginfod.so changed symlink target from libdebuginfod-0.189.so to libdebuginfod-0.190.so
  /usr/lib/libdw.so.1 changed symlink target from libdw-0.189.so to libdw-0.190.so
  /usr/lib/libelf.so.1 changed symlink target from libelf-0.189.so to libelf-0.190.so
  /usr/lib/libasm-0.189.so moved to /usr/lib/libasm-0.190.so
  /usr/lib/libdebuginfod-0.189.so moved to /usr/lib/libdebuginfod-0.190.so
  /usr/lib/libdw-0.189.so moved to /usr/lib/libdw-0.190.so
  /usr/lib/libelf-0.189.so moved to /usr/lib/libelf-0.190.so
  /usr/bin/eu-srcfiles was added

--===============5969807256642563416==--

