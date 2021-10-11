Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E287C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:41:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.9538.1633945274552399680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TDPxuXeO;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id m22so54260668wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q2NuhBtGg2b8GgHZ9lEdrIvZs8S4Zr04dShJ2U0MI3A=;
        b=TDPxuXeOrgtOmgI4GnzdhOqQvIw0Y8fMcvbgml2w5afOyDfnda+SLP4Z08c1kNUEoM
         bncn6+SrsmM55hQ4rSzducBv+irfNoTOGrjDjlgeSjERq9tDwcehaM+fOYiUBR1Uy9Zo
         XNGyT7vmdvCTcCX7dy0VkVXKpyxQfFPq7GaZzZOyKANzJJFQfUlkmitZt2kY97nHluRF
         OOrGNpy84X3RhVO93/H8cPCYpkrCBK3wiuropsQ41tV5GA/lphO/HFJbfM+4iiA+0jvt
         0Hvr5+KkzJOOMvsNhCkbJiw8gNYkzBMfVlNYzpOSVoYUbFLgFxOMm8ZA4n9nEWbPNFMJ
         Ak6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q2NuhBtGg2b8GgHZ9lEdrIvZs8S4Zr04dShJ2U0MI3A=;
        b=MqvYjpEEYBd3UO0FZcNu8/jkD9V598lYlo468N60yOtlDCVTi47NwKIDzDYn/TL7ot
         ppubhxm01fNbFax3WSNEm8HsT7goKLbvgcMQWfeALeNqLWAfxHHr3gcHw473rCLDrMPf
         Ow+yFTs34ipx19d6o8zR5r6lTojKWSItKJNII8bdn9Eow1QEZT1TUrkq4PHrLLghn3ae
         xhyuwNM3iGe9uiXkuR2uaRsq21yKD5OJK8K/wuPKgu3Dx1BONGc+D7vhCccjeaRgW7om
         QcJRqcELk3ocE2r8P/qB7Mmvab/9mujSJwG4Vkkn1bPfFjUtRA7tRlDfKN7kJVAx33fr
         1qJg==
X-Gm-Message-State: AOAM531zEBzGm3lJjOUhvIvJ1RpISu39GyBbLkSu/arMSfNacETMqkII
	uvJydWeXGopoeNk927DLnO3qyMNOS/I=
X-Google-Smtp-Source: 
 ABdhPJwSc4zdnzF2DDO8RqMOuefhGA76/kKJ7I0l5NyRER7YoBpElVMYMWkYAt6/8NOGSqhrLaDjjg==
X-Received: by 2002:adf:97cd:: with SMTP id
 t13mr23400100wrb.312.1633945273002;
        Mon, 11 Oct 2021 02:41:13 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k17sm7180758wrc.93.2021.10.11.02.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 02:41:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Changqing Li <changqing.li@windriver.com>
Subject: [PATCH 15/25] libexif: update 0.6.22 -> 0.6.23
Date: Mon, 11 Oct 2021 11:40:49 +0200
Message-Id: <20211011094059.4184654-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156827

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libexif/files/CVE-2020-0198.patch         | 66 -------------------
 .../libexif/files/CVE-2020-0452.patch         | 39 -----------
 .../{libexif_0.6.22.bb => libexif_0.6.23.bb}  |  6 +-
 3 files changed, 2 insertions(+), 109 deletions(-)
 delete mode 100644 meta/recipes-support/libexif/files/CVE-2020-0198.patch
 delete mode 100644 meta/recipes-support/libexif/files/CVE-2020-0452.patch
 rename meta/recipes-support/libexif/{libexif_0.6.22.bb => libexif_0.6.23.bb} (75%)

