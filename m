Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414C2FCEE93
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 06:07:28 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63083.1772077910829983254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 19:51:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q1GAg9kQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: careers.myinfo@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d4c12ff3d5so350255a34.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 19:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772077910; x=1772682710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/NMNoB5iL7SwEAVaHAvZz6r8VRnnA6yFwtmSzhHChTU=;
        b=Q1GAg9kQWPWmCHbpsYaygowQkIlQJnB32aKgcfIKIvmsXqp3XnmpAm+Tg/DfF7LOzF
         XvChEo8ga0KH21ldu4PURFRz2wPWKHziMVAbukWpgR/UW6RttwcrDbAlwZ8LZ0ZRCwm8
         tcr6MJyKHunJs9T08I+blIKoqn7YjccQo3KDHVIlxE9wS/DoIKvu4ZurqwiMcpWuXfJz
         /NUy3amTNYWzEoZ3kbSFW/cbPc26zRReDButtRaw7elPrwbDgjNIFHDGuJkEr+NcsGRO
         Xt77XouYqy19Jho0ETNzGoA8N5soevFQPFKK/BkqsykxFy7VBAMBAkDjD/33/UJSypSX
         x0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772077910; x=1772682710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NMNoB5iL7SwEAVaHAvZz6r8VRnnA6yFwtmSzhHChTU=;
        b=FS14EC6h7RspXZBOMyU6IWLg+d9cNeCHRDhTnMj89FUD0YN4p4RQKfbCLfVazHYsmx
         hdj9Zgbk3YQRpd3xfxsInHfvjuSShfCyPEZYrvnVcVZoOofxOxgkeR71Yy1e0wxzBzXT
         99jAgVMQjefc9u8EQkIMYmuhwPb7jcncxbKYxITUfIxwsbME9SJ2mS3UQSdBaLvz+Kum
         kCm7D2Iz+9eK+f+GXAOpBjdKl34mQ/PhjVb0uCqBV1QZy0MMoQVDa6TdXdefYB7fpVFO
         EeR/BlOciVKPTtwU/nHnl9TMJMh61SVnZtwMce4wCGeqz2bDl3x/K5O88TPzyAfk7NgX
         D1Fw==
X-Gm-Message-State: AOJu0YzUCYoLomRp+hebj/yodstEgnBoFQPGBxO7k/BsPX7d8fMNJK6Q
	yvBASM3XZfNPlaOnupSnhcfvJVF3k0h/+rhK1j0IPja+a7z0THY9CKSHjK5D9w==
X-Gm-Gg: ATEYQzwFAwP8UCOOCmmcAVMFJVS+Yd5vGCeppwvbFLbfYGxY49CrE/LBaN+uxy6t8VJ
	SuafKH6qxx+9k7Rw+CpSO+GDHyu8bl5pHa2TW5yFZP7JnsAcKPqHRkTPdTjR4Kvjww8PJ0UN4mS
	MuEMxx7vxHbO7sez1cZ0oiCaiPybd6d/3U/gggnUiMK7wYwopXyfvpQeGal5x6wcVvsJEZLA1ZC
	HtT6pVxlcq/LLIPAnGTPmJ9JR2ld4xC1CYxx8GvrI2KPbML3TfYR6A5Klvg1CLwOYnl8YR+DZFz
	UXd46KW/Y5rxSKDoKawiao36Czeyvi4k1SS996DtWU8Ck4KoggyfHtb4vNPX/FGnNJvPs+su9j6
	FGwCIxltEsPvp5oHkVfczjq5iSLDZj2sq9OQ3ja87uA8x7ilHEqQ1k/nJMoWB01oM+/Tn93Jcta
	zbcMxjx+kpNzZn8hwwJZh99HS5IrzWkKbrCYye
X-Received: by 2002:a05:6a21:6197:b0:35d:e4b2:b381 with SMTP id adf61e73a8af0-395ad09c081mr2660450637.16.1772077487534;
        Wed, 25 Feb 2026 19:44:47 -0800 (PST)
Received: from L-15597L.kpit.com ([157.50.96.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b9b32sm8995795ad.66.2026.02.25.19.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 19:44:47 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][kirkstone][PATCH] gdk-pixbuf: Fix CVE-2025-6199
Date: Thu, 26 Feb 2026 09:13:53 +0530
Message-Id: <20260226034354.14975-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 06:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231987

Backport the fix for CVE-2025-6199
Add below patch to fix
CVE-2025-6199.patch

Reference: In Ubuntu and debian, fixed patch is given -> [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32]

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch | 36 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
new file mode 100644
index 0000000000..aa8bfec8f4
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
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
index 471d72d8dd..122cd598fc 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            file://CVE-2025-7345.patch \
+           file://CVE-2025-6199.patch \
            "
 
 SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"
-- 
2.34.1


