Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.5957.1622797838698221570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TYnwgUjs;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id b9so13355168ejc.13
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jZPYnPPGlGvvXH3vqKie1nu4MbEkJWf8AjgAJa5CvjM=;
        b=TYnwgUjszk9e8AWmgjf3NBUepChmPN3BPFSzIq1EvBkLUWGt/uIZSLz53bdiVHIT9f
         J4eqFPlYwjFkDFRTtfBeFittzCaISXk8Uh/JKN9HF+heiCWfMqbJyk/bkGu9BGUR/ydP
         5U8IYsfgPCi+B/gDNSQ9RWpf76Sh2+B7MjcRNtfsArr0sHjno8z8JRHMuK2hMbiwu9oq
         DFA1DRtA/toC8aTojteXNUlQKe8lU4bw2a4rjCM25Jabl4BZUPqoBivJYnKNPrlpaHXe
         uh2Rlmx+MN+n9m0+JeGxOrt8algobWQPsbTVEpNhM731I7Bvm7vXHA/ncQuDE3MktM0M
         Craw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jZPYnPPGlGvvXH3vqKie1nu4MbEkJWf8AjgAJa5CvjM=;
        b=eWnzGhD9OH7wWS02wdccP1JJphWp1lTB+V9LH5pIdoJ1wGvjtikBOhoymtUQ4hAzVg
         /2PDoi5uf4YB4YR/aGx0wZpccVXqrn/QkwYtRYX+6O1yLBosXZoLKNYQRenTSY9apXJP
         5KFc28hMJtlhoHEdcBWyRL5OI18+mNFePQQhIPGXyVzNAdgTwPZOm7h1Yprz2Sg/OLtU
         QZYO5c1Kn1Np0qwHkUTj0+q5t2w5D08smO4jITMsdvaQU6xTLQ8mgLKtVSWtL4SCpcjl
         3l9LEjW1ts7crCQ36nabWAiGcV4ylXQx/BCLIPQPMMQk3dfme2wxYSFxyP3Q5GzvjKPy
         ga3Q==
X-Gm-Message-State: AOAM531phlhxeTS4voPpnR0gqElYblvbfW7Wc0G7T0L+xvamq3ThHFK8
	XDUctCKv2pP8RH4KGjEz3tOfrFtFDhzbmQ==
X-Google-Smtp-Source: ABdhPJwN9q9dYGCAevb38VVTwY0hKQrM+f657J2Aqhgfig6SiWjrYP0W+ZN9KbJD9HZ05Q6ZFPRA/g==
X-Received: by 2002:a17:906:4747:: with SMTP id j7mr3308610ejs.419.1622797836972;
        Fri, 04 Jun 2021 02:10:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/11] elfutils: update 0.183 -> 0.185
Date: Fri,  4 Jun 2021 11:10:21 +0200
Message-Id: <20210604091030.1380877-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091030.1380877-1-alex.kanavin@gmail.com>
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

0001-add-support-for-ipkg-to-debuginfod.cxx.patch merged upstream.

