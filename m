Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94.1795101876306215715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=UvyhrCBZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so21398925e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101874; x=1795706674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tHqgn2TuqEYs+boZl8Jqww321c0F6s6ObKWvbCyNpIA=;
        b=UvyhrCBZNqIMSOYs4vAPuUO4b5BiSzrvNbGoPGcO1GYjhQ5GN9vYGRflABlCqpkWiR
         95zrUs+OQTwfqpMql256p/6FE/92skO8ng6zGfAcs/pES+SRlBAWBD38kxAOXy9fxLGE
         7vzCrvO+DSFArfVok+mSIBRosI0I5AxvKS3O6ebJRL6ZlfXUuu2sWcrsJkIFdxH4q5vb
         xTADPAFQb0EpTZyx3L1l/VCsv0vovk3I26aryeDqiDfFJ58hius2I5jcAOSKHFgUbExq
         XyoNGOtQLHnpCmwBVVz7cfwWNfMKF/a3B4102ytm+YRwOTYKmv8eyiOfg6FpcvEF+u2u
         8TeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101874; x=1795706674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tHqgn2TuqEYs+boZl8Jqww321c0F6s6ObKWvbCyNpIA=;
        b=Xi9IS2VeT0uFrPjxEeDf582P12gLFYENWrkCyhvoPpd4x54HlwhaQXZDnKMMq4DiL9
         u40VGaT4FRIuNxz6cYRQsdss/AXJcOAtm0dmN5AMYJvqGHdDJ2DcMSIM0k49BCuBtFbG
         g+rHynivfiyb3+Y17ufnA4J/nwy030Om/p7XV6peOtZihKS8jCqGwEh0Degf0yNDM0ks
         YiaRCk2XNHBQY/7PmlKaudbAfL/usbW2klnm3tPgqJfJEsRVJwwfpnT7hqVZMYzGvIhd
         2mUBEtEV36KfSixPf4e8Wr2NA51S+I0HnqsrA0ztK6R4a6phODBAyWe22EZ47OGDLcY1
         9aMw==
X-Gm-Message-State: APuU4Z/ppZnj9vuINBK/crrjSJ+CNpLuSUikfeqwJB2tKoZWSpLo6GJF
	SreSywKPDjYVzgBT0QGVNhKpqKPsrydK7323K+MAUPa7pQ6HPAh9dQxSMtYIgzo8Bt9S1KKy9Zu
	8pwqyDkM=
X-Gm-Gg: AYBFou32hYI4OxVLtCuZV52OLMHyO8xgkbIvpx6Q8qvN2Z28Oibcm27K0a+giXLFiBL
	8TOt33zvGrQEazs09B2rmX3E/0gQ9j1nRup/il3ey+ZP5x08jsgnQhYp2cB9AB/6J9ET8d1YMhE
	+lYnffhYNe24AwKHZ/UD3jpJSGY/5Ru7+Ns0u/67GSOdOWkjqdbDvXs4+WgJDFPtzjzTRFsE4jI
	TfnmS1/gzYZOyr7AWe0RMG9QKfyRKlCTdTr5POiLXEb1jy9G0y3tUJEhTVELRn88/GlWxKAdnaj
	P/t/Jiz3wB+KwH/hPMxKbOqiaRNYhZswbEsQ9VLr8VNMyvWrOWEJ1Lixpn1LgtG8ZRbnbs9Igmo
	hQfGOoIUZtKo0YPknUqjiuPZnfwum0+tbVCEhPIdqNyIZfJUDd5zW3fc3UJQT7N/VJ+PSmisGGL
	N6V87qtfy21SfAnbIaaN6QMXe2VLOCOGKmjAGqeBq3jUQlfpDVLJNum0axRV/UQE/YfJEIMoWNe
	Mi8G/qS3xYDSE3dKLT7SXREV62kP0OeLqRfaOYyGzb8EowC/l/bTp/jDEe49Y7P4Vpe1iotuc5u
	cXoFItRk6Oq0gNJv5FwvZ728eCSRy5oOa3ltPKazO4yrmdE6Krg9Am9qwadnj/GQlNn2z1cVQK9
	MZPM0npRp8lEEBOKmLzmIePgk86e1o0zKKMy6KThqfGYMwaQJlW2H2/Q=
