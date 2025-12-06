Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19ACD3B7E1
	for <webhook@archiver.kernel.org>; Sat,  6 Dec 2025 20:48:33 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14865.1765054111207739805
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Dec 2025 12:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=FphFKAKQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20251206204827246a24f8e200020741-bbfjab@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251206204827246a24f8e200020741
        for <openembedded-core@lists.openembedded.org>;
        Sat, 06 Dec 2025 21:48:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Nb74+gRwpa1hCPbNmA2NrBUEqEVGl7Z9xmOuhbUfHu8=;
 b=FphFKAKQ1AqBLmAP99jcFEdkIrqGxWzDZjBZ/DqeApvasCVzJvkSBN7WEo+vDJX1tZffPG
 DbFvYDNpvUIWLZSvJbR6BVdHjRiBmDjSK1njymNIjVZwXAQSX2m/98rw1X65J4lJiT6YRjUx
 brkoHKu/XvFhnb/NZVf9pwsOuLG1raw8g/h1joZ8x4L7yE3l+lT6JyKzf67+1TLFufkaFVE/
 CQxITdrlDHFPwAeegnGcj+kqobP33VESxMbJHHv+fOiBn2N+K7fwjcix7h98bbVJkxASwsDF
 WeS+r93eoEzZ/IqU6T96Z0PPXlsVa/NJPAJSFW8elJJHiYCRokB83Oew==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libpng: upgrade 1.6.51 -> 1.6.52
Date: Sat,  6 Dec 2025 21:48:24 +0100
Message-Id: <20251206204824.65370-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Dec 2025 20:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227370

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-66293

From Release Notes [1]:
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

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
 

