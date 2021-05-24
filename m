Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.20567.1621847655684358992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hAXn7AFP;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id k14so37231313eji.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZsVTwvpDr/mPPQDjXpzhwigCOrEO+rr8GbiD7yFMQ/I=;
        b=hAXn7AFP6boTc+GKKc32XEFnZK+daKGnY/q3aBdVV+R90fheW3NlT75ID6LisqU0ZC
         IAruGTNF6P83oQSyq0cTle3LBddp1WQ/TsCA0K7oLrb7JvN012o5LwCiAghdaPoZ/+nK
         8malDaoLrYOQCAhDKWpr035jJclzH+WAECbzUFTCBX8H+LMDDwFhDoRjMJ2pHps+/HHs
         I6QnOBpPQ3+JuLcf6/mJxDSVxqS02UPviZqAl3OgvUZHtnDFx32LlgfR7kKznmONnjgG
         hzVIj7/DQYjAHat73FwrPwkZyvR1ZFWxh2+05NoQYYfK0kw4NcVZyt72ubHuf5q8Sgjq
         werQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZsVTwvpDr/mPPQDjXpzhwigCOrEO+rr8GbiD7yFMQ/I=;
        b=mgC2WhxtxyrZ6dytZkFmEaKhukY4eXcOjBxkRcPsVVLZwcAIUB1ezzPcYAHpOT5u4n
         F92shYn1V0h2n4cqznxuNwntbeEX0wsN531XiA6OLMDJDOFgWc1nUqYBWNcg/g6Q5vFq
         mPUYv22BFxXaivImLKwE64GUnAYLe9/mszE9uwNloQKVyiX5gFq5IOHMCrkGIqoaCR4p
         t2ewj/P4rqpB+WLvOGtPWwZznFABoBn4ute6Dt7ha9iO8nvqpm6ij1w1OfZjWOIk/OH4
         p35/M3m0uoUFwT/3im0GPWcPq67n/EDXt9Eh1RxndGKyQhau03+tdB0nnAV6E+2+ZC6m
         wHPA==
X-Gm-Message-State: AOAM532SRZRzYtChhLqQkZIOvolSUb3R+02C1JMbYfEauJLY0Z1DwqVu
	kgaWcygpC8bRz6SAC7CUmsF+cYudNco=
X-Google-Smtp-Source: ABdhPJxPXnqcQjw/3zxDk17qzTA5+GYd5QUEvfYXK4dm3WhPdvZSOg9IKFvL6CRaxFZI16eCiV/qdg==
X-Received: by 2002:a17:906:5d0c:: with SMTP id g12mr22166243ejt.447.1621847654348;
        Mon, 24 May 2021 02:14:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/21] glib-2.0: update 2.68.1 -> 2.68.2
Date: Mon, 24 May 2021 11:13:41 +0200
Message-Id: <20210524091347.419253-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch  | 6 +++---
 .../glib-2.0/{glib-2.0_2.68.1.bb => glib-2.0_2.68.2.bb}     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.68.1.bb => glib-2.0_2.68.2.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 7cf89c8718..7fbc07af58 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From ff790dd7086e28896f8e7630135f756cc6f06c80 Mon Sep 17 00:00:00 2001
+From b7abbba886d3743616f8cc0e8b441c879128bbda Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,7 +19,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index ca1daf2..954a250 100644
+index a2909a8..1f4ab82 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
 @@ -51,6 +51,8 @@
@@ -31,7 +31,7 @@ index ca1daf2..954a250 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1212,7 +1214,15 @@ get_gio_module_dir (void)
+@@ -1213,7 +1215,15 @@ get_gio_module_dir (void)
                                       NULL);
        g_free (install_dir);
  #else
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb
index accc2cada2..0cf16884ef 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "241654b96bd36b88aaa12814efc4843b578e55d47440103727959ac346944333"
+SRC_URI[sha256sum] = "ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.31.1

