Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EB7C4167B
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:33 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.7368.1651727191068547463
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VIXlvbBx;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id p4so3927515edx.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w2FZbHDKskl6XwiLt91nJq50haLZ0ci1dheJk1ekAHo=;
        b=VIXlvbBxETMOBiPVTH7rr0PfSTvTNQgHgUOl0ewmczV4fvYxaec5cNCda2wO9u8vtk
         i7txJ1XBEsJe50hqKJZRRtm/QGyUcsEn4d+JsRJJa3jAYn4AVqC34DVHGtlX6lfSqNmI
         2LhqGj694kKUgWCgRvViMKTmPz9zKmlqQboBwwHHmkzcjlC/H2d2iWx6XpjlvfgVz+Ji
         5jG+iqtFtVJ3gS98mHYvcob45CCwtG3ISm31XJdrfcyH2Gw/jJewfJHjGvYNfRy1F/lx
         pvDSwod33JqW1pIpvfO+pdXeZzf0r1NDlf4miTo4Ui42P6kFebJXjPng4JKgyYKAgnz4
         jyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w2FZbHDKskl6XwiLt91nJq50haLZ0ci1dheJk1ekAHo=;
        b=izSlrGI9BILkRwKTuYXy87JMHNvHKvhSJraaHn5CtjybdesITFt8PB3JtGm56UUKPP
         D3SJ/wslTVXYOKFV2zBopnor+BGZkDnmjA4hoMRndr2txIR7AlDz+K4n+wj8uD3h1jFT
         krAhfr4ai5BDE8vUnTPkJnD2hA+7eMvJ4TLybpa/DfhxuX3E0YkQlUI4a+wQpMDrmnYV
         bwmTxLzAV9r3HQiGDmDq9rb3Ocq3Hd+Kt/94oc7+Xar1qJJ0m3tGJHNjCnArxFj4b50i
         Y/yGrKOp6C8Xbn7jH+Emd8Zk7VSlUdeo2UGT8eR2I3NDLQgGLSh9JFPzpISpt/n7c8HS
         lmFw==
X-Gm-Message-State: AOAM532jzYhdinHMqVbvI3ZACxawkAsOeE9YSnbbpcAdUpyFXeXyUzp8
	h/t5DfAPLr5ciBaNXQv0pjjaKkJNrGo=
X-Google-Smtp-Source: 
 ABdhPJzLA8SD6IATeLKlXNOF9+WhwljJYn1xLCRxc/hzj+NxODeHMMXwwdxmBeWqdM4RLItbcJy9uA==
X-Received: by 2002:a50:9985:0:b0:425:c2dd:4cf7 with SMTP id
 m5-20020a509985000000b00425c2dd4cf7mr27457652edb.19.1651727189668;
        Wed, 04 May 2022 22:06:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 53/61] libdnf: update 0.66.0 -> 0.67.0
Date: Thu,  5 May 2022 07:05:36 +0200
Message-Id: <20220505050544.651895-53-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165282

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...solv-variables-with-pkg-config-cmake-s-own-mo.patch | 10 ++++------
 .../libdnf/{libdnf_0.66.0.bb => libdnf_0.67.0.bb}      |  2 +-
 2 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.66.0.bb => libdnf_0.67.0.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 9adb345b68..643a5f37b6 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From 18c2c06017784cd641cc8a3deee5fc472008f7f4 Mon Sep 17 00:00:00 2001
+From fbb181d25ad85778add7ed45b6aaf114e02d0f79 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
@@ -7,24 +7,22 @@ Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  CMakeLists.txt | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fd6e3f0..5383744 100644
+index 405dc4e8..53837448 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -52,7 +52,8 @@ endif()
  
  # build dependencies
  find_package(Gpgme REQUIRED)
--find_package(LibSolv 0.6.30 REQUIRED COMPONENTS ext)
+-find_package(LibSolv 0.7.21 REQUIRED COMPONENTS ext)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
  
  
  # build dependencies via pkg-config
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.67.0.bb
index 2558f96851..69255c5a57 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.67.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
            "
 
-SRCREV = "add5d5418b140a86d08667dd2b14793093984875"
+SRCREV = "1742be5225b3a4928707696db8c69391def55f5a"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


