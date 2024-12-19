Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9326E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:25:45 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.138060.1734639938711483086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OmsYdqvS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2024121920253674e5e8b0917c4336c4-o_uy9m@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2024121920253674e5e8b0917c4336c4
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:25:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Jy34stIp+lY+uv0iwtz26dtttQc0niJABEgYOofh01U=;
 b=OmsYdqvS6c4Ur8pq5NnbXzu3NonJGOHlfIZuv11O1Nbjz6JGPdq+1XHglPa7WWEAUSCrdJ
 SGRS7Jfx5Umxx7Z2tcowsQZY0I+LkhUVslmZBNcimDx8WSAciwP5CkYf/xqZgwQqQJoC377z
 U13oFd29QMEJ9IMr5HM/BE62pr2QNVUURDjzHz9HXiVzTJ396fRFiI4HI/6uX12cYXxh1bkr
 4iopClJ5++fDwjomVY5Ar/9ZujAhYzdiG5AEJd7ITVmi2i8L5rX1PMHPQrd07bHlJJD+hWWD
 ghfjdxShQyKHx2qf8y1MKkH4qsQgH0OmwNjv+0gyhIQqzAXo6v8ngfnw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 03/12] apache2: remove old version references from CVEs
Date: Thu, 19 Dec 2024 21:24:14 +0100
Message-Id: <20241219202423.346033-4-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208936

From: Peter Marko <peter.marko@siemens.com>

These were not updated on recipe upgrade.
To make maintenance easier, remove exact versions.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-httpd/apache2/apache2_2.4.62.bb        | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index 475f77d41b..3a988f2494 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -37,15 +37,15 @@ DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
 CVE_PRODUCT = "apache:http_server"
 
-CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows"
+CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version is not affected. It only applies for Windows"
 CVE_STATUS[CVE-1999-0678] = "not-applicable-platform: this CVE is for Debian packaging configuration"
 CVE_STATUS[CVE-1999-1412] = "not-applicable-platform: this CVE is for MAC OS X specific problem"
-CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
-CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
-CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
-CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
-CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
-CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
+CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
+CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
+CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
+CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
+CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
+CVE_STATUS[CVE-2010-0425] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
-- 
2.30.2


