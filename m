Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D29BC55174
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 19:23:23 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29029.1785698597187861865
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 12:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=k6LKMBFb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260802192314b3a6ca76cf000207e4-ee0ewo@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260802192314b3a6ca76cf000207e4
        for <openembedded-core@lists.openembedded.org>;
        Sun, 02 Aug 2026 21:23:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=PNApaZjaWAVylbBDnoWCimJMBPkCkwVrPIM8mONXmoc=;
 b=k6LKMBFbnYnCjjS3/Gm9AnaAdKQHoWz2KTmDEfSx2qwLK3g1JW11onc1YC8Supq2f1p9iH
 zz8CVwXuKshF+OJ6Dn4i+hV92sw0oOdpCbi9/l596Q0x77gMsr2ZBEDp8d1LLP+LHyFCHxwi
 h+ZT/bY3Bt4imAkoI9DLm06VRGqhNC1UJBpv7ziWicnHLhY+Iwg+z3OzWF6dC+ru4TdlYSSN
 ULoyeVKYRid58JaQ/b5fbirBFtpxS/ofO5csX3LHNdPFtuASAxc0oyXFF0fBFp/Ig6xMijkL
 DB+7LLSHn58E/tU6PDhRfJCILc3bC7mIu+vSWdMOFwzk6Cxl+y0jb9Lg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 3/7] gstreamer1.0-python: upgrade 1.28.2 -> 1.28.4
Date: Sun,  2 Aug 2026 21:22:30 +0200
Message-ID: <20260802192234.1725830-3-peter.marko@siemens.com>
In-Reply-To: <20260802192234.1725830-1-peter.marko@siemens.com>
References: <20260802192234.1725830-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 19:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242566

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 097965cc4e9bdeeb270a8f0540feb980996da357)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...reamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.28.2.bb => gstreamer1.0-python_1.28.4.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
index 181e3d8ea4..555b310594 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "12fdd8e19af97d797a6b2c195228e6c9edc4cddfa68274912b78ef66068ad822"
+SRC_URI[sha256sum] = "c4eb382720b4443fb801a53418dff0bd4cd7478716d5ced493504a675b4d09fd"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"

