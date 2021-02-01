Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.36592.1612196759583790449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:25:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1gs9L9zy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id d5so1413244otc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j/cxGrOGgD8EY8hIubemiG9eOTKSY3DZDk3/u+Wjo8Y=;
        b=1gs9L9zyKQ1hsArIUhxRmJS+r2qVOlhDaoGKMwvsZo0lMSpBCo+ZRcdFUgZ6rk0sXZ
         Le2eehexHYAQ4Wg4IE36lYm/fVSNeRBTYmPH/t5dch/FTUxzUdF9N6N1IQ9okc8gFOPm
         8SUdnThJD0/LZ9vHg63hNgm2QRrSf4BjevFxBJRNoqV+hzrE6VB51Otl+QQeQMLOLTog
         +jb+o2+M0uc2eoQDcNv+j369rtT7zDmMzYGk1TVCDc5S0BFYnCLW/U8yiUpMWU5uE2DT
         XGYbj/aYwnjVbv/4P7X3h++yq84Djamm6fC42vbFmO1jd694STdYWmhLtAAT1//lbL22
         j4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/cxGrOGgD8EY8hIubemiG9eOTKSY3DZDk3/u+Wjo8Y=;
        b=HJK3iGqblF5X/pja6LileLYvWmZyCWVs3j+rMUI69J1OuWeEpVR7ZMmH0amSnOaOnb
         l5PsTNnS821Hl5/7Y049gDaIprYR1+DU5c/Y0KLl/20MXQj2+vEbRlWLS+hOUAUnSu7r
         7Qqu2WvO3vmaEBLPaGrbjIfmlkM6Lr6sEz6hz07nGkG6wEJHmdTYzBcBYYrRksHNgtWp
         MoD7QwVIOLSmKV+XZlzOHjq9/2QUOSzYdBH03G1HNAklzpBXyxrWn/vpRoGhV7y0YnS5
         AqSF4jWmLdls1q3s/6GEsf915K2fL1SLLE/F6I7fUnPD8jKVgKfvJxl/RZuNxXA92wpA
         HMGA==
X-Gm-Message-State: AOAM530crkqGn4uiSngV7hLg4aJoM8nlRr5+q4sc0J4/9dxEKdz4+I+7
	952eicGnuWxmzJf/RbjeHbruVwhKfqJjg0YnWEE=
X-Google-Smtp-Source: ABdhPJyBiUunlzHA0sG2TQWL5FexcR3nrNNMimN3wEaomrDdjtRrlsk0b55vZnQjPKX1bVDkXQHNgg==
X-Received: by 2002:a05:6830:1d79:: with SMTP id l25mr11370476oti.17.1612196758306;
        Mon, 01 Feb 2021 08:25:58 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.25.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:25:57 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/21] flex: Refresh patch
Date: Mon,  1 Feb 2021 06:24:36 -1000
Message-Id: <0668fa21b7a5dbf96632b406d28d152c7c53fa3c.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zangrc <zangrc.fnst@cn.fujitsu.com>

The patch changes the same file twice which causes issues with some patch
tools (not used in YP by default). Refresh the patch to clean this up
anyway.

RP: Tweak commit message
Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb6e65f8196fd6587c75c3ab2cf060c00a074ec6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../flex/flex/check-funcs.patch               | 36 +++++++------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex/check-funcs.patch b/meta/recipes-devtools/flex/flex/check-funcs.patch
index 037ca81fdc..762275e7f8 100644
--- a/meta/recipes-devtools/flex/flex/check-funcs.patch
+++ b/meta/recipes-devtools/flex/flex/check-funcs.patch
@@ -1,10 +1,4 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From c42de062bbdc7c31d7181c10a74202d493280ada Mon Sep 17 00:00:00 2001
-From: Explorer09 <explorer09@gmail.com>
-Date: Tue, 27 Feb 2018 09:10:12 +0800
-Subject: [PATCH] build: Move dnl comments out of AC_CHECK_FUNCS
+Subject: build: Move dnl comments out of AC_CHECK_FUNCS
 
 Due to a bug, autoheader (2.69) will treat M4 dnl comments in a quoted
 argument of AC_CHECK_FUNCS as function tokens and generate a lot of
@@ -20,28 +14,20 @@ I have reported the autoheader bug here:
 
 As a workaround, let's move comments out of AC_CHECK_FUNCS.
 
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
 Signed-off-by: Kang-Che Sung <explorer09@gmail.com>
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 ---
- configure.ac | 29 +++++++++++++----------------
- 1 file changed, 13 insertions(+), 16 deletions(-)
+ configure.ac | 28 +++++++++++++---------------
+ 1 file changed, 13 insertions(+), 15 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 55e774b0..d0f3b7da 100644
+index 55e774b..5ea3a93 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -166,6 +166,7 @@ strtol dnl
- AC_CHECK_FUNCS([dnl
- pow dnl           Used only by "examples/manual/expr"
- setlocale dnl     Needed only if NLS is enabled
-+reallocarr dnl    NetBSD function. Use reallocarray if not available.
- reallocarray dnl  OpenBSD function. We have replacement if not available.
- ])
- 
-diff --git a/configure.ac b/configure.ac
-index 3c977a4e..9c53590f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -158,22 +158,19 @@ AC_FUNC_REALLOC
+@@ -153,21 +153,19 @@ AC_FUNC_REALLOC
  AS_IF([test "$cross_compiling" = yes],
     AC_MSG_WARN([result $ac_cv_func_realloc_0_nonnull guessed because of cross compilation]))
  
@@ -58,7 +44,6 @@ index 3c977a4e..9c53590f 100644
 -AC_CHECK_FUNCS([dnl
 -pow dnl           Used only by "examples/manual/expr"
 -setlocale dnl     Needed only if NLS is enabled
--reallocarr dnl    NetBSD function. Use reallocarray if not available.
 -reallocarray dnl  OpenBSD function. We have replacement if not available.
 -])
 +dnl Autoheader (<= 2.69) bug: "dnl" comments in a quoted argument of
@@ -77,3 +62,6 @@ index 3c977a4e..9c53590f 100644
  
  AC_CONFIG_FILES(
  Makefile
+-- 
+2.25.1
+
-- 
2.25.1

