Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE73C25B0E
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:26 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.22465.1659940998237507504
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X5UdO9+U;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id t5so10033248edc.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZogOrDp/jXZuuj7xs34G7uID30JIZPxPYq/cDmBiUuQ=;
        b=X5UdO9+UbI/d9k0EXgxu4H4d8awX3scwBjjIDI9EkZ1XSovEcGEJkg0QoXxQ5JgAd4
         hr09BydjKJpsGSna4f8ZAGXHjwut5VAo0KB1p+YZZocsJdpNg5ycZRuRD3RzgXpYOGwU
         UYJHS56R2ZVINB7NKX9ZaexT6i84rMqemWlcQkhe55dikTJ+zVnvd1EDSUrcTiylyLM1
         4robELOXnovrQuLi0CEMFNEmlxGTcil0kQbpccKAdVg+v4lOv5Wjc5/iNJMT628KyuBh
         PyS3qSpWCNpqqpVsDgF9PsFbdsvtHKboGGe1SlUoiO5Zqhvt6+tDEtcK0rqpqrpNfBgY
         3zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZogOrDp/jXZuuj7xs34G7uID30JIZPxPYq/cDmBiUuQ=;
        b=yKUV10fucXQt/oXJ/GqNtV1RT8QjRBuykWQN6B9QxaOOJZYvmHd5ego44Qpl2kwuH8
         1iNCrhB62WLVHAbHyBT6yKOZMJfVT50NreH2mIAiJrr12SAghHxC74mKFodlqVNyyJZo
         EpIesg5LH6PPHasYCikcBmP0HSI6ZnmqY/YjS3vJ3yjLcZCYKbLQ+n5RqWXp0/TKDQro
         cU5iMDlxHcycB9Fp1hadafmyk4VmIefc/0C7AMRywLO1n/icUy9foXCtSnBEb3IFjTEh
         df4erI/vcTP52AwKW8c6PO/u8Pz42mS0JJ1Ln+bnKyblaCvHe6AsNe3RJ8PPiS/U3Fbf
         HooA==
X-Gm-Message-State: ACgBeo2ad67wXACdcriFT/TUJg2Cim7HOv0BbwLYwMUDkA3NJ7k3+LlU
	12ppt5elpp0OL73E1W2frX+rot3wGrM=
X-Google-Smtp-Source: 
 AA6agR6IYbxrVwIKqAHiGVxks+efGTCr0OxNmnjox8Jzf9TZrAbY7oF8W1GmP5b1vrUNddN6lrrL7w==
X-Received: by 2002:a05:6402:240d:b0:43b:c41d:b0e0 with SMTP id
 t13-20020a056402240d00b0043bc41db0e0mr16128996eda.318.1659940996853;
        Sun, 07 Aug 2022 23:43:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 41/44] stress-ng: upgrade 0.14.02 -> 0.14.03
Date: Mon,  8 Aug 2022 08:42:34 +0200
Message-Id: <20220808064237.3975347-41-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169065

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../stress-ng/{stress-ng_0.14.02.bb => stress-ng_0.14.03.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.14.02.bb => stress-ng_0.14.03.bb} (93%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
similarity index 93%
rename from meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
index 000a640917..ccca4ffa4d 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.02.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.03.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "5239ae6c82bfb239637b5a66cd39a035a158e641"
+SRCREV = "346518caffe5302f9a6d36860459c297c6968aaa"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.30.2


