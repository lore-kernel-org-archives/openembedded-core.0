Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD05CD6E79
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 12:05:08 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6548.1780661096949827364
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 05:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=K5QokJ4a;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026060512045318e653bbdb0002079c-8330t0@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026060512045318e653bbdb0002079c
        for <openembedded-core@lists.openembedded.org>;
        Fri, 05 Jun 2026 14:04:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=DJSZIVYSsu8G4R0roJCF06Ky42jf1Usf6/Dv+yqgo+w=;
 b=K5QokJ4aT7qW0p5105HScrtwGGtpVWlXrn3/d/9ag1QUrv1L8rDe4xZNR2tJczeHCYI8Ny
 1I0Y4IwzVw+N3UAA31D/J0aYQLZXaePCSlbr2msQ8cI0bvhLL5LaEZLYKlO75slnpc800Spg
 8kPx+gwU8QWB0KYp5mM/YjfTGojM5TLHTQvDTzxFKllRC0B17/YHr8U7RjH5xQyizqjiqIhS
 Z7vhR3Zjg2x3u14mhg1ysEsEXZBUmC/RhVehJPAP/Kq/scsufKhiUdO5rFxX2YAy7ARpuWJd
 x7a0SY20ZVxsDWPprkgLqPZTO/OWcrUHObivcZZXU9taLopRSASloorg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] vex: remove obsolete semicolon
Date: Fri,  5 Jun 2026 14:04:34 +0200
Message-ID: <20260605120434.130208-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 12:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238164

From: Peter Marko <peter.marko@siemens.com>

Usage of semicolon as separator in ROOTFS/IMAGE_*COMMAND was deprecated
long time ago.
Remove it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/vex.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index c57b8209c2..4c36cab581 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -211,7 +211,7 @@ python vex_write_rootfs_manifest () {
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest; "
+ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest "
 do_rootfs[recrdeptask] += "do_generate_vex "
 do_populate_sdk[recrdeptask] += "do_generate_vex "
 

