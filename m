Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D66C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 18:15:33 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.33176.1656267329347442348
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 11:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XtcFtwfh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 579E120003;
	Sun, 26 Jun 2022 18:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656267327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4PUf31OIr7joz1k7SGiCHH8Xg9U85gcmaUgoEiI3OIg=;
	b=XtcFtwfhnSRMmN9hf6zLw5xxTjGS5pBS1l3bnxEvKX+6BHtlc3IVzlTdwdI4zw6iS9NFja
	GpYFQx8l95ZG+nx6CHU1KrtJTOPM3Zq/S9fuZip7occ51aDZdJC5m5IOCPKYrePC9gFnmr
	SotkI2S7b0PGemvVyBeoAj+OmNq13/mqTCiwdS8N65qjMReNACI80FFHp636QkDM+8JL+W
	fES+BlTfNCIYMmVeYNV5SQg9ixkpVCdiaKvnI865W774ICLGMIfd4uIIF1Ccu/Iyh+LHm9
	xWj5WD/n1O5cS6TWpEwwbpA2HAf59C5Nsm5OMelhmha/4fal54DqtV+tLyrpew==
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: Update to v1.1
Date: Sun, 26 Jun 2022 20:15:19 +0200
Message-Id: <20220626181519.3580271-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 18:15:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167312

This release has:
* SBI PMU improvements
* RISC-V AIA v0.3.0 draft support
* Simple external interrupt handling framework
* Xilinx UART-Lite driver
* RISC-V privilege specification v1.12 support
* RISC-V Svpbmt extension support
* RISC-V Smstateen extension support
* RISC-V Sstc extension support
* RISC-V privilege specification version detection
* Platform callback to populate HART extensions
* Compile time C arrays support
* Probing FDT based drivers using compile time C arrays
* SBI HSM improvements
* Allwinner D1 platform support
* Trap redirection improvements related to [m|h]tinst CSR
* SBI v1.0 specification support

Overall, this release mainly adds support for various RISC-V ISA
extensions ratified in December 2021 along with other improvements.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/{opensbi_1.0.bb => opensbi_1.1.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/opensbi/{opensbi_1.0.bb => opensbi_1.1.bb} (96%)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.0.bb b/meta/recipes-bsp/opensbi/opensbi_1.1.bb
similarity index 96%
rename from meta/recipes-bsp/opensbi/opensbi_1.0.bb
rename to meta/recipes-bsp/opensbi/opensbi_1.1.bb
index 8430f62543a2..d3a62965336a 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.0.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.1.bb
@@ -8,9 +8,8 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "ce4c0188d96b2c20c2e08d24646a5e517fe15a4b"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https \
-          "
+SRCREV = "4489876e933d8ba0d8bc6c64bae71e295d45faac"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.35.3


