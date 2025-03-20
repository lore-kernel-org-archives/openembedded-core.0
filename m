Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAB41C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 23:13:15 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.8790.1742512387706742712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 16:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lkmBV55f;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250320231305de45618a844936709e-wwspea@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250320231305de45618a844936709e
        for <openembedded-core@lists.openembedded.org>;
        Fri, 21 Mar 2025 00:13:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4TJ0TajV2OY4OBkPqGmuB1GsPtoooOYKp3UlX3Cyvv4=;
 b=lkmBV55f+IqXcsU4FRUh7uAxzembZndgS0abpfeEkN31OkHw0pn9/aD8lh9cJTFb3pZ9G6
 OmJjjX2ef1yIPp+HwX+BOrvZDiAHidHvDTb2iJbLj0ckxdOrZLKlQ8nXxjCSvi7B+F5BfgVY
 MB/+NjDCDfKAnu99qmdFyIjPt+BLiK0C0n/9ELRs/nQoOGZphjPV3761KGX+NYvYE7HxK1bV
 HpL2BjUN+pcwDzkBezVuhTNmzA1smDiCwXwUBDKhUEbkps6IiPDPDOy/7cVRixMY+tery9Re
 BhltnVI/kC7NzFfnDOxPV7IwStQ9HF0AA14hztWgXp4fycEN5jz3F+gQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/4] libmad: ignore CVE-2017-11552 and CVE-2018-7263
Date: Fri, 21 Mar 2025 00:12:06 +0100
Message-Id: <20250320231208.1692902-2-peter.marko@siemens.com>
In-Reply-To: <20250320231208.1692902-1-peter.marko@siemens.com>
References: <20250320231208.1692902-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 23:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213430

From: Peter Marko <peter.marko@siemens.com>

These CVEs are for mpg321, not libmad.
See Debian assessment:
* https://security-tracker.debian.org/tracker/CVE-2017-11552
* https://security-tracker.debian.org/tracker/CVE-2018-7263

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index d7cd38fcbc..2d63f9a804 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -36,3 +36,6 @@ do_configure:prepend () {
 }
 
 ARM_INSTRUCTION_SET = "arm"
+
+CVE_STATUS[CVE-2017-11552] = "cpe-incorrect: this CVE is for mpg321, not libmad"
+CVE_STATUS[CVE-2018-7263] = "cpe-incorrect: this CVE is for mpg321, not libmad"

