Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E1FE7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:25:55 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.138098.1734639954958202579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WX1B3Iar;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2024121920255317b20c77989bf81030-mcwfdd@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2024121920255317b20c77989bf81030
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:25:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kjCysLd5go4DSZo5G/gE1KWqsvuNtE+rvEqbnOv1R5Q=;
 b=WX1B3IarX/diP56s0Zt0+KCSzHg4u7SrVxNox7VRIeRR0i1MjNyJS6jJWdgrlbPGCBWrkw
 SqRwa5+GwJohOy/ca7WCoyp1VeIyQ2r4Eyki4b65Jravia9KXinqoklNL8PCWo8Qi6CYzBy2
 y7joUmKRRPuUfGgAmPxpGFLi6cpYawmQGW7Z6g8GvrlxOBHzGkbNoS3TvaSCUuzxkMxaNzy9
 QytTSzqsDJ9RXcvQLisPWo5q/S6YYCLi+NEowe5zGBfyj2q2EPNMvzjCtELiQvCE/Sg0NXD3
 PjZ9yCCZnpfrCx/zjZEn4jlEZLhh/phNx1P28jdjaZ/olyyyCF0/fS7w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 07/12] redis: ignore CVE-2022-0543
Date: Thu, 19 Dec 2024 21:24:18 +0100
Message-Id: <20241219202423.346033-8-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208940

From: Peter Marko <peter.marko@siemens.com>

This is Debian-specific CVE.
NVD tracks this CVE as version-less.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.6.bb b/meta-oe/recipes-extended/redis/redis_7.2.6.bb
index dcfd532cff..b52381c7aa 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.6.bb
@@ -71,3 +71,4 @@ INITSCRIPT_PARAMS = "defaults 87"
 SYSTEMD_SERVICE:${PN} = "redis.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
+CVE_STATUS[CVE-2022-0543] = "not-applicable-platform: Debian-specific CVE"
-- 
2.30.2


