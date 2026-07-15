Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92549C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 21:02:38 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1111.1784149355503216208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 14:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fNrpeKoU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026071521023324697ba0740002070e-z5k5cj@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026071521023324697ba0740002070e
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jul 2026 23:02:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VTF4TRChFKQRcpbiAFA3T/XbDvcTtkrFXG2hk5QMmao=;
 b=fNrpeKoUJGQn9U2Ul6P24RaDZ2L+SkxMB6tShjWG5MdM5s5aaVKpljsP1OLrVp9w4EpP8g
 eeVfleOUrRfsDiJyNggIsXHsMdx9xIahmVxx9aj+I80uz/wU7D3z7WJwh1MuGGD6k5Eb+qKK
 A08OT1ijSu6KnSqrkyFFEZ/hQU/YR6F32jeOq+JnI46r+g0QpaSOBtM0n8co/O5TICS9dylS
 od7P+rXRFdwVlDgpktT7NR3FOwnPH2RGjzwNowZKeR6ToL+8F1L+sgChWmGjzYH6SzDRUAlk
 VzXhCCSH8FU/GDrey1CXchU5aAu2c2zKTFEpPAH9EoYPZd/VStDyQNmw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/2] vex: remove obsolete semicolon
Date: Wed, 15 Jul 2026 23:02:07 +0200
Message-ID: <20260715210208.4995-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 21:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241038

From: Peter Marko <peter.marko@siemens.com>

Usage of semicolon as separator in ROOTFS/IMAGE_*COMMAND was deprecated
long time ago.
Remove it.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 311d418d22a609fb54b87bfc909bdd1861892228)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/vex.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 45a15348724..eac68ca6289 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -229,7 +229,7 @@ python vex_write_rootfs_manifest () {
     bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
 }
 
-ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest; "
+ROOTFS_POSTPROCESS_COMMAND:prepend = "vex_write_rootfs_manifest "
 do_rootfs[recrdeptask] += "do_generate_vex "
 do_populate_sdk[recrdeptask] += "do_generate_vex "
 

