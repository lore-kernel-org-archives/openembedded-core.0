Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4914E7717B
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 18:26:22 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.44267.1733509582245582489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 10:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=SxUhmwex;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241206182619557197181c02825a28-0vmnbs@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241206182619557197181c02825a28
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 19:26:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MZ4hfJYvXYCxoy+bG1+RuYFWEOiYEVMX3N7glBJc2+4=;
 b=SxUhmwexhJ+3X9aSPjopkbJVlMVYljNq1x7E013EPumMo4oVASx+wq/soDD7KarXL+aDw/
 D51ghw3aFBC/zndGuI4wE3Z/KuIsKVVsOq4XpciATHOLNkSA06YHWA9ZrK+xFMT90GsrOYw2
 sYeNb+qfzpCG2JHEdjOLvDCnKoxN0bFWU+BeFzd1OUnoVIxJVWzvX7gjYtzg507+KpaxRRG2
 9ivh96JvXwaAE0u28PMHDmeOLLzYaDlIH0wpOpjd84JLbu3Ha67yXIuoXIkk6pOYy5lAZyOD
 ydc3Uje5rfWNggu0dhlOnO7ZkDjnwUq4QCyMiaTK/fJN5pg71D5sZi8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/3] tiff: remove status for CVE-2023-3164
Date: Fri,  6 Dec 2024 19:25:12 +0100
Message-Id: <20241206182513.11165-3-peter.marko@siemens.com>
In-Reply-To: <20241206182513.11165-1-peter.marko@siemens.com>
References: <20241206182513.11165-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 18:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208437

From: Peter Marko <peter.marko@siemens.com>

We have reached higher version than what NVD marks for fix.
So this explicit status setting is no longer needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 474fe1e8fd9..5b318d06219 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -16,7 +16,6 @@ SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue"
-CVE_STATUS[CVE-2023-3164] = "cpe-incorrect: Issue only affects the tiffcrop tool not compiled by default since 4.6.0"
 
 inherit autotools multilib_header
 
-- 
2.30.2


