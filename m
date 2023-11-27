Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D399BC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 19:38:10 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.104707.1701113882929955710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 11:38:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LQCQBD/D;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202311271937595c2791dd7bd7630e69-r9ckfo@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202311271937595c2791dd7bd7630e69
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Nov 2023 20:38:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9HintOCr0YtanCQXcn+FXlbIdtI/0NZNqFbZpMCub0Y=;
 b=LQCQBD/DOQ0AxE1kotRnI7aCwCO5WlpTTZ7VzzT5JKudm6mN1MoT+5ukSpvErvdYf9feGp
 6Uy7mFRANtNZitniO53Yw/Ui3/zF2ikAbFm2J2ppZ4aaFOOnqu9mlSkaetR6Un1di8NfOYm/
 7LLTzaJXJK9OwsqAL++7h8dXkdqp0=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 1/2] cve-update-nvd2-native: remove unused variable CVE_DB_UPDATE_RETRIES
Date: Mon, 27 Nov 2023 20:37:07 +0100
Message-Id: <20231127193708.427995-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 19:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191318

From: Peter Marko <peter.marko@siemens.com>

This variable is not referenced in oe-core anymore.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 67d76f75dd..64a96a46f0 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,9 +26,6 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
-# Timeout for blocking socket operations, such as the connection attempt.
-CVE_SOCKET_TIMEOUT ?= "60"
-
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
 
 CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
-- 
2.30.2


