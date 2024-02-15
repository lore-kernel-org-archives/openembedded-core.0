Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E69AC54EE0
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:39 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20328.1708018344780522894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hwDO1Fpn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jLhjkglA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018dadd3a058-6b26deff-e06b-4e77-b711-276464e4b97e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3Hi3wymifuj+5M1Uww2bfbuU8iLgTEmW8BE4bIORC0E=;
	b=hwDO1Fpng4c2Al+jwR3qTy3+bTHR91y4zLENXmDcOscFndwyLzGwJxoSUX1dCzqp
	0A3EvMbGdB1v7vbwT36xVL31L9HQtcrn+4xwnNV4EncPM5hPDrSsKzSaHTcrzE0n4lQ
	oKuIYykfNirEzxMh91Zu+EDzMgV5T0upWD9zKN4U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3Hi3wymifuj+5M1Uww2bfbuU8iLgTEmW8BE4bIORC0E=;
	b=jLhjkglADzKES1uRVWrCZO5V6insKxh/NKfwWpek6QpDpYlDzi7FOiympxh2eIZN
	L6Ccsj4ukm+gd8jqt1pzY8rIhztwu4uJ8sldvl6uLxEBYpwhJwyNGmLqSubJTpG8S7x
	P+PllQaZ1KaT4kwLtooW2OUJ0iRkcuNGEPGLriRE=
Content-Type: multipart/mixed; boundary="===============6967352585882484388=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] elfutils: upgrading to 0.190 SUCCEEDED
Message-ID: <0101018dadd3a058-6b26deff-e06b-4e77-b711-276464e4b97e-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195579

--===============6967352585882484388==
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
From 542f640e17fd291f51ba06a19b28102eda88bc7a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 07:27:57 +0000
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
index 3e6033fd75..d5bd15770a 100644
--- a/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-Add-helper-function-for-basename.patch
@@ -1,4 +1,4 @@
-From 666372a5d8d5a23203c70d583904097c9e49c5a0 Mon Sep 17 00:00:00 2001
+From f4d9a4715412df3efeb2e874cfa1473976b8c427 Mon Sep 17 00:00:00 2001
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
index 6acc036406..9cee24c9b2 100644
--- a/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-dso-link-change.patch
@@ -1,4 +1,4 @@
-From c5fb59ac0819b5b6d8244c613cbcf92cb09840c1 Mon Sep 17 00:00:00 2001
+From 5a6d9ebeeff1828b369aba2e4c32ff6460f5b822 Mon Sep 17 00:00:00 2001
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
index 09c9d3ea24..0952e28028 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
@@ -1,4 +1,4 @@
-From ed1975deeaa47f98d212fd144c8bda075b1a5d36 Mon Sep 17 00:00:00 2001
+From 9ee9fb9833a28bdd0c82a8ab9a4883262bd2dccf Mon Sep 17 00:00:00 2001
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
index c8d55d583a..51f302d33c 100644
--- a/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch
@@ -1,4 +1,4 @@
-From f40cbd43acdb1fefef4fa53a6034296d83cbff7d Mon Sep 17 00:00:00 2001
+From b952603eb2b47b7ad78749023d30bb8099eea8ff Mon Sep 17 00:00:00 2001
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
index 0e6bf5573c..b419b44fa4 100644
--- a/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-skip-the-test-when-gcc-not-deployed.patch
@@ -1,4 +1,4 @@
-From 2fa52d61b1abdf4a3f3b153c771fb2081666430c Mon Sep 17 00:00:00 2001
+From d2f37536aaf2fbe8aa9a1154df4e7cca80212151 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Tue, 21 May 2019 15:20:34 +0800
 Subject: [PATCH] skip the test when gcc not deployed
diff --git a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
index a2c0b90227..7301caff18 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch
@@ -1,4 +1,4 @@
-From e355ca3b8ddcc6e73ee140f53d25634afdaec0da Mon Sep 17 00:00:00 2001
+From 3fc5a8dae35f98c19aadabc8f72b747b0b3cdae6 Mon Sep 17 00:00:00 2001
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
index 5e0c7e9766..643e96aa48 100644
--- a/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch
@@ -1,4 +1,4 @@
-From 901c6a8c78c3c4eee244b9d5298cbd7b9aa713d1 Mon Sep 17 00:00:00 2001
+From a25500ce3ce3161d973791da417acb3927df8dc9 Mon Sep 17 00:00:00 2001
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
index be48ef010b..b44f029723 100644
--- a/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch
@@ -1,4 +1,4 @@
-From 1643d793761216252bb654e28aaa5b8eb1536bca Mon Sep 17 00:00:00 2001
+From e3ca028a1d6c9ca9101634952cd44d70a10937ec Mon Sep 17 00:00:00 2001
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
index 212b358dc2..9328216dc6 100644
--- a/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-fixheadercheck.patch
@@ -1,4 +1,4 @@
-From 7e1f91c42ef5b0bf10afefec10dd08588df3ab1f Mon Sep 17 00:00:00 2001
+From c12681f8f2aec73221451dce7a79ddb187813097 Mon Sep 17 00:00:00 2001
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
index 93f5bdcd00..7993a46a13 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 262ac90394e36e0b4e86042d9c5385703f5b6536 Mon Sep 17 00:00:00 2001
+From 1c68468dfe5d191c1743eb94c80f75db27aacdb2 Mon Sep 17 00:00:00 2001
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
index 8942ad7828..d9b12dd4c9 100644
--- a/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0006-Fix-build-on-aarch64-musl.patch
@@ -1,4 +1,4 @@
-From 2396fd67d81e54e18fbad67a5ff67d5684a01013 Mon Sep 17 00:00:00 2001
+From 9fe7e1786381e0c16c4ac330d3b9d4a1c05f1d0a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 17:27:30 +0800
 Subject: [PATCH] Fix build on aarch64/musl
diff --git a/meta/recipes-devtools/elfutils/files/ptest.patch b/meta/recipes-devtools/elfutils/files/ptest.patch
index fe6f272a83..f1346fbe84 100644
--- a/meta/recipes-devtools/elfutils/files/ptest.patch
+++ b/meta/recipes-devtools/elfutils/files/ptest.patch
@@ -1,4 +1,4 @@
-From bfbf393e7d5b1b41df85ce1c37e887776c45d529 Mon Sep 17 00:00:00 2001
+From 97b7602e820ad4a93d4d0c95241d6d3ec133e206 Mon Sep 17 00:00:00 2001
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


--===============6967352585882484388==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-elfutils-upgrade-0.189-0.190.patch"

