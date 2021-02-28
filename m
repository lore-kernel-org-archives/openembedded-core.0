Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.7658.1614526641500114397
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sn89DvjH;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id mj10so3426227ejb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NEyuzYxrZX4x/qZRN0e/q1Kdnr2fKVwIm4XDnqdHsP0=;
        b=Sn89DvjH1cFLBqmNl2u9/BPT7rZ1/oORk7fUOaTMQpDQxEREw6UkG5+MQWs+cRZH56
         YUlJgDfGpfjGCY1CSqOBAZPdP5NO/YbMI2T7LzB8gXQqpsWiVSvunIh8xowU1HonTYOV
         AvS8xbHpWOx5Dw04EuHKmNdff4FKQNqULSrXWzi4kELxEvU05iyt2/2zalwBQwpf/Xja
         eGKwGdMGWH1Wlf0ppRRg2udirRHkBFWVyqTc3oDlT7nq8LxAUxm7hK7/2BpPYKcwue2g
         P3XzVGSS2itVNNzz9RiFptr2iR8a+9dTRSToQCqsDOK5IDBeOi16wPKaZc/9U51evyjI
         ElJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NEyuzYxrZX4x/qZRN0e/q1Kdnr2fKVwIm4XDnqdHsP0=;
        b=fZrPbOOL4SxDZn1NrhLt2LNaHaOizh7mCrQCVRNTlT7JKUqKJ10qcJ1OA2452byMpr
         QjnuPJRCKJ3QsESezJzB+VYjqu7oHefX2ntobBu/iuwCqxr2mlD8i3XlIpNmC+MwNAe3
         Z7o5g2/TOdw+FUIWqNZ+r0QunLQs/D1KDzdbUbrFHKQ41d/SuscQAWafNkPYh1Lz2B49
         wNJlb6oFOtpo4aMaiB6Wg0LPHg0KkUFscJ2e46722qwFzky0QCzprlQkErAYkHBORGbE
         C6YAuUcd3JONZXauvlY7Y9uJVgUTl1O9XHhDWlp80h1raBKUlcfpJIpCGqLAaqW/oNxn
         kjGA==
X-Gm-Message-State: AOAM530cjIHsetn6ZXVliq2Y2DXgXRcmI7NeGJcnlaHucQmXWGcqmLR3
	2vQNA4zFSaZ3L/DxyNx2YMOeMZVgwtPdGw==
X-Google-Smtp-Source: ABdhPJye9EdizSSL4UO5O+vPAe4OozRvWOnqCKvgu9gPeQjZpZKJy0z9theKmGG4ZLhcdhy30c+ffA==
X-Received: by 2002:a17:906:4002:: with SMTP id v2mr11999642ejj.135.1614526640158;
        Sun, 28 Feb 2021 07:37:20 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:19 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/24] pango: update 1.48.0 -> 1.48.2
Date: Sun, 28 Feb 2021 16:36:50 +0100
Message-Id: <20210228153702.498275-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a patch; issue fixed upstream:
https://gitlab.gnome.org/GNOME/pango/-/commit/fcda7d6f9b6ee966f5da860be5ec0c0096193a83

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...c-drop-assert-that-fails-with-Cantar.patch | 27 -------------------
 .../{pango_1.48.0.bb => pango_1.48.2.bb}      |  3 +--
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-tests-test-font.c-drop-assert-that-fails-with-Cantar.patch
 rename meta/recipes-graphics/pango/{pango_1.48.0.bb => pango_1.48.2.bb} (90%)

diff --git a/meta/recipes-graphics/pango/pango/0001-tests-test-font.c-drop-assert-that-fails-with-Cantar.patch b/meta/recipes-graphics/pango/pango/0001-tests-test-font.c-drop-assert-that-fails-with-Cantar.patch
deleted file mode 100644
index d8f971d914..0000000000
--- a/meta/recipes-graphics/pango/pango/0001-tests-test-font.c-drop-assert-that-fails-with-Cantar.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From eea900ec107920bc99c9df5ab258b7bc446c0b87 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 4 Dec 2020 14:03:01 +0000
-Subject: [PATCH] tests/test-font.c: drop assert that fails with Cantarell
- family
-
-Upstream bug: https://gitlab.gnome.org/GNOME/pango/-/issues/494
-
-Upstream-Status: Inappropriate [needs a proper fix by upstream that handles font faces with identical names]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/test-font.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test-font.c b/tests/test-font.c
-index 486504f..7e45ba1 100644
---- a/tests/test-font.c
-+++ b/tests/test-font.c
-@@ -217,7 +217,7 @@ test_enumerate (void)
-   for (i = 0; i < n_faces; i++)
-     {
-       face = pango_font_family_get_face (families[0], pango_font_face_get_face_name (faces[i]));
--      g_assert_true (face == faces[i]);
-+      //g_assert_true (face == faces[i]);
-     }
- 
-   desc = pango_font_description_new ();
diff --git a/meta/recipes-graphics/pango/pango_1.48.0.bb b/meta/recipes-graphics/pango/pango_1.48.2.bb
similarity index 90%
rename from meta/recipes-graphics/pango/pango_1.48.0.bb
rename to meta/recipes-graphics/pango/pango_1.48.2.bb
index 552a44583c..1dcb43b5e1 100644
--- a/meta/recipes-graphics/pango/pango_1.48.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.2.bb
@@ -18,8 +18,7 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 GIR_MESON_ENABLE_FLAG = "enabled"
 GIR_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI += " file://0001-tests-test-font.c-drop-assert-that-fails-with-Cantar.patch"
-SRC_URI[archive.sha256sum] = "391f26f3341c2d7053e0fb26a956bd42360dadd825efe7088b1e9340a65e74e6"
+SRC_URI[archive.sha256sum] = "d21f8b30dc8abdfc55de25656ecb88dc1105eeeb315e5e2a980dcef8010c2c80"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.29.2

