Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5655D6C0C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:33 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d126so1671531pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ntIJJKlzX0vu9Rjuv0kgpf3wX9XhOVQVuw4iP62S5pk=;
	b=rH5A7+HkGTUFwaDgjG1GEOaqkGY7xKn3w56k1uq3pDzMLnBC7Dg1nRCmu7JMo6yTlU
	f2lstVifgzQlBGBuZAR1zUEaORe+Y1QCkhSJtJw9HxZO/Ri1eKTeNrOUi3T2jQnytcFK
	qFuFhcEw5VJghw8ukIEPZjhNhAX9E/47d7x4ijt3qS+sgk6yt0x+4KXSEPOSPIJwK1AR
	4Na2sz0AFQEcG5lB5d0mSsd/jsd38uz63V4GysMSEBoBsHUJimckCjeCEu/uxJ6cKtEA
	H4PVVYxBNLBYivIKtdadZjCz20f5tQTrlcWoQNatwA2bwMpcU0DOFxz2z66ChfUB3Uqh
	hKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ntIJJKlzX0vu9Rjuv0kgpf3wX9XhOVQVuw4iP62S5pk=;
	b=m8u8Vei3bj8T6cQMs5dG8+pwwOoWf5ZlLabglFB4dqBnGdFur+Mpovb3Yhn9UyvqqB
	K5XDCaJs6Yn1WqvCx6b+8e8AHNRwpik4TDCmPlxPgB7yqppCFkhhlVMfHbkcsnC1dC7a
	0+euFPsocMK5B5D7sEl1wVuhaZlK4EmyNraSSXF2CAwiltd7qykAOBG6MT78GGkzeVtH
	1G9pbcr4BZAW0tPdojct89zwh6rtG+Peir6iI3ohS2p77pAFYuAUmvD8cPiwR1InrGiI
	ppR1l8rQ+UZ+OJakrsPRgX+2Zm6aW7fJKUt6aQaL27RlhRttfoiUwYAt/MLxQvHcz6ET
	olCw==
X-Gm-Message-State: APjAAAUwlDAIn0N2xOWgpLpD7ptOBxTDiQ15pKAIkf0f2Xs8h1YKf1oj
	+2Tqs8Ak8ZVrqZnwg1iJzn8gbiBqkQk=
X-Google-Smtp-Source: APXvYqx4AytoU6GPaZUqb2PJCHl5HiepheRgnLFnWOUocil3BtkyzK1VJKdP0qmTGAc9QXiMsAd6yg==
X-Received: by 2002:a63:dc02:: with SMTP id s2mr3943919pgg.286.1561568014088; 
	Wed, 26 Jun 2019 09:53:34 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:53:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:03 -0700
Message-Id: <ac5dca7dc68519b36aa976dfd25d8efa76af74ec.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 02/25] elfutils: Security fixes CVE-2019-7146, 7149, 7150
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:33 -0000

From: Armin Kuster <akuster@mvista.com>

Source: http://sourceware.org/git/elfutils.git
MR: 97563, 97568, 97558
Type: Security Fix
Disposition: Backport from http://sourceware.org/git/elfutils.git
ChangeID: 6183c2a25d5e32eec1846a428dd165e1de659f24
Description:

Affects <= 0.175

Fixes:
CVE-2019-7146
CVE-2019-7149
CVE-2019-7150

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.175.bb   |   4 +
 .../elfutils/files/CVE-2019-7146_p1.patch          |  52 ++++++++
 .../elfutils/files/CVE-2019-7146_p2.patch          |  65 +++++++++
 .../elfutils/files/CVE-2019-7149.patch             | 148 +++++++++++++++++++++
 .../elfutils/files/CVE-2019-7150.patch             |  51 +++++++
 5 files changed, 320 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7146_p1.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7146_p2.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7149.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7150.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.175.bb b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
index b0b9ddc..e94a48e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.175.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.175.bb
@@ -27,6 +27,10 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://debian/hurd_path.patch \
            file://debian/ignore_strmerge.diff \
            file://debian/disable_werror.patch \
