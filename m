Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9054DC433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:39 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.12053.1651248094148510180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jpVydxTD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso2294167pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BYeEwRyweIa27zhAoEgQmU+7EQzQosl9tz+hEYuEAJU=;
        b=jpVydxTDj2AwaEmoX8rpQKVizcrydJtmqLoX42fUecXo5uCJK8yENk7H0glHAiQiR7
         hV8FRoSN1khjkdaX+4QoqLH1D1ZEQVanl22889+c9L8ImrCOt6izarb35e9IpQfMOrqs
         lI48TJLpaEQ3so+OpfpphMOFBR5A/hrOGHVGgr79CpncTxlrV1W06x9tK/P7mC/31xI4
         DHFO90o9pYJcsC7erPG7gGvimCEJ8TdgjxllmUat5Cw788aIJbmrDWqGV28bvUpAVeJF
         0ohAlAJmTMYC+Itn/PoEAj+gQ/pNyB6CnkKzldtoGVUeKjWf5FuIU5NX0dAMilNPWpxM
         tr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BYeEwRyweIa27zhAoEgQmU+7EQzQosl9tz+hEYuEAJU=;
        b=xagm4Wo4HkonfLDwkNCB1bCLqO2r45UdKf6OIhyVfbbo6Owmf9LFe3UVBlWJITG4Oj
         JCEJ+QYLhhRVgmoC+69wW3HexXJ3NC7tgzQcFnWlLW2wvFwye9/RDj1FR3qZZolqQM/d
         5PFnv36XCbR9bkTDwgDkswFG71h3jxkbVgXVHDInxRwgEQNXKgYJSBM6T8oNQx53hZGQ
         fHd9VjE/TKnOSiorKltnAdehOrmyUydXsxsTPD4m2bMzHDy6z6pIjyUbIhewz+K6PrMX
         4aLP/tpGsKvRnjDzNjp0LEr8CfK5q9JFXRP2keMwL8Qic93T9BbPQacS0MbFAQ7X5zmU
         QRJw==
X-Gm-Message-State: AOAM533RuJRWrryedvJ5cBxyaAAPViw48r54uK/cbxadhlO47IpDPvtN
	Mi7Ifqw/yuh7z+XdkoTwQ07+QqiuXpLHtnKhx5U=
X-Google-Smtp-Source: 
 ABdhPJygGjlipQVGxPP1v5du/MiMZSHGa/+OEQxNVqCuxO5vwwLEsP3LoFdmqw354/OmInaaQ4sUHQ==
X-Received: by 2002:a17:90a:f3c7:b0:1d9:6832:7be0 with SMTP id
 ha7-20020a17090af3c700b001d968327be0mr4671628pjb.209.1651248092427;
        Fri, 29 Apr 2022 09:01:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/34] subversion: upgrade to 1.14.2
Date: Fri, 29 Apr 2022 06:00:24 -1000
Message-Id: 
 <76a74a8f22021e60326c001ccdd9b6ca200cd28e.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165024

From: Ross Burton <ross.burton@arm.com>

This release is primarily to fix two CVEs:
- CVE-2021-28544
- CVE-2022-24070

It also rewrites the macOS autoconf macros to be cross-compile friendly,
so we don't need to delete them anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ecfbc2ef45a76ab96d215954ca0a109545e6ff02)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../subversion/subversion/disable_macos.patch | 71 -------------------
 ...version_1.14.1.bb => subversion_1.14.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 73 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/disable_macos.patch
 rename meta/recipes-devtools/subversion/{subversion_1.14.1.bb => subversion_1.14.2.bb} (96%)

diff --git a/meta/recipes-devtools/subversion/subversion/disable_macos.patch b/meta/recipes-devtools/subversion/subversion/disable_macos.patch
deleted file mode 100644
index 8d2d635992..0000000000
--- a/meta/recipes-devtools/subversion/subversion/disable_macos.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 9c350c037ca3489dbeece6ecc2d7e2e5dbb177e9 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 15:21:46 +0800
-Subject: [PATCH] These tests don't work in cross compiling, just disable them
- for now, we don't build subversion on OS-X at this time.
-
-RP 1014/7/16
-
-Upstream-Status: Pending [needs a rewrite to support a cache value]
-
-Rebase to 1.12.0
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- build/ac-macros/macosx.m4 | 31 +------------------------------
- 1 file changed, 1 insertion(+), 30 deletions(-)
-
-diff --git a/build/ac-macros/macosx.m4 b/build/ac-macros/macosx.m4
-index 92fa58e..a568e1c 100644
---- a/build/ac-macros/macosx.m4
-+++ b/build/ac-macros/macosx.m4
-@@ -24,21 +24,7 @@ dnl Check for _dyld_image_name and _dyld_image_header availability
- AC_DEFUN(SVN_LIB_MACHO_ITERATE,
- [
-   AC_MSG_CHECKING([for Mach-O dynamic module iteration functions])
--  AC_RUN_IFELSE([AC_LANG_PROGRAM([[
--    #include <mach-o/dyld.h>
--    #include <mach-o/loader.h>
--  ]],[[
--    const struct mach_header *header = _dyld_get_image_header(0);
--    const char *name = _dyld_get_image_name(0);
--    if (name && header) return 0;
--    return 1;
--  ]])],[
--    AC_DEFINE([SVN_HAVE_MACHO_ITERATE], [1],
--              [Is Mach-O low-level _dyld API available?])
--    AC_MSG_RESULT([yes])
--  ],[
-     AC_MSG_RESULT([no])
--  ])
- ])
- 
- dnl SVN_LIB_MACOS_PLIST
-@@ -46,23 +32,8 @@ dnl Assign variables for Mac OS property list support
- AC_DEFUN(SVN_LIB_MACOS_PLIST,
- [
-   AC_MSG_CHECKING([for Mac OS property list utilities])
--
--  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
--    #include <AvailabilityMacros.h>
--    #if !defined(MAC_OS_X_VERSION_MAX_ALLOWED) \
--     || !defined(MAC_OS_X_VERSION_10_0) \
--     || (MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_0)
--    #error ProperyList API unavailable.
--    #endif
--  ]],[[]])],[
--    SVN_MACOS_PLIST_LIBS="-framework CoreFoundation"
--    AC_SUBST(SVN_MACOS_PLIST_LIBS)
--    AC_DEFINE([SVN_HAVE_MACOS_PLIST], [1],
--              [Is Mac OS property list API available?])
--    AC_MSG_RESULT([yes])
--  ],[
-+  AC_SUBST([SVN_MACOS_PLIST_LIBS], [""])
-     AC_MSG_RESULT([no])
--  ])
- ])
- 
- dnl SVN_LIB_MACOS_KEYCHAIN
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.1.bb b/meta/recipes-devtools/subversion/subversion_1.14.2.bb
similarity index 96%
rename from meta/recipes-devtools/subversion/subversion_1.14.1.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.2.bb
index 71183ac7ce..ba208d922f 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.1.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.2.bb
@@ -9,11 +9,10 @@ DEPENDS = "apr-util serf sqlite3 file lz4"
 DEPENDS:append:class-native = " file-replacement-native"
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://disable_macos.patch \
            file://serfmacro.patch \
            "
 
-SRC_URI[sha256sum] = "2c5da93c255d2e5569fa91d92457fdb65396b0666fad4fd59b22e154d986e1a9"
+SRC_URI[sha256sum] = "c9130e8d0b75728a66f0e7038fc77052e671830d785b5616aad53b4810d3cc28"
 
 inherit autotools pkgconfig gettext python3native
 
-- 
2.25.1


