Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBEBC3DA7F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 21:47:42 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.46220.1723067260058223429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 14:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BOPLVTD6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2024080721473798ca632dbe2f81ac7d-1l_dsy@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024080721473798ca632dbe2f81ac7d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 07 Aug 2024 23:47:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WF1USCGGKs6pEhV9bfvTCv4oO73PR2y3mkaWR6NDGZU=;
 b=BOPLVTD6hrf0zVkzcOeBMsopIFzndoMGdWhLcpLaGcoL7VXUm2eSClFYfYa2cZsVCTtPL4
 3odiMKNeiMoZQ4rIoIpk0PajblfTwd//wgGVxfB9GaPjH71Ejmb1NklHQbaGcV0+5hSFbjgG
 mQH4QW6zzsAX+PT3RrvRPL4IxkykbuexHxNUpJeuN+vL/8rtrgAC0+W9khz+Z/ltPYqdIzua
 dinsj2hqB/MjVtx2GgEMICwmQgsPWwwJzfU8QjoXXifetPoVDsvEh9AkkbKY66PkowYbUU8G
 dSoZNdOR9hHx3EJqxnrKdKp9fukNeNeYRGqBFYYwLDKXuX9Jo5jG7otQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libyaml: ignore CVE-2024-35326
Date: Wed,  7 Aug 2024 23:46:46 +0200
Message-Id: <20240807214646.10715-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 21:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203097

From: Peter Marko <peter.marko@siemens.com>

This is the same problem as already ignored CVE-2024-35328.
See laso this comment in addition:
https://github.com/yaml/libyaml/issues/298#issuecomment-2167684233

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 1c6a5fcb45..334d9113d2 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,6 +18,7 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
+CVE_STATUS[CVE-2024-35326] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 CVE_STATUS[CVE-2024-35328] = "upstream-wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


