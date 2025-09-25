Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68FFCAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 16:13:13 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.1053.1758816786929535713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 09:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OjhTQED5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202509251613044f8d8d72590002078b-mmuivh@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202509251613044f8d8d72590002078b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 25 Sep 2025 18:13:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=YRxxBuwWKEnkvnnWmcJYwh5vFZh6Fgk2pxKlXwZAvhg=;
 b=OjhTQED5ZvdDErikVHsavCBl3STcMxzJVFFgX0upSyVqYrmggC2U+6fY7X3caK5bBV6yOW
 iiLgEZGwdwDi1LA5vcl2kWBRTH11elrGC9y807HV/mRI5k+1Cdq6JBVEj61ovtkJZ0EWaxr4
 e7y14XZ7hoEbkt42yuQmKAYGjiZL5pT6wAUl3E89b6ZLfduUaEe8tgAQQ0VAM+FZEcOTJh7O
 qJVWjIGONztrk4O8HW3u4Ry0IB7iQALkLtLR6OurNZtdkqUjSySj00HuwDsA/w53nmAug2Dh
 6R1EcNNBAlVMyct72zvX3AvfgTvJhnNCrIkeQsdjxCs3OwAYAf6ldc1Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] tiff: ignore CVE-2025-8851
Date: Thu, 25 Sep 2025 18:12:05 +0200
Message-Id: <20250925161206.975177-2-peter.marko@siemens.com>
In-Reply-To: <20250925161206.975177-1-peter.marko@siemens.com>
References: <20250925161206.975177-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 16:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224046

From: Peter Marko <peter.marko@siemens.com>

This is fixed in v4.7.0, however cve_check cannot match it as NVD says
"Up to (excluding) 2024-08-11".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
index f46c806cf25..0d4b3a4abd3 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
@@ -20,6 +20,7 @@ CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://secur
 CVE_STATUS[CVE-2023-52356] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
 CVE_STATUS[CVE-2023-6228] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
 CVE_STATUS[CVE-2023-6277] = "fixed-version: Fixed since 4.7.0, NVD tracks this as version-less vulnerability"
+CVE_STATUS[CVE-2025-8851] = "fixed-version: Fixed since 4.7.0, NVD tracks this as fixed in 2024-08-11 vulnerability"
 
 inherit autotools multilib_header
 

