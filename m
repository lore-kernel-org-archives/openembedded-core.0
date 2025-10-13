Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589DECCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 21:37:24 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.451.1760390252425636469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 14:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E6Cm80Yf;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: phanirajkiran.a@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-8fb58f2b820so2854611241.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 14:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760390251; x=1760995051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/b0cleXgyjb9qdcmj3AiAhIK3ivPWGlVNaFputMX50=;
        b=E6Cm80Yf4Bpq3s0Tbl4KOTSOROqi79iODquLS/vxtNwZJ3qWDTAXoDz6IJ8l72TuAM
         uMtkmPm+YckQnz4jqH7PT/YPxh06DBpaskpA3dJMJoOso8thrNM1jEPb+vI12jIoD1CC
         unhCBOs+L0UMwv6n6s/4g1GLfbrMIVaP/zAlqI8Ipad3H4MIGcV0v6nn2imJBWm0Vh/q
         x1gIG5y7NKd/UMnzGhSugvagtd/V+P/1xqqeH47r1Are0gZqAAc28N6CNxTD3KxQORm6
         U5lmy544AYj1uxLT0zt5hka5sEwhOPXdlD+CIEcThOspQiBRN7zV7dDVR6SO0KbDY1wW
         FHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760390251; x=1760995051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/b0cleXgyjb9qdcmj3AiAhIK3ivPWGlVNaFputMX50=;
        b=YUNnPK+jChgTcjJaDHNEvmbONSzOx/ahEFPRe2Fc92vn2+pv1eth2n+ZHcewzC3L72
         KPhA/+yD26OlJk4fbhuCMTaldEoX5K3P5YXLfPH0VQ6ch8EwqJIF1w5wQPIHsG+UlBFG
         pgSG58qevPQzBW7K0+C+AaTPFzKAEgBHw+YDwzeKONkubaKZLnraAL/9dCbbwjTm5uPJ
         XuM4Q5vtuDb7C5vck2bMPdgq7okREhRNIev76iAwxbvJkuXGnD4+HLvtgMW5MlPz36xj
         aS53L/fFMnCulQ/QEFZjT9mW+jOlx7Rf+bKJ5OCb3tbKE7a6qP11/2ZfHfRKiKNJW3l9
         zWHg==
X-Gm-Message-State: AOJu0Yy8NB/8S2014QpIzL9dl2wCqKCv65HAcKob/VyeGuPk7gMTPoU9
	kBWHAiwZJ/U9Ntm/7e7/dXNeA+8ZHf9YrYowyxyAvKVCtodZOi+e+6ZkiAkwRw==
X-Gm-Gg: ASbGncuJEuPWPTNH9eQxhK9nAUf0m/+VC4Q3bWFPaDjlTRDlnNPAD1PefJGboe/UE/B
	W3MXbp4/DOgmHLDqs5nA/0akdWAE+1H+BkBlQrk9DxBzYugXF+Qgan/z9T9WcIwnVlRnbgnGh59
	toEMQl86uvNmJQ89+TVmNpm++nOWT2Ay2UndmdbAIL9WraOBmPkWzUxjx2ML0MRdz3KEkkg5RS4
	6Qh/ULnXLTlK90GW5RuQFPLWIYkdvjPami+APfjgfQUgRBZeQmxpcW7nFGlqbrLwWsZ1VCsXmta
	ma1Ld+ZVT8qoRT3+akOUJ7r9UWE37bCVgzcN/GbPpnrfOCtdug/0HuV4XoGmMVbb3nk0++QRVJ1
	uoNhT6uuTOju0I0DVEnR54Oj8c7ycOSf6UuUGWc45d4Pyc+PGbsh0ZFNi
X-Google-Smtp-Source: AGHT+IFMfHwWkxttKYt+adTfWv63kjVv5oQrOvWO9BLArYkl3aC4nSaz3L1EWuesLBJyamd6gBiHhw==
X-Received: by 2002:a17:90b:4b89:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-33b513cedd3mr30834433a91.30.1760389825262;
        Mon, 13 Oct 2025 14:10:25 -0700 (PDT)
Received: from pop-os.. ([117.206.238.215])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09659esm12839788b3a.45.2025.10.13.14.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:10:24 -0700 (PDT)
From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>,
	Gunda Swetha <swetha12g@gmail.com>
Subject: [PATCH] musl: backport fix for CVE-2025-26519 to LTS branches
Date: Tue, 14 Oct 2025 02:39:54 +0530
Message-Id: <20251013210954.12041-1-phanirajkiran.a@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 21:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224800

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


