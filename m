Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57882EEE25E
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 20:19:57 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5939.1767298793208211241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 12:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KxYxJyON;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202601012019496f5f7fff8c00020743-jy3oo3@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202601012019496f5f7fff8c00020743
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 21:19:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=u7T5wJ+yyGM02MPRQW1VXKWfwQuYsogD8BhFdxIcE70=;
 b=KxYxJyONXHy5HA4rma/c/FyNo9ORg3nL47WNucpqiTCSk3mtttLF3cBLdRuHFIuwTsqUFl
 4pQew4tE1m5/nGTjjX12cdXMw/INJ0FWvB1hYqmmaPrM3UnDmb2ifgs/4jVZb8da4RyUubba
 F6/0eZsTmcqFX7fkfBmYCdrYqwvWnxuJ+yDg/+W856DXXLFQc8wmEGKf3TddLK0/UnSsmprr
 icd/6OZxf4shgd+pChbpvru5yQdO4RaZ3slkOA0hF8QRPWrlcMO8putZtP5kFh83AaUjDt2o
 EpTO4rOVMjm9zG3JxIWzbDLpcGBJkKAQgWjzq+yoJt6VIGSba6TPb3Xg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 3/3] cups: upgrade from 2.4.14 to 2.4.15
Date: Thu,  1 Jan 2026 21:19:48 +0100
Message-Id: <20260101201948.97100-3-peter.marko@siemens.com>
In-Reply-To: <20260101201948.97100-1-peter.marko@siemens.com>
References: <20260101201948.97100-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 20:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228829

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade cups from 2.4.14 to 2.4.15.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 5c4ad96193c2e892aa06912808d21e7f861fb9c5)

Handles CVE-2025-58436 and CVE-2025-61915.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cups/{cups_2.4.14.bb => cups_2.4.15.bb} (51%)

diff --git a/meta/recipes-extended/cups/cups_2.4.14.bb b/meta/recipes-extended/cups/cups_2.4.15.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.14.bb
rename to meta/recipes-extended/cups/cups_2.4.15.bb
index 5d5a1dc97f..dc22771db3 100644
--- a/meta/recipes-extended/cups/cups_2.4.14.bb
+++ b/meta/recipes-extended/cups/cups_2.4.15.bb
@@ -2,4 +2,4 @@ require cups.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "660288020dd6f79caf799811c4c1a3207a48689899ac2093959d70a3bdcb7699"
+SRC_URI[sha256sum] = "eff0bbd48ff1abcbb8e46e28e85aefaffa391a1d9c4d8dc92ab3822a13008d7f"

