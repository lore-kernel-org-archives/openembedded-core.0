Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013A4E81BD2
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 08:48:35 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14804.1770798998620841388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 00:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bRTM+7ta;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c56188aef06so2679110a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 00:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770798998; x=1771403798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NpSNWPkNqZUpbcQLlMXKO+Q+flPeFATyTbaIt6//AGs=;
        b=bRTM+7ta+oRDLlJ18ZULkr8yW4yWhofwmF5uyb+sEhT8vsIp3E3FUGQ1IKaYVVEtfO
         x4sKnRj4Fdzkngdl5N/lAm48c0H0pSL+n7UcKbzfsZb931IDQ5GUcnwLwpic+Jn9Ed2v
         vXpRzJ4Xt25/r0d3iG5ppw6HansYK3iEhYy1ldzPVC6nEU0U74zb9wRhhKOu8tcWbo8A
         MC+WTj8xCUf0QPkcW+TiOp8ngkb3K5F4sC5dTNNVSapKlj5Vs2PVkHH5wluEoZn/OotM
         UTGpCX76iwhYZ/BOtGtjHKkHmkLs19KfjTE+z9/RD1PMSMUQm4CPlz1skgV/AW7I55A4
         DfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798998; x=1771403798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpSNWPkNqZUpbcQLlMXKO+Q+flPeFATyTbaIt6//AGs=;
        b=skpqqXrAKs26bc80IocmiP6QKbn/0uXL82wm/i3s0qCJXhHb+LS+RdJlMpRsQHxNul
         dmPlIgHI/DvIkPr0+bYnB3mPv4SkZ9mdvkz3fe4ls8TBi0ryVhSEaLe/vrBgSDnFFQE0
         GQnFCrsbiX2X1XwlrIspDmoJkvrYt+PWrf5U7FNoSIlnRx0tWZvBdqHe/Au6T1yJA3k4
         CSg78qKjyqKJNaBXDKX+bTTMFjqGEFNCzh2Bur+c4W6WwTQwRidOwPwxHNUf2iALptAK
         zK3C5fFoPSHUAbixt47tvL/1uis2hZu7vjp/e/kTBAQi8UUdEpnLnyqaQF/RKoTEzVfF
         ld1g==
X-Gm-Message-State: AOJu0YxjhvNUGRTLzaal05KQUcSJJgWNukxoCLfeN5Bpujkpll4jBXCU
	t/YZJPoXnsqHelHrGZVwBdrVB5pSV62gg4Yak0klfHPmY+R4jPRQGNuuzcYaFQ==
X-Gm-Gg: AZuq6aKxXkz01+nTPAWlqK+SBlZ/O8SxfdDYS2lXTPiIXl5Uh7cSWI9NdebxeEZ/Yj4
	wCS38pRQ5oINPJxFNTIzZc8jufcdLyRU6VONIMcx4qWPhS84tn8Ymj0/oE6wtWPK6zI4ACF4z3Y
	/DLQfNjxQVRIT6d6sJxJYi6ctU6sFP8Rw+OoJP09JeIXwi9n2qb3nxnsBvLCgmyyrAJgqPHU7ve
	WJu8OW2wcXWDM1QbcCs6rQSoWq7sgWf7ndNA2lcZJVgVKzuSIV3377AYYWzNKU27FE66pb1BqIY
	agloFCTyKv7plB8eD7W+9cvGauR3vNdeUaUEo4GJVuQGrHEA9QbZOrCrbpEC52A0isJDwJHXi+R
	Tm4e3N82hgbM2mvaJvS+oWxi1BJKYPPd9IzzUw+oQLCrcxDUKFXKq47dtdDRKoEip7PEo9/aes1
	mUgAiugG/LfIVA8cW8+hi/wmYK
X-Received: by 2002:a17:90b:2c87:b0:340:2a16:94be with SMTP id 98e67ed59e1d1-3566799b54amr4411742a91.4.1770798997598;
        Wed, 11 Feb 2026 00:36:37 -0800 (PST)
Received: from L-15597L.kpit.com ([152.57.35.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662f8cc13sm5271785a91.14.2026.02.11.00.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:36:37 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][scarthgap][PATCH] gdk-pixbuf: Fix CVE-2025-6199
Date: Wed, 11 Feb 2026 14:05:56 +0530
Message-Id: <20260211083556.102891-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 08:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230974

CVE: CVE-2025-6199
Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565f3fa7a7597d32a32.patch]

Backport the fix for CVE-2025-6199
Add below patch to fix
0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch

Signed-off-by: Shaik Moin <moins@kpit.com>
---
 ...d-support-patch-to-fix-CVE-2025-6199.patch | 36 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
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
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index ff1c7a1fb2..8579614bb1 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            file://CVE-2025-7345.patch \
+           file://0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch \
            "
 
 SRC_URI[sha256sum] = "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"
-- 
2.34.1


