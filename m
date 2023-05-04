Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4C3C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 09:01:15 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.45010.1683190873525062888
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 02:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=iWMoPZU3;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-24de3a8bfcfso288666a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683190872; x=1685782872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xT0i14Q7bHIjJ/18GSTqsx9FseIC1b8rPmsF3cUY/24=;
        b=iWMoPZU3U5SFYTwzVPsC8PhEse81sixWPtKz72gDyBFG9m9bqERSgD/Ws5ymBaBoP9
         CQzHI30DwTtlikW6orSEHert8h27FtYi3tAaokki6EZlsqCba2WlQf5OnEBY3LP3FdBK
         bFGN+l0IfdwO6OxCLHLRK5NBCmFzu8EOhwi0ZQwPk5Z0a78brXQl2Fy5HMndjCPe/3oC
         vKbhF+pmzhyW16Kbw4gSS4dLEL56L2tHa8qh3fEE3BbW6JpF/cPxvhk0Vw83qsuMNJO1
         sfe6WYUk5dEYrLFs8mlysgR0Azrs09K0JHUt1wQ12FZglM9yqCq3R9/wa3WtLErjDMxj
         sjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683190872; x=1685782872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xT0i14Q7bHIjJ/18GSTqsx9FseIC1b8rPmsF3cUY/24=;
        b=aobjAbcCq0t0swj7HzTYF7D2g2Anshw6ELXsF4DzW+0ZEV9o+n1fxYPkuut9REsbkZ
         l0LzvhOO8WTJhmpRHMmdXXxFP2OfD95oMJDlKT9pjWeGGJZtWJ1x5XqPZKos3Ny7++DK
         RP6pUUSPj1R9RtELm+jmqLIZqi4a6mCh3XH8mVmr5APoNLkbSRAQCZsQ7SAUEVj5MHJV
         8O3wlxj65sOXeN1xJdW8LW+QltqT22ZA63pcYZC5rZfCs29ANbtt5g+Fxab/nPupPM5m
         m4lLCzaajDDN2vHlIX9H67YHNuIgjGL77KISLBZYJe2/zgP+AqkAXVDkZe6xuOLLqJcH
         U6vQ==
X-Gm-Message-State: AC+VfDxa7WLdj+x+DHoUiQ3tH11YTyHv/dVXQ9corbOEQYC2mg6q/9hp
	/mKAzuqTCDBMy+IFEAIJjTdRHZixsLHWXTls
X-Google-Smtp-Source: ACHHUZ5LAFB75d4Jqj6Mi18arDkRK2QgmPf75g6uBA+XhQUimOrgUQxKRl8S21PdTZ2HMMqTPXWohg==
X-Received: by 2002:a17:902:db12:b0:1a9:8ff5:af51 with SMTP id m18-20020a170902db1200b001a98ff5af51mr2831938plx.60.1683190872563;
        Thu, 04 May 2023 02:01:12 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id jh18-20020a170903329200b001aaf370b1c7sm7319487plb.278.2023.05.04.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 02:01:12 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	sundeep.kokkonda@gmail.com
Subject: [PATCH] wqbinutils : Fix CVE-2023-1972
Date: Thu,  4 May 2023 14:31:05 +0530
Message-Id: <20230504090105.1212572-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 09:01:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180856

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


