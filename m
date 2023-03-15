Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEBEC61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 22:18:07 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.7217.1678918686342572741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 15:18:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RaML0h0Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id q16so18647996wrw.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678918684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vloVP43KqdnNyll3+Igbb/XTNOdgjGhyIq1JCwkvC4U=;
        b=RaML0h0ZHoD5IEwAwjdGqqXxMOW5goVDpVbiGC6BXPTM8x7nc+K+96jM4jf42mj/5I
         f+wQKdGZPnKBTvzvKvv+MWxuhX/mRIdBOC+X0fE34qQC1ny4Q9o8JcLxcWHIaGOqw6iE
         OoBLFqH2HpXlsZCY8yut4qlR3U5lfDTUrcK0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678918684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vloVP43KqdnNyll3+Igbb/XTNOdgjGhyIq1JCwkvC4U=;
        b=Rt9f9Z9LnnMnpZcMDtYFjI5dvJVaS9Srh9Y2c+HCTXHTKLjacYujugFCAQUHuHvmw4
         oVBSPe0nyi2VPgD7bcmZHPqI58QcsFqaHlTEM4pewFSsSP0UwfUTTDeBaXFrYPnKJdL7
         QMkqJMio+xgwDz1X8S4Ea1RHHWz+pbCdQzJbJ/WMCRQjq8skOpEzFXWpuThFn2IdNtln
         OpG35qlep7k6M06cAEw/1WrkT7T2uNx5ssXU4A4hTUjzrLK2QwbXzPwJCVGMZviCFHyX
         3HkIsgQDPlTSZaWaQ88BW2xxOs2TiI+/sYl6cMBvuNOunm+rlezI/uOFPOmAa+llVBe2
         n1pg==
X-Gm-Message-State: AO0yUKUHfCRLEVkmqrejrchrzXw7teGjmUHeTUczF/Sv+ZhpUIuCj7QW
	1WQGhmSHeZIDRzjz9rOf13ABLV71JtM9kTZ3/x8=
X-Google-Smtp-Source: AK7set8auQYvvwRDMARTY5KE/b8mq0hIsjxNgjXn9GYnAgK6TBeb5bAojOWR2v3YHoAuJLT3T/ELMg==
X-Received: by 2002:a5d:595d:0:b0:2ce:9fd8:8e6d with SMTP id e29-20020a5d595d000000b002ce9fd88e6dmr3081467wri.8.1678918684311;
        Wed, 15 Mar 2023 15:18:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d4604000000b002cfefad9c1dsm4258160wrq.66.2023.03.15.15.18.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 15:18:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] matchbox-wm: Update 1.2.2 -> 1.2.3
Date: Wed, 15 Mar 2023 22:17:59 +0000
Message-Id: <20230315221803.4189345-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 22:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178657

Drop a patch merged in the upstream repo.
License changes are due to the addition of SPDX license headers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Fix-build-with-gcc-10.patch          | 41 -------------------
 ...chbox-wm_1.2.2.bb => matchbox-wm_1.2.3.bb} | 10 ++---
 2 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
 rename meta/recipes-graphics/matchbox-wm/{matchbox-wm_1.2.2.bb => matchbox-wm_1.2.3.bb} (74%)

diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch b/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
deleted file mode 100644
index 541b5c9c841..00000000000
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm/0001-Fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8a8f8446e803cad04d7bbceaab78ee45d9778c3c Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@stusta.de>
-Date: Tue, 12 May 2020 09:44:05 +0300
-Subject: Fix build with gcc 10
-
-Upstream-Status: Pending
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- src/mbtheme.h | 2 +-
- src/structs.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/mbtheme.h b/src/mbtheme.h
-index aa9a7c5..ad03bde 100644
---- a/src/mbtheme.h
-+++ b/src/mbtheme.h
-@@ -46,7 +46,7 @@ typedef struct _mb_theme_param
- 
- } MBThemeParam;
- 
--enum {
-+typedef enum {
-   LAYER_GRADIENT_HORIZ = 1,
-   LAYER_GRADIENT_VERT,
-   LAYER_LABEL,
-diff --git a/src/structs.h b/src/structs.h
-index 24985e7..8f53e72 100644
---- a/src/structs.h
-+++ b/src/structs.h
-@@ -148,7 +148,7 @@
- 
- /* Atoms, if you change these check ewmh_init() first */
- 
--enum {
-+typedef enum {
-   WM_STATE = 0,
-   WM_CHANGE_STATE,
-   WM_PROTOCOLS,
--- 
-2.17.1
-
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
similarity index 74%
rename from meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
rename to meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
index 81704beac46..8e9de0914e8 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.2.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
@@ -3,17 +3,15 @@ HOMEPAGE = "http://matchbox-project.org"
 BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=a7e844465edbcf79c282369f93caa835 \
-                    file://src/main.c;endline=21;md5=3e5d9f832b527b0d72dbe8e3c4c60b95 \
-                    file://src/wm.c;endline=21;md5=8dc9d24477d87ef5dfbc2e4927146aab"
+LIC_FILES_CHKSUM = "file://src/wm.h;endline=21;md5=ce20617ac10f26045cc57b8d977ab552 \
+                    file://src/main.c;endline=21;md5=508f280276140250ce483e0a44f7a9ec \
+                    file://src/wm.c;endline=21;md5=f54584fb0d48cfc2e6876e0f0e272e6c"
 
 SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
 
-# SRCREV tagged 1.2.2
-SRCREV = "27da947e7fbdf9659f7e5bd1e92af92af6c03970"
+SRCREV = "ce8c1053270d960a7235ab5c3435f707541810a4"
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master \
-           file://0001-Fix-build-with-gcc-10.patch \
            file://kbdconfig"
 
 S = "${WORKDIR}/git"
-- 
2.38.1


