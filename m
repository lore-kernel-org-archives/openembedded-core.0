Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CDBC43217
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:45 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.22337.1638602023875938940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=URMP+ooQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id a9so10513380wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=322W8VZgL0+2znbi5wWNeChTgn8S+13WUzbFpDODaY4=;
        b=URMP+ooQpBc00JIvxHJeVUnH3wFBw9fy9OqamSqL/+DK5nwSaIfbjWGy60NNBP5xKB
         gH+dKJ8n+QrJ2Vt6lMTXgd6kb9SurnUgei8whkVvE4TLouJrCNVeIUMmh8Monpa8ryfa
         qbXIxFsm3TdKRCbvLwNo+RSGGgeKhSdeHL9enJd4Ok8Zhtmy44iKAMJSxV++9Wnm8nSh
         ZSgx6ALTm4/u6iLJsDFdUGgqe2oW8TfJE6l0YNKjcyXSxgx0HNEWirpIPBIEmtM5vxjt
         P4lr1fPkCba4ZlGscFeqcXtZerw30uWstn9p2nirUJKctDi5H7Vpr0ofN4qhy2q/FknU
         5vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=322W8VZgL0+2znbi5wWNeChTgn8S+13WUzbFpDODaY4=;
        b=raCHD6V0DPAZivCaDekWvhgDY6yBcowyaLudvoCr5sai2EuIVIXGjALO3b1K5R8LhE
         N7UovMnpIiCWAcgx7ekhUMQWM4gH2PrknylEel3sCYdY2I2FwsMxRHNE3EHeJ9rvZ44t
         5G0WMR/CRS/4yI15n213BatsjQda66SxTt0gSLqyRK6yF/y4u6DkA17hMLzt+u4UKd7E
         BY41MWcGxWSiE8CzySqE9p+iN7Zs4iG5hhhOkduWC2H1GP4fXUCj6N13nIGMhxml9/o/
         PROlt8F8zsKNhmuac7xcWaRc7V9jnsQRBkY127h3yELJLR3lC85N40VDes775QWS67mz
         p/dQ==
X-Gm-Message-State: AOAM531V4dyMTZJucjxFsBXCPjo8BPj2580eBujjxalkdT+uv2iEav1L
	ODv5X4SVGUqK4hwhv1UIPAmBhtISbVofMQ==
X-Google-Smtp-Source: 
 ABdhPJy/zqvxljpeBDoKCGExgI7llQdCilmuN+xnmufIClO5nXDONvQc1LZRRLgO7hJDWOsM2UQPeA==
X-Received: by 2002:adf:9e46:: with SMTP id v6mr27475664wre.579.1638602022528;
        Fri, 03 Dec 2021 23:13:42 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/26] libfm: submit patches upstream
Date: Sat,  4 Dec 2021 08:13:20 +0100
Message-Id: <20211204071323.2480163-23-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159170

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-Correctly-check-the-stamp-file-that-indicates-if-we-.patch | 2 +-
 ...01-Do-not-add-library-path-to-avoid-host-contamination.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libfm/libfm/0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch b/meta/recipes-support/libfm/libfm/0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch
index fb91d90cf2..701b259cf9 100644
--- a/meta/recipes-support/libfm/libfm/0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch
+++ b/meta/recipes-support/libfm/libfm/0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch
@@ -4,7 +4,7 @@ Date: Fri, 16 Dec 2016 16:52:04 +0200
 Subject: [PATCH] Correctly check the stamp file that indicates if we need to
  re-build vala code
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/lxde/libfm/pull/85]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  configure.ac | 2 +-
diff --git a/meta/recipes-support/libfm/libfm/0001-Do-not-add-library-path-to-avoid-host-contamination.patch b/meta/recipes-support/libfm/libfm/0001-Do-not-add-library-path-to-avoid-host-contamination.patch
index f4c89127fc..0437000adc 100644
--- a/meta/recipes-support/libfm/libfm/0001-Do-not-add-library-path-to-avoid-host-contamination.patch
+++ b/meta/recipes-support/libfm/libfm/0001-Do-not-add-library-path-to-avoid-host-contamination.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 2 May 2018 16:48:47 +0300
 Subject: [PATCH] Do not add library path to avoid host contamination
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/lxde/libfm/pull/86]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  src/modules/Makefile.am | 1 -
-- 
2.20.1


