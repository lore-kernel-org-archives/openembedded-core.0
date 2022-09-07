Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193A5C6FA89
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:05 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.8213.1662560458100920405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7rQ7qN32;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id q3so14698746pjg.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Fz1Ct8N5aGEd2zhRwUzxFEUsw+YhF4GXf44X38z8xOQ=;
        b=7rQ7qN32LTHBD41/NoKL/vSMSxtsMDtiy30ZL1WXs2LYJNXoKodxUKirOBWjf4cPjw
         BI3AVQduDGGCLrSXuYxH5RAMk0MNj3rO1DU0ykVgL/XqQTRGJL/Hd0N9y/cvqr5AROqd
         pYgA+tSOEYCH7rPVftHgWIG431ud7nifHJ7GGb5kS2e9zdZ3q0LE3CK4SMlT3/PRL6Xa
         yvrmbnZqV0KTT8gTGBPhp0gT67LcyPaHLUsE9W1ROUAWQqsQmsorViNTEGspTi9cl2h/
         XWmDobZjuYV2B/N9uNSztg3V4cwRU4HDUyHS3JeCuedHOIPnVJqBaRkHFOijSWn6HNaR
         w38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Fz1Ct8N5aGEd2zhRwUzxFEUsw+YhF4GXf44X38z8xOQ=;
        b=n9VpXdkAKfP/DdJpGCCMpkVk1jbP/mN6pBawhARuKaZuMgsw8atsrX81yN+4t0Chf6
         TeurIpaKVBi6tDlFfwAjgZgbnfz/Z2l8FfY+szSfX5JemlUEzgCsl0jGgHBAkNHXMIcJ
         +pX0X3FQwAhHgQ6+MINVP/M7NR+oL2JyqaJE1qKF59gZ9XvXl2THZBatwj0K2ZviEvb2
         CBzfu3Cv6SKeMZYcNXmwQzdYkheVnnU8ciSkk+nlPFz1rxfNSPuAwtkxnF0W3otD6q9L
         97HTWvfLYyiYE6pLODGI1gAjG+SDuc17Y+unicSzhf1/6k0jiXQUvPHAocHNaWWUNg8Q
         Qrdg==
X-Gm-Message-State: ACgBeo2zofdNR1dkBtEkYH7MfYFCmIFNvIZj2/72mCUfGGMmCjitysMe
	XMsWiB884lF9F+4Ndr020/EqpYAMCKYjBHWA
X-Google-Smtp-Source: 
 AA6agR5067hiDWphgV8EzmURNRUJnajIAY0s7pQhFZHePnWHLA0G/1jOi2nN1IOaSJZ3SepmczJUZQ==
X-Received: by 2002:a17:903:2c7:b0:16c:ebf6:db22 with SMTP id
 s7-20020a17090302c700b0016cebf6db22mr3858568plk.16.1662560457124;
        Wed, 07 Sep 2022 07:20:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/24] libwpe: upgrade 1.12.2 -> 1.12.3
Date: Wed,  7 Sep 2022 04:20:10 -1000
Message-Id: 
 <f10345e445dd2b7bee1cc3dda6a80e8ab1a5e5f9.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170404

From: wangmy <wangmy@fujitsu.com>

Changelog:
  Fix the build when using Clang's libc++ or the Musl libc.

0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
removed since it's included in 1.12.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f8d8cc58c9b9c221158414be186bc12aa5d80e91)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ure-due-to-libc-using-libc-functions.patch | 42 -------------------
 .../{libwpe_1.12.2.bb => libwpe_1.12.3.bb}    |  6 +--
 2 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
 rename meta/recipes-sato/webkit/{libwpe_1.12.2.bb => libwpe_1.12.3.bb} (72%)

diff --git a/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch b/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
deleted file mode 100644
index 6d27b4835d..0000000000
--- a/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From ccf8a58c3536ca0e62748e0ea477514e14d821bc Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Thu, 4 Aug 2022 12:19:05 +0300
-Subject: [PATCH] Fix build failure due to libc++ using libc functions
-
-Include the "alloc-private.h" header after the C++ standard library
-headers. This sidesteps build failures caused by implementations of
-std::map and std::string which use libc memory allocation functions
-in expanded templates after they have been marked with the "poison"
-pragma.
-
-Fixes #115
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/pasteboard-generic.cpp | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/src/pasteboard-generic.cpp b/src/pasteboard-generic.cpp
-index 86fe4ee..a357027 100644
---- a/src/pasteboard-generic.cpp
-+++ b/src/pasteboard-generic.cpp
-@@ -26,12 +26,15 @@
- 
- #include "pasteboard-private.h"
- 
--#include "alloc-private.h"
--#include <cstdlib>
--#include <cstring>
- #include <map>
- #include <string>
- 
-+// We need to include this header last, in order to avoid template expansions
-+// from the C++ standard library happening after it forbids usage of the libc
-+// memory functions.
-+#include "alloc-private.h"
-+#include <cstring>
-+
- namespace Generic {
- using Pasteboard = std::map<std::string, std::string>;
- }
diff --git a/meta/recipes-sato/webkit/libwpe_1.12.2.bb b/meta/recipes-sato/webkit/libwpe_1.12.3.bb
similarity index 72%
rename from meta/recipes-sato/webkit/libwpe_1.12.2.bb
rename to meta/recipes-sato/webkit/libwpe_1.12.3.bb
index e23a9ac32d..77ca517ef7 100644
--- a/meta/recipes-sato/webkit/libwpe_1.12.2.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.12.3.bb
@@ -10,10 +10,8 @@ inherit cmake features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz \
-           file://0001-Fix-build-failure-due-to-libc-using-libc-functions.patch \
-           "
-SRC_URI[sha256sum] = "4ac4fd0a8b562b721bffd0f46ae9f06c2b5a3114407581978be875a9d651642a"
+SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "b84fdbfbc849ce4fdf084bb28b58e5463b1b4b6cc8f200dc77b41f8545d5329d"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.25.1