diff --git a/meta/recipes-support/libexif/files/CVE-2020-0198.patch b/meta/recipes-support/libexif/files/CVE-2020-0198.patch
deleted file mode 100644
index 2a48844cb2b..00000000000
--- a/meta/recipes-support/libexif/files/CVE-2020-0198.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From ca71eda33fe8421f98fbe20eb4392473357c1c43 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 30 Dec 2020 10:22:47 +0800
-Subject: [PATCH] fixed another unsigned integer overflow
-
-first fixed by google in android fork,
-https://android.googlesource.com/platform/external/libexif/+/1e187b62682ffab5003c702657d6d725b4278f16%5E%21/#F0
-
-(use a more generic overflow check method, also check second overflow instance.)
-
-https://security-tracker.debian.org/tracker/CVE-2020-0198
-
-Upstream-Status: Backport[https://github.com/libexif/libexif/commit/ce03ad7ef4e8aeefce79192bf5b6f69fae396f0c]
-CVE: CVE-2020-0198
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libexif/exif-data.c | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/libexif/exif-data.c b/libexif/exif-data.c
-index 8b280d3..34d58fc 100644
---- a/libexif/exif-data.c
-+++ b/libexif/exif-data.c
-@@ -47,6 +47,8 @@
- #undef JPEG_MARKER_APP1
- #define JPEG_MARKER_APP1 0xe1
- 
-+#define CHECKOVERFLOW(offset,datasize,structsize) (( offset >= datasize) || (structsize > datasize) || (offset > datasize - structsize ))
-+
- static const unsigned char ExifHeader[] = {0x45, 0x78, 0x69, 0x66, 0x00, 0x00};
- 
- struct _ExifDataPrivate
-@@ -327,7 +329,7 @@ exif_data_load_data_thumbnail (ExifData *data, const unsigned char *d,
- 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail offset (%u).", o);
- 		return;
- 	}
--	if (s > ds - o) {
-+	if (CHECKOVERFLOW(o,ds,s)) {
- 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail size (%u), max would be %u.", s, ds-o);
- 		return;
- 	}
-@@ -420,9 +422,9 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
- 	}
- 
- 	/* Read the number of entries */
--	if ((offset + 2 < offset) || (offset + 2 < 2) || (offset + 2 > ds)) {
-+	if (CHECKOVERFLOW(offset, ds, 2)) {
- 		exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
--			  "Tag data past end of buffer (%u > %u)", offset+2, ds);
-+			  "Tag data past end of buffer (%u+2 > %u)", offset, ds);
- 		return;
- 	}
- 	n = exif_get_short (d + offset, data->priv->order);
-@@ -431,7 +433,7 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
- 	offset += 2;
- 
- 	/* Check if we have enough data. */
--	if (offset + 12 * n > ds) {
-+	if (CHECKOVERFLOW(offset, ds, 12*n)) {
- 		n = (ds - offset) / 12;
- 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
- 				  "Short data; only loading %hu entries...", n);
--- 
-2.17.1
-
diff --git a/meta/recipes-support/libexif/files/CVE-2020-0452.patch b/meta/recipes-support/libexif/files/CVE-2020-0452.patch
deleted file mode 100644
index a117b8b3691..00000000000
--- a/meta/recipes-support/libexif/files/CVE-2020-0452.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 302acd49eba0a125b0f20692df6abc6f7f7ca53e Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 30 Dec 2020 10:18:51 +0800
-Subject: [PATCH] fixed a incorrect overflow check that could be optimized
- away.
-
-inspired by:
-https://android.googlesource.com/platform/external/libexif/+/8e7345f3bc0bad06ac369d6cbc1124c8ceaf7d4b
-
-https://source.android.com/security/bulletin/2020-11-01
-
-CVE-2020-0452
-
-Upsteam-Status: Backport[https://github.com/libexif/libexif/commit/9266d14b5ca4e29b970fa03272318e5f99386e06]
-CVE: CVE-2020-0452
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libexif/exif-entry.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libexif/exif-entry.c b/libexif/exif-entry.c
-index 5de215f..3a6ce84 100644
---- a/libexif/exif-entry.c
-+++ b/libexif/exif-entry.c
-@@ -1371,8 +1371,8 @@ exif_entry_get_value (ExifEntry *e, char *val, unsigned int maxlen)
- 	{
- 		unsigned char *utf16;
- 
--		/* Sanity check the size to prevent overflow */
--		if (e->size+sizeof(uint16_t)+1 < e->size) break;
-+		/* Sanity check the size to prevent overflow. Note EXIF files are 64kb at most. */
-+		if (e->size >= 65536 - sizeof(uint16_t)*2) break;
- 
- 		/* The tag may not be U+0000-terminated , so make a local
- 		   U+0000-terminated copy before converting it */
--- 
-2.17.1
-
diff --git a/meta/recipes-support/libexif/libexif_0.6.22.bb b/meta/recipes-support/libexif/libexif_0.6.23.bb
similarity index 75%
rename from meta/recipes-support/libexif/libexif_0.6.22.bb
rename to meta/recipes-support/libexif/libexif_0.6.23.bb
index 9ca96d548c2..b33522dfc42 100644
--- a/meta/recipes-support/libexif/libexif_0.6.22.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.23.bb
@@ -10,12 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 def version_underscore(v):
     return "_".join(v.split("."))
 
-SRC_URI = "https://github.com/libexif/libexif/releases/download/libexif-${@version_underscore("${PV}")}-release/libexif-${PV}.tar.xz \
-           file://CVE-2020-0198.patch \
-           file://CVE-2020-0452.patch \
+SRC_URI = "https://github.com/libexif/libexif/releases/download/v${PV}/libexif-${PV}.tar.xz \
            "
 
-SRC_URI[sha256sum] = "5048f1c8fc509cc636c2f97f4b40c293338b6041a5652082d5ee2cf54b530c56"
+SRC_URI[sha256sum] = "a740a99920eb81ae0aa802bb46e683ce6e0cde061c210f5d5bde5b8572380431"
 
 UPSTREAM_CHECK_URI = "https://github.com/libexif/libexif/releases/"
 
-- 
2.20.1


