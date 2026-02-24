Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26108F357A6
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21472.1771943111350901878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lZjv4yxe;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so48732305e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943109; x=1772547909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdkfgSPRhmbqk5kjMxiAs6AFTvDi3d87PSS2mM9cjSU=;
        b=lZjv4yxesi7hhUIwFb9akoG4pU/P1ZBSseARVBxtr+6BMgWylqHy8FEcKf4bjpgc9b
         U0ciPYsSeiuo2+tbHjt6lWazp5ek+VwHkBaVaj87GJf9/z6PalcMhHf/0UJAYsBzidTg
         t8qNAbfk3cU1Kl5Cx5zp/p+baj84ub6iwE5Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943109; x=1772547909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DdkfgSPRhmbqk5kjMxiAs6AFTvDi3d87PSS2mM9cjSU=;
        b=d2aHOsWrKNKyR4xKurcAz1g3Wg0rLWh/fsaTWsHyGJkJloKFzG21dRPHD4JFY77NBv
         FYrIBqwBYOFvKBM3jcDJHKfJtM5emnfhsFMUu6vxHqiAuZr4cnNxQTpD6CIuVprv1oHc
         NGm3sS5GQFHscYCSF9Rawvt5JZXVDcVn7gP/g/+/SmRis1+Mm2e8J9n27uHjOoXBBd9u
         hFxczF/yL9ZZEtTwD1YnB7StG2+oslZjiQoQuORhcwroIy6MhAnhkSaVMC/zShJdS8Ql
         Qbnygln+rGY9fXd6TjHoT57lRVXcXWHmNzK9uRM0hua+ao/IKKrKD1Q3dDt4CjdoAydw
         eM7Q==
X-Gm-Message-State: AOJu0Yxgz4+2G7dsDR5UY/9OcV0mX8qHd6cN2EsMPkc3MnNllHiM3XMv
	54W2DLqkKWJFJium5O/vzIu2RRIORbQB9HM3LPvNkFLHm18jHXfjbeXpakqArOwdjzAO4JldG8Z
	TChtw
X-Gm-Gg: AZuq6aKviELqVsTAXFOKMySAfwAgTrSw66NgbI9MeIJZM3At6soGOD15y9TldC3Usjg
	DbvK5SnHejknapsvZ6wRw+zMdbjES5efK6B99qDSk4DRZ09WGUGvI+4NdDXhsNA6bPMSb8kjdXA
	xezyausa53vk+tip6I4/sSgkWfhn8PfNx8TDXH0eTYspORAJSzbR+3g2IwPD2NaFR5knTkEFN7b
	DEzj7ng1glYglcaTGFO7YZW35hD2RKWF+F31OeOFkBQ5G+tNoB5xd4MrTkEycyr+PX7zdGbiBTz
	8JOPyKax3+C/VymsUxb9VjO6pXSDgZ9sHfY+xoekDRLtbZdwsSS85iq/bgd4pnLRRj+Rxfgd3CA
	mWwhLvHaGOkdlZQylcAFW4ulY/ekc8Fvym841T+rSF6ovQJ1TWvIquD7K2YJoEiXTaPkfMpBxsF
	lxCTWOxljsPg0WhFLnDgXMzfkrPOt0rrXwJrj42BslEtHvOH5hF+m7vc94N97xYBHbwNtOOfj/a
	TkWQkFIvVO4u+30EeWs2D65h+nRSY5wUUBMp9haEa//
X-Received: by 2002:a05:600c:620c:b0:483:43d8:8d68 with SMTP id 5b1f17b1804b1-483a95f8988mr199166825e9.28.1771943109406;
        Tue, 24 Feb 2026 06:25:09 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/38] libpng: patch CVE-2026-25646
Date: Tue, 24 Feb 2026 15:24:12 +0100
Message-ID: <35acc045b44a1cda6bfadcb14d33d94094b854c9.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231786

From: Peter Marko <peter.marko@siemens.com>

Backport patch mentioned in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/files/CVE-2026-25646.patch         | 61 +++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
new file mode 100644
index 00000000000..e97c5078b04
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
@@ -0,0 +1,61 @@
+From 01d03b8453eb30ade759cd45c707e5a1c7277d88 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 6 Feb 2026 19:11:54 +0200
+Subject: [PATCH] Fix a heap buffer overflow in `png_set_quantize`
+
+The color distance hash table stored the current palette indices, but
+the color-pruning loop assumed the original indices. When colors were
+eliminated and indices changed, the stored indices became stale. This
+caused the loop bound `max_d` to grow past the 769-element hash array.
+
+The fix consists in storing the original indices via `palette_to_index`
+to match the pruning loop's expectations.
+
+Reported-by: Joshua Inscoe <pwnalone@users.noreply.github.com>
+Co-authored-by: Joshua Inscoe <pwnalone@users.noreply.github.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+
+CVE: CVE-2026-25646
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/01d03b8453eb30ade759cd45c707e5a1c7277d88]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ AUTHORS    | 1 +
+ pngrtran.c | 6 +++---
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/AUTHORS b/AUTHORS
+index b9c0fffcf..4094f4a57 100644
+--- a/AUTHORS
++++ b/AUTHORS
+@@ -14,6 +14,7 @@ Authors, for copyright and licensing purposes.
+  * Guy Eric Schalnat
+  * James Yu
+  * John Bowler
++ * Joshua Inscoe
+  * Kevin Bracey
+  * Magnus Holmgren
+  * Mandar Sahastrabuddhe
+diff --git a/pngrtran.c b/pngrtran.c
+index fe8f9d32c..1fce9af12 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1,7 +1,7 @@
+ 
+ /* pngrtran.c - transforms the data in a row for PNG readers
+  *
+- * Copyright (c) 2018-2019 Cosmin Truta
++ * Copyright (c) 2018-2026 Cosmin Truta
+  * Copyright (c) 1998-2002,2004,2006-2018 Glenn Randers-Pehrson
+  * Copyright (c) 1996-1997 Andreas Dilger
+  * Copyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.
+@@ -647,8 +647,8 @@ png_set_quantize(png_structrp png_ptr, png_colorp palette,
+                          break;
+ 
+                      t->next = hash[d];
+-                     t->left = (png_byte)i;
+-                     t->right = (png_byte)j;
++                     t->left = png_ptr->palette_to_index[i];
++                     t->right = png_ptr->palette_to_index[j];
+                      hash[d] = t;
+                   }
+                }
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index c4347a67151..448594e0d77 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
            file://CVE-2025-66293-02.patch \
            file://CVE-2026-22695.patch \
            file://CVE-2026-22801.patch \
+           file://CVE-2026-25646.patch \
 "
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"

