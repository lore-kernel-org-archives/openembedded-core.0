Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7218978ECD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:49 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id g6-v6so1191060plq.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YVLf3EfIsDf+o8M+tktahYoCyHM/vH5zSiLqPbYbbM0=;
	b=aRTcYHBygC4YAdGL20J0lGZwI4xNHxjSJeUNl6GTJgwmNhjOysaGOa6pGhtkg5Yb3W
	jaXMQITgcD3vmW3RfRaowc9mceFp7woHKXcxJgZGVSVbPgoTkITtE3NrlhhjcG74vluY
	Ow/xsAl4RulfmWAJNZ6/l+4e+YlPIr7CNpj4hHaReNFakXm7Ttam8dyBVEb8vk7ODKjj
	49hZxZQLGuOSZZ+em7i3ey8QgCSWdyC+bWTHKQSgSS14HBRwK1iM8maAXtRnExy5flLD
	timg/K8yJGhlbdfew1TuAQMMAE/2cRTa40nqdnX5BrbOCnc3gEIv+DrcwucTRedQdXMk
	ELgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YVLf3EfIsDf+o8M+tktahYoCyHM/vH5zSiLqPbYbbM0=;
	b=uFLZCIKtr3PfzpC+i73WJ/1/ZzHbQ+ihRlzykzRHhdmNxkA/eEZDKmyg5G/5mRJ+Fd
	Oieo1DrlmHiJgzlU0QEa4eIYDlUfu1lDB27BwlmrT4hCn6MVYew8x/BS4P8bBlKnE8Q8
	IdmMZ6kijKnE4iJHPsyCcYdjxO63lftcj6B/xxbR5FQ31E66xEvnMbtGvTfhPWPXcmZS
	qCUzkLU+GvtKBOfcFoGup/pwPDX2Y6/mN7QDvwdksQLpkYI2DzOf3FPRhEjxceiwPKL1
	YGacw+8PdSWzd6ds0HhTibjw3sgaXe/tp8noFiRxbxvr8EKFnZh/eaeV3Dka4iJvIek9
	eb1A==
X-Gm-Message-State: AOUpUlEXxqpaKoZIw6yzRqEkV1I1HoQjtDKd/M5fR0PRtx6Ia2/q6IXu
	LzvFD4o1ziK+ki+DchqPIGyttd7x
X-Google-Smtp-Source: AA+uWPxW9AggFC8ixR9cfummkU5ceitllLl8rKM8jAQkrs5c7PMKrs9kLb5bPKqQesAK9PigGeoTow==
X-Received: by 2002:a17:902:8e81:: with SMTP id
	bg1-v6mr3046312plb.129.1533742550652; 
	Wed, 08 Aug 2018 08:35:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:22 -0700
