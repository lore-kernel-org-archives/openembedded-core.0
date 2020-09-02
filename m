Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.961.1599081249440190725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KbbECNzC;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id p9so700027ejf.6
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L/QbwgAdWxol90nWh1QOX1EwUUUlObiR0k4cmK4Uwtk=;
        b=KbbECNzCbsPfzISua/Ri6nKTmxDyvqvz/YK056WwcojBc0HdMZjY6knvZ4kvOrn2Dk
         TGoilYmObi6CWs4sM3+QVZdaaNhL1erj603laeCB/VNRwhgouhSv6dBta6qw279VZ6yE
         kWIy9ryj1Sq2qPS998jQwj/98317DOGExnkM21WhqkkC5laGIhTL7hVmkb/U7N5xvcsm
         NVJ44q1MVrHgj565sNIqwgVVEfZAWKTys1DPtS8YSHNaK/p1Jst/fP9NX8s0sNE6LdSV
         Uo41jjehg5lrHWCJWRL2/Dj3ncGYFNq0XXmfFrw+CIre8OskXxX0VaQQ1aIxHBG4FRfX
         Sk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L/QbwgAdWxol90nWh1QOX1EwUUUlObiR0k4cmK4Uwtk=;
        b=FnhZLk3xxBGZXaI8dBXuFViFknEiV8l3wewOuVafyQiaiYgfBd+u8dCp6XawGDWTqy
         i0pD1TtdoR68jhCp4/mFDfH7fOCcBhWfrLiMUuw0mzzCEvl1C9RTxpjS8/a5d9ncTRyy
         QFV4ctEXE5CPGKLuRDJQWEiweYks0lt/zfQrbPgA4hbSAGdDafaU0TPfwAuvupcqgF3C
         V++K0XKDPvRUOkdo5maZXSH0fEpvznpGRxk2chWqC4vIVOAr2QKyqfNt6Lp3In36iTbJ
         t+EwKK9xLaGez/D5qsw9MoqlTGL/M2jU1C3rYfwqxmvvSGFyWDo5U4BjR7ctNKiHaKO9
         c0/g==
X-Gm-Message-State: AOAM532SnolTgw8Ch0XyjbrvdvLQOYGohTqECgYcoUjprbOUQbum6NbU
	78a8ssG+K3K75Mz+XxM0nnmASn5Tnz0=
X-Google-Smtp-Source: ABdhPJz0/J3dBRZEsqF+K4pzBQnStBfEOB0Eze2QlgYXLPr4eFQ6RBuuI1JaXvYCXwCRwSq9Bz0o1A==
X-Received: by 2002:a17:906:9353:: with SMTP id p19mr12620ejw.403.1599081247708;
        Wed, 02 Sep 2020 14:14:07 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/23] pango: upgrade 1.46.0 -> 1.46.1
Date: Wed,  2 Sep 2020 23:13:20 +0200
Message-Id: <20200902211330.4853-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-graphics/pango/{pango_1.46.0.bb => pango_1.46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.46.0.bb => pango_1.46.1.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.46.0.bb b/meta/recipes-graphics/pango/pango_1.46.1.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.46.0.bb
rename to meta/recipes-graphics/pango/pango_1.46.1.bb
index 54440ea786..cc6cc1e35c 100644
--- a/meta/recipes-graphics/pango/pango_1.46.0.bb
+++ b/meta/recipes-graphics/pango/pango_1.46.1.bb
@@ -16,7 +16,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += " file://run-ptest"
-SRC_URI[archive.sha256sum] = "9a81572ebb946187fbdd69d5ffc57e2f7a1f768cd8d2fd89dbb03fb9002a99b5"
+SRC_URI[archive.sha256sum] = "fe516b10711bbb6fd75011d66dd08fabfce18f7931aed7415136d53c4aadf1c5"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.28.0

