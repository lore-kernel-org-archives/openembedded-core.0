Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8636C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 21:02:18 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1104.1784149331713399499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 14:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CPIw/43+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260715210207affad49e6f000207db-nel9gi@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260715210207affad49e6f000207db
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jul 2026 23:02:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ig9r+vacC/bLBEQHEDdjkCJsW3cykvKaLg65HpASZos=;
 b=CPIw/43+2S25v8YQyR9eFxAl1n6sZx0wnW2Dmubn9XBpa5CVec7RYoUyRp3/LZX9b3cxPA
 gWVo7r9XZZtiBQe4N7I7Gkjab2qDmyMLWNztsWTdFErjNGTaiLU+F9T9kUAoj2oStUv/FcQ8
 FlOC4mZ4JPwxL6qSh7G2k1EBSCNBzC3Sldo/a5owK02+2K5ZpX3lH0UweBxjWgJMvlvQR7fM
 IUwiwpuz9D9GJ5y80xdssYyR4UmZGbc0NojrwDiEiGzULiP+uvpfaF5Go6fb6hIf/OgrMIsA
 XEeIGOH2rUNp12cHR94HwCBSm67sGcvvx8TvNg5NR3Ux9MIoDIBHwLsA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 1/2] vex: remove obsolete semicolon
Date: Wed, 15 Jul 2026 23:01:31 +0200
Message-ID: <20260715210132.4974-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 21:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241036

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
 

