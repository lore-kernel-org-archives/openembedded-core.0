Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1EFE81BD2
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 08:48:25 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14967.1770798742673610345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 00:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hKTAvP22;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8244c048d41so4113647b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 00:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770798742; x=1771403542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oPN4/rVZ4oHv1Ij+xIY48ekW77NQm6UkIWWarAUuJgk=;
        b=hKTAvP223mAx+zhzvEZ1ZDCaBFTZlfvPL5UF7en+FxPy6fY31lxD2eZT8m+51MTNNy
         pnlgl/eQFfPYgZtRGb5vZ0RWS4AgWOSjlZartDi27ereTWsKSyFlr3I/y2CqxVz9pDA7
         HJNphuDmrvSS0fxsC6JT47STJFUS6FkoVYIEq6gngRg6RSXVxVuqn4n+dXUcU4KGReV5
         ngDiOWkWY9AGjpAUlmtabforPWvaCm6g1DyRFpFXdfzC8H331m9NKS00EsBffANiDldf
         IkEEE+gwBCHu8Rl0uD84tric3stZLWD8Z19iVwQY9Ov4ZRjgqzYM6h+ccAzAkzjqeiX2
         DnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798742; x=1771403542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPN4/rVZ4oHv1Ij+xIY48ekW77NQm6UkIWWarAUuJgk=;
        b=jJ4ULxm9697R+JkTGrLp2lXMfh4By1SKVpyZMgFvJvt2aJHT0wiHtpPZsZcYezjro3
         Na8LYP+CSDmLozug5N+7AmSpGtUA2Yc9s045ejqg3QJut8EEbqJjhP7vVXGKkx2Y9/p3
         g2QXLcoRee0aCXA4M099EODwTb+N/Lhop6ou3H9dK0KRkV5q5joHwJaIyRBSCkHoaxpC
         aH1AJSAQpYiL2JCRtaXvIIkK/LLNJiWtKHMoegfQ/mCSKsXr0kiBMUHdwAXG8UPECCbG
         HvZNbWiQbLsHUO6hOgrClUVE0U/RuoZLcWzeuBO7cdRTWk8sT0/ImrYZZyopoYue7X+p
         ikew==
X-Gm-Message-State: AOJu0Yx6fAesDxACrFg2J+1j2kQf4Eaw1FqMWTOZD6+/m1Hk9B55TmZy
	fl4VWMjYrqGr0q+002WJakdICrMY0v8LY4F49il+uu88vNjbZjdvsy9OczGQjA==
X-Gm-Gg: AZuq6aICqEFLGBCsZRvRdbt5YGZT8wrovmvdUMi6joMrCRpwwMk2iU/rMgV8JOhxtV1
	4Uqa13tKbO8ZL3ZbUzejwc/+onwbBmOuI4OTDDIGZSCZPIcbs/aIPB1GPD+RteI7H27g/DxjCIx
	47SZ9ne5V21Ro4tfmO+4GjLzFI051f7ULBCGS3E8/ERs26rE+BEhHxHIkO7B2PBJPTiuH4s1IE1
	yqfJEAB0Zr2EUpIjSs+9qaj+Wdq2bvhHPIgbuSWn/2qNuvaJIeNy8dcj003K4+pRAkSHqIDS4+k
	K7NO6W99uouLu0ufhVQh+kz/mU4kBEJKiF6xcBFLLOWC2TgMIRuCZ+XfuKRZb7uOY2FdjmcrVJM
	iDs6tmEUszg7BpgVN/XKaJouFSYx5I2HGtoo6tZS8HTgNaTXCwRJRvHVwp5mJNi6CJFV5njNaUp
	5VpU0MHtRHnVfoREJa5PoYNBuBxfXYwfGSINg=
X-Received: by 2002:a05:6a00:1bc9:b0:81f:4d18:65c4 with SMTP id d2e1a72fcca58-8249fd96352mr1235564b3a.59.1770798741708;
        Wed, 11 Feb 2026 00:32:21 -0800 (PST)
Received: from L-15597L.kpit.com ([152.57.35.36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e84a43asm1631672b3a.56.2026.02.11.00.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:32:21 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][kirkstone][PATCH] gdk-pixbuf: Fix CVE-2025-6199
Date: Wed, 11 Feb 2026 14:01:28 +0530
Message-Id: <20260211083128.100894-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 08:48:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230973

CVE: CVE-2025-6199
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32.patch]

Backport the fix for CVE-2025-6199
Add below patch to fix
0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 ...d-support-patch-to-fix-CVE-2025-6199.patch | 36 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch
new file mode 100644
index 0000000000..aa8bfec8f4
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch
@@ -0,0 +1,36 @@
+From 140200be0b4d5355aab76a6fd474e17d117045ca Mon Sep 17 00:00:00 2001
+From: lumi <lumi@suwi.moe>
+Date: Sat, 7 Jun 2025 22:27:06 +0200
+Subject: [PATCH] lzw: Fix reporting of bytes written in decoder
+
+When the LZW decoder encounters an invalid code, it stops
+processing the image and returns the whole buffer size.
+It should return the amount of bytes written, instead.
+
+Fixes #257
+
+CVE: CVE-2025-6199
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32.patch]
+
+Signed-off-by: Shaik Moin <moins@kpit.com>
+---
+ gdk-pixbuf/lzw.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
+index 15293560b..4f3dd8beb 100644
+--- a/gdk-pixbuf/lzw.c
++++ b/gdk-pixbuf/lzw.c
+@@ -208,7 +208,7 @@ lzw_decoder_feed (LZWDecoder *self,
+                                 /* Invalid code received - just stop here */
+                                 if (self->code >= self->code_table_size) {
+                                         self->last_code = self->eoi_code;
+-                                        return output_length;
++                                        return n_written;
+                                 }
+ 
+                                 /* Convert codeword into indexes */
+-- 
+2.34.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
index 471d72d8dd..c72352f5a4 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            file://CVE-2025-7345.patch \
+           file://0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch \
            "
 
 SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
-- 
2.34.1


