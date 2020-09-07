Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.1714.1599498185742978097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wK6tgkI5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d6so1837740pfn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=5ae2T0EuMRDSWeTbwDNYzF2nPedzDuMb2BiCHNediXw=;
        b=wK6tgkI5KDT44geA5UfSGa0GUJjjKtNmJY/yO0NsuGJu5khj9f+u4TLX8RF58jfOwu
         FQ6yXy8ieeImO++Y5GRxNA8uxjYFKf4Dr3zg10Wj/4sFlTYb2X9ot17krBV5tUQ/DfJ/
         28dJysmHnUgRt3HJjYievpzRyyKOXmXtlxDP3a9yI5kkU9ZbvG9F2JZesKXvHCbcYBhh
         N/Brx+12SxV1n6fHIhKlgFiTsfBrhkzhlbZ2hhFfcEIAWK51DPl61Nf3u/z1LxCMHbqZ
         DOctYZBbnt5aRnc+KcJSHI7oKnrROrz1EbGIXsIRHPHGAyMHRK2jTtU/6vLBxaI4wfz8
         q8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=5ae2T0EuMRDSWeTbwDNYzF2nPedzDuMb2BiCHNediXw=;
        b=MwbD93cbyVlSrfnSfTTVB3EYN5YDbNaINvO6fLpFJ3oXdNuuuoEZHxF1/fAHsSS31r
         9C5U4Wh2z1PRtGq+Cc2oulzB9WBAOm2CjQjHq7KBsIY+U+KjYoBpcsXjReh4A6L2aAQS
         dhkUhGok61KJfoTnHTJLyr0vA2JEVE4Mug/9oocs8g/ohhEzQznFk2avYqGTLG291wTI
         JVSoJHPo0uubOL+iYg1/XhliMG22u3Js0nhqiRaD6EtTqUJVcXK+Jh+JLeGtirmo1SfH
         0yi/IdSMv9vlVfBktaEKBo6Z+/7p8awt11sowpInuCqGdglQMXbHH204DIaQbP3VQ43x
         3WRw==
X-Gm-Message-State: AOAM532CDAXU7EakILW70Y39f8jboMNcKrvdoYiOEMCdKQjIzi7yr1qE
	7OsgKv105M2R3iCf3B6nRrVg23a4AD3hzSYL
X-Google-Smtp-Source: ABdhPJz7GuD0Eq1NIGlsPoPARtiTPs9vai1bVs5BQ/l8HEI5xFz3FaXsrM2IfoRmyrVUEQ5phqee5A==
X-Received: by 2002:aa7:9517:: with SMTP id b23mr17603627pfp.21.1599498184624;
        Mon, 07 Sep 2020 10:03:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.03.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:03:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/18] json-glib: Backport a build fix with clang
Date: Mon,  7 Sep 2020 07:02:15 -1000
Message-Id: <09bc151f577cbdcb194bb999ada0b7aec7e7aba7.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a654c916853f6ead4268282e15dc8c9ef962446e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...o-instead-of-cast-to-convert-pointer.patch | 33 +++++++++++++++++++
 .../json-glib/json-glib_1.4.4.bb              |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch

diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch b/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
new file mode 100644
index 0000000000..2a834b674d
--- /dev/null
+++ b/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
@@ -0,0 +1,33 @@
+From d60fcd5bd5c2675e4342775b910a2ea48ec0eccb Mon Sep 17 00:00:00 2001
+From: Dimitry Andric <dim@FreeBSD.org>
+Date: Wed, 19 Aug 2020 03:35:16 +0000
+Subject: [PATCH] scanner: use macro instead of cast to convert pointer to integer
+
+Clang 11 build failed due to a new warning (part of -Werror=pointer-to-int-cast):
+../json-glib/json-scanner.c:928:13: error: cast to smaller integer type 'GTokenType' from 'gpointer' (aka 'void *') [-Werror,-Wvoid-pointer-to-enum-cast]
+        *token_p = (GTokenType) value_p->v_symbol;
+                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/json-glib/-/commit/8c5fabe962b7337066dac7a697d23fce257a5d64]
+Signed-off-by: Jan Beich <jbeich@FreeBSD.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ json-glib/json-scanner.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/json-glib/json-scanner.c b/json-glib/json-scanner.c
+index 0c9919f..59dd29c 100644
+--- a/json-glib/json-scanner.c
++++ b/json-glib/json-scanner.c
+@@ -925,7 +925,7 @@ json_scanner_get_token_i (JsonScanner	*scanner,
+       
+     case G_TOKEN_SYMBOL:
+       if (scanner->config->symbol_2_token)
+-	*token_p = (GTokenType) value_p->v_symbol;
++	*token_p = GPOINTER_TO_INT (value_p->v_symbol);
+       break;
+       
+     case G_TOKEN_BINARY:
+-- 
+2.28.0
+
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
index 5143d73ed7..bbe284c01e 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
@@ -14,7 +14,9 @@ DEPENDS = "glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome manpages
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch \
+"
 SRC_URI[archive.md5sum] = "4d4bb9837f6d31e32d0ce658ae135f68"
 SRC_URI[archive.sha256sum] = "720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47"
 
-- 
2.17.1

