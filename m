Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2129E7717F
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 17:16:06 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.82484.1733678155976033757
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 09:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XVUgCzt9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202412081715526a4705960b9d6b672f-7solyz@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202412081715526a4705960b9d6b672f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Dec 2024 18:15:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TqCXgbG0nq8qPst198orUkWj19MMAmQY6YEq9uCCtx0=;
 b=XVUgCzt9nnfWUW22kNE+cgHEJ74aVQaTzC2yMrqyJq3sr1YQCuAzOLeLiI4pbqV8EXgBGU
 T6ZyApQecvu4p4z7tbVzpvLT0agL3gg20r3G8TGmJk8t+2qp2PKgVV4FjI9lKs9wuXYLPPVj
 gglAN1VzFl4hmMV6ol+v7E0uL/zSqFlu6b1+M6GQt9kf3o2Pc8qtnRZA72rUbIWION2y9/EG
 Z9TsRk1ea+dRLOJDDe9btgm6fjd9Kp6cb5dvwiLH7VRagE3EWym+Abl71qxomoxPIkdU/9oj
 H77huymSrJJ+rLDNXJILF5pSZkTN9q3chKSnyaQki5KmIBvjbc4glejQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [meta-something][scarthgap][PATCH] qemu: set CVE-2024-6505 to fixed
Date: Sun,  8 Dec 2024 18:15:04 +0100
Message-Id: <20241208171504.9330-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 17:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208466

From: Peter Marko <peter.marko@siemens.com>

CVE patch was removed on last upgrade as fixing commit was backported to
stable 8.2.x branch.

NVD DB has this CVE as version-less (with "-").
So explicit status set is needed to mark it as fixed.

(From OE-Core rev: 64359ec3b60ae68d39c2e6444f903fd20e397cff)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 40ee267a42..4dc6c104c7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -78,6 +78,9 @@ CVE_STATUS[CVE-2023-6683] = "cpe-incorrect: Applies only against version 8.2.1 a
 
 CVE_STATUS[CVE-2023-6693] = "cpe-incorrect: Applies only against version 8.2.0 and earlier"
 
+# NVD DB has this CVE as version-less (with "-")
+CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.30.2


