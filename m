Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5574AC71135
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 19:15:58 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.15126.1750014947539352690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 12:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=v1Y330mV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-2025061519154144c25b80536ec82453-wm_quj@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025061519154144c25b80536ec82453
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Jun 2025 21:15:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=iTIc0Hilr4ZAJsc4Ym3aqgzPImmjPrZlt3uGt73IJsc=;
 b=v1Y330mV8FKfhOig9UgiH6FD+CMgbYrK1UEUuB+KOaaK1FVgWSh+fdK4gOtJ2vb5l2LvUh
 Hsn7ppUoo/X75lg5LxS59LP0chrFVvgvK/aZDJmCH2+9IuzSW2cAHodAYUmniPYNMhu6PRdE
 iLTCf9qp7CQT+TVvFrXlnBWQ/qqfEzOopWOS2yPO9i1jqB1G50pR/kaw+mTl4t72xnCp9oa/
 3V/x2wYig/SptkVz37t/gNXZoGiXjKwHBxYilF4Qmr6qB1e6P6dBiLrSdnNEVYEiPVImRSQq
 cNBOuxtc/OXBfkXXtlcOsjrn/l8GEHxXbsyRR95oeAmqBtAYgGSZ7nfA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] packagegroup-base: fix override syntax
Date: Sun, 15 Jun 2025 21:15:35 +0200
Message-ID: <20250615191535.1261591-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 19:15:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218748

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Looks like one more left over from the override syntax change.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index cb9d1f07af5..2e051dba33d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -119,7 +119,7 @@ python __anonymous () {
 # packages added by distribution
 #
 SUMMARY:packagegroup-distro-base = "${DISTRO} extras"
-DEPENDS_packagegroup-distro-base = "${DISTRO_EXTRA_DEPENDS}"
+DEPENDS:packagegroup-distro-base = "${DISTRO_EXTRA_DEPENDS}"
 RDEPENDS:packagegroup-distro-base = "${DISTRO_EXTRA_RDEPENDS}"
 RRECOMMENDS:packagegroup-distro-base = "${DISTRO_EXTRA_RRECOMMENDS}"
 
-- 
2.49.0


