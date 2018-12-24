Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id B874E6003C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2018 18:42:20 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g9so5833290plo.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2018 10:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=53t9zUuBpnMmMpx0IOdNliPltAMK97EvWl+oQHIV0NM=;
	b=AqbVlBgLQbtD6PpUswmGxKZeO2Kw0b4z6h22L1P9JOPIwKB8zjTYaTGRkm6uwIh7dW
	qHjdsfDArgSlllqddNYx4iDXFN6G0bTFi2Gr1VP6dHNMwQ3W/WVL8WmPQpmEKNWZ4Ua5
	oiyJG2Rz1jXqg+tcKoHwsMRIZQx47AAHUQ2zI9gMy461QMwWoJUtBYkgaJRnp0nzoD1z
	NA2kCSupKXpzYQ5qvb63UptwqKc6UACIBz2nzzBPdQ9f90ohGhCaGLEZYCjSG/jmn2eI
	Wwzqj6asozHHn3ePDy5H4ANzDt2C4jXnEYQTALc6Ql3c9nlYC2yLD6R6n4nOnsCWahxk
	h6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=53t9zUuBpnMmMpx0IOdNliPltAMK97EvWl+oQHIV0NM=;
	b=OS5DfjXJoAgKeR9UH8qFDMBZblcyGmWGD7BMRMNMtQb6n4HdmUSSI7W1KSwectWme4
	4DTwn6A1xIGSA9atl4p6z6aeluyp/trJVLiRvoAHe/w5mXul8XXGUqYe+BPlSUvaFgr8
	jUq/S3I1/BCve0a9X8WA5FpFcDfhCCDkKygKdb3L8z5Cu/4KOO8VuNU6qAMMhVXUns7D
	gydchpYQHOq7sVqpma3T1cpKNsgvYFbJNIa+eh8/6DXuTmJjn6pEqqm+wGCqz9s03cxf
	ATnhopMDPanmkPwxUUwdr8Sa04v3P1+Dg+nW0i4jjbTLHYF/ZR5vWgAcwqxLb6Ohbkx5
	O2kw==
X-Gm-Message-State: AJcUukd/YhPiZqagcXQCG22rTaFUg+dV2j90lGs0mi+8SmYisNebxQgr
	7RaWp/K8jc9S7zNT4lj+L3x0dkNUEoA=
X-Google-Smtp-Source: ALg8bN5ep2FT0UMTHClPyb5XliLkLRpY2ZVX9iDqAYE/mz0JH+0ZxdE85qIg/YxBURzzUugKMbm1Xg==
X-Received: by 2002:a17:902:5a5:: with SMTP id
	f34mr13983730plf.161.1545676940798; 
	Mon, 24 Dec 2018 10:42:20 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	h19sm39082608pfn.114.2018.12.24.10.42.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Dec 2018 10:42:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2018 10:41:51 -0800
Message-Id: <20181224184151.44879-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Cupertino Miranda <cmiranda@synopsys.com>,
	Romain Naour <romain.naour@gmail.com>,
	Alexey Brodkin <abrodkin@synopsys.com>
Subject: [PATCH] binutils: Upgrade to latest on 2.31 release branch
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
X-List-Received-Date: Mon, 24 Dec 2018 18:42:21 -0000
Content-Transfer-Encoding: 8bit

* Append minor version to PV so recipe checker is happy
* Drop upstreamed patches
* Remove changelog from CVE patches, they dont apply and are in patch
  log anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils-2.31.inc                |   8 +-
 ...-for-input-file-matching-output-file.patch |  59 -----
 ...ion-where-GOT-information-is-collect.patch | 201 ------------------
 ...ess.-Return-FALSE-in-case-of-NULL-po.patch |  38 ----
 ...-symbol-is-not-an-indirect-or-warnin.patch |  46 ----
 ...was-still-being-generated-when-symbo.patch |  40 ----
 .../binutils/binutils/CVE-2018-17358.patch    |  37 +---
 .../binutils/binutils/CVE-2018-17360.patch    |  24 +--
 .../binutils/binutils/CVE-2018-18309.patch    |  87 ++------
 .../binutils/binutils/CVE-2018-18605.patch    |  20 +-
 .../binutils/binutils/CVE-2018-18606.patch    |  22 +-
 .../binutils/binutils/CVE-2018-18607.patch    |  25 +--
 .../binutils/binutils/clang-bfd-fix.patch     |   8 +-
 13 files changed, 33 insertions(+), 582 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index c3c15fb416..b8b2d97884 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -15,10 +15,11 @@ def binutils_branch_version(d):
     return pvsplit[0] + "_" + pvsplit[1]
 
 BINUPV = "${@binutils_branch_version(d)}"
