Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.9828.1620227943275826917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Lo2CGTJD;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a4so3488068ejk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6sARX+QgocjFq27iiG4qvwx+GvLWwtUcUGs3fv2+2jY=;
        b=Lo2CGTJDqAwF5+yWFeeAPpRic828udeodDT5tx13qqKeMBm4Z+opyy70Oha3XJtqrt
         qDZo70vWTQEySQor1dAAmYM+/ZrBOeAOZ5wDle5jwOHNAHvHa8v0hDIbonj5zeoTA9hO
         PTSRsFlQhtyaL8gY/5mlwnN21Vz1vota8jfoIJpEwD4GfEoZ6hiE5h628XcxYoSt9TgD
         hh3DZXTuGWA1oq2m8n06UjyITvuzRAmUtKd2/qD1KRZkFvIBajT7S6S2yKfBtAuZrM9V
         NkmCAhGqvRKfx/7xfhE8FTFgZicjZRj+SY8UIXQ18VH39BDWu7XZYYcZSD0yGCg+ku7T
         PoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6sARX+QgocjFq27iiG4qvwx+GvLWwtUcUGs3fv2+2jY=;
        b=kPbHzKyurCl5BGQdqgcp9XVPq60d5M+B7yulywqasZT4kSaoWxCbJx8fE45L4EePMX
         5r2e/hE9Os3fIEBtsb8DSWtE85tvnaRhgkmXJY356nCamVOYczQiNMyOdz4Xf6sBZAnN
         oHE3AB891oSnHdEw4paKcyHTToCqSnWDsvsiGGFQykQqsP3UgIXl7XxD4ZcXbgSuRoau
         L8RD5ccyi5c8gfJr739NI/wxsOxb5q9loEgsNj5vzrHyVysTmKlRYi90e+VIlrWVj3TK
         F3ZaR62nbMsQgCD3VJbOvL4srNQpXYowY+FdMelVPT6SdClc2k860qhfVHdME1nA/rGy
         eZnw==
X-Gm-Message-State: AOAM530T6jyI/KcUUJ4JjIASfEXkvS/M+8s5ZgujYB0GKkIGApQ3OD/4
	5624WsNUkUmomLOQEuOm2TyM6XHXA62p2Q==
X-Google-Smtp-Source: ABdhPJwHEGd0ke+vjLvsi2SUf1BHV0qDcl+zZ/ksc73d9ZaGgX7ba1KuhiWFCDQ43G6o0LMu0VPm/Q==
X-Received: by 2002:a17:906:f6d0:: with SMTP id jo16mr18330355ejb.461.1620227941856;
        Wed, 05 May 2021 08:19:01 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:01 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/61] glib-2.0: update 2.68.0 -> 2.68.1
Date: Wed,  5 May 2021 17:17:56 +0200
Message-Id: <20210505151850.660512-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch  | 6 ++----
 .../glib-2.0/{glib-2.0_2.68.0.bb => glib-2.0_2.68.1.bb}     | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.68.0.bb => glib-2.0_2.68.1.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index e3001762ad..7cf89c8718 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 011c9f024b6475d31e7d5432a38d00fb67eaea40 Mon Sep 17 00:00:00 2001
+From ff790dd7086e28896f8e7630135f756cc6f06c80 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -13,6 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
  gio/giomodule.c | 12 +++++++++++-
  1 file changed, 11 insertions(+), 1 deletion(-)
@@ -47,6 +48,3 @@ index ca1daf2..954a250 100644
  #endif
      }
  
--- 
-2.25.1
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.68.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.68.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb
index 94d24318c3..accc2cada2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.68.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "67734f584f3a05a2872f57e9a8db38f3b06c7087fb531c5a839d9171968103ea"
+SRC_URI[sha256sum] = "241654b96bd36b88aaa12814efc4843b578e55d47440103727959ac346944333"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.31.1

