Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF7EC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 07:03:35 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.2221.1690787013202987226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 00:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=N7hO7o09;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202307310703319bf8d75abb176ded99-uk2heg@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202307310703319bf8d75abb176ded99
        for <openembedded-core@lists.openembedded.org>;
        Mon, 31 Jul 2023 09:03:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=l5kZdRhl8inoVlyK/CV+8RUAaHkmlhgEXstchbfmtJ8=;
 b=N7hO7o098putnocIYB6ZPlm8prSnG66WHLebYTGJmkgKjtxOr6CosxKhg1Jr6K3eK8Y63r
 IEmVSDvJVJ56f4r7SPKcYsMkqcKSweTAZT2xVESQBqiwLOOISHUpq5jw/N0h3pu0gd+NkeZw
 cJHiSRUe8VXyiRCzt42ga5O6YxJhg=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v2 1/2] cve-exclusion_6.1: correct typo in exclusion list name
Date: Mon, 31 Jul 2023 09:02:31 +0200
Message-Id: <20230731070232.9782-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 07:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185121

From: Peter Marko <peter.marko@siemens.com>

This will remove 6 CVEs which were already excluded before.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 2eb4836c35..6505fbeb60 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -571,7 +571,7 @@ CVE_STATUS[CVE-2023-3220] = "cpe-stable-backport: Backported in version v6.1.16"
 # Backported to 6.1.28
 CVE_STATUS_GROUPS += "CVE_STATUS_KERNEL_6128"
 CVE_STATUS_KERNEL_6128 = "CVE-2023-3268 CVE-2023-35823 CVE-2023-35824 CVE-2023-35826 CVE-2023-35828 CVE-2023-35829"
-CVE_STATUS_KERNEL_6122[status] = "cpe-stable-backport: Backported in version v6.1.28"
+CVE_STATUS_KERNEL_6128[status] = "cpe-stable-backport: Backported in version v6.1.28"
 
 # Backported to 6.1.30
 # Backported to 6.1.30 as 9a342d4
-- 
2.30.2