+PV .= ".1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "4568e49ff799192fea4f66063fe13e2b871ec75a"
+SRCREV ?= "c909e7afdc4710851a53e86ebed8cea3879b26e5"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -36,11 +37,6 @@ SRC_URI = "\
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-add-i386pep-emulation-for-x86_64.patch \
-     file://0017-improve-check-for-input-file-matching-output-file.patch \
-     file://0018-Refactored-location-where-GOT-information-is-collect.patch \
-     file://0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch \
-     file://0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch \
-     file://0021-PLT-information-was-still-being-generated-when-symbo.patch \
      file://clang-bfd-fix.patch \
      file://CVE-2018-17358.patch \
      file://CVE-2018-17360.patch \
diff --git a/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch b/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch
deleted file mode 100644
index 265e52633b..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 2a50366ded329bfb39d387253450c9d5302c3503 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Tue, 14 Aug 2018 12:22:35 +0100
-Subject: [PATCH] as.c: Improve check for input file matching output file.
-
-When the assembler reports that the input and output are the same, report the
-file names involved, in order to help debugging.  Also do not equate two files
-are the same if the have the same inode value but reside on different file
-systems.
-
-Upstream-Status: Backport
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- gas/as.c      | 27 ++++++++++++++++++++-------
- 2 files changed, 20 insertions(+), 7 deletions(-)
-
-diff --git a/gas/as.c b/gas/as.c
-index b2a908a..3105d06 100644
---- a/gas/as.c
-+++ b/gas/as.c
-@@ -1259,14 +1259,27 @@ main (int argc, char ** argv)
- 	{
- 	  struct stat sib;
- 
--	  if (stat (argv[i], &sib) == 0)
-+	  /* Check that the input file and output file are different.  */
-+	  if (stat (argv[i], &sib) == 0
-+	      && sib.st_ino == sob.st_ino
-+	      /* POSIX emulating systems may support stat() but if the
-+		 underlying file system does not support a file serial number
-+		 of some kind then they will return 0 for the inode.  So
-+		 two files with an inode of 0 may not actually be the same.
-+		 On real POSIX systems no ordinary file will ever have an
-+		 inode of 0.  */
-+	      && sib.st_ino != 0
-+	      /* Different files may have the same inode number if they
-+		 reside on different devices, so check the st_dev field as
-+		 well.  */
-+	      && sib.st_dev == sob.st_dev)
- 	    {
--	      if (sib.st_ino == sob.st_ino && sib.st_ino != 0)
--		{
--		  /* Don't let as_fatal remove the output file!  */
--		  out_file_name = NULL;
--		  as_fatal (_("The input and output files must be distinct"));
--		}
-+	      const char *saved_out_file_name = out_file_name;
-+
-+	      /* Don't let as_fatal remove the output file!  */
-+	      out_file_name = NULL;
-+	      as_fatal (_("The input '%s' and output '%s' files are the same"),
-+			argv[i], saved_out_file_name);
- 	    }
- 	}
-     }
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch b/meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
deleted file mode 100644
index d41339a9a6..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0018-Refactored-location-where-GOT-information-is-collect.patch
+++ /dev/null
@@ -1,201 +0,0 @@
-From d930affa2d475d1cc6792f1e6d56bef3d6c617db Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Fri, 2 Mar 2018 17:16:21 +0100
-Subject: [PATCH] Refactored location where GOT information is collected.
-
-Change location where GOT information is collected for ARC target, avoiding
-posible use conflicts of the previous .got field in the symbols hash_entry.
-
-bfd/
-2018-03-01  Cupertino Miranda  <cmiranda@synopsys.com>
-
-	* arc-got.h (get_got_entry_list_for_symbol): Changed.
-	* ef32-arc.c (struct elf_arc_link_hash_entry): Moved and changed.
-	(elf_arc_link_hash_newfunc): Changed.
-	(arc_elf_link_hash_table_create): Removed old initializations.
-	(elf_arc_relocate_section, elf_arc_finish_dynamic_symbol): Changed.
-
-Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-[Romain: rebase on top of 2.31]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-
-Upstream-Status: Pending
----
- bfd/arc-got.h   |  6 +++--
- bfd/elf32-arc.c | 77 +++++++++++++++++++++++++++++++--------------------------
- 2 files changed, 46 insertions(+), 37 deletions(-)
-
-diff --git a/bfd/arc-got.h b/bfd/arc-got.h
-index a86061bcb38..81ce88fe21a 100644
---- a/bfd/arc-got.h
-+++ b/bfd/arc-got.h
-@@ -156,9 +156,11 @@ get_got_entry_list_for_symbol (bfd *abfd,
- 			       unsigned long r_symndx,
- 			       struct elf_link_hash_entry *h)
- {
--  if (h != NULL)
-+  struct elf_arc_link_hash_entry *h1 =
-+    ((struct elf_arc_link_hash_entry *) h);
-+  if (h1 != NULL)
-     {
--      return &h->got.glist;
-+      return &h1->got_ents;
-     }
-   else
-     {
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index a48ef0ca15f..ab84de43815 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -160,6 +160,18 @@ struct arc_relocation_data
-   const char *    symbol_name;
- };
- 
-+/* ARC ELF linker hash entry.  */
-+struct elf_arc_link_hash_entry
-+{
-+  struct elf_link_hash_entry root;
-+
-+  /* Track dynamic relocs copied for this symbol.  */
-+  struct elf_dyn_relocs *dyn_relocs;
-+
-+  struct got_entry *got_ents;
-+};
-+
-+
- /* Should be included at this location due to static declarations
-    defined before this point.  */
- #include "arc-got.h"
-@@ -281,15 +293,6 @@ struct arc_reloc_map
-   unsigned char		    elf_reloc_val;
- };
- 
--/* ARC ELF linker hash entry.  */
--struct elf_arc_link_hash_entry
--{
--  struct elf_link_hash_entry root;
--
--  /* Track dynamic relocs copied for this symbol.  */
--  struct elf_dyn_relocs *dyn_relocs;
--};
--
- /* ARC ELF linker hash table.  */
- struct elf_arc_link_hash_table
- {
-@@ -301,28 +304,28 @@ elf_arc_link_hash_newfunc (struct bfd_hash_entry *entry,
- 			   struct bfd_hash_table *table,
- 			   const char *string)
- {
-+  struct elf_arc_link_hash_entry * ret =
-+    (struct elf_arc_link_hash_entry *) entry;
-+
-   /* Allocate the structure if it has not already been allocated by a
-      subclass.  */
--  if (entry == NULL)
--    {
--      entry = (struct bfd_hash_entry *)
--	  bfd_hash_allocate (table,
--			     sizeof (struct elf_arc_link_hash_entry));
--      if (entry == NULL)
--	return entry;
--    }
-+  if (ret == NULL)
-+    ret = (struct elf_arc_link_hash_entry *)
-+	bfd_hash_allocate (table, sizeof (struct elf_arc_link_hash_entry));
-+  if (ret == NULL)
-+    return (struct bfd_hash_entry *) ret;
- 
-   /* Call the allocation method of the superclass.  */
--  entry = _bfd_elf_link_hash_newfunc (entry, table, string);
--  if (entry != NULL)
-+  ret = ((struct elf_arc_link_hash_entry *)
-+	 _bfd_elf_link_hash_newfunc ((struct bfd_hash_entry *) ret,
-+				     table, string));
-+  if (ret != NULL)
-     {
--      struct elf_arc_link_hash_entry *eh;
--
--      eh = (struct elf_arc_link_hash_entry *) entry;
--      eh->dyn_relocs = NULL;
-+      ret->dyn_relocs = NULL;
-+      ret->got_ents = NULL;
-     }
- 
--  return entry;
-+  return (struct bfd_hash_entry *) ret;
- }
- 
- /* Destroy an ARC ELF linker hash table.  */
-@@ -352,11 +355,6 @@ arc_elf_link_hash_table_create (bfd *abfd)
-       return NULL;
-     }
- 
--  ret->elf.init_got_refcount.refcount = 0;
--  ret->elf.init_got_refcount.glist = NULL;
--  ret->elf.init_got_offset.offset = 0;
--  ret->elf.init_got_offset.glist = NULL;
--
-   ret->elf.root.hash_table_free = elf_arc_link_hash_table_free;
- 
-   return &ret->elf.root;
-@@ -1615,10 +1613,14 @@ elf_arc_relocate_section (bfd *			  output_bfd,
- 	  while (h->root.type == bfd_link_hash_indirect
- 		 || h->root.type == bfd_link_hash_warning)
- 	  {
--	    struct elf_link_hash_entry *h_old = h;
-+	    struct elf_arc_link_hash_entry *ah_old =
-+	      (struct elf_arc_link_hash_entry *) h;
- 	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
--	    if (h->got.glist == 0 && h_old->got.glist != h->got.glist)
--	      h->got.glist = h_old->got.glist;
-+	    struct elf_arc_link_hash_entry *ah =
-+	      (struct elf_arc_link_hash_entry *) h;
-+
-+	    if (ah->got_ents == 0 && ah_old->got_ents != ah->got_ents)
-+	      ah->got_ents = ah_old->got_ents;
- 	  }
- 
- 	  /* TODO: Need to validate what was the intention.  */
-@@ -1636,6 +1638,8 @@ elf_arc_relocate_section (bfd *			  output_bfd,
- 
- 	      if (is_reloc_for_GOT (howto) && !bfd_link_pic (info))
- 		{
-+		  struct elf_arc_link_hash_entry *ah =
-+		    (struct elf_arc_link_hash_entry *) h;
- 		  /* TODO: Change it to use arc_do_relocation with
- 		    ARC_32 reloc.  Try to use ADD_RELA macro.  */
- 		  bfd_vma relocation =
-@@ -1645,8 +1649,8 @@ elf_arc_relocate_section (bfd *			  output_bfd,
- 			 + reloc_data.sym_section->output_section->vma)
- 		      : 0);
- 
--		  BFD_ASSERT (h->got.glist);
--		  bfd_vma got_offset = h->got.glist->offset;
-+		  BFD_ASSERT (ah->got_ents);
-+		  bfd_vma got_offset = ah->got_ents->offset;
- 		  bfd_put_32 (output_bfd, relocation,
- 			      htab->sgot->contents + got_offset);
- 		}
-@@ -1958,6 +1962,7 @@ elf_arc_check_relocs (bfd *			 abfd,
-       else /* Global one.  */
- 	h = sym_hashes[r_symndx - symtab_hdr->sh_info];
- 
-+
-       switch (r_type)
- 	{
- 	  case R_ARC_32:
-@@ -2404,7 +2409,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
-      create respective dynamic relocs.  */
-   /* TODO: Make function to get list and not access the list directly.  */
-   /* TODO: Move function to relocate_section create this relocs eagerly.  */
--  create_got_dynrelocs_for_got_info (&h->got.glist,
-+  struct elf_arc_link_hash_entry *ah =
-+    (struct elf_arc_link_hash_entry *) h;
-+  create_got_dynrelocs_for_got_info (&ah->got_ents,
- 				     output_bfd,
- 				     info,
- 				     h);
--- 
-2.14.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch b/meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
deleted file mode 100644
index 6a58ee06ac..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0019-Improved-robustness.-Return-FALSE-in-case-of-NULL-po.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 955176bd999fe80c5b937ab8786665079e35c387 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Fri, 2 Mar 2018 17:33:48 +0100
-Subject: [PATCH] Improved robustness. Return FALSE in case of NULL pointer.
-
-bfd/
-2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
-
-	* elf32-arc.c (elf_arc_finish_dynamic_symbol) Return FALSE in case
-	arc_htab is NULL.
-
-Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-[Romain: rebase on top of 2.31]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-
-Upstream-Status: Pending
----
- bfd/elf32-arc.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index ab84de43815..33fc72cff6e 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -2420,6 +2420,9 @@ elf_arc_finish_dynamic_symbol (bfd * output_bfd,
-     {
-       struct elf_arc_link_hash_table *arc_htab = elf_arc_hash_table (info);
- 
-+      if(arc_htab == NULL)
-+	return FALSE;
-+
-       if (h->dynindx == -1
- 	  || (h->root.type != bfd_link_hash_defined
- 	      && h->root.type != bfd_link_hash_defweak)
--- 
-2.14.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch b/meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
deleted file mode 100644
index 01e42c03bb..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0020-Make-sure-global-symbol-is-not-an-indirect-or-warnin.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9d09ce14b4eef2b56f24660fd69a44acd45128b2 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Fri, 2 Mar 2018 17:38:14 +0100
-Subject: [PATCH] Make sure global symbol is not an indirect or warning.
-
-Problem identified in the context of glibc with latest upstream binutils.
-Dynamic symbol space was being reserved but, no actual information for the
-symbol was being set. Data for the symbol was kept initialized with -1.
-No easy test case was possible to be created.
-
-bfd/
-2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
-
-	* elf32-arc.c (elf_arc_check_relocs): Changed.
-
-Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-[Romain: rebase on top of 2.31]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-
-Upstream-Status: Pending
----
- bfd/elf32-arc.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 33fc72cff6e..9b72c5b4f4f 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -1960,7 +1960,12 @@ elf_arc_check_relocs (bfd *			 abfd,
-       if (r_symndx < symtab_hdr->sh_info) /* Is a local symbol.  */
- 	h = NULL;
-       else /* Global one.  */
--	h = sym_hashes[r_symndx - symtab_hdr->sh_info];
-+	{
-+	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
-+	  while (h->root.type == bfd_link_hash_indirect
-+		 || h->root.type == bfd_link_hash_warning)
-+	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
-+	}
- 
- 
-       switch (r_type)
--- 
-2.14.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch b/meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
deleted file mode 100644
index 9e942399c0..0000000000
--- a/meta/recipes-devtools/binutils/binutils/0021-PLT-information-was-still-being-generated-when-symbo.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e4861c68067cb2166b4c2bb9c052abeb6ad9aaa1 Mon Sep 17 00:00:00 2001
-From: Cupertino Miranda <cmiranda@synopsys.com>
-Date: Fri, 2 Mar 2018 17:44:29 +0100
-Subject: [PATCH] PLT information was still being generated when symbol was
- forced_local.
-
-A change upstream reveiled this issue, triggering an assert when linking glibc.
-
-bfd/
-2018-03-01  Cupertino Miranda <cmiranda@synopsys.com>
-
-	* elf32-arc.c (elf_arc_check_relocs): Changed.
-
-Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-[Romain: rebase on top of 2.31]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-
-Upstream-Status: Pending
----
- bfd/elf32-arc.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 9b72c5b4f4f..b40b463d34d 100644
---- a/bfd/elf32-arc.c
-+++ b/bfd/elf32-arc.c
-@@ -2041,7 +2041,8 @@ elf_arc_check_relocs (bfd *			 abfd,
- 	  if (h == NULL)
- 	    continue;
- 	  else
--	    h->needs_plt = 1;
-+	    if(h->forced_local == 0)
-+	      h->needs_plt = 1;
- 	}
- 
-       /* Add info to the symbol got_entry_list.  */
--- 
-2.14.4
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-17358.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-17358.patch
index 813509160f..d5a1ea1dc4 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-17358.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-17358.patch
@@ -21,25 +21,6 @@ Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
  bfd/syms.c    | 22 ++++++++++++++++------
  3 files changed, 33 insertions(+), 7 deletions(-)
 
-diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-index 04c0c2a..fef5479 100644
---- a/bfd/ChangeLog
-+++ b/bfd/ChangeLog
-@@ -1,3 +1,12 @@
-+2018-09-20  Alan Modra  <amodra@gmail.com>
-+
-+	PR 23686
-+	* dwarf2.c (read_section): Error when attempting to malloc
-+	"(bfd_size_type) -1".
-+	* syms.c (_bfd_stab_section_find_nearest_line): Bounds check
-+	function_name.  Bounds check reloc address.  Formatting.  Ensure
-+	.stabstr zero terminated.
-+
- 2018-08-12  H.J. Lu  <hongjiu.lu@intel.com>
- 
- 	PR ld/23428
-diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
-index 3b28855..77a7368 100644
 --- a/bfd/dwarf2.c
 +++ b/bfd/dwarf2.c
 @@ -527,6 +527,7 @@ read_section (bfd *	      abfd,
@@ -65,11 +46,9 @@ index 3b28855..77a7368 100644
        if (contents == NULL)
  	return FALSE;
        if (syms
-diff --git a/bfd/syms.c b/bfd/syms.c
-index 187071f..e09640a 100644
 --- a/bfd/syms.c
 +++ b/bfd/syms.c
-@@ -1035,6 +1035,10 @@ _bfd_stab_section_find_nearest_line (bfd *abfd,
+@@ -1035,6 +1035,10 @@ _bfd_stab_section_find_nearest_line (bfd
  					 0, strsize))
  	return FALSE;
  
@@ -80,7 +59,7 @@ index 187071f..e09640a 100644
        /* If this is a relocatable object file, we have to relocate
  	 the entries in .stab.  This should always be simple 32 bit
  	 relocations against symbols defined in this object file, so
-@@ -1073,7 +1077,8 @@ _bfd_stab_section_find_nearest_line (bfd *abfd,
+@@ -1073,7 +1077,8 @@ _bfd_stab_section_find_nearest_line (bfd
  		  || r->howto->bitsize != 32
  		  || r->howto->pc_relative
  		  || r->howto->bitpos != 0
@@ -90,7 +69,7 @@ index 187071f..e09640a 100644
  		{
  		  _bfd_error_handler
  		    (_("unsupported .stab relocation"));
-@@ -1195,7 +1200,8 @@ _bfd_stab_section_find_nearest_line (bfd *abfd,
+@@ -1195,7 +1200,8 @@ _bfd_stab_section_find_nearest_line (bfd
  		{
  		  nul_fun = stab;
  		  nul_str = str;
@@ -100,7 +79,7 @@ index 187071f..e09640a 100644
  		    file_name = NULL;
  		  if (stab + STABSIZE + TYPEOFF < info->stabs + stabsize
  		      && *(stab + STABSIZE + TYPEOFF) == (bfd_byte) N_SO)
-@@ -1206,7 +1212,8 @@ _bfd_stab_section_find_nearest_line (bfd *abfd,
+@@ -1206,7 +1212,8 @@ _bfd_stab_section_find_nearest_line (bfd
  		      directory_name = file_name;
  		      file_name = ((char *) str
  				   + bfd_get_32 (abfd, stab + STRDXOFF));
@@ -110,7 +89,7 @@ index 187071f..e09640a 100644
  			file_name = NULL;
  		    }
  		}
-@@ -1217,7 +1224,8 @@ _bfd_stab_section_find_nearest_line (bfd *abfd,
+@@ -1217,7 +1224,8 @@ _bfd_stab_section_find_nearest_line (bfd
  	      file_name = (char *) str + bfd_get_32 (abfd, stab + STRDXOFF);
  	      /* PR 17512: file: 0c680a1f.  */
  	      /* PR 17512: file: 5da8aec4.  */
@@ -120,7 +99,7 @@ index 187071f..e09640a 100644
  		file_name = NULL;
  	      break;
  
-@@ -1226,7 +1234,8 @@ _bfd_stab_section_find_nearest_line (bfd *abfd,
+@@ -1226,7 +1234,8 @@ _bfd_stab_section_find_nearest_line (bfd
  	      function_name = (char *) str + bfd_get_32 (abfd, stab + STRDXOFF);
  	      if (function_name == (char *) str)
  		continue;
@@ -130,7 +109,7 @@ index 187071f..e09640a 100644
  		function_name = NULL;
  
  	      nul_fun = NULL;
-@@ -1335,7 +1344,8 @@ _bfd_stab_section_find_nearest_line (bfd *abfd,
+@@ -1335,7 +1344,8 @@ _bfd_stab_section_find_nearest_line (bfd
  	  if (val <= offset)
  	    {
  	      file_name = (char *) str + bfd_get_32 (abfd, stab + STRDXOFF);
@@ -140,5 +119,3 @@ index 187071f..e09640a 100644
  		file_name = NULL;
  	      *pline = 0;
  	    }
--- 
-2.9.3
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-17360.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-17360.patch
index cef10a7546..45c637967b 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-17360.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-17360.patch
@@ -15,27 +15,9 @@ Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
  bfd/peXXigen.c | 11 ++++++-----
  2 files changed, 12 insertions(+), 5 deletions(-)
 
-diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-index fef5479..81b9e56 100644
---- a/bfd/ChangeLog
-+++ b/bfd/ChangeLog
-@@ -1,5 +1,11 @@
- 2018-09-20  Alan Modra  <amodra@gmail.com>
- 
-+	PR 23685
-+	* peXXigen.c (pe_print_edata): Correct export address table
-+	overflow checks.  Check dataoff against section size too.
-+
-+2018-09-20  Alan Modra  <amodra@gmail.com>
-+
- 	PR 23686
- 	* dwarf2.c (read_section): Error when attempting to malloc
- 	"(bfd_size_type) -1".
-diff --git a/bfd/peXXigen.c b/bfd/peXXigen.c
-index 598f2ca..1645ef4 100644
 --- a/bfd/peXXigen.c
 +++ b/bfd/peXXigen.c
-@@ -1661,7 +1661,8 @@ pe_print_edata (bfd * abfd, void * vfile)
+@@ -1661,7 +1661,8 @@ pe_print_edata (bfd * abfd, void * vfile
  
        dataoff = addr - section->vma;
        datasize = extra->DataDirectory[PE_EXPORT_TABLE].Size;
@@ -45,7 +27,7 @@ index 598f2ca..1645ef4 100644
  	{
  	  fprintf (file,
  		   _("\nThere is an export table in %s, but it does not fit into that section\n"),
-@@ -1778,11 +1779,11 @@ pe_print_edata (bfd * abfd, void * vfile)
+@@ -1778,11 +1779,11 @@ pe_print_edata (bfd * abfd, void * vfile
  	  edt.base);
  
    /* PR 17512: Handle corrupt PE binaries.  */
@@ -61,5 +43,3 @@ index 598f2ca..1645ef4 100644
      fprintf (file, _("\tInvalid Export Address Table rva (0x%lx) or entry count (0x%lx)\n"),
  	     (long) edt.eat_addr,
  	     (long) edt.num_functions);
--- 
-2.9.3
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch
index b240a3f994..010e6b5d53 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-18309.patch
@@ -49,39 +49,9 @@ Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
  bfd/reloc.c        | 19 +++++++++++++------
  14 files changed, 50 insertions(+), 23 deletions(-)
 
-diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-index 68c1ff665b..e9696ee314 100644
---- a/bfd/ChangeLog
-+++ b/bfd/ChangeLog
-@@ -1,3 +1,23 @@
-+2018-10-13  Alan Modra  <amodra@gmail.com>
-+
-+	PR 23770
-+	PR 23425
-+	* reloc.c (_bfd_clear_contents): Replace "location" param with
-+	"buf" and "off".  Bounds check "off".  Return status.
-+	* cofflink.c (_bfd_coff_generic_relocate_section): Update
-+	_bfd_clear_contents call.
-+	* elf-bfd.h (RELOC_AGAINST_DISCARDED_SECTION): Likewise.
-+	* elf32-arc.c (elf_arc_relocate_section): Likewise.
-+	* elf32-i386.c (elf_i386_relocate_section): Likewise.
-+	* elf32-metag.c (metag_final_link_relocate): Likewise.
-+	* elf32-nds32.c (nds32_elf_get_relocated_section_contents): Likewise.
-+	* elf32-ppc.c (ppc_elf_relocate_section): Likewise.
-+	* elf32-visium.c (visium_elf_relocate_section): Likewise.
-+	* elf64-ppc.c (ppc64_elf_relocate_section): Likewise.
-+	* elf64-x86-64.c *(elf_x86_64_relocate_section): Likewise.
-+	* libbfd-in.h (_bfd_clear_contents): Update prototype.
-+	* libbfd.h: Regenerate.
-+
- 2018-09-20  Alan Modra  <amodra@gmail.com>
- 
- 	PR 23685
-diff --git a/bfd/cofflink.c b/bfd/cofflink.c
-index 2f73f72e31..b7ea69b7f9 100644
 --- a/bfd/cofflink.c
 +++ b/bfd/cofflink.c
-@@ -3080,7 +3080,7 @@ _bfd_coff_generic_relocate_section (bfd *output_bfd,
+@@ -3080,7 +3080,7 @@ _bfd_coff_generic_relocate_section (bfd
        if (sec != NULL && discarded_section (sec))
  	{
  	  _bfd_clear_contents (howto, input_bfd, input_section,
@@ -90,11 +60,9 @@ index 2f73f72e31..b7ea69b7f9 100644
  	  continue;
  	}
  
-diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
-index cf256f70e0..3374f411f9 100644
 --- a/bfd/elf-bfd.h
 +++ b/bfd/elf-bfd.h
-@@ -2811,7 +2811,7 @@ extern asection _bfd_elf_large_com_section;
+@@ -2811,7 +2811,7 @@ extern asection _bfd_elf_large_com_secti
    {									\
      int i_;								\
      _bfd_clear_contents (howto, input_bfd, input_section,		\
@@ -103,11 +71,9 @@ index cf256f70e0..3374f411f9 100644
  									\
      if (bfd_link_relocatable (info)					\
  	&& (input_section->flags & SEC_DEBUGGING))			\
-diff --git a/bfd/elf32-arc.c b/bfd/elf32-arc.c
-index 7a1b3042ae..30f47a5b22 100644
 --- a/bfd/elf32-arc.c
 +++ b/bfd/elf32-arc.c
-@@ -1549,7 +1549,7 @@ elf_arc_relocate_section (bfd *			  output_bfd,
+@@ -1552,7 +1552,7 @@ elf_arc_relocate_section (bfd *			  outp
        if (sec != NULL && discarded_section (sec))
  	{
  	  _bfd_clear_contents (howto, input_bfd, input_section,
@@ -116,11 +82,9 @@ index 7a1b3042ae..30f47a5b22 100644
  	  rel->r_info = 0;
  	  rel->r_addend = 0;
  
-diff --git a/bfd/elf32-i386.c b/bfd/elf32-i386.c
-index 49797dcbfa..177471777d 100644
 --- a/bfd/elf32-i386.c
 +++ b/bfd/elf32-i386.c
-@@ -2197,7 +2197,7 @@ elf_i386_relocate_section (bfd *output_bfd,
+@@ -2197,7 +2197,7 @@ elf_i386_relocate_section (bfd *output_b
        if (sec != NULL && discarded_section (sec))
  	{
  	  _bfd_clear_contents (howto, input_bfd, input_section,
@@ -129,11 +93,9 @@ index 49797dcbfa..177471777d 100644
  	  wrel->r_offset = rel->r_offset;
  	  wrel->r_info = 0;
  	  wrel->r_addend = 0;
-diff --git a/bfd/elf32-metag.c b/bfd/elf32-metag.c
-index efe95bddff..7f96246e5d 100644
 --- a/bfd/elf32-metag.c
 +++ b/bfd/elf32-metag.c
-@@ -1396,7 +1396,7 @@ metag_final_link_relocate (reloc_howto_type *howto,
+@@ -1396,7 +1396,7 @@ metag_final_link_relocate (reloc_howto_t
  					      rel, relend, howto, contents) \
    {									\
      _bfd_clear_contents (howto, input_bfd, input_section,		\
@@ -142,11 +104,9 @@ index efe95bddff..7f96246e5d 100644
  									\
      if (bfd_link_relocatable (info)					\
  	&& (input_section->flags & SEC_DEBUGGING))			\
-diff --git a/bfd/elf32-nds32.c b/bfd/elf32-nds32.c
-index 0d86e5b865..184cf320f7 100644
 --- a/bfd/elf32-nds32.c
 +++ b/bfd/elf32-nds32.c
-@@ -12582,14 +12582,14 @@ nds32_elf_get_relocated_section_contents (bfd *abfd,
+@@ -12582,14 +12582,14 @@ nds32_elf_get_relocated_section_contents
  	  symbol = *(*parent)->sym_ptr_ptr;
  	  if (symbol->section && discarded_section (symbol->section))
  	    {
@@ -165,11 +125,9 @@ index 0d86e5b865..184cf320f7 100644
  	      (*parent)->sym_ptr_ptr = bfd_abs_section_ptr->symbol_ptr_ptr;
  	      (*parent)->addend = 0;
  	      (*parent)->howto = &none_howto;
-diff --git a/bfd/elf32-ppc.c b/bfd/elf32-ppc.c
-index 61f70de12e..c31e26efd7 100644
 --- a/bfd/elf32-ppc.c
 +++ b/bfd/elf32-ppc.c
-@@ -8232,7 +8232,7 @@ ppc_elf_relocate_section (bfd *output_bfd,
+@@ -8232,7 +8232,7 @@ ppc_elf_relocate_section (bfd *output_bf
  	    howto = ppc_elf_howto_table[r_type];
  
  	  _bfd_clear_contents (howto, input_bfd, input_section,
@@ -178,11 +136,9 @@ index 61f70de12e..c31e26efd7 100644
  	  wrel->r_offset = rel->r_offset;
  	  wrel->r_info = 0;
  	  wrel->r_addend = 0;
-diff --git a/bfd/elf32-visium.c b/bfd/elf32-visium.c
-index e8f1c4c9e4..961366cd87 100644
 --- a/bfd/elf32-visium.c
 +++ b/bfd/elf32-visium.c
-@@ -621,7 +621,7 @@ visium_elf_relocate_section (bfd *output_bfd,
+@@ -621,7 +621,7 @@ visium_elf_relocate_section (bfd *output
  	     or sections discarded by a linker script, we just want the
  	     section contents zeroed.  Avoid any special processing.  */
  	  _bfd_clear_contents (howto, input_bfd, input_section,
@@ -191,11 +147,9 @@ index e8f1c4c9e4..961366cd87 100644
  
  	  rel->r_info = 0;
  	  rel->r_addend = 0;
-diff --git a/bfd/elf64-ppc.c b/bfd/elf64-ppc.c
-index eadde17615..7c3534ac65 100644
 --- a/bfd/elf64-ppc.c
 +++ b/bfd/elf64-ppc.c
-@@ -14073,7 +14073,7 @@ ppc64_elf_relocate_section (bfd *output_bfd,
+@@ -14074,7 +14074,7 @@ ppc64_elf_relocate_section (bfd *output_
  	{
  	  _bfd_clear_contents (ppc64_elf_howto_table[r_type],
  			       input_bfd, input_section,
@@ -204,11 +158,9 @@ index eadde17615..7c3534ac65 100644
  	  wrel->r_offset = rel->r_offset;
  	  wrel->r_info = 0;
  	  wrel->r_addend = 0;
-diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
-index c3a6c31ed2..4dcab43478 100644
 --- a/bfd/elf64-x86-64.c
 +++ b/bfd/elf64-x86-64.c
-@@ -2490,7 +2490,7 @@ elf_x86_64_relocate_section (bfd *output_bfd,
+@@ -2490,7 +2490,7 @@ elf_x86_64_relocate_section (bfd *output
        if (sec != NULL && discarded_section (sec))
  	{
  	  _bfd_clear_contents (howto, input_bfd, input_section,
@@ -217,11 +169,9 @@ index c3a6c31ed2..4dcab43478 100644
  	  wrel->r_offset = rel->r_offset;
  	  wrel->r_info = 0;
  	  wrel->r_addend = 0;
-diff --git a/bfd/libbfd-in.h b/bfd/libbfd-in.h
-index e53b255dad..f6d9565f03 100644
 --- a/bfd/libbfd-in.h
 +++ b/bfd/libbfd-in.h
-@@ -696,8 +696,8 @@ extern bfd_reloc_status_type _bfd_relocate_contents
+@@ -696,8 +696,8 @@ extern bfd_reloc_status_type _bfd_reloca
    (reloc_howto_type *, bfd *, bfd_vma, bfd_byte *) ATTRIBUTE_HIDDEN;
  
  /* Clear a given location using a given howto.  */
@@ -232,11 +182,9 @@ index e53b255dad..f6d9565f03 100644
  
  /* Link stabs in sections in the first pass.  */
  
-diff --git a/bfd/libbfd.h b/bfd/libbfd.h
-index a8851c8026..1189e63358 100644
 --- a/bfd/libbfd.h
 +++ b/bfd/libbfd.h
-@@ -701,8 +701,8 @@ extern bfd_reloc_status_type _bfd_relocate_contents
+@@ -701,8 +701,8 @@ extern bfd_reloc_status_type _bfd_reloca
    (reloc_howto_type *, bfd *, bfd_vma, bfd_byte *) ATTRIBUTE_HIDDEN;
  
  /* Clear a given location using a given howto.  */
@@ -247,11 +195,9 @@ index a8851c8026..1189e63358 100644
  
  /* Link stabs in sections in the first pass.  */
  
-diff --git a/bfd/reloc.c b/bfd/reloc.c
-index 8dbb8896d3..1686780669 100644
 --- a/bfd/reloc.c
 +++ b/bfd/reloc.c
-@@ -1613,16 +1613,22 @@ _bfd_relocate_contents (reloc_howto_type *howto,
+@@ -1613,16 +1613,22 @@ _bfd_relocate_contents (reloc_howto_type
     relocations against discarded symbols, to make ignorable debug or unwind
     information more obvious.  */
  
@@ -276,7 +222,7 @@ index 8dbb8896d3..1686780669 100644
    size = bfd_get_reloc_size (howto);
    switch (size)
      {
-@@ -1687,6 +1693,7 @@ _bfd_clear_contents (reloc_howto_type *howto,
+@@ -1681,6 +1687,7 @@ _bfd_clear_contents (reloc_howto_type *h
  #endif
        break;
      }
@@ -284,7 +230,7 @@ index 8dbb8896d3..1686780669 100644
  }
  
  /*
-@@ -8275,14 +8282,14 @@ bfd_generic_get_relocated_section_contents (bfd *abfd,
+@@ -8268,14 +8275,14 @@ bfd_generic_get_relocated_section_conten
  
  	  if (symbol->section && discarded_section (symbol->section))
  	    {
@@ -303,6 +249,3 @@ index 8dbb8896d3..1686780669 100644
  	      (*parent)->sym_ptr_ptr = bfd_abs_section_ptr->symbol_ptr_ptr;
  	      (*parent)->addend = 0;
  	      (*parent)->howto = &none_howto;
--- 
-2.13.3
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch
index d6c7067715..a117f95df1 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-18605.patch
@@ -15,25 +15,9 @@ Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
  bfd/merge.c   | 3 +++
  2 files changed, 9 insertions(+)
 
-diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-index 31ff3d6..da423b1 100644
---- a/bfd/ChangeLog
-+++ b/bfd/ChangeLog
-@@ -1,3 +1,9 @@
-+2018-10-23  Alan Modra  <amodra@gmail.com>
-+
-+	PR 23804
-+	* merge.c (_bfd_add_merge_section): Don't attempt to merge
-+	sections where size is not a multiple of entsize.
-+
- 2018-10-13  Alan Modra  <amodra@gmail.com>
- 
- 	PR 23770
-diff --git a/bfd/merge.c b/bfd/merge.c
-index 7904552..5e3bba0 100644
 --- a/bfd/merge.c
 +++ b/bfd/merge.c
-@@ -376,6 +376,9 @@ _bfd_add_merge_section (bfd *abfd, void **psinfo, asection *sec,
+@@ -376,6 +376,9 @@ _bfd_add_merge_section (bfd *abfd, void
        || sec->entsize == 0)
      return TRUE;
  
@@ -43,5 +27,3 @@ index 7904552..5e3bba0 100644
    if ((sec->flags & SEC_RELOC) != 0)
      {
        /* We aren't prepared to handle relocations in merged sections.  */
--- 
-2.9.3
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch
index 35cf328a14..325c339b88 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-18606.patch
@@ -15,24 +15,6 @@ Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
  bfd/merge.c   | 15 +++++++++++----
  2 files changed, 17 insertions(+), 4 deletions(-)
 
-diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-index 1f3fc1c..c5f7ec7 100644
---- a/bfd/ChangeLog
-+++ b/bfd/ChangeLog
-@@ -1,5 +1,11 @@
- 2018-10-23  Alan Modra  <amodra@gmail.com>
- 
-+	PR 23806
-+	* merge.c (_bfd_add_merge_section): Don't attempt to merge
-+	sections with ridiculously large alignments.
-+
-+2018-10-23  Alan Modra  <amodra@gmail.com>
-+
- 	PR 23804
- 	* merge.c (_bfd_add_merge_section): Don't attempt to merge
- 	sections where size is not a multiple of entsize.
-diff --git a/bfd/merge.c b/bfd/merge.c
-index 5e3bba0..7de0c88 100644
 --- a/bfd/merge.c
 +++ b/bfd/merge.c
 @@ -24,6 +24,7 @@
@@ -43,7 +25,7 @@ index 5e3bba0..7de0c88 100644
  #include "bfd.h"
  #include "elf-bfd.h"
  #include "libbfd.h"
-@@ -385,12 +386,18 @@ _bfd_add_merge_section (bfd *abfd, void **psinfo, asection *sec,
+@@ -385,12 +386,18 @@ _bfd_add_merge_section (bfd *abfd, void
        return TRUE;
      }
  
@@ -66,5 +48,3 @@ index 5e3bba0..7de0c88 100644
      {
        /* Sanity check.  If string character size is smaller than
  	 alignment, then we require character size to be a power
--- 
-2.9.3
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch
index 38225d171e..902a90dbc3 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-18607.patch
@@ -16,28 +16,9 @@ Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
  bfd/elflink.c | 20 ++++++++++++++------
  2 files changed, 21 insertions(+), 6 deletions(-)
 
-diff --git a/bfd/ChangeLog b/bfd/ChangeLog
-index da423b1..1f3fc1c 100644
---- a/bfd/ChangeLog
-+++ b/bfd/ChangeLog
-@@ -1,5 +1,12 @@
- 2018-10-23  Alan Modra  <amodra@gmail.com>
- 
-+	PR 23805
-+	* elflink.c (elf_link_input_bfd): Don't segfault on finding
-+	STT_TLS symbols without any TLS sections.  Instead, change the
-+	symbol type to STT_NOTYPE.
-+
-+2018-10-23  Alan Modra  <amodra@gmail.com>
-+
- 	PR 23806
- 	* merge.c (_bfd_add_merge_section): Don't attempt to merge
- 	sections with ridiculously large alignments.
-diff --git a/bfd/elflink.c b/bfd/elflink.c
-index c3876cb..87440db 100644
 --- a/bfd/elflink.c
 +++ b/bfd/elflink.c
-@@ -10489,8 +10489,11 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
+@@ -10496,8 +10496,11 @@ elf_link_input_bfd (struct elf_final_lin
  	  if (ELF_ST_TYPE (osym.st_info) == STT_TLS)
  	    {
  	      /* STT_TLS symbols are relative to PT_TLS segment base.  */
@@ -51,7 +32,7 @@ index c3876cb..87440db 100644
  	    }
  	}
  
-@@ -11046,12 +11049,17 @@ elf_link_input_bfd (struct elf_final_link_info *flinfo, bfd *input_bfd)
+@@ -11053,12 +11056,17 @@ elf_link_input_bfd (struct elf_final_lin
  			      sym.st_value += osec->vma;
  			      if (ELF_ST_TYPE (sym.st_info) == STT_TLS)
  				{
@@ -73,5 +54,3 @@ index c3876cb..87440db 100644
  				}
  			    }
  
--- 
-2.9.3
diff --git a/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch b/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch
index caf78488df..29c0d48fed 100644
--- a/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch
+++ b/meta/recipes-devtools/binutils/binutils/clang-bfd-fix.patch
@@ -17,11 +17,9 @@ Upstream-Status: Backport [Fixes differently]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: git/bfd/reloc.c
-===================================================================
---- git.orig/bfd/reloc.c
-+++ git/bfd/reloc.c
-@@ -1635,7 +1635,7 @@ _bfd_clear_contents (reloc_howto_type *h
+--- a/bfd/reloc.c
++++ b/bfd/reloc.c
+@@ -1629,7 +1629,7 @@ _bfd_clear_contents (reloc_howto_type *h
      default:
        abort ();
      case 0:
-- 
2.20.1


