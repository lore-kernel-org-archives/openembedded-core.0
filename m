Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4C07D19E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 20:21:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45fq9p0rzqz56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 22:21:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562271662;
	bh=hD5gFAiK1ij/7Ux5FYO+GTtiSUclVWQpADbo0bB8yKg=;
	h=From:To:Subject:Date:From;
	b=G9Jc8UJ+VL1iWF8BnMx/rD4xPnh/Abjwdm8fmV08uNHQ67cp8G8Qza0E1Um1zm/ha
	NSvvgdkhJIUsuJFaecRBvaHOAeT5FIBTl2g9XbyoXSkDK10dYKRAwMcGS/9s5LozWZ
	ZnwTrVFSsauu6N4ahmej11nzHjeyWKJm5KoH93LJ5ZLdgjIK1AW7F2MfsWAuehJOu6
	Xb/0IGeIJHaSxB+tZLp+skVypjnMAJQsymSaO1P9u/O+Wb4el+g8c+YQH3Z+JJFREW
	FqO1Yrb7McRyMtc+5IADKK0i6Dzxj52dUGj9oe/XPVHKaF9hE69lJnaHe6GN8VdD9f
	utmPsjbmft0irYlU/68LRcbS29cv/O5zUe34cpTNVuRJLqb9x25b4qKdL6Zi+CQOmL
	kFMG2lqlKO2VlJkoXL70yPkzdhdwu4uDXCLnI8pQ4r880tMepjEaw5h4JmAxaYLok7
	ZbkkOHqldfQckYOgwkculKCnfo3bLN35heFojro49QOVsu7bheDWfUKTpp661M9ZsS
	VzqgAt23owpTTvd5sZZgnfDHEvfjuR6AoH4vhhG4d4n6C7FyNItifswvWuudRTctK1
	NcdoKFWIj8O87aJ5G9a4dylEbdX/CR3BaTHAR77M4v4fFY7rLd/ppsb+RcFriHjqTw
	U+er3SfjdNWJ+A3zpSs7F0Ho=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2019 23:21:01 +0300
Message-Id: <20190704202101.27521-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] i2c-tools: Add alternative for i2ctransfer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Jul 2019 20:21:02 -0000

i2ctransfer is now also provided by busybox.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
index 2b4563d4f0..dcbd05aed4 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
@@ -34,8 +34,9 @@ RDEPENDS_${PN}-misc = "${PN} perl perl-module-posix \
                       "
 
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE_${PN} = "i2cdetect i2cdump i2cget i2cset"
+ALTERNATIVE_${PN} = "i2cdetect i2cdump i2cget i2cset i2ctransfer"
 ALTERNATIVE_LINK_NAME[i2cdetect] = "${sbindir}/i2cdetect"
 ALTERNATIVE_LINK_NAME[i2cdump] = "${sbindir}/i2cdump"
 ALTERNATIVE_LINK_NAME[i2cget] = "${sbindir}/i2cget"
 ALTERNATIVE_LINK_NAME[i2cset] = "${sbindir}/i2cset"
+ALTERNATIVE_LINK_NAME[i2ctransfer] = "${sbindir}/i2ctransfer"
-- 
2.17.1


