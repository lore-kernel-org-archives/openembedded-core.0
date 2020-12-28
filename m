Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.2423.1609185899398395089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZUsgZSI+;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id b2so10781804edm.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3NhpkSJYwpFzs6ABWIhOrM00aaNm3x9M7lSpzQvWTaA=;
        b=ZUsgZSI+2wGQsEYtTFPHCrznSndKOTqAlQrp6Zrl5Zp0jihnx3PK6ur/EYpv9+O01v
         arWcDkxssY2dFiIBHQ1y1+D36SybBMmxGT2LCUZ/a1MKlhVzE1IPi4CZlFQblmInT0v6
         40kTC31IHUeQh/06nV9Elhsc2LjfKgcwPPyFxIYnsF8pgpvztwZ/TGs9oi2eF9lcXnBY
         lCYduIXmbhl4l6FCFuEi3N8TTkaNjw2M5pXxribqUmHktaRLBOE53o+kAbqpyRHMlx0p
         2wexDKdp5oaH9X8CMf0O95ZNeP/1o9SsTN/V0djIceRoxtAYUzZP/oKLEgv3+MC+I8Gc
         Cd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3NhpkSJYwpFzs6ABWIhOrM00aaNm3x9M7lSpzQvWTaA=;
        b=GDBqzDRYyXSh3XyeKCtT2Le0XaQeqOyERV4JdGUjkZpllwsqLBc1+DvPwWzk7Mrqpa
         GMWsB1pvVy0k6d/oxTg1WUZlWJ/SlBvuQLOazJw5Bxpqz+QYOt6JwUvBOHIKX6qeB8Gq
         mHbm1JxMGCm6qoanWYyijrCXzeO+kT5bLeSlxDw7oC6EBBTAqWJ3p8LFbKx3OMFhe8b2
         s/3MCUi/Cl1EcJo0sHJN/VGNZ0X39x88tZVxHpGHGCZMpzqHRE8XCMB9xeaZZRwnQLTR
         v8nfesn0s8kQgC2YSH0weVGj/JpQun8Vgsa0ZLpEiUOgBy375IbhTElViplcH5CaiwAi
         p2yw==
X-Gm-Message-State: AOAM530/QeT+pWccGBr2TAFKloHNOU7FTZpyu337/dt5sDUG8P+la0YD
	qPA5ihp2kL9PoMXPMNeAz/LqRLiDsAs=
X-Google-Smtp-Source: ABdhPJxkG1Gk3GOihkkPuBmCFgJwYle5+K2Aklj4p3PqnBGZWzm8UPgpemuaj2h3cs3HtFO7IxIwmg==
X-Received: by 2002:aa7:c1c6:: with SMTP id d6mr43642909edp.275.1609185898076;
        Mon, 28 Dec 2020 12:04:58 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:57 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/22] ccache: upgrade 3.7.11 -> 4.1
Date: Mon, 28 Dec 2020 21:04:33 +0100
Message-Id: <20201228200436.78130-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert recipe from autotools to cmake.

zstd is a new hard dependency.

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ccache/{ccache_3.7.11.bb => ccache_4.1.bb}   | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.7.11.bb => ccache_4.1.bb} (55%)

diff --git a/meta/recipes-devtools/ccache/ccache_3.7.11.bb b/meta/recipes-devtools/ccache/ccache_4.1.bb
similarity index 55%
rename from meta/recipes-devtools/ccache/ccache_3.7.11.bb
rename to meta/recipes-devtools/ccache/ccache_4.1.bb
index fd004f4c9b..5f7d93b485 100644
--- a/meta/recipes-devtools/ccache/ccache_3.7.11.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.1.bb
@@ -7,26 +7,18 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22d514dbc01fdf9a9784334b6b59417a"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=a66c581f855c1c408730fe5d171e3013"
 
-DEPENDS = "zlib"
+DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "34309a59d4b6b6b33756366aa9d3144a4655587be9f914476b4c0e2d36365f01"
+SRC_URI[sha256sum] = "cdeefb827b3eef3b42b5454858123881a4a90abbd46cc72cf8c20b3bd039deb7"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-inherit autotools
+inherit cmake
 
-# Remove ccache-native's dependencies, so that it can be used widely by
-# other native recipes.
-DEPENDS_class-native = ""
-EXTRA_OECONF_class-native = "--with-bundled-zlib"
-INHIBIT_AUTOTOOLS_DEPS_class-native = "1"
 PATCHTOOL = "patch"
 
 BBCLASSEXTEND = "native"
 
-do_configure_class-native() {
-    oe_runconf
-}
-- 
2.29.2

