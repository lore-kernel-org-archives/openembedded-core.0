Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776DAC48298
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:57:38 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.66138.1707148655046660115
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 07:57:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=A5aPdi3Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FB9DC0014;
	Mon,  5 Feb 2024 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707148653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MBM24kpNm/ghJp88aYXFdu3HQ1csDXiVG0KOTeGGPaI=;
	b=A5aPdi3QkyM/1jiGv48wNK+yiFQGFTcuHRQWu/B+Me/VqcjXu2GfiaDq1YkpMuD6knGRur
	sNBokXALZgYIaxlQIXiklgV/QmDCzfDpVE2txAbeGWr7sBx5lvu4G1WkmfmOdf6J0DV5Kx
	6jl1bK2Fr+PvoXKDx9BEWre592InziOE9az9bW4fd6A5CvyhqGoBoenw0pE7cvuNfTtTgu
	04v8qIjV8IWDWL56sowEtpAeJ28VebVBQmHhlmSgvHbBWkmFBimGdkx91vUuKD7LV2ryR+
	ZnvHD5YWbc9DMYLPmFJCeLEzaIERjOylUAs4XBDvV2QO9UbPN4C3r3u6kByDmg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 1/2] patchtest-send-results: remove unused variable
Date: Mon,  5 Feb 2024 16:57:29 +0100
Message-ID: <20240205155730.115895-2-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205155730.115895-1-alexis.lothore@bootlin.com>
References: <20240205155730.115895-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 15:57:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194953

From: Alexis Lothoré <alexis.lothore@bootlin.com>

result_basename is declared but not used in the script

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/patchtest-send-results | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 71b73f0940f0..024be003ceb7 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -45,7 +45,6 @@ elif not os.path.exists(args.patch + ".testresult"):
     sys.exit(1)
 
 result_file = args.patch + ".testresult"
-result_basename = os.path.basename(args.patch)
 testresult = None
 
 with open(result_file, "r") as f:
-- 
2.43.0


