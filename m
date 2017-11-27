Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5A03577E44
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:14 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id z3so7595822plh.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RsBY0n4ZGTLivL6vDdarmc2gw1BoQKYLbLDN1l57g3w=;
	b=G61nvJIHG5SquSx+10IiEiernXz/T6tf1zjmXAxkcJQXCliXJy/lczkWtaJoFAaicK
	lsGYWdrN5eK1V6+0kwDlePnGSANRO+hNRErvXx7pkVlnmxxjPXWKSbFsP/wvJ9sefgLG
	yc8b9OpvJ+gOBRHX9GtfKQAwogBVfHWcnE4KrpbUHJF9oRxPpm88OUaOppGtIrdyqv+Q
	1/gT0yu+at4uiDfIMFYc+zr6W/9PcTBZytzmzt73PGGOY57Rso82oTFk1u09RRimSurU
	o+KQbHEEuoI1qdJfDKskIot5NHvKkeHEV4GF3N2xqdC1bGywOF92vX66qdsXbsJ0S/4I
	8yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RsBY0n4ZGTLivL6vDdarmc2gw1BoQKYLbLDN1l57g3w=;
	b=YKeigExN9F8RwFt6XNloDCdaVJUv5xEMX/PVhN2E1s5xMVhhCR/WP7uVbCLFfGkbVh
	eqvdimvn0g3jkNydsma9pIFtMZoO9GGbGXQORrUWpKPxVGtNrApMMvPqBrDLcBAXpCBI
	g/wY+IwlptSVVxFMU0KeDO3McfuSaZTQNHO4IaOvOdKog0JmhYNs1k7I4DFeECYzYnLg
	xPc298spSGIRUFXqOfwYQCnOKlcu8t3micv/CVjg0iLsGX0sR1VNnBceuQzyoAXDoAJx
	qEvozpAywCyzy+oLCFgTcyUXWrTdfKgw3wgH/ui4+F4/e8AyxO7Nb+YgBndMjAmbKHvq
	aD3w==
X-Gm-Message-State: AJaThX5oLkQm9DA5E+4wq0yNDvmhLOt+OKXc7tFNgftEvLo5nyatyZdk
	dmPaIF/8TIQ7tM+lp5k/hYc=
X-Google-Smtp-Source: AGs4zMZscSK3SpJepFGEEeGmVCQVJHEtA7y4AAoUREigzQFzDip8EypRBebP5F7+S+3aWqwRx42KKA==
X-Received: by 10.84.130.33 with SMTP id 30mr37492807plc.161.1511750116454;
	Sun, 26 Nov 2017 18:35:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:49 -0800
