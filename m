Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADA5C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 18:11:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.66831.1723140697649194505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 11:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PrlRtPDR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3683178b226so494607f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 11:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723140696; x=1723745496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=POjlAQ913E8SWUx8qxB4A89kVbXOqGosv3+T+QuVjK4=;
        b=PrlRtPDRzSojmFC/rMk0oXOAwaVT6prdgHstW/qoCYBCbCHgGsgZ14K9SjrAQ6GY5h
         zQ0coHfKJRrnyY+TDbCWL6/jVCE5xBPKLKw+V0RAJqJQM2Z0fXZX2YnCa1aEyp+RDrYu
         k6dd6B81rHw8l/vAxC3PZWfUh4vlSX6JzGhOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723140696; x=1723745496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=POjlAQ913E8SWUx8qxB4A89kVbXOqGosv3+T+QuVjK4=;
        b=L3ThDqToHJQ3Cz6hR5YK6PMMy95v3tRgEw2vgiqcWi+Fchb6MGQrc8t0mQ4mqIcvyH
         teiG8B6mQ0ZLOnIxtK2an/V74sqqqB440s1kk0Uqbetpn0lhiXmxjaijf5VgrlihYEFF
         VX7hhnalaEJD1Rj9vcsQfYHqnQM8U3ER7sGCqh0gYiItHjM8zY6YhI2SWb+lBefNNNNu
         dsMGr5NpQstpNuDTza89nLbpSwaD26s2ZKpk5+axbvu4RmL5iA7GoEAlRodw94c5zS4n
         mRD/X5+cJcqhT/QAUlmysWftrgTG66uBM0QOOt9P/RZyeG8oNvJAlgiVZAy3GsS3VySr
         c5zw==
X-Gm-Message-State: AOJu0YwUFjA7yy620SNASyGC2JmMZtowGTEERABUyustvDySbewxrQQw
	eZNlewpWvkbfbZ0PFAQOLVW38pzqaTCdwG/yCeYijbrfegWJYluAnplI3eQb9tWdtKfDTuh3zqR
	dOa8=
X-Google-Smtp-Source: AGHT+IGglc/ntJmqFHoeJR1PxzVdfDpLP8MLSwk+betEyApdH844Cdujaxbw2TfdnZgKcy/EBSGkTw==
X-Received: by 2002:adf:f3ca:0:b0:368:460d:d942 with SMTP id ffacd0b85a97d-36d274dc26cmr1819864f8f.24.1723140695367;
        Thu, 08 Aug 2024 11:11:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43bd:e590:a93b:4c51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2724d1besm2792671f8f.117.2024.08.08.11.11.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 11:11:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] coreutils: Update merged patch to backport status
Date: Thu,  8 Aug 2024 19:11:34 +0100
Message-ID: <20240808181134.401214-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 18:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203145

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../coreutils/coreutils/intermittent-testfailure.patch         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch b/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
index dc1e1592e12..0794532bdff 100644
--- a/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
+++ b/meta/recipes-core/coreutils/coreutils/intermittent-testfailure.patch
@@ -9,7 +9,8 @@ crosses a number boundary, the heading spacing can change:
 The test is to make sure the 1024 blocks element remains the same and
 the spacing doesn't matter. Therefore strip any duplicate spaces using tr.
 
-Upstream-Status: Submitted [https://github.com/coreutils/coreutils/pull/88]
+Submitted: https://github.com/coreutils/coreutils/pull/88
+Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit/c5725c8c4bb21903490a48035286d0f94463642e]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Index: coreutils-9.5/tests/df/df-P.sh

