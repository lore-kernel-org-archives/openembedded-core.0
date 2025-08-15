Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A5BCA0ED1
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 17:06:16 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.16875.1755277569968341369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 10:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RuZVFbNh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250815170605802dd506b21db37aff-8ijrdg@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250815170605802dd506b21db37aff
        for <openembedded-core@lists.openembedded.org>;
        Fri, 15 Aug 2025 19:06:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VjmZl63Xv5yDqJTpMWMmj1QIO6RKblG6uIOhvOBd410=;
 b=RuZVFbNhErjhWeHIBaUBSgAOE38XVlfQWaaMWhWiT49Azl3x8mQd/wiAkklIfqGSe2oGZE
 NF0RmaYuQXiS9pIMSQuV0S5O76KbZa0DuldpFXWfK5MJZO+CbYfVh7H2e0VZSIIUxCxAZ+au
 9sbJBAL3JSGDNHUjZuK3ltlGcIcjEW1UYMxrqfQmhMtEfT/Oy6ZMePAwZZ5v//XiIZRz8Pfp
 57jWjgXpj6WN3F4xvrFVI3iLdSQ3sNrDw9a4igO9ic7ZMgWIPqxRnf27wHOBywcPFpUwQG5a
 r/zpgypvjmqryErdxZ4ysKwgZIQHDbMj2oWp4sbHnWrxJO2WAvsUhPwQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] dpkg: set status for CVE-2025-6297
Date: Fri, 15 Aug 2025 19:05:17 +0200
Message-Id: <20250815170517.12674-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 17:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221990

From: Peter Marko <peter.marko@siemens.com>

NVD tracks this CVE as "Up to (excluding) 2025-06-30"
(which is fix commit date, not dpkg version)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
index d793c26d57..69b3c3d880 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
@@ -19,3 +19,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.22.
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
 SRCREV = "d72b038fd2113cb62972e4071db03dd1388394d8"
+
+# NVD tracks this CVE as "Up to (excluding) 2025-06-30" (which is fix commit date, not dpkg version)
+CVE_STATUS[CVE-2025-6297] = "cpe-incorrect: this is fixed in 1.22.21"

