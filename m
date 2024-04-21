Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19ED8C4345F
	for <webhook@archiver.kernel.org>; Sun, 21 Apr 2024 12:02:44 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.30653.1713700960481607205
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Apr 2024 05:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UPdCPrn0;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5534506790so56816966b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Apr 2024 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713700958; x=1714305758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp0wUipDzeL7WVZ6rvqGgCsl/34HwWAGYfGuMPUNOVo=;
        b=UPdCPrn0roGjOdahxg8ID4NNYJCrP1Iqi/1aRxQ6ISmhDfL29MRZV+whRmpUe4lwF7
         5GOe8dOHwhh1IIqC/TAd+ITgKAjStGDitlAIwOe8mHPqBDj+0uELZcETiO4SdefJfIEt
         M0N1PIlSJqKNZjjvfG+UI80xN+ix2tjr8ET5bYuU+4CcYC68xcVokTYkE8/84FiWLalO
         Vx43xRZJ9/W0MxGDN6YYTIVuECa8Ilx+IhrHG5WO4EK5++dbhWeo1xYbE1Tncvdu9Src
         2ipDbRAmcq73Zobjjp1m4j+X8wfyi2VcrzxGuY9SefUG1XFc51RoiDn5iZqWdZnGgjj4
         CdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713700958; x=1714305758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vp0wUipDzeL7WVZ6rvqGgCsl/34HwWAGYfGuMPUNOVo=;
        b=xJnuestlT6OcUWoQUArqW2b+x0FiedF9b7FO/L7y4uDX34t/LDB9mw9vhvsjqXfM1H
         MSktGJ5HW2c63e+8kd/Q/+xfI6LZzrvuLH3VmhX2F8bO7qBCOT/zEyn6mOXPZqPoQf2e
         wDr3W6AYUmAATu3nrZkFfmy2t/+l7+1d3ybUDSMSWtHr6VHaQggS2GtU1PJPVWzgH8bU
         fs7MxtaihqRZW4TmCmQa9W9q8cA1egSBDEu8++TQlH6fDc8BSivHay6ej7MHnNgZhCDZ
         JI3JMGKH8jTNcz5p7ocDqpNZ+5ZqOpFQt7TF5rcGvx82VtlAcN4Fh9dyTVKng6FH382G
         abEg==
X-Gm-Message-State: AOJu0YzUC4vQ7eXRboVLfr5rL3TG0ZpvJ3zuz17mt5R39KHtxabYst9E
	zL8Lb655KtSAZ7yiuoR9mUd435o190OoX2Oj5dSvEFk/1L76pGLzOjuAYw==
X-Google-Smtp-Source: AGHT+IF42sWjZBTlczvreAbYqQbWIxLECfOFe0A8XgP7xi7QXzUC1SkB46HdN2sU46WT3RPYETvLVw==
X-Received: by 2002:a50:9f61:0:b0:570:1062:2b5f with SMTP id b88-20020a509f61000000b0057010622b5fmr4794198edf.2.1713700958495;
        Sun, 21 Apr 2024 05:02:38 -0700 (PDT)
Received: from localhost.localdomain ([95.90.247.223])
        by smtp.gmail.com with ESMTPSA id g1-20020a056402428100b00571bbaa1c45sm4217431edc.1.2024.04.21.05.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 05:02:38 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] repo: upgrade 2.44 -> 2.45
Date: Sun, 21 Apr 2024 12:01:46 +0000
Message-Id: <20240421120146.2594-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Apr 2024 12:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198572

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.44.bb => repo_2.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.44.bb => repo_2.45.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.44.bb b/meta/recipes-devtools/repo/repo_2.45.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.44.bb
rename to meta/recipes-devtools/repo/repo_2.45.bb
index 875897851a..81bf31754b 100644
--- a/meta/recipes-devtools/repo/repo_2.44.bb
+++ b/meta/recipes-devtools/repo/repo_2.45.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            "
-SRCREV = "fff1d2d74c2078b62cc9c2561330e41a842dc197"
+SRCREV = "73356f1d5ccbebf5a33e5e9aa1ba06c5f5437fed"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


