Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.3756.1603919173967304906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T4fsHf7i;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id o18so969075edq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b4p67Obr3SjoKGojRgRQR52MgatQxtrOEBLVK+UnD04=;
        b=T4fsHf7ipyT/oKY1EzQrxee5+S9GkqT3SodG+Z4MnmnkooCEDWFNlL4aVSD0oWJrOH
         9aIrCikuFDAOByevlloAF1RxGBAbMUsPl3Hr/TYeNJsClTSQLQnoKyI4YcOzpPTTKiU6
         5lCXqMStWK+m6NhDLvIYaryO9CfKgG227w/fcyhdw7Y10A/Xy1cO+6ogAg36cfulTTCd
         S7G79VJJcBvbfI1TFqdnWiScr/rYUJ02eRchDU4Y+EHAIZS7oEcCcNeO+wPRGAKmWQZP
         /jWAVKj1AXZouhiPWkcGVONePOlJwRnsGdPagN8sDmYiCekVQPV/mh9T7QnhIHrSahFC
         emXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b4p67Obr3SjoKGojRgRQR52MgatQxtrOEBLVK+UnD04=;
        b=ZdOhr1jNwYijk86FhwZCrKUSDdBfcNujCdPE8sssej9N6P4X6l6rVwaUSQNTOob0pc
         3KlW+ssVsyTrIOtbKtsdpSVNxCzXZmsDSp1kcU8uXpVUX4nSZObhihEBPkmVKpLqrwmS
         j6HPY9fUS+3AH7hR+YFT6SVGdEX5kbhBAwZ272ARrV2IBjvrmsNZTjKttA+C9z0Y9TDd
         ceakR7pQ4VSBDIfweKuesgJPwH/JZmLnuOc2wYdQyZF3cpXaSv//RTUx6czW+EJsdBUj
         R9TtU6z43Gb0U7ySZHbuIBkIDHgCxTC1AQZdEce395l04Nh+4wqlXHZpp2cntpJcGMxa
         ostA==
X-Gm-Message-State: AOAM5332UAmsAXqJDUYqc2W+00Ml3ZEG+U2s/vKjgloVQ6hXqL3yaEq/
	iJPTXMzrlYfNes51a+kvoKlifWPriKWzKQ==
X-Google-Smtp-Source: ABdhPJwVIUmbETzolBVi24g/bZ0u8SFiMPSJosmPj6NbTbvH5G3z3s4Deg/3NS4UhTOcqmZzfpQXPg==
X-Received: by 2002:a50:d987:: with SMTP id w7mr816635edj.113.1603919172276;
        Wed, 28 Oct 2020 14:06:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/33] json-glib: upgrade 1.4.4 -> 1.6.0
Date: Wed, 28 Oct 2020 22:05:32 +0100
Message-Id: <20201028210558.21070-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...o-instead-of-cast-to-convert-pointer.patch | 33 -------------------
 ...{json-glib_1.4.4.bb => json-glib_1.6.0.bb} | 14 ++++----
 2 files changed, 8 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
 rename meta/recipes-gnome/json-glib/{json-glib_1.4.4.bb => json-glib_1.6.0.bb} (78%)

diff --git a/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch b/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
deleted file mode 100644
index 2a834b674d..0000000000
--- a/meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d60fcd5bd5c2675e4342775b910a2ea48ec0eccb Mon Sep 17 00:00:00 2001
-From: Dimitry Andric <dim@FreeBSD.org>
-Date: Wed, 19 Aug 2020 03:35:16 +0000
-Subject: [PATCH] scanner: use macro instead of cast to convert pointer to integer
-
-Clang 11 build failed due to a new warning (part of -Werror=pointer-to-int-cast):
-../json-glib/json-scanner.c:928:13: error: cast to smaller integer type 'GTokenType' from 'gpointer' (aka 'void *') [-Werror,-Wvoid-pointer-to-enum-cast]
-        *token_p = (GTokenType) value_p->v_symbol;
-                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/json-glib/-/commit/8c5fabe962b7337066dac7a697d23fce257a5d64]
-Signed-off-by: Jan Beich <jbeich@FreeBSD.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- json-glib/json-scanner.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/json-glib/json-scanner.c b/json-glib/json-scanner.c
-index 0c9919f..59dd29c 100644
---- a/json-glib/json-scanner.c
-+++ b/json-glib/json-scanner.c
-@@ -925,7 +925,7 @@ json_scanner_get_token_i (JsonScanner	*scanner,
-       
-     case G_TOKEN_SYMBOL:
-       if (scanner->config->symbol_2_token)
--	*token_p = (GTokenType) value_p->v_symbol;
-+	*token_p = GPOINTER_TO_INT (value_p->v_symbol);
-       break;
-       
-     case G_TOKEN_BINARY:
--- 
-2.28.0
-
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
similarity index 78%
rename from meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
rename to meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
index add9ff41a1..3cb637f220 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.4.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
@@ -13,12 +13,14 @@ DEPENDS = "glib-2.0"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome manpages upstream-version-is-even
-
-SRC_URI += "file://run-ptest \
-            file://0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch \
-"
-SRC_URI[archive.md5sum] = "4d4bb9837f6d31e32d0ce658ae135f68"
-SRC_URI[archive.sha256sum] = "720c5f4379513dc11fd97dc75336eb0c0d3338c53128044d9fabec4374f4bc47"
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+GTKDOC_MESON_OPTION = "gtk_doc"
+GTKDOC_MESON_ENABLE_FLAG = 'enabled'
+GTKDOC_MESON_DISABLE_FLAG = 'disabled'
+
+SRC_URI += " file://run-ptest"
+SRC_URI[archive.sha256sum] = "0d7c67602c4161ea7070fab6c5823afd9bd7f7bc955f652a50d3753b08494e73"
 
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
 
-- 
2.29.0

