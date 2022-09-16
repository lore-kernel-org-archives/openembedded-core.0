Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113E1C6FA93
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.877.1663362517387790911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GpMuQyXW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 r133-20020a1c448b000000b003b494ffc00bso54248wma.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=U3YxdzyOjGtcuZJP6A/u3xvQIPTz8BOnm7hnXCEYgWI=;
        b=GpMuQyXWUOZfa5M00dcm/g9SQfCAO4ZpriO/iypAov/DFPlVX80C66IN9Ls1WITFyq
         XJiu7XjY7gIAidledwysoFNKpRvJyVswh+vggmmMs7TACCCYPsiWgQaHYhAGRXOFj3/+
         9XJXuz0XFjWyj5i4pi9n2b0CAAN6ukqCRMuf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=U3YxdzyOjGtcuZJP6A/u3xvQIPTz8BOnm7hnXCEYgWI=;
        b=x8t6uXLYXlgRa0YS4f1DFlVY0xDAFD2OPgp46bihC2tkPxL92VnfcDvo/DX/p5wDKR
         goJc3DE+3kKF3kKwW1sUqdzfuPbBj38LWxkI7R+cPksburIG9Ab5oTmS70EPhrhauDo7
         5cqZQ8geeJ3xhHfMWGHIAqoeTga2twGV+oUozjJyy11X9L/fA8EnA2UgH5+dHMb5tRvy
         9vjEOzYXO2wExASjSPehf+nUCWlQ/g1B6pXGT8tsiJEmnis/E66V1nYOAdW3wD2YGFm9
         a3AgT356fRiyT0h8/AIC1s7Era0A79G92xteIwHPOA3JlAmtBgKeAdrvmXBl8aPVQqAu
         XaNg==
X-Gm-Message-State: ACgBeo3Xkcxr4SwKXtMNlM3Ygy4KFKO89C5b1bFl1W8N3dwes8FO6k9B
	o/Iv0FJMZkRKd62GeMJjkKEZIqWZdFvM7g==
X-Google-Smtp-Source: 
 AA6agR7+GKS9czPYutFDAb/k1sx59puVlb/QDcum/hJjjzGh1OCoidG7mZT6mffESXjyfqiG3M5QOw==
X-Received: by 2002:a05:600c:2747:b0:3b4:708a:f66a with SMTP id
 7-20020a05600c274700b003b4708af66amr11041394wmw.146.1663362515587;
        Fri, 16 Sep 2022 14:08:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/24] librepo: upgrade 1.14.4 -> 1.14.5
Date: Fri, 16 Sep 2022 22:08:08 +0100
Message-Id: <20220916210818.1228761-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170812

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ownloader-Include-unistd.h-for-lseek.patch | 34 -------------------
 .../{librepo_1.14.4.bb => librepo_1.14.5.bb}  |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0001-metadata_downloader-Include-unistd.h-for-lseek.patch
 rename meta/recipes-devtools/librepo/{librepo_1.14.4.bb => librepo_1.14.5.bb} (87%)

diff --git a/meta/recipes-devtools/librepo/librepo/0001-metadata_downloader-Include-unistd.h-for-lseek.patch b/meta/recipes-devtools/librepo/librepo/0001-metadata_downloader-Include-unistd.h-for-lseek.patch
deleted file mode 100644
index 22b3110a617..00000000000
--- a/meta/recipes-devtools/librepo/librepo/0001-metadata_downloader-Include-unistd.h-for-lseek.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5c63ec2e2d4726268ace85e5c61727cbd811d982 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Aug 2022 09:00:24 -0700
-Subject: [PATCH] metadata_downloader: Include unistd.h for lseek()
-
-This is found when compiling on musl systems
-
-Fixes
-
-metadata_downloader.c:331:9: error: call to undeclared function 'lseek'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-        lseek(fd_value, SEEK_SET, 0);
-        ^
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/librepo/pull/263]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- librepo/metadata_downloader.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/librepo/metadata_downloader.c b/librepo/metadata_downloader.c
-index 123c77b..6604255 100644
---- a/librepo/metadata_downloader.c
-+++ b/librepo/metadata_downloader.c
-@@ -24,6 +24,7 @@
- #include <assert.h>
- #include <string.h>
- #include <errno.h>
-+#include <unistd.h>
- #include <sys/stat.h>
- 
- #include "librepo/librepo.h"
--- 
-2.37.2
-
diff --git a/meta/recipes-devtools/librepo/librepo_1.14.4.bb b/meta/recipes-devtools/librepo/librepo_1.14.5.bb
similarity index 87%
rename from meta/recipes-devtools/librepo/librepo_1.14.4.bb
rename to meta/recipes-devtools/librepo/librepo_1.14.5.bb
index 2b8bd132f35..46cfce53ff6 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.4.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.5.bb
@@ -8,10 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
-           file://0001-metadata_downloader-Include-unistd.h-for-lseek.patch \
            "
 
-SRCREV = "2bd1041c741c85bc196ca01dcca1eae6099eb742"
+SRCREV = "f4b915be5e04e88263097f65addfcac5919fef41"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


