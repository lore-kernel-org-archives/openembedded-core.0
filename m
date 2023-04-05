Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24104C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 14:49:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.132095.1680706150485047898
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 07:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=d7VQeubY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty.fritz.box (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 538DE4000B;
	Wed,  5 Apr 2023 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680706148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RvwfWgE6QbIeJ2ltqEqIFM/IKIDz6hoUss75YdEGfCs=;
	b=d7VQeubYWKjlV81/b3j9pmfL7IO7rDMsSHdmyNYz4RvRTBQUOtGzPPPWfbA9T2W/5xDiZS
	bLI951qtYfrNGX0C1ZQ20nCnjmDYApuFRtzjIpzbPOe5nysyOgMCdx7EK0iV6lady/0B2m
	sP7ASs/0lVTZeLwkmoVP0PweLtCkg2YSt8L2cN+XcMhkA+Z3l1DMqrl0+lLQHZfprzRECQ
	e7oRlWA2Oc84BGOWVq6xAjz1jH7XgALpAUt7m1VG7Emzs0E18ybcstc5w9FIflZkFQttFI
	x55eGDttOR/YXfqAv4ZJxCXuyDHHQeXL4KLj4CgNGJTJl0UQVzqFPkUhOibZeg==
From: luca.ceresoli@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] devicetree.bbclass: fix typo
Date: Wed,  5 Apr 2023 16:48:48 +0200
Message-Id: <20230405144848.2389279-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 14:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179738

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 meta/classes-recipe/devicetree.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
index ac1d284ccd9e..ed2a92e447c4 100644
--- a/meta/classes-recipe/devicetree.bbclass
+++ b/meta/classes-recipe/devicetree.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-# This bbclass implements device tree compliation for user provided device tree
+# This bbclass implements device tree compilation for user provided device tree
 # sources. The compilation of the device tree sources is the same as the kernel
 # device tree compilation process, this includes being able to include sources
 # from the kernel such as soc dtsi files or header files such as gpio.h. In
-- 
2.34.1


