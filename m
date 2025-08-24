Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AD0CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 13:06:11 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.16494.1756040768039447972
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 06:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=KIkg9CAk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202508241306019ea0a189a60930c122-kod9js@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202508241306019ea0a189a60930c122
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 15:06:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EtFOA+fq1cOiRcfeSpVojzznF7INmuS+yByq1I5xTfY=;
 b=KIkg9CAkfGFM4PW92F//TchobSHtg72eRMkulmv8wQ71v/l2SANwkpeMDg2QNp9E69GmX8
 jjZzcC7jp7Er74TVbNLgusOUaWYVKcTUl5xD1quxbR76xu/mP+UidmdSYijW3Zjk4JlZudSf
 KtXzaWkSnQ9lirFM3HszMkB0r8QRbH93mJV3e+x7YoWHb8O1sAu3JiZ9BI0Ihi0YHEZpPaHm
 vO3Xesc+8LU0AiccqtAeF+SroeuN4gihW1eqnbDUV84oCNor3LQ9KZ5twBFkeZKejIu6k6sA
 9WZ1H3O2/2hu3QN1jykxGhlvRLsBzoBaAzd8vtp29XeIqgd9U6Oals9Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] qemu: set ststus of CVE-2024-7730 to fixed
Date: Sun, 24 Aug 2025 15:05:14 +0200
Message-Id: <20250824130514.1094962-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 13:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222372

From: Peter Marko <peter.marko@siemens.com>

This was backported to v8.2.7 and also it is mentioned in commit
upgrading qemu in oe-core.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 38ed637b93..220f0a161c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -84,6 +84,8 @@ CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
 
 CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"
 
+CVE_STATUS[CVE-2024-7730] = "fixed-version: this is fixed in v8.2.7"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

