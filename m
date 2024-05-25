Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24556C25B78
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 10:49:46 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.9002.1716634168921641470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 03:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=oIZC0Csz;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024052510492618260d179d1ad808a1-mtjhim@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024052510492618260d179d1ad808a1
        for <openembedded-core@lists.openembedded.org>;
        Sat, 25 May 2024 12:49:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=M/WzgDFcZ0U0ANdXmk+5sYDMU83ACiRS3gAt3JZXoME=;
 b=oIZC0CszDSIi5ZS2giCDCG7Bs6aJGN7FBOSmYI/42+0r+QmZQeVXc77454SUZ/Ra8wm5++
 718ZnbqYSfCjyKY1pGDkA2jA5XZabvwzgvEONz1IsQy/u2NtLJhpBAt7bct152pQThUD8E5A
 lqb/FxMxX9S5DoXbY5Z1w6whjrehc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Simoes <ricardo.simoes@pt.bosch.com>,
	Mark Jonas <mark.jonas@de.bosch.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 6/6] libusb1: Set CVE_PRODUCT
Date: Sat, 25 May 2024 12:48:38 +0200
Message-Id: <20240525104838.619254-7-peter.marko@siemens.com>
In-Reply-To: <20240525104838.619254-1-peter.marko@siemens.com>
References: <20240525104838.619254-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 10:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199871

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

This commit sets the CVE_PRODUCT variable to "libusb" to match the
product name used in the NIST CPE database [1].

[1]: https://nvd.nist.gov/products/cpe/search

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libusb/libusb1_1.0.27.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.27.bb b/meta/recipes-support/libusb/libusb1_1.0.27.bb
index f2431d75c8..5bf854f95d 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.27.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.27.bb
@@ -8,6 +8,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
+CVE_PRODUCT = "libusb"
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
-- 
2.30.2


