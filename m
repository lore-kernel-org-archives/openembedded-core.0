Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC536C4E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 22:54:45 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id h5so10175101lfm.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 15:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=BYoHbPQirzgYRwJkWtzQO+vn65YhHbjKgB6tXo+A66E=;
	b=xyamWpHLYMISuuN5lWSx9SYTJ7lCIBwWHqjb49fuQsUbnZ7PXIxOXajF8UTGAMiXVx
	A6jR/DZzefCzePoqOoUoQAbqsoGpdI7NlGk7QpTw6RzryyzLF4vKYdqV+ZpDZ4LmyGz0
	wWI5fvAmjqijXOCQfRPVU0yVl9xp3DLK5LkvPUKVueIqU3DG1pxLc74cQC5/jlTt/w0k
	wnU/b2NMwcoUM0yqmYzVgT+Mnuer7liRGSeEjK3WcKff9kiRw32P9QmJIgpHndN7yTvb
	IrkpUy87Gx1jb24xWVnAcYFDxPZ5rOyXdBab1w9KJsXBcnUV7GccLel3khIIF9jcU29B
	V+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BYoHbPQirzgYRwJkWtzQO+vn65YhHbjKgB6tXo+A66E=;
	b=Zrv0WHiErqa04qLi1vbrKY99FcJ/gyveJR9U5AgSQ/tOtBzmPV8rhSq0B1+32hxp/F
	y8inmH7KnCfHz9jkVTrJPosUnhSN9he02LvlCmbnO5MLm0v1xb7ynbq8KRswFbPkfUpo
	70Y+ElIhCwxllw87/cZPqarKOZK2uQOP63lnjIfv9ZeYlUpPLvHQJ7heK8RycRlOm9Rs
	JvjNdlrhthlZl4wrcimYF1tCnQRaAybrRRkKHYcnubBQtpOvD/CFOFJ83bUZ93LpFx9q
	kyq2zSG/97xOA30S6fgHJuVgNyY3ILq6KoFP2bgDkf0imx8G6XgMm38DlB9kmh0UNqpA
	R59A==
X-Gm-Message-State: APjAAAWzag5QobHZmFJ+zZldHVtwuogpEbUp/QxlBT1FAbglThsjp7hi
	Dd5KjEX2glvRw6Pf1J+1BqsmDhnMsO8=
X-Google-Smtp-Source: APXvYqzfoviayQDbUFvt0v6gui7k41DPTFCiPzDo+EG3DX4Wr6W+37uNZXXeaYZthiQ26PbW/vCuzA==
X-Received: by 2002:a19:c216:: with SMTP id l22mr11411538lfc.112.1555973685264;
	Mon, 22 Apr 2019 15:54:45 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	p76sm3548989ljb.63.2019.04.22.15.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Apr 2019 15:54:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Apr 2019 00:54:38 +0200
Message-Id: <20190422225438.12667-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libcroco: update to 0.6.13
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
X-List-Received-Date: Mon, 22 Apr 2019 22:54:45 -0000

