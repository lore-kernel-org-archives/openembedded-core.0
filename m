Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 560AA78EBE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:47 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id w3-v6so1200994plq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pgoklpyAkRKTq8TGgzjiWiT4Ms0SeG/LlS5MUki7gs0=;
	b=qcVovA+nWr9oaPPmWB3N3QXCudnwcYFN6PH7If9v7r0Oe2W42GWQeghU35tc0CRsSq
	W1ilNyNBxQng8SmQXLeea2n6km6Bz5/fWhrZtFVEHjMIfN7n7/wUEWvQSH6cB1JPPe2J
	XTv+0o79YfddW9xc+RzUJSiLGhVpMv2E+y8Lf6nBN4AM3fwUVqf9tLc/24tDG4MxF3uE
	vZMzEdt4x7VSG6+TzbFwCkT0ChRoD7DCWhu9eisCgOoCpL2YeHy1mahdOfXG+oQt7H47
	wyeN5UfWpdK6ZoOHm0Umo0vY2EYepBqSx66rpcBo47+rR+I+wiKsRHmDYHFKOWg72HBb
	YXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pgoklpyAkRKTq8TGgzjiWiT4Ms0SeG/LlS5MUki7gs0=;
	b=acN77+1n5qsO85dgunV59modhLYr1sBO6aJpjePnBUFZgQieM0+iQJd8HWA2vof/fJ
	rAfhEsch3aR1P9xGwHRoUMY0MUtcRmpmYBFrMGt3IxxdXV3N+pevf1NPFGyOiPHkyvAm
	d62lzpVchOF1Dz8jzrH9DBGeXgrukcdoSugUBIePa+FY+jZ3E6c5eEvmfVwILrxiKY6s
	1tfhHxcSBopENOWI1c4rtsYIWQJBkdzqaWirYj9VYnvz7PP6+5VO6xT35WubVE4K6gej
	XM+RQfTRsqir+05AS0M8sPTeuefQSvu46NQcXm3YCjSwP+wIxk7g22FHNoxB7zXdDUzC
	5/PA==
X-Gm-Message-State: AOUpUlEZ5xiGe3P6fMe/z2jJknC5Uj6oSBCnSjsbumiQ0VsSTHNiThrW
	Fcr8G/A0Mm5vLGmlltJ5rF60ETl6
X-Google-Smtp-Source: AA+uWPwfQ1qLNNMivt4ivvBfZGM0DaSgvjCAqWImuxWvY8yRbcsndzyJ5kl3wD/yPnPA3rk8ReraLA==
X-Received: by 2002:a17:902:4d46:: with SMTP id
	o6-v6mr3109040plh.59.1533742548455; 
	Wed, 08 Aug 2018 08:35:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:35:20 -0700