+           file://CVE-2019-7149.patch \
+           file://CVE-2019-7150.patch \
+           file://CVE-2019-7146_p1.patch \
+           file://CVE-2019-7146_p2.patch \
            "
 SRC_URI_append_libc-musl = " file://0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch"
 
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7146_p1.patch b/meta/recipes-devtools/elfutils/files/CVE-2019-7146_p1.patch
new file mode 100644
index 0000000..b6cd29a
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7146_p1.patch
@@ -0,0 +1,52 @@
+From 012018907ca05eb0ab51d424a596ef38fc87cae1 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Wed, 16 Jan 2019 11:57:35 +0100
+Subject: [PATCH] libebl: Check GNU property note pr_datasz fits inside note
+ description.
+
+Before printing the data values, make sure pr_datasz doesn't go beyond
+the end of the note description data.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=24075
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport
+CVE: CVE-2019-7146 patch #1
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libebl/ChangeLog    | 4 ++++
+ libebl/eblobjnote.c | 7 +++++++
+ 2 files changed, 11 insertions(+)
+
+Index: elfutils-0.175/libebl/eblobjnote.c
+===================================================================
+--- elfutils-0.175.orig/libebl/eblobjnote.c
++++ elfutils-0.175/libebl/eblobjnote.c
+@@ -350,6 +350,13 @@ ebl_object_note (Ebl *ebl, uint32_t name
+ 		  desc += 8;
+ 		  descsz -= 8;
+ 
++		  if (prop.pr_datasz > descsz)
++		    {
++		      printf ("BAD property datasz: %" PRId32 "\n",
++			      prop.pr_datasz);
++		      return;
++		    }
++
+ 		  int elfclass = gelf_getclass (ebl->elf);
+ 		  char *elfident = elf_getident (ebl->elf, NULL);
+ 		  GElf_Ehdr ehdr;
+Index: elfutils-0.175/libebl/ChangeLog
+===================================================================
+--- elfutils-0.175.orig/libebl/ChangeLog
++++ elfutils-0.175/libebl/ChangeLog
+@@ -1,3 +1,7 @@
++2019-01-16  Mark Wielaard  <mark@klomp.org>
++
++       * eblobjnte.c (ebl_object_note): Check pr_datasz isn't too large.
++
+ 2018-11-15  Mark Wielaard  <mark@klomp.org>
+ 
+ 	* eblobjnotetypename.c (ebl_object_note_type_name): Don't update
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7146_p2.patch b/meta/recipes-devtools/elfutils/files/CVE-2019-7146_p2.patch
new file mode 100644
index 0000000..4434b36
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7146_p2.patch
@@ -0,0 +1,65 @@
+From cd7ded3df43f655af945c869976401a602e46fcd Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Wed, 30 Jan 2019 00:04:11 +0100
+Subject: [PATCH] libebl: Check GNU property note data padding fits inside
+ note.
+
+The GNU property note data is padded. Make sure the extra padding
+still fits in the note description.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=24075
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport
+CVE: CVE-2019-7146 patch #2
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libebl/ChangeLog    |  5 +++++
+ libebl/eblobjnote.c | 17 +++++++++--------
+ 2 files changed, 14 insertions(+), 8 deletions(-)
+
+Index: elfutils-0.175/libebl/ChangeLog
+===================================================================
+--- elfutils-0.175.orig/libebl/ChangeLog
++++ elfutils-0.175/libebl/ChangeLog
+@@ -1,3 +1,8 @@
++2019-01-29  Mark Wielaard  <mark@klomp.org>
++
++	* eblobjnote.c (ebl_object_note): Check pr_datasz padding doesn't
++	overflow descsz.
++
+ 2019-01-16  Mark Wielaard  <mark@klomp.org>
+ 
+        * eblobjnte.c (ebl_object_note): Check pr_datasz isn't too large.
+Index: elfutils-0.175/libebl/eblobjnote.c
+===================================================================
+--- elfutils-0.175.orig/libebl/eblobjnote.c
++++ elfutils-0.175/libebl/eblobjnote.c
+@@ -486,16 +486,17 @@ ebl_object_note (Ebl *ebl, uint32_t name
+ 			  printf ("%02" PRIx8 "\n", (uint8_t) desc[i]);
+ 			}
+ 		    }
++
+ 		  if (elfclass == ELFCLASS32)
+-		    {
+-		      desc += NOTE_ALIGN4 (prop.pr_datasz);
+-		      descsz -= NOTE_ALIGN4 (prop.pr_datasz);
+-		    }
++		    prop.pr_datasz = NOTE_ALIGN4 (prop.pr_datasz);
+ 		  else
+-		    {
+-		      desc += NOTE_ALIGN8 (prop.pr_datasz);
+-		      descsz -= NOTE_ALIGN8 (prop.pr_datasz);
+-		    }
++		    prop.pr_datasz = NOTE_ALIGN8 (prop.pr_datasz);
++
++		  desc += prop.pr_datasz;
++		  if (descsz > prop.pr_datasz)
++		    descsz -= prop.pr_datasz;
++		  else
++		    descsz = 0;
+ 		}
+ 	    }
+ 	  break;
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7149.patch b/meta/recipes-devtools/elfutils/files/CVE-2019-7149.patch
new file mode 100644
index 0000000..215a171
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7149.patch
@@ -0,0 +1,148 @@
+From 2562759d6fe5b364fe224852e64e8bda39eb2e35 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 20 Jan 2019 22:10:18 +0100
+Subject: [PATCH] libdw: Check terminating NUL byte in dwarf_getsrclines for
+ dir/file table.
+
+For DWARF version < 5 the .debug_line directory and file tables consist
+of a terminating NUL byte after all strings. The code used to just skip
+this without checking it actually existed. This could case a spurious
+read past the end of data.
+
+Fix the same issue in readelf.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=24102
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport
+CVE: CVE-2019-7149
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libdw/ChangeLog           |  5 +++++
+ libdw/dwarf_getsrclines.c | 11 ++++++++---
+ src/ChangeLog             |  5 +++++
+ src/readelf.c             |  8 ++++++--
+ 4 files changed, 24 insertions(+), 5 deletions(-)
+
+Index: elfutils-0.175/libdw/dwarf_getsrclines.c
+===================================================================
+--- elfutils-0.175.orig/libdw/dwarf_getsrclines.c
++++ elfutils-0.175/libdw/dwarf_getsrclines.c
+@@ -315,7 +315,7 @@ read_srclines (Dwarf *dbg,
+   if (version < 5)
+     {
+       const unsigned char *dirp = linep;
+-      while (*dirp != 0)
++      while (dirp < lineendp && *dirp != 0)
+ 	{
+ 	  uint8_t *endp = memchr (dirp, '\0', lineendp - dirp);
+ 	  if (endp == NULL)
+@@ -323,6 +323,8 @@ read_srclines (Dwarf *dbg,
+ 	  ++ndirs;
+ 	  dirp = endp + 1;
+ 	}
++      if (dirp >= lineendp || *dirp != '\0')
++	goto invalid_data;
+       ndirs = ndirs + 1; /* There is always the "unknown" dir.  */
+     }
+   else
+@@ -392,11 +394,12 @@ read_srclines (Dwarf *dbg,
+ 	{
+ 	  dirarray[n].dir = (char *) linep;
+ 	  uint8_t *endp = memchr (linep, '\0', lineendp - linep);
+-	  assert (endp != NULL);
++	  assert (endp != NULL); // Checked above when calculating ndirlist.
+ 	  dirarray[n].len = endp - linep;
+ 	  linep = endp + 1;
+ 	}
+       /* Skip the final NUL byte.  */
++      assert (*linep == '\0'); // Checked above when calculating ndirlist.
+       ++linep;
+     }
+   else
+@@ -471,7 +474,7 @@ read_srclines (Dwarf *dbg,
+     {
+       if (unlikely (linep >= lineendp))
+ 	goto invalid_data;
+-      while (*linep != 0)
++      while (linep < lineendp && *linep != '\0')
+ 	{
+ 	  struct filelist *new_file = NEW_FILE ();
+ 
+@@ -527,6 +530,8 @@ read_srclines (Dwarf *dbg,
+ 	    goto invalid_data;
+ 	  get_uleb128 (new_file->info.length, linep, lineendp);
+ 	}
++      if (linep >= lineendp || *linep != '\0')
++	goto invalid_data;
+       /* Skip the final NUL byte.  */
+       ++linep;
+     }
+Index: elfutils-0.175/src/readelf.c
+===================================================================
+--- elfutils-0.175.orig/src/readelf.c
++++ elfutils-0.175/src/readelf.c
+@@ -8444,7 +8444,7 @@ print_debug_line_section (Dwfl_Module *d
+ 	}
+       else
+ 	{
+-	  while (*linep != 0)
++	  while (linep < lineendp && *linep != 0)
+ 	    {
+ 	      unsigned char *endp = memchr (linep, '\0', lineendp - linep);
+ 	      if (unlikely (endp == NULL))
+@@ -8454,6 +8454,8 @@ print_debug_line_section (Dwfl_Module *d
+ 
+ 	      linep = endp + 1;
+ 	    }
++	  if (linep >= lineendp || *linep != 0)
++	    goto invalid_unit;
+ 	  /* Skip the final NUL byte.  */
+ 	  ++linep;
+ 	}
+@@ -8523,7 +8525,7 @@ print_debug_line_section (Dwfl_Module *d
+       else
+ 	{
+ 	  puts (gettext (" Entry Dir   Time      Size      Name"));
+-	  for (unsigned int cnt = 1; *linep != 0; ++cnt)
++	  for (unsigned int cnt = 1; linep < lineendp && *linep != 0; ++cnt)
+ 	    {
+ 	      /* First comes the file name.  */
+ 	      char *fname = (char *) linep;
+@@ -8553,6 +8555,8 @@ print_debug_line_section (Dwfl_Module *d
+ 	      printf (" %-5u %-5u %-9u %-9u %s\n",
+ 		      cnt, diridx, mtime, fsize, fname);
+ 	    }
++	  if (linep >= lineendp || *linep != '\0')
++	    goto invalid_unit;
+ 	  /* Skip the final NUL byte.  */
+ 	  ++linep;
+ 	}
+Index: elfutils-0.175/libdw/ChangeLog
+===================================================================
+--- elfutils-0.175.orig/libdw/ChangeLog
++++ elfutils-0.175/libdw/ChangeLog
+@@ -1,3 +1,8 @@
++2019-01-20  Mark Wielaard  <mark@klomp.org>
++
++       * dwarf_getsrclines.c (read_srclines): Check terminating NUL byte
++       for dir and file lists.
++
+ 2018-10-20  Mark Wielaard  <mark@klomp.org>
+ 
+ 	* libdw.map (ELFUTILS_0.175): New section. Add dwelf_elf_begin.
+Index: elfutils-0.175/src/ChangeLog
+===================================================================
+--- elfutils-0.175.orig/src/ChangeLog
++++ elfutils-0.175/src/ChangeLog
+@@ -1,3 +1,8 @@
++2019-01-20  Mark Wielaard  <mark@klomp.org>
++
++       * readelf.c (print_debug_line_section): Check terminating NUL byte
++       for dir and file tables.
++
+ 2018-11-10  Mark Wielaard  <mark@klomp.org>
+ 
+ 	* elflint.c (check_program_header): Allow PT_GNU_EH_FRAME segment
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2019-7150.patch b/meta/recipes-devtools/elfutils/files/CVE-2019-7150.patch
new file mode 100644
index 0000000..01a4fb1
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2019-7150.patch
@@ -0,0 +1,51 @@
+From da5c5336a1eaf519de246f7d9f0f5585e1d4ac59 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 20 Jan 2019 23:05:56 +0100
+Subject: [PATCH] libdwfl: Sanity check partial core file dyn data read.
+
+When reading the dyn data from the core file check if we got everything,
+or just part of the data.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=24103
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+Upstream-Status: Backport
+CVE: CVE-2019-7150
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libdwfl/ChangeLog                    | 5 +++++
+ libdwfl/dwfl_segment_report_module.c | 6 ++++++
+ 2 files changed, 11 insertions(+)
+
+Index: elfutils-0.175/libdwfl/dwfl_segment_report_module.c
+===================================================================
+--- elfutils-0.175.orig/libdwfl/dwfl_segment_report_module.c
++++ elfutils-0.175/libdwfl/dwfl_segment_report_module.c
+@@ -783,6 +783,12 @@ dwfl_segment_report_module (Dwfl *dwfl,
+   if (dyn_filesz != 0 && dyn_filesz % dyn_entsize == 0
+       && ! read_portion (&dyn_data, &dyn_data_size, dyn_vaddr, dyn_filesz))
+     {
++      /* dyn_data_size will be zero if we got everything from the initial
++         buffer, otherwise it will be the size of the new buffer that
++         could be read.  */
++      if (dyn_data_size != 0)
++	dyn_filesz = dyn_data_size;
++
+       void *dyns = malloc (dyn_filesz);
+       Elf32_Dyn (*d32)[dyn_filesz / sizeof (Elf32_Dyn)] = dyns;
+       Elf64_Dyn (*d64)[dyn_filesz / sizeof (Elf64_Dyn)] = dyns;
+Index: elfutils-0.175/libdwfl/ChangeLog
+===================================================================
+--- elfutils-0.175.orig/libdwfl/ChangeLog
++++ elfutils-0.175/libdwfl/ChangeLog
+@@ -1,3 +1,8 @@
++2019-01-20  Mark Wielaard  <mark@klomp.org>
++
++       * dwfl_segment_report_module.c (dwfl_segment_report_module): Check
++       dyn_filesz vs dyn_data_size after read_portion call.
++
+ 2018-10-20  Mark Wielaard  <mark@klomp.org>
+ 
+ 	* libdwflP.h (__libdw_open_elf): New internal function declaration.
-- 
2.7.4


