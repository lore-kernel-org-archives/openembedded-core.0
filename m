Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.655.1622735007194519610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qxDdETRM;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id b11so7686537edy.4
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 08:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hjulvNXHB2KKHuzHz8owQIMU+3wI6UKQdE9M32ebD1s=;
        b=qxDdETRM4Qoi8EZ7RVcTCnB6w/+7RmVOcnyFa0+y91WqS1z7O2l2kH4Lueq94B4S4g
         TaKF878KVtpFIqiWAU0cDJqtc0SbLUryUEvUVsP5JVhqbRWDqcj5701gh7dUkXc+wlvW
         Kh9nFlk5Pshsd2niiGjvv/jH4qSF5EJR1ViHLNpykZd/iw200lqACpRv/jb7hDH0q4dz
         zjVqfnstxEmIHUCUSYf1Ki5tam+DTT9mAHrys/XI/l+siWaeF4vAavTN4WgMmObYKgNK
         oEXZ/it3eZ7Nak9INw6hLka3B6tdr6th2vvmBkp+L+jr6hyWaoG7qgjkIZznjLy6pBZz
         hs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hjulvNXHB2KKHuzHz8owQIMU+3wI6UKQdE9M32ebD1s=;
        b=bT9zovT5TKyrG1+fIqSdZjEdeEfTTmCKiWUiS4/cL9Lii78Z06b6gQzJFIUHDacWXG
         m0TE+gist0LrIPzsKlOO874ZL+HstWt/reJ/b9nF2JwbI5TsZfO8zKDY6GBxpj6FvJWF
         u1b6K2LU8IH0t02XWmF1Kd4OD/1477211qiCgn3bgwPDCZLEILnKVFMZetFetygnB3y6
         0cwkZYiCLS+HgkdjYdjmgPy+VuiSjd687Wymf1MYUs1Z0dOw/WXW5oes1SkD5V46dDHU
         rN52uDhwbWVEaJHboT+fQRZF4Uvwz/Yw7Btwu4ev8F0KRa6rDOr7tGcGDBFU2e8xYH3X
         uVxA==
X-Gm-Message-State: AOAM531A7ni4WcCqKUtMUvLFbG5Qufjl6HpypVcu1LHA7m6V9I1LbAy2
	U/pvEz12i2vsiaN+k8hj+ViTXL1AwdXV2g==
X-Google-Smtp-Source: ABdhPJz1K7RZ9cq1hToub7wz/QXX9u+srJM1/PLX4a5H6JgBrZYyKB9wSeSP0WgoJ4ufOpkXFmRx2Q==
X-Received: by 2002:a05:6402:524b:: with SMTP id t11mr84444edd.327.1622735005820;
        Thu, 03 Jun 2021 08:43:25 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d17sm1644338ejp.90.2021.06.03.08.43.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 08:43:25 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] alsa-lib: upgrade 1.2.4 -> 1.2.5
Date: Thu,  3 Jun 2021 17:43:08 +0200
Message-Id: <20210603154313.2894136-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603154313.2894136-1-schnitzeltony@gmail.com>
References: <20210603154313.2894136-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Backported patch can go
* See full changelog at [1]

[1] https://github.com/alsa-project/alsa-lib/releases/tag/v1.2.5

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...de-limits.h-explicitly-to-fix-build-.patch | 41 +++++++++++++++++++
 ...8e5503980295dd8e5e54a6285d2d7e32eb1e.patch | 31 --------------
 .../{alsa-lib_1.2.4.bb => alsa-lib_1.2.5.bb}  |  4 +-
 3 files changed, 43 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.4.bb => alsa-lib_1.2.5.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch
new file mode 100644
index 0000000000..8752ef0dc0
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch
@@ -0,0 +1,41 @@
+From 26ab44c99e9f370e3da0c18982fa482e2e55f0a8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 3 Jun 2021 12:29:03 +0200
+Subject: [PATCH] ucm_exec.c: Include limits.h explicitly to fix build on musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c: In function 'find_exec':
+| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c:43:18: error: 'PATH_MAX' undeclared (first use in this function)
+|    43 |         char bin[PATH_MAX];
+|       |                  ^~~~~~~~
+| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c:43:18: note: each undeclared identifier is reported only once for each function it appears in
+| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c: In function 'uc_mgr_exec':
+| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c:177:18: error: 'PATH_MAX' undeclared (first use in this function)
+|   177 |         char bin[PATH_MAX];
+|       |                  ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/alsa-project/alsa-lib/pull/145]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/ucm/ucm_exec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ucm/ucm_exec.c b/src/ucm/ucm_exec.c
+index d83206d0..4ddf5d15 100644
+--- a/src/ucm/ucm_exec.c
++++ b/src/ucm/ucm_exec.c
+@@ -30,6 +30,7 @@
+ #include "ucm_local.h"
+ #include <sys/stat.h>
+ #include <sys/wait.h>
++#include <limits.h>
+ #include <dirent.h>
+ 
+ static pthread_mutex_t fork_lock = PTHREAD_MUTEX_INITIALIZER;
+-- 
+2.31.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch b/meta/recipes-multimedia/alsa/alsa-lib/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch
deleted file mode 100644
index 98e2988dda..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Thu, 22 Oct 2020 20:57:32 +0200
-Subject: [PATCH] dlmisc: the snd_plugin_dir_set / snd_plugin_dir must be
- declared even for \!DL_ORIGIN_AVAILABLE
-
-Fixes: 8580c081c2 ("dlsym: add support for ALSA_PLUGIN_DIR environment variable")
-BugLink: https://github.com/alsa-project/alsa-lib/issues/91
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/dlmisc.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/dlmisc.c b/src/dlmisc.c
-index c9517c55..f20eb593 100644
---- a/src/dlmisc.c
-+++ b/src/dlmisc.c
-@@ -42,11 +42,9 @@
- #ifndef PIC
- struct snd_dlsym_link *snd_dlsym_start = NULL;
- #endif
--#ifdef DL_ORIGIN_AVAILABLE
- static int snd_plugin_dir_set = 0;
- static char *snd_plugin_dir = NULL;
- #endif
--#endif
- 
- #if defined(DL_ORIGIN_AVAILABLE) && defined(HAVE_LIBPTHREAD)
- static pthread_mutex_t snd_dlpath_mutex = PTHREAD_MUTEX_INITIALIZER;
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb
index c49cc2a9b4..1d6a9655f6 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
-           file://ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e.patch"
-SRC_URI[sha256sum] = "f7554be1a56cdff468b58fc1c29b95b64864c590038dd309c7a978c7116908f7"
+           file://0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch"
+SRC_URI[sha256sum] = "9092894a8c083b33acf8d6deb901b58f5d20d6da583789f814e8e46f2850ef18"
 
 inherit autotools pkgconfig
 
-- 
2.31.1

