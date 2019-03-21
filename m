Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id AA0B77CEA2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 12:31:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id h18so2509898wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 05:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=R4qNOEVoiI75ayWRVQC/gC4e1zrzMHr2O9X7394eP6I=;
	b=GOVRAoUQTp+Kf/Vp8dTQ3RdKqeZBwgzMG3KwchHHmCrp25GQ3oHvsl2DAS64Oxhvfx
	Ur161wT/lPfWb0wW0hLUQPbjkGutB6IotIU/Mlk8V2SEBZb5rhzwrrqxCBtMrB3a7x3M
	cbc83Kps9GX7vqTxUlLQMY9qK0UY4jaTL/Cx6vYLwgA9rLOGCzn3lB7qpLbV8SOdlIYO
	TqLQe3cIBMRFkDUQ/fSC3/lcPFAn4FZMIqV0mV/R1xAY/YDwyV76BEqk26JgEprxyOMw
	AE1DSKIz/ngkYo/OlVO2QGif4o0zgmOwoji8suyYYGwJQMlrDhI+Ap+1Za2QbylLdpSo
	klpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=R4qNOEVoiI75ayWRVQC/gC4e1zrzMHr2O9X7394eP6I=;
	b=UfLBZsQ0Wmnl2I3nK7v3toPYSBh66vxwZDwiSyfJHkkKz+9qUukELNZVCHF57YG4CN
	VihxfFzKNFXSd+jIn7rN4By8RqgwypAC/uyRz8VNeSL8WuZW7hnwyIkGt+KtCvGSJYbf
	sPXExZZMA8QM/NHE1cjbLia3zM7pqs+OmyhwUWd9nBTLgbRXkzSHHedLxIo8ROpQu/YK
	OFZTWWM4dBt/ZwjhdvQKoedBEenf3M1Xp4s8HrQRgQn3fBy8Y7/MP+m8oovache/iE0m
	g5v/VpFevBEYBoqZdN/TGTxOCRE7FiLRsNUk5PTbILPdxJgr2MbCMgY4IjBGnwrCVhgI
	wYRQ==
X-Gm-Message-State: APjAAAVz7ursZb92qvSPG/i4j7po/5mmqKN1+7rY7YsyBdJvIIB9baXA
	q7qdg7SXhYKQXIeoXBObNYBRn8YFMH0=
X-Google-Smtp-Source: APXvYqxnNYJzm6XOeqc46rNWA/ysPdRP1pAZWbBdbv4nupEY6HqUa+ijHcvtNNi7daAqwDgO2xP7wg==
X-Received: by 2002:a7b:c92b:: with SMTP id h11mr2331192wml.33.1553171499193; 
	Thu, 21 Mar 2019 05:31:39 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d11sm3732939wmb.19.2019.03.21.05.31.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Mar 2019 05:31:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2019 12:31:36 +0000
Message-Id: <20190321123136.3178-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libcroco: fix CVE-2017-7961
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
X-List-Received-Date: Thu, 21 Mar 2019 12:31:38 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libcroco/libcroco/CVE-2017-7961.patch          | 45 ++++++++++++++++++++++
 meta/recipes-support/libcroco/libcroco_0.6.12.bb   |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch b/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
new file mode 100644
index 00000000000..35471ec7ee3
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
@@ -0,0 +1,45 @@
+CVE: CVE-2017-7961
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 9ad72875e9f08e4c519ef63d44cdbd94aa9504f7 Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Sun, 16 Apr 2017 13:56:09 +0200
+Subject: [PATCH] tknzr: support only max long rgb values
+
+This fixes a possible out of bound when reading rgbs which
+are longer than the support MAXLONG
+---
+ src/cr-tknzr.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/cr-tknzr.c b/src/cr-tknzr.c
+index 1a7cfeb..1548c35 100644
+--- a/src/cr-tknzr.c
++++ b/src/cr-tknzr.c
+@@ -1279,6 +1279,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
+         status = cr_tknzr_parse_num (a_this, &num);
+         ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
+ 
++        if (num->val > G_MAXLONG) {
++                status = CR_PARSING_ERROR;
++                goto error;
++        }
++
+         red = num->val;
+         cr_num_destroy (num);
+         num = NULL;
+@@ -1298,6 +1303,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
+                 status = cr_tknzr_parse_num (a_this, &num);
+                 ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
+ 
++                if (num->val > G_MAXLONG) {
++                        status = CR_PARSING_ERROR;
++                        goto error;
++                }
++
+                 PEEK_BYTE (a_this, 1, &next_bytes[0]);
+                 if (next_bytes[0] == '%') {
+                         SKIP_CHARS (a_this, 1);
+-- 
+2.18.1
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
index 5b962ee738d..f95a583134c 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
@@ -16,7 +16,9 @@ BINCONFIG = "${bindir}/croco-0.6-config"
 
 inherit gnomebase gtk-doc binconfig-disabled
 
-SRC_URI += "file://CVE-2017-7960.patch"
+SRC_URI += "file://CVE-2017-7960.patch \
+            file://CVE-2017-7961.patch \
+            "
 
 SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
 SRC_URI[archive.sha256sum] = "ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860"
-- 
2.11.0


