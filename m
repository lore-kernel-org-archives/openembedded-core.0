Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15430.1794778907775812506
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=F5l3K8vO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261115214145a97229ad2700020781-qjdv01@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261115214145a97229ad2700020781
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:41:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mC32MK/tPwKuld9hFMoROlWYPoco/EaQIcRV5TtxbGM=;
 b=F5l3K8vOeKiD6VEPdLOCSRxH891RVOcfnfwAOs1IMhhJ8G2s07iidtYyvV9q54PW2FWmmN
 +h/3yfDyggwsdKSX/SEcq3Orim2/8cBhjYFOhCE0lGxteuyC065eb4osRXa/gOHA4ExFFIWV
 FAJKL+2cyi5Dro0lMFDNnh120J0zkyDWYkAxL+8Om5Wu9KFo7VJxd9E+pm1e6Wy0jxGnDbym
 aPfcNRb0aWd57ryMfJeTS/Ex3KzbcgWT2yPtRtp8pUWSvZ/uCxUP34XGtVq1GltIRa0Hx25H
 sDBL1FlvaXQxSBVrdUdtDwkK9Z/k/qF/MfbopQ5wppRkSC04trKhg2ww==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 5/7] libxtst: Upgrade 1.2.5 -> 1.2.6
Date: Sun, 15 Nov 2026 22:39:30 +0100
Message-ID: <20261115213932.1652076-5-peter.marko@siemens.com>
In-Reply-To: <20261115213932.1652076-1-peter.marko@siemens.com>
References: <20261115213932.1652076-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250287
Content-Type: text/plain; charset="utf-8"

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

libXtst 1.2.6
parse_reply_call_callback: reject zero-progress RECORD reply elements
parse_reply_call_callback: check element size against remaining reply buffer
gitlab CI: drop the ci-fairy check-mr job

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 39e26025d22d408ca4d6bb36e80e506ac4da0848)
Handles CVE-2026-109088 and CVE-2026-94286.
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../xorg-lib/{libxtst_1.2.5.bb => libxtst_1.2.6.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.5.bb => libxtst_1.2.6.bb} (86%)

diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
similarity index 86%
rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
index df381b7d655..a59c5c69963 100644
--- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.6.bb
@@ -15,6 +15,6 @@ PROVIDES = "xtst"
 PE = "1"
 
 XORG_PN = "libXtst"
-SRC_URI[sha256sum] = "b50d4c25b97009a744706c1039c598f4d8e64910c9fde381994e1cae235d9242"
+SRC_URI[sha256sum] = "f94f0b37c07d80d877f3eda2c2405cc7e62aa9842f6310354aa349e3d66a4fe5"
 
 BBCLASSEXTEND = "native nativesdk"
