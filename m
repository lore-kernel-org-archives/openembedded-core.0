Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5B50177BD2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:13 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id b12so7593553plm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=czKR+Z6UC3GqgwMNLQf42o1Jtg7zFryAbvy3UbuQ/l8=;
	b=Lt4VH7NlAHDKbhhXJfbacTWBAZj6sE/Py+qNxroDJ2wB7ItQjbiiHUZ3ivVIceh8Ii
	anRTK5NCtsALPcRHR2I/16bL5EN8zCaNVYiPQ/TqIM1nJw4IK+GKGoKJ/AVgJbn1lM0E
	OiYqp2WoxVbcxSpKL7CFCaFQZRr77azaWjstdiPyWYpub4rQtuXnyBNVzF5h3GqZAUnb
	JOvmFR+NWJNHrKMfxe0tUDRyVElSH5VsJ9BzYVc4qnkKyTcZxR3hE0G6EBSY6cVA7JmL
	au09X1AashKST7DWN5TjZ2oBRoyr6uB36FNDI5uY2iKL7RFqf3inmTDupDMn79ZTvsVX
	KvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=czKR+Z6UC3GqgwMNLQf42o1Jtg7zFryAbvy3UbuQ/l8=;
	b=ZJVRZ0BYd4iP83kUpmXZvi2lzm6/7MpgK0bvxfkBMXeHPNngYVmEW5+UZFomR26uOO
	NMB9Ej0UbPw6HqUzI0mDuR6gVhxzG4ORxkOGgpaUw3B5yfuCBP0BZmYJ4xC8RQGIszIZ
	1NSXezzDl2yZ3tXYOmNFVPc01B8+MyxC+gfNnqvJxVZnATYTlgJS6mGavjx4VnLsYSJj
	I4xvu+HlwkvX2fDO61Nm183yc8d20BUs4tksMpyf2jnIB37R5m4UrDNgcR3c1FHn+fiz
	A6ztc7KdDe2ekiU11Z/ZKLg0grRPapyW23Jopqkre6T40LQ9RW+bRvl4V3FdljE6fErK
	bMIQ==
X-Gm-Message-State: AJaThX4Q8M0Vx+jQMWbOfmbhF4CBlKo+ScKVa/6huhSb2JqcgAPvai8D
	3NihNcW8nnQnkjWFMlQyiMs=
X-Google-Smtp-Source: AGs4zMZjlzv6NN6aAzlRRPmfWlinrURDNNooE+XlRVLmwfDFWWyWz6VPi8WJ6Ue9h4DOPYn4/nOIwA==
X-Received: by 10.84.239.1 with SMTP id w1mr31332565plk.227.1511750115453;
	Sun, 26 Nov 2017 18:35:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:48 -0800
