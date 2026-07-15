Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4F9C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 21:03:18 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1121.1784149391784281578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 14:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZvnVRRfs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260715210309e61db125cd00020746-vdqybm@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260715210309e61db125cd00020746
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Jul 2026 23:03:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3rliYb1DwtNIJx0Vodj7HsTrbQWRWWk4Xc0GKUnq32I=;
 b=ZvnVRRfsu01Nz21FxZq6NbtdmIyXcQLkIzC2ONqMyfk1d1yGGoIVL6fIOjbhq8mBC7XqAR
 yy+Hocy53tVRL2grTpLdbtBE3uq4Zs5PCNx1ZGV6XT8KF3V/7Kkn1sJFlTu0rQ+xWs9YNFVm
 xyMnd9jeLJ3bQpGvSzqC5p+8ZFoUl67sz80gBZe5ItsD7K6Dr3VioQhaK4aoCj9VFCx7MpGn
 nCbPpGgzk5vhySvP4y8hC/C3Z3dG/KCjQQb0/d0miybSeuIlXTIFG5mB2hrpg+Cz9Y8t1R17
 DG4KJ3SxeNL1GEW6qxI51uw84OodLe9kDrd8n8UwLgw7Cp7MRwTXsiSA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 2/2] flac: make documentation build deterministic
Date: Wed, 15 Jul 2026 23:02:41 +0200
Message-ID: <20260715210241.5032-2-peter.marko@siemens.com>
In-Reply-To: <20260715210241.5032-1-peter.marko@siemens.com>
References: <20260715210241.5032-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 21:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241041

From: Peter Marko <peter.marko@siemens.com>

doxygen is autodetected (e.g. from HOSTTOOLS or a transient dependency).
Add a knob to make it deterministic when the documentation is being built.
Keep it disabled by default to preserve current default behavior.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: facd4a7561f9e4c8b4b36329115634a586a0f7e1)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index a667ea9f62..d55e157a9d 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -34,6 +34,7 @@ PACKAGECONFIG ??= " \
     ogg \
 "
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
+PACKAGECONFIG[doxygen-docs] = "--enable-doxygen-docs,--disable-doxygen-docs,doxygen-native"
 PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg=${STAGING_DIR_HOST},--disable-ogg,libogg"
 
 PACKAGES += "libflac libflac++"

