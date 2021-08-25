Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.13817.1629891495402181014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 04:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eUAzfwXh;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id k20-20020a05600c0b5400b002e87ad6956eso2688063wmr.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=el9sEQSodJxLUUAsXJjmS+3sT0eduRJ1v9dHKSQ7frM=;
        b=eUAzfwXhQaXXtO3ldQbWOw03ErWxOxdssr3EaPG/51CH7wskz/EYg6qdE7ne237Tem
         l1pq/KQ04vnVNiCJcrP82U9BRJZjNnRvqVzBml/84BIOfBn5SiU0l+lwLsHkICjvoXJ/
         ZM+TiQ05rQWzyT19WYIr/xZxDpo7CEXvedC/GdqE5OFmnEfSk2E7usrhy6qKIN+yRYPz
         D4kzdgqXg3TuE0cYkaD2e2ntMOt69zDqbUc5NUioER0WFRxQLNUnPchOWJPk5X7YeaKV
         ENKzgovLmro+R3bH+X7LbjxSKWR6QnGrzHSL4t9cGLkGHuZUB2RCFsTsbPXnKJdsxkdx
         6iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=el9sEQSodJxLUUAsXJjmS+3sT0eduRJ1v9dHKSQ7frM=;
        b=ekMOoQ2XzFSyl63oRZ7eOLS0wtnui7gbi2jL+sWn7WBCcQO+RVeVBXZtkj1A9w9VXZ
         t3k1NrJt3Vop/DbQ0EdBvYWX/ra9AiGrSHmjkuEQnHmQY+zF7sF4o3DN61QjKAqEnHg1
         c6PzaKyfB3UOi0PF1+xK0Jiv+1DZ6lPvSnd3WPZwwbEMzsAZaVwhijLeVBTKLdd0nN7k
         r1ExIcfEmVJQ8ra5XktVZV+DgjZ0UaIp5Ct1WsY9y/0Z+UJjQnpaZezalaNXnVgUXacp
         hFH8K7lu9JpBqCul4jsbDjWvHeY39bGs5Di/hARKe4Mnrf6dw2OU03OI9zSWLkJmLAhx
         y6oA==
X-Gm-Message-State: AOAM5330fhcscbXcxBqlfRrm7cd94jwwez8fosiEtI76n+0bWEJxiqh0
	Hlh2+SqG/9mb8wA5SrULcXLlhVNZSS5aKg==
X-Google-Smtp-Source: ABdhPJzRr91p4RuvlhtqzV9Rw6KM772WJJp8f9+XTUlHJw7JRbdquFnvkPaGl4LnDp4dQx2Q09zu1g==
X-Received: by 2002:a1c:27c5:: with SMTP id n188mr8876718wmn.126.1629891494035;
        Wed, 25 Aug 2021 04:38:14 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id z17sm20790217wrr.66.2021.08.25.04.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 04:38:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/16] glib-2.0: upgrade 2.68.3 -> 2.68.4
Date: Wed, 25 Aug 2021 13:37:51 +0200
Message-Id: <20210825113804.779395-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825113804.779395-1-alex.kanavin@gmail.com>
References: <20210825113804.779395-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop merged 0001-correctly-use-3-parameters-for-close_range.patch

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...tly-use-3-parameters-for-close_range.patch | 29 -------------------
 .../glib-2.0/glib-2.0/relocate-modules.patch  |  2 +-
 ...{glib-2.0_2.68.3.bb => glib-2.0_2.68.4.bb} |  3 +-
 3 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-correctly-use-3-parameters-for-close_range.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.68.3.bb => glib-2.0_2.68.4.bb} (93%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-correctly-use-3-parameters-for-close_range.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-correctly-use-3-parameters-for-close_range.patch
deleted file mode 100644
index 6ff25fc535..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-correctly-use-3-parameters-for-close_range.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b71117d89434db83d34bc1b981ca03d4be299576 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 8 Jul 2021 17:26:43 -0700
-Subject: [PATCH] correctly use 3 parameters for close_range
-
-libc implementation has 3 parameter e.g.
-https://www.freebsd.org/cgi/man.cgi?query=close_range&sektion=2&format=html
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2180]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- glib/gspawn.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/glib/gspawn.c b/glib/gspawn.c
-index 899647c2f..3073a10a4 100644
---- a/glib/gspawn.c
-+++ b/glib/gspawn.c
-@@ -1520,7 +1520,7 @@ safe_closefrom (int lowfd)
-    *
-    * Handle ENOSYS in case it’s supported in libc but not the kernel; if so,
-    * fall back to safe_fdwalk(). */
--  if (close_range (lowfd, G_MAXUINT) != 0 && errno == ENOSYS)
-+  if (close_range (lowfd, G_MAXUINT, 0) != 0 && errno == ENOSYS)
- #endif  /* HAVE_CLOSE_RANGE */
-   (void) safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
- #endif
---
-2.32.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index f34f30bb3c..846c8d62b6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From e56cdb8c343dd6a6ed3b10bd54e353d633ad6158 Mon Sep 17 00:00:00 2001
+From dac2bdeea38388e069412aa27eff8f1eff0440e5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.68.4.bb
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.68.4.bb
index c71dc81202..cd789de3c0 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.68.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.68.4.bb
@@ -18,11 +18,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch \
            file://time-test.patch \
-           file://0001-correctly-use-3-parameters-for-close_range.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "e7e1a3c20c026109c45c9ec4a31d8dcebc22e86c69486993e565817d64be3138"
+SRC_URI[sha256sum] = "62fd061d08a75492617e625a73e2c05e259f831acbb8e1f8b9c81f23f7993a3b"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.31.1