0001-debuginfod-debuginfod-client.c-correct-string-format.patch rebased.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{elfutils_0.183.bb => elfutils_0.185.bb}  |  3 +-
 ...d-support-for-ipkg-to-debuginfod.cxx.patch | 33 ----------
 ...infod-client.c-correct-string-format.patch | 61 ++++++++-----------
 .../elfutils/files/0002-musl-libs.patch       |  4 +-
 .../elfutils/files/0003-musl-utils.patch      |  8 +--
 .../files/0004-Fix-error-on-musl.patch        |  4 +-
 .../0015-config-eu.am-do-not-use-Werror.patch | 16 ++---
 7 files changed, 42 insertions(+), 87 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.183.bb => elfutils_0.185.bb} (97%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
similarity index 97%
rename from meta/recipes-devtools/elfutils/elfutils_0.183.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.185.bb
index 7aebaf1b6d..b1ffbc18bf 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
@@ -21,7 +21,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
            file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
            "
 SRC_URI_append_libc-musl = " \
@@ -30,7 +29,7 @@ SRC_URI_append_libc-musl = " \
            file://0004-Fix-error-on-musl.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
+SRC_URI[sha256sum] = "dc8d3e74ab209465e7f568e1b3bb9a5a142f8656e2b57d10049a73da2ae6b5a6"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
deleted file mode 100644
index 5f82afef0c..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 571416bf5b5ef319df6d9c79e46680920487e4a7 Mon Sep 17 00:00:00 2001
-From: dorindabassey <dorindabassey@gmail.com>
-Date: Sat, 19 Dec 2020 01:11:46 +0100
-Subject: [PATCH] add support for ipkg to debuginfod.cxx
-
-added support for ipkg to the debuginfod scanner. 0.182 only supports RPM and scan .debs, with this patch, debuginfod scanner would be able to scan .ipk
-
-Upstream-status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2020q4/003357.html]
-
-Signed-off-by: dorindabassey <dorindabassey@gmail.com>
-
----
- debuginfod/debuginfod.cxx | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
-index b34eacc..a8915f2 100644
---- a/debuginfod/debuginfod.cxx
-+++ b/debuginfod/debuginfod.cxx
-@@ -484,11 +484,13 @@ parse_opt (int key, char *arg,
-         {
-           scan_archives[".deb"]="dpkg-deb --fsys-tarfile";
-           scan_archives[".ddeb"]="dpkg-deb --fsys-tarfile";
-+          scan_archives[".ipk"]="dpkg-deb --fsys-tarfile";
-         }
-       else
-         {
-           scan_archives[".deb"]="(bsdtar -O -x -f - data.tar.xz)<";
-           scan_archives[".ddeb"]="(bsdtar -O -x -f - data.tar.xz)<";
-+          scan_archives[".ipk"]="(bsdtar -O -x -f - data.tar.xz)<";
-         }
-       // .udeb too?
-       break;
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
index 5bd6ba961c..5b225c532d 100644
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
@@ -1,4 +1,4 @@
-From 14dfe84943b8f9e6f504536d8735ef6356210b40 Mon Sep 17 00:00:00 2001
+From c3055ce9eb32d0d24abc5cea5e1d231c499312a7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Apr 2021 23:29:10 +0200
 Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on
@@ -16,15 +16,34 @@ Upstream-Status: Pending
 
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- debuginfod/debuginfod-client.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ debuginfod/debuginfod-client.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index de26af5..39e28f2 100644
+index ee7eda2..083ec2c 100644
 --- a/debuginfod/debuginfod-client.c
 +++ b/debuginfod/debuginfod-client.c
-@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -226,7 +226,7 @@ debuginfod_config_cache(char *config_path,
+       if (fd < 0)
+         return -errno;
+ 
+-      if (dprintf(fd, "%ld", cache_config_default_s) < 0)
++      if (dprintf(fd, "%jd", (intmax_t)cache_config_default_s) < 0)
+         return -errno;
+     }
+ 
+@@ -234,7 +234,7 @@ debuginfod_config_cache(char *config_path,
+   FILE *config_file = fopen(config_path, "r");
+   if (config_file)
+     {
+-      if (fscanf(config_file, "%ld", &cache_config) != 1)
++      if (fscanf(config_file, "%jd", (intmax_t*)(&cache_config)) != 1)
+         cache_config = cache_config_default_s;
+       fclose(config_file);
+     }
+@@ -267,7 +267,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
    if (fd < 0)
      return -errno;
  
@@ -33,7 +52,7 @@ index de26af5..39e28f2 100644
      return -errno;
  
    /* init max age config file.  */
-@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -275,7 +275,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
        && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
      return -errno;
  
@@ -42,33 +61,3 @@ index de26af5..39e28f2 100644
      return -errno;
  
    return 0;
-@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-       if (interval_file == NULL)
-         return -errno;
- 
--      int rc = fprintf(interval_file, "%ld", cache_clean_default_interval_s);
-+      int rc = fprintf(interval_file, "%jd", (intmax_t)cache_clean_default_interval_s);
-       fclose(interval_file);
- 
-       if (rc < 0)
-@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-   interval_file = fopen(interval_path, "r");
-   if (interval_file)
-     {
--      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
-+      if (fscanf(interval_file, "%jd", (intmax_t*)(&clean_interval)) != 1)
-         clean_interval = cache_clean_default_interval_s;
-       fclose(interval_file);
-     }
-@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-   max_unused_file = fopen(max_unused_path, "r");
-   if (max_unused_file)
-     {
--      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
-+      if (fscanf(max_unused_file, "%jd", (intmax_t*)(&max_unused_age)) != 1)
-         max_unused_age = cache_default_max_unused_age_s;
-       fclose(max_unused_file);
-     }
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
index b373940d37..c7360da7a7 100644
--- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
@@ -1,4 +1,4 @@
-From 18c527991deee93170a887b6da622560d5606913 Mon Sep 17 00:00:00 2001
+From 0f4667f0bb4b000d74ade07e90bd690b7217a19d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:18:47 +0800
 Subject: [PATCH] musl-libs
@@ -82,7 +82,7 @@ index ecb4d01..edc85e3 100644
  #include <stdint.h>
  
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
-index 6edb27f..f331e3c 100644
+index c0f8dfa..aa78033 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
 @@ -50,6 +50,7 @@
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 65593be32f..2e379cdba6 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 2dab1a02a3cfd80629f3e0f380805a5e58dd0ac3 Mon Sep 17 00:00:00 2001
+From 2f94d488bf3daaa6a8548ee77120fc2506a9bbe3 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -39,7 +39,7 @@ index e117166..8326f6c 100644
  /* State of -D/-U flags.  */
  extern bool arlib_deterministic_output;
 diff --git a/src/elfcompress.c b/src/elfcompress.c
-index 1b5b1e3..21c9024 100644
+index 2c6d91b..608646e 100644
 --- a/src/elfcompress.c
 +++ b/src/elfcompress.c
 @@ -37,6 +37,13 @@
@@ -57,7 +57,7 @@ index 1b5b1e3..21c9024 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/strip.c b/src/strip.c
-index 7a5d4e4..81a0d57 100644
+index 70fc8c0..d035d9e 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -46,6 +46,13 @@
@@ -75,7 +75,7 @@ index 7a5d4e4..81a0d57 100644
  
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index 8580329..d547487 100644
+index e488e81..0e44456 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -52,6 +52,15 @@
diff --git a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
index 8e1e97041f..2fa60c333c 100644
--- a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
@@ -1,4 +1,4 @@
-From ce3b1403bd88261b5461a9dcb7d6d6be9185703e Mon Sep 17 00:00:00 2001
+From 72819106d0e5666d172d39c24c19e4e7a3b8be0e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 22:15:03 +0100
 Subject: [PATCH] Fix error on musl:
@@ -19,7 +19,7 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 5 insertions(+)
 
 diff --git a/tests/elfstrmerge.c b/tests/elfstrmerge.c
-index abbdf3f..bd90f4d 100644
+index 197c6a5..3683672 100644
 --- a/tests/elfstrmerge.c
 +++ b/tests/elfstrmerge.c
 @@ -33,6 +33,11 @@
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index 205362626d..5cd6fffc27 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From dfe11e043cd8ea0b0f0252bcff9f5a6b98c0ecd3 Mon Sep 17 00:00:00 2001
+From cfced441d4a6f2eca51d29c52240275bd6f54e49 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jun 2020 21:35:16 +0000
 Subject: [PATCH] config/eu.am: do not use -Werror
@@ -16,22 +16,22 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/config/eu.am b/config/eu.am
-index 6c3c444..3bc0dc9 100644
+index 2c3e457..8fb0411 100644
 --- a/config/eu.am
 +++ b/config/eu.am
-@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 	    -Wold-style-definition -Wstrict-prototypes -Wtrampolines \
+@@ -89,7 +89,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+ 	    -Wold-style-definition -Wstrict-prototypes $(TRAMPOLINES_WARNING) \
  	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
-@@ -83,7 +82,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
- 	   -Wtrampolines \
+ 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
+@@ -99,7 +98,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
+ 	   $(TRAMPOLINES_WARNING) \
  	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
 -	   $(if $($(*F)_no_Werror),,-Werror) \
  	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	   $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
+ 	   $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
-- 
2.31.1

