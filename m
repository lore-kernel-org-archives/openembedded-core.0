Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8473E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:26:25 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.138114.1734639975917498897
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FkADOFHe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20241219202614146b1ce2f5d377c5f2-8hc62q@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20241219202614146b1ce2f5d377c5f2
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:26:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eIRcIhOQXyt7HWnN9kEN0Sasr6gzdtwJ351HnmzuX5M=;
 b=FkADOFHejzAJ0JFbpFOKP+kSgquQmd9XUMZhASd9lbAq2lw9x0wHgXX98bD4ZD86Z0u/Na
 TtA0AVzRxFBWycH3jjWmVM3ltQAtCu5qQMWumAwhSEXiH6JrKc8lT0SDcbmzMQESSa36KkMh
 agkMptZtn7M+iMTOdrREFt8xvB9NohztwAtxKHS8UqX42i+0XoLLHjUwffIVrgoibHtHI7NF
 oMG0/52DXVKjPjCw5UeUqAhPUTxMTqmmH2TYIab0qzGwE5WQHZl8/pKl5GDaV9HeR3R/Hk8k
 F+6v8Diz88zAhMc4FSgCTx0ImIq0puyz27hxsVtI5yASYPYsBxhf4riQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 12/12] emlog: set CVE_PRODUCT
Date: Thu, 19 Dec 2024 21:24:23 +0100
Message-Id: <20241219202423.346033-13-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208945

From: Peter Marko <peter.marko@siemens.com>

This will remove false-positive CVE-2024-50655 from reports.
There are different emlog components from other vendors around.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-core/emlog/emlog.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 631e52f388..ec78a11086 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -8,6 +8,8 @@ SRCREV = "a9bbf324fde131ff4cf064e32674086c4ced4dca"
 PV = "0.70+git"
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "nicupavel:emlog"
+
 EXTRA_OEMAKE += " \
     CFLAGS='${TARGET_CFLAGS}' \
 "
-- 
2.30.2


