Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E71C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25553.1788167063138141163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qxQLPPLS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 56AF31A18D4
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 245C460231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0046B11C78388;
	Mon, 31 Aug 2026 11:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=13L5DAUf9LO44cxfOP1gsJ/vrI7fxuq28dfcuGv3+rc=;
	b=qxQLPPLSIuEkqhE0Lrzh6fG6W/Y/Z8wceZ75lLPdJVTeounrJqWZ92oWec8dJ6Iuw4hyq8
	vinX//5TRGvXrgcrVZHmDtQlQw5H7isOm9g71SQBXTaKe6vZ9qUbQBraxk9zn3/zhx64+8
	Z4YMfUn0RA8GUNANGBZ6tEhv28+GtweYHfjtnHp5ekObVpb9nNGLpNBpPL4DGsHOL7GTY2
	VncO6eJ6gR+FmdxYJfqsoCix2AR5ksFQdkLchkqXwDfS/tg1D0OrIZU7ekXkD1p0C2/8mL
	39Z0iSnGXhKjySz7Ph8irAa99g3AE0jmUsw4mKucMmYb8kOUPih5itcLlqwZ7A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 31 Aug 2026 11:03:37 +0200
Subject: [PATCH 5/9] libksba: upgrade 1.8.0 -> 1.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-5-58b54db72860@bootlin.com>
References: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
In-Reply-To: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=2181;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=bQQYZJA3U7bStR9TwtlqewlNaTfaTbDlz5uonBmjmJY=;
 b=8155jRBL0U+o6YXP+TTlYHx/m+e08RBHlwpFGfXyeis8FpxZVwZFQnTF/rFt8elqQOd8kCJom
 5897NVh6TwZCvrPg2rY+eNF7YZ/EYNUmu4ybsbPcGRaQtQcf1xQXH2i
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244747

Source: ChangeLog

2026-08-24  Werner Koch  <wk@gnupg.org>

	Release 1.8.1.
	+ commit 717381422750fb5a3e971d768ba46cae9a01682d

2026-07-30  NIIBE Yutaka  <gniibe@fsij.org>

Fix CMS parser to avoid possible infinite loop.
	+ commit 06720f9b16a172404f49089cbb6eb95e4344f562
	* src/cms-parser.c (_ksba_cms_parse_signed_data_part_2): Finish
	when detecting no progress.
	(_ksba_cms_parse_enveloped_data_part_1): Likewise.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch | 2 +-
 meta/recipes-support/libksba/{libksba_1.8.0.bb => libksba_1.8.1.bb}   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index 94612ec0a97a..1ba19e5c75b7 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From a915d694b97f3226f6776ce405e8562b568070bf Mon Sep 17 00:00:00 2001
+From 1d1feec71e364aba1fe9e2608f422e8970bd9e9e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
diff --git a/meta/recipes-support/libksba/libksba_1.8.0.bb b/meta/recipes-support/libksba/libksba_1.8.1.bb
similarity index 95%
rename from meta/recipes-support/libksba/libksba_1.8.0.bb
rename to meta/recipes-support/libksba/libksba_1.8.1.bb
index 553fd336cce2..ce08fe442635 100644
--- a/meta/recipes-support/libksba/libksba_1.8.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.8.1.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "296b9db9095749f2aa104202d7ab7fd09ad10710e00780a709c9754b1a1d9292"
+SRC_URI[sha256sum] = "c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy

-- 
2.47.3


