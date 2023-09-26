Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FF4E7F12C
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:13:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.2880.1695762799822432136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:13:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A6nAAwRi;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB7E01C0004;
	Tue, 26 Sep 2023 21:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695762798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/IW0Fan2GwqwtU2vnOBH5VpnRJFTq7yf/H+flbyv8TY=;
	b=A6nAAwRi0o4LSQyvqKjvP2xm849olpP2Rz7LkqSmoQupIwa5a6Te4GUgVev5MLPhnlhetl
	LVsiBuMZ29dDeN/mgUb+QU+FByNzE/hOpL4BRiC7Yge14ntoqTf1oFiHQXb+MVNIlqEWtp
	ssQGVFzO5tM+5LO8qcpxXBE3HUMzxPhN2rtu5EVr/7I3nffVLoy8T2Dlb7hJ6ZdyUElZzr
	0SxO78pzKPUSS+LgA2oy8Lo+tegso68RHvByaG4kUR6K0azeSEr8S2bEgoMT8vpezvXod5
	iBBAPwLkXNbnmlIvLWio4Gc8QMXY317CFW0SByugU1p/+bJlF6z24hUUDS0X0w==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] python3: fix SoB on patch
Date: Tue, 26 Sep 2023 23:13:12 +0200
Message-ID: <20230926211312.374573-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:13:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188265

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../0001-test_ctypes.test_find-skip-without-tools-sdk.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
index 371021c0a97c..97150f20385e 100644
--- a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
@@ -9,7 +9,7 @@ easiest way to dynamically check for that is looking for
 
 Upstream-Status: Inappropriate [oe-specific]
 
-Signed-off-by: Tim Orling <timothy.t.orlign@intel.com>
+Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
 
 ---
  Lib/ctypes/test/test_find.py | 2 ++
-- 
2.41.0


