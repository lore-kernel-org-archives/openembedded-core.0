Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FC6C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 10:52:19 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.15916.1683111138479621439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 03:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=kNZcn3pr;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64115e652eeso3861513b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 03:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683111138; x=1685703138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88uY1iH6UYq9Pzt3KorT0PNvL2pOYhQdKqkHhwsSb0o=;
        b=kNZcn3pr5InvBah99d85l12EIKs8IWknf09BwXDRE2AOgtdJhCwbQO2B2J+xa5CWQ+
         obPB3PFudFm/XGY4EgkNflsEG4c4cQrZf60eOX5JBbMzWnp6iNhpH+DOfnu441Crp12g
         1UNIiM+J5IH2EHEI+ELXjGWOyn2nS+4xRBiGLfcju9KKGj5j/x6UE3w6rk2HikmKnoWL
         iyoFesx/zBAUS4+/2NPpVzm6xcT+BWkNhcqhmUMF05Rdcj+bZQ5ucnO4qrgMmX+I4oH2
         VeSy6yIyXIuPVHOTvS5V0irQsP5Ou0yEpLVu6LhDNbbf0wcgQoD7Bfxj0o5IgY+XcNKb
         GatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683111138; x=1685703138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88uY1iH6UYq9Pzt3KorT0PNvL2pOYhQdKqkHhwsSb0o=;
        b=bJyJOjwkIbpvJmYMVDRGES0F7sfIwn2+29nXssaobeEko1hFaL0DcJI/Zqtm+kj93m
         nRrp/CO99xyHO0i3/l+y0Q5sZdIyePaeKufZO4FlaY7kkQWfrsuJvzcytSf0ZyIWeq1x
         V1D+Yz2OrWJbA40u13M4i9q74odWGqoxg8Wj+R7KH3l6N8lykXAZBFGtPVyge4grKo/5
         oh4RrmANZy0nMoFArtXQEUzWzU8K2GNb01QJiwAaUpy7XedL9xj8BtIHCODJK+tX46s/
         04ETSrzMe8qKhf9XQyLJpVikRh8vcWlkrp05w68BDbN32LDW5zOVFZ5X6LXvXpm3HyMn
         qPWw==
X-Gm-Message-State: AC+VfDwkkEpdromawjVU9mYIScdifY5QZOrqNK+DRwbuQqzZNq3diEB0
	L3cvZ2JQqNdYbUUsgVQLv33ibCcTd+9V2w==
X-Google-Smtp-Source: ACHHUZ6ro0qpQEb3F5YnISJ5peChShgxS/XDRazZYOmeKlPjtvHktlkd40CNr7aRQ5mitH1KUSPv3Q==
X-Received: by 2002:a05:6a00:114a:b0:594:1f1c:3d3a with SMTP id b10-20020a056a00114a00b005941f1c3d3amr1976860pfm.15.1683111137383;
        Wed, 03 May 2023 03:52:17 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id e17-20020a635011000000b0050f9b7e64fasm19922410pgb.77.2023.05.03.03.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:52:16 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH] binutils : Fix CVE-2023-25584
