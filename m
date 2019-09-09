Return-Path: <msft.dantran@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 944BB7F37C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 17:31:31 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id k10so17150930qth.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2019 10:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9dAqeGgBgFKgayXvsZh+pRd2Revos7jPQAvXpETgf2k=;
	b=DFR/XiPo8OLhDr9E17dttkKPx3xT9BF8rHJdLXtOH7yaXnQs6VKsk2DMqkrAzVmuv/
	bcjiSDm/PD+vQLYxt8xzLtqkbI2uwJsTFZOmpkE7xT2PorqsyyBmLAzHz++vtkJGGnv7
	mixavzVxK0NQlox2ixrdgz8AUIR4E5P8HCTqOYKtD3M2YVLa3U3f2J2Jh7J3YridwOxt
	0Pi+2BHQBcHBcZFhJED69pMvpwgJRBztaC9mqH/512vRQxZsj/tu42HyH9FGar6L8T23
	9fCpU0qXlJnlf4Jf4JJ11IIstaCaT8js4Jcqxt+zuU6Z/TrgCcIv3HOZwV2U2UMRXuPf
	amhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9dAqeGgBgFKgayXvsZh+pRd2Revos7jPQAvXpETgf2k=;
	b=Mt8dVY7FU96/tIcoXUt+O7Z5CAeiqg2xFI5CjWouWK3M5o42/lxGUHd3DeNKIpuaJy
	RgwJjnL+1PSVTULeZOx6jGzfv2NF5DAa+0XN1xnxq/+OivurwiozTygvW3ccQXZUFz3c
	8JiG5CxavbJw3K9YhaJ0XPMOBbNRmFhbVgWgzSaXNHRnvnBzfezZVzitk9YCczLIm646
	XetqYz35CtKKavtaKKKtj9f1Z+4VjEGSnQDFeBK/dh2m6TSfuy6e+QO8Nhk89eduji9k
	CodzUbsoJEcUshcFta+xFQ6oaVfo64WwdNnua7PyJHW8sRZuQw497ZTNRHK6nYk1/mzC
	JYWQ==
X-Gm-Message-State: APjAAAW4hJyUS7T6L5nxhl4wJ4vz7mdYQaj0YAazyzwR17Z9imZpMdFe
	yvjFQsQS6hSlMKMRen4DqDkHqThK
X-Google-Smtp-Source: APXvYqwEA3la/nhF0+zvFsDeVXK6Ul7XRCSOdr+AWnaWZrcTAXmTDTnIEbFHXN5yrvYW3mbiCWFqYg==
X-Received: by 2002:a0c:ef05:: with SMTP id t5mr15510626qvr.131.1568050292068; 
	Mon, 09 Sep 2019 10:31:32 -0700 (PDT)
Received: from
	dantran-yocto.nbqgwzabenwu5ordtxtxpzrzah.cx.internal.cloudapp.net
	([52.184.230.242]) by smtp.gmail.com with ESMTPSA id
	a36sm8300085qtk.21.2019.09.09.10.31.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Sep 2019 10:31:31 -0700 (PDT)
From: msft.dantran@gmail.com
X-Google-Original-From: dantran@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2019 17:31:25 +0000
Message-Id: <1568050285-7932-1-git-send-email-dantran@microsoft.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud] binutils: Fix 4 CVEs
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
X-List-Received-Date: Mon, 09 Sep 2019 17:31:31 -0000

From: Dan Tran <dantran@microsoft.com>

Fixes CVE-2018-20623, CVE-2018-20651, CVE-2018-20-671, and
CVE-2018-1000876 for binutils 2.31.1.

