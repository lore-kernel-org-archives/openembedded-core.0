Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A41EC46CD8
	for <webhook@archiver.kernel.org>; Fri, 22 Dec 2023 10:46:45 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.20687.1703241997750040269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Dec 2023 02:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P87ZYotw;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50e18689828so2083530e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 02:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703241995; x=1703846795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEBkAyNVVKQASFReW9HyOiwr8ipj7po2TT97149/BX4=;
        b=P87ZYotwvGSCHws3IABja+Qp3iN66YiuTJlh2L6xQtKX7l4mm1kDbJmaEyW1Pz/Str
         v09PXhJze6bxibRl/HF6JUtlIoDg0t0cpvYiA9rErumBY3Sz7aNTHJToMsAPfOtlW9RH
         I8/dS85yRx+3tBHbOgLClkUj8KewgoPSKhI44uDPB7+d4e5yKCv2g1I7XKG9c81YBnxS
         wskSAiOB8F2Z0R53lKgBdcm86XexFhltqbkbOtk3oxpcojOuR0ZwWpGD8ztC6T9uTsAV
         gVq+z/XJURb2mIxqfvQyf99edp7AZiLC6yUO3S9IW/oDzwXQ/yfPjgj4sGs870xR8NMU
         AGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703241995; x=1703846795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEBkAyNVVKQASFReW9HyOiwr8ipj7po2TT97149/BX4=;
        b=FUuXystdN4TCWM0FIPSWiGxFCa9uGYWY1yAEVUXZZrAMS/6cOhk6+9t+fbXsvQYICw
         h3UX6OlDWjOuODQ5iC4jEdn6q7johLKI8YXEy0GQkqEp4l1/y+cVKQRX5nHd67sVWCjc
         KCY1p4fAeM8+CzM6gR8aJfqwb57zWgg5Jxo+yUsEBrapHTeC92fb6euq+5mnWpqO/d7+
         u+Sed1Ac7GtpjCq7ZGWaGl0d1aAUWTHfcvhCTXL7np1IMn6OExd8FZcYDH9hMmjsqhGZ
         n/MCY2cSZnYSlE6waroY0IgXBXUPOKzC1yv29g3yr6UKOVszXF9w1GkFlCo/978hS2HK
         cUog==
X-Gm-Message-State: AOJu0YxXW222fPuVrZdUj+nhCthC5gnGqQXOYJdeQWqbISZBj0X98xO7
	QTXL2jvgo0av3OlXX7iW6m6aBOCYm9HmqQ==
X-Google-Smtp-Source: AGHT+IE9fwlen0givKJgta/I6LemdibFpS1JxS1oTL6zhyIh0mQzQRbAggxWMW/IpOpTx/CewfxdBQ==
X-Received: by 2002:a05:6512:2142:b0:50e:5bdd:b870 with SMTP id s2-20020a056512214200b0050e5bddb870mr468143lfr.64.1703241995182;
        Fri, 22 Dec 2023 02:46:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id g6-20020a056402320600b0055410f0d709sm2281571eda.19.2023.12.22.02.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 02:46:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] appstream: update 0.16.3 -> 1.0.1
Date: Fri, 22 Dec 2023 11:46:31 +0100
Message-Id: <20231222104631.3810007-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231222104631.3810007-1-alex@linutronix.de>
References: <20231222104631.3810007-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Dec 2023 10:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192869

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-meson-do-not-rely-on-an-exe-wrapper.patch | 36 -------------------
 .../0001-remove-hardcoded-path.patch          | 28 ++++++++-------
 ...appstream_0.16.3.bb => appstream_1.0.1.bb} | 10 +++---
 3 files changed, 19 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-exe-wrapper.patch
 rename meta/recipes-support/appstream/{appstream_0.16.3.bb => appstream_1.0.1.bb} (78%)

diff --git a/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-exe-wrapper.patch b/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-exe-wrapper.patch
deleted file mode 100644
index d4f2951e7a9..00000000000
--- a/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-exe-wrapper.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 79bf322768990b28c29a9d907edcca52ff48e0b8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
-Date: Wed, 26 Jul 2023 23:21:10 +0400
-Subject: meson: do not rely on an exe wrapper
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-
-Upstream-Status: Backport [https://github.com/ximion/appstream/commit/79bf322768990b28c29a9d907edcca52ff48e0b8]
----
- data/meson.build | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/data/meson.build b/data/meson.build
-index aea0cb25..ec0e434f 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -7,6 +7,13 @@ install_data('its/metainfo.its',
- install_data('its/metainfo.loc',
-               install_dir: join_paths(get_option('datadir'), 'gettext', 'its'))
- 
-+# Do not rely on an exe wrapper for rel-info, use the system one in that case
-+if meson.is_cross_build()
-+    dependency('appstream', version: '>=' + as_version, native: true,
-+               not_found_message: 'Native appstream required for cross-building')
-+    ascli_exe = find_program('appstreamcli')
-+endif
-+
- # NOTE: We do not translate the release notes on purpose here.
- # If you do want to give translators a chance to translate them,
- # ascli news-to-metainfo needs to produce a temporary file to translate
--- 
-2.41.0
-
diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 9cbfaca82f1..8f4cf1b82a4 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
+From 93bc5c1b221e5a10c65d4a055181dc818dfe1aa8 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -9,23 +9,25 @@ Dont include hardcoded path. This fixes:
 | cc1: error: include location "/usr/include" is unsafe for cross-compilation [-Werror=poison-system-directories]
 
 Upstream-Status: Inappropriate [oe-specific]
+
 ---
- meson.build       | 2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index fd0e3373..2f273ada 100644
+index 0556b1e..d66919f 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -124,7 +124,7 @@ if get_option ('gir')
-     dependency('gobject-introspection-1.0', version: '>=1.56')
- endif
- 
--stemmer_inc_dirs = include_directories(['/usr/include'])
-+stemmer_inc_dirs = include_directories([''])
+@@ -185,10 +185,10 @@ endif
+ stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
+-    stemmer_inc_dirs = include_directories(['/usr/include'])
++    stemmer_inc_dirs = include_directories()
      if not cc.has_header('libstemmer.h')
--- 
-2.34.1
-
+         if cc.has_header('libstemmer/libstemmer.h')
+-            stemmer_inc_dirs = include_directories('/usr/include/libstemmer')
++            stemmer_inc_dirs = include_directories()
+         else
+             error('Unable to find Snowball header "libstemmer.h". Please ensure libstemmer/Snowball is installed properly in order to continue.')
+         endif
diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb b/meta/recipes-support/appstream/appstream_1.0.1.bb
similarity index 78%
rename from meta/recipes-support/appstream/appstream_0.16.3.bb
rename to meta/recipes-support/appstream/appstream_1.0.1.bb
index bde679e256a..7723800bab8 100644
--- a/meta/recipes-support/appstream/appstream_0.16.3.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.1.bb
@@ -24,12 +24,10 @@ inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
 GIR_MESON_OPTION = "gir"
 GTKDOC_MESON_OPTION = "apidocs"
 
-SRC_URI = " \
-	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
-	file://0001-remove-hardcoded-path.patch \
-	file://0001-meson-do-not-rely-on-an-exe-wrapper.patch \
-"
-SRC_URI[sha256sum] = "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6344a2b318b98b1"
+SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
+           file://0001-remove-hardcoded-path.patch \
+           "
+SRC_URI[sha256sum] = "fa4d5994e5c6f22e9b66cb0b52e8b5f5d96e7353ea5528b56436e0150829203b"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.39.2