RnJvbSA1NDJmNjQwZTE3ZmQyOTFmNTFiYTA2YTE5YjI4MTAyZWRhODhiYzdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMDc6Mjc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
bGZ1dGlsczogdXBncmFkZSAwLjE4OSAtPiAwLjE5MAoKLS0tCiAuLi4ve2VsZnV0aWxzXzAuMTg5
LmJiID0+IGVsZnV0aWxzXzAuMTkwLmJifSAgfCAgIDIgKy0KIC4uLjAwMS1BZGQtaGVscGVyLWZ1
bmN0aW9uLWZvci1iYXNlbmFtZS5wYXRjaCB8IDExNyArKysrKysrKysrKystLS0tLS0KIC4uLi9l
bGZ1dGlscy9maWxlcy8wMDAxLWRzby1saW5rLWNoYW5nZS5wYXRjaCB8ICAxMiArLQogLi4ubGli
YXNtLW1heS1saW5rLXdpdGgtbGliYnoyLWlmLWZvdW5kLnBhdGNoIHwgICA2ICstCiAuLi4tY2hl
Y2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUucGF0Y2ggfCAgIDYgKy0KIC4uLi1za2lw
LXRoZS10ZXN0LXdoZW4tZ2NjLW5vdC1kZXBsb3llZC5wYXRjaCB8ICAgMiArLQogLi4ubS1jb21w
aWxlLXRlc3Rfbmxpc3Qtd2l0aC1zdGFuZGFyZC1DLnBhdGNoIHwgICA2ICstCiAuLi5hZ2FpbnN0
LXVwY29taW5nLWdjYy0xNC1XZXJyb3ItY2FsbG8ucGF0Y2ggfCAgIDYgKy0KIC4uLmN2dF9ndW5o
YXNoLWlmLWRlc3QtYW5kLXNyYy1hcmUtc2FtZS5wYXRjaCB8ICAgOCArLQogLi4uL2VsZnV0aWxz
L2ZpbGVzLzAwMDMtZml4aGVhZGVyY2hlY2sucGF0Y2ggIHwgICA2ICstCiAuLi4vZWxmdXRpbHMv
ZmlsZXMvMDAwMy1tdXNsLXV0aWxzLnBhdGNoICAgICAgfCAgIDYgKy0KIC4uLi8wMDA2LUZpeC1i
dWlsZC1vbi1hYXJjaDY0LW11c2wucGF0Y2ggICAgICB8ICAgMiArLQogLi4uL2VsZnV0aWxzL2Zp
bGVzL3B0ZXN0LnBhdGNoICAgICAgICAgICAgICAgIHwgIDEwICstCiAxMyBmaWxlcyBjaGFuZ2Vk
LCAxMTMgaW5zZXJ0aW9ucygrKSwgNzYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2VsZnV0aWxzL3tlbGZ1dGlsc18wLjE4OS5iYiA9PiBlbGZ1dGlsc18wLjE5MC5i
Yn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxm
dXRpbHNfMC4xODkuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNf
MC4xOTAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2VsZnV0aWxzL2VsZnV0aWxzXzAuMTg5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZWxmdXRpbHMvZWxmdXRpbHNfMC4xOTAuYmIKaW5kZXggMDc2YmE0NzM1OC4uOGM1
NGM3OGZjMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2VsZnV0
aWxzXzAuMTg5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9lbGZ1dGls
c18wLjE5MC5iYgpAQCAtMjcsNyArMjcsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vc291cmNld2Fy
ZS5vcmcvZWxmdXRpbHMvZnRwLyR7UFZ9LyR7QlB9LnRhci5iejIgXAogU1JDX1VSSTphcHBlbmQ6
bGliYy1tdXNsID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLW11c2wtdXRpbHMucGF0Y2gg
XAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzliZDhmMWEzMzhlMmI3Y2Q0
YWJjM2ZmMTFhMGVkZGM2ZTY5MGY2OTU3OGE1NzQ3OGQ4MTc5YjQxNDg3MDhjOCIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICI4ZTAwYTNhOWI1ZjA0YmMxZGMyNzNhZTg2MjgxZDJkMjZlZDQxMjAyMGIz
OTFmZmNjMjMxOThmMTAyMzFkNjkyIgogCiBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0IHB0ZXN0
IHBrZ2NvbmZpZwogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMv
ZmlsZXMvMDAwMS1BZGQtaGVscGVyLWZ1bmN0aW9uLWZvci1iYXNlbmFtZS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLUFkZC1oZWxwZXItZnVuY3Rpb24t
Zm9yLWJhc2VuYW1lLnBhdGNoCmluZGV4IDNlNjAzM2ZkNzUuLmQ1YmQxNTc3MGEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLUFkZC1oZWxwZXIt
ZnVuY3Rpb24tZm9yLWJhc2VuYW1lLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9l
bGZ1dGlscy9maWxlcy8wMDAxLUFkZC1oZWxwZXItZnVuY3Rpb24tZm9yLWJhc2VuYW1lLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2NjYzNzJhNWQ4ZDVhMjMyMDNjNzBkNTgzOTA0MDk3Yzll
NDljNWEwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNGQ5YTQ3MTU0MTJkZjNlZmVi
MmU4NzRjZmExNDczOTc2YjhjNDI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgOSBEZWMgMjAyMyAxODoyMzow
MyAtMDgwMAogU3ViamVjdDogW1BBVENIXSBBZGQgaGVscGVyIGZ1bmN0aW9uIGZvciBiYXNlbmFt
ZQpAQCAtMTIsMjcgKzEyLDMxIEBAIGxpYnJhcmllcyB3aGljaCBoYXZlIFBPU0lYIGltcGxlbWVu
dGF0aW9uIG9ubHkuCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9zb3VyY2V3
YXJlLm9yZy9waXBlcm1haWwvZWxmdXRpbHMtZGV2ZWwvMjAyM3E0LzAwNjcyNy5odG1sXQogWzFd
IGh0dHBzOi8vZ2l0Lm11c2wtbGliYy5vcmcvY2dpdC9tdXNsL2NvbW1pdC8/aWQ9NzI1ZTE3ZWQ2
ZGZmNGQwY2QyMjQ4N2JiNjQ0NzA4ODFlODZhOTJlNwogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCiAgbGliL01ha2VmaWxlLmFtICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KICBsaWIvbGliZXUuaCAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMSArCi0gbGliL3tsaWJldS5oID0+IHhiYXNlbmFtZS5jfSAgICAgICAgIHwgMzEgKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLQorIGxpYi94YmFzZW5hbWUuYyAgICAgICAgICAgICAgICAg
ICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKICBsaWJkdy9kd2FyZl9nZXRz
cmNfZmlsZS5jICAgICAgICAgICAgfCAgMyArKy0KICBsaWJkd2ZsL2NvcmUtZmlsZS5jICAgICAg
ICAgICAgICAgICAgfCAgMyArKy0KICBsaWJkd2ZsL2R3ZmxfbW9kdWxlX2dldHNyY19maWxlLmMg
ICAgfCAgMyArKy0KICBsaWJkd2ZsL2R3Zmxfc2VnbWVudF9yZXBvcnRfbW9kdWxlLmMgfCAgMyAr
Ky0KLSBsaWJkd2ZsL2ZpbmQtZGVidWdpbmZvLmMgICAgICAgICAgICAgfCAgNyArKysrLS0tCisg
bGliZHdmbC9maW5kLWRlYnVnaW5mby5jICAgICAgICAgICAgIHwgIDcgKystLS0KICBsaWJkd2Zs
L2xpbmtfbWFwLmMgICAgICAgICAgICAgICAgICAgfCAgMyArKy0KICBsaWJkd2ZsL2xpbnV4LWtl
cm5lbC1tb2R1bGVzLmMgICAgICAgfCAgMyArKy0KLSBzcmMvYWRkcjJsaW5lLmMgICAgICAgICAg
ICAgICAgICAgICAgfCAgNSArKystLQotIHNyYy9hci5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA1ICsrKy0tCi0gc3JjL25tLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKystLQorIHNyYy9hZGRyMmxpbmUuYyAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrLS0K
KyBzcmMvYXIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0tCisgc3JjL25t
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiAgc3JjL3N0YWNrLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKystCiAgc3JjL3N0cmlwLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KLSB0ZXN0cy9zaG93LWRpZS1pbmZvLmMgICAgICAgICAgICAg
ICAgfCAgMiArLQotIHRlc3RzL3ZhcmxvY3MuYyAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
Ci0gMTcgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCi0g
Y29weSBsaWIve2xpYmV1LmggPT4geGJhc2VuYW1lLmN9ICg1NyUpCisgdGVzdHMvTWFrZWZpbGUu
YW0gICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KKyB0ZXN0cy9zaG93LWRpZS1pbmZvLmMgICAg
ICAgICAgICAgICAgfCAgMyArKy0KKyB0ZXN0cy92YXJsb2NzLmMgICAgICAgICAgICAgICAgICAg
ICAgfCAgMyArKy0KKyAxOCBmaWxlcyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCAyMSBkZWxl
dGlvbnMoLSkKKyBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3hiYXNlbmFtZS5jCiAKK2RpZmYgLS1n
aXQgYS9saWIvTWFrZWZpbGUuYW0gYi9saWIvTWFrZWZpbGUuYW0KK2luZGV4IGIzYmI5MjkuLmFk
YTUxYzAgMTAwNjQ0CiAtLS0gYS9saWIvTWFrZWZpbGUuYW0KICsrKyBiL2xpYi9NYWtlZmlsZS5h
bQogQEAgLTMzLDcgKzMzLDcgQEAgQU1fQ1BQRkxBR1MgKz0gLUkkKHNyY2RpcikvLi4vbGliZWxm
CkBAIC00NCw5ICs0OCwxMSBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogIAkJICBjcmMzMi5jIGNyYzMyX2ZpbGUuYyBcCiAgCQkgIGNvbG9yLmMgZXJyb3Iu
YyBwcmludHZlcnNpb24uYwogIAorZGlmZiAtLWdpdCBhL2xpYi9saWJldS5oIGIvbGliL2xpYmV1
LmgKK2luZGV4IGU4NDlhNzkuLjJhMTE1YWMgMTAwNjQ0CiAtLS0gYS9saWIvbGliZXUuaAogKysr
IGIvbGliL2xpYmV1LmgKLUBAIC00Miw2ICs0Miw3IEBAIGV4dGVybiBjaGFyICp4c3RybmR1cCAo
Y29uc3QgY2hhciAqLCBzaXoKK0BAIC00Miw2ICs0Miw3IEBAIGV4dGVybiBjaGFyICp4c3RybmR1
cCAoY29uc3QgY2hhciAqLCBzaXplX3QpIF9fYXR0cmlidXRlX18gKChfX21hbGxvY19fKSk7CiAg
ZXh0ZXJuIGNoYXIgKnhhc3ByaW50Zihjb25zdCBjaGFyICpmbXQsIC4uLikKICAJX19hdHRyaWJ1
dGVfXyAoKGZvcm1hdCAocHJpbnRmLCAxLCAyKSkpIF9fYXR0cmlidXRlX18gKChfX21hbGxvY19f
KSk7CiAgCkBAIC01NCw2ICs2MCw5IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+CiAgZXh0ZXJuIHVpbnQzMl90IGNyYzMyICh1aW50MzJfdCBjcmMsIHVuc2ln
bmVkIGNoYXIgKmJ1Ziwgc2l6ZV90IGxlbik7CiAgZXh0ZXJuIGludCBjcmMzMl9maWxlIChpbnQg
ZmQsIHVpbnQzMl90ICpyZXNwKTsKICAKK2RpZmYgLS1naXQgYS9saWIveGJhc2VuYW1lLmMgYi9s
aWIveGJhc2VuYW1lLmMKK25ldyBmaWxlIG1vZGUgMTAwNjQ0CitpbmRleCAwMDAwMDAwLi42OGQ1
MTYxCiAtLS0gL2Rldi9udWxsCiArKysgYi9saWIveGJhc2VuYW1lLmMKIEBAIC0wLDAgKzEsMzkg
QEAKQEAgLTk2LDYgKzEwNSw4IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+CiArICAgIGNvbnN0IGNoYXIgKnAgPSBzdHJyY2hyKHMsICcvJyk7CiArICAgIHJl
dHVybiBwID8gcCsxIDogczsKICt9CitkaWZmIC0tZ2l0IGEvbGliZHcvZHdhcmZfZ2V0c3JjX2Zp
bGUuYyBiL2xpYmR3L2R3YXJmX2dldHNyY19maWxlLmMKK2luZGV4IDUyODljN2QuLmY3NWJmN2Ig
MTAwNjQ0CiAtLS0gYS9saWJkdy9kd2FyZl9nZXRzcmNfZmlsZS5jCiArKysgYi9saWJkdy9kd2Fy
Zl9nZXRzcmNfZmlsZS5jCiBAQCAtMzcsNiArMzcsNyBAQApAQCAtMTA2LDcgKzExNyw3IEBAIFNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCiAgCiAgaW50Ci1A
QCAtOTgsNyArOTksNyBAQCBkd2FyZl9nZXRzcmNfZmlsZSAoRHdhcmYgKmRiZywgY29uc3QgY2hh
CitAQCAtOTgsNyArOTksNyBAQCBkd2FyZl9nZXRzcmNfZmlsZSAoRHdhcmYgKmRiZywgY29uc3Qg
Y2hhciAqZm5hbWUsIGludCBsaW5lbm8sIGludCBjb2x1bW4sCiAgCSAgICAgIC8qIE1hdGNoIHRo
ZSBuYW1lIHdpdGggdGhlIG5hbWUgdGhlIHVzZXIgcHJvdmlkZWQuICAqLwogIAkgICAgICBjb25z
dCBjaGFyICpmbmFtZTIgPSBsaW5lLT5maWxlcy0+aW5mb1tsYXN0ZmlsZV0ubmFtZTsKICAJICAg
ICAgaWYgKGlzX2Jhc2VuYW1lKQpAQCAtMTE1LDYgKzEyNiw4IEBAIFNpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCSAgICAgIGVsc2UKICAJCWxhc3RtYXRjaCA9
IHN0cmNtcCAoZm5hbWUyLCBmbmFtZSkgPT0gMDsKICAJICAgIH0KK2RpZmYgLS1naXQgYS9saWJk
d2ZsL2NvcmUtZmlsZS5jIGIvbGliZHdmbC9jb3JlLWZpbGUuYworaW5kZXggODdjOTQwYy4uNTJh
MzRiOCAxMDA2NDQKIC0tLSBhL2xpYmR3ZmwvY29yZS1maWxlLmMKICsrKyBiL2xpYmR3ZmwvY29y
ZS1maWxlLmMKIEBAIC0yOSw2ICsyOSw3IEBACkBAIC0xMjUsNyArMTM4LDcgQEAgU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAjaW5jbHVkZSAibGliZHdmbFAu
aCIKICAjaW5jbHVkZSA8Z2VsZi5oPgogIAotQEAgLTU5NSw3ICs1OTYsNyBAQCBkd2ZsX2NvcmVf
ZmlsZV9yZXBvcnQgKER3ZmwgKmR3ZmwsIEVsZiAqCitAQCAtNTk1LDcgKzU5Niw3IEBAIGR3Zmxf
Y29yZV9maWxlX3JlcG9ydCAoRHdmbCAqZHdmbCwgRWxmICplbGYsIGNvbnN0IGNoYXIgKmV4ZWN1
dGFibGUpCiAgICAgICAgaWYgKCEgX19saWJkd2ZsX2R5bmFtaWNfdmFkZHJfZ2V0IChtb2R1bGUt
PmVsZiwgJmZpbGVfZHluYW1pY192YWRkcikpCiAgCWNvbnRpbnVlOwogICAgICAgIER3ZmxfTW9k
dWxlICptb2Q7CkBAIC0xMzQsNiArMTQ3LDggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJh
ai5raGVtQGdtYWlsLmNvbT4KICAJCQkJICBtb2R1bGUtPmZkLCBtb2R1bGUtPmVsZiwKICAJCQkJ
ICBtb2R1bGUtPmxfbGQgLSBmaWxlX2R5bmFtaWNfdmFkZHIsCiAgCQkJCSAgdHJ1ZSwgdHJ1ZSk7
CitkaWZmIC0tZ2l0IGEvbGliZHdmbC9kd2ZsX21vZHVsZV9nZXRzcmNfZmlsZS5jIGIvbGliZHdm
bC9kd2ZsX21vZHVsZV9nZXRzcmNfZmlsZS5jCitpbmRleCA1MTNhZjZiLi4wNDE4YTI2IDEwMDY0
NAogLS0tIGEvbGliZHdmbC9kd2ZsX21vZHVsZV9nZXRzcmNfZmlsZS5jCiArKysgYi9saWJkd2Zs
L2R3ZmxfbW9kdWxlX2dldHNyY19maWxlLmMKIEBAIC0zMSw2ICszMSw3IEBACkBAIC0xNDQsNyAr
MTU5LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAj
aW5jbHVkZSAibGliZHdQLmgiCiAgCiAgCi1AQCAtMTAzLDcgKzEwNCw3IEBAIGR3ZmxfbW9kdWxl
X2dldHNyY19maWxlIChEd2ZsX01vZHVsZSAqbW8KK0BAIC0xMDMsNyArMTA0LDcgQEAgZHdmbF9t
b2R1bGVfZ2V0c3JjX2ZpbGUgKER3ZmxfTW9kdWxlICptb2QsCiAgCQl7CiAgCQkgIC8qIE1hdGNo
IHRoZSBuYW1lIHdpdGggdGhlIG5hbWUgdGhlIHVzZXIgcHJvdmlkZWQuICAqLwogIAkJICBsYXN0
ZmlsZSA9IGZpbGU7CkBAIC0xNTMsNiArMTY4LDggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4KICAJCQkJICAgICAgIGZuYW1lKTsKICAJCX0KICAJICAgIH0K
K2RpZmYgLS1naXQgYS9saWJkd2ZsL2R3Zmxfc2VnbWVudF9yZXBvcnRfbW9kdWxlLmMgYi9saWJk
d2ZsL2R3Zmxfc2VnbWVudF9yZXBvcnRfbW9kdWxlLmMKK2luZGV4IDNlZjYyYTcuLjE1NjIxYWQg
MTAwNjQ0CiAtLS0gYS9saWJkd2ZsL2R3Zmxfc2VnbWVudF9yZXBvcnRfbW9kdWxlLmMKICsrKyBi
L2xpYmR3ZmwvZHdmbF9zZWdtZW50X3JlcG9ydF9tb2R1bGUuYwogQEAgLTI5LDYgKzI5LDcgQEAK
QEAgLTE2Myw3ICsxODAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21h
aWwuY29tPgogICNpbmNsdWRlICJsaWJkd2ZsUC5oIgogICNpbmNsdWRlICJjb21tb24uaCIKICAK
LUBAIC03MTgsNyArNzE5LDcgQEAgZHdmbF9zZWdtZW50X3JlcG9ydF9tb2R1bGUgKER3ZmwgKmR3
ZmwsCitAQCAtNzE4LDcgKzcxOSw3IEBAIGR3Zmxfc2VnbWVudF9yZXBvcnRfbW9kdWxlIChEd2Zs
ICpkd2ZsLCBpbnQgbmR4LCBjb25zdCBjaGFyICpuYW1lLAogIAkgICAgICBiaWFzICs9IGZpeHVw
OwogIAkgICAgICBpZiAobW9kdWxlLT5uYW1lWzBdICE9ICdcMCcpCiAgCQl7CkBAIC0xNzIsNiAr
MTg5LDggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAJ
CSAgbmFtZV9pc19maW5hbCA9IHRydWU7CiAgCQl9CiAgCSAgICAgIGJyZWFrOworZGlmZiAtLWdp
dCBhL2xpYmR3ZmwvZmluZC1kZWJ1Z2luZm8uYyBiL2xpYmR3ZmwvZmluZC1kZWJ1Z2luZm8uYwor
aW5kZXggN2Y3YWI2My4uNmFhYjFhNCAxMDA2NDQKIC0tLSBhL2xpYmR3ZmwvZmluZC1kZWJ1Z2lu
Zm8uYwogKysrIGIvbGliZHdmbC9maW5kLWRlYnVnaW5mby5jCiBAQCAtMzEsNiArMzEsNyBAQApA
QCAtMTgyLDcgKzIwMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+CiAgI2luY2x1ZGUgPHN0ZGlvLmg+CiAgI2luY2x1ZGUgPGZjbnRsLmg+CiAgI2luY2x1
ZGUgPHN5cy9zdGF0Lmg+Ci1AQCAtMTY0LDcgKzE2NSw3IEBAIGZpbmRfZGVidWdpbmZvX2luX3Bh
dGggKER3ZmxfTW9kdWxlICptb2QKK0BAIC0xNjQsNyArMTY1LDcgQEAgZmluZF9kZWJ1Z2luZm9f
aW5fcGF0aCAoRHdmbF9Nb2R1bGUgKm1vZCwgY29uc3QgY2hhciAqZmlsZV9uYW1lLAogIHsKICAg
IGJvb2wgY2FuY2hlY2sgPSBkZWJ1Z2xpbmtfY3JjICE9IChHRWxmX1dvcmQpIDA7CiAgCkBAIC0x
OTEsNyArMjEwLDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KICAgIGNoYXIgKmxvY2FsbmFtZSA9IE5VTEw7CiAgCiAgICAvKiBXZSBpbnZlbnQgYSBkZWJ1
Z2xpbmsgLmRlYnVnIG5hbWUgaWYgTlVMTCwgYnV0IHRoZW4gd2FudCB0byB0cnkgdGhlCi1AQCAt
Mjc4LDcgKzI3OSw3IEBAIGZpbmRfZGVidWdpbmZvX2luX3BhdGggKER3ZmxfTW9kdWxlICptb2QK
K0BAIC0yNzgsNyArMjc5LDcgQEAgZmluZF9kZWJ1Z2luZm9faW5fcGF0aCAoRHdmbF9Nb2R1bGUg
Km1vZCwgY29uc3QgY2hhciAqZmlsZV9uYW1lLAogIAkgIGVsc2UKICAJICAgIHsKICAJICAgICAg
c3ViZGlyID0gTlVMTDsKQEAgLTIwMCw3ICsyMTksNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAkgICAgfQogIAkgIHRyeV9maWxlX2Jhc2VuYW1lID0g
ZGVidWdsaW5rX251bGw7CiAgCSAgYnJlYWs7Ci1AQCAtMzA2LDcgKzMwNyw3IEBAIGZpbmRfZGVi
dWdpbmZvX2luX3BhdGggKER3ZmxfTW9kdWxlICptb2QKK0BAIC0zMDYsNyArMzA3LDcgQEAgZmlu
ZF9kZWJ1Z2luZm9faW5fcGF0aCAoRHdmbF9Nb2R1bGUgKm1vZCwgY29uc3QgY2hhciAqZmlsZV9u
YW1lLAogIAkgICAgaWYgKG1vZC0+ZHcgIT0gTlVMTCAmJiAocFswXSA9PSAnXDAnIHx8IHBbMF0g
PT0gJy8nKSkKICAJICAgICAgewogIAkJZmQgPSB0cnlfb3BlbiAoJm1haW5fc3RhdCwgZGlyLCAi
LmR3eiIsCkBAIC0yMDksNiArMjI4LDggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KICAJCWlmIChmZCA8IDApCiAgCQkgIHsKICAJCSAgICBpZiAoZXJybm8g
IT0gRU5PRU5UICYmIGVycm5vICE9IEVOT1RESVIpCitkaWZmIC0tZ2l0IGEvbGliZHdmbC9saW5r
X21hcC5jIGIvbGliZHdmbC9saW5rX21hcC5jCitpbmRleCA3NmYyMzM1Li5jZGFhN2VkIDEwMDY0
NAogLS0tIGEvbGliZHdmbC9saW5rX21hcC5jCiArKysgYi9saWJkd2ZsL2xpbmtfbWFwLmMKIEBA
IC0yOSw2ICsyOSw3IEBACkBAIC0yMTksNyArMjQwLDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAjaW5jbHVkZSAibWVtb3J5LWFjY2Vzcy5oIgogICNp
bmNsdWRlICJzeXN0ZW0uaCIKICAKLUBAIC00NjksNyArNDcwLDcgQEAgcmVwb3J0X3JfZGVidWcg
KHVpbnRfZmFzdDhfdCBlbGZjbGFzcywgdQorQEAgLTQ3NSw3ICs0NzYsNyBAQCByZXBvcnRfcl9k
ZWJ1ZyAodWludF9mYXN0OF90IGVsZmNsYXNzLCB1aW50X2Zhc3Q4X3QgZWxmZGF0YSwKICAJCSAg
ICAgIGlmIChyX2RlYnVnX2luZm9fbW9kdWxlID09IE5VTEwpCiAgCQkJewogIAkJCSAgLy8gWFhY
IGhvb2sgZm9yIHN5c3Jvb3QKQEAgLTIyOCw2ICsyNDksOCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAkJCQkJCSAgICAgIG5hbWUsIGZkLCBlbGYsIGJh
c2UsCiAgCQkJCQkJICAgICAgdHJ1ZSwgdHJ1ZSk7CiAgCQkJICBpZiAobW9kICE9IE5VTEwpCitk
aWZmIC0tZ2l0IGEvbGliZHdmbC9saW51eC1rZXJuZWwtbW9kdWxlcy5jIGIvbGliZHdmbC9saW51
eC1rZXJuZWwtbW9kdWxlcy5jCitpbmRleCA1OGMwYzQxLi5iZGJkZTgzIDEwMDY0NAogLS0tIGEv
bGliZHdmbC9saW51eC1rZXJuZWwtbW9kdWxlcy5jCiArKysgYi9saWJkd2ZsL2xpbnV4LWtlcm5l
bC1tb2R1bGVzLmMKIEBAIC00MCw2ICs0MCw3IEBACkBAIC0yMzgsNyArMjYxLDcgQEAgU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAjaW5jbHVkZSAibGliZHdm
bFAuaCIKICAjaW5jbHVkZSA8aW50dHlwZXMuaD4KICAjaW5jbHVkZSA8ZXJybm8uaD4KLUBAIC0x
MTYsNyArMTE3LDcgQEAgdHJ5X2tlcm5lbF9uYW1lIChEd2ZsICpkd2ZsLCBjaGFyICoqZm5hbQor
QEAgLTExNiw3ICsxMTcsNyBAQCB0cnlfa2VybmVsX25hbWUgKER3ZmwgKmR3ZmwsIGNoYXIgKipm
bmFtZSwgYm9vbCB0cnlfZGVidWcpCiAgCS8qIFRyeSB0aGUgZmlsZSdzIHVuYWRvcm5lZCBiYXNl
bmFtZSBhcyBERUJVR0xJTktfRklMRSwKICAJICAgdG8gbG9vayBvbmx5IGZvciAidm1saW51eCIg
ZmlsZXMuICAqLwogIAlmZCA9IElOVFVTRShkd2ZsX3N0YW5kYXJkX2ZpbmRfZGVidWdpbmZvKSAo
JmZha2Vtb2QsIE5VTEwsIE5VTEwsIDAsCkBAIC0yNDcsNiArMjcwLDggQEAgU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAJCQkJCQkgICAwLCAmZmFrZW1vZC5k
ZWJ1Zy5uYW1lKTsKICAKICAgICAgICBpZiAoZmFrZW1vZC5kZWJ1Zy5uYW1lICE9IE5VTEwpCitk
aWZmIC0tZ2l0IGEvc3JjL2FkZHIybGluZS5jIGIvc3JjL2FkZHIybGluZS5jCitpbmRleCBkOTAy
ZDc5Li41MzQ1MTg5IDEwMDY0NAogLS0tIGEvc3JjL2FkZHIybGluZS5jCiArKysgYi9zcmMvYWRk
cjJsaW5lLmMKIEBAIC0zOCw2ICszOCw3IEBACkBAIC0yNTcsNyArMjgyLDcgQEAgU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAKICAKICAvKiBOYW1lIGFuZCB2
ZXJzaW9uIG9mIHByb2dyYW0uICAqLwotQEAgLTM4NSw3ICszODYsNyBAQCBwcmludF9kd2FyZl9m
dW5jdGlvbiAoRHdmbF9Nb2R1bGUgKm1vZCwKK0BAIC0zODUsNyArMzg2LDcgQEAgcHJpbnRfZHdh
cmZfZnVuY3Rpb24gKER3ZmxfTW9kdWxlICptb2QsIER3YXJmX0FkZHIgYWRkcikKICAJCSAgaWYg
KGZpbGUgPT0gTlVMTCkKICAJCSAgICBmaWxlID0gIj8/PyI7CiAgCQkgIGVsc2UgaWYgKG9ubHlf
YmFzZW5hbWVzKQpAQCAtMjY2LDcgKzI5MSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiAgCQkgIGVsc2UgaWYgKHVzZV9jb21wX2RpciAmJiBmaWxlWzBd
ICE9ICcvJykKICAJCSAgICB7CiAgCQkgICAgICBjb25zdCBjaGFyICpjb25zdCAqZGlyczsKLUBA
IC01NjgsNyArNTY5LDcgQEAgcHJpbnRfc3JjIChjb25zdCBjaGFyICpzcmMsIGludCBsaW5lbm8s
CitAQCAtNTY4LDcgKzU2OSw3IEBAIHByaW50X3NyYyAoY29uc3QgY2hhciAqc3JjLCBpbnQgbGlu
ZW5vLCBpbnQgbGluZWNvbCwgRHdhcmZfRGllICpjdSkKICAgIGNvbnN0IGNoYXIgKmNvbXBfZGly
X3NlcCA9ICIiOwogIAogICAgaWYgKG9ubHlfYmFzZW5hbWVzKQpAQCAtMjc1LDYgKzMwMCw4IEBA
IFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgICBlbHNlIGlm
ICh1c2VfY29tcF9kaXIgJiYgc3JjWzBdICE9ICcvJykKICAgICAgewogICAgICAgIER3YXJmX0F0
dHJpYnV0ZSBhdHRyOworZGlmZiAtLWdpdCBhL3NyYy9hci5jIGIvc3JjL2FyLmMKK2luZGV4IDNi
Y2IxOGYuLjhmMmRjZDAgMTAwNjQ0CiAtLS0gYS9zcmMvYXIuYwogKysrIGIvc3JjL2FyLmMKIEBA
IC00Miw2ICs0Miw3IEBACkBAIC0yODUsNyArMzEyLDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAKICAKICAvKiBOYW1lIGFuZCB2ZXJzaW9uIG9mIHBy
b2dyYW0uICAqLwotQEAgLTExMzMsNyArMTEzNCw3IEBAIGRvX29wZXJfaW5zZXJ0IChpbnQgb3Bl
ciwgY29uc3QgY2hhciAqYXIKK0BAIC0xMTMzLDcgKzExMzQsNyBAQCBkb19vcGVyX2luc2VydCAo
aW50IG9wZXIsIGNvbnN0IGNoYXIgKmFyZm5hbWUsIGNoYXIgKiphcmd2LCBpbnQgYXJnYywKICAg
ICAgICBmb3IgKGludCBjbnQgPSAwOyBjbnQgPCBhcmdjOyArK2NudCkKICAJewogIAkgIEVOVFJZ
IGVudHJ5OwpAQCAtMjk0LDcgKzMyMSw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CiAgCSAgZW50cnkuZGF0YSA9ICZhcmd2W2NudF07CiAgCSAgaWYgKGhz
ZWFyY2ggKGVudHJ5LCBFTlRFUikgPT0gTlVMTCkKICAJICAgIGVycm9yX2V4aXQgKGVycm5vLCBf
KCJjYW5ub3QgaW5zZXJ0IGludG8gaGFzaCB0YWJsZSIpKTsKLUBAIC0xMjQyLDcgKzEyNDMsNyBA
QCBkb19vcGVyX2luc2VydCAoaW50IG9wZXIsIGNvbnN0IGNoYXIgKmFyCitAQCAtMTI0Miw3ICsx
MjQzLDcgQEAgZG9fb3Blcl9pbnNlcnQgKGludCBvcGVyLCBjb25zdCBjaGFyICphcmZuYW1lLCBj
aGFyICoqYXJndiwgaW50IGFyZ2MsCiAgICAgICAgLyogT3BlbiBhbGwgdGhlIG5ldyBmaWxlcywg
Z2V0IHRoZWlyIHNpemVzIGFuZCBhZGQgYWxsIHN5bWJvbHMuICAqLwogICAgICAgIGZvciAoaW50
IGNudCA9IDA7IGNudCA8IGFyZ2M7ICsrY250KQogIAl7CkBAIC0zMDMsOSArMzMwLDExIEBAIFNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCSAgc2l6ZV90IGJu
YW1lbGVuID0gc3RybGVuIChibmFtZSk7CiAgCSAgaWYgKGZvdW5kW2NudF0gPT0gTlVMTCkKICAJ
ICAgIHsKK2RpZmYgLS1naXQgYS9zcmMvbm0uYyBiL3NyYy9ubS5jCitpbmRleCBmYmRlZThlLi4z
Njc1ZjU5IDEwMDY0NAogLS0tIGEvc3JjL25tLmMKICsrKyBiL3NyYy9ubS5jCi1AQCAtMTQxNyw3
ICsxNDE3LDcgQEAgc2hvd19zeW1ib2xzIChpbnQgZmQsIEVibCAqZWJsLCBHRWxmX0VoZAorQEAg
LTE0MTcsNyArMTQxNyw3IEBAIHNob3dfc3ltYm9scyAoaW50IGZkLCBFYmwgKmVibCwgR0VsZl9F
aGRyICplaGRyLAogIAkJCSAgaW50IGxpbmVubzsKICAJCQkgICh2b2lkKSBkd2FyZl9saW5lbm8g
KGxpbmUsICZsaW5lbm8pOwogIAkJCSAgY29uc3QgY2hhciAqZmlsZSA9IGR3YXJmX2xpbmVzcmMg
KGxpbmUsIE5VTEwsIE5VTEwpOwpAQCAtMzE0LDcgKzM0Myw3IEBAIFNpZ25lZC1vZmYtYnk6IEto
ZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAgCQkJICBpbnQgbjsKICAJCQkgIG4gPSBvYnN0
YWNrX3ByaW50ZiAoJndoZXJlb2IsICIlczolZCVjIiwgZmlsZSwKICAJCQkJCSAgICAgIGxpbmVu
bywgJ1wwJyk7Ci1AQCAtMTQ0OCw3ICsxNDQ4LDcgQEAgc2hvd19zeW1ib2xzIChpbnQgZmQsIEVi
bCAqZWJsLCBHRWxmX0VoZAorQEAgLTE0NDgsNyArMTQ0OCw3IEBAIHNob3dfc3ltYm9scyAoaW50
IGZkLCBFYmwgKmVibCwgR0VsZl9FaGRyICplaGRyLAogIAkJewogIAkJICAvKiBXZSBmb3VuZCB0
aGUgbGluZS4gICovCiAgCQkgIGludCBuID0gb2JzdGFja19wcmludGYgKCZ3aGVyZW9iLCAiJXM6
JSIgUFJJdTY0ICIlYyIsCkBAIC0zMjMsNiArMzUyLDggQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAJCQkJCSAgKCpmb3VuZCktPmxpbmVubywKICAJCQkJ
CSAgJ1wwJyk7CiAgCQkgIHN5bV9tZW1bbmVudHJpZXNfdXNlZF0ud2hlcmUgPSBvYnN0YWNrX2Zp
bmlzaCAoJndoZXJlb2IpOworZGlmZiAtLWdpdCBhL3NyYy9zdGFjay5jIGIvc3JjL3N0YWNrLmMK
K2luZGV4IDUzNGFhOTMuLjNhYmVmOTggMTAwNjQ0CiAtLS0gYS9zcmMvc3RhY2suYwogKysrIGIv
c3JjL3N0YWNrLmMKIEBAIC0zMSw2ICszMSw3IEBACkBAIC0zMzMsNyArMzY0LDcgQEAgU2lnbmVk
LW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAvKiBOYW1lIGFuZCB2ZXJz
aW9uIG9mIHByb2dyYW0uICAqLwogIEFSR1BfUFJPR1JBTV9WRVJTSU9OX0hPT0tfREVGID0gcHJp
bnRfdmVyc2lvbjsKICAKLUBAIC0xNTIsNyArMTUzLDcgQEAgbW9kdWxlX2NhbGxiYWNrIChEd2Zs
X01vZHVsZSAqbW9kLCB2b2lkCitAQCAtMTUyLDcgKzE1Myw3IEBAIG1vZHVsZV9jYWxsYmFjayAo
RHdmbF9Nb2R1bGUgKm1vZCwgdm9pZCAqKnVzZXJkYXRhIF9fYXR0cmlidXRlX18oKHVudXNlZCkp
LAogIAogICAgaW50IHdpZHRoID0gZ2V0X2FkZHJfd2lkdGggKG1vZCk7CiAgICBwcmludGYgKCIw
eCUwKiIgUFJJeDY0ICItMHglMCoiIFBSSXg2NCAiICVzXG4iLApAQCAtMzQyLDkgKzM3MywxMSBA
QCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAogICAgY29u
c3QgdW5zaWduZWQgY2hhciAqaWQ7CiAgICBHRWxmX0FkZHIgaWRfdmFkZHI7CitkaWZmIC0tZ2l0
IGEvc3JjL3N0cmlwLmMgYi9zcmMvc3RyaXAuYworaW5kZXggN2Y0Nzg4Yi4uNjQzNjQ0MyAxMDA2
NDQKIC0tLSBhL3NyYy9zdHJpcC5jCiArKysgYi9zcmMvc3RyaXAuYwotQEAgLTE4MDcsNyArMTgw
Nyw3IEBAIGhhbmRsZV9lbGYgKGludCBmZCwgRWxmICplbGYsIGNvbnN0IGNoYXIKK0BAIC0xODAw
LDcgKzE4MDAsNyBAQCBoYW5kbGVfZWxmIChpbnQgZmQsIEVsZiAqZWxmLCBjb25zdCBjaGFyICpw
cmVmaXgsIGNvbnN0IGNoYXIgKmZuYW1lLAogIAkJICAgICAgZWxmX2Vycm1zZyAoLTEpKTsKICAJ
fQogIApAQCAtMzUzLDYgKzM4NiwyMSBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogICAgICAgIG9mZl90IGNyY19vZmZzZXQgPSBzdHJsZW4gKGRlYnVnX2Jh
c2VuYW1lKSArIDE7CiAgICAgICAgLyogQWxpZ24gdG8gNCBieXRlIGJvdW5kYXJ5ICovCiAgICAg
ICAgY3JjX29mZnNldCA9ICgoY3JjX29mZnNldCAtIDEpICYgfjMpICsgNDsKK2RpZmYgLS1naXQg
YS90ZXN0cy9NYWtlZmlsZS5hbSBiL3Rlc3RzL01ha2VmaWxlLmFtCitpbmRleCA3OTEwNWYyLi40
M2VmNmQ5IDEwMDY0NAorLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0KKysrKyBiL3Rlc3RzL01ha2Vm
aWxlLmFtCitAQCAtNzA1LDcgKzcwNSw3IEBAIHVwZGF0ZTFfTERBREQgPSAkKGxpYmVsZikKKyB1
cGRhdGUyX0xEQUREID0gJChsaWJlbGYpCisgdXBkYXRlM19MREFERCA9ICQobGliZHcpICQobGli
ZWxmKQorIHVwZGF0ZTRfTERBREQgPSAkKGxpYmR3KSAkKGxpYmVsZikKKy1zaG93X2RpZV9pbmZv
X0xEQUREID0gJChsaWJkdykgJChsaWJlbGYpCisrc2hvd19kaWVfaW5mb19MREFERCA9ICQobGli
ZXUpICQobGliZHcpICQobGliZWxmKQorIGdldF9wdWJuYW1lc19MREFERCA9ICQobGliZHcpICQo
bGliZWxmKQorIHNob3dfYWJicmV2X0xEQUREID0gJChsaWJkdykgJChsaWJlbGYpCisgZ2V0X2xp
bmVzX0xEQUREID0gJChsaWJkdykgJChsaWJlbGYpCitkaWZmIC0tZ2l0IGEvdGVzdHMvc2hvdy1k
aWUtaW5mby5jIGIvdGVzdHMvc2hvdy1kaWUtaW5mby5jCitpbmRleCAxYTMxOTFjLi4wMGE2NjU3
IDEwMDY0NAogLS0tIGEvdGVzdHMvc2hvdy1kaWUtaW5mby5jCiArKysgYi90ZXN0cy9zaG93LWRp
ZS1pbmZvLmMKIEBAIC0yNiw2ICsyNiw3IEBACkBAIC0zNzIsNiArNDIwLDggQEAgU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAKICAgICAgICBkYmcgPSBkd2Fy
Zl9iZWdpbiAoZmQsIERXQVJGX0NfUkVBRCk7CiAgICAgICAgaWYgKGRiZyA9PSBOVUxMKQorZGlm
ZiAtLWdpdCBhL3Rlc3RzL3ZhcmxvY3MuYyBiL3Rlc3RzL3ZhcmxvY3MuYworaW5kZXggOGU1NjNm
ZC4uNzJjNjRlMiAxMDA2NDQKIC0tLSBhL3Rlc3RzL3ZhcmxvY3MuYwogKysrIGIvdGVzdHMvdmFy
bG9jcy5jCiBAQCAtMzMsNiArMzMsNyBAQApAQCAtMzkxLDE0ICs0NDEsMyBAQCBTaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIAkgIHByaW50ZiAoIm1vZHVsZSAn
JXMnXG4iLCBuYW1lKTsKICAJICBwcmludF9kaWUgKCZjdWRpZSwgIkNVIiwgMCk7CiAgCi0tLS0g
YS90ZXN0cy9NYWtlZmlsZS5hbQotKysrIGIvdGVzdHMvTWFrZWZpbGUuYW0KLUBAIC02OTIsNyAr
NjkyLDcgQEAgdXBkYXRlMV9MREFERCA9ICQobGliZWxmKQotIHVwZGF0ZTJfTERBREQgPSAkKGxp
YmVsZikKLSB1cGRhdGUzX0xEQUREID0gJChsaWJkdykgJChsaWJlbGYpCi0gdXBkYXRlNF9MREFE
RCA9ICQobGliZHcpICQobGliZWxmKQotLXNob3dfZGllX2luZm9fTERBREQgPSAkKGxpYmR3KSAk
KGxpYmVsZikKLStzaG93X2RpZV9pbmZvX0xEQUREID0gJChsaWJldSkgJChsaWJkdykgJChsaWJl
bGYpCi0gZ2V0X3B1Ym5hbWVzX0xEQUREID0gJChsaWJkdykgJChsaWJlbGYpCi0gc2hvd19hYmJy
ZXZfTERBREQgPSAkKGxpYmR3KSAkKGxpYmVsZikKLSBnZXRfbGluZXNfTERBREQgPSAkKGxpYmR3
KSAkKGxpYmVsZikKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy8wMDAxLWRzby1saW5rLWNoYW5nZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9l
bGZ1dGlscy9maWxlcy8wMDAxLWRzby1saW5rLWNoYW5nZS5wYXRjaAppbmRleCA2YWNjMDM2NDA2
Li45Y2VlMjRjOWIyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMv
ZmlsZXMvMDAwMS1kc28tbGluay1jaGFuZ2UucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtZHNvLWxpbmstY2hhbmdlLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSBjNWZiNTlhYzA4MTliNWI2ZDgyNDRjNjEzY2JjZjkyY2IwOTg0MGMxIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1YTZkOWViZWVmZjE4MjhiMzY5YWJhMmU0YzMyZmY2
NDYwZjViODIyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9u
Z3h1LmppYUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNSBBdWcgMjAxNyAxNzoxMDo1NyAr
MDgwMAogU3ViamVjdDogW1BBVENIXSBkc28gbGluayBjaGFuZ2UKQEAgLTIzLDExICsyMywxMSBA
QCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+CiAg
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS9zcmMvTWFrZWZpbGUuYW0gYi9zcmMvTWFrZWZpbGUuYW0KLWluZGV4IDg4ZDBhYzgu
LmMyOGQ4MWYgMTAwNjQ0CitpbmRleCBkM2Q5ZDQwLi5lYTYxNjE2IDEwMDY0NAogLS0tIGEvc3Jj
L01ha2VmaWxlLmFtCiArKysgYi9zcmMvTWFrZWZpbGUuYW0KIEBAIC00NSw3ICs0NSw3IEBAIGxp
YmR3ID0gLi4vbGliZHcvbGliZHcuYSAtbHogJCh6aXBfTElCUykgJChsaWJlbGYpIC1sZGwgLWxw
dGhyZWFkCi0gbGliZWxmID0gLi4vbGliZWxmL2xpYmVsZi5hIC1segorIGxpYmVsZiA9IC4uL2xp
YmVsZi9saWJlbGYuYSAtbHogJCh6c3RkX0xJQlMpCiAgZWxzZQogIGxpYmFzbSA9IC4uL2xpYmFz
bS9saWJhc20uc28KIC1saWJkdyA9IC4uL2xpYmR3L2xpYmR3LnNvCkBAIC0zNiwxMSArMzYsMTEg
QEAgaW5kZXggODhkMGFjOC4uYzI4ZDgxZiAxMDA2NDQKICBlbmRpZgogIGxpYmVibCA9IC4uL2xp
YmVibC9saWJlYmwuYSAuLi9iYWNrZW5kcy9saWJlYmxfYmFja2VuZHMuYSAuLi9saWJjcHUvbGli
Y3B1LmEKIGRpZmYgLS1naXQgYS90ZXN0cy9NYWtlZmlsZS5hbSBiL3Rlc3RzL01ha2VmaWxlLmFt
Ci1pbmRleCBjMTQ1NzIwLi43MmFmZDBlIDEwMDY0NAoraW5kZXggN2ZiOGVmYi4uNzFjMWE2MSAx
MDA2NDQKIC0tLSBhL3Rlc3RzL01ha2VmaWxlLmFtCiArKysgYi90ZXN0cy9NYWtlZmlsZS5hbQot
QEAgLTU1NCw3ICs1NTQsNyBAQCBsaWJkdyA9IC4uL2xpYmR3L2xpYmR3LmEgLWx6ICQoemlwX0xJ
QlMpICQobGliZWxmKSAkKGxpYmVibCkgLWxkbCAtbHB0aHJlYWQKLSBsaWJlbGYgPSAuLi9saWJl
bGYvbGliZWxmLmEgLWx6CitAQCAtNjgwLDcgKzY4MCw3IEBAIGxpYmR3ID0gLi4vbGliZHcvbGli
ZHcuYSAtbHogJCh6aXBfTElCUykgJChsaWJlbGYpICQobGliZWJsKSAtbGRsIC1scHRocmVhZAor
IGxpYmVsZiA9IC4uL2xpYmVsZi9saWJlbGYuYSAtbHogJCh6c3RkX0xJQlMpCiAgbGliYXNtID0g
Li4vbGliYXNtL2xpYmFzbS5hCiAgZWxzZQogLWxpYmR3ID0gLi4vbGliZHcvbGliZHcuc28KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWxpYmFz
bS1tYXktbGluay13aXRoLWxpYmJ6Mi1pZi1mb3VuZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWxpYmFzbS1tYXktbGluay13aXRoLWxpYmJ6Mi1pZi1m
b3VuZC5wYXRjaAppbmRleCAwOWM5ZDNlYTI0Li4wOTUyZTI4MDI4IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJhc20tbWF5LWxpbmstd2l0
aC1saWJiejItaWYtZm91bmQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0
aWxzL2ZpbGVzLzAwMDEtbGliYXNtLW1heS1saW5rLXdpdGgtbGliYnoyLWlmLWZvdW5kLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlZDE5NzVkZWVhYTQ3Zjk4ZDIxMmZkMTQ0YzhiZGEwNzVi
MWE1ZDM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5ZWU5ZmI5ODMzYTI4YmRkMGM4
MmE4YWI5YTQ4ODMyNjJiZDJkY2NmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgNCBPY3QgMjAxNyAyMjozMDo0
NiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBsaWJhc20gbWF5IGxpbmsgd2l0aCBsaWJiejIgaWYg
Zm91bmQKQEAgLTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL01ha2VmaWxlLmFtIGIvc3JjL01ha2VmaWxlLmFtCi1p
bmRleCBjMjhkODFmLi45NTFlOTc4IDEwMDY0NAoraW5kZXggZWE2MTYxNi4uYmM2NTczZiAxMDA2
NDQKIC0tLSBhL3NyYy9NYWtlZmlsZS5hbQogKysrIGIvc3JjL01ha2VmaWxlLmFtCiBAQCAtNDAs
MTEgKzQwLDExIEBAIEVYVFJBX0RJU1QgKz0gbWFrZS1kZWJ1Zy1hcmNoaXZlLmluCkBAIC0yNyw3
ICsyNyw3IEBAIGluZGV4IGMyOGQ4MWYuLjk1MWU5NzggMTAwNjQ0CiAtbGliYXNtID0gLi4vbGli
YXNtL2xpYmFzbS5hCiArbGliYXNtID0gLi4vbGliYXNtL2xpYmFzbS5hICQoemlwX0xJQlMpCiAg
bGliZHcgPSAuLi9saWJkdy9saWJkdy5hIC1seiAkKHppcF9MSUJTKSAkKGxpYmVsZikgLWxkbCAt
bHB0aHJlYWQKLSBsaWJlbGYgPSAuLi9saWJlbGYvbGliZWxmLmEgLWx6CisgbGliZWxmID0gLi4v
bGliZWxmL2xpYmVsZi5hIC1seiAkKHpzdGRfTElCUykKICBlbHNlCiAtbGliYXNtID0gLi4vbGli
YXNtL2xpYmFzbS5zbwogK2xpYmFzbSA9IC4uL2xpYmFzbS9saWJhc20uc28gJCh6aXBfTElCUykK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLWxp
YmVsZi1lbGZfZW5kLmMtY2hlY2stZGF0YV9saXN0LmRhdGEuZC5kX2J1Zi1iZWZvcmUucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS1saWJlbGYtZWxmX2Vu
ZC5jLWNoZWNrLWRhdGFfbGlzdC5kYXRhLmQuZF9idWYtYmVmb3JlLnBhdGNoCmluZGV4IGM4ZDU1
ZDU4M2EuLjUxZjMwMmQzM2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1
dGlscy9maWxlcy8wMDAxLWxpYmVsZi1lbGZfZW5kLmMtY2hlY2stZGF0YV9saXN0LmRhdGEuZC5k
X2J1Zi1iZWZvcmUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2Zp
bGVzLzAwMDEtbGliZWxmLWVsZl9lbmQuYy1jaGVjay1kYXRhX2xpc3QuZGF0YS5kLmRfYnVmLWJl
Zm9yZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjQwY2JkNDNhY2RiMWZlZmVmNGZhNTNh
NjAzNDI5NmQ4M2NiZmY3ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjk1MjYwM2Vi
MmI0N2I3YWQ3ODc0OTAyM2QzMGJiODA5OWVlYThmZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFJvYmVydCBZYW5nIDxsaWV6aGkueWFuZ0B3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1
LCAxNiBBdWcgMjAxOCAwOTo1ODoyNiArMDgwMAogU3ViamVjdDogW1BBVENIXSBsaWJlbGYvZWxm
X2VuZC5jOiBjaGVjayBkYXRhX2xpc3QuZGF0YS5kLmRfYnVmIGJlZm9yZSBmcmVlIGl0CkBAIC0y
MCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdp
bmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKIAogZGlmZiAtLWdpdCBhL2xpYmVsZi9lbGZfZW5kLmMgYi9saWJlbGYvZWxmX2VuZC5j
Ci1pbmRleCAxNjBmMGI4Li41MjgwYTcwIDEwMDY0NAoraW5kZXggODBmNGQxMy4uYjEwMzk1OSAx
MDA2NDQKIC0tLSBhL2xpYmVsZi9lbGZfZW5kLmMKICsrKyBiL2xpYmVsZi9lbGZfZW5kLmMKLUBA
IC0xNjAsMTQgKzE2MCwxNiBAQCBlbGZfZW5kIChFbGYgKmVsZikKK0BAIC0xNjksMTQgKzE2OSwx
NiBAQCBlbGZfZW5kIChFbGYgKmVsZikKICAJCSAgIGFyY2hpdGVjdHVyZSBkb2Vzbid0IHJlcXVp
cmUgb3Zlcmx5IHN0cmluZ2VudAogIAkJICAgYWxpZ25tZW50IHRoZSByYXcgZGF0YSBidWZmZXIg
aXMgdGhlIHNhbWUgYXMgdGhlCiAgCQkgICBvbmUgdXNlZCBmb3IgcHJlc2VudGluZyB0byB0aGUg
Y2FsbGVyLiAgKi8KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy8wMDAxLXNraXAtdGhlLXRlc3Qtd2hlbi1nY2Mtbm90LWRlcGxveWVkLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtc2tpcC10aGUtdGVzdC13aGVu
LWdjYy1ub3QtZGVwbG95ZWQucGF0Y2gKaW5kZXggMGU2YmY1NTczYy4uYjQxOWI0NGZhNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtc2tpcC10
aGUtdGVzdC13aGVuLWdjYy1ub3QtZGVwbG95ZWQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtc2tpcC10aGUtdGVzdC13aGVuLWdjYy1ub3QtZGVw
bG95ZWQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDJmYTUyZDYxYjFhYmRmNGEzZjNiMTUz
Yzc3MWZiMjA4MTY2NjQzMGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQyZjM3NTM2
YWFmMmZiZThhYTlhMTE1NGRmNGU3Y2NhODAyMTIxNTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBNaW5nbGkgWXUgPE1pbmdsaS5ZdUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAy
MSBNYXkgMjAxOSAxNToyMDozNCArMDgwMAogU3ViamVjdDogW1BBVENIXSBza2lwIHRoZSB0ZXN0
IHdoZW4gZ2NjIG5vdCBkZXBsb3llZApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2VsZnV0aWxzL2ZpbGVzLzAwMDEtdGVzdHMtTWFrZWZpbGUuYW0tY29tcGlsZS10ZXN0X25saXN0
LXdpdGgtc3RhbmRhcmQtQy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9m
aWxlcy8wMDAxLXRlc3RzLU1ha2VmaWxlLmFtLWNvbXBpbGUtdGVzdF9ubGlzdC13aXRoLXN0YW5k
YXJkLUMucGF0Y2gKaW5kZXggYTJjMGI5MDIyNy4uNzMwMWNhZmYxOCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtdGVzdHMtTWFrZWZpbGUuYW0t
Y29tcGlsZS10ZXN0X25saXN0LXdpdGgtc3RhbmRhcmQtQy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS10ZXN0cy1NYWtlZmlsZS5hbS1jb21waWxl
LXRlc3Rfbmxpc3Qtd2l0aC1zdGFuZGFyZC1DLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBl
MzU1Y2EzYjhkZGNjNmU3M2VlMTQwZjUzZDI1NjM0YWZkYWVjMGRhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSAzZmM1YThkYWUzNWY5OGMxOWFhZGFiYzhmNzJiNzQ3YjBiM2NkYWU2IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDIzIEp1biAyMDIwIDA3OjQ5OjM1ICswMDAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHRlc3RzL01ha2VmaWxlLmFtOiBjb21waWxlIHRlc3Rfbmxpc3Qgd2l0
aCBzdGFuZGFyZCBDRkxBR1MKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL01ha2Vm
aWxlLmFtIGIvdGVzdHMvTWFrZWZpbGUuYW0KLWluZGV4IDJhZGU1ZDkuLmY4NWNkYmEgMTAwNjQ0
CitpbmRleCBhYzgyNDU2Li43OTEwNWYyIDEwMDY0NAogLS0tIGEvdGVzdHMvTWFrZWZpbGUuYW0K
ICsrKyBiL3Rlc3RzL01ha2VmaWxlLmFtCi1AQCAtOTgsNyArOTgsNyBAQCBlbmRpZgorQEAgLTEw
Miw3ICsxMDIsNyBAQCBlbmRpZgogIHRlc3Qtbmxpc3QkKEVYRUVYVCk6IHRlc3Qtbmxpc3QuYwog
IAkkKEFNX1ZfQ0MpJChDQykgJChERUZTKSAkKERFRkFVTFRfSU5DTFVERVMpICQoSU5DTFVERVMp
IFwKICAJICAkKEFNX0NQUEZMQUdTKSAkKENQUEZMQUdTKSBcCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS10ZXN0cy1maXgtYnVpbGQtYWdhaW5z
dC11cGNvbWluZy1nY2MtMTQtV2Vycm9yLWNhbGxvLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDEtdGVzdHMtZml4LWJ1aWxkLWFnYWluc3QtdXBjb21pbmct
Z2NjLTE0LVdlcnJvci1jYWxsby5wYXRjaAppbmRleCA1ZTBjN2U5NzY2Li42NDNlOTZhYTQ4IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMS10ZXN0
cy1maXgtYnVpbGQtYWdhaW5zdC11cGNvbWluZy1nY2MtMTQtV2Vycm9yLWNhbGxvLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAxLXRlc3RzLWZpeC1i
dWlsZC1hZ2FpbnN0LXVwY29taW5nLWdjYy0xNC1XZXJyb3ItY2FsbG8ucGF0Y2gKQEAgLTEsNCAr
MSw0IEBACi1Gcm9tIDkwMWM2YThjNzhjM2M0ZWVlMjQ0YjlkNTI5OGNiZDdiOWFhNzEzZDEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEyNTUwMGNlM2NlMzE2MWQ5NzM3OTFkYTQxN2Fj
YjM5MjdkZjhkYzkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBTZXJnZWkgVHJvZmlt
b3ZpY2ggPHNseWljaEBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIxIERlYyAyMDIzIDA5OjIzOjMw
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzOiBmaXggYnVpbGQgYWdhaW5zdCB1cGNvbWlu
ZyBgZ2NjLTE0YApAQCAtMTcsNiArMTcsNyBAQCBkZXRlY3RlZCBtaW5vciBpbmZlbGljaXR5IGlu
IGBjYWxsb2MoKWAgQVBJIHVzYWdlIGluIGBlbGZ1dGlsc2A6CiBVcHN0cmVhbS1TdGF0dXM6IEJh
Y2twb3J0IFtodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1lbGZ1dGlscy5naXQ7YT1jb21t
aXQ7aD1hZTU4MGQ0ODI3OGI5OTI0ZGE3NTAzODg2YjM3YmUzNDM3OGUxYjA0XQogU2lnbmVkLW9m
Zi1ieTogU2VyZ2VpIFRyb2ZpbW92aWNoIDxzbHlpY2hAZ21haWwuY29tPgogU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KKwogLS0tCiAgdGVzdHMvZWxmc3RybWVy
Z2UuYyB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKQEAgLTM0LDYgKzM1LDMgQEAgaW5kZXggNTYzNTBiYi4uNGViNThiYiAxMDA2NDQKICAgIGlm
IChuZXdzY25idWZzID09IE5VTEwpCiAgICAgIGZhaWxfZXJybm8gKCJDb3VsZG4ndCBhbGxvY2F0
ZSBtZW1vcnkgZm9yIG5ldyBzZWN0aW9uIGJ1ZmZlcnMiLCBOVUxMKTsKICAKLS0tIAotMi40My4w
Ci0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAy
LUZpeC1lbGZfY3Z0X2d1bmhhc2gtaWYtZGVzdC1hbmQtc3JjLWFyZS1zYW1lLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDItRml4LWVsZl9jdnRfZ3VuaGFz
aC1pZi1kZXN0LWFuZC1zcmMtYXJlLXNhbWUucGF0Y2gKaW5kZXggYmU0OGVmMDEwYi4uYjQ0ZjAy
OTcyMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAw
MDItRml4LWVsZl9jdnRfZ3VuaGFzaC1pZi1kZXN0LWFuZC1zcmMtYXJlLXNhbWUucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDItRml4LWVsZl9jdnRf
Z3VuaGFzaC1pZi1kZXN0LWFuZC1zcmMtYXJlLXNhbWUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDE2NDNkNzkzNzYxMjE2MjUyYmI2NTRlMjhhYWE1YjhlYjE1MzZiY2EgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGUzY2EwMjhhMWQ2YzljYTkxMDE2MzQ5NTJjZDQ0ZDcwYTEwOTM3
ZWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBIb25neHUgSmlhIDxob25neHUuamlh
QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDE1IEF1ZyAyMDE3IDE3OjEzOjU5ICswODAwCiBT
dWJqZWN0OiBbUEFUQ0hdIEZpeCBlbGZfY3Z0X2d1bmhhc2ggaWYgZGVzdCBhbmQgc3JjIGFyZSBz
YW1lLgpAQCAtMTgsMTAgKzE4LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEhvbmd4dSBKaWEgPGhvbmd4
dS5qaWFAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9saWJlbGYvZ251aGFzaF94bGF0ZS5oIGIvbGli
ZWxmL2dudWhhc2hfeGxhdGUuaAotaW5kZXggNmZhZjExMy4uMDRkOWNhMSAxMDA2NDQKK2luZGV4
IDNhMDBhZTAuLjQwNDY4ZmMgMTAwNjQ0CiAtLS0gYS9saWJlbGYvZ251aGFzaF94bGF0ZS5oCiAr
KysgYi9saWJlbGYvZ251aGFzaF94bGF0ZS5oCi1AQCAtNDAsNiArNDAsNyBAQCBlbGZfY3Z0X2du
dWhhc2ggKHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90IGxlbiwgaW50IGVuY29k
ZSkKK0BAIC00Miw2ICs0Miw3IEBAIGVsZl9jdnRfZ251aGFzaCAodm9pZCAqZGVzdCwgY29uc3Qg
dm9pZCAqc3JjLCBzaXplX3QgbGVuLCBpbnQgZW5jb2RlKQogICAgICAgd29yZHMuICBXZSBtdXN0
IGRldGFuZ2xlIHRoZW0gaGVyZS4gICAqLwogICAgRWxmMzJfV29yZCAqZGVzdDMyID0gZGVzdDsK
ICAgIGNvbnN0IEVsZjMyX1dvcmQgKnNyYzMyID0gc3JjOwpAQCAtMjksNyArMjksNyBAQCBpbmRl
eCA2ZmFmMTEzLi4wNGQ5Y2ExIDEwMDY0NAogIAogICAgLyogRmlyc3QgZm91ciBjb250cm9sIHdv
cmRzLCAzMiBiaXRzLiAgKi8KICAgIGZvciAodW5zaWduZWQgaW50IGNudCA9IDA7IGNudCA8IDQ7
ICsrY250KQotQEAgLTUwLDcgKzUxLDcgQEAgZWxmX2N2dF9nbnVoYXNoICh2b2lkICpkZXN0LCBj
b25zdCB2b2lkICpzcmMsIHNpemVfdCBsZW4sIGludCBlbmNvZGUpCitAQCAtNTIsNyArNTMsNyBA
QCBlbGZfY3Z0X2dudWhhc2ggKHZvaWQgKmRlc3QsIGNvbnN0IHZvaWQgKnNyYywgc2l6ZV90IGxl
biwgaW50IGVuY29kZSkKICAgICAgICBsZW4gLT0gNDsKICAgICAgfQogIApkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtZml4aGVhZGVyY2hlY2su
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1maXhoZWFk
ZXJjaGVjay5wYXRjaAppbmRleCAyMTJiMzU4ZGMyLi45MzI4MjE2ZGM2IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1maXhoZWFkZXJjaGVjay5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1maXho
ZWFkZXJjaGVjay5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2UxZjkxYzQyZWY1YjBiZjEw
YWZlZmVjMTBkZDA4NTg4ZGYzYWIxZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzEy
NjgxZjhmMmFlYzczMjIxNDUxZGNlN2E3OWRkYjE4NzgxMzA5NyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6
IFR1ZSwgMTUgQXVnIDIwMTcgMTc6MTc6MjAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gZml4aGVh
ZGVyY2hlY2sKQEAgLTIyLDEwICsyMiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxo
b25neHUuamlhQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2xpYmVsZi9lbGYzMl91cGRhdGVudWxs
LmMgYi9saWJlbGYvZWxmMzJfdXBkYXRlbnVsbC5jCi1pbmRleCBkMGQ0ZDFlLi40ZWNmNWE1IDEw
MDY0NAoraW5kZXggMzU5NGU4Yi4uYTMzMTRlNSAxMDA2NDQKIC0tLSBhL2xpYmVsZi9lbGYzMl91
cGRhdGVudWxsLmMKICsrKyBiL2xpYmVsZi9lbGYzMl91cGRhdGVudWxsLmMKLUBAIC0zNTQsOCAr
MzU0LDggQEAgX19lbGZ3MihMSUJFTEZCSVRTLHVwZGF0ZW51bGxfd3Jsb2NrKSAoRWxmICplbGYs
IGludCAqY2hhbmdlX2JvcCwgc2l6ZV90IHNobnVtKQorQEAgLTM1NSw4ICszNTUsOCBAQCBfX2Vs
ZncyKExJQkVMRkJJVFMsdXBkYXRlbnVsbF93cmxvY2spIChFbGYgKmVsZiwgaW50ICpjaGFuZ2Vf
Ym9wLCBzaXplX3Qgc2hudW0pCiAgCQkgICAgIHdlIHRlc3QgZm9yIHRoZSBhbGlnbm1lbnQgb2Yg
dGhlIHNlY3Rpb24gYmVpbmcgbGFyZ2UKICAJCSAgICAgZW5vdWdoIGZvciB0aGUgbGFyZ2VzdCBh
bGlnbm1lbnQgcmVxdWlyZWQgYnkgYSBkYXRhCiAgCQkgICAgIGJsb2NrLiAgKi8KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLW11c2wtdXRpbHMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvMDAwMy1tdXNsLXV0
aWxzLnBhdGNoCmluZGV4IDkzZjViZGNkMDAuLjc5OTNhNDZhMTMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDAzLW11c2wtdXRpbHMucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDMtbXVzbC11dGlscy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjYyYWM5MDM5NGUzNmUwYjRlODYwNDJkOWM1Mzg1
NzAzZjViNjUzNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWM2ODQ2OGRmZTVkMTkx
YzE3NDNlYjk0YzgwZjc1ZGIyN2FhY2RiMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwgMjMgQXVn
IDIwMTkgMTA6MTk6NDggKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gbXVzbC11dGlscwpAQCAtMzks
NyArMzksNyBAQCBpbmRleCBkNGE0MjIxLi5mNjMzNmQ5IDEwMDY0NAogIC8qIFN0YXRlIG9mIC1E
Ly1VIGZsYWdzLiAgKi8KICBleHRlcm4gYm9vbCBhcmxpYl9kZXRlcm1pbmlzdGljX291dHB1dDsK
IGRpZmYgLS1naXQgYS9zcmMvZWxmY29tcHJlc3MuYyBiL3NyYy9lbGZjb21wcmVzcy5jCi1pbmRl
eCAxOGFkZTY2Li5hNmVkNGUxIDEwMDY0NAoraW5kZXggZjc3MWI5Mi4uMjYzZGU2MiAxMDA2NDQK
IC0tLSBhL3NyYy9lbGZjb21wcmVzcy5jCiArKysgYi9zcmMvZWxmY29tcHJlc3MuYwogQEAgLTM3
LDYgKzM3LDEzIEBACkBAIC01Nyw3ICs1Nyw3IEBAIGluZGV4IDE4YWRlNjYuLmE2ZWQ0ZTEgMTAw
NjQ0CiAgQVJHUF9QUk9HUkFNX1ZFUlNJT05fSE9PS19ERUYgPSBwcmludF92ZXJzaW9uOwogIAog
ZGlmZiAtLWdpdCBhL3NyYy9zdHJpcC5jIGIvc3JjL3N0cmlwLmMKLWluZGV4IDJhMmNjODAuLjhl
OWY3NzMgMTAwNjQ0CitpbmRleCA2NDM2NDQzLi4xNjA4NDk2IDEwMDY0NAogLS0tIGEvc3JjL3N0
cmlwLmMKICsrKyBiL3NyYy9zdHJpcC5jCiBAQCAtNDUsNiArNDUsMTMgQEAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy8wMDA2LUZpeC1idWlsZC1vbi1h
YXJjaDY0LW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMv
MDAwNi1GaXgtYnVpbGQtb24tYWFyY2g2NC1tdXNsLnBhdGNoCmluZGV4IDg5NDJhZDc4MjguLmQ5
YjEyZGQ0YzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxl
cy8wMDA2LUZpeC1idWlsZC1vbi1hYXJjaDY0LW11c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzLzAwMDYtRml4LWJ1aWxkLW9uLWFhcmNoNjQtbXVzbC5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjM5NmZkNjdkODFlNTRlMThmYmFkNjdhNWZmNjdk
NTY4NGEwMTAxMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOWZlN2UxNzg2MzgxZTBj
MTZjNGFjMzMwZDNiOWQ0YTFjMDVmMWQwYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEhvbmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTUgQXVn
IDIwMTcgMTc6Mjc6MzAgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IGJ1aWxkIG9uIGFhcmNo
NjQvbXVzbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVz
L3B0ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2VsZnV0aWxzL2ZpbGVzL3B0ZXN0
LnBhdGNoCmluZGV4IGZlNmYyNzJhODMuLmYxMzQ2ZmJlODQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9lbGZ1dGlscy9maWxlcy9wdGVzdC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZWxmdXRpbHMvZmlsZXMvcHRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIGJmYmYzOTNlN2Q1YjFiNDFkZjg1Y2UxYzM3ZTg4Nzc3NmM0NWQ1MjkgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDk3Yjc2MDJlODIwYWQ0YTkzZDRkMGM5NTI0MWQ2ZDNlYzEzM2Uy
MDYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFy
ZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMSBNYXkgMjAxOSAxNjoz
Nzo0OCArMDEwMAogU3ViamVjdDogW1BBVENIXSBDaGFuZ2VzIHRvIGFsbG93IHB0ZXN0IHRvIHJ1
biBzdGFuZGFsb25lIG9uIHRhcmdldDoKQEAgLTIyLDEwICsyMiwxMCBAQCBVcHN0cmVhbS1TdGF0
dXM6IEluYXBwcm9wcmlhdGUgW29lIHNwZWNpZmljXQogIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIv
Y29uZmlndXJlLmFjCi1pbmRleCBkMzQ1NDk1Li42NzkzM2QxIDEwMDY0NAoraW5kZXggYWY1YjZi
Zi4uMmVmMzAyZiAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFj
Ci1AQCAtNDgsNyArNDgsNyBAQCBBQ19DT1BZUklHSFQoW0NvcHlyaWdodCAoQykgMTk5Ni0yMDIx
IFRoZSBlbGZ1dGlscyBkZXZlbG9wZXJzLl0pCitAQCAtNDksNyArNDksNyBAQCBBQ19DT1BZUklH
SFQoW0NvcHlyaWdodCAoQykgMTk5Ni0yMDIzIFRoZSBlbGZ1dGlscyBkZXZlbG9wZXJzLl0pCiAg
QUNfUFJFUkVRKDIuNjMpCQkJZG5sIE1pbmltdW0gQXV0b2NvbmYgdmVyc2lvbiByZXF1aXJlZC4K
ICAKICBkbmwgV2UgdXNlIEdOVSBtYWtlIGV4dGVuc2lvbnM7IGF1dG9tYWtlIDEuMTAgZGVmYXVs
dHMgdG8gLVdwb3J0YWJpbGl0eS4KQEAgLTM1LDEwICszNSwxMCBAQCBpbmRleCBkMzQ1NDk1Li42
NzkzM2QxIDEwMDY0NAogIAogIEFNX1NJTEVOVF9SVUxFUyhbeWVzXSkKIGRpZmYgLS1naXQgYS90
ZXN0cy9NYWtlZmlsZS5hbSBiL3Rlc3RzL01ha2VmaWxlLmFtCi1pbmRleCA3MmFmZDBlLi5hMmRm
ZDQzIDEwMDY0NAoraW5kZXggNzFjMWE2MS4uYWM4MjQ1NiAxMDA2NDQKIC0tLSBhL3Rlc3RzL01h
a2VmaWxlLmFtCiArKysgYi90ZXN0cy9NYWtlZmlsZS5hbQotQEAgLTY5OCwzICs2OTgsNSBAQCBj
aGVjazogY2hlY2stYW0gY292ZXJhZ2UKK0BAIC04MzQsMyArODM0LDUgQEAgY2hlY2s6IGNoZWNr
LWFtIGNvdmVyYWdlCiAgY292ZXJhZ2U6CiAgCS0kKHNyY2RpcikvY292ZXJhZ2Uuc2gKICBlbmRp
ZgotLSAKMi40Mi4wCgo=

