Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCEAF4642D
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46889.1773653405926450103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oP2mJfRb;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso36280655e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653404; x=1774258204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3t9d73Cb9wx5La5JQfPmj5WjhX8kKQ24vhUkZpQLu8=;
        b=oP2mJfRbKnnqEZzOsMppFFXENCGzOCiEj1VMAwxs9KhEz4qX6kRmd0mMhAcWKLKcNG
         xJKAO4wrquk5TJBCbMurg78V4ufKxXxLjuoipfC+wnPjg8vBD1jvT5GLQKE+L6MUzEXt
         M5yOLpqQ33vDHxC/fGZUAVj2X08t9kyATT2q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653404; x=1774258204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3t9d73Cb9wx5La5JQfPmj5WjhX8kKQ24vhUkZpQLu8=;
        b=MG//IXFBGinrZuQc68bWX8ct8R6Cr1u4lN/TV2pmnOyYfwHeY3UHHN6xHnOciFSziZ
         CGFjhxnotfEhsq3HVom+d7gEEU9/dNvpdTDD/HsKLCuL7aTCu9/CLwqDim4TkMqEqdBP
         DiczfsFwwUW4CR2tI3TR7i0umHNObWngAPbgf2Xv/CfQky4dVCSB0f9IH/9Ba4w8HbVC
         szALMfEC36+zA3vaTsOTI+G3uRjbSq1lhr3xLtkLkXggNJRpgUWI4P8KOSWbxhld9oPx
         rdTfv0/WOUCUfmqLQu178DP2xeN8RFp/LYuHV52BvKlPkbky4cSuEGbB9eR3Y73jwKv1
         9jtg==
X-Gm-Message-State: AOJu0YyU7Xrl9scoh0rh8WeOdTgA7fiznArvmIF7i7Ym7nE56CMZ6xBP
	C83USGYN5gyLjFoEtO1hLhhXU1j6Fq7MXll1kvdXOKyRv8pXvoGq7uJ/Rx1PViSGKA5L8O1qqIV
	f6sN7
X-Gm-Gg: ATEYQzzsC4xonJ3EIb/0o1OZ3Xn5EvjnliAaq0W6YXGQ/rznaeHGwcXi4ETQn4gSQG1
	1lSA3JyKXEm5fxQrd5l2oipLfxLztz98IdSqZexSbAsptCZVByMFnenKuI7s1yH2MgrrJ8/yd2A
	o1VrMZL10v1R+ojzmlmti8ZZdCl5hCGIeRbbVU8oUaEzAn7jyIWPxdkB5cBtuDFruwTCCjO8jhO
	vFNE/ooeIsIXyeMcA+rry+v+212ma7B0YXXJJ77ydHzyW8f6XIB/t9bWnnAV4j+oNJ1y4WNh8qJ
	zQVzRHuArAmwtCMXr7Dt5XqWjiBULgu77aXSli+mKQr2ZV8Jsi+hHA3JC9O1nkpvzJR0yTukLM6
	zIrhKPw8mCSP/gO6xT7kYhuS0erGC5G0Hii6tUbA4jdN14/+81CFOFYAlO+YgAdk0FLsaHL/MeX
	TUUpNg+0RANkOfHBwEokCCxaVd9yvxVW97B+fv29gQf+k1d0AXtB0qUtrLYws3jqczWP7rPAr06
	hy3hvBOpOBdMvqx0rwgT2Krrq2iRLt5dH6itP+i8QEn
X-Received: by 2002:a05:600c:4fc6:b0:485:365f:b4e7 with SMTP id 5b1f17b1804b1-485566d2c9dmr198517295e9.14.1773653403907;
        Mon, 16 Mar 2026 02:30:03 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/17] gdk-pixbuf: Fix CVE-2025-6199
Date: Mon, 16 Mar 2026 10:28:22 +0100
Message-ID: <2777c230d705963db8ff95de27de979f0ba51cd0.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233225

From: Shaik Moin <careers.myinfo@gmail.com>

Backport the fix for CVE-2025-6199
Add below patch to fix
CVE-2025-6199.patch

Reference: In Ubuntu and debian, fixed patch is given -> [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32]

Signed-off-by: Shaik Moin <moins@kpit.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
[YC: removed the extra ".patch" in patches Backport URL]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch | 36 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-6199.patch
new file mode 100644
index 00000000000..1952e3ceaf5
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
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
index 471d72d8ddf..122cd598fc2 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            file://CVE-2025-7345.patch \
+           file://CVE-2025-6199.patch \
            "
 
 SRC_URI[sha256sum] = "ee9b6c75d13ba096907a2e3c6b27b61bcd17f5c7ebeab5a5b439d2f2e39fe44b"

