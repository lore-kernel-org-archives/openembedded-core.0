Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.3982.1588240717157349364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 02:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Wmrl0gEd;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id g12so1178227wmh.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e3H8/QyOVFRy2fqlTLlPnsF8bqIYEzYdvR9UFAwBDjc=;
        b=Wmrl0gEddf6lbQQgqB5QmxitHXDH20LCtAgRnwbuni/NlI22Vi37Y1z/ovdoFcWlBD
         GSDlVQezFlf8Wwdlk89D+icyCzCyEiiGPdWC5he9yiMGHSNQ/pizA2+L/c8eP5o7B5CB
         eLp6EhtFhiKR4CN3/BfACUkxLtlIIXmwE430xq7YV5kEFSzHRVDL++yo7JRjwxIU8Wbl
         CzkW0Jiq8wQ7Zf+rB5IOK4a5uYwytr8oSkCn2CFmBZbuVQ4jqJK73mr01zVQ2ZRP9haH
         Dh1FVhnRAQKVWO4oV8weoRedLYjEqN/Y10aIRGBS6hgxIOKhvpnkTmVYTPGaxt9Tuvu4
         CrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e3H8/QyOVFRy2fqlTLlPnsF8bqIYEzYdvR9UFAwBDjc=;
        b=MY3JigrBzyVJQtmUqmzGyKeXSuA3JOPpe/HoEn4cLmk6+lDQIVL9tdi8FggyZov0sa
         vRwFd61nhBLZ+7/rYK/jDb1QF8WTANny3ejp6oH1AQZwy1rYSok5zImSSvatUTE7Iwwm
         vyqC+vRCvvOGgNd0+C6psClJu8RrxxAYTIAmIBQHycmXUi7HVJlAWctVVzGFA/Vfokmz
         nwHS1PcQOeLmUhPeWGxXP5O/rb7w6QJ9+byvn1lTRRd/fznvdJ4ANDwWt0ZDw2tB0SGP
         yqEcvikDT2BVpboTqGsj8Zh1Mci3E3rzM9ntSYGkJ1RCcCZDLta8Q+UC7lCjOh6XrhCK
         u0jg==
X-Gm-Message-State: AGi0PuYyM5YHOC7OIfNUkPOYdVVT+HQEoGcdBDypQ7eMo0T8sNNGvFRU
	qWovle5MRzjlbD0SZnqYMAdQPthE
X-Google-Smtp-Source: APiQypJRAAWtJAp27pIEDuH9jom1Jcoa2+pGw5p0ezopuJigEmkm9aROYF5Bnr3xl26esrrqnH5NWw==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr2201303wml.105.1588240715114;
        Thu, 30 Apr 2020 02:58:35 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id b82sm12380682wmh.1.2020.04.30.02.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:58:34 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/17] libxcb: update to 1.14
Date: Thu, 30 Apr 2020 11:58:05 +0200
Message-Id: <20200430095815.2824-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop a patch as the problem is fixed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/libxcb/xcbincludedir.patch       | 28 -------------------
 .../{libxcb_1.13.1.bb => libxcb_1.14.bb}      |  6 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
 rename meta/recipes-graphics/xorg-lib/{libxcb_1.13.1.bb => libxcb_1.14.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch b/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
deleted file mode 100644
index 46297c33c3..0000000000
--- a/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-As pkg-config --variable doesn't respect the sysroot, add the pkg-config sysroot
-to the beginning of variables that are used later on the host.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 94da4f7..d29cd6a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -64,7 +64,7 @@ AC_SUBST(NEEDED)
- 
- # Find the xcb-proto protocol descriptions
- AC_MSG_CHECKING(XCBPROTO_XCBINCLUDEDIR)
--XCBPROTO_XCBINCLUDEDIR=`$PKG_CONFIG --variable=xcbincludedir xcb-proto`
-+XCBPROTO_XCBINCLUDEDIR=$PKG_CONFIG_SYSROOT_DIR/`$PKG_CONFIG --variable=xcbincludedir xcb-proto`
- AC_MSG_RESULT($XCBPROTO_XCBINCLUDEDIR)
- AC_SUBST(XCBPROTO_XCBINCLUDEDIR)
- 
-@@ -74,7 +74,7 @@ AC_SUBST(XCBPROTO_VERSION)
- 
- # Find the xcbgen Python package
- AC_MSG_CHECKING(XCBPROTO_XCBPYTHONDIR)
--XCBPROTO_XCBPYTHONDIR=`$PKG_CONFIG --variable=pythondir xcb-proto`
-+XCBPROTO_XCBPYTHONDIR=$PKG_CONFIG_SYSROOT_DIR/`$PKG_CONFIG --variable=pythondir xcb-proto`
- AC_MSG_RESULT($XCBPROTO_XCBPYTHONDIR)
- AC_SUBST(XCBPROTO_XCBPYTHONDIR)
- 
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
rename to meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
index 9befc51b50..f27c5daa61 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
@@ -9,13 +9,11 @@ SECTION = "x11/libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
-           file://xcbincludedir.patch \
+SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.xz \
            file://disable-check.patch \
           "
 
-SRC_URI[md5sum] = "f33cdfc67346f7217a9326c0d8679975"
-SRC_URI[sha256sum] = "a89fb7af7a11f43d2ce84a844a4b38df688c092bf4b67683aef179cdf2a647c4"
+SRC_URI[sha256sum] = "a55ed6db98d43469801262d81dc2572ed124edc3db31059d4e9916eb9f844c34"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.26.1