Message-Id: <1533742522-24357-25-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 25/27] Binutils: Security fix for CVE-2017-17121
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:47 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |   1 +
 .../binutils/binutils/CVE-2017-17121.patch         | 366 +++++++++++++++++++++
 2 files changed, 367 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-17121.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 3617b20..c1d5740 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -61,6 +61,7 @@ SRC_URI = "\
      file://CVE-2017-16831.patch \
      file://CVE-2017-16832.patch \
      file://CVE-2017-17080.patch \
+     file://CVE-2017-17121.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-17121.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-17121.patch
new file mode 100644
index 0000000..4b675f7
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-17121.patch
@@ -0,0 +1,366 @@
+From b23dc97fe237a1d9e850d7cbeee066183a00630b Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 28 Nov 2017 13:20:31 +0000
+Subject: [PATCH] Fix a memory access violation when attempting to parse a
+ corrupt COFF binary with a relocation that points beyond the end of the
+ section to be relocated.
+
+	PR 22506
+	* reloc.c (reloc_offset_in_range): Rename to
+	bfd_reloc_offset_in_range and export.
+	(bfd_perform_relocation): Rename function invocation.
+	(bfd_install_relocation): Likewise.
+	(bfd_final_link_relocate): Likewise.
+	* bfd-in2.h: Regenerate.
+	* coff-arm.c (coff_arm_reloc): Use bfd_reloc_offset_in_range.
+	* coff-i386.c (coff_i386_reloc): Likewise.
+	* coff-i860.c (coff_i860_reloc): Likewise.
+	* coff-m68k.c (mk68kcoff_common_addend_special_fn): Likewise.
+	* coff-m88k.c (m88k_special_reloc): Likewise.
+	* coff-mips.c (mips_reflo_reloc): Likewise.
+	* coff-x86_64.c (coff_amd64_reloc): Likewise.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE: CVE-2017-17121
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog     | 17 +++++++++++++++
+ bfd/bfd-in2.h     |  6 +++++
+ bfd/coff-arm.c    | 65 ++++++++++++++++++++++++++++++-------------------------
+ bfd/coff-i386.c   |  5 +++++
+ bfd/coff-i860.c   |  5 +++++
+ bfd/coff-m68k.c   |  5 +++++
+ bfd/coff-m88k.c   |  9 +++++++-
+ bfd/coff-mips.c   |  6 +++++
+ bfd/coff-x86_64.c | 16 +++++---------
+ bfd/reloc.c       | 40 +++++++++++++++++++++++++++++-----
+ 10 files changed, 126 insertions(+), 48 deletions(-)
+
+Index: git/bfd/bfd-in2.h
+===================================================================
+--- git.orig/bfd/bfd-in2.h
++++ git/bfd/bfd-in2.h
+@@ -2661,6 +2661,12 @@ bfd_reloc_status_type bfd_check_overflow
+     unsigned int addrsize,
+     bfd_vma relocation);
+ 
++bfd_boolean bfd_reloc_offset_in_range
++   (reloc_howto_type *howto,
++    bfd *abfd,
++    asection *section,
++    bfd_size_type offset);
++
+ bfd_reloc_status_type bfd_perform_relocation
+    (bfd *abfd,
+     arelent *reloc_entry,
+Index: git/bfd/coff-arm.c
+===================================================================
+--- git.orig/bfd/coff-arm.c
++++ git/bfd/coff-arm.c
+@@ -109,41 +109,46 @@ coff_arm_reloc (bfd *abfd,
+   x = ((x & ~howto->dst_mask)					\
+        | (((x & howto->src_mask) + diff) & howto->dst_mask))
+ 
+-    if (diff != 0)
+-      {
+-	reloc_howto_type *howto = reloc_entry->howto;
+-	unsigned char *addr = (unsigned char *) data + reloc_entry->address;
++  if (diff != 0)
++    {
++      reloc_howto_type *howto = reloc_entry->howto;
++      unsigned char *addr = (unsigned char *) data + reloc_entry->address;
++
++      if (! bfd_reloc_offset_in_range (howto, abfd, input_section,
++				       reloc_entry->address
++				       * bfd_octets_per_byte (abfd)))
++	return bfd_reloc_outofrange;
++
++      switch (howto->size)
++	{
++	case 0:
++	  {
++	    char x = bfd_get_8 (abfd, addr);
++	    DOIT (x);
++	    bfd_put_8 (abfd, x, addr);
++	  }
++	  break;
+ 
+-	switch (howto->size)
++	case 1:
+ 	  {
+-	  case 0:
+-	    {
+-	      char x = bfd_get_8 (abfd, addr);
+-	      DOIT (x);
+-	      bfd_put_8 (abfd, x, addr);
+-	    }
+-	    break;
+-
+-	  case 1:
+-	    {
+-	      short x = bfd_get_16 (abfd, addr);
+-	      DOIT (x);
+-	      bfd_put_16 (abfd, (bfd_vma) x, addr);
+-	    }
+-	    break;
+-
+-	  case 2:
+-	    {
+-	      long x = bfd_get_32 (abfd, addr);
+-	      DOIT (x);
+-	      bfd_put_32 (abfd, (bfd_vma) x, addr);
+-	    }
+-	    break;
++	    short x = bfd_get_16 (abfd, addr);
++	    DOIT (x);
++	    bfd_put_16 (abfd, (bfd_vma) x, addr);
++	  }
++	  break;
+ 
+-	  default:
+-	    abort ();
++	case 2:
++	  {
++	    long x = bfd_get_32 (abfd, addr);
++	    DOIT (x);
++	    bfd_put_32 (abfd, (bfd_vma) x, addr);
+ 	  }
+-      }
++	  break;
++
++	default:
++	  abort ();
++	}
++    }
+ 
+   /* Now let bfd_perform_relocation finish everything up.  */
+   return bfd_reloc_continue;
+Index: git/bfd/coff-i386.c
+===================================================================
+--- git.orig/bfd/coff-i386.c
++++ git/bfd/coff-i386.c
+@@ -144,6 +144,11 @@ coff_i386_reloc (bfd *abfd,
+       reloc_howto_type *howto = reloc_entry->howto;
+       unsigned char *addr = (unsigned char *) data + reloc_entry->address;
+ 
++      if (! bfd_reloc_offset_in_range (howto, abfd, input_section,
++				       reloc_entry->address
++				       * bfd_octets_per_byte (abfd)))
++	return bfd_reloc_outofrange;
++
+       switch (howto->size)
+ 	{
+ 	case 0:
+Index: git/bfd/coff-i860.c
+===================================================================
+--- git.orig/bfd/coff-i860.c
++++ git/bfd/coff-i860.c
+@@ -95,6 +95,11 @@ coff_i860_reloc (bfd *abfd,
+ 	reloc_howto_type *howto = reloc_entry->howto;
+ 	unsigned char *addr = (unsigned char *) data + reloc_entry->address;
+ 
++	if (! bfd_reloc_offset_in_range (howto, abfd, input_section,
++					 reloc_entry->address
++					 * bfd_octets_per_byte (abfd)))
++	  return bfd_reloc_outofrange;
++
+ 	switch (howto->size)
+ 	  {
+ 	  case 0:
+Index: git/bfd/coff-m68k.c
+===================================================================
+--- git.orig/bfd/coff-m68k.c
++++ git/bfd/coff-m68k.c
+@@ -305,6 +305,11 @@ m68kcoff_common_addend_special_fn (bfd *
+       reloc_howto_type *howto = reloc_entry->howto;
+       unsigned char *addr = (unsigned char *) data + reloc_entry->address;
+ 
++      if (! bfd_reloc_offset_in_range (howto, abfd, input_section,
++				       reloc_entry->address
++				       * bfd_octets_per_byte (abfd)))
++	return bfd_reloc_outofrange;
++
+       switch (howto->size)
+ 	{
+ 	case 0:
+Index: git/bfd/coff-m88k.c
+===================================================================
+--- git.orig/bfd/coff-m88k.c
++++ git/bfd/coff-m88k.c
+@@ -72,10 +72,17 @@ m88k_special_reloc (bfd *abfd,
+ 	{
+ 	  bfd_vma output_base = 0;
+ 	  bfd_vma addr = reloc_entry->address;
+-	  bfd_vma x = bfd_get_16 (abfd, (bfd_byte *) data + addr);
++	  bfd_vma x;
+ 	  asection *reloc_target_output_section;
+ 	  long relocation = 0;
+ 
++	  if (! bfd_reloc_offset_in_range (howto, abfd, input_section,
++					   reloc_entry->address
++					   * bfd_octets_per_byte (abfd)))
++	    return bfd_reloc_outofrange;
++
++	  x = bfd_get_16 (abfd, (bfd_byte *) data + addr);
++
+ 	  /* Work out which section the relocation is targeted at and the
+ 	     initial relocation command value.  */
+ 
+Index: git/bfd/coff-mips.c
+===================================================================
+--- git.orig/bfd/coff-mips.c
++++ git/bfd/coff-mips.c
+@@ -504,6 +504,12 @@ mips_reflo_reloc (bfd *abfd ATTRIBUTE_UN
+ 	  unsigned long vallo;
+ 	  struct mips_hi *next;
+ 
++	  if (! bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++					   input_section,
++					   reloc_entry->address
++					   * bfd_octets_per_byte (abfd)))
++	    return bfd_reloc_outofrange;
++
+ 	  /* Do the REFHI relocation.  Note that we actually don't
+ 	     need to know anything about the REFLO itself, except
+ 	     where to find the low 16 bits of the addend needed by the
+Index: git/bfd/coff-x86_64.c
+===================================================================
+--- git.orig/bfd/coff-x86_64.c
++++ git/bfd/coff-x86_64.c
+@@ -143,16 +143,10 @@ coff_amd64_reloc (bfd *abfd,
+       reloc_howto_type *howto = reloc_entry->howto;
+       unsigned char *addr = (unsigned char *) data + reloc_entry->address;
+ 
+-      /* FIXME: We do not have an end address for data, so we cannot
+-	 accurately range check any addresses computed against it.
+-	 cf: PR binutils/17512: file: 1085-1761-0.004.
+-	 For now we do the best that we can.  */
+-      if (addr < (unsigned char *) data
+-	  || addr > ((unsigned char *) data) + input_section->size)
+-	{
+-	  bfd_set_error (bfd_error_bad_value);
+-	  return bfd_reloc_notsupported;
+-	}
++      if (! bfd_reloc_offset_in_range (howto, abfd, input_section,
++				       reloc_entry->address
++				       * bfd_octets_per_byte (abfd)))
++	return bfd_reloc_outofrange;
+ 
+       switch (howto->size)
+ 	{
+Index: git/bfd/reloc.c
+===================================================================
+--- git.orig/bfd/reloc.c
++++ git/bfd/reloc.c
+@@ -538,12 +538,31 @@ bfd_check_overflow (enum complain_overfl
+   return flag;
+ }
+ 
++/*
++FUNCTION
++	bfd_reloc_offset_in_range
++
++SYNOPSIS
++	bfd_boolean bfd_reloc_offset_in_range
++          (reloc_howto_type *howto,
++           bfd *abfd,
++           asection *section,
++           bfd_size_type offset);
++
++DESCRIPTION
++        Returns TRUE if the reloc described by @var{HOWTO} can be
++	applied at @var{OFFSET} octets in @var{SECTION}.
++
++*/
++
+ /* HOWTO describes a relocation, at offset OCTET.  Return whether the
+    relocation field is within SECTION of ABFD.  */
+ 
+-static bfd_boolean
+-reloc_offset_in_range (reloc_howto_type *howto, bfd *abfd,
+-		       asection *section, bfd_size_type octet)
++bfd_boolean
++bfd_reloc_offset_in_range (reloc_howto_type *howto,
++			   bfd *abfd,
++			   asection *section,
++			   bfd_size_type octet)
+ {
+   bfd_size_type octet_end = bfd_get_section_limit_octets (abfd, section);
+   bfd_size_type reloc_size = bfd_get_reloc_size (howto);
+@@ -617,6 +636,11 @@ bfd_perform_relocation (bfd *abfd,
+   if (howto && howto->special_function)
+     {
+       bfd_reloc_status_type cont;
++
++      /* Note - we do not call bfd_reloc_offset_in_range here as the
++	 reloc_entry->address field might actually be valid for the
++	 backend concerned.  It is up to the special_function itself
++	 to call bfd_reloc_offset_in_range if needed.  */
+       cont = howto->special_function (abfd, reloc_entry, symbol, data,
+ 				      input_section, output_bfd,
+ 				      error_message);
+@@ -637,7 +661,7 @@ bfd_perform_relocation (bfd *abfd,
+ 
+   /* Is the address of the relocation really within the section?  */
+   octets = reloc_entry->address * bfd_octets_per_byte (abfd);
+-  if (!reloc_offset_in_range (howto, abfd, input_section, octets))
++  if (!bfd_reloc_offset_in_range (howto, abfd, input_section, octets))
+     return bfd_reloc_outofrange;
+ 
+   /* Work out which section the relocation is targeted at and the
+@@ -1003,6 +1027,10 @@ bfd_install_relocation (bfd *abfd,
+     {
+       bfd_reloc_status_type cont;
+ 
++      /* Note - we do not call bfd_reloc_offset_in_range here as the
++	 reloc_entry->address field might actually be valid for the
++	 backend concerned.  It is up to the special_function itself
++	 to call bfd_reloc_offset_in_range if needed.  */
+       /* XXX - The special_function calls haven't been fixed up to deal
+ 	 with creating new relocations and section contents.  */
+       cont = howto->special_function (abfd, reloc_entry, symbol,
+@@ -1025,7 +1053,7 @@ bfd_install_relocation (bfd *abfd,
+ 
+   /* Is the address of the relocation really within the section?  */
+   octets = reloc_entry->address * bfd_octets_per_byte (abfd);
+-  if (!reloc_offset_in_range (howto, abfd, input_section, octets))
++  if (!bfd_reloc_offset_in_range (howto, abfd, input_section, octets))
+     return bfd_reloc_outofrange;
+ 
+   /* Work out which section the relocation is targeted at and the
+@@ -1363,7 +1391,7 @@ _bfd_final_link_relocate (reloc_howto_ty
+   bfd_size_type octets = address * bfd_octets_per_byte (input_bfd);
+ 
+   /* Sanity check the address.  */
+-  if (!reloc_offset_in_range (howto, input_bfd, input_section, octets))
++  if (!bfd_reloc_offset_in_range (howto, input_bfd, input_section, octets))
+     return bfd_reloc_outofrange;
+ 
+   /* This function assumes that we are dealing with a basic relocation
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,20 @@
++2017-11-28  Nick Clifton  <nickc@redhat.com>
++
++       PR 22506
++       * reloc.c (reloc_offset_in_range): Rename to
++      bfd_reloc_offset_in_range and export.
++       (bfd_perform_relocation): Rename function invocation.
++       (bfd_install_relocation): Likewise.
++       (bfd_final_link_relocate): Likewise.
++       * bfd-in2.h: Regenerate.
++       * coff-arm.c (coff_arm_reloc): Use bfd_reloc_offset_in_range.
++       * coff-i386.c (coff_i386_reloc): Likewise.
++       * coff-i860.c (coff_i860_reloc): Likewise.
++       * coff-m68k.c (mk68kcoff_common_addend_special_fn): Likewise.
++       * coff-m88k.c (m88k_special_reloc): Likewise.
++       * coff-mips.c (mips_reflo_reloc): Likewise.
++       * coff-x86_64.c (coff_amd64_reloc): Likewise.
++
+ 2017-11-16  Nick Clifton  <nickc@redhat.com>
+  
+        PR 22421
-- 
2.7.4


