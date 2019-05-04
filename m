Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id A4E257DD90
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:28:01 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d9so4162648pls.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Etn4QCDRacWisebdYwbQfpfzyaTHMibmxvj1MEq9rxI=;
	b=QzfUf1Xa8S3RdXLMQ3gN+NaLEo5hE3UndLPpxHClEgEVthyYALcIH3tybyRlonrrGP
	fdBo0na0hkDJ18wWcXXB7UPF/7JdY9GfR704vXSEMO8pRUNbbaz2wiIOr5GIixCmkeJH
	bZFaR3KkcdaiTkAAfLJeS2ohWE/kvG/gCru32PMcMVo3ykyB5iZ0QgcKrKzSd+qDENq8
	ZQsHUgSPoRd2YOSFkHZGHdBmFU0vzw6ye+CYe3kFHIRpFbhBxz0KiuU2wYXaEwVadGRJ
	OFma0kymd7OTr6UJflMzCCma/u5Oic33XfTmsWuo4/pF8f6rW5yHUDN3QcxfDaEQpuJQ
	Z9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Etn4QCDRacWisebdYwbQfpfzyaTHMibmxvj1MEq9rxI=;
	b=bKcAhyYANbUPTsfMnpCq33xz1hatLAOR22LaziwkR7Z5qBMx3B1xO3pysA8Do7Cyqa
	SoEdyFSwGVXaSJLFMW+jE/PxE3A4DVGCsRIqKKL7Ih3bwemaFJgaz0i+OU+CkIEb5aMP
	4CxH+ulMtDMcRPgDGHMyB1g2oezAkphnId8LfIaiaLSFQuaKt7zzc4kKoZ75pZl6fYss
	e6Xtp8+7U1Nmtct2Kd3SNTXnCbvQdQHSH55G6NZ6rYOktGGwim5j6mCtKxJOg6xQV68W
	olujaolOifhEa5D9wXIp0JN5BaXmeccA8Aep9uJTwlgPP6+fmFypi/MRadOaNclfAyDo
	RvZw==
X-Gm-Message-State: APjAAAVXiRwAT7kLWmWijPN4p5hFipmTWuSJhOYKShcCUg/N9GfTHXYl
	Ha2F0QO8uj+z7G17kKkohBlL1yox
X-Google-Smtp-Source: APXvYqwMG/iN4Wv5GjD/s2/Tq0FG873cQuBPw3vlZmyQncEJTi7o0tuOmwIFYFyaAPcYC+krXX2V6Q==
X-Received: by 2002:a17:902:b617:: with SMTP id
	b23mr18482058pls.73.1556983682757; 
	Sat, 04 May 2019 08:28:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.28.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:28:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:13 -0700
