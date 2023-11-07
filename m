Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C10C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:20:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.7955.1699356032884717340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 03:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=L7gdA4HN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AA18E0010;
	Tue,  7 Nov 2023 11:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699356030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jHZPBr4qWqKQdU71AKBDiT82ILpMySrKjxc9X2HW+7k=;
	b=L7gdA4HNwaEXGbJa8LF5m22PINvRiXeTk4j1YGxXSS1CPrNQUIxXN05VxB2C21RzgSMhZw
	CxNswKsFQdt99COpFeBRe3t7LXLEJ0B5/QAXnZrs4PqHu3owP6yyq2ZPQH+oZjKPhUIJqc
	sHSleq0fjjXMDSIo/OPV6CBazDymUEXLIfnlyFC7356/nqdnD9xu3NLDLSjpS/dFXnIq5p
	PXt6vc0XQiMyoQ1d6skB2wL7D7JfHtBmVh4hCZ7ymgJyGd91a41bjZPr4Nk3EmXJuXjFOs
	m7InwMPca/3uM2l5qOdM/wdsgkigKumfD99tPCsqpcITO1nHR+dP0uQh7duZzg==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: Upgrade to 1.3.1 release
Date: Tue,  7 Nov 2023 12:20:25 +0100
Message-ID: <20231107112025.119382-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 11:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190266

From: Thomas Perrot <thomas.perrot@bootlin.com>

Here is list of changes in this major release

https://github.com/riscv-software-src/opensbi/compare/v1.2...v1.3.1

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/{opensbi_1.2.bb => opensbi_1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.2.bb => opensbi_1.3.bb} (93%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.2.bb b/meta/recipes-bsp/opensbi/opensbi_1.3.bb
similarity index 93%
rename from meta/recipes-bsp/opensbi/opensbi_1.2.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.3.bb
index a088fef41981..f01cae34d1ff 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.2.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.3.bb
@@ -8,8 +8,8 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "6b5188ca14e59ce7bf71afe4e7d3d557c3d31bf8"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
+SRCREV = "057eb10b6d523540012e6947d5c9f63e95244e94"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=release-1.3.x;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.41.0