Signed-off-by: Dan Tran <dantran@microsoft.com>
---
 meta/recipes-devtools/binutils/binutils-2.31.inc   |   4 +
 .../binutils/binutils/CVE-2018-1000876.patch       | 180 +++++++++++++++++++++
 .../binutils/binutils/CVE-2018-20623.patch         |  74 +++++++++
 .../binutils/binutils/CVE-2018-20651.patch         |  35 ++++
 .../binutils/binutils/CVE-2018-20671.patch         |  49 ++++++
 5 files changed, 342 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-1000876.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-20623.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-20651.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-20671.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 62acec5..ba9272a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -46,6 +46,10 @@ SRC_URI = "\
      file://CVE-2018-18605.patch \
      file://CVE-2018-18606.patch \
      file://CVE-2018-18607.patch \
+     file://CVE-2018-20623.patch \
+     file://CVE-2018-20651.patch \
+     file://CVE-2018-20671.patch \
+     file://CVE-2018-1000876.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-1000876.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-1000876.patch
new file mode 100644
index 0000000..ff85351
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-1000876.patch
@@ -0,0 +1,180 @@
+From efec0844fcfb5692f5a78f4082994d63e420ecd9 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 16 Dec 2018 23:02:50 +1030
+Subject: [PATCH] PR23994, libbfd integer overflow
+
+	PR 23994
+	* aoutx.h: Include limits.h.
+	(get_reloc_upper_bound): Detect long overflow and return a file
+	too big error if it occurs.
+	* elf.c: Include limits.h.
+	(_bfd_elf_get_symtab_upper_bound): Detect long overflow and return
+	a file too big error if it occurs.
+	(_bfd_elf_get_dynamic_symtab_upper_bound): Likewise.
+	(_bfd_elf_get_dynamic_reloc_upper_bound): Likewise.
+
+CVE: CVE-2018-1000876
+Upstream-Status: Backport
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=3a551c7a1b80fca579461774860574eabfd7f18f]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ bfd/aoutx.h | 40 +++++++++++++++++++++-------------------
+ bfd/elf.c   | 32 ++++++++++++++++++++++++--------
+ 2 files changed, 45 insertions(+), 27 deletions(-)
+
+diff --git a/bfd/aoutx.h b/bfd/aoutx.h
+index 023843b0be..78eaa9c503 100644
+--- a/bfd/aoutx.h
++++ b/bfd/aoutx.h
+@@ -117,6 +117,7 @@ DESCRIPTION
+ #define KEEPIT udata.i
+ 
+ #include "sysdep.h"
++#include <limits.h>
+ #include "bfd.h"
+ #include "safe-ctype.h"
+ #include "bfdlink.h"
+@@ -2491,6 +2492,8 @@ NAME (aout, canonicalize_reloc) (bfd *abfd,
+ long
+ NAME (aout, get_reloc_upper_bound) (bfd *abfd, sec_ptr asect)
+ {
++  bfd_size_type count;
++
+   if (bfd_get_format (abfd) != bfd_object)
+     {
+       bfd_set_error (bfd_error_invalid_operation);
+@@ -2498,26 +2501,25 @@ NAME (aout, get_reloc_upper_bound) (bfd *abfd, sec_ptr asect)
+     }
+ 
+   if (asect->flags & SEC_CONSTRUCTOR)
+-    return sizeof (arelent *) * (asect->reloc_count + 1);
+-
+-  if (asect == obj_datasec (abfd))
+-    return sizeof (arelent *)
+-      * ((exec_hdr (abfd)->a_drsize / obj_reloc_entry_size (abfd))
+-	 + 1);
+-
+-  if (asect == obj_textsec (abfd))
+-    return sizeof (arelent *)
+-      * ((exec_hdr (abfd)->a_trsize / obj_reloc_entry_size (abfd))
+-	 + 1);
+-
+-  if (asect == obj_bsssec (abfd))
+-    return sizeof (arelent *);
+-
+-  if (asect == obj_bsssec (abfd))
+-    return 0;
++    count = asect->reloc_count;
++  else if (asect == obj_datasec (abfd))
++    count = exec_hdr (abfd)->a_drsize / obj_reloc_entry_size (abfd);
++  else if (asect == obj_textsec (abfd))
++    count = exec_hdr (abfd)->a_trsize / obj_reloc_entry_size (abfd);
++  else if (asect == obj_bsssec (abfd))
++    count = 0;
++  else
++    {
++      bfd_set_error (bfd_error_invalid_operation);
++      return -1;
++    }
+ 
+-  bfd_set_error (bfd_error_invalid_operation);
+-  return -1;
++  if (count >= LONG_MAX / sizeof (arelent *))
++    {
++      bfd_set_error (bfd_error_file_too_big);
++      return -1;
++    }
++  return (count + 1) * sizeof (arelent *);
+ }
+ 
+ long
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 828241d48a..10037176a3 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -35,6 +35,7 @@ SECTION
+ /* For sparc64-cross-sparc32.  */
+ #define _SYSCALL32
+ #include "sysdep.h"
++#include <limits.h>
+ #include "bfd.h"
+ #include "bfdlink.h"
+ #include "libbfd.h"
+@@ -8114,11 +8115,16 @@ error_return:
+ long
+ _bfd_elf_get_symtab_upper_bound (bfd *abfd)
+ {
+-  long symcount;
++  bfd_size_type symcount;
+   long symtab_size;
+   Elf_Internal_Shdr *hdr = &elf_tdata (abfd)->symtab_hdr;
+ 
+   symcount = hdr->sh_size / get_elf_backend_data (abfd)->s->sizeof_sym;
++  if (symcount >= LONG_MAX / sizeof (asymbol *))
++    {
++      bfd_set_error (bfd_error_file_too_big);
++      return -1;
++    }
+   symtab_size = (symcount + 1) * (sizeof (asymbol *));
+   if (symcount > 0)
+     symtab_size -= sizeof (asymbol *);
+@@ -8129,7 +8135,7 @@ _bfd_elf_get_symtab_upper_bound (bfd *abfd)
+ long
+ _bfd_elf_get_dynamic_symtab_upper_bound (bfd *abfd)
+ {
+-  long symcount;
++  bfd_size_type symcount;
+   long symtab_size;
+   Elf_Internal_Shdr *hdr = &elf_tdata (abfd)->dynsymtab_hdr;
+ 
+@@ -8140,6 +8146,11 @@ _bfd_elf_get_dynamic_symtab_upper_bound (bfd *abfd)
+     }
+ 
+   symcount = hdr->sh_size / get_elf_backend_data (abfd)->s->sizeof_sym;
++  if (symcount >= LONG_MAX / sizeof (asymbol *))
++    {
++      bfd_set_error (bfd_error_file_too_big);
++      return -1;
++    }
+   symtab_size = (symcount + 1) * (sizeof (asymbol *));
+   if (symcount > 0)
+     symtab_size -= sizeof (asymbol *);
+@@ -8209,7 +8220,7 @@ _bfd_elf_canonicalize_dynamic_symtab (bfd *abfd,
+ long
+ _bfd_elf_get_dynamic_reloc_upper_bound (bfd *abfd)
+ {
+-  long ret;
++  bfd_size_type count;
+   asection *s;
+ 
+   if (elf_dynsymtab (abfd) == 0)
+@@ -8218,15 +8229,20 @@ _bfd_elf_get_dynamic_reloc_upper_bound (bfd *abfd)
+       return -1;
+     }
+ 
+-  ret = sizeof (arelent *);
++  count = 1;
+   for (s = abfd->sections; s != NULL; s = s->next)
+     if (elf_section_data (s)->this_hdr.sh_link == elf_dynsymtab (abfd)
+ 	&& (elf_section_data (s)->this_hdr.sh_type == SHT_REL
+ 	    || elf_section_data (s)->this_hdr.sh_type == SHT_RELA))
+-      ret += ((s->size / elf_section_data (s)->this_hdr.sh_entsize)
+-	      * sizeof (arelent *));
+-
+-  return ret;
++      {
++	count += s->size / elf_section_data (s)->this_hdr.sh_entsize;
++	if (count > LONG_MAX / sizeof (arelent *))
++	  {
++	    bfd_set_error (bfd_error_file_too_big);
++	    return -1;
++	  }
++      }
++  return count * sizeof (arelent *);
+ }
+ 
+ /* Canonicalize the dynamic relocation entries.  Note that we return the
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-20623.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-20623.patch
new file mode 100644
index 0000000..b44d448
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-20623.patch
@@ -0,0 +1,74 @@
+From 90cce28d4b59f86366d4f562d01a8d439d514234 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 9 Jan 2019 12:25:16 +0000
+Subject: [PATCH] Fix a heap use after free memory access fault when displaying
+ error messages about malformed archives.
+
+	PR 14049
+	* readelf.c (process_archive): Use arch.file_name in error
+	messages until the qualified name is available.
+
+CVE: CVE-2018-20623
+Upstream-Status: Backport
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=28e817cc440bce73691c03e01860089a0954a837]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ binutils/readelf.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index f4df697a7d..280023d8de 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -19061,7 +19061,7 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
+       /* Read the next archive header.  */
+       if (fseek (filedata->handle, arch.next_arhdr_offset, SEEK_SET) != 0)
+         {
+-          error (_("%s: failed to seek to next archive header\n"), filedata->file_name);
++          error (_("%s: failed to seek to next archive header\n"), arch.file_name);
+           return FALSE;
+         }
+       got = fread (&arch.arhdr, 1, sizeof arch.arhdr, filedata->handle);
+@@ -19069,7 +19069,10 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
+         {
+           if (got == 0)
+ 	    break;
+-          error (_("%s: failed to read archive header\n"), filedata->file_name);
++	  /* PR 24049 - we cannot use filedata->file_name as this will
++	     have already been freed.  */
++	  error (_("%s: failed to read archive header\n"), arch.file_name);
++	    
+           ret = FALSE;
+           break;
+         }
+@@ -19089,7 +19092,7 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
+       name = get_archive_member_name (&arch, &nested_arch);
+       if (name == NULL)
+ 	{
+-	  error (_("%s: bad archive file name\n"), filedata->file_name);
++	  error (_("%s: bad archive file name\n"), arch.file_name);
+ 	  ret = FALSE;
+ 	  break;
+ 	}
+@@ -19098,7 +19101,7 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
+       qualified_name = make_qualified_name (&arch, &nested_arch, name);
+       if (qualified_name == NULL)
+ 	{
+-	  error (_("%s: bad archive file name\n"), filedata->file_name);
++	  error (_("%s: bad archive file name\n"), arch.file_name);
+ 	  ret = FALSE;
+ 	  break;
+ 	}
+@@ -19144,7 +19147,7 @@ process_archive (Filedata * filedata, bfd_boolean is_thin_archive)
+ 	  if (nested_arch.file == NULL)
+ 	    {
+ 	      error (_("%s: contains corrupt thin archive: %s\n"),
+-		     filedata->file_name, name);
++		     qualified_name, name);
+ 	      ret = FALSE;
+ 	      break;
+ 	    }
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-20651.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-20651.patch
new file mode 100644
index 0000000..24fb031
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-20651.patch
@@ -0,0 +1,35 @@
+From 6a29d95602b09bb83d2c82b45ed935157fb780aa Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 31 Dec 2018 15:40:08 +1030
+Subject: [PATCH] PR24041, Invalid Memory Address Dereference in
+ elf_link_add_object_symbols
+
+	PR 24041
+	* elflink.c (elf_link_add_object_symbols): Don't segfault on
+	crafted ET_DYN with no program headers.
+
+CVE: CVE-2018-20651
+Upstream-Status: Backport
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=54025d5812ff100f5f0654eb7e1ffd50f2e37f5f]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ bfd/elflink.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index 46091b6341..557c550082 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -4178,7 +4178,7 @@ error_free_dyn:
+ 	 all sections contained fully therein.  This makes relro
+ 	 shared library sections appear as they will at run-time.  */
+       phdr = elf_tdata (abfd)->phdr + elf_elfheader (abfd)->e_phnum;
+-      while (--phdr >= elf_tdata (abfd)->phdr)
++      while (phdr-- > elf_tdata (abfd)->phdr)
+ 	if (phdr->p_type == PT_GNU_RELRO)
+ 	  {
+ 	    for (s = abfd->sections; s != NULL; s = s->next)
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-20671.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-20671.patch
new file mode 100644
index 0000000..9bd9207
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-20671.patch
@@ -0,0 +1,49 @@
+From 8a5f4f2ebe7f35ac5646060fa51e3332f6ef388c Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 4 Jan 2019 13:44:34 +0000
+Subject: [PATCH] Fix a possible integer overflow problem when examining
+ corrupt binaries using a 32-bit binutil.
+
+	PR 24005
+	* objdump.c (load_specific_debug_section): Check for integer
+	overflow before attempting to allocate contents.
+
+CVE: CVE-2018-20671
+Upstream-Status: Backport
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=11fa9f134fd658075c6f74499c780df045d9e9ca]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ binutils/objdump.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/objdump.c b/binutils/objdump.c
+index f468fcdb59..89ca688938 100644
+--- a/binutils/objdump.c
++++ b/binutils/objdump.c
+@@ -2503,12 +2503,19 @@ load_specific_debug_section (enum dwarf_section_display_enum debug,
+   section->reloc_info = NULL;
+   section->num_relocs = 0;
+   section->address = bfd_get_section_vma (abfd, sec);
++  section->user_data = sec;
+   section->size = bfd_get_section_size (sec);
+   amt = section->size + 1;
++  if (amt == 0 || amt > bfd_get_file_size (abfd))
++    {
++      section->start = NULL;
++      free_debug_section (debug);
++      printf (_("\nSection '%s' has an invalid size: %#llx.\n"),
++	      section->name, (unsigned long long) section->size);
++      return FALSE;
++    }
+   section->start = contents = malloc (amt);
+-  section->user_data = sec;
+-  if (amt == 0
+-      || section->start == NULL
++  if (section->start == NULL
+       || !bfd_get_full_section_contents (abfd, sec, &contents))
+     {
+       free_debug_section (debug);
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
-- 
2.7.4


