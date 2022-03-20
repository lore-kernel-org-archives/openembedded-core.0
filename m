Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE76C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 20:36:45 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.22399.1647808604520786166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 13:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SfnQKUzT;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so12773699pjp.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 13:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBogaUjlMCx0nz8YqduaalMpKcMTJr+4LvI3EzBlGwc=;
        b=SfnQKUzTpiSeTIWSneBVoCxeujFutT+yo5Zqz5y/JZAwGPGHgQMG+6cal/z/X0foTv
         Tzua9n1fsRimKtV2lz4UQPIzd2rflMrr7cuwHjNSp78OE6cT4ZcSpsBbHLW7D1Wm149H
         fQ/tzLWHPQYUGQOdavsO2lcHKp5siR/s8tGyJfCxuV7SZOo2iLWYYdOvR2fOgstz/lkq
         2g3CooUdMdGy4gYUtuArSaSnXM5RLvnY+gsFrDLiOKta6ahRJTYgCDffi1ZCLlX8HvcP
         sJ9wrf8WPuwX0DLtSJZZ2z5KHjyd1j8ARDNKgPGtU9AwyY98SrFT9xO9XSwL4M8bLzJt
         5a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBogaUjlMCx0nz8YqduaalMpKcMTJr+4LvI3EzBlGwc=;
        b=G/hP/voO8GU3fYE9kJHJCRN4NgC5VnumI02mNFmBt8G4zo5KMlyGo+IxodajSZXxPM
         ip9WoOX3uUKcDM46dqtBX6DB4ve0Y9jGcCHDaaCr6VpxBHgZq39ngbTz+3ccGScWhY99
         alTpluz7O20umfTKVC8L4omzNX/fYVQp/zu8sii1EZUVkD2Ya7TtVhFpyZM1DkQE6gyi
         FZUjrUIw85WbcSdgKwA85NHBdNuklghsnb1VrR9auLMpNKsTQ13y8lj7psnhWU6zvapT
         7yvx6cngvO1ljq2a3Vq0JxuWGkkgvW8sf0gueLU8jdbxdXXcFHrNNKEfhFWLn1aO/VsL
         wTZQ==
X-Gm-Message-State: AOAM531PD0rbSQJOlB/6aPudu56Xshkbc/DTLerH3Gi00y0dX8YndW2Z
	vXr8VLXQIgpaTaQS/BwdmJV//wkVk0k=
X-Google-Smtp-Source: 
 ABdhPJyEJbQdPG+K3ymouD5CR99PzjWs0MJ7GuzLk7TcJGUd1xMdTGrmRixUIjuF+4FGjQozxat1+Q==
X-Received: by 2002:a17:90a:3842:b0:1c6:d666:b01 with SMTP id
 l2-20020a17090a384200b001c6d6660b01mr9204661pjf.161.1647808603199;
        Sun, 20 Mar 2022 13:36:43 -0700 (PDT)
Received: from chiron.. ([2601:1c0:6000:1b20:d679:197e:d2fd:20c])
        by smtp.gmail.com with ESMTPSA id
 f4-20020aa782c4000000b004f6f0334a51sm15538816pfn.126.2022.03.20.13.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 13:36:42 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [dunfell][PATCH] python3: upgrade 3.8.12 -> 3.8.13
Date: Sun, 20 Mar 2022 13:36:28 -0700
Message-Id: <20220320203628.740939-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Mar 2022 20:36:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163493

Security and bug fixes (including upgrades for security and bug fixes to
bundled components).

For changes see:
https://docs.python.org/release/3.8.13/whatsnew/changelog.html#python-3-8-13-final

CVE: CVE-2022-26488

License-Update: Add 2022 to copyright years

* Update bpo-36852 patch to apply after change in 3.8.13

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
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
2.32.0


