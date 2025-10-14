Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6501CCD194
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 16:13:27 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.16943.1760449987265838397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 06:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dUO/PsdY;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: phanirajkiran.a@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-26c209802c0so52699825ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760449986; x=1761054786; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/b0cleXgyjb9qdcmj3AiAhIK3ivPWGlVNaFputMX50=;
        b=dUO/PsdYTbDqt0beyxo7qGLY/gxqjY+sSXqzxYim+lRI6U5TUeD7P3T0LuipOWGLo5
         aZmMcf/KTn5ZC02mwjWyG0U7XokLcwR8VTYtWbaQ09xwlinLJ/PoJczGdrnvaOSMsHc9
         5aZRgtQH4WkfrZiyh54QCGFcMa9FEh0lDsQiM/pEzf52O9ibjRK8Z2S5vk9FRDHGK91L
         P0gbhpLs70I8ULJ2JKPjXlK7TvCkEP+A72IKcwFwIhoqO4JkMg0ELYpX8a252t5O/SIB
         FEucpr62stFl5b8NRho1S/Mb4FkPZhODU1SLKkTDbBiR8Zt1sAGfNNQVvuMJtX/w+leY
         cjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760449986; x=1761054786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/b0cleXgyjb9qdcmj3AiAhIK3ivPWGlVNaFputMX50=;
        b=HIaBefg3xzgB+tOHZWCRK/QyEbolkciQGjv28VGTi2X85UOK2spzwqpvSE3+GZ+eah
         pWjXvgK0xaavza1Pp6c2NY6f7l6kNEPgdXlcpbMK7rx6sgprD2Os8ScAWOAq1/oo6TCO
         68Ltgl6pJLNvUvpHFtLGxlBxG8PwG0XR5xruOkGOsc35Rsmf+IgOwMZDXTRKwjP/nOz4
         lB65YllkJdfPOupJnkBYmmFSJbiBEu1d/th3iJ00/dzD00FKL1o4/4QrP0h2pz15H6h8
         iwRypu/MrNSaEFRnMZnyNwjbEP4Q3OtC/cwMgwDl3Jcz8O0/MR61lAC9Sv4XFQ8kpDtY
         XzZw==
X-Gm-Message-State: AOJu0YxxiFAkr0tr+p3R//NmZCIR/STj2xS4+6uPd7pnjrVzINCWKQfZ
	lcxERqxBHEE8ohn5rs3Ik7m25Hh/8wzus+pbFZdvZP6+TTG48RWJcmTAxV4yoQ==
X-Gm-Gg: ASbGncsKqtt3PcgNZKzU5CD6g1qLSaJ3nTpswuQgbSQJVx3IYVDWDOv4U770xWv4ycy
	ckKfnTgPM/8uW0sjEYZcEvp9qF+IWIpPKRRnVzMy4BdTj0EtiguzsZ6YyUtlElvy9WEM7N+bbk9
	Abd4l048hohHcVK6y9v83KdbG6m2o7R9QLetbbEu2Zdqsmer27tHvqe9EoiL7JDdZ9Pughn0nVp
	xls7QpImIGtA09HHchCafrZj8NojQQ3Xw6/9gAAabjPUrZoNphwUU/xYJS134WNGEQwFSITbU0o
	dq82fCKO3K4Htmvs9Q/I1x1fuuqAEUdIH1srSlVcS2/63t34lcv7wv70zxFLCABO7tVy48EqQ0d
	fGpUH27LjXDjYNmPKpeuxtrDw9J9fMYw38HftszTOlcqJDtiJHTMv
X-Google-Smtp-Source: AGHT+IHE3TdtA5zEYsm4PDmEPD81U/8j4wjvK9g9u7EuRQoBBDn4NxmczNeGGs6jIeSoqRyVre2BAQ==
X-Received: by 2002:a17:903:38cf:b0:267:87be:505e with SMTP id d9443c01a7336-2902737c68bmr271573605ad.23.1760449986053;
        Tue, 14 Oct 2025 06:53:06 -0700 (PDT)
Received: from pop-os.. ([59.93.89.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5288f84esm8850663a91.0.2025.10.14.06.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:53:05 -0700 (PDT)
From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>,
	Gunda Swetha <swetha12g@gmail.com>
Subject: [PATCH] [scarthgap] musl: backport fix for CVE-2025-26519 to LTS branches
Date: Tue, 14 Oct 2025 19:22:47 +0530
Message-Id: <20251014135247.6178-1-phanirajkiran.a@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 16:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224839

From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>

Fixes [YOCTO #15932]

The musl libc code in LTS (Scarthgap) is missing
the fix addressing CVE-2025-26519.  This patch backports the upstream
changes (or applies the required fix) so that LTS builds include it.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-26519

(From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)

Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
Signed-off-by: Gunda Swetha <swetha12g@gmail.com>

Reported-by: Cristian Morales Vega
---
 ...x-for-CVE-2025-26519-to-LTS-branches.patch | 50 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch

diff --git a/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch b/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch
new file mode 100644
index 0000000000..3f0b14a5d0
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch
@@ -0,0 +1,50 @@
+From 7ee0592397ea0e3d4b47018631642864864d443d Mon Sep 17 00:00:00 2001
+From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>
+Date: Tue, 14 Oct 2025 01:40:45 +0530
+Subject: [PATCH] musl: backport fix for CVE-2025-26519 to LTS branches
+
+Fixes [YOCTO #15932]
+
+The musl libc code in LTS (Scarthgap) is missing
+the fix addressing CVE-2025-26519.  This patch backports the upstream
+changes (or applies the required fix) so that LTS builds include it.
+
+Reference:
+https://nvd.nist.gov/vuln/detail/CVE-2025-26519
+(From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)
+
+Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
+Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
+
+Reported-by: Cristian Morales Vega
+---
+ src/locale/iconv.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 3047c27b..0729465e 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -495,7 +495,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 			if (c >= 93 || d >= 94) {
+ 				c += (0xa1-0x81);
+ 				d += 0xa1;
+-				if (c >= 93 || c>=0xc6-0x81 && d>0x52)
++				if (c > 0xc6-0x81 || c>=0xc6-0x81 && d>0x52)
+ 					goto ilseq;
+ 				if (d-'A'<26) d = d-'A';
+ 				else if (d-'a'<26) d = d-'a'+26;
+@@ -538,6 +538,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 				if (*outb < k) goto toobig;
+ 				memcpy(*out, tmp, k);
+ 			} else k = wctomb_utf8(*out, c);
++			/* This failure condition should be unreachable, but
++			 * is included to prevent decoder bugs from translating
++			 * into advancement outside the output buffer range. */
++			if (k>4) goto ilseq;
+ 			*out += k;
+ 			*outb -= k;
+ 			break;
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 324269a968..db6f5ce2de 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
            file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch \
+           file://0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


