Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94725E9A04A
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 21:05:39 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22627.1771362330831195210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 13:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=biT7t+Yu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202602172105276785e7a225000207c3-4m3roy@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202602172105276785e7a225000207c3
        for <openembedded-core@lists.openembedded.org>;
        Tue, 17 Feb 2026 22:05:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=D1WOvIyD8FioRDKB+9ljfbxkAJv85n7f3R4I9kETAag=;
 b=biT7t+Yu27oUhhNchJ6i3b19HAdJKWox7q1N4c0tDdYvZPquFcQXuVrLUiEwl5Q5B+Yccm
 11ppTwvoKaCdsBxaR2k7ajo2FrvyM6dYSar1bVEIu/ZE4VDzFWmHnhBDg373Nukmq7mzkm8s
 FtrWJCKZwFw/MjVHzK59dU3z6M3sKO6nIONbRWIVvcnHc8lh/0Wf/efbaMVIffBAcnw7uJXt
 gNLpgUEEv3MAObNJpry92ok6TqYGmKLGs7JwAGbg1wv4NWiqmaL0+C9/d0E3O+y3E5dBdQqI
 UeCOZcAzBKEg8wxCpaB/ss3jwz6JXipMGTYawrpLzwnM5XLVkIVVxb5w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libpng: upgrade 1.6.54 -> 1.6.55
Date: Tue, 17 Feb 2026 22:05:15 +0100
Message-Id: <20260217210515.2657813-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 21:05:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231275

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
 

