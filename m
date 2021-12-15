Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387C3C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.2679.1639608043084707583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c4ip5ynz;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id s1so6595084wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QBkEZXIijPyN4PT7+f3t6sBw6sHP2YQJi/5lb/mFo9s=;
        b=c4ip5ynz1Xew7tQQN13IWp2UjPVmd8ZiGU+zX/5AgRkU+8OmEHv4y81P1WUxNPTbjm
         1bXL+1a8OcaNAkeICYWgzEjaFp+ZrbJIMtAlkVaAQ+wsILJcdGRwxz5DDYuEevM9skVG
         boK5GlITBFLidBFnWG4PA6gZf9a6YQil/+5HKxB8rcFxdP0V076DgiJ+B/tQosaey7Xd
         uUUH2qymXqaCmCWvZEt6wpW+1mXJfxn6vlfen9Hvm+4851MwI0LYkD2lHaxQ+FHkJvg7
         ROLDEQyt+/N2ODAVAMWwyZhUVEho43YMLMD5vWGwDGCcUz7/NU194v3au0Mbuu2A6Zzp
         jclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QBkEZXIijPyN4PT7+f3t6sBw6sHP2YQJi/5lb/mFo9s=;
        b=YoNQTU9FbXfjhkpoHqH4JoDyp2mDWJAEhito+9BdTctiBhAFHbm/krlF4aVUvCVane
         G3f/C+vf81/3ASksu5p5eG9VTVuwfU/Falt4/PF9I/TJd2GJcCWwXSjOTEON82yKMCMX
         6t5+FPO+KkrNSdq6gxeadKQXQA1INrMfO4xCDSFIshRcGk2ZesyjayOwtaurVRrDgvRp
         sgged2VLMpS5oAZtTGQxznlrEMy9dDOsPp/e1uz5b0Fd9B8LYn+HbUIORHt15T2GGb6N
         ygwaHbiVCfJK+YRwsOKEuvNFaqv7HuaQTxebz+M7cdBx4qE+qxbDHCOJOqv3HHACz0oL
         XlOw==
X-Gm-Message-State: AOAM532BKzHnEwCzBafjXBfrr7s/OWIvgadTbgWD5UFk2AMO9H8AR9VB
	MS/0S/ir2vlCyLlbhqcgdpfdiEtEViKhJA==
X-Google-Smtp-Source: 
 ABdhPJzBTIMqBiOw6AmIBJ7y+Y/qbA2t67TyD5KI2FfMi6LrSx0Ec++1BhC3DrGUFaSwYamzvLEQLw==
X-Received: by 2002:adf:dbcd:: with SMTP id e13mr228350wrj.206.1639608041653;
        Wed, 15 Dec 2021 14:40:41 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 04/26] elfutils: update patch submitted upstream
Date: Wed, 15 Dec 2021 23:40:12 +0100
Message-Id: <20211215224034.1814148-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159746

As that's what upstream prefers.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../elfutils/elfutils_0.186.bb                |  2 +-
 ...infod-client.c-correct-string-format.patch | 64 -------------------
 ...infod-client.c-use-long-for-cache-ti.patch | 45 +++++++++++++
 .../elfutils/files/0003-musl-utils.patch      |  2 +-
 .../0015-config-eu.am-do-not-use-Werror.patch |  2 +-
 5 files changed, 48 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
index b3588a2196..93f53c1f2e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
            file://0001-debuginfod-fix-compilation-on-platforms-without-erro.patch \
