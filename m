Return-Path: <rogerio.borin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165ACC3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 15:51:16 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.53969.1747065069894261739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 08:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kzj1hkMR;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: rogerio.borin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86715793b1fso1400401241.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 08:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747065068; x=1747669868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqNjLDgvYFjtUhOItScbGhQFJ9IBgpZuhSWShZoJVEM=;
        b=kzj1hkMReWKW9gLPLwsSPzLmkgcQyBfAf5AfW4eY4278GJQFOoQhJ537RLYlv9JQHs
         kuFm7Oyo1ipdiy0lrk4C+46QgNP8lMiEG+kCAm/a6QYc3rkED0ox5QxD8jgwANFAo19B
         WHoYu5w6YN1m7LRJNRB47AQLLHJqzxO83jGfr7t3fc+DxHAUJbEe6mteDTDu8lZYwjTd
         is8Dj80y1zl3R9jmVGRqaqheECNpkdgGoH5ZCmjDEvcVmzy9DTrD6Pja0kYGkX/SdgU3
         YV3ebM8tfWd+pM/xRuvNgcRa4xalghOpZREFf9xHlRqZw7gtqVQcRbDNR4bQF8EzJrD0
         AzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065068; x=1747669868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqNjLDgvYFjtUhOItScbGhQFJ9IBgpZuhSWShZoJVEM=;
        b=ZKhgum+pPmxDxl/ZofEqN8+4Yuk9LYA4MNQF0ZDVRMDqM2GQcFc0u3iCM2npvU2jP3
         wZmn2aYrPPmJrKlWecl0cTdFIls/8nnlKTRbQw23iI5fHwBHc197kgIclGz6qlXEoU0k
         ru+SUKarExrME0/D5smLtzpOMrOWjI/0cBa0Gabm5AqcmY+VuLUoegXMiDrycZ3r4SPl
         OU7cyPsmwej+YIOKR/cL00tvOiQ9s+ovzSwVDIxamAdpgfNl0ACxqokrKr4lD8Kmfvfq
         aNV0bhcX/58/PfNxJuqhAC8a7yTHKcq30Djul/+078K5RFvjwrEnHb22ZW/OhoXoMLji
         Zx8Q==
X-Gm-Message-State: AOJu0YzmLtRm2trP1ukUKeu0xyg3PRY3y1porUb/ctkihZurKuy4Sb81
	U/FXkR+IX7bMIRLYIWV3SBZUzNtXi7sKIgsFl4tJ+NKbMAQwYBaZYCrEsynq
X-Gm-Gg: ASbGncua6Hx+yQ2or4aPmLwMDoGzqfSYRcp/bw5JXw+hhxE5ypQmgfFlpuDSoQ8VnA/
	mNqC09dhv12yjSNnM4to7WQkxhaWCeTH7GXtZFjVlkTlkuJw+T3Sudl2wLykqomeVzfhAwTWeSA
	e1gGsZKj+f3baDDQBI5zFSFegbN1hBuElqCysRwW8rAEFH+uw5WJJDsbtZJJ/F4VIS5S5YOnfWO
	bGDbsxUrNyjmDFfPTM7GTRUU4K+siiLQb+MjEaARucqIrNaLa4SCn3AqCUChla3Z12RRVcnJWtI
	/zfhNz2UWyv+MSfJI8n1EgNhc3Qb56KMCZsNnxEGi1giMvZEshXi/GVaOurfQoymcrWTkBs=
X-Google-Smtp-Source: AGHT+IGEX/FhzYB0MhFLweJaSBwRoJtenhXUIYOOaFVAbEXVFErWxt5G+u2KdPangb8kJT44hr4OMg==
X-Received: by 2002:a05:6102:8026:b0:4dc:81b7:f031 with SMTP id ada2fe7eead31-4deed22935emr12396013137.0.1747065067943;
        Mon, 12 May 2025 08:51:07 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:211:8d94:b225:aaff:fe3c:dc92])
        by smtp.googlemail.com with ESMTPSA id ada2fe7eead31-4deb2016d30sm5271127137.21.2025.05.12.08.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:51:07 -0700 (PDT)
From: Rogerio Guerra Borin <rogerio.borin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Rogerio Guerra Borin <rogerio.borin@toradex.com>,
	Marek Vasut <marex@denx.de>,
	Sean Anderson <sean.anderson@seco.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2] u-boot: ensure keys are generated before assembling U-Boot FIT image
Date: Mon, 12 May 2025 12:48:37 -0300
Message-Id: <20250512154837.903459-1-rogerio.borin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 15:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216377

From: Rogerio Guerra Borin <rogerio.borin@toradex.com>

Add the task dependency:

do_uboot_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

to ensure the kernel FIT image signing keys are available when creating
the U-Boot DTB. This is done only if the signing of the kernel FIT image
is enabled (UBOOT_SIGN_ENABLE="1").

The lack of the dependency causes build errors when executing a build
with no kernel FIT keys initially present in the keys directory. In such
cases one would see an output like this in the Bitbake logs:

Log data follows:
| DEBUG: Executing shell function do_uboot_assemble_fitimage
| Couldn't open RSA private key: '/workdir/build/keys/fit/dev.key': No such file or directory
| Failed to sign 'signature' signature node in 'conf-1' conf node
| FIT description: Kernel Image image with one or more FDT blobs
| ...

This issue was introduced by commit 259bfa86f384 where the dependency
between U-Boot and the kernel was removed (for good reasons). Before
that commit the dependency was set via DEPENDS so that, in terms of
tasks, one had:

u-boot:do_configure -> virtual/kernel:do_populate_sysroot

and the chain leading to the key generation was:

virtual/kernel:do_populate_sysroot -> virtual/kernel:do_install
virtual/kernel:do_install -> virtual/kernel:do_assemble_fitimage
virtual/kernel:do_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

With the removal of the first dependency, no more guarantees exist that
the keys would be present when assembling the U-Boot FIT image. That's
the situation we are solving with the present commit.

Fixes: 259bfa86f384 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
Signed-off-by: Rogerio Guerra Borin <rogerio.borin@toradex.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Sean Anderson <sean.anderson@seco.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 76a81546e34..e0771b54291 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -113,6 +113,8 @@ python() {
     sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
+    if d.getVar('FIT_GENERATE_KEYS') == '1' and sign:
+        d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' virtual/kernel:do_kernel_generate_rsa_keys')
 }
 
 concat_dtb() {
-- 
2.34.1


