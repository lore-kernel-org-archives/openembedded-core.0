Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CC6C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:43 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.7366.1651727180277086270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CH7BE4x/;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id g20so3894901edw.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+/8gk/IGBRS4NxxtSjEXnL5ebJFV7le+lHe8U5yWgE=;
        b=CH7BE4x/m6FhqCDC33k0GX+gqzA2ulBj4c7rvQ7bKIWZb9OM5ajHxJSbStHfph3tPU
         QghuExUDRsMjIL8E7KPvBlLDuUAOtDurXwlwpQtUUA8+2UgzL/4uy6sPAbe7sKRjeIrw
         c4y9s/2vjVuFddShXOmeXtWdplO8iIH52iY+cqeZo2Ft8+V617b9HI2rDThwV5GrDsLQ
         li3zHdMhtkqit1Vv8N9qwspCE3NQ/02B1DriHRNnxJdRBfe0BSlAVi3HQbpUczBwU2rV
         0vAd/9xPh66bm4FqBcwl4vTi+QLcS6Da4LtPyfm606LK1n6rKfishN//0MofT1C6PudD
         19Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+/8gk/IGBRS4NxxtSjEXnL5ebJFV7le+lHe8U5yWgE=;
        b=FSCBrRw9KUdAQbCvleYIuMiH5470qzp4GEvjAWMvIlroQkU5ffbAn65AClfjt3Bttf
         2NHMVPmYdkwUQ1z2cYeX779tNVxYPKiGtZRZZqQ7g1wzpjcrawPkTL11sqF9y/VtPXHj
         BFNevnXYNmmNyG+POLVa8IQGkMI9FGRBgvkdCBhOosQAc0ib1FFogrvKiRNcgBDqR9wH
         y6SJx39Nx3BQgV7T5yWUcUk6jeWkUql7QP1ehUNcOig31uN2R6k2hK83GE8BJ+vyyTYV
         1mIIQh56WOVKlTXlXA9escfQ/j+OicZJWa4DQdppzlPuExv1JTs5ZXkRl9+2Qp/dOVWV
         MoHw==
X-Gm-Message-State: AOAM531mY+BnRuZDD1yP8QO6azzUuyTG8xFRQAA1jaa9a13TuNtvAlNN
	NdjfMzl2YJP8iAjU3KZsUAVDibgRcLU=
X-Google-Smtp-Source: 
 ABdhPJzTNYBBm3+jrVC3zcAe2V3rsMsIo+vgKmVQNUMV5K2aRHm/2sXbTktli6yHwr9HI95PqiwLXw==
X-Received: by 2002:a05:6402:298b:b0:41d:675f:8b44 with SMTP id
 eq11-20020a056402298b00b0041d675f8b44mr27379826edb.377.1651727193539;
        Wed, 04 May 2022 22:06:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 58/61] librsvg: update 2.54.0 -> 2.54.1
Date: Thu,  5 May 2022 07:05:41 +0200
Message-Id: <20220505050544.651895-58-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165287

Drop patch as issue addressed upstream.

Restore doc generation, as it is now possible to disable/enable.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../librsvg/librsvg/0001-Disable-docs.patch   | 24 -------------------
 .../{librsvg_2.54.0.bb => librsvg_2.54.1.bb}  |  9 +++----
 2 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Disable-docs.patch
 rename meta/recipes-gnome/librsvg/{librsvg_2.54.0.bb => librsvg_2.54.1.bb} (89%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Disable-docs.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Disable-docs.patch
deleted file mode 100644
index 13d25d4f08..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0001-Disable-docs.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From e62887dfa36812d5b8bc1c2c2fec69ba985309d8 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 5 Apr 2022 09:21:14 +0200
-Subject: [PATCH] Disable docs
-
-Upstream has replaced gtk-doc with rst2man and gi-docgen in a way
-that is not possible to disable and requires g-i. There's a
-pull request to address this, until then let's patch it out:
-https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/687
-
-Upstream-Status: Inappropriate [see above]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
-
-diff --git a/Makefile.am b/Makefile.am
-index e380bc9..5b3fbb5 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,4 +1,4 @@
--SUBDIRS = . gdk-pixbuf-loader tests doc win32
-+SUBDIRS = . gdk-pixbuf-loader tests win32
- 
- NULL =
- 
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
similarity index 89%
rename from meta/recipes-gnome/librsvg/librsvg_2.54.0.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
index 96c54f16d6..7bad2ed816 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.1.bb
@@ -11,19 +11,16 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                    "
 
 SECTION = "x11/utils"
-# Note: docutils/gi-docgen should be made optional when upstream enables that
-# https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/687
-DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango python3-docutils-native gi-docgen-native"
+DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango python3-docutils-native"
 BBCLASSEXTEND = "native nativesdk"
 
-inherit gnomebase pixbufcache upstream-version-is-even gobject-introspection rust vala
+inherit gnomebase pixbufcache upstream-version-is-even gobject-introspection rust vala gi-docgen
 
 SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch \
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
-           file://0001-Disable-docs.patch \
            "
 
-SRC_URI[archive.sha256sum] = "baf8ebc147f146b4261bb3d0cd0fac944bf8dbb4b1f2347d23341f974dcc3085"
+SRC_URI[archive.sha256sum] = "d5557efbdcc415a4180e1116b7f736cb711b253d110d95fa86ec830f70026625"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.30.2