Date: Wed,  3 May 2023 16:22:09 +0530
Message-Id: <20230503105209.4169068-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 10:52:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180807

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=77c225bdeb410cf60da804879ad41622f5f1aa44]

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
---
 .../binutils/binutils-2.38.inc                |   3 +
 .../binutils/0022-CVE-2023-25584-1.patch      |  56 ++
 .../binutils/0022-CVE-2023-25584-2.patch      |  38 ++
 .../binutils/0022-CVE-2023-25584-3.patch      | 534 ++++++++++++++++++
 4 files changed, 631 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index bf44e6c762..69fb8539ba 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -50,5 +50,8 @@ SRC_URI = "\
      file://0021-CVE-2023-1579-2.patch \
      file://0021-CVE-2023-1579-3.patch \
      file://0021-CVE-2023-1579-4.patch \
+     file://0022-CVE-2023-25584-1.patch \
+     file://0022-CVE-2023-25584-2.patch \
+     file://0022-CVE-2023-25584-3.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-1.patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-1.patch
new file mode 100644
index 0000000000..990243f5c9
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-1.patch
@@ -0,0 +1,56 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 17 Mar 2022 09:35:39 +0000 (+1030)
+Subject: ubsan: Null dereference in parse_module
+X-Git-Tag: gdb-12.1-release~59
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c9178f285acf19e066be8367185d52837161b0a2
+
+ubsan: Null dereference in parse_module
+
+	* vms-alpha.c (parse_module): Sanity check that DST__K_RTNBEG
+	has set module->func_table for DST__K_RTNEND.  Check return
+	of bfd_zalloc.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c9178f285acf19e066be8367185d52837161b0a2]
+
+CVE: CVE-2023-25584
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
+index 4a92574c850..1129c98f0e2 100644
+--- a/bfd/vms-alpha.c
++++ b/bfd/vms-alpha.c
+@@ -4352,9 +4352,13 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+   /* Initialize tables with zero element.  */
+   curr_srec = (struct srecinfo *) bfd_zalloc (abfd, sizeof (struct srecinfo));
++  if (!curr_srec)
++    return false;
+   module->srec_table = curr_srec;
+
+   curr_line = (struct lineinfo *) bfd_zalloc (abfd, sizeof (struct lineinfo));
++  if (!curr_line)
++    return false;
+   module->line_table = curr_line;
+
+   while (length == -1 || ptr < maxptr)
+@@ -4389,6 +4393,8 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+	case DST__K_RTNBEG:
+	  funcinfo = (struct funcinfo *)
+	    bfd_zalloc (abfd, sizeof (struct funcinfo));
++	  if (!funcinfo)
++	    return false;
+	  funcinfo->name
+	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_RTNBEG_NAME,
+					    maxptr - (ptr + DST_S_B_RTNBEG_NAME));
+@@ -4401,6 +4407,8 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+	  break;
+
+	case DST__K_RTNEND:
++	  if (!module->func_table)
++	    return false;
+	  module->func_table->high = module->func_table->low
+	    + bfd_getl32 (ptr + DST_S_L_RTNEND_SIZE) - 1;
+
diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-2.patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-2.patch
new file mode 100644
index 0000000000..f4c5ed2aff
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-2.patch
@@ -0,0 +1,38 @@
+From da928f639002002dfc649ed9f50492d5d6cb4cee Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 5 Dec 2022 11:11:44 +0000
+Subject: [PATCH] Fix an illegal memory access when parsing a corrupt VMS Alpha
+ file.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix an illegal memory access when parsing a corrupt VMS Alpha file.
+
+        PR 29848
+        * vms-alpha.c (parse_module): Fix potential out of bounds memory
+        access.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=942fa4fb32738ecbb447546d54f1e5f0312d2ed4]
+
+CVE: CVE-2023-25584
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+ bfd/vms-alpha.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
+index c548722c..53b3f1bf 100644
+--- a/bfd/vms-alpha.c
++++ b/bfd/vms-alpha.c
+@@ -4361,7 +4361,7 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+     return false;
+   module->line_table = curr_line;
+
+-  while (length == -1 || ptr < maxptr)
++  while (length == -1 || (ptr + 3) < maxptr)
+     {
+       /* The first byte is not counted in the recorded length.  */
+       int rec_length = bfd_getl16 (ptr) + 1;
diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch
new file mode 100644
index 0000000000..abe501e570
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2023-25584-3.patch
@@ -0,0 +1,534 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 12 Dec 2022 07:58:49 +0000 (+1030)
+Subject: Lack of bounds checking in vms-alpha.c parse_module
+X-Git-Tag: gdb-13-branchpoint~87
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=77c225bdeb410cf60da804879ad41622f5f1aa44
+
+Lack of bounds checking in vms-alpha.c parse_module
+
+	PR 29873
+	PR 29874
+	PR 29875
+	PR 29876
+	PR 29877
+	PR 29878
+	PR 29879
+	PR 29880
+	PR 29881
+	PR 29882
+	PR 29883
+	PR 29884
+	PR 29885
+	PR 29886
+	PR 29887
+	PR 29888
+	PR 29889
+	PR 29890
+	PR 29891
+	* vms-alpha.c (parse_module): Make length param bfd_size_type.
+	Delete length == -1 checks.  Sanity check record_length.
+	Sanity check DST__K_MODBEG, DST__K_RTNBEG, DST__K_RTNEND lengths.
+	Sanity check DST__K_SOURCE and DST__K_LINE_NUM elements
+	before accessing.
+	(build_module_list): Pass dst_section size to parse_module.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=77c225bdeb410cf60da804879ad41622f5f1aa44]
+
+CVE: CVE-2023-25584
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
+index c0eb5bc5a2a..3b63259cc81 100644
+--- a/bfd/vms-alpha.c
++++ b/bfd/vms-alpha.c
+@@ -4340,7 +4340,7 @@ new_module (bfd *abfd)
+
+ static bool
+ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+-	      int length)
++	      bfd_size_type length)
+ {
+   unsigned char *maxptr = ptr + length;
+   unsigned char *src_ptr, *pcl_ptr;
+@@ -4361,7 +4361,7 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+     return false;
+   module->line_table = curr_line;
+
+-  while (length == -1 || (ptr + 3) < maxptr)
++  while (ptr + 3 < maxptr)
+     {
+       /* The first byte is not counted in the recorded length.  */
+       int rec_length = bfd_getl16 (ptr) + 1;
+@@ -4369,15 +4369,19 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+       vms_debug2 ((2, "DST record: leng %d, type %d\n", rec_length, rec_type));
+
+-      if (length == -1 && rec_type == DST__K_MODEND)
++      if (rec_length > maxptr - ptr)
++	break;
++      if (rec_type == DST__K_MODEND)
+	break;
+
+       switch (rec_type)
+	{
+	case DST__K_MODBEG:
++	  if (rec_length <= DST_S_B_MODBEG_NAME)
++	    break;
+	  module->name
+	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_MODBEG_NAME,
+-					    maxptr - (ptr + DST_S_B_MODBEG_NAME));
++					    rec_length - DST_S_B_MODBEG_NAME);
+
+	  curr_pc = 0;
+	  prev_pc = 0;
+@@ -4391,13 +4395,15 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+	  break;
+
+	case DST__K_RTNBEG:
++	  if (rec_length <= DST_S_B_RTNBEG_NAME)
++	    break;
+	  funcinfo = (struct funcinfo *)
+	    bfd_zalloc (abfd, sizeof (struct funcinfo));
+	  if (!funcinfo)
+	    return false;
+	  funcinfo->name
+	    = _bfd_vms_save_counted_string (abfd, ptr + DST_S_B_RTNBEG_NAME,
+-					    maxptr - (ptr + DST_S_B_RTNBEG_NAME));
++					    rec_length - DST_S_B_RTNBEG_NAME);
+	  funcinfo->low = bfd_getl32 (ptr + DST_S_L_RTNBEG_ADDRESS);
+	  funcinfo->next = module->func_table;
+	  module->func_table = funcinfo;
+@@ -4407,6 +4413,8 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+	  break;
+
+	case DST__K_RTNEND:
++	  if (rec_length < DST_S_L_RTNEND_SIZE + 4)
++	    break;
+	  if (!module->func_table)
+	    return false;
+	  module->func_table->high = module->func_table->low
+@@ -4439,10 +4447,63 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+	  vms_debug2 ((3, "source info\n"));
+
+-	  while (src_ptr < ptr + rec_length)
++	  while (src_ptr - ptr < rec_length)
+	    {
+	      int cmd = src_ptr[0], cmd_length, data;
+
++	      switch (cmd)
++		{
++		case DST__K_SRC_DECLFILE:
++		  if (src_ptr - ptr + DST_S_B_SRC_DF_LENGTH >= rec_length)
++		    cmd_length = 0x10000;
++		  else
++		    cmd_length = src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
++		  break;
++
++		case DST__K_SRC_DEFLINES_B:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SRC_DEFLINES_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SRC_INCRLNUM_B:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SRC_SETFILE:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SRC_SETLNUM_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SRC_SETLNUM_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SRC_SETREC_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SRC_SETREC_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SRC_FORMFEED:
++		  cmd_length = 1;
++		  break;
++
++		default:
++		  cmd_length = 2;
++		  break;
++		}
++
++	      if (src_ptr - ptr + cmd_length > rec_length)
++		break;
++
+	      switch (cmd)
+		{
+		case DST__K_SRC_DECLFILE:
+@@ -4467,7 +4528,6 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+		    module->file_table [fileid].name = filename;
+		    module->file_table [fileid].srec = 1;
+-		    cmd_length = src_ptr[DST_S_B_SRC_DF_LENGTH] + 2;
+		    vms_debug2 ((4, "DST_S_C_SRC_DECLFILE: %d, %s\n",
+				 fileid, module->file_table [fileid].name));
+		  }
+@@ -4484,7 +4544,6 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  srec->sfile = curr_srec->sfile;
+		  curr_srec->next = srec;
+		  curr_srec = srec;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_B: %d\n", data));
+		  break;
+
+@@ -4499,14 +4558,12 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  srec->sfile = curr_srec->sfile;
+		  curr_srec->next = srec;
+		  curr_srec = srec;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST_S_C_SRC_DEFLINES_W: %d\n", data));
+		  break;
+
+		case DST__K_SRC_INCRLNUM_B:
+		  data = src_ptr[DST_S_B_SRC_UNSBYTE];
+		  curr_srec->line += data;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST_S_C_SRC_INCRLNUM_B: %d\n", data));
+		  break;
+
+@@ -4514,21 +4571,18 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
+		  curr_srec->sfile = data;
+		  curr_srec->srec = module->file_table[data].srec;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETFILE: %d\n", data));
+		  break;
+
+		case DST__K_SRC_SETLNUM_L:
+		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
+		  curr_srec->line = data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_L: %d\n", data));
+		  break;
+
+		case DST__K_SRC_SETLNUM_W:
+		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
+		  curr_srec->line = data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETLNUM_W: %d\n", data));
+		  break;
+
+@@ -4536,7 +4590,6 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  data = bfd_getl32 (src_ptr + DST_S_L_SRC_UNSLONG);
+		  curr_srec->srec = data;
+		  module->file_table[curr_srec->sfile].srec = data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETREC_L: %d\n", data));
+		  break;
+
+@@ -4544,19 +4597,16 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  data = bfd_getl16 (src_ptr + DST_S_W_SRC_UNSWORD);
+		  curr_srec->srec = data;
+		  module->file_table[curr_srec->sfile].srec = data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST_S_C_SRC_SETREC_W: %d\n", data));
+		  break;
+
+		case DST__K_SRC_FORMFEED:
+-		  cmd_length = 1;
+		  vms_debug2 ((4, "DST_S_C_SRC_FORMFEED\n"));
+		  break;
+
+		default:
+		  _bfd_error_handler (_("unknown source command %d"),
+				      cmd);
+-		  cmd_length = 2;
+		  break;
+		}
+
+@@ -4569,18 +4619,114 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+
+	  vms_debug2 ((3, "line info\n"));
+
+-	  while (pcl_ptr < ptr + rec_length)
++	  while (pcl_ptr - ptr < rec_length)
+	    {
+	      /* The command byte is signed so we must sign-extend it.  */
+	      int cmd = ((signed char *)pcl_ptr)[0], cmd_length, data;
+
++	      switch (cmd)
++		{
++		case DST__K_DELTA_PC_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_DELTA_PC_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_INCR_LINUM:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_INCR_LINUM_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_INCR_LINUM_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SET_LINUM_INCR:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SET_LINUM_INCR_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_RESET_LINUM_INCR:
++		  cmd_length = 1;
++		  break;
++
++		case DST__K_BEG_STMT_MODE:
++		  cmd_length = 1;
++		  break;
++
++		case DST__K_END_STMT_MODE:
++		  cmd_length = 1;
++		  break;
++
++		case DST__K_SET_LINUM_B:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SET_LINUM:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SET_LINUM_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SET_PC:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_SET_PC_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_SET_PC_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SET_STMTNUM:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_TERM:
++		  cmd_length = 2;
++		  break;
++
++		case DST__K_TERM_W:
++		  cmd_length = 3;
++		  break;
++
++		case DST__K_TERM_L:
++		  cmd_length = 5;
++		  break;
++
++		case DST__K_SET_ABS_PC:
++		  cmd_length = 5;
++		  break;
++
++		default:
++		  if (cmd <= 0)
++		    cmd_length = 1;
++		  else
++		    cmd_length = 2;
++		  break;
++		}
++
++	      if (pcl_ptr - ptr + cmd_length > rec_length)
++		break;
++
+	      switch (cmd)
+		{
+		case DST__K_DELTA_PC_W:
+		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+		  curr_pc += data;
+		  curr_linenum += 1;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST__K_DELTA_PC_W: %d\n", data));
+		  break;
+
+@@ -4588,131 +4734,111 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_pc += data;
+		  curr_linenum += 1;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_DELTA_PC_L: %d\n", data));
+		  break;
+
+		case DST__K_INCR_LINUM:
+		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
+		  curr_linenum += data;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST__K_INCR_LINUM: %d\n", data));
+		  break;
+
+		case DST__K_INCR_LINUM_W:
+		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+		  curr_linenum += data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST__K_INCR_LINUM_W: %d\n", data));
+		  break;
+
+		case DST__K_INCR_LINUM_L:
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_linenum += data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_INCR_LINUM_L: %d\n", data));
+		  break;
+
+		case DST__K_SET_LINUM_INCR:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_LINUM_INCR");
+-		  cmd_length = 2;
+		  break;
+
+		case DST__K_SET_LINUM_INCR_W:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_LINUM_INCR_W");
+-		  cmd_length = 3;
+		  break;
+
+		case DST__K_RESET_LINUM_INCR:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_RESET_LINUM_INCR");
+-		  cmd_length = 1;
+		  break;
+
+		case DST__K_BEG_STMT_MODE:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_BEG_STMT_MODE");
+-		  cmd_length = 1;
+		  break;
+
+		case DST__K_END_STMT_MODE:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_END_STMT_MODE");
+-		  cmd_length = 1;
+		  break;
+
+		case DST__K_SET_LINUM_B:
+		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
+		  curr_linenum = data;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST__K_SET_LINUM_B: %d\n", data));
+		  break;
+
+		case DST__K_SET_LINUM:
+		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+		  curr_linenum = data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST__K_SET_LINE_NUM: %d\n", data));
+		  break;
+
+		case DST__K_SET_LINUM_L:
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_linenum = data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_SET_LINUM_L: %d\n", data));
+		  break;
+
+		case DST__K_SET_PC:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_PC");
+-		  cmd_length = 2;
+		  break;
+
+		case DST__K_SET_PC_W:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_PC_W");
+-		  cmd_length = 3;
+		  break;
+
+		case DST__K_SET_PC_L:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_PC_L");
+-		  cmd_length = 5;
+		  break;
+
+		case DST__K_SET_STMTNUM:
+		  _bfd_error_handler
+		    (_("%s not implemented"), "DST__K_SET_STMTNUM");
+-		  cmd_length = 2;
+		  break;
+
+		case DST__K_TERM:
+		  data = pcl_ptr[DST_S_B_PCLINE_UNSBYTE];
+		  curr_pc += data;
+-		  cmd_length = 2;
+		  vms_debug2 ((4, "DST__K_TERM: %d\n", data));
+		  break;
+
+		case DST__K_TERM_W:
+		  data = bfd_getl16 (pcl_ptr + DST_S_W_PCLINE_UNSWORD);
+		  curr_pc += data;
+-		  cmd_length = 3;
+		  vms_debug2 ((4, "DST__K_TERM_W: %d\n", data));
+		  break;
+
+		case DST__K_TERM_L:
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_pc += data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_TERM_L: %d\n", data));
+		  break;
+
+		case DST__K_SET_ABS_PC:
+		  data = bfd_getl32 (pcl_ptr + DST_S_L_PCLINE_UNSLONG);
+		  curr_pc = data;
+-		  cmd_length = 5;
+		  vms_debug2 ((4, "DST__K_SET_ABS_PC: 0x%x\n", data));
+		  break;
+
+@@ -4721,15 +4847,11 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		    {
+		      curr_pc -= cmd;
+		      curr_linenum += 1;
+-		      cmd_length = 1;
+		      vms_debug2 ((4, "bump pc to 0x%lx and line to %d\n",
+				   (unsigned long)curr_pc, curr_linenum));
+		    }
+		  else
+-		    {
+-		      _bfd_error_handler (_("unknown line command %d"), cmd);
+-		      cmd_length = 2;
+-		    }
++		    _bfd_error_handler (_("unknown line command %d"), cmd);
+		  break;
+		}
+
+@@ -4859,7 +4981,8 @@ build_module_list (bfd *abfd)
+	return NULL;
+
+       module = new_module (abfd);
+-      if (!parse_module (abfd, module, PRIV (dst_section)->contents, -1))
++      if (!parse_module (abfd, module, PRIV (dst_section)->contents,
++			 PRIV (dst_section)->size))
+	return NULL;
+       list = module;
+     }
-- 
2.34.1


