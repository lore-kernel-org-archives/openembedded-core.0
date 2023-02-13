Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F535C64EC7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 21:04:30 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.27349.1676322263122108375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 13:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B8fqBNRG;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id h4so7051881pll.9
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 13:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BKhEFHBkKeeeFc6UEJmztmEcKAnL7PxUMHTRlQAEzU=;
        b=B8fqBNRGpyPLA3NGSiMT4zobs69bErpKsJz3PT3qmct59zPsfkqmpPAs7rDTBvsoiO
         bajCYu9h86lc9v12pvT14tvqUdYeflOIE/3ALYiz/u16/Q9NGP6EQpsJtynPuS/BVmhz
         Td2N6hxkBMMI4thn64tZkQCIE6ZDKZmH/J9/lTTsUBemswXpm0hppjxnesZvyw5Wk3Ly
         BVrGHk4dZrkkaxFHeBhbSqeh/fQzaeqO14wfdGsqjbCTQKvIYG84A6CAgJXVoT+5iO3i
         6hTLCEzIF2l/sBFQpsZ8kvUP4PTBvQOQqvmefl/9DpcVVXzqBcE1bZXVm1Kr+XCnkNXm
         mxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BKhEFHBkKeeeFc6UEJmztmEcKAnL7PxUMHTRlQAEzU=;
        b=RYAktBDFV5Zs8IuZATklDKn314pZjAiA/ZCuZ7YMqQ59H0vZC5lEZ9xydygn0vQluD
         GhqqBdHK4eCZBDqTnxsF3dM1aSpf8UgeF+Igj+ZaaMoxPR3cxvbej3F7G7QfRTToLFJA
         sRAg8nm88l+5NgNs2DNhcb7FBncmmCTeBsumP8qX6QQgUFpR1r1/o4mqFRNGTDd1RQVB
         dQLdfGSa06I7h0B39mDITnv8bewqlaSE/ESoFHI7Qz6bUYAOlYwJ7LwK23sMy3vkjcqa
         7/kaH6LsDdnZ8Sk+/xoWB7BYX1wTwlDRoSKUz2j+haiftRZy/n1BN6SXuKkDcBhjsCgW
         f/pg==
X-Gm-Message-State: AO0yUKUYn/lT/U89mz1/B2cPH2GiwIG5m/9g11qYcezhdmPDnKBl8Vy0
	TFigA+HC//MbsxOmlmNlcuFYVgroKFk=
X-Google-Smtp-Source: AK7set+3yiHGKisp0E/uSZUAStWQtYDHY9onhTGOp156cwMQY+TEug2/xeS3ftHgjwrWETUmwqRVxw==
X-Received: by 2002:a17:90b:194b:b0:234:152:a659 with SMTP id nk11-20020a17090b194b00b002340152a659mr3477948pjb.11.1676322261856;
        Mon, 13 Feb 2023 13:04:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::789d])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090a4bc100b002311dbb2bc5sm6896493pjl.45.2023.02.13.13.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 13:04:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] unfs3: Add missing header files
Date: Mon, 13 Feb 2023 13:04:17 -0800
Message-Id: <20230213210419.1152513-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 21:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177111

These enable builds with additional warnings as errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../unfs3/0001-fix-building-on-macOS.patch    | 27 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-fix-building-on-macOS.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-fix-building-on-macOS.patch b/meta/recipes-devtools/unfs3/unfs3/0001-fix-building-on-macOS.patch
new file mode 100644
index 0000000000..f18ffd3711
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/0001-fix-building-on-macOS.patch
@@ -0,0 +1,27 @@
+From 989b87ae46b3183a742031373fbb3e912ab9b666 Mon Sep 17 00:00:00 2001
+From: Andrey Filipenkov <decapitator@ukr.net>
+Date: Wed, 2 Nov 2022 13:38:40 +0300
+Subject: [PATCH] fix building on macOS
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/unfs3/unfs3/commit/989b87ae46b3183a742031373fbb3e912ab9b666]
+---
+ attr.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/attr.c b/attr.c
+index 6253e84..0ce9375 100644
+--- a/attr.c
++++ b/attr.c
+@@ -18,6 +18,8 @@
+ #include <utime.h>
+ #include <errno.h>
+ #include <dirent.h>
++#include <stdlib.h>
++#include <string.h>
+ 
+ #include "backend.h"
+ #include "nfs.h"
+-- 
+2.39.1
+
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index be3870b8a4..9913a503e8 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://0001-daemon.c-Fix-race-window-for-writing-of-the-pid-file.patch \
            file://0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.patch \
            file://0001-locate.c-Include-attr.h.patch \
+           file://0001-fix-building-on-macOS.patch \
            "
 SRCREV = "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
-- 
2.39.1


