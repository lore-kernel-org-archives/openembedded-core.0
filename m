Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B39C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:16:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.16422.1690985803526908313
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=g2IGOrDQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AEF8E0007;
	Wed,  2 Aug 2023 14:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690985801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BFuDHuX5B1KsSthWtHdB9MP8Cabw6jiTAsRysH0oD44=;
	b=g2IGOrDQK5J4Dxtl9agwXLIZMmLpV4AMjRJAkQKYjXqVGbw8sFj1prwEoR842oWGMOG/aD
	4Hqf48nlXpeJa+NXiP04UVIu10ppa6tsWLjCFeC0p2JRMAjJGfopu4w2hv6AgqXA7Yobqu
	gsVK4qhZlhSwije08712evCP/ZsfPp27mCIiwRFfIi2aWgldIMlG/Oh+zoJHnvCeDh+bZk
	GPM/LNhLE3NoFaUIfP0Vrxix6sqAXNIwKtpbqcOAEGOfwGZ1jKohddIMQSZz5Kru3Ww6v3
	S5QU/AIM/fnWO7dh7dG80tFZ5H37ZMbyPdFTekN9S8okgLRlnIhtal9t6GWe/A==
From: alexis.lothore@bootlin.com
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 0/2] add custom string when regression is about missing test result
Date: Wed,  2 Aug 2023 16:17:16 +0200
Message-ID: <20230802141718.3326905-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 14:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185400

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Hello,
this very small series intend to eliminate confusion about regressions
reported by resulttool whenever a test result is present in "base test
result" but absent from "target test result". This scenario leads to many
"XXX -> None" lines. The series allows to define custom strings to be
inserted in the regression report instead of the raw status:
- first commit introduce the custom strings table and associated helper
- second commit defines a better message for "None" status stored in test
  results

Alexis Lothoré (2):
  scripts/resulttool: allow to replace test raw status with custom
    string
  scripts/resulttool: define custom string for "not found" test results

 scripts/lib/resulttool/regression.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.41.0


