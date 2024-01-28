Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081F1C47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 16:58:01 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.41208.1706461079542577508
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 08:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dzJb/05f;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20240128165757804d4d070ba61a137d-vbeszk@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240128165757804d4d070ba61a137d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 28 Jan 2024 17:57:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ykBGAPqGDRHBWJyWKSBQjzRGlsoTcBkgx0o60mK3Tik=;
 b=dzJb/05fNPRzchG8OiGQFk9MEHKf37xlW7OFxdipXeSE9b7Uz4+vGotxFJ3DUKF/vl9/p+
 5Tg1gv+pVPXZuAX4EJn19ipv0KljHEnJm8flwbSoRBZxEMq5jBBbVGr9GXDAC5vbp5FHeTm7
 WLYXh8pZ+4mLar3XxeGBl+g/S3sjs=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][nanbield][PATCH 1/2] sqlite3: upgrade 3.43.1 -> 3.43.2
Date: Sun, 28 Jan 2024 17:57:04 +0100
Message-Id: <20240128165705.658656-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 16:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194446

From: Peter Marko <peter.marko@siemens.com>

This fixes CVE-2024-0232

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../sqlite/{sqlite3_3.43.1.bb => sqlite3_3.43.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.43.1.bb => sqlite3_3.43.2.bb} (78%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.43.1.bb b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
similarity index 78%
rename from meta/recipes-support/sqlite/sqlite3_3.43.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.43.2.bb
index 93146358c7..64c1013625 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.43.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.43.2.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "39116c94e76630f22d54cd82c3cea308565f1715f716d1b2527f1c9c969ba4d9"
+SRC_URI[sha256sum] = "6d422b6f62c4de2ca80d61860e3a3fb693554d2f75bb1aaca743ccc4d6f609f0"
 
 CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
 
-- 
2.30.2


