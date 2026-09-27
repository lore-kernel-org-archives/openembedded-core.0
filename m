Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6BBC9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 19:38:10 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42566.1790537887158383304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 12:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RFFL2nFA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202609271938057f0634984e00020758-cg3ypg@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202609271938057f0634984e00020758
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Sep 2026 21:38:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=F7rqOX2RTmOo9h7taBPXU48PfXHAL5JMt5DEMRXm7dM=;
 b=RFFL2nFAextL6f4OqPuaygo3eZZA/cDFqQZunXTiW3y9ITxADZy/IAwf1rf6AyrWV6ipi7
 oqLKVm2TYVlBLJCJTWWWjPV9uPfkPjcvvDmtmQCU9QTBglE8fYDQ/BwKYyRMj4VHq6L1Jwz9
 bCeTQ5jOqFqKYkgh3FNBaayRpqmpu788WtqzOYAm7PNgVSqCw5orNR39P8xw4Lz8ojyxaxEz
 Y43VOhAiFSwIfoyq16wgLmP0dPAcBmNgxzuYFggre7+S5VbjFS5Hft/oIJ+8nh0SYGMmgip1
 /ZTnm5obDhHyopBKNXR6Y3rXhxCVmFt/j/UppzsqNG/IiED+ruMPyyDg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 8/9] bluez5: set status for CVE-2026-19774
Date: Sun, 27 Sep 2026 21:36:08 +0200
Message-ID: <20260927193609.359250-8-peter.marko@siemens.com>
In-Reply-To: <20260927193609.359250-1-peter.marko@siemens.com>
References: <20260927193609.359250-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 19:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246714

From: Peter Marko <peter.marko@siemens.com>

Per [1] this is fixed in 5.87.
NVD tracks fix via hash, which cannot be used for version comparison in
sbom-cve-check.

[1] https://nvd.nist.gov/vuln/detail/cve-2026-19774

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.87.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.87.bb b/meta/recipes-connectivity/bluez5/bluez5_5.87.bb
index 687780de21..08682b70d8 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.87.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.87.bb
@@ -7,6 +7,7 @@ SRC_URI[sha256sum] = "26bdcf2cebd7310c6f598850606b037ef0c515fe6608ebc54d22c50c4c
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 CVE_STATUS[CVE-2020-12351] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 CVE_STATUS[CVE-2020-12352] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
+CVE_STATUS[CVE-2026-19774] = "fixed-version: Fixed from version 5.87"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support

