Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D4B3C88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 15:44:49 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1331.1789314283658398542
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 08:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SjPzRVfR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202609131544414ed45bba260002075f-qxtimw@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202609131544414ed45bba260002075f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Sep 2026 17:44:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kSzImb/vsxjo28UwDJLxWVx9I/307sBrtPdLBeNWwdY=;
 b=SjPzRVfR0r+eErnjW/A7muqAHdcvMG/fOxieJkE0WtzoM2YlJakwJFpXHiuzaQuj5xgJlc
 fMAYz78UKESZd12aBX1UqwhQXs+SilRlzRzV+goGYR9/GTD3hPJBHae07H69er+QNqN0u2lP
 8S8lNWfXOu5wh+FyURjDT/hzqyFfDONgItNYOEw6fZIaRJQDf8AzUlXyT7m8t0aWJG7UPpPd
 zrZ/dRoS2G5/xzARihHLEbYoljchrFtFP7mDE8ZSbEdfdpN/F+D+NiWat6L8K5y9Gb5VZKY8
 86FruZSCEEUjZ9HUUvIHIt0U4DVpt+mALBH6t4V03Bj/sP25mz6OUEHw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 2/2] python3-certifi: fix homepage
Date: Sun, 13 Sep 2026 17:44:05 +0200
Message-ID: <20260913154405.3206585-2-peter.marko@siemens.com>
In-Reply-To: <20260913154405.3206585-1-peter.marko@siemens.com>
References: <20260913154405.3206585-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 15:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245717

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors in some tools.

Example:
SchemaError: \" http://certifi.io/\" is not valid under any of the
schemas listed in the 'anyOf' keyword
(components -> ... -> externalReferences -> 0 -> url)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: ee556d1e1cc16327e0a11207e90ac61d9f1577f3)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/python/python3-certifi_2024.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
index b3d6cf080cc..617b597a40e 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python package for providing Mozilla's CA Bundle."
 DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
 Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
 which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
-HOMEPAGE = " http://certifi.io/"
+HOMEPAGE = "http://certifi.io/"
 
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"

