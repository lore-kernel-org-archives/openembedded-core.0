Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0781FD3B991
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 14:12:03 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.46574.1732630321071569686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 06:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OK/Fg6rw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E5721C000A;
	Tue, 26 Nov 2024 14:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732630319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jxPfjEgq2jOkLdmAC0vXGl6AVyi5n3OAC7SZTm8kRr0=;
	b=OK/Fg6rwmMHhqBPAQ7HmJ+iVdxE6Wc9sMSgvl7zSz/bnd4aQUNs2jcnfFMXK+UdeFbAk2v
	gS9DOuIclZ6m+x2KBvOB4AcdqG0SlQ5J6M7zvZEdnmFxdNBAlIWhhaOWRzevvN9HEPPHqh
	aV8Xx/YU6Sa6NYZ7Rm4fgrEFutNJd8DRsfYcPpFUjpO4KVLKAJ66S1PKZ1kpOl0ifr6PxJ
	CygLadCWcZLZM49UcjjnflES6LEpy6/zLb0POgHbAywRutGSFU6P9Yq42uZxd/aMFeV5tD
	fcQvvnesAQjjab6urJlAmpiovH/cFZBNYDT/Dk1EvN94FHEJOHKV00f3Hbym9A==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] tcl: resolve conflicts with tcl8's man pages
Date: Tue, 26 Nov 2024 15:11:56 +0100
Message-ID: <20241126141156.438193-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 14:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207854

From: Thomas Perrot <thomas.perrot@bootlin.com>

Change the suffix from "tcl" to "tcl9" to avoid conflicts with the man pages provided by tcl8.

file /usr/share/man/mann/vwait.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
file /usr/share/man/mann/while.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
file /usr/share/man/mann/yield.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
file /usr/share/man/mann/yieldto.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
file /usr/share/man/mann/zlib.ntcl conflicts between attempted installs of tcl-doc-9.0.0-r0.riscv64 and tcl8-doc-8.6.15-r0.riscv64
[...]

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-devtools/tcltk/tcl_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
index a6e1dfbb5bef..46e8e7d5c526 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
@@ -35,7 +35,7 @@ VER = "${PV}"
 inherit autotools ptest binconfig
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
-EXTRA_OECONF = "--disable-rpath --enable-man-suffix"
+EXTRA_OECONF = "--disable-rpath --enable-man-suffix=tcl9"
 
 # Prevent installing copy of tzdata based on tzdata installation on the build host
 # It doesn't install tzdata if one of the following files exist on the host:
-- 
2.47.0


