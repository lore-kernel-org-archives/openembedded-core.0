Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF9CC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 12:13:53 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.91443.1722600825330235734
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 05:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LAuRr1cZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82AFC40007;
	Fri,  2 Aug 2024 12:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722600823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E4xGH60sf3zybPYmGPEuERPadxuIheGE3YKS6kpm5Us=;
	b=LAuRr1cZAwDPOcjEKHpXv1jHPiGnnewxIWmUc1dc20EJgjZUY8vhlFG+LyIsqgkvAavHOb
	DbVF0zr8gkNOlTf6BcYBiM7QGsjkQBVKQZZvVtHrBemAvW0COzYZcofo1CyJljDYtevY98
	o03aE00Lxp0wLUWyWZEsTozNXB4GcL/ToPYZVJC4dCMbx03l7TFZONWH9HarRL3V9lsVzH
	9tzykwSVQmoGP30dZvFjMdhP6R5WgLu1uh9FHOhb0liU5i94TKvy9GDBv5KXfz+yKfBtOe
	QvEbcTXvUX9dL6lJOuucLGKI8qebNZAOcA6bQXyZZXO1J6IVsBKt6c9RXhxerQ==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] opensbi: bump to 1.5.1
Date: Fri,  2 Aug 2024 14:13:36 +0200
Message-ID: <20240802121336.1642376-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 12:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202901

From: Thomas Perrot <thomas.perrot@bootlin.com>

This intermediate release has following fixes:
- Save/restore menvcfg only when it exists
- Adjust Sscofpmf mhpmevent mask for upper 8 bits
- Fix potential NULL pointer dereferences in SBI DBTR
- Fix incorrect size passed to sbi_zalloc() in SBI FWFT
- Check result of pmp_get() in is_pmp_entry_mapped()

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-bsp/opensbi/opensbi_1.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/opensbi/opensbi_1.5.bb b/meta/recipes-bsp/opensbi/opensbi_1.5.bb
index 6b31d15a051b..652b81182b80 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.5.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.5.bb
@@ -8,8 +8,8 @@ require opensbi-payloads.inc
 
 inherit autotools-brokensep deploy
 
-SRCREV = "455de672dd7c2aa1992df54dfb08dc11abbc1b1a"
-SRC_URI = "git://github.com/riscv/opensbi.git;branch=master;protocol=https"
+SRCREV = "43cace6c3671e5172d0df0a8963e552bb04b7b20"
+SRC_URI = "git://github.com/riscv/opensbi.git;branch=release-1.5.x;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.45.2


