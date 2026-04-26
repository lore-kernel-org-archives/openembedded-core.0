Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B561AFF885E
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 18:51:04 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24921.1777229460259866558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 11:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Xzkq1sts;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202604261850579d4abeb572000207f7-e2q4nd@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202604261850579d4abeb572000207f7
        for <openembedded-core@lists.openembedded.org>;
        Sun, 26 Apr 2026 20:50:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KSTSxHdxBB4YMXP9EJ4giKXcWM8mpx/1ZLcbdJI6tnI=;
 b=Xzkq1stsO71t4xdcTRWivuq30mu8MaFd5vd/mfgnjx4MygNz0gax38MKIddIBgSvHH5Efy
 BKI2wOQFkb8pq9uL+v4B0UAph1GKFBegKCjnD36Ta6Ma9CPRB4hwh/90XBbCw9f0XGPJusAw
 oOUIguGt5DHoSevJ2JLwN1SlsY6/SRFHVwFTYcmL3egG5XiaZzNKXxBjj8g7U9LB1aO67lcG
 onb9UoGS8yByVT9oPZEE2q8+aSYq9bF6eKhlLRTciYje2da6iImbkOk0Iv7Vcg6Y+BVEH5KH
 b/fM2vw7A/uKhQIU4GNbWwIqVxjEqpAidJe4cs+KQG5dKRWZ6LNphhwg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/6] cargo: set status of CVE-2023-40030
Date: Sun, 26 Apr 2026 20:50:21 +0200
Message-ID: <20260426185025.13217-2-peter.marko@siemens.com>
In-Reply-To: <20260426185025.13217-1-peter.marko@siemens.com>
References: <20260426185025.13217-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 18:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235962

From: Peter Marko <peter.marko@siemens.com>

sbom-cve-check has problem matching version 1.72.
It works only if cvelistV5 is modified to indicate 1.72.0.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/rust/cargo_1.94.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.94.1.bb b/meta/recipes-devtools/rust/cargo_1.94.1.bb
index fc41a19a25..36ec346113 100644
--- a/meta/recipes-devtools/rust/cargo_1.94.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.94.1.bb
@@ -83,3 +83,5 @@ RUSTLIB:append:class-nativesdk = " -L ${STAGING_DIR_HOST}/${SDKPATHNATIVE}/usr/l
 RUSTLIB_DEP:class-nativesdk = ""
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2023-40030] = "fixed-version: fixed since 1.72"

