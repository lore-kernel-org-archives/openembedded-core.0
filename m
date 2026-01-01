Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8EBEED630
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 17:22:46 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2714.1767288162769927093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 09:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dwER0Cq7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260101172239bc8e9da0f4000207cb-uwczxb@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260101172239bc8e9da0f4000207cb
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 18:22:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=e629ye0vQSNxL5Cc87jPRhcpyz1U0t/n473DAKp6tps=;
 b=dwER0Cq7q2HSxixHetUtPAYPfPPw+r/aCgXfA6h8cT2s7O8d0devv8a0KBVbVaxtXIbPX2
 Px+mRHOPlh3zT1yuMuhNeyrLm29Ve4p6qGqWZ3ofetRuxlvHmoxu6/jgCJtgQmCW6lgue9DL
 NDdHPHIEEyyFC0hHpsLdEo1OqYiWtQaKbAgRtKM+rXDR68vh1u5Z34JYAf3FsCOUGmqc4EEO
 x34n+PCZCqaySgrafXvQV7rKRF106EzvA+boh3oQtnM5Gy6IRUowqB8/G+kTIElM6U/MNCUh
 O6iDUUP1xUi82bzgFWTg27NP7ZLC+4njGOHkorPe0HCsPXbH3c9JHe0Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libxslt: mark CVE-2025-7424 as fixed
Date: Thu,  1 Jan 2026 18:22:35 +0100
Message-Id: <20260101172235.4145512-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 17:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228825

From: Peter Marko <peter.marko@siemens.com>

NVD DB lists this CVE as version-less (common for Redhat CVEs).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.45.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.45.bb b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
index c3440a99d4..449ea2dd24 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.45.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.45.bb
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "9acfe68419c4d06a45c550321b3212762d92f41465062ca4ea19e632ee
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
+CVE_STATUS[CVE-2025-7424] = "fixed-version: Fixed since version 1.1.44"
+
 S = "${UNPACKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"

