Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA53C98306
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 22:25:19 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.139.1768602310528023811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jan 2026 14:25:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KG251R0h;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026011622250619004eb3280002073b-cveg_a@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026011622250619004eb3280002073b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 16 Jan 2026 23:25:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=TZ2fbPLU4fLuhDInxGrp3viwXC09X3E/eVrTkSmN18Q=;
 b=KG251R0hPPdwzwbuE01pa+1gZLLt3VbWd/AJmSQWPDmboDaBEhA7wRaWf/7NEkHmP+5btc
 SXMYtoLF1I/egN0QwUzU1DuKMIypcEtmZ2xR3XjUV+IOFwgzDlMhhf7dgNKHY9QOp8nIRUMU
 slTFodW5fpjVWDWIUyG5/J59nxf2HPoKTNyaps9zJOr/5IMJA1czzbYUveHdURs0tKdkhLsN
 Pb6VKkfoG0V0l70p7nCyPatLw+HuOKcaOKvpJEpyJNUZUIYOJKnJz0/EVQ9pJ54yBqqX3Tza
 luzDxQINZBCNItg0uUZLt08GtsEN9uSNew7hyBCanaNVjQxptmRRCYXg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] python3-urllib3: upgrade 2.6.2 -> 2.6.3
Date: Fri, 16 Jan 2026 23:25:01 +0100
Message-Id: <20260116222501.269631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 22:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229568

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-21441.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{python3-urllib3_2.6.2.bb => python3-urllib3_2.6.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.6.2.bb => python3-urllib3_2.6.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
index 3957818f6f..e63791a8f4 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.6.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.6.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "016f9c98bb7e98085cb2b4b17b87d2c702975664e4f060c6532e64d1c1a5e797"
+SRC_URI[sha256sum] = "1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed"
 
 inherit pypi python_hatchling
 

