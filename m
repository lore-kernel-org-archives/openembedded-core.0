Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.20406.1607112473826986482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fAGPG6Ym;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id lt17so10475691ejb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lg3zPMnHkdiPjIQdyBcDDi98Eb7eyG/5S6mGiB0djDQ=;
        b=fAGPG6Ym1zDiuE40Ycb5/Hj+QmJFpSU0btsgdbTvs2rar9OYb5kyG3krZG7xLoSPSj
         H824O2gE9s08yOHZNZlTRcDBrDzY8XDNpXSm69phrV0a61/vC6Hs3nfuEo/SoMmzTBMN
         82kGqtxgmJgCESwWOGwJYIMoBnMElhxeQtnjg4dfgaFf4iPavHik+QTEwk5eVk7oPM6A
         Dawn5XZLS2xTz/trJghxR/ZNg/RzK7MPa1Q73UO9szJSIcaufAg5A8CzZpWe2RwyM528
         iqFi51ViAJliobCc0qeQUZFlwK4CVt+j8Bn3lljPvl9I3KkHFNt1RTCsLzT5Rw3gxby1
         UlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lg3zPMnHkdiPjIQdyBcDDi98Eb7eyG/5S6mGiB0djDQ=;
        b=ArJLnfZ7tz89GBwjtZLpE25BTYoK7uoY5WANHSMnk3yjI7w5HmCeJmVEEB2SMlUhEI
         Fc7JTU+vKSz8exUhCgB9WBa3VLeKUHq4tex6F7YnVr9ZrhG0tFNhdTrx55/T3JTmMErY
         U6Ve+DcanNELZsEDA+u4hWQCD9Yn5EllztW5GBY7D7n+ZoQ82HZl5RoG6IQmSA/6M6OI
         KvK+k1UQI1cQsvcX6WCYR98XMGsf1s+0oUR4Qhf17Y+4D3AlEpl7mzwkndiqzB69w6q0
         K5gQEDikrrcMSz0mnMQBN6iUUHynBvA4xqd0527syTU7beRKeWJF7vpV8AXVKDBfgDz8
         YvVg==
X-Gm-Message-State: AOAM532VXETbuTnOD3eISthv1+SU/LjRgvIpphHbhYbOBf82IzkKcB8o
	MPfzSrnfRJVPs3J1OMc9YChG/j7n2aT5lA==
X-Google-Smtp-Source: ABdhPJzT9aR5hXjE80HtCXpLs0UM005iM2MvcpQ9549tGTfA6yf0/+PM9H/45Ukhc9NX1SHFsm42fA==
X-Received: by 2002:a17:906:12cf:: with SMTP id l15mr8598603ejb.540.1607112471967;
        Fri, 04 Dec 2020 12:07:51 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:51 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/23] elfutils: upgrade 0.181 -> 0.182
