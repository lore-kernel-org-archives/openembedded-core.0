Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24483C52D6F
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 16:07:18 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.11887.1722874035041413955
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 09:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Qva0hcSU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024080516071107335686d34e1cec4b-7odsud@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024080516071107335686d34e1cec4b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 Aug 2024 18:07:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=togI3Xgb4vGhzg8sCAmqGWrUNC6J37r6Y90zBho/Rpo=;
 b=Qva0hcSU6hnXqUL+fPmaNpW9KQTNCHvglRWn+MiCEpuyxTbOQfL2A+bb1okE0MqjfJ6f8x
 4BtaFcPZG1YyOKLo9s6afbwC6jYWWBrVOD1qt9rM3UYhn/VBLtKCs9mI0I/uwqt7WPF751Ff
 +fQWxaY1m834HgmvxawTOLRE5jYOgUAvbw4ucvOYF8eWrj0nFqxBQdQ0yPmABSuh2ZQqory2
 4Jzf/VI3/ZaO1/YV69nI6keCP6MCSFq5Yc7uZmKtNPWAdhLg9x5zhXWJyrCYxHzFzB4mKhJX
 DmB7xXd4jPf5CKfD9XqpmOpVUP67vOSXd6IaRaJ8zE1Sx6IzZCtARclg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] qemu: set cve status for CVE-2023-6683
Date: Mon,  5 Aug 2024 18:06:03 +0200
Message-Id: <20240805160603.572306-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 16:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203004

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed in v8.2.2 with v8.2.1-55-g480a6adc83

https://github.com/qemu/qemu/commit/480a6adc83a7bbc84bfe67229e084603dc061824

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e121ae70cc..b203054dc4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -80,6 +80,8 @@ CVE_STATUS[CVE-2023-3019] = "cpe-incorrect: Applies only against versions before
 
 CVE_STATUS[CVE-2023-5088] = "cpe-incorrect: Applies only against version 8.2.0 and earlier"
 
+CVE_STATUS[CVE-2023-6683] = "cpe-incorrect: Applies only against version 8.2.1 and earlier"
+
 CVE_STATUS[CVE-2023-6693] = "cpe-incorrect: Applies only against version 8.2.0 and earlier"
 
 COMPATIBLE_HOST:mipsarchn32 = "null"
-- 
2.30.2


