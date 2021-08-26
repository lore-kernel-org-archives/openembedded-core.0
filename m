Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.1012.1630020123677969481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 16:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DmkgF7Y6;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso3480229pjq.4
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 16:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bejd47J9mfzdUMS7fu2WCAzaCMABPQazOv7o6OzJSKY=;
        b=DmkgF7Y6Gqmj0sD8OrhqiJBqsSNuypw3LYgAH/dE3IPU12v6/jAMw/1zLs22F8d+8k
         zQyMkPZcQle6FJDgjTcSkCWPuqBXJJArlP4L+rtqunSqNOPAU62RGMZ2M8I05g6lFwnI
         t/Jz3M+eG7ixV4gid2v2WyRv+4NSRZJj94rKsJ+iNQnma+itlsbHgWDO15swqskrZ8pq
         uPyC+yYddJ1TP9+CIcK80m9DxeYfw07n1w1rYOexcZUPdxLhchNfu8oHYgAdLDcw+dTh
         pPqq81e5r8q1cLLHInhmQtqIy7M0txwO9iyPqT96XQYfrB5gqnB6GPENlY6nmezMaNRI
         n+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bejd47J9mfzdUMS7fu2WCAzaCMABPQazOv7o6OzJSKY=;
        b=n3ibgcup23gKYjcpisfV6ulWixznUm32W8pN7lOY3PzL0IXrAUAfrlqi0diKkQL9nF
         Hp2V5tLgsEz7h72wpOPHPnIkr0D2CWNgJFK0P3kxKVpCuhC88gJmYFwt2KhoE1KJ1AI+
         079agf5yJS882ENwvh7VDQXiMv9gYkX++9xb5pQhGbrh5FEAKEP535fvpDqvrqyGWzqz
         hP3FF2zpPg6odwZLhFoe1cLMQmzBuEKjx6UvOQTWyTiFzykpXXrJxibEIpCcOG0hq4aL
         0MhWZvE+OWJkq8BALbBzNu3BA+vzDUxlOMMZ6Ryu5FtJ+k6gjes0c6q1v8K90eljNzTj
         PIAA==
X-Gm-Message-State: AOAM530MC+qJQ1bBaofSpen57RL9p3lLc1td9vSjb0wc+vgQvSLFVJ+/
	45Io5GTMdJMAVhf1eSs6Tma3wllmcjw=
X-Google-Smtp-Source: ABdhPJwDqGU/YS8L278/7U09kPC7/aw2CUSFLFjvUY0LvQSgOX28Oz7Smzpynl1sKbvAbypfzPSoLQ==
X-Received: by 2002:a17:90a:b795:: with SMTP id m21mr7035005pjr.143.1630020122939;
        Thu, 26 Aug 2021 16:22:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:fe04:ee7:4da9:eb01])
        by smtp.gmail.com with ESMTPSA id b3sm4158626pfi.179.2021.08.26.16.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 16:22:02 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 2/2] binutils: Security fix for CVE-2020-16593
Date: Thu, 26 Aug 2021 16:22:00 -0700
Message-Id: <20210826232200.2000257-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826232200.2000257-1-akuster808@gmail.com>
References: <20210826232200.2000257-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source:  https://sourceware.org/git/binutils-gdb.git
MR: 112801
Type: Security Fix
Disposition: Backport from https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=aec72fda3b320c36eb99fc1c4cf95b10fc026729
ChangeID: 470b309f4859eecdcc837add2bf756484ad94ee5
Description:

