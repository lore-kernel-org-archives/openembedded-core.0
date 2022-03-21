Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F19C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:43 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.2452.1647901782506759989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=weMwafKN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id o23so11299105pgk.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qxh4WFuO55K1+9jK60gvj/pDkoZwJ9cthlZ5hWfKtjw=;
        b=weMwafKNIXUWPEU9rYhNi7xBGTdMt+wnV5wBM7RbOuk2pQHXyXrHkgW+sMrbCh8bOS
         4yJalBDtQ8DfdCD9bWzIsQf/V0DvpE++6TcbGKvlffsihKELjK33SNyx7OLEv6e03lkn
         9pn2Jds1VJst4q2xbsfoJ7LQ2JKZA0wmGe33A1IAZyKUNZEQ0g2jJquOPGtNH9trzbq0
         VUc9LAlK6yfDfF+HoKHACS0Lso/rnIDYmZPhLBJCVRg18FHXltvjvODEayY2lLWhOFg3
         uvTQMzjixmzkIPc1Mi+UiHsCwuHE94GUZ4+peBgTTlSAILv9w11X2/Jybz++MLtXnruT
         XLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qxh4WFuO55K1+9jK60gvj/pDkoZwJ9cthlZ5hWfKtjw=;
        b=ba1k7CmujjX87dvmChsqY2vBeR3SBlkFrehEDtGDC92GkkwbS+EvMknX6OhO9mHmqb
         9uZOZiRTsRgiN/hO+/GeLi5zR+PVEDIU0WR7VCyHs5Goh1B+HXr4ErH3oNxr9KZmpyt3
         LWz34nfIneENjrAC15JjYwgtyrvMmBERSX+lQmI7JdxziJCcuUluZkRqFvOZrGjb9Ynp
         erEtaFiOjLXUZdVg8AZZAQIWoVJx43zF3WoW4sesXt3UXMfPPDr7tbZiBu7lzr/Q6zux
         ox8at7GUF5tix5cQ+LBKDythQSDdzUX13F8hp0rPiBztr8dHQLF4sTUTM3cutrE8Lj8D
         2TcQ==
X-Gm-Message-State: AOAM533ToLQWA0l8ZugP1/DyUzhurFaMDQenRMW0aRRgcmZbxJVbPZjf
	ZqAC4mFXs8sJ/BDts4T44eiVsfKTUa2J6UuF9n8=
X-Google-Smtp-Source: 
 ABdhPJz6MvbhxWmqVCyzjO4mPGcgCBUwDUqee42FMlpcCKlAHBXQWEJGqbThuwJUz9aD1al1lTc+Rg==
X-Received: by 2002:a63:740f:0:b0:381:1467:d478 with SMTP id
 p15-20020a63740f000000b003811467d478mr19551664pgc.391.1647901781525;
        Mon, 21 Mar 2022 15:29:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/13] python3: upgrade 3.8.12 -> 3.8.13
Date: Mon, 21 Mar 2022 12:29:07 -1000
Message-Id: 
 <bcad36b6d34b3176dc313ed6af99897cc442bf2b.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163520

From: Tim Orling <ticotimo@gmail.com>

Security and bug fixes (including upgrades for security and bug fixes to
bundled components).

For changes see:
https://docs.python.org/release/3.8.13/whatsnew/changelog.html#python-3-8-13-final

CVE: CVE-2022-26488

License-Update: Add 2022 to copyright years

* Update bpo-36852 patch to apply after change in 3.8.13

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-detection-of-mips-architecture-for-.patch | 42 ++++++++++---------
 .../{python3_3.8.12.bb => python3_3.8.13.bb}  |  6 +--
 2 files changed, 26 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.12.bb => python3_3.8.13.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
index c4fae09a5b..4ac0e140cc 100644
--- a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
@@ -14,17 +14,21 @@ Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
 Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
 
 %% original patch: 0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
+
+Updated to apply after dea270a2a80214de22afadaaca2043d0d782eb7d
+
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 ---
  configure.ac | 175 +++++++--------------------------------------------
  1 file changed, 21 insertions(+), 154 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ede710e..bc81b0b 100644
+index de83332dd3..16b02d0798 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -710,160 +710,27 @@ fi
- MULTIARCH=$($CC --print-multiarch 2>/dev/null)
- AC_SUBST(MULTIARCH)
+@@ -719,160 +719,27 @@ then
+ fi
+ 
  
 -AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
 -cat >> conftest.c <<EOF
@@ -185,25 +189,25 @@ index ede710e..bc81b0b 100644
 +## Need to handle macos, vxworks and hurd special (?) :-/
 +case ${target_os} in
 +     darwin*)
-+     	PLATFORM_TRIPLET=darwin
-+	;;
++       PLATFORM_TRIPLET=darwin
++       ;;
 +     hurd*)
-+     	PLATFORM_TRIPLET=i386-gnu
-+	;;
++       PLATFORM_TRIPLET=i386-gnu
++       ;;
 +     vxworks*)
-+     	PLATFORM_TRIPLET=vxworks
-+	;;
++       PLATFORM_TRIPLET=vxworks
++       ;;
 +     *)
 +        if test "${target_cpu}" != "i686"; then
-+		PLATFORM_TRIPLET=${target_cpu}-${target_os}
-+	else
-+		PLATFORM_TRIPLET=i386-${target_os}
-+	fi
-+	;;
-+esac	
++               PLATFORM_TRIPLET=${target_cpu}-${target_os}
++       else
++               PLATFORM_TRIPLET=i386-${target_os}
++       fi
++       ;;
++esac
  
- if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
-   if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
+ if test x$PLATFORM_TRIPLET != xdarwin; then
+   MULTIARCH=$($CC --print-multiarch 2>/dev/null)
 -- 
-2.24.1
+2.32.0
 
diff --git a/meta/recipes-devtools/python/python3_3.8.12.bb b/meta/recipes-devtools/python/python3_3.8.13.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.8.12.bb
rename to meta/recipes-devtools/python/python3_3.8.13.bb
index cfcc91b396..112ebec4c1 100644
--- a/meta/recipes-devtools/python/python3_3.8.12.bb
+++ b/meta/recipes-devtools/python/python3_3.8.13.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSF-2.0 & BSD-0-Clause"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c22d2438294c784731bf9dd224a467b7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c84eccf626bb6fde43e6ea5e28d8feb5"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -42,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "9dd8f82e586b776383c82e27923f8795"
-SRC_URI[sha256sum] = "b1d3a76420375343b5e8a22fceb1ac65b77193e9ed27146524f0a9db058728ea"
+SRC_URI[md5sum] = "c4b7100dcaace9d33ab1fda9a3a038d6"
+SRC_URI[sha256sum] = "6f309077012040aa39fe8f0c61db8c0fa1c45136763299d375c9e5756f09cf57"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1