Date: Fri,  4 Dec 2020 21:07:21 +0100
Message-Id: <20201204200737.7072-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{elfutils_0.181.bb => elfutils_0.182.bb}  |  2 +-
 .../files/0001-musl-obstack-fts.patch         |  6 ++---
 .../elfutils/files/0002-musl-libs.patch       | 24 +++++++++----------
 .../elfutils/files/0003-musl-utils.patch      |  6 ++---
 .../files/0004-Fix-error-on-musl.patch        |  2 +-
 .../0015-config-eu.am-do-not-use-Werror.patch |  2 +-
 6 files changed, 20 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.181.bb => elfutils_0.182.bb} (98%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.181.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.181.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.182.bb
index 6c49a5fc26..f63208d72b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.181.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -28,7 +28,7 @@ SRC_URI_append_libc-musl = " \
            file://0004-Fix-error-on-musl.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "29a6ad7421ec2acfee489bb4a699908281ead2cb63a20a027ce8804a165f0eb3"
+SRC_URI[sha256sum] = "ecc406914edf335f0b7fc084ebe6c460c4d6d5175bfdd6688c1c78d9146b8858"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
index 67d4703c80..ca7caf08d8 100644
--- a/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-musl-obstack-fts.patch
@@ -1,4 +1,4 @@
-From 1a62bb8e8f2cb0f180c749946a48114e8f391b55 Mon Sep 17 00:00:00 2001
+From dbaa05a519acfe4f6040784f5d4a28ca586c0fc4 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:17:25 +0800
 Subject: [PATCH] musl-obstack-fts
@@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  3 files changed, 58 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ab9c751..b057d86 100644
+index 53bab6a..dfea85e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -538,6 +538,60 @@ else
+@@ -539,6 +539,60 @@ else
  fi
  AC_SUBST([argp_LDADD])
  
diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
index 894e46c3c4..c6f766f680 100644
--- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
@@ -1,4 +1,4 @@
-From 2e1f8ca0b67c1d1991c14d509938c347e09bae94 Mon Sep 17 00:00:00 2001
+From f4ca9db9d38f865505322595a8a1e8f69d5bb87c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:18:47 +0800
 Subject: [PATCH] musl-libs
@@ -21,8 +21,8 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  lib/libeu.h                    |  1 +
  libdwfl/dwfl_error.c           |  9 +++++++++
  libdwfl/linux-kernel-modules.c |  1 +
- libelf/elf.h                   |  9 ++++++---
- 6 files changed, 44 insertions(+), 4 deletions(-)
+ libelf/elf.h                   |  7 +++++++
+ 6 files changed, 45 insertions(+), 1 deletion(-)
  create mode 100644 lib/error.h
 
 diff --git a/lib/error.h b/lib/error.h
@@ -104,7 +104,7 @@ index 7bcf61c..11dcc8b 100644
        return elf_errmsg (error & 0xffff);
      case OTHER_ERROR (LIBDW):
 diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
-index 0434f1e..5afaee8 100644
+index 6edb27f..f331e3c 100644
 --- a/libdwfl/linux-kernel-modules.c
 +++ b/libdwfl/linux-kernel-modules.c
 @@ -50,6 +50,7 @@
@@ -116,26 +116,24 @@ index 0434f1e..5afaee8 100644
  /* If fts.h is included before config.h, its indirect inclusions may not
     give us the right LFS aliases of these functions, so map them manually.  */
 diff --git a/libelf/elf.h b/libelf/elf.h
-index 197b557..8e5b94c 100644
+index 6439c1a..a87c589 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
-@@ -21,7 +21,9 @@
+@@ -19,6 +19,10 @@
+ #ifndef _ELF_H
+ #define	_ELF_H 1
  
- #include <features.h>
- 
--__BEGIN_DECLS
 +#ifdef __cplusplus
 +extern "C" {
 +#endif
- 
++
  /* Standard ELF types.  */
  
-@@ -4103,6 +4105,7 @@ enum
+ #include <stdint.h>
+@@ -4101,4 +4105,7 @@ enum
  #define R_ARC_TLS_LE_S9		0x4a
  #define R_ARC_TLS_LE_32		0x4b
  
--__END_DECLS
--
 +#ifdef __cplusplus
 +}
 +#endif
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index 2a21cd37ce..a8b39b5f93 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 9b237f19f82d5ab1e0702637fece1866b1ef6681 Mon Sep 17 00:00:00 2001
+From e7e5333ed2e19f25ecbd7121f424eec99d61265a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -58,7 +58,7 @@ index 6ba6af4..0c7674b 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/readelf.c b/src/readelf.c
-index 685d0b1..a842b10 100644
+index 64067a5..630739c 100644
 --- a/src/readelf.c
 +++ b/src/readelf.c
 @@ -4829,10 +4829,11 @@ listptr_base (struct listptr *p)
@@ -142,7 +142,7 @@ index 48792a7..198a2e4 100644
  
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index 9b8c09a..1fb5063 100644
+index a855038..df6fc1c 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -56,6 +56,15 @@
diff --git a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
index c79c737c62..0d162ebe1b 100644
--- a/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
+++ b/meta/recipes-devtools/elfutils/files/0004-Fix-error-on-musl.patch
@@ -1,4 +1,4 @@
-From d3dc5f98f653342af97ebfbdf3479ee1f0d0cf38 Mon Sep 17 00:00:00 2001
+From ed87f11f7297c0edb3ca8950de1cc23e9b96217c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 1 May 2019 22:15:03 +0100
 Subject: [PATCH] Fix error on musl:
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index 48fd4d41f3..ec1b927c2e 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From 9b7554a3e21ccb455b3661a6b4e767636c2c5cf3 Mon Sep 17 00:00:00 2001
+From 574ac484c01125a97ba8737cf7292ca926897310 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jun 2020 21:35:16 +0000
 Subject: [PATCH] config/eu.am: do not use -Werror
-- 
2.29.2

