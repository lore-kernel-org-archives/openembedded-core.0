Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.22704.1627645515485522520
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uiz+Za1y;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id n28-20020a05600c3b9cb02902552e60df56so6187941wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MbKlbx/soq1BSHShnLdi0325XzClIf1jtB6AsvOkIro=;
        b=uiz+Za1yOMpuxfnszj9j/XtGaGLSjsJfCh7yTzdP5IwWslFpALgLY0Bdt2Kt0ar9uN
         MQ8FWqfJXLR5f33S0/1sUoUoFdwXImLEUbkfT6pS2vjtIIeJvHr/zbMSNhnwsYPzXiFi
         w16O9DKuMTMpVDo+jFyzY56dS2iCAVwGPzKvl26SlJSyEMi53/BBcYFz/ZyLqp+t4mE9
         9GGhWM1JEEMT94Txa1Yh7yZSeUmhEYgWbAfKdCaH9Q1yVcXoN4Ab64acHv1oeuxQ6Yz8
         1ZYq9QDS/jvS787Erj2nIyGQTze2o6dMzJdDYHxiXiy4ChJsqfe34wWtyzbZLrLnRtc9
         X2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MbKlbx/soq1BSHShnLdi0325XzClIf1jtB6AsvOkIro=;
        b=LXqyCx5/x/rP4vlqRI5WpZocn4wbEDPHf6H83E0cBuFNv0LIaRJyzh+LS+MTDcxTSf
         iuzpjtWzVzDrO2E/G8zeZvTJUTiHcfCmWMxHSl0jMBYChwfiBF0t4rjPQj2vd+gX+bDD
         Olcpqn7oGdxlEfPCkJIVVJm4VcCq5edyeVHK8CZvtEjFjn4wUURa7cHI7Npl25LikQkF
         rvcCdXxFKv9DyZjDw5GfMli9oCNw+/vmViG+vA9fDw/C2L6gEdPZEzzwcVYjgOJfKFPO
         EeWclUX03EMKSlV+ZNKSrXgEW8Kzch4ur5CGd0wr62qFzLC4sHBXBx9QyihGBSJHOSgh
         Vpag==
X-Gm-Message-State: AOAM533p0TNhMkLIlPlRSV7yUL5X2rls1KF958cVsy8EddTpCBt9EKc3
	6B9Ij8ZxQdwEku7GJZL5pAylgZUjdU8=
X-Google-Smtp-Source: ABdhPJxcS0wlfXOyaY2mZe+6JSIhsBBAt3kMVEKT4KSb5UCbyuWIN2YRsggtMeXjDmQq7GQL7EMqLw==
X-Received: by 2002:a05:600c:350a:: with SMTP id h10mr7124wmq.184.1627645513580;
        Fri, 30 Jul 2021 04:45:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm1459792wra.80.2021.07.30.04.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:45:13 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/9] mtools: update 4.0.32 -> 4.0.34
Date: Fri, 30 Jul 2021 13:45:00 +0200
Message-Id: <20210730114507.732448-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210730114507.732448-1-alex.kanavin@gmail.com>
References: <20210730114507.732448-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop no-x11.gplv3.patch (the libraries are now
dynamically enabled from configure.in).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mtools/disable-hardcoded-configs.patch     |  4 ++--
 .../mtools/mtools/no-x11.gplv3.patch           | 18 ------------------
 .../{mtools_4.0.32.bb => mtools_4.0.34.bb}     |  3 +--
 3 files changed, 3 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtools/mtools/no-x11.gplv3.patch
 rename meta/recipes-devtools/mtools/{mtools_4.0.32.bb => mtools_4.0.34.bb} (91%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 81d76d060e..c78f73d255 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 630dbcabc408cf5d73edaa7cf64a48194976b290 Mon Sep 17 00:00:00 2001
+From bd2ec723326b6d57350da73b444dd43e923011e8 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.32.bb b/meta/recipes-devtools/mtools/mtools_4.0.34.bb
similarity index 91%
rename from meta/recipes-devtools/mtools/mtools_4.0.32.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.34.bb
index 501875037a..3d2702ac36 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.32.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.34.bb
@@ -24,11 +24,10 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "62498cd51ae7c79a27c879a45f0d2a8c44e1404cbb901372d09b02735ef5ad89"
+SRC_URI[sha256sum] = "ada543eb1b0ffe5440d4ee42634309ea1e286d7ebb80c99ba50db5cb2c360cab"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-           file://no-x11.gplv3.patch \
            file://clang_UNUSED.patch \
            "
 
-- 
2.31.1