--===============6967352585882484388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/curl/curl-ptest: PKGSIZE changed from 18557642 to 18556678 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-binutils: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-binutils: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-binutils: PKGSIZE changed from 1331808 to 1360480 (+2%)
packages/core2-64-poky-linux/elfutils/elfutils-dbg: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-dbg: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-dbg: PKGSIZE changed from 28459272 to 29409208 (+3%)
packages/core2-64-poky-linux/elfutils/elfutils-dbg: FILELIST: removed "/usr/lib/.debug/libdebuginfod-0.189.so /usr/lib/.debug/libasm-0.189.so /usr/lib/.debug/libelf-0.189.so /usr/lib/.debug/libdw-0.189.so", added "/usr/lib/.debug/libdw-0.190.so /usr/bin/.debug/eu-srcfiles /usr/lib/elfutils/ptest/tests/.debug/system-elf-gelf-test /usr/lib/.debug/libasm-0.190.so /usr/lib/.debug/libelf-0.190.so /usr/lib/.debug/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/elfutils-dev: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-dev: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-dev: PKGSIZE changed from 215674 to 216322 (+0%)
packages/core2-64-poky-linux/elfutils/elfutils-doc: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-doc: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-doc: PKGSIZE changed from 69790 to 73546 (+5%)
packages/core2-64-poky-linux/elfutils/elfutils-doc: FILELIST: added "/usr/share/man/man1/eu-srcfiles.1"
packages/core2-64-poky-linux/elfutils/elfutils-locale-de: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-de: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+boldquot: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+boldquot: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+boldquot: PKGSIZE changed from 157322 to 157744 (+0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+quot: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+quot: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-en+quot: PKGSIZE changed from 155486 to 155908 (+0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-es: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-es: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-es: PKGSIZE changed from 106776 to 106582 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-ja: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-ja: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-ja: PKGSIZE changed from 92248 to 92046 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-pl: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-pl: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-pl: PKGSIZE changed from 165530 to 165373 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-locale-uk: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-locale-uk: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-locale-uk: PKGSIZE changed from 193954 to 193756 (-0%)
packages/core2-64-poky-linux/elfutils/elfutils-ptest: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-ptest: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-ptest: PKGSIZE changed from 46652835 to 47675052 (+2%)
packages/core2-64-poky-linux/elfutils/elfutils-ptest: FILELIST: removed "/usr/lib/elfutils/ptest/tests/run-strip-reloc.sh /usr/lib/elfutils/ptest/tests/run-copymany-sections.sh", added "/usr/lib/elfutils/ptest/backends/loongarch_retval.o /usr/lib/elfutils/ptest/tests/libelf.h /usr/lib/elfutils/ptest/backends/loongarch_cfi.o /usr/lib/elfutils/ptest/tests/run-copymany-be32.sh /usr/lib/elfutils/ptest/tests/run-copymany-be64.sh /usr/lib/elfutils/ptest/tests/run-copymany-le32.sh /usr/lib/elfutils/ptest/tests/run-copymany-le64.sh /usr/lib/elfutils/ptest/backends/loongarch_unwind.os /usr/lib/elfutils/ptest/tests/run-strip-reloc-ppc64.sh /usr/lib/elfutils/ptest/tests/testfilegdbindex9.bz2 /usr/lib/elfutils/ptest/tests/run-strip-reloc-ko.sh /usr/lib/elfutils/ptest/backends/loongarch_initreg.o /usr/lib/elfutils/ptest/tests/run-srcfiles-self.sh /usr/lib/elfutils/ptest/backends/loongarch_corenote.os /usr/lib/elfutils/ptest/tests/strip-reloc-subr.sh /usr/lib/elfutils/ptest/backends/loongarch_core
 note.o /usr/lib/elfutils/ptest/backends/loongarch_cfi.os /usr/lib/elfutils/ptest/libelf/elf32_getchdr.h /usr/lib/elfutils/ptest/tests/system-elf-gelf-test.c /usr/lib/elfutils/ptest/tests/system_elf_gelf_test-system-elf-gelf-test.o /usr/lib/elfutils/ptest/tests/run-strip-reloc-self.sh /usr/lib/elfutils/ptest/backends/loongarch_regs.o /usr/lib/elfutils/ptest/tests/run-debuginfod-IXr.sh /usr/lib/elfutils/ptest/tests/system-elf-gelf-test /usr/lib/elfutils/ptest/backends/loongarch_retval.os /usr/lib/elfutils/ptest/tests/testfilegdbindex9-no-maininfo.bz2 /usr/lib/elfutils/ptest/backends/loongarch_initreg.os /usr/lib/elfutils/ptest/backends/loongarch_regs.os /usr/lib/elfutils/ptest/tests/test-copymany-subr.sh /usr/lib/elfutils/ptest/backends/loongarch_unwind.o"
packages/core2-64-poky-linux/elfutils/elfutils-src: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-src: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-src: PKGSIZE changed from 4784766 to 4873827 (+2%)
packages/core2-64-poky-linux/elfutils/elfutils-src: FILELIST: directory renamed /usr/src/debug/elfutils/0.189/libdwelf -> /usr/src/debug/elfutils/0.190/libdwelf, directory renamed /usr/src/debug/elfutils/0.189/libdwfl -> /usr/src/debug/elfutils/0.190/libdwfl, directory renamed /usr/src/debug/elfutils/0.189/lib -> /usr/src/debug/elfutils/0.190/lib, directory renamed /usr/src/debug/elfutils/0.189/libebl -> /usr/src/debug/elfutils/0.190/libebl, directory renamed /usr/src/debug/elfutils/0.189/libdw -> /usr/src/debug/elfutils/0.190/libdw, directory renamed /usr/src/debug/elfutils/0.189/libasm -> /usr/src/debug/elfutils/0.190/libasm, directory renamed /usr/src/debug/elfutils/0.189/debuginfod -> /usr/src/debug/elfutils/0.190/debuginfod, directory renamed /usr/src/debug/elfutils/0.189/libcpu -> /usr/src/debug/elfutils/0.190/libcpu, removed "/usr/src/debug/elfutils/0.189/backends/aarch64_cfi.c /usr/src/debug/elfutils/0.189/tests/addsections.c /usr/src/debug/elfutils/0.189/backends/aarch64_ini
 treg.c /usr/src/debug/elfutils/0.189/libelf/elf32_getchdr.c /usr/src/debug/elfutils/0.189/backends/aarch64_init.c /usr/src/debug/elfutils/0.189/libelf/elf32_getehdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_getphdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_getshdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_newehdr.c /usr/src/debug/elfutils/0.189/libelf/elf32_newphdr.c /usr/src/debug/elfutils/0.189/libelf/elf_compress.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_shdr.c /usr/src/debug/elfutils/0.189/backends/common-reloc.c /usr/src/debug/elfutils/0.189/backends/sparc_attrs.c /usr/src/debug/elfutils/0.189/tests/line2addr.c /usr/src/debug/elfutils/0.189/libelf/elf_rand.c /usr/src/debug/elfutils/0.189/tests/allfcts.c /usr/src/debug/elfutils/0.189/backends/arm_retval.c /usr/src/debug/elfutils/0.189/backends/arm_symbol.c /usr/src/debug/elfutils/0.189/tests/dwarf-getmacros.c /usr/src/debug/elfutils/0.189/backends/x86_64_unwind.c /usr/src/debug/elfutils/0.189/src/addr2line.c /u
 sr/src/debug/elfutils/0.189/tests/get-pubnames.c /usr/src/debug/elfutils/0.189/backends/arm_initreg.c /usr/src/debug/elfutils/0.189/tests/arsymtest.c /usr/src/debug/elfutils/0.189/libelf/version_xlate.h /usr/src/debug/elfutils/0.189/backends/i386_corenote.c /usr/src/debug/elfutils/0.189/tests/leb128.c /usr/src/debug/elfutils/0.189/tests/asm-tst8.c /usr/src/debug/elfutils/0.189/src/ar.c /usr/src/debug/elfutils/0.189/tests/emptyfile.c /usr/src/debug/elfutils/0.189/src/elfcompress.c /usr/src/debug/elfutils/0.189/tests/asm-tst6.c /usr/src/debug/elfutils/0.189/libelf/gelf_getverdef.c /usr/src/debug/elfutils/0.189/tests/zstrptr.c /usr/src/debug/elfutils/0.189/libelf/elf_getarhdr.c /usr/src/debug/elfutils/0.189/libelf/elf_getphdrnum.c /usr/src/debug/elfutils/0.189/libelf/elf_getshdrnum.c /usr/src/debug/elfutils/0.189/src/arlib.h /usr/src/debug/elfutils/0.189/tests/asm-tst2.c /usr/src/debug/elfutils/0.189/src/arlib.c /usr/src/debug/elfutils/0.189/src/elflint.c /usr/src/debug/elfutils/0.189/
 src/stack.c /usr/src/debug/elfutils/0.189/tests/elfstrtab.c /usr/src/debug/elfutils/0.189/src/strip.c /usr/src/debug/elfutils/0.189/libelf/elf_getshdrstrndx.c /usr/src/debug/elfutils/0.189/backends/aarch64_retval.c /usr/src/debug/elfutils/0.189/src/readelf.c /usr/src/debug/elfutils/0.189/libelf/gelf_getclass.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_sym.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_lib.c /usr/src/debug/elfutils/0.189/libelf/elf_getident.c /usr/src/debug/elfutils/0.189/src/arlib2.c /usr/src/debug/elfutils/0.189/src/elfcmp.c /usr/src/debug/elfutils/0.189/src/ranlib.c /usr/src/debug/elfutils/0.189/libelf/chdr_xlate.h /usr/src/debug/elfutils/0.189/libelf/gelf_update_symshndx.c /usr/src/debug/elfutils/0.189/tests/elfcopy.c /usr/src/debug/elfutils/0.189/libelf/elf_strptr.c /usr/src/debug/elfutils/0.189/src/nm.c /usr/src/debug/elfutils/0.189/backends/x86_64_init.c /usr/src/debug/elfutils/0.189/backends/sparc_regs.c /usr/src/debug/elfutils/0.189/backends/arc_r
 eloc.def /usr/src/debug/elfutils/0.189/libelf/elf32_xlatetom.c /usr/src/debug/elfutils/0.189/tests/newscn.c /usr/src/debug/elfutils/0.189/libelf/gelf_getshdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_newehdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_newphdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_getchdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_getehdr.c /usr/src/debug/elfutils/0.189/libelf/gelf_getphdr.c /usr/src/debug/elfutils/0.189/tests/dwarf-ranges.c /usr/src/debug/elfutils/0.189/backends/riscv_init.c /usr/src/debug/elfutils/0.189/backends/aarch64_symbol.c /usr/src/debug/elfutils/0.189/backends/csky_attrs.c /usr/src/debug/elfutils/0.189/backends/m68k_init.c /usr/src/debug/elfutils/0.189/backends/m68k_regs.c /usr/src/debug/elfutils/0.189/libelf/gelf_checksum.c /usr/src/debug/elfutils/0.189/backends/sh_regs.c /usr/src/debug/elfutils/0.189/backends/alpha_reloc.def /usr/src/debug/elfutils/0.189/backends/sparc_reloc.def /usr/src/debug/elfutils/0.189/tests/nvidia_extended_
 linemap_libdw.c /usr/src/debug/elfutils/0.189/libelf/elf_error.c /usr/src/debug/elfutils/0.189/libelf/gnuhash_xlate.h /usr/src/debug/elfutils/0.189/libelf/elf32_fsize.c /usr/src/debug/elfutils/0.189/libelf/nlist.h /usr/src/debug/elfutils/0.189/tests/aggregate_size.c /usr/src/debug/elfutils/0.189/src/elfclassify.c /usr/src/debug/elfutils/0.189/libelf/nlist.c /usr/src/debug/elfutils/0.189/backends/s390_reloc.def /usr/src/debug/elfutils/0.189/backends/s390_corenote.c /usr/src/debug/elfutils/0.189/tests/varlocs.c /usr/src/debug/elfutils/0.189/backends/ppc64_resolve_sym.c /usr/src/debug/elfutils/0.189/tests/elfgetchdr.c /usr/src/debug/elfutils/0.189/backends/ppc64_retval.c /usr/src/debug/elfutils/0.189/libelf/elf_compress_gnu.c /usr/src/debug/elfutils/0.189/backends/alpha_regs.c /usr/src/debug/elfutils/0.189/tests/dwfl-bug-report.c /usr/src/debug/elfutils/0.189/backends/arm_attrs.c /usr/src/debug/elfutils/0.189/tests/arls.c /usr/src/debug/elfutils/0.189/tests/asm-tst4.c /usr/src/debug/el
 futils/0.189/tests/getsrc_die.c /usr/src/debug/elfutils/0.189/tests/hash.c /usr/src/debug/elfutils/0.189/libelf/libelfP.h /usr/src/debug/elfutils/0.189/tests/newdata.c /usr/src/debug/elfutils/0.189/backends/arm_auxv.c /usr/src/debug/elfutils/0.189/backends/arm_init.c /usr/src/debug/elfutils/0.189/backends/arm_regs.c /usr/src/debug/elfutils/0.189/backends/linux-core-note.c /usr/src/debug/elfutils/0.189/libelf/gelf_getvernaux.c /usr/src/debug/elfutils/0.189/tests/low_high_pc.c /usr/src/debug/elfutils/0.189/tests/arextract.c /usr/src/debug/elfutils/0.189/libelf/elf_getaroff.c /usr/src/debug/elfutils/0.189/libelf/elf_gnu_hash.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_auxv.c /usr/src/debug/elfutils/0.189/libelf/elf_ndxscn.c /usr/src/debug/elfutils/0.189/libelf/elf_newscn.c /usr/src/debug/elfutils/0.189/backends/ppc_retval.c /usr/src/debug/elfutils/0.189/backends/ppc_symbol.c /usr/src/debug/elfutils/0.189/libelf/gelf_offscn.c /usr/src/debug/elfutils/0.189/libelf/gelf_getdyn.c /us
 r/src/debug/elfutils/0.189/libelf/gelf_getlib.c /usr/src/debug/elfutils/0.189/libelf/gelf_getauxv.c /usr/src/debug/elfutils/0.189/libelf/gelf_getrel.c /usr/src/debug/elfutils/0.189/libelf/gelf_getsym.c /usr/src/debug/elfutils/0.189/tests/elfputzdata.c /usr/src/debug/elfutils/0.189/tests/sectiondump.c /usr/src/debug/elfutils/0.189/tests/strptr.c /usr/src/debug/elfutils/0.189/tests/scnnames.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_verdaux.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_vernaux.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_verneed.c /usr/src/debug/elfutils/0.189/tests/get-aranges.c /usr/src/debug/elfutils/0.189/tests/dwflmodtest.c /usr/src/debug/elfutils/0.189/tests/unit-info.c /usr/src/debug/elfutils/0.189/backends/csky_initreg.c /usr/src/debug/elfutils/0.189/backends/arc_symbol.c /usr/src/debug/elfutils/0.189/backends/riscv_cfi.c /usr/src/debug/elfutils/0.189/backends/x86_64_cfi.c /usr/src/debug/elfutils/0.189/tests/rerequest_tag.c /usr/src/debug/el
 futils/0.189/tests/dwfl-proc-attach.c /usr/src/debug/elfutils/0.189/libelf/elf_flagdata.c /usr/src/debug/elfutils/0.189/tests/update2.c /usr/src/debug/elfutils/0.189/tests/update4.c /usr/src/debug/elfutils/0.189/backends/ppc64_init.c /usr/src/debug/elfutils/0.189/backends/m68k_reloc.def /usr/src/debug/elfutils/0.189/tests/debugaltlink.c /usr/src/debug/elfutils/0.189/backends/x86_64_regs.c /usr/src/debug/elfutils/0.189/tests/addrcfi.c /usr/src/debug/elfutils/0.189/libelf/elf_flagelf.c /usr/src/debug/elfutils/0.189/libelf/elf_flagscn.c /usr/src/debug/elfutils/0.189/libelf/elf_newdata.c /usr/src/debug/elfutils/0.189/libelf/elf_nextscn.c /usr/src/debug/elfutils/0.189/libelf/elf_version.c /usr/src/debug/elfutils/0.189/tests/dwfl-bug-addr-overflow.c /usr/src/debug/elfutils/0.189/tests/read_unaligned.c /usr/src/debug/elfutils/0.189/libelf/elf32_offscn.c /usr/src/debug/elfutils/0.189/backends/sh_retval.c /usr/src/debug/elfutils/0.189/backends/sh_symbol.c /usr/src/debug/elfutils/0.189/tests/
 allregs.c /usr/src/debug/elfutils/0.189/backends/ppc64_unwind.c /usr/src/debug/elfutils/0.189/tests/next_cfi.c /usr/src/debug/elfutils/0.189/backends/m68k_cfi.c /usr/src/debug/elfutils/0.189/backends/bpf_symbol.c /usr/src/debug/elfutils/0.189/backends/loongarch_symbol.c /usr/src/debug/elfutils/0.189/backends/ia64_symbol.c /usr/src/debug/elfutils/0.189/backends/arm_reloc.def /usr/src/debug/elfutils/0.189/libelf/gelf.h /usr/src/debug/elfutils/0.189/backends/csky_regs.c /usr/src/debug/elfutils/0.189/tests/asm-tst3.c /usr/src/debug/elfutils/0.189/backends/csky_init.c /usr/src/debug/elfutils/0.189/backends/sh_reloc.def /usr/src/debug/elfutils/0.189/tests/get-lines.c /usr/src/debug/elfutils/0.189/tests/asm-tst1.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_dyn.c /usr/src/debug/elfutils/0.189/backends/i386_unwind.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_rel.c /usr/src/debug/elfutils/0.189/backends/i386_cfi.c /usr/src/debug/elfutils/0.189/backends/ppc64_reloc.def /usr/src/deb
 ug/elfutils/0.189/tests/dwfl-bug-fd-leak.c /usr/src/debug/elfutils/0.189/backends/sh_corenote.c /usr/src/debug/elfutils/0.189/tests/funcretval.c /usr/src/debug/elfutils/0.189/tests/show-abbrev.c /usr/src/debug/elfutils/0.189/backends/libebl_CPU.h /usr/src/debug/elfutils/0.189/backends/m68k_corenote.c /usr/src/debug/elfutils/0.189/tests/msg_tst.c /usr/src/debug/elfutils/0.189/backends/sparc_retval.c /usr/src/debug/elfutils/0.189/backends/alpha_retval.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_move.c /usr/src/debug/elfutils/0.189/src/arlib-argp.c /usr/src/debug/elfutils/0.189/tests/all-dwarf-ranges.c /usr/src/debug/elfutils/0.189/libelf/elf_hash.c /usr/src/debug/elfutils/0.189/libelf/gelf_getverdaux.c /usr/src/debug/elfutils/0.189/backends/arc_init.c /usr/src/debug/elfutils/0.189/libelf/elf_getbase.c /usr/src/debug/elfutils/0.189/libelf/elf_getdata.c /usr/src/debug/elfutils/0.189/tests/funcretval_test++11.cxx /usr/src/debug/elfutils/0.189/libelf/libelf.h /usr/src/debug/elfutil
 s/0.189/libelf/gelf_update_rela.c /usr/src/debug/elfutils/0.189/tests/find-prologues.c /usr/src/debug/elfutils/0.189/libelf/elf_cntl.c /usr/src/debug/elfutils/0.189/backends/x86_64_symbol.c /usr/src/debug/elfutils/0.189/tests/get-files.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_ehdr.c /usr/src/debug/elfutils/0.189/backends/ppc_reloc.def /usr/src/debug/elfutils/0.189/libelf/gelf_getsymshndx.c /usr/src/debug/elfutils/0.189/tests/asm-tst5.c /usr/src/debug/elfutils/0.189/backends/aarch64_regs.c /usr/src/debug/elfutils/0.189/backends/csky_symbol.c /usr/src/debug/elfutils/0.189/tests/xlate_notes.c /usr/src/debug/elfutils/0.189/backends/ppc_initreg.c /usr/src/debug/elfutils/0.189/tests/get-units-split.c /usr/src/debug/elfutils/0.189/backends/x86_corenote.c /usr/src/debug/elfutils/0.189/tests/asm-tst7.c /usr/src/debug/elfutils/0.189/libelf/common.h /usr/src/debug/elfutils/0.189/backends/ppc64_symbol.c /usr/src/debug/elfutils/0.189/backends/loongarch_init.c /usr/src/debug/elfutils/0.
 189/backends/s390_unwind.c /usr/src/debug/elfutils/0.189/src/strings.c /usr/src/debug/elfutils/0.189/tests/test-flag-nobits.c /usr/src/debug/elfutils/0.189/tests/debuginfod_build_id_find.c /usr/src/debug/elfutils/0.189/libelf/elf_begin.c /usr/src/debug/elfutils/0.189/libelf/elf_scnshndx.c /usr/src/debug/elfutils/0.189/backends/aarch64_reloc.def /usr/src/debug/elfutils/0.189/tests/vendorelf.c /usr/src/debug/elfutils/0.189/backends/sparc_cfi.c /usr/src/debug/elfutils/0.189/libelf/elf_getarsym.c /usr/src/debug/elfutils/0.189/backends/arm_machineflagname.c /usr/src/debug/elfutils/0.189/tests/saridx.c /usr/src/debug/elfutils/0.189/backends/sparc_init.c /usr/src/debug/elfutils/0.189/tests/get-units-invalid.c /usr/src/debug/elfutils/0.189/backends/riscv_retval.c /usr/src/debug/elfutils/0.189/libelf/elf_end.c /usr/src/debug/elfutils/0.189/libelf/gelf_getrela.c /usr/src/debug/elfutils/0.189/libelf/gelf_getversym.c /usr/src/debug/elfutils/0.189/tests/dwflsyms.c /usr/src/debug/elfutils/0.189/t
 ests/elfshphehdr.c /usr/src/debug/elfutils/0.189/tests/next-files.c /usr/src/debug/elfutils/0.189/tests/vdsosyms.c /usr/src/debug/elfutils/0.189/backends/sparc_auxv.c /usr/src/debug/elfutils/0.189/tests/dwarf-die-addr-die.c /usr/src/debug/elfutils/0.189/tests/deleted-lib.c /usr/src/debug/elfutils/0.189/tests/typeiter2.c /usr/src/debug/elfutils/0.189/backends/ia64_retval.c /usr/src/debug/elfutils/0.189/tests/dwfl-bug-getmodules.c /usr/src/debug/elfutils/0.189/libelf/elf_fill.c /usr/src/debug/elfutils/0.189/backends/i386_initreg.c /usr/src/debug/elfutils/0.189/libelf/elf_getscn.c /usr/src/debug/elfutils/0.189/tests/asm-tst9.c /usr/src/debug/elfutils/0.189/backends/i386_retval.c /usr/src/debug/elfutils/0.189/libelf/elf_next.c /usr/src/debug/elfutils/0.189/tests/show-die-info.c /usr/src/debug/elfutils/0.189/tests/elfgetzdata.c /usr/src/debug/elfutils/0.189/tests/debuglink.c /usr/src/debug/elfutils/0.189/tests/backtrace.c /usr/src/debug/elfutils/0.189/backends/sparc_corenote.c /usr/src/d
 ebug/elfutils/0.189/libelf/elf32_updatenull.c /usr/src/debug/elfutils/0.189/backends/x86_64_reloc.def /usr/src/debug/elfutils/0.189/libelf/gelf_update_syminfo.c /usr/src/debug/elfutils/0.189/libelf/gelf_getverneed.c /usr/src/debug/elfutils/0.189/libelf/elf32_updatefile.c /usr/src/debug/elfutils/0.189/tests/fillfile.c /usr/src/debug/elfutils/0.189/backends/ia64_init.c /usr/src/debug/elfutils/0.189/backends/ia64_regs.c /usr/src/debug/elfutils/0.189/backends/arm_cfi.c /usr/src/debug/elfutils/0.189/tests/attr-integrate-skel.c /usr/src/debug/elfutils/0.189/tests/buildid.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_verdef.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_versym.c /usr/src/debug/elfutils/0.189/backends/sparc_initreg.c /usr/src/debug/elfutils/0.189/backends/m68k_initreg.c /usr/src/debug/elfutils/0.189/libelf/elf_flagehdr.c /usr/src/debug/elfutils/0.189/libelf/elf_flagphdr.c /usr/src/debug/elfutils/0.189/libelf/elf_flagshdr.c /usr/src/debug/elfutils/0.189/tests/elfrdw
 rnop.c /usr/src/debug/elfutils/0.189/backends/arm_corenote.c /usr/src/debug/elfutils/0.189/backends/riscv_corenote.c /usr/src/debug/elfutils/0.189/libelf/gelf_fsize.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlate.c /usr/src/debug/elfutils/0.189/tests/showptable.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlate.h /usr/src/debug/elfutils/0.189/libelf/elf32_xlatetof.c /usr/src/debug/elfutils/0.189/libelf/gelf_getmove.c /usr/src/debug/elfutils/0.189/libelf/gelf_getnote.c /usr/src/debug/elfutils/0.189/backends/alpha_auxv.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlatetom.c /usr/src/debug/elfutils/0.189/tests/dwfl-addr-sect.c /usr/src/debug/elfutils/0.189/backends/loongarch_reloc.def /usr/src/debug/elfutils/0.189/tests/next-lines.c /usr/src/debug/elfutils/0.189/tests/early-offscn.c /usr/src/debug/elfutils/0.189/backends/alpha_init.c /usr/src/debug/elfutils/0.189/libelf/gelf_getsyminfo.c /usr/src/debug/elfutils/0.189/tests/rdwrmmap.c /usr/src/debug/elfutils/0.189/backends/csky_cfi.c /u
 sr/src/debug/elfutils/0.189/backends/s390_retval.c /usr/src/debug/elfutils/0.189/backends/alpha_corenote.c /usr/src/debug/elfutils/0.189/backends/ppc_cfi.c /usr/src/debug/elfutils/0.189/tests/newfile.c /usr/src/debug/elfutils/0.189/backends/aarch64_unwind.c /usr/src/debug/elfutils/0.189/backends/sparc_symbol.c /usr/src/debug/elfutils/0.189/backends/x86_64_retval.c /usr/src/debug/elfutils/0.189/libelf/dl-hash.h /usr/src/debug/elfutils/0.189/backends/x86_64_corenote.c /usr/src/debug/elfutils/0.189/tests/update1.c /usr/src/debug/elfutils/0.189/libelf/elf_getdata_rawchunk.c /usr/src/debug/elfutils/0.189/backends/s390_cfi.c /usr/src/debug/elfutils/0.189/backends/ppc_auxv.c /usr/src/debug/elfutils/0.189/backends/ppc_init.c /usr/src/debug/elfutils/0.189/backends/ppc_regs.c /usr/src/debug/elfutils/0.189/backends/x86_64_initreg.c /usr/src/debug/elfutils/0.189/libelf/elf.h /usr/src/debug/elfutils/0.189/src/findtextrel.c /usr/src/debug/elfutils/0.189/tests/typeiter.c /usr/src/debug/elfutils/0.
 189/backends/ppc_attrs.c /usr/src/debug/elfutils/0.189/backends/i386_reloc.def /usr/src/debug/elfutils/0.189/backends/m68k_symbol.c /usr/src/debug/elfutils/0.189/backends/riscv_initreg.c /usr/src/debug/elfutils/0.189/libelf/elf32_checksum.c /usr/src/debug/elfutils/0.189/tests/dwelf_elf_e_machine_string.c /usr/src/debug/elfutils/0.189/backends/riscv_regs.c /usr/src/debug/elfutils/0.189/backends/csky_reloc.def /usr/src/debug/elfutils/0.189/backends/csky_corenote.c /usr/src/debug/elfutils/0.189/backends/aarch64_corenote.c /usr/src/debug/elfutils/0.189/libelf/elf_rawdata.c /usr/src/debug/elfutils/0.189/libelf/elf_rawfile.c /usr/src/debug/elfutils/0.189/libelf/elf_readall.c /usr/src/debug/elfutils/0.189/libelf/gelf_update_phdr.c /usr/src/debug/elfutils/0.189/backends/ppc_corenote.c /usr/src/debug/elfutils/0.189/backends/i386_symbol.c /usr/src/debug/elfutils/0.189/backends/i386_auxv.c /usr/src/debug/elfutils/0.189/backends/i386_init.c /usr/src/debug/elfutils/0.189/backends/i386_regs.c /us
 r/src/debug/elfutils/0.189/tests/update3.c /usr/src/debug/elfutils/0.189/backends/ia64_reloc.def /usr/src/debug/elfutils/0.189/tests/addrscopes.c /usr/src/debug/elfutils/0.189/tests/funcscopes.c /usr/src/debug/elfutils/0.189/tests/getphdrnum.c /usr/src/debug/elfutils/0.189/libelf/elf_memory.c /usr/src/debug/elfutils/0.189/libelf/elf_update.c /usr/src/debug/elfutils/0.189/backends/bpf_reloc.def /usr/src/debug/elfutils/0.189/backends/alpha_symbol.c /usr/src/debug/elfutils/0.189/tests/dwarf-getstring.c /usr/src/debug/elfutils/0.189/tests/dwarfcfi.c /usr/src/debug/elfutils/0.189/tests/system-elf-libelf-test.c /usr/src/debug/elfutils/0.189/tests/test-elf_cntl_gelf_getshdr.c /usr/src/debug/elfutils/0.189/tests/dwelfgnucompressed.c /usr/src/debug/elfutils/0.189/backends/bpf_init.c /usr/src/debug/elfutils/0.189/backends/bpf_regs.c /usr/src/debug/elfutils/0.189/backends/m68k_retval.c /usr/src/debug/elfutils/0.189/libelf/elf_kind.c /usr/src/debug/elfutils/0.189/src/objdump.c /usr/src/debug/el
 futils/0.189/src/unstrip.c /usr/src/debug/elfutils/0.189/tests/dwfl-report-elf-align.c /usr/src/debug/elfutils/0.189/libelf/gelf_xlatetof.c /usr/src/debug/elfutils/0.189/src/size.c /usr/src/debug/elfutils/0.189/tests/dwarf_default_lower_bound.c /usr/src/debug/elfutils/0.189/backends/riscv_reloc.def /usr/src/debug/elfutils/0.189/tests/alldts.c /usr/src/debug/elfutils/0.189/tests/peel_type.c /usr/src/debug/elfutils/0.189/tests/dwfl-report-segment-contiguous.c /usr/src/debug/elfutils/0.189/backends/riscv_symbol.c /usr/src/debug/elfutils/0.189/libelf/elf_clone.c /usr/src/debug/elfutils/0.189/tests/ecp.c /usr/src/debug/elfutils/0.189/tests/dwfl-report-offline-memory.c /usr/src/debug/elfutils/0.189/backends/s390_symbol.c /usr/src/debug/elfutils/0.189/backends/s390_init.c /usr/src/debug/elfutils/0.189/backends/s390_regs.c /usr/src/debug/elfutils/0.189/libelf/note_xlate.h /usr/src/debug/elfutils/0.189/backends/s390_initreg.c /usr/src/debug/elfutils/0.189/backends/sh_init.c", added "/usr/src
 /debug/elfutils/0.190/backends/aarch64_cfi.c /usr/src/debug/elfutils/0.190/tests/addsections.c /usr/src/debug/elfutils/0.190/backends/aarch64_initreg.c /usr/src/debug/elfutils/0.190/libelf/elf32_getehdr.c /usr/src/debug/elfutils/0.190/backends/aarch64_init.c /usr/src/debug/elfutils/0.190/libelf/elf32_getphdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_getshdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_newehdr.c /usr/src/debug/elfutils/0.190/libelf/elf32_newphdr.c /usr/src/debug/elfutils/0.190/libelf/elf_compress.c /usr/src/debug/elfutils/0.190/libelf/elf32_getchdr.h /usr/src/debug/elfutils/0.190/libelf/gelf_update_shdr.c /usr/src/debug/elfutils/0.190/backends/common-reloc.c /usr/src/debug/elfutils/0.190/backends/sparc_attrs.c /usr/src/debug/elfutils/0.190/tests/line2addr.c /usr/src/debug/elfutils/0.190/libelf/elf_rand.c /usr/src/debug/elfutils/0.190/tests/allfcts.c /usr/src/debug/elfutils/0.190/backends/arm_retval.c /usr/src/debug/elfutils/0.190/backends/arm_symbol.c /usr/src/deb
 ug/elfutils/0.190/tests/dwarf-getmacros.c /usr/src/debug/elfutils/0.190/backends/x86_64_unwind.c /usr/src/debug/elfutils/0.190/src/addr2line.c /usr/src/debug/elfutils/0.190/tests/get-pubnames.c /usr/src/debug/elfutils/0.190/backends/arm_initreg.c /usr/src/debug/elfutils/0.190/tests/arsymtest.c /usr/src/debug/elfutils/0.190/libelf/version_xlate.h /usr/src/debug/elfutils/0.190/backends/i386_corenote.c /usr/src/debug/elfutils/0.190/tests/leb128.c /usr/src/debug/elfutils/0.190/tests/asm-tst8.c /usr/src/debug/elfutils/0.190/src/ar.c /usr/src/debug/elfutils/0.190/tests/emptyfile.c /usr/src/debug/elfutils/0.190/src/elfcompress.c /usr/src/debug/elfutils/0.190/tests/asm-tst6.c /usr/src/debug/elfutils/0.190/libelf/gelf_getverdef.c /usr/src/debug/elfutils/0.190/tests/zstrptr.c /usr/src/debug/elfutils/0.190/libelf/elf_getarhdr.c /usr/src/debug/elfutils/0.190/libelf/elf_getphdrnum.c /usr/src/debug/elfutils/0.190/libelf/elf_getshdrnum.c /usr/src/debug/elfutils/0.190/src/arlib.h /usr/src/debug/elf
 utils/0.190/tests/asm-tst2.c /usr/src/debug/elfutils/0.190/src/arlib.c /usr/src/debug/elfutils/0.190/src/elflint.c /usr/src/debug/elfutils/0.190/src/stack.c /usr/src/debug/elfutils/0.190/tests/elfstrtab.c /usr/src/debug/elfutils/0.190/src/strip.c /usr/src/debug/elfutils/0.190/libelf/elf_getshdrstrndx.c /usr/src/debug/elfutils/0.190/backends/aarch64_retval.c /usr/src/debug/elfutils/0.190/src/readelf.c /usr/src/debug/elfutils/0.190/libelf/gelf_getclass.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_sym.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_lib.c /usr/src/debug/elfutils/0.190/libelf/elf_getident.c /usr/src/debug/elfutils/0.190/src/arlib2.c /usr/src/debug/elfutils/0.190/src/elfcmp.c /usr/src/debug/elfutils/0.190/src/ranlib.c /usr/src/debug/elfutils/0.190/libelf/chdr_xlate.h /usr/src/debug/elfutils/0.190/libelf/gelf_update_symshndx.c /usr/src/debug/elfutils/0.190/tests/elfcopy.c /usr/src/debug/elfutils/0.190/libelf/elf_strptr.c /usr/src/debug/elfutils/0.190/src/nm.c /usr
 /src/debug/elfutils/0.190/backends/loongarch_unwind.c /usr/src/debug/elfutils/0.190/backends/x86_64_init.c /usr/src/debug/elfutils/0.190/backends/sparc_regs.c /usr/src/debug/elfutils/0.190/backends/arc_reloc.def /usr/src/debug/elfutils/0.190/libelf/elf32_xlatetom.c /usr/src/debug/elfutils/0.190/tests/newscn.c /usr/src/debug/elfutils/0.190/libelf/gelf_getshdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_newehdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_newphdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_getchdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_getehdr.c /usr/src/debug/elfutils/0.190/libelf/gelf_getphdr.c /usr/src/debug/elfutils/0.190/tests/dwarf-ranges.c /usr/src/debug/elfutils/0.190/backends/riscv_init.c /usr/src/debug/elfutils/0.190/backends/aarch64_symbol.c /usr/src/debug/elfutils/0.190/backends/csky_attrs.c /usr/src/debug/elfutils/0.190/backends/m68k_init.c /usr/src/debug/elfutils/0.190/backends/m68k_regs.c /usr/src/debug/elfutils/0.190/libelf/gelf_checksum.c /usr/src
 /debug/elfutils/0.190/backends/sh_regs.c /usr/src/debug/elfutils/0.190/backends/alpha_reloc.def /usr/src/debug/elfutils/0.190/backends/sparc_reloc.def /usr/src/debug/elfutils/0.190/tests/nvidia_extended_linemap_libdw.c /usr/src/debug/elfutils/0.190/libelf/elf_error.c /usr/src/debug/elfutils/0.190/libelf/gnuhash_xlate.h /usr/src/debug/elfutils/0.190/libelf/elf32_fsize.c /usr/src/debug/elfutils/0.190/libelf/nlist.h /usr/src/debug/elfutils/0.190/tests/aggregate_size.c /usr/src/debug/elfutils/0.190/src/elfclassify.c /usr/src/debug/elfutils/0.190/libelf/nlist.c /usr/src/debug/elfutils/0.190/backends/s390_reloc.def /usr/src/debug/elfutils/0.190/backends/s390_corenote.c /usr/src/debug/elfutils/0.190/tests/varlocs.c /usr/src/debug/elfutils/0.190/backends/ppc64_resolve_sym.c /usr/src/debug/elfutils/0.190/tests/elfgetchdr.c /usr/src/debug/elfutils/0.190/backends/ppc64_retval.c /usr/src/debug/elfutils/0.190/libelf/elf_compress_gnu.c /usr/src/debug/elfutils/0.190/backends/alpha_regs.c /usr/src/
 debug/elfutils/0.190/tests/dwfl-bug-report.c /usr/src/debug/elfutils/0.190/backends/arm_attrs.c /usr/src/debug/elfutils/0.190/tests/arls.c /usr/src/debug/elfutils/0.190/tests/asm-tst4.c /usr/src/debug/elfutils/0.190/tests/getsrc_die.c /usr/src/debug/elfutils/0.190/tests/hash.c /usr/src/debug/elfutils/0.190/libelf/libelfP.h /usr/src/debug/elfutils/0.190/tests/newdata.c /usr/src/debug/elfutils/0.190/backends/arm_auxv.c /usr/src/debug/elfutils/0.190/backends/arm_init.c /usr/src/debug/elfutils/0.190/backends/arm_regs.c /usr/src/debug/elfutils/0.190/backends/linux-core-note.c /usr/src/debug/elfutils/0.190/libelf/gelf_getvernaux.c /usr/src/debug/elfutils/0.190/tests/low_high_pc.c /usr/src/debug/elfutils/0.190/tests/arextract.c /usr/src/debug/elfutils/0.190/libelf/elf_getaroff.c /usr/src/debug/elfutils/0.190/libelf/elf_gnu_hash.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_auxv.c /usr/src/debug/elfutils/0.190/libelf/elf_ndxscn.c /usr/src/debug/elfutils/0.190/libelf/elf_newscn.c /usr/s
 rc/debug/elfutils/0.190/backends/ppc_retval.c /usr/src/debug/elfutils/0.190/backends/ppc_symbol.c /usr/src/debug/elfutils/0.190/libelf/gelf_offscn.c /usr/src/debug/elfutils/0.190/libelf/gelf_getdyn.c /usr/src/debug/elfutils/0.190/libelf/gelf_getlib.c /usr/src/debug/elfutils/0.190/libelf/gelf_getauxv.c /usr/src/debug/elfutils/0.190/libelf/gelf_getrel.c /usr/src/debug/elfutils/0.190/libelf/gelf_getsym.c /usr/src/debug/elfutils/0.190/tests/elfputzdata.c /usr/src/debug/elfutils/0.190/tests/sectiondump.c /usr/src/debug/elfutils/0.190/tests/strptr.c /usr/src/debug/elfutils/0.190/tests/scnnames.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_verdaux.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_vernaux.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_verneed.c /usr/src/debug/elfutils/0.190/tests/get-aranges.c /usr/src/debug/elfutils/0.190/tests/dwflmodtest.c /usr/src/debug/elfutils/0.190/tests/system-elf-gelf-test.c /usr/src/debug/elfutils/0.190/tests/unit-info.c /usr/src/debug/e
 lfutils/0.190/backends/csky_initreg.c /usr/src/debug/elfutils/0.190/backends/arc_symbol.c /usr/src/debug/elfutils/0.190/backends/riscv_cfi.c /usr/src/debug/elfutils/0.190/backends/x86_64_cfi.c /usr/src/debug/elfutils/0.190/tests/rerequest_tag.c /usr/src/debug/elfutils/0.190/tests/dwfl-proc-attach.c /usr/src/debug/elfutils/0.190/libelf/elf_flagdata.c /usr/src/debug/elfutils/0.190/tests/update2.c /usr/src/debug/elfutils/0.190/tests/update4.c /usr/src/debug/elfutils/0.190/backends/ppc64_init.c /usr/src/debug/elfutils/0.190/backends/m68k_reloc.def /usr/src/debug/elfutils/0.190/tests/debugaltlink.c /usr/src/debug/elfutils/0.190/backends/x86_64_regs.c /usr/src/debug/elfutils/0.190/tests/addrcfi.c /usr/src/debug/elfutils/0.190/libelf/elf_version.c /usr/src/debug/elfutils/0.190/libelf/elf_flagelf.c /usr/src/debug/elfutils/0.190/libelf/elf_flagscn.c /usr/src/debug/elfutils/0.190/libelf/elf_newdata.c /usr/src/debug/elfutils/0.190/libelf/elf_nextscn.c /usr/src/debug/elfutils/0.190/tests/dwfl-b
 ug-addr-overflow.c /usr/src/debug/elfutils/0.190/tests/read_unaligned.c /usr/src/debug/elfutils/0.190/libelf/elf32_offscn.c /usr/src/debug/elfutils/0.190/backends/sh_retval.c /usr/src/debug/elfutils/0.190/backends/sh_symbol.c /usr/src/debug/elfutils/0.190/tests/allregs.c /usr/src/debug/elfutils/0.190/backends/ppc64_unwind.c /usr/src/debug/elfutils/0.190/tests/next_cfi.c /usr/src/debug/elfutils/0.190/backends/m68k_cfi.c /usr/src/debug/elfutils/0.190/backends/bpf_symbol.c /usr/src/debug/elfutils/0.190/backends/loongarch_symbol.c /usr/src/debug/elfutils/0.190/backends/ia64_symbol.c /usr/src/debug/elfutils/0.190/backends/arm_reloc.def /usr/src/debug/elfutils/0.190/libelf/gelf.h /usr/src/debug/elfutils/0.190/backends/csky_regs.c /usr/src/debug/elfutils/0.190/tests/asm-tst3.c /usr/src/debug/elfutils/0.190/backends/csky_init.c /usr/src/debug/elfutils/0.190/backends/sh_reloc.def /usr/src/debug/elfutils/0.190/tests/get-lines.c /usr/src/debug/elfutils/0.190/tests/asm-tst1.c /usr/src/debug/elf
 utils/0.190/libelf/gelf_update_dyn.c /usr/src/debug/elfutils/0.190/backends/i386_unwind.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_rel.c /usr/src/debug/elfutils/0.190/backends/i386_cfi.c /usr/src/debug/elfutils/0.190/backends/ppc64_reloc.def /usr/src/debug/elfutils/0.190/tests/dwfl-bug-fd-leak.c /usr/src/debug/elfutils/0.190/backends/sh_corenote.c /usr/src/debug/elfutils/0.190/backends/loongarch_corenote.c /usr/src/debug/elfutils/0.190/tests/funcretval.c /usr/src/debug/elfutils/0.190/tests/show-abbrev.c /usr/src/debug/elfutils/0.190/backends/m68k_corenote.c /usr/src/debug/elfutils/0.190/backends/libebl_CPU.h /usr/src/debug/elfutils/0.190/tests/msg_tst.c /usr/src/debug/elfutils/0.190/backends/sparc_retval.c /usr/src/debug/elfutils/0.190/backends/alpha_retval.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_move.c /usr/src/debug/elfutils/0.190/src/arlib-argp.c /usr/src/debug/elfutils/0.190/tests/all-dwarf-ranges.c /usr/src/debug/elfutils/0.190/libelf/elf_hash.c /usr/src/debu
 g/elfutils/0.190/libelf/gelf_getverdaux.c /usr/src/debug/elfutils/0.190/backends/arc_init.c /usr/src/debug/elfutils/0.190/libelf/elf_getbase.c /usr/src/debug/elfutils/0.190/libelf/elf_getdata.c /usr/src/debug/elfutils/0.190/tests/funcretval_test++11.cxx /usr/src/debug/elfutils/0.190/libelf/libelf.h /usr/src/debug/elfutils/0.190/libelf/gelf_update_rela.c /usr/src/debug/elfutils/0.190/tests/find-prologues.c /usr/src/debug/elfutils/0.190/libelf/elf_cntl.c /usr/src/debug/elfutils/0.190/backends/x86_64_symbol.c /usr/src/debug/elfutils/0.190/tests/get-files.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_ehdr.c /usr/src/debug/elfutils/0.190/backends/ppc_reloc.def /usr/src/debug/elfutils/0.190/libelf/gelf_getsymshndx.c /usr/src/debug/elfutils/0.190/tests/asm-tst5.c /usr/src/debug/elfutils/0.190/backends/aarch64_regs.c /usr/src/debug/elfutils/0.190/backends/csky_symbol.c /usr/src/debug/elfutils/0.190/tests/xlate_notes.c /usr/src/debug/elfutils/0.190/backends/ppc_initreg.c /usr/src/debug/
 elfutils/0.190/tests/get-units-split.c /usr/src/debug/elfutils/0.190/backends/x86_corenote.c /usr/src/debug/elfutils/0.190/tests/asm-tst7.c /usr/src/debug/elfutils/0.190/libelf/common.h /usr/src/debug/elfutils/0.190/backends/ppc64_symbol.c /usr/src/debug/elfutils/0.190/backends/loongarch_init.c /usr/src/debug/elfutils/0.190/backends/s390_unwind.c /usr/src/debug/elfutils/0.190/src/strings.c /usr/src/debug/elfutils/0.190/tests/test-flag-nobits.c /usr/src/debug/elfutils/0.190/tests/debuginfod_build_id_find.c /usr/src/debug/elfutils/0.190/libelf/elf_begin.c /usr/src/debug/elfutils/0.190/libelf/elf_scnshndx.c /usr/src/debug/elfutils/0.190/backends/aarch64_reloc.def /usr/src/debug/elfutils/0.190/tests/vendorelf.c /usr/src/debug/elfutils/0.190/backends/sparc_cfi.c /usr/src/debug/elfutils/0.190/libelf/elf_getarsym.c /usr/src/debug/elfutils/0.190/backends/arm_machineflagname.c /usr/src/debug/elfutils/0.190/tests/saridx.c /usr/src/debug/elfutils/0.190/backends/sparc_init.c /usr/src/debug/elfu
 tils/0.190/tests/get-units-invalid.c /usr/src/debug/elfutils/0.190/backends/riscv_retval.c /usr/src/debug/elfutils/0.190/libelf/elf_end.c /usr/src/debug/elfutils/0.190/libelf/gelf_getrela.c /usr/src/debug/elfutils/0.190/libelf/gelf_getversym.c /usr/src/debug/elfutils/0.190/tests/dwflsyms.c /usr/src/debug/elfutils/0.190/tests/elfshphehdr.c /usr/src/debug/elfutils/0.190/backends/loongarch_initreg.c /usr/src/debug/elfutils/0.190/tests/next-files.c /usr/src/debug/elfutils/0.190/tests/vdsosyms.c /usr/src/debug/elfutils/0.190/backends/sparc_auxv.c /usr/src/debug/elfutils/0.190/tests/dwarf-die-addr-die.c /usr/src/debug/elfutils/0.190/tests/deleted-lib.c /usr/src/debug/elfutils/0.190/tests/typeiter2.c /usr/src/debug/elfutils/0.190/backends/ia64_retval.c /usr/src/debug/elfutils/0.190/backends/loongarch_cfi.c /usr/src/debug/elfutils/0.190/tests/dwfl-bug-getmodules.c /usr/src/debug/elfutils/0.190/libelf/elf_fill.c /usr/src/debug/elfutils/0.190/tests/libelf.h /usr/src/debug/elfutils/0.190/backe
 nds/i386_initreg.c /usr/src/debug/elfutils/0.190/libelf/elf_getscn.c /usr/src/debug/elfutils/0.190/tests/asm-tst9.c /usr/src/debug/elfutils/0.190/backends/i386_retval.c /usr/src/debug/elfutils/0.190/libelf/elf_next.c /usr/src/debug/elfutils/0.190/tests/show-die-info.c /usr/src/debug/elfutils/0.190/tests/elfgetzdata.c /usr/src/debug/elfutils/0.190/tests/debuglink.c /usr/src/debug/elfutils/0.190/tests/backtrace.c /usr/src/debug/elfutils/0.190/backends/sparc_corenote.c /usr/src/debug/elfutils/0.190/libelf/elf32_updatenull.c /usr/src/debug/elfutils/0.190/backends/x86_64_reloc.def /usr/src/debug/elfutils/0.190/libelf/gelf_update_syminfo.c /usr/src/debug/elfutils/0.190/libelf/gelf_getverneed.c /usr/src/debug/elfutils/0.190/libelf/elf32_updatefile.c /usr/src/debug/elfutils/0.190/tests/fillfile.c /usr/src/debug/elfutils/0.190/backends/ia64_init.c /usr/src/debug/elfutils/0.190/backends/ia64_regs.c /usr/src/debug/elfutils/0.190/backends/arm_cfi.c /usr/src/debug/elfutils/0.190/tests/attr-integ
 rate-skel.c /usr/src/debug/elfutils/0.190/tests/buildid.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_verdef.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_versym.c /usr/src/debug/elfutils/0.190/backends/sparc_initreg.c /usr/src/debug/elfutils/0.190/backends/m68k_initreg.c /usr/src/debug/elfutils/0.190/libelf/elf_flagehdr.c /usr/src/debug/elfutils/0.190/libelf/elf_flagphdr.c /usr/src/debug/elfutils/0.190/libelf/elf_flagshdr.c /usr/src/debug/elfutils/0.190/tests/elfrdwrnop.c /usr/src/debug/elfutils/0.190/backends/arm_corenote.c /usr/src/debug/elfutils/0.190/backends/riscv_corenote.c /usr/src/debug/elfutils/0.190/libelf/gelf_fsize.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlate.c /usr/src/debug/elfutils/0.190/tests/showptable.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlate.h /usr/src/debug/elfutils/0.190/libelf/elf32_xlatetof.c /usr/src/debug/elfutils/0.190/libelf/gelf_getmove.c /usr/src/debug/elfutils/0.190/libelf/gelf_getnote.c /usr/src/debug/elfutils/0.190/backends/alp
 ha_auxv.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlatetom.c /usr/src/debug/elfutils/0.190/tests/dwfl-addr-sect.c /usr/src/debug/elfutils/0.190/backends/loongarch_reloc.def /usr/src/debug/elfutils/0.190/tests/next-lines.c /usr/src/debug/elfutils/0.190/tests/early-offscn.c /usr/src/debug/elfutils/0.190/backends/alpha_init.c /usr/src/debug/elfutils/0.190/libelf/gelf_getsyminfo.c /usr/src/debug/elfutils/0.190/tests/rdwrmmap.c /usr/src/debug/elfutils/0.190/backends/csky_cfi.c /usr/src/debug/elfutils/0.190/backends/s390_retval.c /usr/src/debug/elfutils/0.190/backends/alpha_corenote.c /usr/src/debug/elfutils/0.190/backends/ppc_cfi.c /usr/src/debug/elfutils/0.190/tests/newfile.c /usr/src/debug/elfutils/0.190/backends/aarch64_unwind.c /usr/src/debug/elfutils/0.190/backends/sparc_symbol.c /usr/src/debug/elfutils/0.190/backends/x86_64_retval.c /usr/src/debug/elfutils/0.190/libelf/dl-hash.h /usr/src/debug/elfutils/0.190/backends/x86_64_corenote.c /usr/src/debug/elfutils/0.190/tests/update1.c
  /usr/src/debug/elfutils/0.190/libelf/elf_getdata_rawchunk.c /usr/src/debug/elfutils/0.190/backends/s390_cfi.c /usr/src/debug/elfutils/0.190/backends/ppc_auxv.c /usr/src/debug/elfutils/0.190/backends/ppc_init.c /usr/src/debug/elfutils/0.190/backends/ppc_regs.c /usr/src/debug/elfutils/0.190/backends/x86_64_initreg.c /usr/src/debug/elfutils/0.190/libelf/elf.h /usr/src/debug/elfutils/0.190/src/findtextrel.c /usr/src/debug/elfutils/0.190/tests/typeiter.c /usr/src/debug/elfutils/0.190/backends/ppc_attrs.c /usr/src/debug/elfutils/0.190/backends/i386_reloc.def /usr/src/debug/elfutils/0.190/backends/m68k_symbol.c /usr/src/debug/elfutils/0.190/backends/riscv_initreg.c /usr/src/debug/elfutils/0.190/libelf/elf32_checksum.c /usr/src/debug/elfutils/0.190/tests/dwelf_elf_e_machine_string.c /usr/src/debug/elfutils/0.190/backends/riscv_regs.c /usr/src/debug/elfutils/0.190/backends/csky_reloc.def /usr/src/debug/elfutils/0.190/backends/csky_corenote.c /usr/src/debug/elfutils/0.190/backends/aarch64_co
 renote.c /usr/src/debug/elfutils/0.190/libelf/elf_rawdata.c /usr/src/debug/elfutils/0.190/libelf/elf_rawfile.c /usr/src/debug/elfutils/0.190/libelf/elf_readall.c /usr/src/debug/elfutils/0.190/libelf/gelf_update_phdr.c /usr/src/debug/elfutils/0.190/backends/ppc_corenote.c /usr/src/debug/elfutils/0.190/backends/i386_symbol.c /usr/src/debug/elfutils/0.190/backends/i386_auxv.c /usr/src/debug/elfutils/0.190/backends/i386_init.c /usr/src/debug/elfutils/0.190/backends/i386_regs.c /usr/src/debug/elfutils/0.190/tests/update3.c /usr/src/debug/elfutils/0.190/src/srcfiles.cxx /usr/src/debug/elfutils/0.190/backends/ia64_reloc.def /usr/src/debug/elfutils/0.190/tests/addrscopes.c /usr/src/debug/elfutils/0.190/tests/funcscopes.c /usr/src/debug/elfutils/0.190/tests/getphdrnum.c /usr/src/debug/elfutils/0.190/libelf/elf_memory.c /usr/src/debug/elfutils/0.190/libelf/elf_update.c /usr/src/debug/elfutils/0.190/backends/bpf_reloc.def /usr/src/debug/elfutils/0.190/backends/alpha_symbol.c /usr/src/debug/elf
 utils/0.190/tests/dwarf-getstring.c /usr/src/debug/elfutils/0.190/tests/dwarfcfi.c /usr/src/debug/elfutils/0.190/tests/system-elf-libelf-test.c /usr/src/debug/elfutils/0.190/backends/loongarch_regs.c /usr/src/debug/elfutils/0.190/tests/test-elf_cntl_gelf_getshdr.c /usr/src/debug/elfutils/0.190/tests/dwelfgnucompressed.c /usr/src/debug/elfutils/0.190/backends/bpf_init.c /usr/src/debug/elfutils/0.190/backends/bpf_regs.c /usr/src/debug/elfutils/0.190/backends/m68k_retval.c /usr/src/debug/elfutils/0.190/libelf/elf_kind.c /usr/src/debug/elfutils/0.190/src/objdump.c /usr/src/debug/elfutils/0.190/src/unstrip.c /usr/src/debug/elfutils/0.190/tests/dwfl-report-elf-align.c /usr/src/debug/elfutils/0.190/libelf/gelf_xlatetof.c /usr/src/debug/elfutils/0.190/src/size.c /usr/src/debug/elfutils/0.190/tests/dwarf_default_lower_bound.c /usr/src/debug/elfutils/0.190/backends/riscv_reloc.def /usr/src/debug/elfutils/0.190/tests/alldts.c /usr/src/debug/elfutils/0.190/tests/peel_type.c /usr/src/debug/elfut
 ils/0.190/tests/dwfl-report-segment-contiguous.c /usr/src/debug/elfutils/0.190/backends/riscv_symbol.c /usr/src/debug/elfutils/0.190/libelf/elf_clone.c /usr/src/debug/elfutils/0.190/tests/ecp.c /usr/src/debug/elfutils/0.190/tests/dwfl-report-offline-memory.c /usr/src/debug/elfutils/0.190/backends/s390_symbol.c /usr/src/debug/elfutils/0.190/backends/s390_init.c /usr/src/debug/elfutils/0.190/backends/s390_regs.c /usr/src/debug/elfutils/0.190/libelf/note_xlate.h /usr/src/debug/elfutils/0.190/backends/s390_initreg.c /usr/src/debug/elfutils/0.190/backends/loongarch_retval.c /usr/src/debug/elfutils/0.190/backends/sh_init.c"
packages/core2-64-poky-linux/elfutils/elfutils-staticdev: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils-staticdev: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils-staticdev: PKGSIZE changed from 10693924 to 10785182 (+1%)
packages/core2-64-poky-linux/elfutils/elfutils: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/elfutils: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/elfutils: PKGSIZE changed from 1586405 to 1641909 (+3%)
packages/core2-64-poky-linux/elfutils/elfutils: FILELIST: added "/usr/bin/eu-srcfiles"
packages/core2-64-poky-linux/elfutils: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils: SRC_URI changed from "https://sourceware.org/elfutils/ftp/0.189/elfutils-0.189.tar.bz2 file://run-ptest file://0001-dso-link-change.patch file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch file://0003-fixheadercheck.patch file://0006-Fix-build-on-aarch64-musl.patch file://0001-libasm-may-link-with-libbz2-if-found.patch file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch file://0001-skip-the-test-when-gcc-not-deployed.patch file://ptest.patch file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch file://0001-Add-helper-function-for-basename.patch file://0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch" to "https://sourceware.org/elfutils/ftp/0.190/elfutils-0.190.tar.bz2 file://run-ptest file://0001-dso-link-change.patch file://0002-Fix-elf_cvt_gunhash-if-dest-and-src-are-same.patch file://0003-fixheadercheck.patch file://0006-Fix-build-on-aarch64-musl.patch file://0001-libasm-may-link-
 with-libbz2-if-found.patch file://0001-libelf-elf_end.c-check-data_list.data.d.d_buf-before.patch file://0001-skip-the-test-when-gcc-not-deployed.patch file://ptest.patch file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch file://0001-Add-helper-function-for-basename.patch file://0001-tests-fix-build-against-upcoming-gcc-14-Werror-callo.patch"
packages/core2-64-poky-linux/elfutils/libasm: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libasm: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libasm: FILES: removed "/usr/lib/libasm-0.189.so", added "/usr/lib/libasm-0.190.so"
packages/core2-64-poky-linux/elfutils/libasm: FILELIST: removed "/usr/lib/libasm-0.189.so", added "/usr/lib/libasm-0.190.so"
packages/core2-64-poky-linux/elfutils/libdebuginfod: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libdebuginfod: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libdebuginfod: FILES: removed "/usr/lib/libdebuginfod-0.189.so", added "/usr/lib/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/libdebuginfod: FILELIST: removed "/usr/lib/libdebuginfod-0.189.so", added "/usr/lib/libdebuginfod-0.190.so"
packages/core2-64-poky-linux/elfutils/libdw: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libdw: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libdw: PKGSIZE changed from 642078 to 646174 (+1%)
packages/core2-64-poky-linux/elfutils/libdw: FILES: removed "/usr/lib/libdw-0.189.so", added "/usr/lib/libdw-0.190.so"
packages/core2-64-poky-linux/elfutils/libdw: FILELIST: removed "/usr/lib/libdw-0.189.so", added "/usr/lib/libdw-0.190.so"
packages/core2-64-poky-linux/elfutils/libelf: PKGV changed from 0.189 [default] to 0.190 [default]
packages/core2-64-poky-linux/elfutils/libelf: PV changed from "0.189" to "0.190"
packages/core2-64-poky-linux/elfutils/libelf: PKGSIZE changed from 104575 to 108671 (+4%)
packages/core2-64-poky-linux/elfutils/libelf: FILES: removed "/usr/lib/libelf-0.189.so", added "/usr/lib/libelf-0.190.so"
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
packages/core2-64-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 8294072 to 8294112 (+0%)
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

--===============6967352585882484388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/elfutils/elfutils-doc: FILELIST: added "/usr/share/man/man1/eu-srcfiles.1"
packages/core2-64-poky-linux/elfutils/elfutils-ptest: FILELIST: removed "/usr/lib/elfutils/ptest/tests/run-strip-reloc.sh /usr/lib/elfutils/ptest/tests/run-copymany-sections.sh", added "/usr/lib/elfutils/ptest/backends/loongarch_regs.os /usr/lib/elfutils/ptest/libelf/elf32_getchdr.h /usr/lib/elfutils/ptest/tests/test-copymany-subr.sh /usr/lib/elfutils/ptest/tests/run-strip-reloc-ko.sh /usr/lib/elfutils/ptest/tests/run-copymany-be32.sh /usr/lib/elfutils/ptest/tests/run-copymany-be64.sh /usr/lib/elfutils/ptest/tests/run-copymany-le32.sh /usr/lib/elfutils/ptest/tests/run-copymany-le64.sh /usr/lib/elfutils/ptest/backends/loongarch_initreg.o /usr/lib/elfutils/ptest/backends/loongarch_regs.o /usr/lib/elfutils/ptest/backends/loongarch_corenote.os /usr/lib/elfutils/ptest/backends/loongarch_cfi.o /usr/lib/elfutils/ptest/tests/system_elf_gelf_test-system-elf-gelf-test.o /usr/lib/elfutils/ptest/tests/libelf.h /usr/lib/elfutils/ptest/backends/loongarch_unwind.o /usr/lib/elfutils/ptest/backends/l
 oongarch_cfi.os /usr/lib/elfutils/ptest/tests/run-strip-reloc-self.sh /usr/lib/elfutils/ptest/backends/loongarch_initreg.os /usr/lib/elfutils/ptest/backends/loongarch_corenote.o /usr/lib/elfutils/ptest/backends/loongarch_unwind.os /usr/lib/elfutils/ptest/tests/testfilegdbindex9-no-maininfo.bz2 /usr/lib/elfutils/ptest/tests/system-elf-gelf-test /usr/lib/elfutils/ptest/backends/loongarch_retval.os /usr/lib/elfutils/ptest/tests/strip-reloc-subr.sh /usr/lib/elfutils/ptest/tests/testfilegdbindex9.bz2 /usr/lib/elfutils/ptest/tests/system-elf-gelf-test.c /usr/lib/elfutils/ptest/backends/loongarch_retval.o /usr/lib/elfutils/ptest/tests/run-debuginfod-IXr.sh /usr/lib/elfutils/ptest/tests/run-srcfiles-self.sh /usr/lib/elfutils/ptest/tests/run-strip-reloc-ppc64.sh"
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

--===============6967352585882484388==--

