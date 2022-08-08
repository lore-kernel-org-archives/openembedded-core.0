Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79D0C48BE4
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.22613.1659940986365386645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l/kvtIot;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id f22so10053016edc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Oj0Kk2bEjCHxKDb6FCXDYctfNLYIEvITWAPKZqS2i4=;
        b=l/kvtIotMfbGft238kITR1XrClcEPqE5pT0V4wnWpuKo2144xgr4zWnbCQZwLXK7u/
         ISrBo6POiLknU3Gpf1EyOkX2LU1qGEp+Fsbq8hAhuZPEJid64dyBt68dX6uWYhAjHxNP
         Vzwa/YIG/VXefeaSBulXXOGacPgHF5iNRU6+iWxPLtlWNTbfIeMuy8w3C2+Fa7KvikOl
         egbrc9EbdYRUQKKyKX667be7Mthv6xD2Z0edB6wcYxYw6oXkImBl3nsbPNElFmWxxDKw
         cSNwv7VlMNzzU6AqyB1tFFiV0m347BwJd8zEl2JLpYLu6AqFnJED2A2OJuZf5OPFCShV
         OHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Oj0Kk2bEjCHxKDb6FCXDYctfNLYIEvITWAPKZqS2i4=;
        b=bl61UkmqQTn+hxDzrgYHhK63QQjAxt0T/Jb6/CAyb0Lc5BjUcCb1vPE3MqPTn/nalI
         zaSYvzu3yEGKalCsy8H8xJoyRcIZyEPdqNGrBjJ1JBDxh3zL+UGim5tgUQI6YhbulfCL
         WLzQ/MUppj5gkkzI7qIL4tFLEsUgUw9tXqORr5BXjmz9KXCV607Xzv1Qr1avGS66Jg7c
         2gWCEYQcsCyzeN03Lqza15QSImWnFzNWiTkWqtDo8BzOFlWAdAD+kFmrwUYY9s5TOE4p
         Irc73etpGhqbx9gbyjrxMDAwscUHyhom043LVq0836b1VKjhu/dPGJBR3YA0YR6xqRBr
         HxBQ==
X-Gm-Message-State: ACgBeo1A+HBHI0mdTGkuH7iHWlL0ZB8Lyj+FHlgaQ8OG8MRB121jsJ9u
	0pofedgEHCTDZWaxZXK/wRq22lwG/2Q=
X-Google-Smtp-Source: 
 AA6agR7sDNivuwbPTfPUiU8anVpLDBELDI9wkolnkyC8AHMm8Gyg4eHynQKsktrSDYV1Cw2rpnryMg==
X-Received: by 2002:a05:6402:4385:b0:440:679a:c3fa with SMTP id
 o5-20020a056402438500b00440679ac3famr7455000edc.118.1659940989142;
        Sun, 07 Aug 2022 23:43:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 32/44] python3: upgrade 3.10.5 -> 3.10.6
Date: Mon,  8 Aug 2022 08:42:25 +0200
Message-Id: <20220808064237.3975347-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169056

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Don-t-search-system-for-headers-libraries.patch    | 6 +++---
 ...b-sysconfig.py-use-prefix-value-from-build-configu.patch | 2 +-
 ...stutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch | 2 +-
 ...tup.py-do-not-report-missing-dependencies-for-disa.patch | 6 +++---
 .../12-distutils-prefix-is-inside-staging-area.patch        | 2 +-
 .../python/{python3_3.10.5.bb => python3_3.10.6.bb}         | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.10.5.bb => python3_3.10.6.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 62dce4b827..c790c7b886 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From c83256e40d3057ac6325d649f9ce4c4da2c00874 Mon Sep 17 00:00:00 2001
+From 7589ab03ad3f7cb4bb092c31273ff22371ac77e4 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index f7a3d39..9d2273d 100644
+index c3a6b5e..c892537 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -857,8 +857,8 @@ class PyBuildExt(build_ext):
+@@ -856,8 +856,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index a9240b3c8a..641017edd5 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 01d209277e145072e478d8b9acfea3638ee16cdc Mon Sep 17 00:00:00 2001
+From d82cb96eed1098920ad3cdcb36feb32137618066 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 3c62c2acb8..368a725ff7 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 78dd1def953e18e7cda0325bb26d27c051bb6890 Mon Sep 17 00:00:00 2001
+From c24674e0a52367359a1a3d950bab8bc3d282279b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
index 0ead57e465..041a03b0cd 100644
--- a/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
+++ b/meta/recipes-devtools/python/python3/0017-setup.py-do-not-report-missing-dependencies-for-disa.patch
@@ -1,4 +1,4 @@
-From 246c5ffe75a2d494e415d8a7522df9fe22056d41 Mon Sep 17 00:00:00 2001
+From 311cf9abc213fcd76795cc3a25814a15fb552065 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 7 Oct 2019 13:22:14 +0200
 Subject: [PATCH] setup.py: do not report missing dependencies for disabled
@@ -18,7 +18,7 @@ Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
  1 file changed, 8 insertions(+)
 
 diff --git a/setup.py b/setup.py
-index 2be4738..62f0e18 100644
+index 934cf2e..ccf83b4 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -517,6 +517,14 @@ class PyBuildExt(build_ext):
@@ -35,4 +35,4 @@ index 2be4738..62f0e18 100644
 +
          if self.missing:
              print()
-             print("Python build finished successfully!")
+             print("The necessary bits to build these optional modules were not "
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index de4c6c4e19..a06e9b56c1 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 33b5a31df6050110f4481a24f5a0a0bf7fe80096 Mon Sep 17 00:00:00 2001
+From 1cc4cab8d579bbccb8a4fc13a28158a58c603cb4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.10.5.bb b/meta/recipes-devtools/python/python3_3.10.6.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.5.bb
rename to meta/recipes-devtools/python/python3_3.10.6.bb
index b237c48735..f19cd50273 100644
--- a/meta/recipes-devtools/python/python3_3.10.5.bb
+++ b/meta/recipes-devtools/python/python3_3.10.6.bb
@@ -44,7 +44,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "8437efd5b106ef0a75aabfbf23d880625120a73a86a22ade4d2e2e68d7b74486"
+SRC_URI[sha256sum] = "f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


