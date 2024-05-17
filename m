Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9050DC25B78
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 08:36:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.35255.1715934994159484648
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 01:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oyFqqnzg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA7941BF20A;
	Fri, 17 May 2024 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715934992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2dFBMMuG8phQ6fcnRwnd4DpEP5TCJ5joFqegVs08V2g=;
	b=oyFqqnzgIabyI6CBaP5SFxoXagPqHTvZ2O05iuaOGXkTBfclwK4XctqBXmRAUjj8rU01s5
	ANNB3QcuWxJoeFEBwCaEFOClwq8/vw6RyBIX360iyTJckAIcM0eBqpftPusy0UI0bnuW4c
	QpsWKhPKr13h2vH/rO0BjS3ikmeluapjIpf3nQc57p6r5LfjmX4E/nnCfmhPmQLZzw8xCT
	dxKfu+Hz8zLZ3AmjW4M5NZJklfS8M9gdXeeZd2H6SpjWdTJkfx3XysDQqIRvh9PREdloO3
	URpFXjBDei8/NuQZa/EEK/ZzlBwceHEL4QaReu89ZlgaRVjhonh5hfWc36NVaw==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] maintainers.inc: maintainer for opensbi
Date: Fri, 17 May 2024 10:36:11 +0200
Message-ID: <20240517083611.196587-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 08:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199509

From: Thomas Perrot <thomas.perrot@bootlin.com>

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 014cf32e4091..d98cb0f194bc 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -556,7 +556,7 @@ RECIPE_MAINTAINER:pn-npth = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-opensbi = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-opensbi = "Thomas Perrot <thomas.perrot@bootlin.com>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-opkg = "Alex Stewart <alex.stewart@ni.com>"
-- 
2.45.0


