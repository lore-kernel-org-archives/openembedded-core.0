Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B26C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 20:22:35 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.18773.1744230154147243770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 13:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ST70h8yQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025040920223010c99c277137a650a7-_pjz9x@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025040920223010c99c277137a650a7
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Apr 2025 22:22:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ewb5+x7pdJ2yi8gzkxQ2B+w1llMmXDT1xf/J/RfdfGE=;
 b=ST70h8yQZkj9jFbmCkDBFOtKEddadqsV4h3okFLA8x+P31b8UH93zAjgoK3OPh0QJMxbv8
 yINuF3/pKtGA+Gb03VuojN0WEiH31bwYWZtzuLoeaWSFJWdxjkk/OYZRxIc3eKPAuS44yJJY
 GjDuMa15gdy+DJ31DGRE1TS+S1ATZFP/1Q/My+EuMFtOLpCCbusNfWYePy9TMO6jNG2pHnKq
 RZcuUCeWBforLyAmq1Bb15iWt+edEctsv8ti2e26onxZ+Rr8aENcVW2dySUg6KhuErmEk5f/
 /D7WxZJO548aW0YYLY/72gsUVf46V+4OImBKjU6eKEeqNZdtxQbSV9qQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] xz: upgrade 5.6.4 -> 5.8.1
Date: Wed,  9 Apr 2025 22:21:41 +0200
Message-Id: <20250409202141.2025613-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 20:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214597

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2025-31115

License-Update: add help note [1] and remove note for old releases [2]

[1] https://github.com/tukaani-project/xz/commit/6bbec3bda02bf87d24fa095074456e723589921f
[2] https://github.com/tukaani-project/xz/commit/70f1f203789433b5d7b8b22e1655abc465d659f7

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-extended/xz/{xz_5.6.4.bb => xz_5.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.6.4.bb => xz_5.8.1.bb} (94%)

diff --git a/meta/recipes-extended/xz/xz_5.6.4.bb b/meta/recipes-extended/xz/xz_5.8.1.bb
similarity index 94%
rename from meta/recipes-extended/xz/xz_5.6.4.bb
rename to meta/recipes-extended/xz/xz_5.8.1.bb
index e48f4dbd7f..406ecbbec4 100644
--- a/meta/recipes-extended/xz/xz_5.6.4.bb
+++ b/meta/recipes-extended/xz/xz_5.8.1.bb
@@ -17,7 +17,7 @@ LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "0BSD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=d38d562f6112174de93a9677682231b2 \
                     file://COPYING.0BSD;md5=0672c210ce80c83444339b9aa31fee2f \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=1ebbd3e34237af26da5dc08a4e440464 \
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "269e3f2e512cbd3314849982014dc199a7b2148cf5c91cedc6db629acdf5e09b"
+SRC_URI[sha256sum] = "507825b599356c10dca1cd720c9d0d0c9d5400b9de300af00e4d1ea150795543"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 

