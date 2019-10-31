Return-Path: <shuagr97@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 53F6B7FA34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 18:11:12 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id m125so7960544qkd.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 11:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:reply-to;
	bh=2ED4ZH5RN3P70uNiPfr8nxlHb8gj/mIkzkKDVhhOnEQ=;
	b=NuJdtxKxpjLDmUMVkUSiN7sMh3U6aNQXJhzVunw/hSLY2e00i+oNxLpBCfQ+Y9IAhS
	lZ7L/8pf9+XsaDPEdiks4jhHlwF5FdtADXRLWTE8p77J32HTJpRSwDye/phy6AF1UIId
	rTuW1Muc+QzfpWgxxiG7bdClNpeKOpxj/MmJVbnz7o5f5C6cPnDC7apCL2Jz7I0tgGyd
	wst67go46693xY6YMyWSUuu/4iBAA3IYKEo8OodHgTaQgLSz9AEGKV6z5ddnAOaUswW1
	/MCy7XYQjNgU1CPOcI2MlcAwUnqY/VTrUU8TmjgFsRnLHArjfrQ6LnXYr0M7EBZs5/W6
	XcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=2ED4ZH5RN3P70uNiPfr8nxlHb8gj/mIkzkKDVhhOnEQ=;
	b=fh5FKkEy5rLC2kfA6LVtptsUBbrM1yHw29IhjX1kwHxbfQG99KFKJ9Kn5GRE6QkAi1
	xT6uQA+CPjaIygtK13tubdtS0cpyyg1rMU/XeIfbBWDp9q8HNIXGPMrKFfZeHS6lV96N
	Ky3Uygn51BylVVrt+tSY0JVIPVHSKWS0BZkk5GzGV+o9IVPmmgF53qrqSskf5VuxFDKw
	rm9waR04mJ7HeFYDrZpVy/sVTLcqTToamcBDh79+9OTJr8voMnlhT70Baro1Q2ibg1L4
	64y6dQ82lAinz7/o30BMSvIo0zDIeG67/bvPDO/Z87pQdeX6AR8uqyfOtKttaLl8hrLe
	rtew==
X-Gm-Message-State: APjAAAVXKdGA/F7CLp3Ipsl2Z0xU2cQ99i/1B0tqcemm77Kvr0JNXZDp
	1V6lZ+p18p3CmrjbBrBgiwVHSDPI
X-Google-Smtp-Source: APXvYqz9akpQXYEE+Erfucpf/p3K3iCpPYvjN/Cbz6Q15C7U6JfSqsZ/+xCYYqsuM5abur3XRcE5ZQ==
X-Received: by 2002:a37:9ac2:: with SMTP id c185mr6678905qke.350.1572545472319;
	Thu, 31 Oct 2019 11:11:12 -0700 (PDT)
Received: from
	shuagr-yocto-build.eqm2f5n1p1fehm0fb53klgonjh.cx.internal.cloudapp.net
	([137.116.56.217])
	by smtp.gmail.com with ESMTPSA id a3sm2072522qkf.76.2019.10.31.11.11.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Oct 2019 11:11:11 -0700 (PDT)
From: shuagr97@gmail.com
X-Google-Original-From: shuagr@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 18:11:04 +0000
Message-Id: <1572545464-64329-1-git-send-email-shuagr@microsoft.com>
X-Mailer: git-send-email 2.7.4
Reply-To: shuagr@microsoft.com
Subject: [thud][PATCH] Corrected patch file structure as per upstream
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Oct 2019 18:11:12 -0000

From: Shubham Agrawal <shuagr@microsoft.com>

Signed-off-by: Shubham Agrawal <shuagr@microsoft.com>
---
 meta/recipes-support/libgcrypt/files/CVE-2019-12904_p1.patch | 10 +++++-----
 meta/recipes-support/libgcrypt/files/CVE-2019-12904_p2.patch |  9 +++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2019-12904_p1.patch b/meta/recipes-support/libgcrypt/files/CVE-2019-12904_p1.patch
index 397c6ba..cda5211 100644
--- a/meta/recipes-support/libgcrypt/files/CVE-2019-12904_p1.patch
+++ b/meta/recipes-support/libgcrypt/files/CVE-2019-12904_p1.patch
@@ -1,12 +1,13 @@
 From 263ad8ae08f287e32656d4e3e0116479f3d9ad9d Mon Sep 17 00:00:00 2001
 From: Jussi Kivilinna <jussi.kivilinna@iki.fi>
 Date: Fri, 31 May 2019 17:27:25 +0300
-Subject: [PATCH] CVE: CVE-2019-12904_p1 Status: Backport Sign off: Shubham
- Agrawalshuagr@microsoft.com Upstream:
- https://github.com/gpg/libgcrypt/commit/a4c561aab1014c3630bc88faf6f5246fee16b020
+Subject: [PATCH] GCM: move look-up table to .data section and unshare between processes
 Reply-To: shuagr@microsoft.com
 
-GCM: move look-up table to .data section and unshare between processes
+CVE: CVE-2019-12904_p1 
+Upstream-Status: Backport 
+Signed-off-by: Shubham Agrawal<shuagr@microsoft.com> 
+Upstream-commit : https://github.com/gpg/libgcrypt/commit/a4c561aab1014c3630bc88faf6f5246fee16b020
 
 * cipher/cipher-gcm.c (ATTR_ALIGNED_64): New.
 (gcmR): Move to 'gcm_table' structure.
@@ -17,7 +18,6 @@ after.
 (do_prefetch_tables): Modify pre- and post-table counters to unshare
 look-up table pages between processes.
 --
-
 GnuPG-bug-id: 4541
 Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
 ---
diff --git a/meta/recipes-support/libgcrypt/files/CVE-2019-12904_p2.patch b/meta/recipes-support/libgcrypt/files/CVE-2019-12904_p2.patch
index f8fa800..0cb503e 100644
--- a/meta/recipes-support/libgcrypt/files/CVE-2019-12904_p2.patch
+++ b/meta/recipes-support/libgcrypt/files/CVE-2019-12904_p2.patch
@@ -1,12 +1,13 @@
 From a5c359cc68a4def9bf39f63070837d89711b4e17 Mon Sep 17 00:00:00 2001
 From: Jussi Kivilinna <jussi.kivilinna@iki.fi>
 Date: Fri, 31 May 2019 17:18:09 +0300
-Subject: [PATCH] CVE: CVE-2019-12904_p2 Status: Backport Sign off: Shubham
- Agrawalshuagr@microsoft.com Upstream:
- https://github.com/gpg/libgcrypt/commit/daedbbb5541cd8ecda1459d3b843ea4d92788762
+Subject: [PATCH] AES: move look-up tables to .data section and unshare between processes
 Reply-To: shuagr@microsoft.com
 
-AES: move look-up tables to .data section and unshare between processes
+CVE: CVE-2019-12904_p2 
+Upstream-status: Backport 
+Signed-off-by: Shubham Agrawal<shuagr@microsoft.com> 
+Upstream-commit: https://github.com/gpg/libgcrypt/commit/daedbbb5541cd8ecda1459d3b843ea4d92788762
 
 * cipher/rijndael-internal.h (ATTR_ALIGNED_64): New.
 * cipher/rijndael-tables.h (encT): Move to 'enc_tables' structure.
-- 
2.7.4


