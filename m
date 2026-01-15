Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A40D3CC8D
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 00:25:08 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25180.1768436705976715311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 16:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PclguJpQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260115002503714b34572d0002073b-xllljr@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260115002503714b34572d0002073b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 15 Jan 2026 01:25:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wkCCHvtLI5jC96bgKUttq1kcsit+P3KqRg1f9EbRf+A=;
 b=PclguJpQZnbL3Ezk9WqgsvCcIjzDuiO8GNZwaDku1q2+T+8+OSjsA4kaHyJ9xYqKoILH0i
 oDjeDyEgpj9ASd6L72iif75G3LMvNwcSdaT3b6T2Llns1P1IOC3UmHODoug1H+FvXl51l7bX
 ui0QuJ0/wZS5s6OlinhbbI1mnkM6ml1dsJdSdIPMhEcnLMgB5h5vCTtlBEsmaYDEA1bnkCeg
 GJg8Aw9S4AzSGc7noGVZ4mmoL5OnO8XLH5Aw0fuVCW9TzSWldlm8VzheGr2STS28FnHLQwsn
 M63w1thEVSK2QkLsEg+PwbhfZUIwftofRwfdFUtjzkFGhhERdju9GmlA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 1/2] libpng: upgrade 1.6.52 -> 1.6.53
Date: Thu, 15 Jan 2026 01:24:55 +0100
Message-Id: <20260115002456.49151-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 00:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229373

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/{libpng_1.6.52.bb => libpng_1.6.53.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.52.bb => libpng_1.6.53.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.52.bb b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.52.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.53.bb
index fba6e77b1c..956cd243b1 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.52.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.53.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "36bd726228ec93a3b6c22fdb49e94a67b16f2fe9b39b78b7cb65772966661ccc"
+SRC_URI[sha256sum] = "1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

