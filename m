Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.10269.1617814092396877937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 09:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lUBLe-0003H8-QD; Wed, 07 Apr 2021 18:48:10 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1lUBLe-0000S7-Bh; Wed, 07 Apr 2021 18:48:10 +0200
From: =?UTF-8?B?VWxyaWNoIMOWbG1hbm4=?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] arch-armv6m.inc: fix access rights
Date: Wed,  7 Apr 2021 18:48:05 +0200
Message-Id: <20210407164805.1693-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/conf/machine/include/arm/arch-armv6m.inc | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta/conf/machine/include/arm/arch-armv6m.inc

diff --git a/meta/conf/machine/include/arm/arch-armv6m.inc b/meta/conf/machine/include/arm/arch-armv6m.inc
old mode 100755
new mode 100644
-- 
2.29.2

