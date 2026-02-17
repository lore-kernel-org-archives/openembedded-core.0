Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92611E9A03B
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 21:05:39 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22629.1771362337385493375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 13:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=eWCQdlnu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260217210535d4aad512b1000207c0-bq9n5j@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260217210535d4aad512b1000207c0
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Feb 2026 22:05:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=D1WOvIyD8FioRDKB+9ljfbxkAJv85n7f3R4I9kETAag=;
 b=eWCQdlnuXILto92z55u9SwnHUZgKGRjgC2m5Di6oO6xYn30xLi1yjg3q2o81zHi9OrGj7l
 v3fUPTjcSFRo9i6beioerLG80c6nRCUMwKWS23xEM3a99BDfNMqEYoSqM4g5SJv2M4UtA4I0
 b2/4AFCW4s2AzEWU3zg8pWSXXrlAdu2x0eTDoDh4G58awtwkO0f3A8GoBIttIsrVCE7FiL4c
 RsGzIie6BSNA9umEwdd/WwKId7+59ME/D+TxiJyCDwoq/uPEDIfsFeTqJbahCOOFbhACxbBn
 KyvFQg7FltgaSFU6cFHdQ3oz3Ge0kYsaHbcxsTZmsn1IEA5j7t9c8hig==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] libpng: upgrade 1.6.54 -> 1.6.55
Date: Tue, 17 Feb 2026 22:05:30 +0100
Message-Id: <20260217210530.2657830-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 21:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231276

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:
* Fixed CVE-2026-25646 (high severity):
  Heap buffer overflow in `png_set_quantize`.
  (Reported and fixed by Joshua Inscoe.)
* Resolved an oss-fuzz build issue involving nalloc.
  (Contributed by Philippe Antoine.)

[1] https://github.com/pnggroup/libpng/blob/v1.6.55/ANNOUNCE

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/{libpng_1.6.54.bb => libpng_1.6.55.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.54.bb => libpng_1.6.55.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.54.bb b/meta/recipes-multimedia/libpng/libpng_1.6.55.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.54.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.55.bb
index b017be513b..c6e95e0723 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.54.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.55.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805"
+SRC_URI[sha256sum] = "d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

