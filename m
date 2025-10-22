Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525BFCCD1BB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 19:12:56 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.3140.1761160369657190902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 12:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ZYLIqbm9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251022191245b190b6f2c80002079d-65iefo@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251022191245b190b6f2c80002079d
        for <openembedded-core@lists.openembedded.org>;
        Wed, 22 Oct 2025 21:12:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=IlayosRRgTey+30F6AnW7vDDJhvRCidkSIR2iMGBEC8=;
 b=ZYLIqbm9nIS1Imy2+W7m/iiQmCcAyZMs1G4zveYYdHoD4XfABBDUCCLMcOMZ5oITonFoPx
 +yxJyJQXnAmQ5Jeu3y7eu8g7i1ZwzNmGB7cRsyAu5Vl+ZyJWEXKBj6/DbBSqdo5l/5JAy4wV
 yv+UbP3oXW48FST+mGvr0ZcB4juFI4j1jSgYLq23X8fkDj6GpN2orYmSqCt+2KtoBWzvAA+j
 6LGQ7L6Hua3YCBPiqEwipAe3CZTt65IV1j00qzJsYf+hpaiv3+g2U+uloltjxzEs1hChSpcN
 SX9cDr1CSPHbofUdeLygS7zurpf+N0rLQ6nRx8ATyCVFptXPR/yqyqLw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libarchive: upgrade 3.8.1 -> 3.8.2
Date: Wed, 22 Oct 2025 21:12:37 +0200
Message-Id: <20251022191237.4110217-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 19:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225208

From: Peter Marko <peter.marko@siemens.com>

https://github.com/libarchive/libarchive/releases/tag/v3.8.2

Libarchive 3.8.2 is a bugfix and security release.
Security fixes:
* 7zip: Fix out of boundary access (#2668)
* tar reader: fix checking the result of the strftime (#2719, CVE-2025-25724)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/{libarchive_3.8.1.bb => libarchive_3.8.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.1.bb => libarchive_3.8.2.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.1.bb b/meta/recipes-extended/libarchive/libarchive_3.8.2.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.2.bb
index 69520b1bad1..d4f367009a1 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.2.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "bde832a5e3344dc723cfe9cc37f8e54bde04565bfe6f136bc1bd31ab352e9fab"
+SRC_URI[sha256sum] = "5f2d3c2fde8dc44583a61165549dc50ba8a37c5947c90fc02c8e5ce7f1cfb80d"
 
 inherit autotools update-alternatives pkgconfig
 

