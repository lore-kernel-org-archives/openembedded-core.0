Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640C3C7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:45:02 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.9393.1685522693621182596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 01:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jf4jM3BL;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-96f683e8855so783534166b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685522692; x=1688114692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hz08wSudDmqhtDumcv5ymex5uA+e8GY3vSeJo4tWJxM=;
        b=jf4jM3BLDjwCRInbb6t+93vrt120pPGdOrFJwxYtaaRnhd8nLXoXRdy/bBUWNfvbRm
         Ow91gUz1L6xx55pTBFXw7pRjVCCTFJiAe9IZGEOY8vXz3vys5K68pqZQrcl7phrAFxeJ
         q2jSSg31EzRn9T7TAvFQcV+AfAo9ANpu+KD1IEsvHJFdhkT1d4TwDOzWr5TJ5ErANd5G
         RQBxan4rSBnsZH7MLbmgZ+kVl6FpEtpK39VJ3d1IP4/UbZqXCjV+c+2qYq9wa/OX4v/s
         G0kq1eo9HbUpp880VsCwpXKrvyV0D/uGhoqJEZovATeTRFreYOOAE+dwvBjXBa+mJtWc
         aaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685522692; x=1688114692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hz08wSudDmqhtDumcv5ymex5uA+e8GY3vSeJo4tWJxM=;
        b=LKksxgy8Ojv8A8iqg2VN+X2O1cbyJP1LCI3xfIRS/4L3RfLb1gHoY8VkqBsIDGWERq
         BkAJXMTN9mrNOXvYHUAqHB3iVZbH4rY5na3lDyJfYFMO4c23n798mV0DPBhVko75m8r5
         NrcHnSnmNQoZd4DNufwQ97fbUbvZgtAiEnfUWMSCzfL4qZLUVHsNUeMcuMv7FjYGH4cd
         l//UCW2zwEQ91Ev4putcO7LjpcVfbnXj3OH4ClaTOi9EW1CTszNkZVi9Asm1ViKfJvNS
         dDTOYzEg69JYNPqPjukaFBIw4ItTl/EDAmAJaydxmJMJB163A8ny80HdFrUeWkdBjg74
         hW6Q==
X-Gm-Message-State: AC+VfDwIgQprj89NP/m3N3Q2cajsDngFkyeIF3DvePxzdsWQ2QvTkHpT
	Wwkh6muuMzlQ+QnbDiwpi+vZzWLLTwikBw==
X-Google-Smtp-Source: ACHHUZ50CwxqiVDJmijpYDkbzC4AELSgEsggPmtjEEpb2AtItW1tAIu8bwILRp1TmAd5FVrHLgqn9w==
X-Received: by 2002:a17:907:6d0c:b0:965:a72a:b2ae with SMTP id sa12-20020a1709076d0c00b00965a72ab2aemr5071742ejc.60.1685522691558;
        Wed, 31 May 2023 01:44:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906150c00b0097381fe7aaasm8580209ejd.180.2023.05.31.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:44:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] maintainers.inc: unassign Pascal Bach from cmake entry
Date: Wed, 31 May 2023 10:44:43 +0200
Message-Id: <20230531084443.3894688-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 08:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182003

This was confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a3b9cdbb12d..80109c6ff76 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -92,8 +92,8 @@ RECIPE_MAINTAINER:pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.co
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-cmake = "Pascal Bach <pascal.bach@siemens.com>"
-RECIPE_MAINTAINER:pn-cmake-native = "Pascal Bach <pascal.bach@siemens.com>"
+RECIPE_MAINTAINER:pn-cmake = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-cmake-native = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
-- 
2.30.2


