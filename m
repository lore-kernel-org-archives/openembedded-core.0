Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C24D58CAF
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 23:01:59 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5703.1774220516516907980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 16:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OTrr+k3E;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026032223015484595a15890002077a-knavqv@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026032223015484595a15890002077a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Mar 2026 00:01:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=VxJSPZ/XrSkntlQsGM8U12p7zJ2DFBVJAJ5fSC97N1k=;
 b=OTrr+k3Ed+W9p2eipHX1+euiywwNAWx/J9+JyPw9SiXzAbXi5oBuuE68DpQNmxPx8E38Uz
 Yw+JH5532Aeye3/yFg4uF0mXbPgu9sZFheGqCBfWPlPMAJyHXVhk9LlCV7Fp5XtZnXbCIWZC
 6mKpefOX8dzyUZ4Tky6ISgsRN/0fZtwpCnIPZXGtOV+82CszejHJBvr6MgrwPoM6IVLO1kLV
 hLu4y2GjsFBaY9XfZEWtjgO25SBDtStEhHGW9R9Dkzz1GyRlAb+62eZGQs9evNuMc+Ccx+sV
 jLgWHNXlCN8fhYBhVdJIv9n8qlY+Biy094a/yucuVlAaaqb0+kMJtglg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/4] nghttp2: upgrade 1.68.0 -> 1.68.1
Date: Mon, 23 Mar 2026 00:01:31 +0100
Message-Id: <20260322230131.12001-4-peter.marko@siemens.com>
In-Reply-To: <20260322230131.12001-1-peter.marko@siemens.com>
References: <20260322230131.12001-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 23:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233687

Fixes CVE-2026-27135.

Release information: [1]

[1] https://github.com/nghttp2/nghttp2/releases/tag/v1.68.1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nghttp2/{nghttp2_1.68.0.bb => nghttp2_1.68.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.68.0.bb => nghttp2_1.68.1.bb} (86%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.68.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
similarity index 86%
rename from meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
index dae7285c1e..71d5eef8d6 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.68.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "\
     file://0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch \
 "
 
-SRC_URI[sha256sum] = "5511d3128850e01b5b26ec92bf39df15381c767a63441438b25ad6235def902c"
+SRC_URI[sha256sum] = "6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2"
 
 inherit cmake manpages python3native github-releases
 

