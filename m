Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B93CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 07:25:37 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.160147.1712733926549870825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 00:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YKxl2CQx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2024041007252297c159d30cc4bdc6b1-6mb2kn@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2024041007252297c159d30cc4bdc6b1
        for <openembedded-core@lists.openembedded.org>;
        Wed, 10 Apr 2024 09:25:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RfVMfpmNMVQjoqGUoh3y1wTKqsdTX0K3llA25eKwtU0=;
 b=YKxl2CQxDryzxmoUp7hj7qN3oXodOka/T8kH0LlQOF3Nl+3kpxWsLYwVEnmhWSXChl3GvG
 jLUzd1pNBeKBFKHYv7tgz2gVKkkNZdVWFXdfT0DR5H2Iqz5MdjBT1vZWm8/hjfPgQ4xVw3xR
 cu6ypR8wtr5mUezNemG15VjfgVAIo=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] update-rc.d: add +git to PV
Date: Wed, 10 Apr 2024 09:23:51 +0200
Message-Id: <20240410072351.11628-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 07:25:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198084

From: Peter Marko <peter.marko@siemens.com>

This hash is ahead of the tag, so adapt PV accordingly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index ba622fe716..27723c88ef 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f5354
 
 SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master;protocol=https"
 SRCREV = "b8f950105010270a768aa12245d6abf166346015"
+PV .= "+git"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.30.2


