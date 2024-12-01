Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF604D49780
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 18:54:33 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.156774.1733079271770978666
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 10:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=D61w3z9M;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241201185427dbb8f71adfe2d3fbce-kmujgd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241201185427dbb8f71adfe2d3fbce
        for <openembedded-core@lists.openembedded.org>;
        Sun, 01 Dec 2024 19:54:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=K2zL9m1aJ/nxvYDVnNNpWaf50xwR28fve7QGyiAxWqs=;
 b=D61w3z9MB/gqpqvBiZ1Fgw3oLkBc+PpbDq8NrqO1ityY9MI0pjGR8iR4XZNIbe5dw51o4m
 bfJfTsm9Brh1gAEmDV/n2VePRcqIaPPV630dNXX529lrd/s1Dh+DyRkZjtS0Jc4f3mT10RRY
 AhprivQGhEtEX+LEo/vLAVAftnkhg0vpuUozK/Q7puxtdxWt+ndWPGoAoUINHHv171uIpqxs
 Es7KmwLFE0+hD1HMe55h2PFRbOoWpzvFHZuol6PDjlu/+aFOxigxJy1OlUqCSkSNVb2KQ7dd
 tOVB9JSrMDqIK+0D8Qs3yXDWJSB2jyvHmd3jgTal2NsQFCMrGPXIZBrQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/5] qemu: ignore CVE-2022-36648
Date: Sun,  1 Dec 2024 19:53:35 +0100
Message-Id: <20241201185337.2675566-4-peter.marko@siemens.com>
In-Reply-To: <20241201185337.2675566-1-peter.marko@siemens.com>
References: <20241201185337.2675566-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 18:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208121

From: Peter Marko <peter.marko@siemens.com>

The CVE has disputed flag in NVD DB.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 1c0e8a93f1..cc78d7db06 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -148,6 +148,11 @@ CVE_CHECK_IGNORE += "CVE-2023-0664"
 # RHEL specific issue
 CVE_CHECK_IGNORE += "CVE-2023-2680"
 
+# The CVE has disputed flag in NVD DB and also descrition contains:
+# Note: This has been disputed by multiple third parties as not a valid vulnerability
+#       due to the rocker device not falling within the virtualization use case.
+CVE_CHECK_IGNORE += "CVE-2022-36648"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
-- 
2.30.2


