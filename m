Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253C7C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 08:39:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.65119.1701679140797150920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 00:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=K/D3sDat;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5F852000B;
	Mon,  4 Dec 2023 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701679139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FMQ2l+v37GOMKPjk1oXK1uq6yihJYKyySLsk4RSW1K0=;
	b=K/D3sDatjehSjvEk/CdWIgT5uHECO/1k0kI5Q4Y59ueauyo8jl4MO9IRniM/5lq0O+hAaJ
	4QSl1luAHzGVrtQOhAIskQlIJ647ZY9+odPQTAl6nTkDUZxwGEWeLVqQBv5RwF1zcgXhXA
	zM/w4+r31Hfgi5VQPAsgdFhQr0F/A+hNLdxm5wA+jKoya/YP2vZBqjPrrJNNklkmcTOpF9
	7Q+Yo6WU0+ybry7E+BKW+rXQ68JtnJvoZpaQOBw4B2MfE1sS+dzlqeGe5IpKmnP/dkBp4x
	31Ekr8Flmlb3rrXtp3TGHppTpJ3KYpi7NnfA2T4z5wp/X0fyLDO5GdrmVg2k0g==
From: joaomarcos.costa@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alexandre.belloni@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1] documentation.conf: fix do_menuconfig description
Date: Mon,  4 Dec 2023 09:38:52 +0100
Message-ID: <20231204083852.3822498-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 08:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191726

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

The current description is only pertinent to the kernel, even though
do_menuconfig task is used by other projects, such as Busybox and
U-Boot.

Replace "for the kernel" by an agnostic alternative (i.e., "in the
compilation directory").

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index ab2addb321..05e4b8bc7f 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -28,7 +28,7 @@ do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yoc
 do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
 do_kernel_link_images[doc] = "Creates a symbolic link in arch/$arch/boot for vmlinux and vmlinuz kernel images"
 do_listtasks[doc] = "Lists all defined tasks for a target"
-do_menuconfig[doc] = "Runs 'make menuconfig' for the kernel"
+do_menuconfig[doc] = "Runs 'make menuconfig' in the compilation directory"
 do_package[doc] = "Analyzes the content of the holding area and splits it into subsets based on available packages and files"
 do_package_index[doc] = "Creates or updates the index in the Package Feed area"
 do_package_qa[doc] = "Runs QA checks on packaged files"
-- 
2.43.0