X-Received: by 2002:a05:600c:154b:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4bb7d5d3f46mr125393465e9.4.1795101873886;
        Thu, 19 Nov 2026 07:24:33 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:32 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/19] aspell: Backport a fix to build with gcc-15/clang-19
Date: Thu, 19 Nov 2026 16:22:44 +0100
Message-ID: <993d5766d34bade5b6722452811d1f25977efd41.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250701
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: d6cb53c0773d28f57b5699125ef825936d4725d1)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 ...default-vector_hash-t.hpp-fix-gcc-15.patch | 42 +++++++++++++++++++
 .../recipes-support/aspell/aspell_0.60.8.1.bb |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch

diff --git a/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch b/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
new file mode 100644
index 0000000000..4045e8e412
--- /dev/null
+++ b/meta/recipes-support/aspell/aspell/0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch
@@ -0,0 +1,42 @@
+From d45bf96b0a3556acb2c83069a78eaaac973d31b4 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Sun, 21 Jul 2024 22:01:50 +0100
+Subject: [PATCH] modules/speller/default/vector_hash-t.hpp: fix gcc-15 build
+
+Uncoming `gcc-15` added extra checks for template instantiation that is
+guaranteed to fail in
+  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=313afcfdabeab3e6705ac0bd1273627075be0023
+
+As a result `aspell` build now fails as:
+
+    In file included from modules/speller/default/readonly_ws.cpp:51:
+    modules/speller/default/vector_hash-t.hpp: In member function 'void aspeller::VectorHashTable<Parms>::recalc_size()':
+    modules/speller/default/vector_hash-t.hpp:186:43: error: 'class aspeller::VectorHashTable<Parms>' has no member named 'e'
+      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
+          |                                           ^
+    modules/speller/default/vector_hash-t.hpp:186:59: error: 'class aspeller::VectorHashTable<Parms>' has no member named '_size'; did you mean 'size'?
+      186 |     for (iterator i = begin(); i != this->e; ++i, ++this->_size);
+          |                                                           ^~~~~
+          |                                                           size
+
+It looks like `_size` is `size_` mis-spelling and `e` was not introduced
+here.
+Upstream-Status: Backport [https://github.com/GNUAspell/aspell/commit/ee6cbb12ff36a1e6618d7388a78dd4e0a2b44041]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/speller/default/vector_hash-t.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/speller/default/vector_hash-t.hpp b/modules/speller/default/vector_hash-t.hpp
+index 969a80c..e4420b4 100644
+--- a/modules/speller/default/vector_hash-t.hpp
++++ b/modules/speller/default/vector_hash-t.hpp
+@@ -183,7 +183,7 @@ namespace aspeller {
+   template<class Parms>
+   void VectorHashTable<Parms>::recalc_size() {
+     size_ = 0;
+-    for (iterator i = begin(); i != this->e; ++i, ++this->_size);
++    for (iterator i = begin(), e = end(); i != e; ++i, ++size_);
+   }
+ 
+ }
diff --git a/meta/recipes-support/aspell/aspell_0.60.8.1.bb b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
index 0ea9b063e0..43940b1e1b 100644
--- a/meta/recipes-support/aspell/aspell_0.60.8.1.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.8.1.bb
@@ -13,7 +13,8 @@ HOMEPAGE = "http://aspell.net/"
 LICENSE = "LGPL-2.0-only | LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
+           file://0001-modules-speller-default-vector_hash-t.hpp-fix-gcc-15.patch"
 SRC_URI[sha256sum] = "d6da12b34d42d457fa604e435ad484a74b2effcd120ff40acd6bb3fb2887d21b"
 
 PACKAGECONFIG ??= ""
