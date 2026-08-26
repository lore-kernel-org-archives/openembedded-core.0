Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FADC61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:34:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7842.1787733261835274870
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gksmYdi9;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 388B21A1838
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07270604EC
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5211311C7AC8B;
	Wed, 26 Aug 2026 10:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787733259; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ck/6oqE+FanmIagBe6KXhZMoQpWv4WX1onghopggxIs=;
	b=gksmYdi9LVW9rldd2Z6M3n0zFt2vxMg7c7mQjoNfigERp47yi5sX1uVSCFGG1U1CFhRYyZ
	yGInU7VORiVSg/VZhm8ksBOaHaoB10pfpNOczo/9XY6cRonJ2kcWF5qXzTITOqkso36zMN
	Q/Dvanok3aTx/QXLM4HPRbFcwM6U3C0h4gBUvDFdpeyNGVdTZqF2a/FSqTAl5w+S6/QJtS
	hTdTC746y0h0KZYeLuD55Oz95p6wTrkYoeuT2SG0IOMayEcHjnfCG0pWJXBGOIeWsNF3s8
	PsD9N4MtYOrHGFvgQx0V6CVrJIEZhh4pm08wt9dfcGKfpnvjBbrV5akPe0/bKg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 26 Aug 2026 10:33:47 +0200
Subject: [PATCH 8/8] man-pages: upgrade 6.18 -> 6.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-mathieu-updates-20260826-v1-8-4082bbc152f2@bootlin.com>
References: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
In-Reply-To: <20260826-mathieu-updates-20260826-v1-0-4082bbc152f2@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787733232; l=1944;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=CJ3gfrtFOelXbwAMsLe0p/AHr+Sk6j+lVUR/6CkDbn8=;
 b=B4nnVPk52pz19MFZK8Ggmu9/Dlmmaw9ZOY4WEpGXZCAXb7sLYLDEzfiLIkODle+kri0PawinF
 uKxoSSdSKVqD3iBGedakzcQUrWkmOq6GQCnlcUHwZC+w57ZCyZ+RwKh
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244376

Changelog:

Global changes

- share/mk/
  - Use POSIX.1-2008's '::=' instead of GNU's ':='.
  - The <string.h>- and <memory.h>-related manual pages have been
    significantly rewritten.

License-Update: Whitespace changes
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../man-pages/{man-pages_6.18.bb => man-pages_6.19.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.18.bb b/meta/recipes-extended/man-pages/man-pages_6.19.bb
similarity index 92%
rename from meta/recipes-extended/man-pages/man-pages_6.18.bb
rename to meta/recipes-extended/man-pages/man-pages_6.19.bb
index 5d6504b85b6a..8aaf5271e126 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.18.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.19.bb
@@ -4,7 +4,7 @@ SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
 LICENSE = "BSD-2-Clause AND BSD-3-Clause AND BSD-4-Clause-UC AND GPL-1.0-or-later AND GPL-2.0-only AND GPL-2.0-or-later AND MIT"
 
-LIC_FILES_CHKSUM = "file://README;md5=e4d3c4124726a2b7763489612768c03c \
+LIC_FILES_CHKSUM = "file://README;md5=494f3aa5d486baf2068b41eb1eec4570 \
                     file://LICENSES/BSD-2-Clause.txt;md5=9e16594a228301089d759b4f178db91f \
                     file://LICENSES/BSD-3-Clause.txt;md5=407426fcc1a243b7b2eff6e35c56aca9 \
                     file://LICENSES/BSD-4-Clause-UC.txt;md5=1da3cf8ad50cd8d5d1de3cfc53196d01 \
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=e4d3c4124726a2b7763489612768c03c \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "09f975373336a7b44fc1770176f3d2238a111c34e24812ad3b63ec3328795c01"
+SRC_URI[sha256sum] = "fc0c620f07b4eba8ede128fbc267db5ebb4a67bab1aca3b01e5734956baf5572"
 
 inherit manpages lib_package
 

-- 
2.47.3


