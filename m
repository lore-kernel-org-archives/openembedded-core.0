Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.7970.1603974615601413058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 05:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ah4qrXJK;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id dn5so2804459edb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 05:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ikk1y86nMMbaZNncZjl836+IuXMUqCd4wqKnm+c5AHo=;
        b=ah4qrXJK1Xx+TRfrdALDNaoi7AJ/Rsu2uS/MSRFrjY5tRT/7BvAjsj33d9jEASP1Qc
         PVAj3kUX+3ReyQid9R/FifiYhUfn/+kHxdCMWEryR2JUhKDnKaAOZMLLLCGab+xw59Yb
         elR+qeo41dwg7Bc+5ibsMbCaDMQMh3r4wBIvRCsXTn1QwGA5yfsxp3qxNpHbCDPza2rB
         OAb+ORELqfszjXkNUBV7hutlyZ4kHlcoDwjUPpC8O59apvBcAolI0KTLUxyWqSJgRE1y
         rUrPiE1oWebc+v5dnmsyGPzDbgJCKttuMTJNsWuvQVH2R3aQh08MioAhXKUYVwef6zlu
         MAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ikk1y86nMMbaZNncZjl836+IuXMUqCd4wqKnm+c5AHo=;
        b=En3MfF864ukGEq+vK61IL3pmEg5JLtsryRTvmNzBpnp9Zpz1p2aMcXhxsWOHtS5reo
         Erxj2O6b5qXe5SmBaZwxCNqDJ3RKiUqihJ0DgUvQ8ULEdXoGLMLdeb/LXAmoF8x8bYXi
         yQBd9beOH3kRkWV19V1bwu23BfRyLe5XFcqBK6ROKRpT2s0s1JDzhZsMsGKXuDNDBFko
         Luq7IOQtpcbzFvYwIMuUNLI6ED3LEq1xhJ6xzPlBCpgz3K/R6vaSZhQXcbV9waOAM38v
         csZ6nPjmKgwaphh9aVBCKXPnyzUqK/Pgs16zPMaO1JjzKgatNFGhrDya+ScRPb9/Obt4
         5GNA==
X-Gm-Message-State: AOAM531QWKKai5bC5Ka5Xm452X1CBVeyZT5KXvjsSaBwMUkdBRKqsPHO
	mGFlhohfkpaGZlM2Mz+/kkhW99aXGYDO8Q==
X-Google-Smtp-Source: ABdhPJwduSOhnpYzfEMg/miovyG5qwpGJcDGOYhsinWX6uGaVIAInTbdfSPmc80Cj6wzRGfbwvYZIA==
X-Received: by 2002:aa7:ce04:: with SMTP id d4mr3641192edv.18.1603974613679;
        Thu, 29 Oct 2020 05:30:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id l20sm1412229edr.56.2020.10.29.05.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 05:30:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/3] glib-2.0: update 2.66.1 -> 2.66.2
Date: Thu, 29 Oct 2020 13:30:00 +0100
Message-Id: <20201029123000.21044-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201029123000.21044-1-alex.kanavin@gmail.com>
References: <20201029123000.21044-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-core/glib-2.0/glib-2.0/relocate-modules.patch | 8 ++++----
 .../glib-2.0/{glib-2.0_2.66.1.bb => glib-2.0_2.66.2.bb}   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.66.1.bb => glib-2.0_2.66.2.bb} (95%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 07e37acf7d..2b8e930511 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 75c0423e1dc34fa20de70bc9932625fd0de4a912 Mon Sep 17 00:00:00 2001
+From 85931fbb981b5aae38f1c1370d5d3c091cb862b8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,10 +19,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index c420260..a023745 100644
+index dc4d6d3..da46906 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
-@@ -47,6 +47,8 @@
+@@ -49,6 +49,8 @@
  #include "gmemorymonitordbus.h"
  #ifdef G_OS_WIN32
  #include "gregistrysettingsbackend.h"
@@ -31,7 +31,7 @@ index c420260..a023745 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1158,7 +1160,15 @@ get_gio_module_dir (void)
+@@ -1163,7 +1165,15 @@ get_gio_module_dir (void)
                                       NULL);
        g_free (install_dir);
  #else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
similarity index 95%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
index c803dbcf90..1f83660856 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "a269ffe69fbcc3a21ff1acb1b6146b2a5723499d6e2de33ae16ccb6d2438ef60"
+SRC_URI[sha256sum] = "ec390bed4e8dd0f89e918f385e8d4cfd7470b1ef7c1ce93ec5c4fc6e3c6a17c4"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.29.0