Message-Id: <1511750112-2263-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 03/26] binutils: Security fix CVE-2017-8393
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:15 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   1 +
 .../binutils/binutils/CVE-2017-8393.patch          | 205 +++++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8393.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 6ae091c..53299fa 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -45,6 +45,7 @@ SRC_URI = "\
      file://CVE-2017-7210.patch \
      file://CVE-2017-7223.patch \
      file://CVE-2017-7614.patch \
+     file://CVE-2017-8393.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-8393.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-8393.patch
new file mode 100644
index 0000000..095cfc7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-8393.patch
@@ -0,0 +1,205 @@
+From bce964aa6c777d236fbd641f2bc7bb931cfe4bf3 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 23 Apr 2017 11:03:34 +0930
+Subject: [PATCH] PR 21412, get_reloc_section assumes .rel/.rela name for
+ SHT_REL/RELA.
+
+This patch fixes an assumption made by code that runs for objcopy and
+strip, that SHT_REL/SHR_RELA sections are always named starting with a
+.rel/.rela prefix.  I'm also modifying the interface for
+elf_backend_get_reloc_section, so any backend function just needs to
+handle name mapping.
+
+	PR 21412
+	* elf-bfd.h (struct elf_backend_data <get_reloc_section>): Change
+	parameters and comment.
+	(_bfd_elf_get_reloc_section): Delete.
+	(_bfd_elf_plt_get_reloc_section): Declare.
+	* elf.c (_bfd_elf_plt_get_reloc_section, elf_get_reloc_section):
+	New functions.  Don't blindly skip over assumed .rel/.rela prefix.
+	Extracted from..
+	(_bfd_elf_get_reloc_section): ..here.  Delete.
+	(assign_section_numbers): Call elf_get_reloc_section.
+	* elf64-ppc.c (elf_backend_get_reloc_section): Define.
+	* elfxx-target.h (elf_backend_get_reloc_section): Update.
+
+Upstream-Status: Backort
+CVE: CVE-2017-8393
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog      | 15 ++++++++++++++
+ bfd/elf-bfd.h      |  8 ++++---
+ bfd/elf.c          | 61 +++++++++++++++++++++++++++++++-----------------------
+ bfd/elf64-ppc.c    |  1 +
+ bfd/elfxx-target.h |  2 +-
+ 5 files changed, 57 insertions(+), 30 deletions(-)
+
+Index: git/bfd/elf-bfd.h
+===================================================================
+--- git.orig/bfd/elf-bfd.h
++++ git/bfd/elf-bfd.h
+@@ -1322,8 +1322,10 @@ struct elf_backend_data
+   bfd_size_type (*maybe_function_sym) (const asymbol *sym, asection *sec,
+ 				       bfd_vma *code_off);
+ 
+-  /* Return the section which RELOC_SEC applies to.  */
+-  asection *(*get_reloc_section) (asection *reloc_sec);
++  /* Given NAME, the name of a relocation section stripped of its
++     .rel/.rela prefix, return the section in ABFD to which the
++     relocations apply.  */
++  asection *(*get_reloc_section) (bfd *abfd, const char *name);
+ 
+   /* Called to set the sh_flags, sh_link and sh_info fields of OSECTION which
+      has a type >= SHT_LOOS.  Returns TRUE if the fields were initialised,
+@@ -2392,7 +2394,7 @@ extern bfd_boolean _bfd_elf_is_function_
+ extern bfd_size_type _bfd_elf_maybe_function_sym (const asymbol *, asection *,
+ 						  bfd_vma *);
+ 
+-extern asection *_bfd_elf_get_reloc_section (asection *);
++extern asection *_bfd_elf_plt_get_reloc_section (bfd *, const char *);
+ 
+ extern int bfd_elf_get_default_section_type (flagword);
+ 
+Index: git/bfd/elf.c
+===================================================================
+--- git.orig/bfd/elf.c
++++ git/bfd/elf.c
+@@ -3532,17 +3532,39 @@ bfd_elf_set_group_contents (bfd *abfd, a
+   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
+ }
+ 
+-/* Return the section which RELOC_SEC applies to.  */
++/* Given NAME, the name of a relocation section stripped of its
++   .rel/.rela prefix, return the section in ABFD to which the
++   relocations apply.  */
+ 
+ asection *
+-_bfd_elf_get_reloc_section (asection *reloc_sec)
++_bfd_elf_plt_get_reloc_section (bfd *abfd, const char *name)
++{
++  /* If a target needs .got.plt section, relocations in rela.plt/rel.plt
++     section likely apply to .got.plt or .got section.  */
++  if (get_elf_backend_data (abfd)->want_got_plt
++      && strcmp (name, ".plt") == 0)
++    {
++      asection *sec;
++
++      name = ".got.plt";
++      sec = bfd_get_section_by_name (abfd, name);
++      if (sec != NULL)
++	return sec;
++      name = ".got";
++    }
++
++  return bfd_get_section_by_name (abfd, name);
++}
++
++/* Return the section to which RELOC_SEC applies.  */
++
++static asection *
++elf_get_reloc_section (asection *reloc_sec)
+ {
+   const char *name;
+   unsigned int type;
+   bfd *abfd;
+-
+-  if (reloc_sec == NULL)
+-    return NULL;
++  const struct elf_backend_data *bed;
+ 
+   type = elf_section_data (reloc_sec)->this_hdr.sh_type;
+   if (type != SHT_REL && type != SHT_RELA)
+@@ -3550,28 +3572,15 @@ _bfd_elf_get_reloc_section (asection *re
+ 
+   /* We look up the section the relocs apply to by name.  */
+   name = reloc_sec->name;
+-  if (type == SHT_REL)
+-    name += 4;
+-  else
+-    name += 5;
++  if (strncmp (name, ".rel", 4) != 0)
++    return NULL;
++  name += 4;
++  if (type == SHT_RELA && *name++ != 'a')
++    return NULL;
+ 
+-  /* If a target needs .got.plt section, relocations in rela.plt/rel.plt
+-     section apply to .got.plt section.  */
+   abfd = reloc_sec->owner;
+-  if (get_elf_backend_data (abfd)->want_got_plt
+-      && strcmp (name, ".plt") == 0)
+-    {
+-      /* .got.plt is a linker created input section.  It may be mapped
+-	 to some other output section.  Try two likely sections.  */
+-      name = ".got.plt";
+-      reloc_sec = bfd_get_section_by_name (abfd, name);
+-      if (reloc_sec != NULL)
+-	return reloc_sec;
+-      name = ".got";
+-    }
+-
+-  reloc_sec = bfd_get_section_by_name (abfd, name);
+-  return reloc_sec;
++  bed = get_elf_backend_data (abfd);
++  return bed->get_reloc_section (abfd, name);
+ }
+ 
+ /* Assign all ELF section numbers.  The dummy first section is handled here
+@@ -3833,7 +3842,7 @@ assign_section_numbers (bfd *abfd, struc
+ 	  if (s != NULL)
+ 	    d->this_hdr.sh_link = elf_section_data (s)->this_idx;
+ 
+-	  s = get_elf_backend_data (abfd)->get_reloc_section (sec);
++	  s = elf_get_reloc_section (sec);
+ 	  if (s != NULL)
+ 	    {
+ 	      d->this_hdr.sh_info = elf_section_data (s)->this_idx;
+Index: git/bfd/elf64-ppc.c
+===================================================================
+--- git.orig/bfd/elf64-ppc.c
++++ git/bfd/elf64-ppc.c
+@@ -121,6 +121,7 @@ static bfd_vma opd_entry_value
+ #define elf_backend_special_sections	      ppc64_elf_special_sections
+ #define elf_backend_merge_symbol_attribute    ppc64_elf_merge_symbol_attribute
+ #define elf_backend_merge_symbol	      ppc64_elf_merge_symbol
++#define elf_backend_get_reloc_section	      bfd_get_section_by_name
+ 
+ /* The name of the dynamic interpreter.  This is put in the .interp
+    section.  */
+Index: git/bfd/elfxx-target.h
+===================================================================
+--- git.orig/bfd/elfxx-target.h
++++ git/bfd/elfxx-target.h
+@@ -706,7 +706,7 @@
+ #endif
+ 
+ #ifndef elf_backend_get_reloc_section
+-#define elf_backend_get_reloc_section _bfd_elf_get_reloc_section
++#define elf_backend_get_reloc_section _bfd_elf_plt_get_reloc_section
+ #endif
+ 
+ #ifndef elf_backend_copy_special_section_fields
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,18 @@
++2017-04-23  Alan Modra  <amodra@gmail.com>
++ 
++       PR 21412
++       * elf-bfd.h (struct elf_backend_data <get_reloc_section>): Change
++       parameters and comment.
++       (_bfd_elf_get_reloc_section): Delete.
++       (_bfd_elf_plt_get_reloc_section): Declare.
++       * elf.c (_bfd_elf_plt_get_reloc_section, elf_get_reloc_section):
++       New functions.  Don't blindly skip over assumed .rel/.rela prefix.
++       Extracted from..
++       (_bfd_elf_get_reloc_section): ..here.  Delete.
++       (assign_section_numbers): Call elf_get_reloc_section.
++       * elf64-ppc.c (elf_backend_get_reloc_section): Define.
++       * elfxx-target.h (elf_backend_get_reloc_section): Update.
++
+ 2017-04-04  Nick Clifton  <nickc@redhat.com>
+ 
+        PR binutils/21342
-- 
2.7.4


