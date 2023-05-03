Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3567C77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 11:55:29 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.17125.1683114924836440424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 04:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qjRU8AFk;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5208be24dcbso3449885a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 04:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683114924; x=1685706924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=szWeOq9TBcPqPuBpAkQe5FTA3N4xld7UOy7URpea5M0=;
        b=qjRU8AFksgzzRQysL1ltJgOhtk9sbdNyWblVZ4MxbEEKMg7fEm/Q7lSgMOG77e9Il9
         21Nq/sWt5GMXkL/0RDgm29SaySbByhWfRVKH27rMWDI5G1Pzsu0DkMTbLsgE8slvUwNF
         zMMMwbnxwllNYKFINC20AozpS2grPss8HrF/CxU1o+zB+HTqEBY9kGsJkAlwe2KkrP+E
         TEU+PDTRqtk7TSXpRaGFKBWVnVldFtVnxSWSxJDlvLeAfMbCuLX2BWt5zWvQpWlEWCoH
         c63CJrI+10tgHsX455V9Jvierjaj6pqWz3GxRXqpCglhCnJhE4H7AT+TFfQDHc3aMVNX
         Wpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683114924; x=1685706924;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szWeOq9TBcPqPuBpAkQe5FTA3N4xld7UOy7URpea5M0=;
        b=QfrAR59yg4vAiCb2yp5nkGwnYqDUpUGH6EN6oo6CbeUc3CnY0/ja4RmTN7Wz6qyCqG
         cZnWiBFVX280qyc++CoQn8Tzq7O8xcm54CME7a6BzxHRe6wgxMM/xjMeGP8n/85eAWuW
         Szggt1uCeSwKwDrEFOTnIA/ImXg3s7piihptd1lJ3cgR1vub6ttixiIJjQQ3TtRdMReb
         fBlSk5kHSbHm/bwZQPRpf+jTXiBT8IhcxFDoudfBfWjhvNO+dnfcSY92Dx3X4Mj5Psuo
         KyHzsF/ir/gtGB0mVwhDA9wRhQvKv+u88cI2cc6uSV09PUbN/EWmPX+rQa00oZ10uqI3
         IP+w==
X-Gm-Message-State: AC+VfDwW7CIgU71q2gKzPBPwX4hAlRvz+AfpNWbueaIN+DChBJdOs597
	BZxci0ettox/jkJyifnG+dJWXuKCgkKCvwvH
X-Google-Smtp-Source: ACHHUZ7NmjvJ/ZXcC/rGO90bwdmkBBJ8wXy6USoXS5a0KmlVcUrjaIuWl6+frqXuoeZ8KODUk351SQ==
X-Received: by 2002:a05:6a20:2d0a:b0:ef:3e60:3f46 with SMTP id g10-20020a056a202d0a00b000ef3e603f46mr21611499pzl.31.1683114923819;
        Wed, 03 May 2023 04:55:23 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id y10-20020a63ce0a000000b004ff6b744248sm19967208pgf.48.2023.05.03.04.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 04:55:23 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH] binutils : Fix CVE-2023-25585
Date: Wed,  3 May 2023 17:25:15 +0530
Message-Id: <20230503115515.4170061-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 11:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180811

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=65cf035b8dc1df5d8020e0b1449514a3c42933e7]

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0023-CVE-2023-25585.patch        | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2023-25585.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index bf44e6c762..93ded80386 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -50,5 +50,6 @@ SRC_URI = "\
      file://0021-CVE-2023-1579-2.patch \
      file://0021-CVE-2023-1579-3.patch \
      file://0021-CVE-2023-1579-4.patch \
+     file://0023-CVE-2023-25585.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0023-CVE-2023-25585.patch b/meta/recipes-devtools/binutils/binutils/0023-CVE-2023-25585.patch
new file mode 100644
index 0000000000..e31a027b9f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0023-CVE-2023-25585.patch
@@ -0,0 +1,54 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 12 Dec 2022 08:31:08 +0000 (+1030)
+Subject: PR29892, Field file_table of struct module is uninitialized
+X-Git-Tag: gdb-13-branchpoint~86
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=65cf035b8dc1df5d8020e0b1449514a3c42933e7
+
+PR29892, Field file_table of struct module is uninitialized
+
+	PR 29892
+	* vms-alphs.c (new_module): Use bfd_zmalloc to alloc file_table.
+	(parse_module): Rewrite file_table reallocation code and clear.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=65cf035b8dc1df5d8020e0b1449514a3c42933e7]
+
+CVE: CVE-2023-25585
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/bfd/vms-alpha.c b/bfd/vms-alpha.c
+index 3b63259cc81..6ee7060b0b2 100644
+--- a/bfd/vms-alpha.c
++++ b/bfd/vms-alpha.c
+@@ -4337,7 +4337,7 @@ new_module (bfd *abfd)
+     = (struct module *) bfd_zalloc (abfd, sizeof (struct module));
+   module->file_table_count = 16; /* Arbitrary.  */
+   module->file_table
+-    = bfd_malloc (module->file_table_count * sizeof (struct fileinfo));
++    = bfd_zmalloc (module->file_table_count * sizeof (struct fileinfo));
+   return module;
+ }
+
+@@ -4520,15 +4520,18 @@ parse_module (bfd *abfd, struct module *module, unsigned char *ptr,
+		       src_ptr + DST_S_B_SRC_DF_FILENAME,
+		       ptr + rec_length - (src_ptr + DST_S_B_SRC_DF_FILENAME));
+
+-		    while (fileid >= module->file_table_count)
++		    if (fileid >= module->file_table_count)
+		      {
+-			module->file_table_count *= 2;
++			unsigned int old_count = module->file_table_count;
++			module->file_table_count += fileid;
+			module->file_table
+			  = bfd_realloc_or_free (module->file_table,
+						 module->file_table_count
+						 * sizeof (struct fileinfo));
+			if (module->file_table == NULL)
+			  return false;
++			memset (module->file_table + old_count, 0,
++				fileid * sizeof (struct fileinfo));
+		      }
+
+		    module->file_table [fileid].name = filename;
-- 
2.34.1


