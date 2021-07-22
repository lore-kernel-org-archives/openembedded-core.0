Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.1195.1626993917530510351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 15:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZSZFMCjH;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id l6so4236999wmq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 15:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MP/b1T8gD49Un8G+3LeLr+wE1BgfX+M72vrDMgeABO4=;
        b=ZSZFMCjH5kwAp3hxn3yS4xnRRnsVGlq0jLMg8iEgAQ7RYGTGuML9rHdJLIxtyHjl5S
         gvtaJ6vtUq0/7eZemzqBMy1zSMymP60DX3fccE/995WmEX9HajOa8/rkqRkNmuetnkWS
         UGCtzzr835NTDZ9oeTWm8H+/Hb15e+eKAkd7G/4RM/Pk0PBVo51PQvirXqLWGmT8iN4/
         QBdotd7GytS8kJ7VJv3eTWj/wgZcXzQbiRJPnlURZl8Pyjj7jZw2tnOxoEYENQyTe0ak
         c68SJ1J3rKDfgRiFHTAnTSVdVOsJTsutjc14bjZRtJld9vouA5tV10/0BKAs6QNwhNgL
         r+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MP/b1T8gD49Un8G+3LeLr+wE1BgfX+M72vrDMgeABO4=;
        b=pUsm6MNJ7RnUg6AL2NcJFpKDZI9c6yWE2Fmj2wWfrUYKFQDPmt+wZ1qZ/N38mhtYwO
         0xGqaVi+mmbBMgqcXWuGSlyzQt093taq7e3NAm+Ru7x97Q0TTqDHlnr0fLJ9zRNgh7zk
         7TUA9e6rVObd/Uxp4OoO09qeI05W7wp/DgA5/XpGQdKqeGJe6eRcfSmnAeoUA2ucEjPh
         l+yHQxIQxCKTuSmWOUGQjuqVvCFxUCUcUxfu5mEzQ1LzUwbQVKsVjsCG3hLqQhJ2HUcH
         4E2iL6GWSpXZ7pBw7nChJ9luCvXzTy1UcmPnrqdlgaB20iXy9spjbGaPLadzqGDDTjF1
         z4aA==
X-Gm-Message-State: AOAM5324YALoGR75qsfEuTJeqeBUQepX3NSt9UJqFKce5S6dGc8JnRuq
	tI3cfNyFQcx4v9nm0VOjEXYm1ILKj29ryA==
X-Google-Smtp-Source: ABdhPJzg+R9hZey2qqQKhKBKSNAsQCYkmO5DYG/UyDnXiXBoOgTDXbapJZ5OeKpj9zVEmc6/mID6yA==
X-Received: by 2002:a05:600c:4fcf:: with SMTP id o15mr11230548wmq.116.1626993916184;
        Thu, 22 Jul 2021 15:45:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n5sm24337739wrp.80.2021.07.22.15.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:45:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 5/8] mtools: update 4.0.32 -> 4.0.33
Date: Fri, 23 Jul 2021 00:45:05 +0200
Message-Id: <20210722224508.51967-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722224508.51967-1-alex.kanavin@gmail.com>
References: <20210722224508.51967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop no-x11.gplv3.patch (the libraries are now
dynamically enabled from configure.in).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mtools/disable-hardcoded-configs.patch     |  4 ++--
 .../mtools/mtools/no-x11.gplv3.patch           | 18 ------------------
 .../{mtools_4.0.32.bb => mtools_4.0.33.bb}     |  3 +--
 3 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
 rename meta/recipes-devtools/mtools/{mtools_4.0.32.bb => mtools_4.0.33.bb} (91%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 81d76d060e..90573dcb1a 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 630dbcabc408cf5d73edaa7cf64a48194976b290 Mon Sep 17 00:00:00 2001
+From 7efdb47246413f938e3b2d8378ce9c363d98b371 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,7 +12,7 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index bb13682..9186c77 100644
+index 173eae0..0654cc1 100644
 --- a/config.c
 +++ b/config.c
 @@ -836,14 +836,6 @@ void read_config(void)
diff --git a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch b/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
deleted file mode 100644
index 9cb3e39f5c..0000000000
--- a/meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Disable building with X11 support.
-
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-diff -urN mtools-4.0.15.orig//Makefile.in mtools-4.0.15//Makefile.in
---- mtools-4.0.15.orig//Makefile.in	2010-10-17 08:41:09.000000000 -0700
-+++ mtools-4.0.15//Makefile.in	2010-11-23 13:59:49.258258374 -0800
-@@ -146,7 +146,7 @@
- CXXFLAGS  = $(CPPFLAGS) $(DEFS) $(MYCXXFLAGS) -I. @extraincludedir@ -I@srcdir@ $(USERCFLAGS)
- LINK      = $(CC) $(LDFLAGS) $(USERLDFLAGS) @extralibdir@
- ALLLIBS   = $(USERLDLIBS) $(MACHDEPLIBS) $(SHLIB) $(LIBS)
--X_LDFLAGS = $(X_EXTRA_LIBS) $(X_LIBS) -lXau -lX11 $(LIBS)
-+X_LDFLAGS = $(X_EXTRA_LIBS) $(X_LIBS) $(LIBS)
- X_CCFLAGS = $(X_CFLAGS) $(CFLAGS)
- 
- all:    mtools $(LINKS) mkmanifest @FLOPPYD@ mtools.1 mtools.5
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.32.bb b/meta/recipes-devtools/mtools/mtools_4.0.33.bb
similarity index 91%
rename from meta/recipes-devtools/mtools/mtools_4.0.32.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.33.bb
index 501875037a..fd9febb01d 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.32.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.33.bb
@@ -24,11 +24,10 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "62498cd51ae7c79a27c879a45f0d2a8c44e1404cbb901372d09b02735ef5ad89"
+SRC_URI[sha256sum] = "1cb10f8e1e20302f86eaa9c5db262f4559d1dc94bd11fdda7692bc2d1beab954"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-           file://no-x11.gplv3.patch \
            file://clang_UNUSED.patch \
            "
 
-- 
2.31.1