Message-Id: <1533742522-24357-27-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 27/27] binutls: Security fix for CVE-2017-17125
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:49 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |   1 +
 .../binutils/binutils/CVE-2017-17125.patch         | 129 +++++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-17125.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 577bbf0..c4d40ea 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -63,6 +63,7 @@ SRC_URI = "\
      file://CVE-2017-17080.patch \
      file://CVE-2017-17121.patch \
      file://CVE-2017-17122.patch \
+     file://CVE-2017-17125.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-17125.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-17125.patch
new file mode 100644
index 0000000..30dc6d5
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-17125.patch
@@ -0,0 +1,129 @@
+From 160b1a618ad94988410dc81fce9189fcda5b7ff4 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 18 Nov 2017 23:18:22 +1030
+Subject: [PATCH] PR22443, Global buffer overflow in
+ _bfd_elf_get_symbol_version_string
+
+Symbols like *ABS* defined in bfd/section.c:global_syms are not
+elf_symbol_type.  They can appear on relocs and perhaps other places
+in an ELF bfd, so a number of places in nm.c and objdump.c are wrong
+to cast an asymbol based on the bfd being ELF.  I think we lose
+nothing by excluding all section symbols, not just the global_syms.
+
+	PR 22443
+	* nm.c (sort_symbols_by_size): Don't attempt to access
+	section symbol internal_elf_sym.
+	(print_symbol): Likewise.  Don't call bfd_get_symbol_version_string
+	for section symbols.
+	* objdump.c (compare_symbols): Don't attempt to access
+	section symbol internal_elf_sym.
+	(objdump_print_symname): Don't call bfd_get_symbol_version_string
+	for section symbols.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE:  CVE-2017-17125
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog | 12 ++++++++++++
+ binutils/nm.c      | 17 ++++++++++-------
+ binutils/objdump.c |  6 +++---
+ 3 files changed, 25 insertions(+), 10 deletions(-)
+
+Index: git/binutils/nm.c
+===================================================================
+--- git.orig/binutils/nm.c
++++ git/binutils/nm.c
+@@ -765,7 +765,6 @@ sort_symbols_by_size (bfd *abfd, bfd_boo
+       asection *sec;
+       bfd_vma sz;
+       asymbol *temp;
+-      int synthetic = (sym->flags & BSF_SYNTHETIC);
+ 
+       if (from + size < fromend)
+ 	{
+@@ -782,10 +781,13 @@ sort_symbols_by_size (bfd *abfd, bfd_boo
+       sec = bfd_get_section (sym);
+ 
+       /* Synthetic symbols don't have a full type set of data available, thus
+-	 we can't rely on that information for the symbol size.  */
+-      if (!synthetic && bfd_get_flavour (abfd) == bfd_target_elf_flavour)
++	 we can't rely on that information for the symbol size.  Ditto for
++	 bfd/section.c:global_syms like *ABS*.  */
++      if ((sym->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0
++	  && bfd_get_flavour (abfd) == bfd_target_elf_flavour)
+ 	sz = ((elf_symbol_type *) sym)->internal_elf_sym.st_size;
+-      else if (!synthetic && bfd_is_com_section (sec))
++      else if ((sym->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0
++	       && bfd_is_com_section (sec))
+ 	sz = sym->value;
+       else
+ 	{
+@@ -874,8 +876,9 @@ print_symbol (bfd *        abfd,
+ 
+   info.sinfo = &syminfo;
+   info.ssize = ssize;
+-  /* Synthetic symbols do not have a full symbol type set of data available.  */
+-  if ((sym->flags & BSF_SYNTHETIC) != 0)
++  /* Synthetic symbols do not have a full symbol type set of data available.
++     Nor do bfd/section.c:global_syms like *ABS*.  */
++  if ((sym->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) != 0)
+     {
+       info.elfinfo = NULL;
+       info.coffinfo = NULL;
+@@ -893,7 +896,7 @@ print_symbol (bfd *        abfd,
+       const char *  version_string = NULL;
+       bfd_boolean   hidden = FALSE;
+ 
+-      if ((sym->flags & BSF_SYNTHETIC) == 0)
++      if ((sym->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0)
+ 	version_string = bfd_get_symbol_version_string (abfd, sym, &hidden);
+ 
+       if (bfd_is_und_section (bfd_get_section (sym)))
+Index: git/binutils/objdump.c
+===================================================================
+--- git.orig/binutils/objdump.c
++++ git/binutils/objdump.c
+@@ -799,10 +799,10 @@ compare_symbols (const void *ap, const v
+       bfd_vma asz, bsz;
+ 
+       asz = 0;
+-      if ((a->flags & BSF_SYNTHETIC) == 0)
++      if ((a->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0)
+ 	asz = ((elf_symbol_type *) a)->internal_elf_sym.st_size;
+       bsz = 0;
+-      if ((b->flags & BSF_SYNTHETIC) == 0)
++      if ((b->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0)
+ 	bsz = ((elf_symbol_type *) b)->internal_elf_sym.st_size;
+       if (asz != bsz)
+ 	return asz > bsz ? -1 : 1;
+@@ -888,7 +888,7 @@ objdump_print_symname (bfd *abfd, struct
+ 	name = alloc;
+     }
+ 
+-  if ((sym->flags & BSF_SYNTHETIC) == 0)
++  if ((sym->flags & (BSF_SECTION_SYM | BSF_SYNTHETIC)) == 0)
+     version_string = bfd_get_symbol_version_string (abfd, sym, &hidden);
+ 
+   if (bfd_is_und_section (bfd_get_section (sym)))
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,15 @@
++2017-11-18  Alan Modra  <amodra@gmail.com>
++
++       PR 22443
++       * nm.c (sort_symbols_by_size): Don't attempt to access
++       section symbol internal_elf_sym.
++       (print_symbol): Likewise.  Don't call bfd_get_symbol_version_string
++       for section symbols.
++       * objdump.c (compare_symbols): Don't attempt to access
++       section symbol internal_elf_sym.
++       (objdump_print_symname): Don't call bfd_get_symbol_version_string
++       for section symbols.
++
+ 2017-11-29  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22508
-- 
2.7.4


