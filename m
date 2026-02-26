Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D77BF55451
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 06:07:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63480.1772077696190090172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 19:48:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rpsokuhk;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2add623cb27so2253555ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 19:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772077695; x=1772682495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CLSZgoExwIs0cMnhwESXJRDxpcbwx+/05HNeio4qHww=;
        b=RpsokuhkWoQb2giCCu/NiCy5CDtKSrjuc7waVgmrzlgAOaFJ9Ybumsj7wdOW1F8STE
         jGJUizaVeGKmi9e83NjWvMr8Y+yAfN6XgBLrZhCPDh/12zi9ZwkyWm4pxMVHkBNUmiPn
         cuRLLDMgtF++Wc+ohIEk5rfXx2SNZxEI+ABmzULdI0YC5ihfefRXpvnsCrg1Dlm49nig
         G9+3MLpBMogQv7FswvOO6OtMSyAR4z8qk0jo5wdPZdkSjpnwILxUfYZ6+rJAKpcl1Kf1
         F84QklmoPfT9XAM2c/PDQzEYEjHwRRBfglXpk4U8P74nbMU2k73LcZh4lLRwG4e9eHbo
         yZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772077695; x=1772682495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLSZgoExwIs0cMnhwESXJRDxpcbwx+/05HNeio4qHww=;
        b=ptmYgnu9efL38bVGq8+qmj2VnYiGVJCKoVClws9A5z/+0scf60m51O4DNZdLtrueAI
         jigH8vqWo24pHIGhwZRruzAALQzhzdhj6kKyzcVfuoY1ma1h/CbZrNcr72+ZgmyZlLuI
         XiimHkfgygGMYalscUCjLpEeGHhWgxH0axZXGbwyl8i+xzVk+24c30VwGteBAq0TeGRW
         WbuS7tUmOuXFsZvNWHOHHVV6mO6/XB0yOnC6MGzcWu0c+pJmrybAIBY5pHNxa5EROMxZ
         cDtCFQmuLoy8QnRQ57dsMB3Gjfu2VO2Jyfckm0wDhbn6SBrHdvmLvRJjydllqoq26RnG
         YA3w==
X-Gm-Message-State: AOJu0Yz4u/YcgaBvfbokT3BlyqbISX5bdxcXofZya6rU9fLBABas6fUo
	sXicAX69uc0yKfpzixqBpKrtRm++L50Zhmvjk7fFJRitY4MxUr6k/+DcoTtFHw==
X-Gm-Gg: ATEYQzwTTeyTMKZKmXQUo7b7HH8eJjMA1A7gsHqmrJsocUprAe8cclp05x/s9ZFlG1m
	GqfSfl7/DERWFb9bsEdXTekKvspQtIRlXEIwZYOgF+BTP4imUPIYFiA/PDEIuLLBtoPk8KxMeFv
	sdvnh5uBxZUlmPH3m7cKFo1bhYOFXxHj8l2sMwelTIPnNpmT39y228K5QW7k9QoIV2RTMJTEY3w
	ZOkFLbGQXAYcJ4T8tWSrGe4ikS9+wEy0LrDezKBKuluJdsylehv2oOcit8alPPcJvL6Z6quzSE2
	7IJlcqp9M63bdHi7wSHElav3mAMmoWYKgGEJwj1aliWMZ/icVh24ULU5pqVaevkS8B2GSzJwO+s
	P/lgcLgUelMijtHH9cQ9lXD+Ix1nP5law5RS+azmMD4c4si+8obDi8dWrOTOhdTGrR8tLk71Ozf
	7ToJgZVhoSPicv2mmwXaWVD2O9IA==
X-Received: by 2002:a17:902:ce12:b0:2a9:5c0b:e5dc with SMTP id d9443c01a7336-2ae03707e3cmr8950215ad.54.1772077695177;
        Wed, 25 Feb 2026 19:48:15 -0800 (PST)
Received: from L-15597L.kpit.com ([157.50.96.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff324esm766963b3a.38.2026.02.25.19.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 19:48:14 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][scarthgap][PATCH] gdk-pixbuf: Fix CVE-2025-6199
Date: Thu, 26 Feb 2026 09:17:15 +0530
Message-Id: <20260226034715.15775-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 06:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231986

Backport the fix for CVE-2025-6199
Add below patch to fix
CVE-2025-6199.patch

Reference: In Ubuntu and debian, fixed patch is given -> [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32]

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch | 36 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
new file mode 100644
index 0000000000..1952e3ceaf
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32]
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
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index ff1c7a1fb2..7c58fe1e1d 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            file://CVE-2025-7345.patch \
+           file://CVE-2025-6199.patch \
            "
 
 SRC_URI[sha256sum] = "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"
-- 
2.34.1


