Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.181513.1598214092876521735
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QVJ++P+I;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id bo3so9265126ejb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9LQor1wnlwvwCxt1fukgeiEnApM1VotwT+Dol3bUOrs=;
        b=QVJ++P+IDvxfPbpFSvLkk0s2vnnchs+MUmnsrwJsGJEfCdalbn8t+BYfEWHaDWJLbg
         4BLXtjtLmkZgfTfMwClRg/n0X7iQq9kx6tvs/2xd+MAB4ywSUu/1tS+Tm6d7LbtPtQ5H
         6S7n0vQX6IhodPnGpAdZXKvNfbRo2O3u7WWWooT4LGJbZhd/mMrPWKWo1OZQTkFZSlw2
         kB6wjXVC7Te3bdTEf4bNrXAD6JxHkuVa3LvEjLemgkwdFW8MyMxPVJyXPuFuUUhI/tXu
         4M+AoCqkTeerZPqPHPr/kaZoV/Ezxc0WzDOjRM2Wg65r1kx0LVDdvbU2KtOAoAfiJP40
         JUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9LQor1wnlwvwCxt1fukgeiEnApM1VotwT+Dol3bUOrs=;
        b=q/19lIg9Umw2ZM8FqmbXKQpu5yzeRB2Fh7FYTza9+9u71RTRhBE4i6MBss82MUq+LN
         zIAkA0G2Ck6x20Q0JB1C56+tMorB7VJmx6eLUewnndSYjprVMJLS13btmhjaBqMBTYkA
         JaMULliTk4vki37CoAqvXGI+oPmCRCG7Bf6fbZUbK1/Muel0U6HE2Liyfb6zoW4iqVDp
         l+E4lIDtW+k93dbfz7QtzUHUpfqV2L4z3pWxGqwlNVztvN0UgAK/ygEdKB0FHNHDvzP2
         OPFhR2sIlb6Nr+IVKjUiki0SmiIDurigiZkp5f71WML7jLrwVR4LZap0gfzcUv81x/Wa
         21vA==
X-Gm-Message-State: AOAM532DNNZs6n7TdllKNzOtkjBTNrb6U/Gnu1RLDvd6LiwLgyKpFFB7
	k4ToNhxcKv/3PvuV2r0TcR4e7wmJ0TE=
X-Google-Smtp-Source: ABdhPJyO2/gRO50/S75acK/uIue7Kr6r5SpgW5TXqg4VpgNLLnqJR9htx2Espmt0lebBVLN5lEoqZQ==
X-Received: by 2002:a17:906:8416:: with SMTP id n22mr2759868ejx.128.1598214091092;
        Sun, 23 Aug 2020 13:21:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:30 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/37] pango: update 1.44.7 -> 1.46.0
Date: Sun, 23 Aug 2020 22:20:22 +0200
Message-Id: <20200823202031.24686-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Fix-build-reproducibility.patch      | 31 -------------------
 .../{pango_1.44.7.bb => pango_1.46.0.bb}      |  6 ++--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/pango/pango/0001-Fix-build-reproducibility.patch
 rename meta/recipes-graphics/pango/{pango_1.44.7.bb => pango_1.46.0.bb} (87%)

diff --git a/meta/recipes-graphics/pango/pango/0001-Fix-build-reproducibility.patch b/meta/recipes-graphics/pango/pango/0001-Fix-build-reproducibility.patch
deleted file mode 100644
index 03abf8763c..0000000000
--- a/meta/recipes-graphics/pango/pango/0001-Fix-build-reproducibility.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f8b32901981a06a8db4169b82a704dcf7e8b6560 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Wed, 20 Nov 2019 15:43:57 -0600
-Subject: [PATCH] Fix build reproducibility
-
-Changes the comment in pango-enum-types.c to reference the file basename
-instead of the full path. This ensures that the generated file is
-reproducible when it is included in source packages meant for debugging.
-
-Upstream-Status: Pending [https://gitlab.gnome.org/GNOME/pango/merge_requests/159]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- pango/pango-enum-types.c.template | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pango/pango-enum-types.c.template b/pango/pango-enum-types.c.template
-index d922c691..0d55ef74 100644
---- a/pango/pango-enum-types.c.template
-+++ b/pango/pango-enum-types.c.template
-@@ -6,7 +6,7 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
--- 
-2.23.0
-
diff --git a/meta/recipes-graphics/pango/pango_1.44.7.bb b/meta/recipes-graphics/pango/pango_1.46.0.bb
similarity index 87%
rename from meta/recipes-graphics/pango/pango_1.44.7.bb
rename to meta/recipes-graphics/pango/pango_1.46.0.bb
index 0ee8abcc09..54440ea786 100644
--- a/meta/recipes-graphics/pango/pango_1.44.7.bb
+++ b/meta/recipes-graphics/pango/pango_1.46.0.bb
@@ -15,10 +15,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
-SRC_URI += "file://run-ptest \
-            file://0001-Fix-build-reproducibility.patch"
-SRC_URI[archive.md5sum] = "c75cc5b833d934d98e83343832e20e5d"
-SRC_URI[archive.sha256sum] = "66a5b6cc13db73efed67b8e933584509f8ddb7b10a8a40c3850ca4a985ea1b1f"
+SRC_URI += " file://run-ptest"
+SRC_URI[archive.sha256sum] = "9a81572ebb946187fbdd69d5ffc57e2f7a1f768cd8d2fd89dbb03fb9002a99b5"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.28.0

