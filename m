Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42E0FA373B
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 12:11:18 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3902.1767355869902915701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 04:11:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=CAiXElmR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260102121106b45289bd1c0002071f-3e1mhs@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260102121106b45289bd1c0002071f
        for <openembedded-core@lists.openembedded.org>;
        Fri, 02 Jan 2026 13:11:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2ytxzHSDI8jkX246u7UlJqUnkSB/5fPdBx1R77jF2jk=;
 b=CAiXElmRZegnGnZyHgLHfR2ngsubQZ+2FfxPXf4rSeoTk5JwivJcFxv7Q0iQGdqdNHNLOu
 YVsnAnwsLasSEgknu1VVOcvz892aLlBAtNqV9SwFC2295m51BtvIy0MVayuUPYy9I61WS0v2
 PXpgddaPGDwC/AWTEaePTnF/7NdvSN/2fwpaX4wEAZrtcO62E+Vk7A7zPp/pRgTj1NMfK/rd
 PnYxvGiS9PCgk7DCJ5hHHQy//zTQpbh6rqMTJ1G2g5Utz1SLgNB8xu9etpBf2rParRu//HfE
 /c7PLPIorrYjByzio9kkf8Oq1lL2QrfGaGYs69B1VrDO1SQhfMgPEqSw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 1/4] libpng: upgrade 1.6.51 -> 1.6.52
Date: Fri,  2 Jan 2026 13:10:56 +0100
Message-Id: <20260102121059.2321111-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 12:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228837

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-66293

>From Release Notes [1]:
  Fixed CVE-2025-66293 (high severity):
    Out-of-bounds read in `png_image_read_composite`.
    (Reported by flyfish101 <flyfish101@users.noreply.github.com>.)
  Fixed the Paeth filter handling in the RISC-V RVV implementation.
    (Reported by Filip Wasil; fixed by Liang Junzhao.)
  Improved the performance of the RISC-V RVV implementation.
    (Contributed by Liang Junzhao.)
  Added allocation failure fuzzing to oss-fuzz.
    (Contributed by Philippe Antoine.)

[1] https://github.com/pnggroup/libpng/blob/v1.6.52/CHANGES#L6307-L6316

(From OE-Core rev: 424c8aba2a52f464b2a652f56770437bdd08bf9e)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpng/{libpng_1.6.51.bb => libpng_1.6.52.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.51.bb => libpng_1.6.52.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.51.bb b/meta/recipes-multimedia/libpng/libpng_1.6.52.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.51.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.52.bb
index e499f61ff4..fba6e77b1c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.52.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709a90b8aded192bed2"
+SRC_URI[sha256sum] = "36bd726228ec93a3b6c22fdb49e94a67b16f2fe9b39b78b7cb65772966661ccc"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

