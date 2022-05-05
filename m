Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A03EC433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 14:43:08 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.11866.1651761784070541248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 07:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aV/rH7eo;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2EA321BF208;
	Thu,  5 May 2022 14:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651761782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gNFqxUTxQcFrxqMDZRaJEOyVBBEB06g3jMQr7ldQNRQ=;
	b=aV/rH7eorc0OxEIXm3B26rHTwF3YEFcCqIC6iEk9U2yiZb46lvuaeL2avOzco3vuJzeb9f
	wV3vt7038bSaIba7uzMLhTrGo0ThWAHtYchjlblxqubeD0udtVpXxBiWOsOSx+eAF/S13w
	z599QuMUCcetNSvitMOQ/xYineJnqxzWnwogA1FmmLYSh7JZuOpWeENsTZSyo4KNfMDFFy
	bhqCDrM9xd9xM2sMjYnmfHrUTk+7ZC11Y9DK3bWQDSdfX2aBqJlaUKETW3hAAn3QuMQR0u
	DP/AgpK6I5nVLQEFTnd+M3yvWmko7ii/5KPSVpbaalsj/KGC7TaqEdZaktKGAw==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] MAINTAINERS.md: no more need for a prelink-cross maintainer
Date: Thu,  5 May 2022 16:42:51 +0200
Message-Id: <20220505144251.761145-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 14:43:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165300

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Since prelink has been dropped

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 MAINTAINERS.md | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS.md b/MAINTAINERS.md
index 36a9bde90c..505c2e234d 100644
--- a/MAINTAINERS.md
+++ b/MAINTAINERS.md
@@ -53,7 +53,6 @@ Maintainers needed
 * wic
 * Patchwork
 * Patchtest
-* Prelink-cross
 * Matchbox
 * Sato
 * Autobuilder
-- 
2.25.1