Message-Id: <1511750112-2263-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 02/26] binutils: Security Fix CVE-2017-7614
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:14 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   1 +
 .../binutils/binutils/CVE-2017-7614.patch          | 103 +++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-7614.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index f09bcdc..6ae091c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -44,6 +44,7 @@ SRC_URI = "\
      file://CVE-2017-7209.patch \
      file://CVE-2017-7210.patch \
      file://CVE-2017-7223.patch \
+     file://CVE-2017-7614.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-7614.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-7614.patch
new file mode 100644
index 0000000..be8631a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-7614.patch
@@ -0,0 +1,103 @@
+From ad32986fdf9da1c8748e47b8b45100398223dba8 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 4 Apr 2017 11:23:36 +0100
+Subject: [PATCH] Fix null pointer dereferences when using a link built with
+ clang.
+
+	PR binutils/21342
+	* elflink.c (_bfd_elf_define_linkage_sym): Prevent null pointer
+	dereference.
+	(bfd_elf_final_link): Only initialize the extended symbol index
+	section if there are extended symbol tables to list.
+
+Upstream-Status: Backport
+CVE: CVE-2017-7614
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog |  8 ++++++++
+ bfd/elflink.c | 35 +++++++++++++++++++++--------------
+ 2 files changed, 29 insertions(+), 14 deletions(-)
+
+Index: git/bfd/elflink.c
+===================================================================
+--- git.orig/bfd/elflink.c
++++ git/bfd/elflink.c
+@@ -119,15 +119,18 @@ _bfd_elf_define_linkage_sym (bfd *abfd,
+ 	 defined in shared libraries can't be overridden, because we
+ 	 lose the link to the bfd which is via the symbol section.  */
+       h->root.type = bfd_link_hash_new;
++      bh = &h->root;
+     }
++  else
++    bh = NULL;
+ 
+-  bh = &h->root;
+   bed = get_elf_backend_data (abfd);
+   if (!_bfd_generic_link_add_one_symbol (info, abfd, name, BSF_GLOBAL,
+ 					 sec, 0, NULL, FALSE, bed->collect,
+ 					 &bh))
+     return NULL;
+   h = (struct elf_link_hash_entry *) bh;
++  BFD_ASSERT (h != NULL);
+   h->def_regular = 1;
+   h->non_elf = 0;
+   h->root.linker_def = 1;
+@@ -11973,24 +11976,28 @@ bfd_elf_final_link (bfd *abfd, struct bf
+     {
+       /* Finish up and write out the symbol string table (.strtab)
+ 	 section.  */
+-      Elf_Internal_Shdr *symstrtab_hdr;
++      Elf_Internal_Shdr *symstrtab_hdr = NULL;
+       file_ptr off = symtab_hdr->sh_offset + symtab_hdr->sh_size;
+ 
+-      symtab_shndx_hdr = & elf_symtab_shndx_list (abfd)->hdr;
+-      if (symtab_shndx_hdr != NULL && symtab_shndx_hdr->sh_name != 0)
++      if (elf_symtab_shndx_list (abfd))
+ 	{
+-	  symtab_shndx_hdr->sh_type = SHT_SYMTAB_SHNDX;
+-	  symtab_shndx_hdr->sh_entsize = sizeof (Elf_External_Sym_Shndx);
+-	  symtab_shndx_hdr->sh_addralign = sizeof (Elf_External_Sym_Shndx);
+-	  amt = bfd_get_symcount (abfd) * sizeof (Elf_External_Sym_Shndx);
+-	  symtab_shndx_hdr->sh_size = amt;
++	  symtab_shndx_hdr = & elf_symtab_shndx_list (abfd)->hdr;
+ 
+-	  off = _bfd_elf_assign_file_position_for_section (symtab_shndx_hdr,
+-							   off, TRUE);
++	  if (symtab_shndx_hdr != NULL && symtab_shndx_hdr->sh_name != 0)
++	    {
++	      symtab_shndx_hdr->sh_type = SHT_SYMTAB_SHNDX;
++	      symtab_shndx_hdr->sh_entsize = sizeof (Elf_External_Sym_Shndx);
++	      symtab_shndx_hdr->sh_addralign = sizeof (Elf_External_Sym_Shndx);
++	      amt = bfd_get_symcount (abfd) * sizeof (Elf_External_Sym_Shndx);
++	      symtab_shndx_hdr->sh_size = amt;
+ 
+-	  if (bfd_seek (abfd, symtab_shndx_hdr->sh_offset, SEEK_SET) != 0
+-	      || (bfd_bwrite (flinfo.symshndxbuf, amt, abfd) != amt))
+-	    return FALSE;
++	      off = _bfd_elf_assign_file_position_for_section (symtab_shndx_hdr,
++							       off, TRUE);
++
++	      if (bfd_seek (abfd, symtab_shndx_hdr->sh_offset, SEEK_SET) != 0
++		  || (bfd_bwrite (flinfo.symshndxbuf, amt, abfd) != amt))
++		return FALSE;
++	    }
+ 	}
+ 
+       symstrtab_hdr = &elf_tdata (abfd)->strtab_hdr;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,11 @@
++2017-04-04  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21342
++       * elflink.c (_bfd_elf_define_linkage_sym): Prevent null pointer
++       dereference.
++       (bfd_elf_final_link): Only initialize the extended symbol index
++       section if there are extended symbol tables to list.
++
+ 2017-03-07  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 21224
-- 
2.7.4


