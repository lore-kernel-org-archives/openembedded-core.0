Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792FCD75E34
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 19:12:28 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.2812.1732475540017142430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 11:12:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UWH26e5G;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241124191216e27fea516aeff0d861-kta4ni@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241124191216e27fea516aeff0d861
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Nov 2024 20:12:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+ca1VIPi9Atje0VUylquM4F7Tu4wDdFZ9g7/yKRLdNU=;
 b=UWH26e5GYz+LI4AA7qvOxbkUA1zs1VVVVuzJfQiujLx08IfPsZ+vOUq6lvQvK0M1mWY0aT
 h9P1I17/8lqXF1kmdMoJLC316An3UUUhRc2CaEyRprViC6ICPMPILS2ftWRTeC/ayv9F0tVk
 KRF2zRksUMmbCX7j+zOI6w5a3QWoaiRSG7PSQhe+9RymChtjfCCjztUqw89e/kBGvJssR/K5
 Yebz4SwwGCkKaF6kDc53vV3wc/vLx8Lezoor0xlBk8oD1d9XyV08wBYuAe/p9dOwiXYxcMom
 gFB0BzttKDvpQWviqEiURvlGBadzGRgobpc6EfopLxRUU9kcSnD2F7Kg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libssh2: mark CVE-2023-48795 as fixed
Date: Sun, 24 Nov 2024 20:11:26 +0100
Message-Id: <20241124191126.24876-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 19:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207714

From: Peter Marko <peter.marko@siemens.com>

NVD DB has typo in version (1.11.10 instead of 1.11.1)
Version 1.11.1 is the currently the latest one, there is no .10

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
If someone wants, correction can be requested from NVD instead of this patch.
But in current NVD CVE enrichment situation that may be problematic.

 meta/recipes-support/libssh2/libssh2_1.11.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index 6d2580072b..c7013142c0 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -50,3 +50,6 @@ do_install_ptest() {
 	mkdir -p ${D}${PTEST_PATH}/docs
 	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
 }
+
+# should be removed when upgrading to 1.11.10 or higher
+CVE_STATUS[CVE-2023-48795] = "fixed-version: fixed since version 1.11.1"
-- 
2.30.2


