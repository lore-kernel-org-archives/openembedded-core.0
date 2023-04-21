Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A13C77B76
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 03:41:39 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.4041.1682048497387456985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 20:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sHZG9zOP;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-63b7588005fso1631872b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 20:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682048497; x=1684640497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glppKLQ8Iu+NJBcOQlMFx/s1yTOv6NThP7tk9wrN4pY=;
        b=sHZG9zOPJn+EoB6QbFX+Wbtyh1kUhavO0U8EDymWFrZWQBTnRm7Dex/3UJfZMMXWtd
         qqcCWi2p7z1coaCSjVdADurK4w8GwQ+glHAEt75GIjlaK3Beo+st50/9Yv3DpgYIc4gZ
         lZPfjSiukig5+ywNHKYvpa7XT+XfrTRPcO3iM2TtbNTjGyeRMPEJ0DaMYBIg7+YzRmlR
         plthv+7AfMFDaz9pYrgUyo/wZMsCuCdPvwEXs33Y19sH25VIKc3vHQt/sjmN/FdPwrPb
         yb0ujKCxDGOnHjaMLb1pXZmCn4AnnZ9kEG3zE3EMKcVim2tTaMSL/Q0bVqIT8UjxaGU6
         hgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682048497; x=1684640497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glppKLQ8Iu+NJBcOQlMFx/s1yTOv6NThP7tk9wrN4pY=;
        b=DvnseSidWHm3nVJntlMRmIY4fgWZnHKm9eZZX+5Eo9mOl1RuubrnL84czB3ckcCS5J
         kwynMeX7/nh+kSnD1ubB7Wwb8+3xsqDKuo3O0aSoZhKlJXMpTmU4c6dPwLzbkkMfVBO9
         PlX9C7WR0QPq3P4nJdY9en0sEDUU04ac0MYxL1xmBTpUk8jFQiABFbKQ+Ew8GgZoModp
         7EIAwduHBb2Kc9vDsO5VKZNn9oRPUo5/GiW9f/z+RylUv3Lu9ofA82kB0Hqaj/E7wo0K
         lOopNN3S83+oyZpvLUrdHBkLQlqoDcsf+9OkZ7emG4WJALRWfcXVnlFZ+pUFqCc+SySe
         RqEw==
X-Gm-Message-State: AAQBX9eVJhHS3dJR815ValapLTSOPKFsFpg0Bq8S/PDK771Yup6Akec+
	z2AWIN6wyjnLuuEXBdVbuXooewBwOaDpPQ==
X-Google-Smtp-Source: AKy350aKhKGaih9nyra/DcKM9/ve0Ki55d0vBai9lJlSh4yqQS777E32hP3qXrEnIT2tSn6eSmsh1A==
X-Received: by 2002:a05:6a00:843:b0:63d:6744:8caf with SMTP id q3-20020a056a00084300b0063d67448cafmr4489443pfk.26.1682048496473;
        Thu, 20 Apr 2023 20:41:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id v11-20020aa7850b000000b0062bc045bf4fsm2027199pfn.19.2023.04.20.20.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 20:41:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] fts: Fix typo in summary
Date: Thu, 20 Apr 2023 20:41:33 -0700
Message-Id: <20230421034133.1136343-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421034133.1136343-1-raj.khem@gmail.com>
References: <20230421034133.1136343-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 03:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180267

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/fts/fts_1.2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index d3b0f31eda..10103830af 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-SUMMARY = "Implementation of ftsfor musl libc packages"
+SUMMARY = "Implementation of fts for musl libc packages"
 HOMEPAGE = "https://github.com/pullmoll/musl-fts"
 DESCRIPTION = "The musl-fts package implements the fts(3) functions fts_open, fts_read, fts_children, fts_set and fts_close, which are missing in musl libc."
 LICENSE = "BSD-3-Clause"
-- 
2.40.0