+           file://0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
deleted file mode 100644
index 85f22cb395..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 38ddd0d1863f83e8ec545d0160bdf00bbb5569ba Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 19 Apr 2021 23:29:10 +0200
-Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on
- 32bit arches with 64bit time_t
-
-Use intmax_t to print time_t
-
-time_t is platform dependent and some of architectures e.g.
-x32, riscv32, arc use 64bit time_t even while they are 32bit
-architectures, therefore directly using integer printf formats will not
-work portably, use intmax_t to typecast time_t into printf family of
-functions
-
-Upstream-Status: Submitted [via email to mark@klomp.org,elfutils-devel@sourceware.org]
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- debuginfod/debuginfod-client.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index c875ee6..df9737d 100644
---- a/debuginfod/debuginfod-client.c
-+++ b/debuginfod/debuginfod-client.c
-@@ -231,15 +231,15 @@ debuginfod_config_cache(char *config_path,
-       if (fd < 0)
-         return -errno;
- 
--      if (dprintf(fd, "%ld", cache_config_default_s) < 0)
-+      if (dprintf(fd, "%jd", (intmax_t)cache_config_default_s) < 0)
-         return -errno;
-     }
- 
--  long cache_config;
-+  int cache_config;
-   FILE *config_file = fopen(config_path, "r");
-   if (config_file)
-     {
--      if (fscanf(config_file, "%ld", &cache_config) != 1)
-+      if (fscanf(config_file, "%d", &cache_config) != 1)
-         cache_config = cache_config_default_s;
-       fclose(config_file);
-     }
-@@ -272,7 +272,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
-   if (fd < 0)
-     return -errno;
- 
--  if (dprintf(fd, "%ld", cache_clean_default_interval_s) < 0)
-+  if (dprintf(fd, "%jd", (intmax_t)cache_clean_default_interval_s) < 0)
-     return -errno;
- 
-   /* init max age config file.  */
-@@ -280,7 +280,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
-       && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
-     return -errno;
- 
--  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) < 0)
-+  if (dprintf(fd, "%jd", (intmax_t)cache_default_max_unused_age_s) < 0)
-     return -errno;
- 
-   return 0;
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch
new file mode 100644
index 0000000000..089f1a2210
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch
@@ -0,0 +1,45 @@
+From a0852044907110479d0fb212dda2c5e45af2d3aa Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 9 Dec 2021 10:43:06 +0100
+Subject: [PATCH] debuginfod/debuginfod-client.c: use long for cache time
+ configurations
+
+time_t is platform dependent and some of architectures e.g.
+x32, riscv32, arc use 64bit time_t even while they are 32bit
+architectures, therefore directly using integer printf formats will not
+work portably.
+
+Use a plain long everywhere as the intervals are small enough
+that it will not be problematic.
+
+Upstream-Status: Submitted [via email to mark@klomp.org,elfutils-devel@sourceware.org]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ debuginfod/debuginfod-client.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
+index c875ee6..11e0fd5 100644
+--- a/debuginfod/debuginfod-client.c
++++ b/debuginfod/debuginfod-client.c
+@@ -134,17 +134,17 @@ struct debuginfod_client
+    how frequently the cache should be cleaned. The file's st_mtime represents
+    the time of last cleaning.  */
+ static const char *cache_clean_interval_filename = "cache_clean_interval_s";
+-static const time_t cache_clean_default_interval_s = 86400; /* 1 day */
++static const long cache_clean_default_interval_s = 86400; /* 1 day */
+ 
+ /* The cache_miss_default_s within the debuginfod cache specifies how
+    frequently the 000-permision file should be released.*/
+-static const time_t cache_miss_default_s = 600; /* 10 min */
++static const long cache_miss_default_s = 600; /* 10 min */
+ static const char *cache_miss_filename = "cache_miss_s";
+ 
+ /* The cache_max_unused_age_s file within the debuginfod cache specifies the
+    the maximum time since last access that a file will remain in the cache.  */
+ static const char *cache_max_unused_age_filename = "max_unused_age_s";
+-static const time_t cache_default_max_unused_age_s = 604800; /* 1 week */
++static const long cache_default_max_unused_age_s = 604800; /* 1 week */
+ 
+ /* Location of the cache of files downloaded from debuginfods.
+    The default parent directory is $HOME, or '/' if $HOME doesn't exist.  */
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 85f8140330..cbc9fce790 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 934d21dc0b06b95c7c65cb29c5096decd91d4d5f Mon Sep 17 00:00:00 2001
+From 8b48c580bae0b0ffc773b0b829c50d33a907853c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index c96cfd9777..9952070939 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From a2ce41e91d530459eb35d64a19f714ebfe0d4a20 Mon Sep 17 00:00:00 2001
+From 5e39da062929a60a07ddfc8b6d435ea65ea3e31f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jun 2020 21:35:16 +0000
 Subject: [PATCH] config/eu.am: do not use -Werror
-- 
2.20.1


