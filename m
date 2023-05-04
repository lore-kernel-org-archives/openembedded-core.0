Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5617CC7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 12:01:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.47523.1683201681303294814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 05:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YCDeZ+rP;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1ab05018381so3189095ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683201680; x=1685793680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lP1zadPMQ7ImmLIrEMdiaVtEzZeKDFUhSVb1dsqDIYA=;
        b=YCDeZ+rPAvz26X9WWAlq9rCFTYXC+GURIN7bfbbapKi96D4IBogA7CFCl41TBQRrOY
         W0CYirb1JHFDoLr5jLLTmXEa4KswDegbZj42iTm1KO3OdsqDPGRx1TPmeTXYylAmCR7g
         qkECmJegKl+jxNIuWhC0noUowbY8jM/3zgPkG7ZfLw6eF96BPXNVk+dzWXmdXEmUavul
         oZK88sVOVNdHUhqWPmyffyGNqTylYeFIxU/e+VHVQ3NKxN9wy+w/iu4NQ1mPBLVEzQc7
         CQ+MBnvwJDgIK+o3+9augmFhtEIMyXOxzbX3hTfNXZPPUkQakt6aoKobGkY5HJemQ+R1
         DPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683201680; x=1685793680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lP1zadPMQ7ImmLIrEMdiaVtEzZeKDFUhSVb1dsqDIYA=;
        b=dPJaDWkVijTqNUy17tomfmTbZr4nM1vBvK6kN4wWI5ORxW+oyCtMXPCC8t3/e9Ymit
         hQ93FOkJ2lrPIKFkXxQjmGBk2mZrCQzPC/qgdP+AdzBCePnv+kCqthNMk0bwywJITC4Z
         BF30K1R/QKLIjaGcla0DLOxKxFTjpHNOZ0g7cudrSXxPRybTlwdSUNOLwqwwjXG5X45c
         6A8hLwpTHNpCv+FfFxDvU5ygRlSRLjrqlA6xa/iJ/BvWfPXnOeC0ugyFq57C/ECZg2SB
         eVmp971MqTd7ZGh9g0TrGBfLdaoCNWnJSI3x8bPsB9cuaUphtf/jEK6i3VJVKThKfJZI
         +P4w==
X-Gm-Message-State: AC+VfDw8RH7vIA2DVScrhk5e53h1RRBiPc1OCIU/Ia7Yq+AEbGDKFV1T
	MG9xVohC/22PFtlgNa885U6M2tm8Ftf/IW4u
X-Google-Smtp-Source: ACHHUZ4rpxF1/zhiAh5xg/n2DH7O1dvxi00ZMWjhTtYCIBt0Lf4lb6M5LHpla/9ROrKrYbBGxVVczQ==
X-Received: by 2002:a17:902:9342:b0:1aa:f78d:97b7 with SMTP id g2-20020a170902934200b001aaf78d97b7mr3350398plp.46.1683201680089;
        Thu, 04 May 2023 05:01:20 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id jm2-20020a17090304c200b001a96562642dsm623683plb.277.2023.05.04.05.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 05:01:19 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [kirkstone][PATCH] binutils : Fix CVE-2023-1972
Date: Thu,  4 May 2023 17:31:09 +0530
Message-Id: <20230504120109.1243653-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 12:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180870

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57]

Signed-off-by: Deepthi Hemraj <deepadeepthi98@gmail.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0026-CVE-2023-1972.patch         | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0026-CVE-2023-1972.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index bf44e6c762..ac4bf64e9a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -50,5 +50,6 @@ SRC_URI = "\
      file://0021-CVE-2023-1579-2.patch \
      file://0021-CVE-2023-1579-3.patch \
      file://0021-CVE-2023-1579-4.patch \
+     file://0026-CVE-2023-1972.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0026-CVE-2023-1972.patch b/meta/recipes-devtools/binutils/binutils/0026-CVE-2023-1972.patch
new file mode 100644
index 0000000000..f86adad217
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0026-CVE-2023-1972.patch
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
+CVE: CVE-2023-1972
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


