Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6BD0C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 14:58:37 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.73115.1698332316102792858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 07:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dCkNRovK;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BA1D24000D;
	Thu, 26 Oct 2023 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698332314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8bluVKPB7cDPuRGTAn1MMgMCFOIYaWq1S8VpaBM978s=;
	b=dCkNRovKMSjdItMjNOKnzIBmoNWfF5W5Z4k06l8bpkNYhtfjDfWfqoJfx/8W6KNljOSiOQ
	j3sbC7oie2CDh1PzeMqNEGQh9Y/aRrbF8JO2GJgMUr7my9t8qHp2euIxsqRKpvi7XVm3o4
	/X8SB4K9gsPreoc5YfDFNkaw2r3jqJQv/9lIkP8rZ9ko0I4uDrjAsidx8v6VDnrHwqa7m1
	asMMGJR3wHYPnywtDxtBLfBRyPdfHvhNri93J1kjRP7Pt0xwT/kcCsqxEQczrAcZN3sclR
	YdGDQZBPueU5GiH/N5tZxpMEHPqwIMC7k+MJb+JN715t3aDxj69yMNV6er6L1w==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] convert-overrides.py: remove "edgerouter" string
Date: Thu, 26 Oct 2023 16:58:25 +0200
Message-Id: <20231026145825.1946337-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 14:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189731

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

The "edgerouter" machine has been removed since
https://git.yoctoproject.org/poky/commit/?id=0c64d0e4317e3749f7f7ed9ecd5d08bbb0cedc9e

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 scripts/contrib/convert-overrides.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
index 1939757f1b..14839d9269 100755
--- a/scripts/contrib/convert-overrides.py
+++ b/scripts/contrib/convert-overrides.py
@@ -39,7 +39,7 @@ args = parser.parse_args()
 vars = args.override
 vars += ["append", "prepend", "remove"]
 vars += ["qemuarm", "qemux86", "qemumips", "qemuppc", "qemuriscv", "qemuall"]
-vars += ["genericx86", "edgerouter", "beaglebone-yocto"]
+vars += ["genericx86", "beaglebone-yocto"]
 vars += ["armeb", "arm", "armv5", "armv6", "armv4", "powerpc64", "aarch64", "riscv32", "riscv64", "x86", "mips64", "powerpc"]
 vars += ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mipsisa32", "mipsisa64"]
 vars += ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
-- 
2.34.1


