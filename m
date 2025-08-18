Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460A5CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 19:55:52 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.705.1755546950943042574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 12:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gb/a6W9K;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3e61c51f1d6so29434935ab.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 12:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755546950; x=1756151750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DMhodwJ8s5W9dFHow0oYxsg7NYEOvjHpXBP8zYsTf/U=;
        b=Gb/a6W9KesK8sOcvruklfipyB/56P5SduAUDRj2z4kf9xWPDZAgM0kOTO+Rfj1IBXF
         6l6Hv2yd0H9HBHcD/LxuV6uXvAO/5eteCfrMye8vtw/WN4XUAwLSrGS44BCrRyAYkfy3
         u2GJPIporsEIWontsztZHZK11jZOwCeUNM/os8nXXBRXwVNfwDURIU5BMkZTobUHN3pm
         Kr787Kw4im9KoF2i+/fm+BQfJHyv1ZwZCidWP7ZDnRVNDz5LR+/efhCbj7C+VLCNdCzs
         EE2pJlxcllVDs3g6i8duduGBYAGv2SnkJYrpytiwvX2SSPSGzQDv38F1MCCo2YOyJ8Jb
         q7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755546950; x=1756151750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMhodwJ8s5W9dFHow0oYxsg7NYEOvjHpXBP8zYsTf/U=;
        b=T01hoggvuTQKmpU7UNVpdfaoFvEecMDzur75D9fhcg8i9BnG94U3fy+EcROo/Kc3R8
         OPzmoApr3vMQyLXbOh2dTLSmO/AoQaVk3OGNrQCFEGLJbZpIe5+Q1O9JxWAHGfjbZBrW
         o6YMDZaEWPSrzIPnYd3ZFks3wYRpwJ6BGvR9sBFp1vDxoh9fB0fFnQ0CkTwzYoc66ZZe
         /W3d7+nbX/A9I1yaOYGOy7D/zCIJRivQPMO8AhKzPlIqw1fseLwiNlrwNSWzlFLCTrPK
         scxtqQMXoZg45XRzOfMpOJwpElyfkyJFPBVbzPaI3LOqD8jmUZOLHcyBsTVAi5EfpXVd
         yqSw==
X-Gm-Message-State: AOJu0Yw0DjrgJ6Ru29lVz6XeXnMW4IKLDM/SvcmUpvdFoOzz9cBbT2qe
	2ILWsvd8UUtIoaDr1PbpMUsu6LNmQM3co23cmcG7uM3XXTL2igOjbd2fBpE1MQ==
X-Gm-Gg: ASbGncuOVH/5UMzNzB3pgZdNWpIWmfssW9FjDByGI+zC4tZurGX6O/m725ikZ866Qzc
	0Mbta2lXGdENAe/3qvh54ZlOwByUY8RddLTPSF+/4XNY8P0BrBB3rVbM/M8EZBVgvIMk3ANV7yy
	ko0Q97aVYjl4FnDbEn8etdC2poJbtcLIdQSfO8N+ePqJbi9cM2rS3vacSzAecth0j5gMQcZsX07
	20hB1YF3L52f7WEjRxHn615JBvkXhZShWQUnHEkZM8u56QqKX/HJ1fbdcSHrDos2eaWhZ5VDn39
	8koUirVHINCUbpHx2YOrIJQCcvi24H6CMs9c986102mttfg3wFFiuygTwx/K+DI7GSphjEkIj4/
	sFiZ1xw3n9O74RevvoLCN
X-Google-Smtp-Source: AGHT+IHUWhXSGwsr/yhWsgWn016likj2Y7LzOQhuSvuMcfdY1KroKsP1xSWHM1rWppeEoEvApCsVAA==
X-Received: by 2002:a05:6e02:1b01:b0:3e5:4351:ad0a with SMTP id e9e14a558f8ab-3e6765e2e0fmr311625ab.7.1755546949902;
        Mon, 18 Aug 2025 12:55:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::e100])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c94781d01sm2794161173.4.2025.08.18.12.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 12:55:49 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx30_tasks: Change package license to declared
Date: Mon, 18 Aug 2025 13:55:43 -0600
Message-ID: <20250818195543.1428606-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 19:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222047

Per discussion with SPDX licensing group, the package license statements
classify as declared licenses, not concluded licenses.

Note that this is the same as a change made to the recipe licenses, just
for packages.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c352dab1520..f2f133005d8 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -696,7 +696,7 @@ def create_spdx(d):
 
             pkg_objset.new_relationship(
                 [spdx_package],
-                oe.spdx30.RelationshipType.hasConcludedLicense,
+                oe.spdx30.RelationshipType.hasDeclaredLicense,
                 [oe.sbom30.get_element_link_id(package_spdx_license)],
             )
 
-- 
2.49.0


