Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49256F55451
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 06:07:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63273.1772078853439667575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 20:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y36PddGm;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: careers.myinfo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2add623cb27so2327735ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 20:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772078852; x=1772683652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2L0GLnWlXapASo76JHNuWDa+go6pPN7YQyTUMC3mjI=;
        b=Y36PddGmky96JQd0ZuNaqHXISHOtqBWTh+eRcwuGNr61KfSaFIUllcowo/wfBZDR8R
         D0/DLjac+S3wckx+1tAQZdQUwremS4YH5L0NRxp4ZGpVB4BwhrwsfX/1EXyBTTVGGHm8
         kRBIN8Up3fq5k3uTS28OZHlfIDSsXNoZu0J6h97TBzsPILUmJJTO1B2qqII5Ewo7QoB2
         mU2lepf7ZBzNrVNaoV7qemMeURIqxLqpF4A4WwcPFSbqCk/Vh240Ioa0hnis85+8OmH+
         wyY7BDEIKS5QztZ+0KNENJr9IRj3PdXRE3yDjj73+TWFMcZ06b8/2YgP5C+hlmEf5bvN
         Bvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772078852; x=1772683652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2L0GLnWlXapASo76JHNuWDa+go6pPN7YQyTUMC3mjI=;
        b=fw34l44EQmlI6sylXb/slBT5IPMF2+LrleMpGvePxOcew84unwjVWUsD4GRjU8u1rP
         lW+iKrWB1+io0vcjLs9v7xoas46aIutDlR9CRlYRW/WzWyH025E039CFEgzyim+N9jXn
         bacB/54GSWyTQxvvaGz+x4PcwZG5HbyI0iRv+7sQIl4SEpXZp3ifqaHc9Dr2UIEbsuvE
         ciKyWk9yBc0homv5qFH+39JlwqGS+L8wZ6IFGFJHeFpnUbLa0JNnQjs1UPtNS2RvzXFI
         9H4D5SIQVcvPGH09AQHPTBu/OwcAGIF2gr1Xrr7j85ece6GUlZ53hRtk34cT9rQHZqIE
         B6MQ==
X-Gm-Message-State: AOJu0YzjlXDX2Ab5tLeE0xtL6pH1wFI/W2FMbhdPRiuoUP5VJ3TXjDxy
	6w4FQvf/VYWNzBN4H6WiAyzV1KnKD41FFYJDjfHmdYph+vGwO07n8zj0yb0W2w==
X-Gm-Gg: ATEYQzz+VppEnO4gb4O10wj9ts7v9jk/Dyoi70YbE4zAtNY+e/G7NN9ygEb626RmjAu
	WqoCApUztfmCNGMYR7+rJQwVTTY6ZRpX9U9JF1asIxr1kx61OmrH7aLioXvPkXp+syMQfjwUNaJ
	vqh6Yq7Tubvnu5pdO3fs9CWh6jSFM/Y4FzLapQ+1QdMvzzkdfNTN5SpxGUAHjV9gXZYMc0c5Yl0
	PAfv8Dg0mXnssYAPCy4UDcRrKuJ1q/Iby9q6GVXIPfoAGzJaTPt9now5OViYUWGsUDA/I70QYoe
	s044bQORDzUQejhBuop78I9+T0kKcnhW12LnZ7WOGYiapnzFaxmTzJRW04lq1zsFgYF9lTO/Bli
	g869jBmecq71q3UP6KNBHn9OPOVwSiMQ+XQSaLaWbyjfkLXmyMbKKHStHnwJsD4hxSoEQVDQI0e
	Nq12zuV16i1zdi6uifJKJtyQ2Ocw==
X-Received: by 2002:a17:902:f60e:b0:2aa:e574:d7e8 with SMTP id d9443c01a7336-2ae00076bd5mr9473935ad.0.1772078852413;
        Wed, 25 Feb 2026 20:07:32 -0800 (PST)
Received: from L-15597L.kpit.com ([157.50.96.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c243esm8951675ad.29.2026.02.25.20.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 20:07:31 -0800 (PST)
From: Shaik Moin <careers.myinfo@gmail.com>
X-Google-Original-From: Shaik Moin <moins@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: careers.myinfo@gmail.com
Subject: [OE-core][whinlatter][PATCH] gdk-pixbuf: Fix CVE-2025-6199
Date: Thu, 26 Feb 2026 09:36:34 +0530
Message-Id: <20260226040634.21819-1-moins@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 06:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231988

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
index 98993cc07d..f22dc2cd91 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -22,6 +22,7 @@ SRC_URI += "\
            file://run-ptest \
            file://fatal-loader.patch \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
+           file://CVE-2025-6199.patch \
            "
 
 GIR_MESON_OPTION = 'introspection'
-- 
2.34.1


