Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.28339.1593351268894287656
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 06:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lozr1tPz;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id dp18so13945095ejc.8
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2020 06:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=39YpE8cazE7L5BDcrzZiwBeck3LrBK0Au9eCLl8Py9M=;
        b=lozr1tPzupBp9yX1FjHtb0T/UZug9+F3gZZ4mQzuxkwd5XAZhCfx52NsXYyIaK2HI1
         9h1lAS6ks14NT/Y2APtQelbtgL0XXILzYCIF3NBDaM2Mlu4Bz9cBfWG77oD8VwcubIPK
         PWnYMlyAb/pgpjmOuhu7uehoVy2yr5uRvJ4JgU9kEF/D+YTpfsgwbB1ihGCqu+U8iW50
         nmr5pkC7qdSKj2OLxFQR4OZGlhV9b+F8VKMG+UeB1ENS2YEjO2N+JoIIFcNNABfS5Pya
         2sUAIMRfSPB2Jq8qQ/5XeyO4GkBN9zKn54o3lPyio788hiApSkpov4sRsyhf6G//et60
         wa+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=39YpE8cazE7L5BDcrzZiwBeck3LrBK0Au9eCLl8Py9M=;
        b=gDQE0+AyGU1iMu0AhX8UZRm+6q3Hnb2YuzZ3wnMqvJLHqmvuJ62YOSq8GWS+BDFdyb
         koTTkVIxD0fh8f+0EnYbW8wkkT88Bw/ncn53bR6l7n9KhBO9bZHo1BYZHfCZwsExbbyo
         xg3CO3QBVAiKRlKCr+lPuV2my0zEgEC1z6AKLAQ25F6xsQsYUgQhfxasoPcf7oReferg
         H9ujA1cMwgbQGHqkAVctb5mClG9RLMFaFD2n4WDFOH+NUcWqhB2nnYgqgepayp5PcHe/
         1N40zHy3epeVCNEbEG+L9rt8iX+rLpBpismJMn4Ussne5xnTwlT16vpyj/2DmseEshoD
         LjAQ==
X-Gm-Message-State: AOAM531KqFrcqQKICYG2bZdt011P2AhUqdhY1HL/2QVFfhZVxl620DQu
	E6AXUqDgmfriE9pYM1rOc5O0UNnC
X-Google-Smtp-Source: ABdhPJw6Vmcsd7ke/FrDZqvRV+B1ODZq6+/DXFNAleTPs5AaODZbKRQBiAS5P+0IuYPuCmDNC1qXDA==
X-Received: by 2002:a17:906:aac1:: with SMTP id kt1mr10690118ejb.408.1593351266834;
        Sun, 28 Jun 2020 06:34:26 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f4b8e33cbb401a015e6742d.dip0.t-ipconnect.de. [2003:f0:7f4b:8e33:cbb4:1a0:15e6:742d])
        by smtp.gmail.com with ESMTPSA id u19sm18192024edd.62.2020.06.28.06.34.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 06:34:26 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] ccache: merge ccache.inc into recipe
Date: Sun, 28 Jun 2020 15:34:13 +0200
Message-Id: <20200628133414.3246339-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200628133414.3246339-1-schnitzeltony@gmail.com>
References: <20200628133414.3246339-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-devtools/ccache/ccache.inc      | 28 --------------------
 meta/recipes-devtools/ccache/ccache_3.7.9.bb | 28 +++++++++++++++++++-
 2 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache.inc

diff --git a/meta/recipes-devtools/ccache/ccache.inc b/meta/recipes-devtools/ccache/ccache.inc
deleted file mode 100644
index dcbbf0ca7a..0000000000
--- a/meta/recipes-devtools/ccache/ccache.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "a fast C/C++ compiler cache"
-DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
-by caching the result of previous compilations and detecting when the \
-same compilation is being done again. Supported languages are C, C\+\+, \
-Objective-C and Objective-C++."
-HOMEPAGE = "http://ccache.samba.org"
-SECTION = "devel"
-LICENSE = "GPLv3+"
-
-DEPENDS = "zlib"
-
-SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
-UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
-
-inherit autotools
-
-# Remove ccache-native's dependencies, so that it can be used widely by
-# other native recipes.
-DEPENDS_class-native = ""
-EXTRA_OECONF_class-native = "--with-bundled-zlib"
-INHIBIT_AUTOTOOLS_DEPS_class-native = "1"
-PATCHTOOL = "patch"
-
-BBCLASSEXTEND = "native"
-
-do_configure_class-native() {
-    oe_runconf
-}
diff --git a/meta/recipes-devtools/ccache/ccache_3.7.9.bb b/meta/recipes-devtools/ccache/ccache_3.7.9.bb
index a4de6c9fe1..e55854bfa8 100644
--- a/meta/recipes-devtools/ccache/ccache_3.7.9.bb
+++ b/meta/recipes-devtools/ccache/ccache_3.7.9.bb
@@ -1,7 +1,33 @@
-require ccache.inc
+SUMMARY = "a fast C/C++ compiler cache"
+DESCRIPTION = "ccache is a compiler cache. It speeds up recompilation \
+by caching the result of previous compilations and detecting when the \
+same compilation is being done again. Supported languages are C, C\+\+, \
+Objective-C and Objective-C++."
+HOMEPAGE = "http://ccache.samba.org"
+SECTION = "devel"
 
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=22d514dbc01fdf9a9784334b6b59417a"
 
+DEPENDS = "zlib"
+
+SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
 SRC_URI[md5sum] = "a4a38afc62ed189904357739fd8f3fb8"
 SRC_URI[sha256sum] = "92838e2133c9e704fdab9ee2608dad86c99021278b9ac47d065aa8ff2ea8ce36"
+
+UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
+
+inherit autotools
+
+# Remove ccache-native's dependencies, so that it can be used widely by
+# other native recipes.
+DEPENDS_class-native = ""
+EXTRA_OECONF_class-native = "--with-bundled-zlib"
+INHIBIT_AUTOTOOLS_DEPS_class-native = "1"
+PATCHTOOL = "patch"
+
+BBCLASSEXTEND = "native"
+
+do_configure_class-native() {
+    oe_runconf
+}
-- 
2.26.2

