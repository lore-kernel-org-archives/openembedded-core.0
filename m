Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCEFE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:25:55 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.138097.1734639952313877772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ENppPzTA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241219202549a6e5efb913c88788bc-a95itr@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241219202549a6e5efb913c88788bc
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:25:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=b89PgISj3f+nh6Od870RQV68D4NBIoczGd/7zSUnAbs=;
 b=ENppPzTADtL7LzRzupDJQyREXf69/dgq6eobFxGXMDCRQ6KKXXUWuYIH4M/qeBZcW2fH3P
 cmoBgp9/SZXXz/Je9FF8EyAGGvMtkxtl+X7NG1Tlr4YpaWcRClSGoVW9W3XtwtNRZoN6OI9f
 zZRvyAZnNHVLJ668wqtxnPiFQnwqdujbFu6zM8R/5thBLC/aqEZ4Wb21VlDy8UzBH4Ahzeaw
 4PaKdwxGMAFxucTXE/y5PUCRIoR2NJLOLkfucHIrslIKseWMepUNM6RHn82dEgBZpI0Yje4+
 udHXl9huHiLTgBTxnvh3HSHzVNquQ/5Tsemmy3Jk248R2rvjqBVsjhIQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 06/12] monkey: ignore CVE-2013-1771
Date: Thu, 19 Dec 2024 21:24:17 +0100
Message-Id: <20241219202423.346033-7-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208939

From: Peter Marko <peter.marko@siemens.com>

This is gentoo specific CVE.
NVD tracks this as version-less CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index f10262366a..a11af8129a 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -91,3 +91,4 @@ CONFFILES:${PN} = "${sysconfdir}/monkey/monkey.conf \
                    "
 
 CVE_STATUS[CVE-2013-2183] = "cpe-incorrect: Current version (1.6.9) is not affected. Issue was addressed in version 1.3.0"
+CVE_STATUS[CVE-2013-1771] = "not-applicable-platform: this is gentoo specific CVE"
-- 
2.30.2


