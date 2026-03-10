Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEE0FD4F23
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:41:24 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2667.1773168074369094408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nPwgR/AF;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46726528f1cso520314b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168073; x=1773772873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIWNp+jA9fLjpsXG4iRqhfv6oO7L/BK8ilevIn/RjTk=;
        b=nPwgR/AFwvAVCf5JpTuYRGo10FmOC4y49EeNGSKouduTNWuLKyndH4PmtGXomEK5yF
         urqyTcsnffXNk6xzbsYgE80/MGBAqebL/V2vnU7rYJUZIIc4oggFNkVcuaB6fFWhJmi2
         i3HG7ZHwABZHhZLrHiZApkIspY/O/aBQEq568VxL0M8geMXkZkuF40HawXojNCJ194gs
         FZbxcS0I8pdggd51Flp+vRdD1cPKw+pAviHgjo48lwXF4nPwPD8GVcjgH+oVOXANcnbn
         r9bL+65AchZntCoPeCRS39kr3c7FmnvrugQLvSo9sGVxDdd+jLMBcdNnLr9c7ib5gB2g
         k51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168073; x=1773772873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XIWNp+jA9fLjpsXG4iRqhfv6oO7L/BK8ilevIn/RjTk=;
        b=ltbt9J1/4sG70zv+fWFM/1RRoykTYN6Eb+tNjfZQw6OMlgklxNMr8XbhIfs61OFq+C
         p9mHDmulUxAvADahJQRBtL+ZVacv6WwJJyQttuI64sWAj36yWl50x9XOcuRHb64XmKEq
         2Jm2Gg+OswZxDRky9D3NeoUj7W9kPY6oQ589Y+4WPsFVdxmqMIgzX4thDlqLHSRtKnZg
         VV7js6aFpzsdnBcd9boEAdfSM0MMgUBl6oLBppAF78XEWMRnYTF8QrNu0N/9Tj+yuJ8T
         F1nQf2ungH6tuATpkkxJNqRFvZXXR+JTtlNeS8X+59GtrwFqnTNgI3WuVdMlZ4o42jd7
         JIJA==
X-Gm-Message-State: AOJu0Yzi/8zWBeHznp2TnRJbVcBt1kT7xHCckQOFw3gCPVetm9UUoZxC
	XKoOtAug+emJDWRTFwxtRBXWBF6xMTCgAhC2HlUnp+WKPIKCxS/v+aHhUzAwRQ==
X-Gm-Gg: ATEYQzypVrJDD6sccSXJolLNgRRwwaQ0M1LJejt5mFE8TvRK111jWW3/eoScmA80VWD
	wR0hhzP8hzbflJsT2xZwQ0nXnjL4gqLcee4JAnH0/CWJRjygqEMc5eWe/nN7cQ4do8GKZCZ3TUK
	qvtWeRwalm5YUN5G/GqyOfT0WA61Jux+TJiX/4HdrsuvpUHYUUMzFLZ1zYV5gohK70RPTC9+2Hn
	G445G1R0q25cvBd5NimkeUNIshUEzkudlxiI10OwJDTb13XLI60DGXhnpKW3WaWYv+Tt6OYKQ/l
	I0X7mZ5P6QjYtedI0IpcLAlJbDLCTdXwWINnGu9BlFXmUAX1Dn26NTez4ZRcADfxpNRASSXJcXz
	otZnYTZKEhwODJTvCOGaw2iQ7d1oRWTE02fkl/sEtLYkg8XCFON4zbqU1URKXCTOfVXmMEYgO5o
	+iuKcW4Lsm/OmkKyurNOor
X-Received: by 2002:a05:6808:2226:b0:467:254:b90 with SMTP id 5614622812f47-46702542b39mr5180119b6e.10.1773168073335;
        Tue, 10 Mar 2026 11:41:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::9891])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4671d2a7ebfsm2444524b6e.20.2026.03.10.11.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 11:41:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 12/15] spdx3: Use common variable for vardeps
Date: Tue, 10 Mar 2026 12:38:32 -0600
Message-ID: <20260310184058.533343-13-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184058.533343-1-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232823

Instead of repeating the vardeps for each SPDX task with the necessary
variables, use a common variable to make it easier to manage

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 33 ++++++++++------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 88b7ef9f42..6df66c193b 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -174,6 +174,14 @@ SPDX3_DEP_FILES = "\
     ${SPDX_LICENSES}:True \
     "
 
+SPDX3_VAR_DEPS = "\
+    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
+    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
+    SPDX_PROFILES \
+    SPDX_NAMESPACE_PREFIX \
+    SPDX_UUID_NAMESPACE \
+    "
+
 python do_create_recipe_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_recipe_spdx(d)
@@ -185,13 +193,7 @@ do_create_recipe_spdx[sstate-inputdirs] = "${SPDXRECIPEDEPLOY}"
 do_create_recipe_spdx[sstate-outputdirs] = "${DEPLOY_DIR_SPDX}"
 do_create_recipe_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_recipe_spdx[cleandirs] = "${SPDXRECIPEDEPLOY}"
-do_create_recipe_spdx[vardeps] += "\
-    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
-    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
-    SPDX_PROFILES \
-    SPDX_NAMESPACE_PREFIX \
-    SPDX_UUID_NAMESPACE \
-    "
+do_create_recipe_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_recipe_spdx_setscene () {
     sstate_setscene(d)
@@ -222,13 +224,7 @@ do_create_spdx[depends] += " \
     ${PATCHDEPENDENCY} \
     ${@create_spdx_source_deps(d)} \
 "
-do_create_spdx[vardeps] += "\
-    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
-    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
-    SPDX_PROFILES \
-    SPDX_NAMESPACE_PREFIX \
-    SPDX_UUID_NAMESPACE \
-    "
+do_create_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_spdx_setscene () {
     sstate_setscene(d)
@@ -249,6 +245,7 @@ do_create_package_spdx[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_package_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[rdeptask] = "do_create_spdx"
+do_create_package_spdx[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_package_spdx_setscene () {
     sstate_setscene(d)
@@ -270,13 +267,7 @@ do_create_recipe_sbom[sstate-inputdirs] = "${SPDXRECIPESBOMDEPLOY}"
 do_create_recipe_sbom[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_recipe_sbom[file-checksums] += "${SPDX3_DEP_FILES}"
 do_create_recipe_sbom[cleandirs] = "${SPDXRECIPESBOMDEPLOY}"
-do_create_recipe_sbom[vardeps] += "\
-    SPDX_INCLUDE_BITBAKE_PARENT_BUILD \
-    SPDX_PACKAGE_ADDITIONAL_PURPOSE \
-    SPDX_PROFILES \
-    SPDX_NAMESPACE_PREFIX \
-    SPDX_UUID_NAMESPACE \
-    "
+do_create_recipe_sbom[vardeps] += "${SPDX3_VAR_DEPS}"
 
 python do_create_recipe_sbom_setscene () {
     sstate_setscene(d)
-- 
2.53.0


