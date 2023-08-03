Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D63C0015E
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 06:27:36 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.8551.1691044052278461857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 23:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=b2fZ7X1y;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-55b8f1c930eso378977eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 23:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691044051; x=1691648851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9I0hsw4JIAaYkZ3DHfV2wHc40wiAUGIlblyTSk+kSHc=;
        b=b2fZ7X1y3PFk+LRH+yn+30R3DdTdZD7liNIUsXvERjKURr+Mwvnq+ZAcupMHUNTTZ7
         qGDw8qq4Z1vXuqAK0+DyC4zj3gGH51fThlqSwin1b8xcZA0ihLDhPgdVbLMSnKO+vwzT
         zkuBMZ6IexY9nMQyxEjnmHcJJrvnkyzCeYrd37iDyhMs116MKSXHcl2OF7CpQ2shIzqQ
         rkTtfYCU7DB7HrgGHAiCotzT3HIS2nQYrauNqzfpxBHkwxgsfj3QB3O7HGi+OsXrwuw1
         PREMiRqkNrITkqgcEx+pP7BpppynyTQ5BplzQbsslI/xnEMf/O8L1vjO2XXWk8muwakI
         azpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691044051; x=1691648851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9I0hsw4JIAaYkZ3DHfV2wHc40wiAUGIlblyTSk+kSHc=;
        b=ce3oeZ2WVTew5gYnwT7ZErq7GMuhBp69yCd8Xv5Bxe1oyQgeJO/bF1ggz0ztmH/76M
         AarxKMhisuGyXdmtfKAv0PPuwpRw4rzb8kG3gYGrg3OpBk7IWVzd0sEMam1qc98pign1
         IwbTCIcABvjPkksIXAGxPzpYStqsp0+Z35nwdJyKts79Mk9W4HEu+Uf1SIlyow9SxChf
         7wMGkIceNP2IOr8Svv5HNpKO3Na7gg8QU43BKlkdmmbuPFI2sw8qwwcaIF9pnvr3yMUG
         kamDzd+VYac0J+5kMv5Hem6fdb3Krg+6uLsz64uy6M305m9GWTxcxAjKFJ/wzpmjWCpA
         drxg==
X-Gm-Message-State: ABy/qLahJDFBP5a4c+Fmg9pPO2NaHh1Fn9PQ1HjBeVlnOKEIpFws8dOv
	8nXrNp3d+EfoYNVbbCJkFRzd5uoE/IRI8Q==
X-Google-Smtp-Source: APBJJlE00qT3bzPqvdJTaTadLkEBIqX1GtkgMvZCnH0lBMCLV/2Ceido1IGgmbGgYnoLy9p+0Dpseg==
X-Received: by 2002:a05:6358:94a0:b0:137:8c47:ba55 with SMTP id i32-20020a05635894a000b001378c47ba55mr9192776rwb.1.1691044051127;
        Wed, 02 Aug 2023 23:27:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:8005:8fc9:b43a:ffa3:6ed8:9b69])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm12564266pgc.4.2023.08.02.23.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 23:27:30 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] libgit2: upgrade to v1.7.0
Date: Thu,  3 Aug 2023 07:27:21 +0100
Message-Id: <20230803062721.12740-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185457

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../libgit2/{libgit2_1.6.4.bb => libgit2_1.7.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.6.4.bb => libgit2_1.7.0.bb} (89%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.6.4.bb b/meta/recipes-support/libgit2/libgit2_1.7.0.bb
similarity index 89%
rename from meta/recipes-support/libgit2/libgit2_1.6.4.bb
rename to meta/recipes-support/libgit2/libgit2_1.7.0.bb
index ffe00d8653..15a91cfb27 100644
--- a/meta/recipes-support/libgit2/libgit2_1.6.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.7.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5bdf47bbc9a39dc6ce076d59e322dc17"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.6;protocol=https"
-SRCREV = "e6325351ceee58cf56f58bdce61b38907805544f"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.7;protocol=https"
+SRCREV = "3e2baa6d0bfb42f9016e24cba1733a6ae26a8ae6"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