Fixed up for 2.34 context

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2020-16593.patch    | 204 ++++++++++++++++++
 2 files changed, 205 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-16593.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 1c1118df54..6104bec591 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -49,5 +49,6 @@ SRC_URI = "\
      file://CVE-2021-20197.patch \
      file://CVE-2021-3487.patch \
      file://CVE-2021-3549.patch \
+     file://CVE-2020-16593.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-16593.patch b/meta/recipes-devtools/binutils/binutils/CVE-2020-16593.patch
new file mode 100644
index 0000000000..cbe4a50507
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2020-16593.patch
@@ -0,0 +1,204 @@
+From aec72fda3b320c36eb99fc1c4cf95b10fc026729 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 16 Apr 2020 17:49:38 +0930
+Subject: [PATCH] PR25827, Null pointer dereferencing in scan_unit_for_symbols
+
+    PR 25827
+    * dwarf2.c (scan_unit_for_symbols): Wrap overlong lines.  Don't
+    strdup(0).
+
+Upstream-Status: Backport
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=aec72fda3b320c36eb99fc1c4cf95b10fc026729
+CVE: CVE-2020-16593 
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -295,12 +295,12 @@ struct comp_unit
+ /* This data structure holds the information of an abbrev.  */
+ struct abbrev_info
+ {
+-  unsigned int number;		/* Number identifying abbrev.  */
+-  enum dwarf_tag tag;		/* DWARF tag.  */
+-  int has_children;		/* Boolean.  */
+-  unsigned int num_attrs;	/* Number of attributes.  */
+-  struct attr_abbrev *attrs;	/* An array of attribute descriptions.  */
+-  struct abbrev_info *next;	/* Next in chain.  */
++  unsigned int         number;     /* Number identifying abbrev.  */
++  enum dwarf_tag       tag;        /* DWARF tag.  */
++  bfd_boolean          has_children;   /* TRUE if the abbrev has children.  */
++  unsigned int         num_attrs;  /* Number of attributes.  */
++  struct attr_abbrev * attrs;      /* An array of attribute descriptions.  */
++  struct abbrev_info * next;       /* Next in chain.  */
+ };
+ 
+ struct attr_abbrev
+@@ -1487,6 +1487,8 @@ struct varinfo
+ {
+   /* Pointer to previous variable in list of all variables */
+   struct varinfo *prev_var;
++  /* The offset of the varinfo from the start of the unit.  */
++  bfd_uint64_t unit_offset;
+   /* Source location file name */
+   char *file;
+   /* Source location line number */
+@@ -1497,7 +1499,7 @@ struct varinfo
+   /* Where the symbol is defined */
+   asection *sec;
+   /* Is this a stack variable? */
+-  unsigned int stack: 1;
++  bfd_boolean stack;
+ };
+ 
+ /* Return TRUE if NEW_LINE should sort after LINE.  */
+@@ -2871,7 +2873,7 @@ lookup_symbol_in_variable_table (struct
+   struct varinfo* each;
+ 
+   for (each = unit->variable_table; each; each = each->prev_var)
+-    if (each->stack == 0
++    if (! each->stack
+ 	&& each->file != NULL
+ 	&& each->name != NULL
+ 	&& each->addr == addr
+@@ -3166,6 +3168,20 @@ read_rangelist (struct comp_unit *unit,
+   return TRUE;
+ }
+ 
++static struct varinfo *
++lookup_var_by_offset (bfd_uint64_t offset, struct varinfo * table)
++{
++  while (table)
++    {
++      if (table->unit_offset == offset)
++   return table;
++      table = table->prev_var;
++    }
++
++  return NULL;
++}
++
++
+ /* DWARF2 Compilation unit functions.  */
+ 
+ /* Scan over each die in a comp. unit looking for functions to add
+@@ -3202,6 +3218,9 @@ scan_unit_for_symbols (struct comp_unit
+       bfd_vma low_pc = 0;
+       bfd_vma high_pc = 0;
+       bfd_boolean high_pc_relative = FALSE;
++      bfd_uint64_t current_offset;
++       
++      current_offset = info_ptr - unit->info_ptr_unit;
+ 
+       /* PR 17512: file: 9f405d9d.  */
+       if (info_ptr >= info_ptr_end)
+@@ -3234,12 +3253,13 @@ scan_unit_for_symbols (struct comp_unit
+ 	  goto fail;
+ 	}
+ 
+-      var = NULL;
+       if (abbrev->tag == DW_TAG_subprogram
+ 	  || abbrev->tag == DW_TAG_entry_point
+ 	  || abbrev->tag == DW_TAG_inlined_subroutine)
+ 	{
+ 	  bfd_size_type amt = sizeof (struct funcinfo);
++
++      var = NULL;
+ 	  func = (struct funcinfo *) bfd_zalloc (abfd, amt);
+ 	  if (func == NULL)
+ 	    goto fail;
+@@ -3268,13 +3288,15 @@ scan_unit_for_symbols (struct comp_unit
+ 	      if (var == NULL)
+ 		goto fail;
+ 	      var->tag = abbrev->tag;
+-	      var->stack = 1;
++	      var->stack = TRUE;
+ 	      var->prev_var = unit->variable_table;
+ 	      unit->variable_table = var;
++          var->unit_offset = current_offset;
+ 	      /* PR 18205: Missing debug information can cause this
+ 		 var to be attached to an already cached unit.  */
+ 	    }
+-
++	  else
++	    var = NULL;
+ 	  /* No inline function in scope at this nesting level.  */
+ 	  nested_funcs[nesting_level].func = 0;
+ 	}
+@@ -3362,6 +3384,33 @@ scan_unit_for_symbols (struct comp_unit
+ 	    {
+ 	      switch (attr.name)
+ 		{
++       case DW_AT_specification:
++         if (attr.u.val)
++           {
++             struct varinfo * spec_var;
++
++             spec_var = lookup_var_by_offset (attr.u.val,
++                              unit->variable_table);
++             if (spec_var == NULL)
++           {
++             _bfd_error_handler (_("DWARF error: could not find "
++                       "variable specification "
++                       "at offset %lx"),
++                         (unsigned long) attr.u.val);
++             break;
++           }
++
++             if (var->name == NULL)
++           var->name = spec_var->name;
++             if (var->file == NULL && spec_var->file != NULL)
++           var->file = strdup (spec_var->file);
++             if (var->line == 0)
++           var->line = spec_var->line;
++             if (var->sec == NULL)
++           var->sec = spec_var->sec;
++           }
++         break;
++
+ 		case DW_AT_name:
+ 		  if (is_str_attr (attr.form))
+ 		    var->name = attr.u.str;
+@@ -3378,7 +3427,7 @@ scan_unit_for_symbols (struct comp_unit
+ 
+ 		case DW_AT_external:
+ 		  if (attr.u.val != 0)
+-		    var->stack = 0;
++		    var->stack = FALSE;
+ 		  break;
+ 
+ 		case DW_AT_location:
+@@ -3392,7 +3441,7 @@ scan_unit_for_symbols (struct comp_unit
+ 		      if (attr.u.blk->data != NULL
+ 			  && *attr.u.blk->data == DW_OP_addr)
+ 			{
+-			  var->stack = 0;
++			  var->stack = FALSE;
+ 
+ 			  /* Verify that DW_OP_addr is the only opcode in the
+ 			     location, in which case the block size will be 1
+@@ -3888,7 +3937,7 @@ comp_unit_hash_info (struct dwarf2_debug
+        each_var = each_var->prev_var)
+     {
+       /* Skip stack vars and vars with no files or names.  */
+-      if (each_var->stack == 0
++      if (! each_var->stack
+ 	  && each_var->file != NULL
+ 	  && each_var->name != NULL)
+ 	/* There is no need to copy name string into hash table as
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2020-04-16  Alan Modra  <amodra@gmail.com>
++
++       PR 25827
++       * dwarf2.c (scan_unit_for_symbols): Wrap overlong lines.  Don't
++       strdup(0).
++
+ 2020-02-19  H.J. Lu  <hongjiu.lu@intel.com>
+ 
+ 	PR binutils/25355
-- 
2.25.1

