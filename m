Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6262BC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 15:16:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.95013.1722611794176979029
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 08:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B37FC5gg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4262B1BF209;
	Fri,  2 Aug 2024 15:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722611792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W4GADdwKuwnxEUlf1hJx2jKCXukF/1o2aN2MuN5uHBE=;
	b=B37FC5gge/cPPtV9crL9+dRBCLaB/ORsDPXjOHBFPhSgi+SV+2DuqaOiRlt8bFDhih/Xoq
	9YnmtI/jfM3Mp1ql29KkwUeFAvFPWpQU5rfVdlCBqgYtYxA1M00PzzlpQa2CPxyoEiwkkC
	YS5x0TrtBZy2IOgnhsnPEeNaVZSftpXd8Z0toBXFuP0Qo3GSmelfH+jDki4MqDq2dsZZZS
	9TW61r+mOFhByISTBdd8ohwhWaSB5pGtqbBGjtsoZ9u0/unev108XVjGFDik0ZcGKPVBNj
	egfXS2WBWdiHE8H3i3SWJFfHGi01uPohpvjWJI9WBbXrUuD0morHVLBuY7T+CQ==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH v2] opensbi: bump to 1.5.1
Date: Fri,  2 Aug 2024 17:15:35 +0200
Message-ID: <20240802151535.3882923-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 15:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202921

From: Thomas Perrot <thomas.perrot@bootlin.com>

This intermediate release has following fixes:
- Save/restore menvcfg only when it exists
- Adjust Sscofpmf mhpmevent mask for upper 8 bits
- Fix potential NULL pointer dereferences in SBI DBTR
- Fix incorrect size passed to sbi_zalloc() in SBI FWFT
- Check result of pmp_get() in is_pmp_entry_mapped()

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/{opensbi_1.5.bb => opensbi_1.5.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.5.bb => opensbi_1.5.1.bb} (93%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.5.bb b/meta/recipes-bsp/opensbi/opensbi_1.5.1.bb
similarity index 93%
rename from meta/recipes-bsp/opensbi/opensbi_1.5.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.5.1.bb
index 6b31d15a051b..652b81182b80 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.5.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.5.1.bb
@@ -8,8 +8,8 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "455de672dd7c2aa1992df54dfb08dc11abbc1b1a"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
+SRCREV = "43cace6c3671e5172d0df0a8963e552bb04b7b20"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=release-1.5.x;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.45.2


