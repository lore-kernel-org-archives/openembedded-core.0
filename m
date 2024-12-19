Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC9BE7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:25:35 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.138057.1734639933914495007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=pN8VnLj1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202412192025315c9ab2d397dfae48a7-mfkz_b@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202412192025315c9ab2d397dfae48a7
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:25:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WFJAebSTIhKoSSwZ+/PYe4YSGZ11zJgfuOvqNNDRvv8=;
 b=pN8VnLj1EelLfUnkH44Rr3x2AmdtZu04c1PTiQfgFtQwl2bfKJEKakmejt5h2Tto7cZMvV
 dt2QqCmELBk3y8OWjHgEGnH3OSGc8O/c//rjuuKY+FCzh6dmlJrjuQkzFxH3ceO7oUxNspr5
 TlhvEJv0NzK/q6w/7xgL2GkJDNZ38SBNpMd/vhMl16lVw9qUL5BWhYui8AkL3PdpqGKTbV7T
 DKT/uE8hRb80DMEj4SraqaBHWxmmqtUUFHos1PN2J0DVPl6ssHH7bxZszWnHthW1EQ3kTtAB
 /5jD2cN5yj98QRKhoEUEWpZqnYv2eYl1nIR6Gcsck8VMnvhag5qlh2iA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 02/12] apache2: ignore CVE-1999-0678 and CVE-1999-1412
Date: Thu, 19 Dec 2024 21:24:13 +0100
Message-Id: <20241219202423.346033-3-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208935

From: Peter Marko <peter.marko@siemens.com>

These CVEs are specific to Debian and MAC OS X respectively.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index 7d6ea27e7e..475f77d41b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -38,6 +38,8 @@ DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 CVE_PRODUCT = "apache:http_server"
 
 CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows"
+CVE_STATUS[CVE-1999-0678] = "not-applicable-platform: this CVE is for Debian packaging configuration"
+CVE_STATUS[CVE-1999-1412] = "not-applicable-platform: this CVE is for MAC OS X specific problem"
 CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version (2.4.6) is not affected. It only applies for Windows."
 CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
 CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
-- 
2.30.2


