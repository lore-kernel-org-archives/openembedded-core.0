Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E7DC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 06:47:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.43522.1683182864923344077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 23:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dpSfx//W;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1aaf21bb42bso386535ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 23:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683182864; x=1685774864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ7PXkiiiT0nKbFtIck5VdAIixOcrrczyXBnfSUTXHU=;
        b=dpSfx//W45DdgOrsl4fXrD6htkr8MziSaEeAqe1bbPYLe18gAua67pLRGZjgiqb03Z
         gobcVPDK3FG4nbrjo8qEvpzQ3OsLSXLR9yj2SeEDKQt8+X2ayt8J4PdurGL9ZqkGLjZ5
         v0EECu/IqK2VcHQuMSmznA7jTeC8aLCto1WTjfcl7MT5HOcb22anTpTDgds/CwbM0Myo
         YNjJwWJh+jG0Gq78TicIxG9lr95SVz7zMjPhWWnm8YiIWFM+xf3cTkd26RbSedSdToeQ
         H6QwZZmtQRVs3E8lbK4TGoB4khTSC5dnBsRWqsB8q3kNoovF1rqQQfAqzO2RNKnR/k3A
         LI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683182864; x=1685774864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZ7PXkiiiT0nKbFtIck5VdAIixOcrrczyXBnfSUTXHU=;
        b=CJWLUFBCYMMrFF+IO3QZP16kGmpXXeWn7ihAUGh5jRz3ItTg7PVRppNOPyer/QNWLP
         qMMNNW3dSzsTidVtXioYvUDwdyRT2khHqTKCmep64T/R48awcbSJDKFp3CbrdU59oYtX
         +AHp88mpvXsf1pyemuFYR8VSIyyoTRkXzTeqAxICXCtwEHq6k1R6zz/Pwsyg1wudMPEH
         o+oJlxMbKy15IUffsHgCM8Jaclp6nhaIZvWzYVg0rIVTsZCBc9tR1MfAyiu4qx3FJrCL
         JJnplvhH9zSiyUjcXcWiWZ9uX+PLGfcefkLvEpBWzi7I8SqEsJ2zSs/wVoNNmu8Kr+TM
         3XSw==
X-Gm-Message-State: AC+VfDwyuS2MxIPx8gbYVyQWjT7NZ7i0X2w7UarQKU19WeIpIf+L0/Lk
	8wF0L9JbYdMFZ9nAQv/92H2lRdNZ6gkqtjmi
X-Google-Smtp-Source: ACHHUZ6EpMkT3VdAo1w6SqI15xYRd7qaL+sifKb4dmqwKHK0mO16Ot3n7ckihPFP8oKpKII9R59KWQ==
X-Received: by 2002:a17:902:82c1:b0:19f:3797:d8de with SMTP id u1-20020a17090282c100b0019f3797d8demr2410551plz.9.1683182864065;
        Wed, 03 May 2023 23:47:44 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id p4-20020a1709026b8400b001a6e5c2ebfesm22781298plk.152.2023.05.03.23.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 23:47:43 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH] binutils : Fix CVE-2023-1972
Date: Thu,  4 May 2023 12:17:30 +0530
Message-Id: <20230504064730.1190427-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 06:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180851

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=blobdiff;f=bfd/elf.c;h=185028cbd97ae0901c4276c8a4787b12bb75875a;hp=027d01437352555bc4ac0717cb0486c751a7775d;hb=c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57;hpb=f2f9bde5cde7ff34ed0a4c4682a211d402aa1086]

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0024-CVE-2023-1972.patch         | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0024-CVE-2023-1972.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index bf44e6c762..de95f3eb6f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -50,5 +50,6 @@ SRC_URI = "\
      file://0021-CVE-2023-1579-2.patch \
      file://0021-CVE-2023-1579-3.patch \
      file://0021-CVE-2023-1579-4.patch \
+     file://0024-CVE-2023-1972.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0024-CVE-2023-1972.patch b/meta/recipes-devtools/binutils/binutils/0024-CVE-2023-1972.patch
new file mode 100644
index 0000000000..c6c850c288
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0024-CVE-2023-1972.patch
@@ -0,0 +1,41 @@
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
+CVE:CVE-2023-1972
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
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


