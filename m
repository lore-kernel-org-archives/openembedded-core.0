Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACACEC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 09:04:05 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.45038.1683191044750042777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 02:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hrVhXePx;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63b62d2f729so228773b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683191044; x=1685783044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xT0i14Q7bHIjJ/18GSTqsx9FseIC1b8rPmsF3cUY/24=;
        b=hrVhXePx5vzRh7SwEpaEzOiLB1Yr4AR3fabVIfanLyokfCEf5jh40Eo4GYK3/2tFgE
         96cqv0vKAAPUtciSyDqXee0eaHRf4V8isydvaJjCuXPEXscndCNiL0ojfdiSt2q8hqqW
         9BXxVCJ2gapTlPFryB+us0M4om3Z4d5VaQ0+mdy/80z/ZCL37/+/MaiCmICl2r/xNQd8
         Qzfk7sy7mKA/HlxbTa68uIQJYmNXlIqK7BeM8eiJoI1Ocd33kssmZDgyKVoxqNzV/13d
         batPdKpZA+m1tnaHMSNuH/lCybe2RVN38c9Xn/hFlecnCSye3KYcyMJkGW9n7QiPOMbA
         59OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683191044; x=1685783044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xT0i14Q7bHIjJ/18GSTqsx9FseIC1b8rPmsF3cUY/24=;
        b=PlOvGiU9rh8NqO8QwaQSs4Qlc32l/NQuLg4d7GuWnHovs4hGV+h7G1veUcGCWPaiwB
         /7Ng2/kSpWBn8K+gN1Jl2yDnzV8X0TM7ZWYjt5H0P/XnBJiPOGd2nFuiMSSRfgntg5pD
         QOkGkj28SoL7VbJAe/0PAErHOB9wks1gi0fIilEpjAybGyPErNYw7ANUi8ypwWovZ39Z
         km2RJBfBNupIHgX6HQsRUD7Zx4T/bVfotMJ8jRCJH23FzW5AuJ2YSBEswpOfn7JoTgxj
         QGJdehCaNL5qeYTKaiq0XlgJEUUMLvk1ygABNvZH131oG/L6sWPMnnlb3QwpV01NXq3s
         RPxw==
X-Gm-Message-State: AC+VfDymWtalqrrEkmHVTIleKo0NzFXmSsRRlS40d3KTScZ2kHfxVK/d
	JsI5tog3AGOFaebxDOgQ51OQ/MS7D5zFxAM0
X-Google-Smtp-Source: ACHHUZ4UaqCJr534iFoJTFdg/KlouKFsSzlGwP6toJj1+5/KG5FxmIzOt3RzdmAIuQF1tFTk4EfLFw==
X-Received: by 2002:a05:6a00:21ce:b0:640:defd:a6b9 with SMTP id t14-20020a056a0021ce00b00640defda6b9mr1795755pfj.3.1683191043740;
        Thu, 04 May 2023 02:04:03 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id j9-20020a056a00234900b0062dfe944c61sm24910350pfj.218.2023.05.04.02.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 02:04:03 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [PATCH V2] binutils : Fix CVE-2023-1972
Date: Thu,  4 May 2023 14:33:55 +0530
Message-Id: <20230504090355.1212654-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 09:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180857

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff;f=bfd/elf.c;h=185028cbd97ae0901c4276c8a4787b12bb75875a;hp=027d01437352555bc4ac0717cb0486c751a7775d;hb=c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57;hpb=f2f9bde5cde7ff34ed0a4c4682a211d402aa1086]

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
---
 .../binutils/binutils-2.40.inc                |  1 +
 .../binutils/0017-CVE-2023-1972.patch         | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2023-1972.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index 93631ca3d7..9df8715074 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -35,5 +35,6 @@ SRC_URI = "\
      file://0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch \
      file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0016-CVE-2023-25586.patch \
+     file://0017-CVE-2023-1972.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2023-1972.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2023-1972.patch
new file mode 100644
index 0000000000..6a84936730
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2023-1972.patch
@@ -0,0 +1,40 @@
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 30 Mar 2023 09:10:09 +0000 (+0100)
+Subject: Fix an illegal memory access when an accessing a zer0-lengthverdef table.
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57
+
+Fix an illegal memory access when an accessing a zer0-lengthverdef table.
+
+  PR 30285
+  * elf.c (_bfd_elf_slurp_version_tables): Fail if no version definitions are allocated.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57]
+
+CVE: CVE-2023-1972
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+---
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 027d0143735..185028cbd97 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -9030,6 +9030,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
+	  bfd_set_error (bfd_error_file_too_big);
+	  goto error_return_verdef;
+	}
++
++      if (amt == 0)
++	goto error_return_verdef;
+       elf_tdata (abfd)->verdef = (Elf_Internal_Verdef *) bfd_zalloc (abfd, amt);
+       if (elf_tdata (abfd)->verdef == NULL)
+	goto error_return_verdef;
+@@ -9133,6 +9136,8 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
+	  bfd_set_error (bfd_error_file_too_big);
+	  goto error_return;
+	}
++      if (amt == 0)
++	goto error_return;
+       elf_tdata (abfd)->verdef = (Elf_Internal_Verdef *) bfd_zalloc (abfd, amt);
+       if (elf_tdata (abfd)->verdef == NULL)
+	goto error_return;
-- 
2.34.1


