Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1D3C27C75
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:13 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.9982.1718288465639847964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qRCQ4bNi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f717608231so8690085ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288465; x=1718893265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1jJfzYeZeAJSqufDhhIGpiiQi2CU2okxRAw3oEZ/Pw=;
        b=qRCQ4bNijnZ6WZ2lkBKzT7MAh2QhnvIOwfbSyzYPkCCaF0qxPRdbZ6tmpodVSox3l+
         RstCbxAHrwaSpZsW1rzYrwJDB6Y1PZMDFSNzF1XAXMTUrQrkj7elQ1PWiAfaEbLbeww3
         8qbRl96wWp9LLiCH1p2ZBZnwl7kX/3cB4NNhPbyYYP+5stWd738ztbf9Bfi93pTKk6fr
         IRDTo3UQcDyW5HoWIqgW7G/eWr9Bcr4NnTsct+aa1WnGIqf/WKATQQa4yWdaKL9r8zEM
         MviVmykTUu9QBmmdQK8yuEwz7+HD/Ckzow1GR8T3fZdZWbqarThdqRMWEKlT9Rd37VGq
         BKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288465; x=1718893265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1jJfzYeZeAJSqufDhhIGpiiQi2CU2okxRAw3oEZ/Pw=;
        b=jJsmcmXfjq1DOjmaBvglp7s5PcWbDG8Q9+grzgWmeOLTjwdveBLzbivhYCBdzWKE91
         DztgegFyvKsOxT7gEI3Lsx8nNRv81JPPQ/8pTxdkOTRbHhWFi98cr38YKW2tVcXrzDxV
         XNILB6L1o4RR/sU2CcnEhd+VtYLcqiRpH1U6wM7pv5s+fnv2YiKr7Yq67lbbBbq5Ka+8
         H0S4wcD5eFcWZOfwF/BPHcednC7jlnDM28QvxTPIycaedXF+zl94/djR3dR0zJo/ELdg
         N4B/fVsq/oWUOacaUWh30tDi/IPC6JNK+P7/T+YnZ4mpiiPgiwDw7J4fI2SZNKUaRtMF
         4m8A==
X-Gm-Message-State: AOJu0YyTA8B2PC8v1wYuGodSU5c92HzPcxReD3u8blnSw6z0egilnjDS
	gSRFCn4y0hP2s3GWmoywjhOvkZJivRyj6Zo+zdtYznt1Xv+Rq5oSqPI3n4ZLFcE5AB8nQ393NSn
	R
X-Google-Smtp-Source: AGHT+IEgvJci4+YpaOmEjzZlHa1yb6F0twtTyZaFVGxPOXdXGHSJlO4PFEmIRuo1Nj0qJvhks2SdXQ==
X-Received: by 2002:a17:902:e84d:b0:1f7:1821:77b2 with SMTP id d9443c01a7336-1f83b56bf1dmr60964155ad.9.1718288464804;
        Thu, 13 Jun 2024 07:21:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/29] xinput-calibrator: mark upstream as inactive in a patch
Date: Thu, 13 Jun 2024 07:20:23 -0700
Message-Id: <58eed3438981e594daa076193e6af0f9e0cad014.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200621

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 959591615d18f636768671e1e14e5945a6cbb010)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
index 86982924a8..de0862599d 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [last commits over a decade ago]
 
 From 14734a93bd3fc323325459e24b04795422e395e6 Mon Sep 17 00:00:00 2001
 From: Laurentiu Palcu <laurentiu.palcu@intel.com>
-- 
2.34.1


