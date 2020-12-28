Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.2416.1609185885769306840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TOAuRDQ4;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id qw4so15539695ejb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yO5Uk2JwE94TeIULP6FkLVDmSob51ekkr7LfMaxWiH8=;
        b=TOAuRDQ43qDAvsFTvkIeri6W3Htjo3WDrw3S3rM3lajGz5A+o9MTUByPO13DgCyGpe
         3Um7W0/xXdBKc92arV4/H9wLSamc3Z226RqpyNyZIzIQPvrvItExyh6kiZMgkQAaZTqb
         9Fu4wbyHPVTHvfC6MSy/suCMPfg0EPwFZ4q3UZm8H3p5y2+92zt/XJJPncCuLlMHyq9/
         Bxy6r35/MYwkJt5QJxmlSCTqgxmWG4IVB6NQB00ui1RbrHmd+ZdDHWiIHjrRKDEzegp8
         oxAymtM8m4siK3BK1i8jaOJKNSCe/Y8ZW3DXVEztNgoi7sTipbpKIGm9EpdYuaHnaHn2
         r4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yO5Uk2JwE94TeIULP6FkLVDmSob51ekkr7LfMaxWiH8=;
        b=Fc5Koa3nS+VldIunBLlw9EmCKbBhA0KoI6V1urvYtztD5NlsszC7vDh/iCSG7OSzod
         oOFGZ/Sn38VH1S8BGi3U45iqu5rVv/GkAfC+FNCeOVKi0ugxyAAniPXicp7AAaexGRXK
         y36oYOdhoT9BWchIsFcLHob8QnizXMP989h96QL54F/j3dXBnbeX+ghgRgocTQnjeoBZ
         ilUhmVL0UAjRJgj9SJpVC9CZHkb67ks2tKUuXCUagUw56cN2sK4hdXb5UZvnTNQv5K6Z
         Q8Gld4nIzU6K/8QWuFhE+zFj58G/MzmwqJqhDv++kmYtrft43w952LXtL1MovgIqPjHY
         G0NA==
X-Gm-Message-State: AOAM532643POyDTrPdM68P/VvZYOsZkNkOpkQmG+mQJsJZqJc6MwFZ/n
	cxKC0Ix/3BCAMB9lgmpTje+NkRbgs5M=
X-Google-Smtp-Source: ABdhPJzsT1EvFYcnBerwRi7VTRNRDRTBT8Cvzy19LnwT/FgpgwuIB2NcGdYbr6ooPR6caIGpRisxDA==
X-Received: by 2002:a17:906:3b8b:: with SMTP id u11mr42312851ejf.489.1609185884432;
        Mon, 28 Dec 2020 12:04:44 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:43 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/22] libksba: update 1.4.0 -> 1.5.0
Date: Mon, 28 Dec 2020 21:04:17 +0100
Message-Id: <20201228200436.78130-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libksba/ksba-add-pkgconfig-support.patch   | 18 +++++++++++-------
 .../{libksba_1.4.0.bb => libksba_1.5.0.bb}     |  2 +-
 2 files changed, 12 insertions(+), 8 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.4.0.bb => libksba_1.5.0.bb} (92%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index ebb7fa588a..af96bd57cd 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 7bd2b060e9ea3e2ff11e67d1e98ab882819b28b7 Mon Sep 17 00:00:00 2001
+From 6081640895b6d566fa21123e2de7d111eeab5c4c Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
@@ -11,11 +11,15 @@ They think pkgconfig adds no portability and maintaining them is not worthwhile.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
+---
+ src/ksba.m4 | 90 +++--------------------------------------------------
+ 1 file changed, 4 insertions(+), 86 deletions(-)
+
 diff --git a/src/ksba.m4 b/src/ksba.m4
-index ad8de4f..af903ad 100644
+index 6b55bb8..6e7336f 100644
 --- a/src/ksba.m4
 +++ b/src/ksba.m4
-@@ -22,37 +22,6 @@ dnl with a changed API.
+@@ -23,37 +23,6 @@ dnl with a changed API.
  dnl
  AC_DEFUN([AM_PATH_KSBA],
  [ AC_REQUIRE([AC_CANONICAL_HOST])
@@ -23,7 +27,7 @@ index ad8de4f..af903ad 100644
 -  dnl since that is consistent with how our three siblings use the directory/
 -  dnl package name in --with-$dir_name-prefix=PFX.
 -  AC_ARG_WITH(libksba-prefix,
--              AC_HELP_STRING([--with-libksba-prefix=PFX],
+-              AS_HELP_STRING([--with-libksba-prefix=PFX],
 -                             [prefix where KSBA is installed (optional)]),
 -     ksba_config_prefix="$withval", ksba_config_prefix="")
 -
@@ -53,7 +57,7 @@ index ad8de4f..af903ad 100644
  
    tmp=ifelse([$1], ,1:1.0.0,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
-@@ -63,56 +32,13 @@ AC_DEFUN([AM_PATH_KSBA],
+@@ -64,56 +33,13 @@ AC_DEFUN([AM_PATH_KSBA],
       min_ksba_version="$tmp"
    fi
  
@@ -113,7 +117,7 @@ index ad8de4f..af903ad 100644
          if test "$tmp" -gt 0 ; then
             AC_MSG_CHECKING([KSBA API version])
             if test "$req_ksba_api" -eq "$tmp" ; then
-@@ -125,14 +51,8 @@ AC_DEFUN([AM_PATH_KSBA],
+@@ -126,14 +52,8 @@ AC_DEFUN([AM_PATH_KSBA],
       fi
    fi
    if test $ok = yes; then
@@ -129,7 +133,7 @@ index ad8de4f..af903ad 100644
      if test x"$libksba_config_host" != xnone ; then
        if test x"$libksba_config_host" != x"$host" ; then
    AC_MSG_WARN([[
-@@ -146,8 +66,6 @@ AC_DEFUN([AM_PATH_KSBA],
+@@ -147,8 +67,6 @@ AC_DEFUN([AM_PATH_KSBA],
        fi
      fi
    else
diff --git a/meta/recipes-support/libksba/libksba_1.4.0.bb b/meta/recipes-support/libksba/libksba_1.5.0.bb
similarity index 92%
rename from meta/recipes-support/libksba/libksba_1.4.0.bb
rename to meta/recipes-support/libksba/libksba_1.5.0.bb
index a9daf22d77..005389eab6 100644
--- a/meta/recipes-support/libksba/libksba_1.4.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.5.0.bb
@@ -19,7 +19,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
 
-SRC_URI[sha256sum] = "bfe6a8e91ff0f54d8a329514db406667000cb207238eded49b599761bfca41b6"
+SRC_URI[sha256sum] = "ae4af129216b2d7fdea0b5bf2a788cd458a79c983bb09a43f4d525cc87aba0ba"
 
 do_configure_prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.29.2

