Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EF2C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 15:10:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.74564.1701357004274653767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 07:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MY5wMu8x;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EC4E1C001C;
	Thu, 30 Nov 2023 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701357002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gy/4rdWTwWpFAbJKZIOxNgD5futlCUZS+VD08S4YlIA=;
	b=MY5wMu8xM3rtGl+ertXSIFR6Ljo5XvKetMNHy8JGcAUJU/dxdP2kS3l5Wie7kIk1bDc8e4
	7ZzjkK/7Yg3R6Ykxnyby/EyTrz6/GIitnXo7Z2o+P0eLyWN8P6TVPyBSw8vex2khg/jnJm
	+/Qg/3ZaOleuDDQfyFyalzOgqQqbrfu/Zx9l7CGu3wGc0AZETxQ3fYpBwS8Duydn8nAhj0
	2n9+Fh2WQrTBqXjp3oiKL6wkbg5dOI7uEZcM9iDpQpM90oAEI3ViyJr3RJpDDghh0lbuLM
	+bgybcSnk2Tm9karA+8GXcB/XhLBI61duWFGMTvJhjIZGOrrNKwrEkZlWNu6SA==
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	alexandre.belloni@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1] documentation.conf: fix do_menuconfig description
Date: Thu, 30 Nov 2023 16:09:43 +0100
Message-ID: <20231130150944.1023969-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 15:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191509

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