Message-Id: <5445c22361b55603f7bd2fabd2d36d280ebee51e.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 37/43] binutils: fix CVE-2019-9074 CVE-2019-9075 CVE-2019-9076 CVE-2019-9077
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
X-List-Received-Date: Sat, 04 May 2019 15:28:02 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.32.inc   |   4 +
 .../binutils/binutils/CVE-2019-9074.patch          |  68 ++++++++++++
 .../binutils/binutils/CVE-2019-9075.patch          | 119 +++++++++++++++++++++
 .../binutils/binutils/CVE-2019-9076.patch          |  49 +++++++++
 .../binutils/binutils/CVE-2019-9077.patch          |  37 +++++++
 5 files changed, 277 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 5d0c16b..49e6827 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -44,6 +44,10 @@ SRC_URI = "\
      file://0013-Detect-64-bit-MIPS-targets.patch \
      file://0014-sync-with-OE-libtool-changes.patch \
      file://0015-binutils-enable-x86_64-pep-for-producing-EFI-binarie.patch \
+     file://CVE-2019-9074.patch \
+     file://CVE-2019-9075.patch \
+     file://CVE-2019-9076.patch \
+     file://CVE-2019-9077.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
new file mode 100644
index 0000000..a11a512
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9074.patch
@@ -0,0 +1,68 @@
+From e2ebb3906432dcca2727186ad79415f920730fb2 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 19 Feb 2019 22:48:44 +1030
+Subject: [PATCH] PR24235, Read memory violation in pei-x86_64.c
+
+	PR 24235
+	* pei-x86_64.c (pex64_bfd_print_pdata_section): Correct checks
+	attempting to prevent read past end of section.
+
+Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/179f2db0d9c397d7dd8a59907b84208b79f7f48c]
+CVE: CVE-2019-9074
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ bfd/ChangeLog    | 6 ++++++
+ bfd/pei-x86_64.c | 9 ++++-----
+ 2 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index dd2c741..cbf30de 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2019-02-19  Alan Modra  <amodra@gmail.com>
++
++	PR 24235
++	* pei-x86_64.c (pex64_bfd_print_pdata_section): Correct checks
++	attempting to prevent read past end of section.
++
+ 2019-02-04  Nick Clifton  <nickc@redhat.com>
+ 
+ 	* development.sh (experimental) Set to false.
+diff --git a/bfd/pei-x86_64.c b/bfd/pei-x86_64.c
+index ff1093c..7e75104 100644
+--- a/bfd/pei-x86_64.c
++++ b/bfd/pei-x86_64.c
+@@ -541,7 +541,7 @@ pex64_bfd_print_pdata_section (bfd *abfd, void *vfile, asection *pdata_section)
+   /* virt_size might be zero for objects.  */
+   if (stop == 0 && strcmp (abfd->xvec->name, "pe-x86-64") == 0)
+     {
+-      stop = (datasize / onaline) * onaline;
++      stop = datasize;
+       virt_size_is_zero = TRUE;
+     }
+   else if (datasize < stop)
+@@ -551,8 +551,8 @@ pex64_bfd_print_pdata_section (bfd *abfd, void *vfile, asection *pdata_section)
+ 		 _("Warning: %s section size (%ld) is smaller than virtual size (%ld)\n"),
+ 		 pdata_section->name, (unsigned long) datasize,
+ 		 (unsigned long) stop);
+-	/* Be sure not to read passed datasize.  */
+-	stop = datasize / onaline;
++	/* Be sure not to read past datasize.  */
++	stop = datasize;
+       }
+ 
+   /* Display functions table.  */
+@@ -724,8 +724,7 @@ pex64_bfd_print_pdata_section (bfd *abfd, void *vfile, asection *pdata_section)
+ 	      altent += imagebase;
+ 
+ 	      if (altent >= pdata_vma
+-		  && (altent + PDATA_ROW_SIZE <= pdata_vma
+-		      + pei_section_data (abfd, pdata_section)->virt_size))
++		  && altent - pdata_vma + PDATA_ROW_SIZE <= stop)
+ 		{
+ 		  pex64_get_runtime_function
+ 		    (abfd, &arf, &pdata[altent - pdata_vma]);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
new file mode 100644
index 0000000..bcb1310
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9075.patch
@@ -0,0 +1,119 @@
+From 8abac8031ed369a2734b1cdb7df28a39a54b4b49 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 20 Feb 2019 08:21:24 +1030
+Subject: [PATCH] PR24236, Heap buffer overflow in
+ _bfd_archive_64_bit_slurp_armap
+
+	PR 24236
+	* archive64.c (_bfd_archive_64_bit_slurp_armap): Move code adding
+	sentinel NUL to string buffer nearer to loop where it is used.
+	Don't go past sentinel when scanning strings, and don't write
+	NUL again.
+	* archive.c (do_slurp_coff_armap): Simplify string handling to
+	archive64.c style.
+
+Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/8abac8031ed369a2734b1cdb7df28a39a54b4b49]
+CVE: CVE-2019-9075
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
+---
+ bfd/ChangeLog   | 10 ++++++++++
+ bfd/archive.c   | 17 +++++++----------
+ bfd/archive64.c | 10 +++++-----
+ 3 files changed, 22 insertions(+), 15 deletions(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index 72c87c7..e39bb12 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,13 @@
++2019-02-20  Alan Modra  <amodra@gmail.com>
++
++	PR 24236
++	* archive64.c (_bfd_archive_64_bit_slurp_armap): Move code adding
++	sentinel NUL to string buffer nearer to loop where it is used.
++	Don't go past sentinel when scanning strings, and don't write
++	NUL again.
++	* archive.c (do_slurp_coff_armap): Simplify string handling to
++	archive64.c style.
++
+ 2019-02-19  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 24235
+diff --git a/bfd/archive.c b/bfd/archive.c
+index d2d9b72..68a92a3 100644
+--- a/bfd/archive.c
++++ b/bfd/archive.c
+@@ -1012,6 +1012,7 @@ do_slurp_coff_armap (bfd *abfd)
+   int *raw_armap, *rawptr;
+   struct artdata *ardata = bfd_ardata (abfd);
+   char *stringbase;
++  char *stringend;
+   bfd_size_type stringsize;
+   bfd_size_type parsed_size;
+   carsym *carsyms;
+@@ -1071,22 +1072,18 @@ do_slurp_coff_armap (bfd *abfd)
+     }
+ 
+   /* OK, build the carsyms.  */
+-  for (i = 0; i < nsymz && stringsize > 0; i++)
++  stringend = stringbase + stringsize;
++  *stringend = 0;
++  for (i = 0; i < nsymz; i++)
+     {
+-      bfd_size_type len;
+-
+       rawptr = raw_armap + i;
+       carsyms->file_offset = swap ((bfd_byte *) rawptr);
+       carsyms->name = stringbase;
+-      /* PR 17512: file: 4a1d50c1.  */
+-      len = strnlen (stringbase, stringsize);
+-      if (len < stringsize)
+-	len ++;
+-      stringbase += len;
+-      stringsize -= len;
++      stringbase += strlen (stringbase);
++      if (stringbase != stringend)
++	++stringbase;
+       carsyms++;
+     }
+-  *stringbase = 0;
+ 
+   ardata->symdef_count = nsymz;
+   ardata->first_file_filepos = bfd_tell (abfd);
+diff --git a/bfd/archive64.c b/bfd/archive64.c
+index 312bf82..42f6ed9 100644
+--- a/bfd/archive64.c
++++ b/bfd/archive64.c
+@@ -100,8 +100,6 @@ _bfd_archive_64_bit_slurp_armap (bfd *abfd)
+     return FALSE;
+   carsyms = ardata->symdefs;
+   stringbase = ((char *) ardata->symdefs) + carsym_size;
+-  stringbase[stringsize] = 0;
+-  stringend = stringbase + stringsize;
+ 
+   raw_armap = (bfd_byte *) bfd_alloc (abfd, ptrsize);
+   if (raw_armap == NULL)
+@@ -115,15 +113,17 @@ _bfd_archive_64_bit_slurp_armap (bfd *abfd)
+       goto release_raw_armap;
+     }
+ 
++  stringend = stringbase + stringsize;
++  *stringend = 0;
+   for (i = 0; i < nsymz; i++)
+     {
+       carsyms->file_offset = bfd_getb64 (raw_armap + i * 8);
+       carsyms->name = stringbase;
+-      if (stringbase < stringend)
+-	stringbase += strlen (stringbase) + 1;
++      stringbase += strlen (stringbase);
++      if (stringbase != stringend)
++	++stringbase;
+       ++carsyms;
+     }
+-  *stringbase = '\0';
+ 
+   ardata->symdef_count = nsymz;
+   ardata->first_file_filepos = bfd_tell (abfd);
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
new file mode 100644
index 0000000..ec8cde2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9076.patch
@@ -0,0 +1,49 @@
+From 9f841c583880eb6d0194455c1583a766f853e628 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 20 Feb 2019 12:06:31 +1030
+Subject: [PATCH] PR24233, Out of memory
+
+	PR 24233
+	* objdump.c (dump_bfd_private_header): Print warning if
+	bfd_print_private_bfd_data returns false.
+
+Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/7d272a55caebfc26ab2e15d1e9439bac978b9bb7]
+CVE: CVE-2019-9076
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ binutils/ChangeLog | 6 ++++++
+ binutils/objdump.c | 4 +++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/binutils/ChangeLog b/binutils/ChangeLog
+index f837c37..d5dd7cb 100644
+--- a/binutils/ChangeLog
++++ b/binutils/ChangeLog
+@@ -1,3 +1,9 @@
++2019-02-20  Alan Modra  <amodra@gmail.com>
++
++	PR 24233
++	* objdump.c (dump_bfd_private_header): Print warning if
++	bfd_print_private_bfd_data returns false.
++
+ 2019-02-02  Nick Clifton  <nickc@redhat.com>
+ 
+ 	* configure: Regenerate.
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index 8725390..7d0c6a4 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -3178,7 +3178,9 @@ dump_bfd_header (bfd *abfd)
+ static void
+ dump_bfd_private_header (bfd *abfd)
+ {
+-  bfd_print_private_bfd_data (abfd, stdout);
++  if (!bfd_print_private_bfd_data (abfd, stdout))
++    non_fatal (_("warning: private headers incomplete: %s"),
++	       bfd_errmsg (bfd_get_error ()));
+ }
+ 
+ static void
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
new file mode 100644
index 0000000..11ecb71
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9077.patch
@@ -0,0 +1,37 @@
+From f7bbc8890de45df6eda0ddef5dd04f835f54eecf Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 20 Feb 2019 17:03:47 +0000
+Subject: [PATCH] Fix a illegal memory access fault when parsing a corrupt MIPS
+ option section using readelf.
+
+	PR 24243
+	* readelf.c (process_mips_specific): Check for an options section
+	that is too small to even contain a single option.
+
+Upstream-Status: Backport [https://github.com/bminor/binutils-gdb/commit/7fc0c668f2aceb8582d74db1ad2528e2bba8a921]
+CVE: CVE-2019-9077
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ binutils/readelf.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 9df3742..18ab806 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -16179,6 +16179,12 @@ process_mips_specific (Filedata * filedata)
+ 	  error (_("No MIPS_OPTIONS header found\n"));
+ 	  return FALSE;
+ 	}
++      /* PR 24243  */
++      if (sect->sh_size < sizeof (* eopt))
++	{
++	  error (_("The MIPS options section is too small.\n"));
++	  return FALSE;
++	}
+ 
+       eopt = (Elf_External_Options *) get_data (NULL, filedata, options_offset, 1,
+                                                 sect->sh_size, _("options"));
+-- 
+2.7.4
+
-- 
2.7.4


