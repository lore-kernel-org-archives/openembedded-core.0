Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577E8C369A2
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 23:03:16 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.21780.1744239786089733179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 16:03:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ed0JwwGu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250409230302d65cf5e294779a9f68-rouego@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250409230302d65cf5e294779a9f68
        for <openembedded-core@lists.openembedded.org>;
        Thu, 10 Apr 2025 01:03:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oykLohR5f3mSmf44ph/GZbgwTRSErraeeIsYXoDRc2E=;
 b=Ed0JwwGuuAUYC+rsVpIruhJB97USPWXgt4fxltAyCoGzRJkR/nZEKJjteVtIG0P1ymJyMC
 m5YdBKLJlevlwhNaqWnOvQZW5jJpaIXOXY6F275+b+a3GGXaQycrK8IMLh7HoCbVhX9fvhZB
 I0URVQ8wepoAYz9krSBwjSed+tKGfeFNvFPhb3OBf0oJ4S1KD/Y/UJs94XSO62K3jxx8XhAC
 49q/3H7LR11bXsVKaA3eKiA6cBXRGP8rwivcLib8ZO1pLejMlqe5Rpv/OJc3c9nJZ1/Su2Xw
 qaSFB2vg27eOC4sBcAcIdQdrHZxuUQLu0ThRSHM65Rva22PrAAnFMyNw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/2] xz: upgrade 5.4.6 -> 5.4.7
Date: Thu, 10 Apr 2025 01:02:15 +0200
Message-Id: <20250409230216.1874151-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 23:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214600

From: Peter Marko <peter.marko@siemens.com>

License-Update: homepage update in [1]

[1] https://github.com/tukaani-project/xz/commit/c5c091332c6953a0ce940cb355ea9e99491429fc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/xz/{xz_5.4.6.bb => xz_5.4.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.4.6.bb => xz_5.4.7.bb} (94%)

diff --git a/meta/recipes-extended/xz/xz_5.4.6.bb b/meta/recipes-extended/xz/xz_5.4.7.bb
similarity index 94%
rename from meta/recipes-extended/xz/xz_5.4.6.bb
rename to meta/recipes-extended/xz/xz_5.4.7.bb
index 3f82e476bf..53e5276951 100644
--- a/meta/recipes-extended/xz/xz_5.4.6.bb
+++ b/meta/recipes-extended/xz/xz_5.4.7.bb
@@ -17,7 +17,7 @@ LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "PD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d4378ea9d5d1fc9ab0ae10d7948827d9 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=c8ea84ebe7b93cce676b54355dc6b2c0 \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4378ea9d5d1fc9ab0ae10d7948827d9 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c"
+SRC_URI[sha256sum] = "8db6664c48ca07908b92baedcfe7f3ba23f49ef2476864518ab5db6723836e71"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 