Removed patches were upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libcroco/libcroco/CVE-2017-7960.patch     | 56 -------------------
 .../libcroco/libcroco/CVE-2017-7961.patch     | 45 ---------------
 ...{libcroco_0.6.12.bb => libcroco_0.6.13.bb} |  8 +--
 3 files changed, 2 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-7960.patch
 delete mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
 rename meta/recipes-support/libcroco/{libcroco_0.6.12.bb => libcroco_0.6.13.bb} (72%)

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2017-7960.patch b/meta/recipes-support/libcroco/libcroco/CVE-2017-7960.patch
deleted file mode 100644
index f6f43c3d26..0000000000
--- a/meta/recipes-support/libcroco/libcroco/CVE-2017-7960.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-input: check end of input before reading a byte
-
-When reading bytes we weren't check that the index wasn't
-out of bound and this could produce an invalid read which
-could deal to a security bug.
-
-Upstream-Status: Backport[https://gitlab.gnome.org/GNOME/libcroco/
-                 commit/898e3a8c8c0314d2e6b106809a8e3e93cf9d4394]
-
-CVE: CVE-2017-7960 
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-diff --git a/src/cr-input.c b/src/cr-input.c
-index 49000b1f5f07fe057135f1b8fc69bdcf9613e300..3b63a88ee3b1c56778e58172d147d958951bf099 100644
---- a/src/cr-input.c
-+++ b/src/cr-input.c
-@@ -256,7 +256,7 @@ cr_input_new_from_uri (const gchar * a_file_uri, enum CREncoding a_enc)
-                  *we should  free buf here because it's own by CRInput.
-                  *(see the last parameter of cr_input_new_from_buf().
-                  */
--                buf = NULL ;
-+                buf = NULL;
-         }
- 
-  cleanup:
-@@ -404,6 +404,8 @@ cr_input_get_nb_bytes_left (CRInput const * a_this)
- enum CRStatus
- cr_input_read_byte (CRInput * a_this, guchar * a_byte)
- {
-+        gulong nb_bytes_left = 0;
-+
-         g_return_val_if_fail (a_this && PRIVATE (a_this)
-                               && a_byte, CR_BAD_PARAM_ERROR);
- 
-@@ -413,6 +415,12 @@ cr_input_read_byte (CRInput * a_this, guchar * a_byte)
-         if (PRIVATE (a_this)->end_of_input == TRUE)
-                 return CR_END_OF_INPUT_ERROR;
- 
-+        nb_bytes_left = cr_input_get_nb_bytes_left (a_this);
-+
-+        if (nb_bytes_left < 1) {
-+                return CR_END_OF_INPUT_ERROR;
-+        }
-+
-         *a_byte = PRIVATE (a_this)->in_buf[PRIVATE (a_this)->next_byte_index];
- 
-         if (PRIVATE (a_this)->nb_bytes -
-@@ -477,7 +485,6 @@ cr_input_read_char (CRInput * a_this, guint32 * a_char)
-                 if (*a_char == '\n') {
-                         PRIVATE (a_this)->end_of_line = TRUE;
-                 }
--
-         }
- 
-         return status;
diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch b/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
deleted file mode 100644
index 35471ec7ee..0000000000
--- a/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-CVE: CVE-2017-7961
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 9ad72875e9f08e4c519ef63d44cdbd94aa9504f7 Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Sun, 16 Apr 2017 13:56:09 +0200
-Subject: [PATCH] tknzr: support only max long rgb values
-
-This fixes a possible out of bound when reading rgbs which
-are longer than the support MAXLONG
----
- src/cr-tknzr.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/cr-tknzr.c b/src/cr-tknzr.c
-index 1a7cfeb..1548c35 100644
---- a/src/cr-tknzr.c
-+++ b/src/cr-tknzr.c
-@@ -1279,6 +1279,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
-         status = cr_tknzr_parse_num (a_this, &num);
-         ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
- 
-+        if (num->val > G_MAXLONG) {
-+                status = CR_PARSING_ERROR;
-+                goto error;
-+        }
-+
-         red = num->val;
-         cr_num_destroy (num);
-         num = NULL;
-@@ -1298,6 +1303,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
-                 status = cr_tknzr_parse_num (a_this, &num);
-                 ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
- 
-+                if (num->val > G_MAXLONG) {
-+                        status = CR_PARSING_ERROR;
-+                        goto error;
-+                }
-+
-                 PEEK_BYTE (a_this, 1, &next_bytes[0]);
-                 if (next_bytes[0] == '%') {
-                         SKIP_CHARS (a_this, 1);
--- 
-2.18.1
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
similarity index 72%
rename from meta/recipes-support/libcroco/libcroco_0.6.12.bb
rename to meta/recipes-support/libcroco/libcroco_0.6.13.bb
index f95a583134..9171a9de5c 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
@@ -16,9 +16,5 @@ BINCONFIG = "${bindir}/croco-0.6-config"
 
 inherit gnomebase gtk-doc binconfig-disabled
 
-SRC_URI += "file://CVE-2017-7960.patch \
-            file://CVE-2017-7961.patch \
-            "
-
-SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
-SRC_URI[archive.sha256sum] = "ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860"
+SRC_URI[archive.md5sum] = "c80c5a8385011a0260dce6bd0da93dce"
+SRC_URI[archive.sha256sum] = "767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4"
-- 
2.17.1


