Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68406C83000
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 15:16:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10795.1750950977402903949
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 08:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=p0k7iSK2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA674432FA;
	Thu, 26 Jun 2025 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750950975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pp/KmejSN/9AzkIppcJSCQvpJW9nYQuPFQcuTgLE3ZY=;
	b=p0k7iSK2j8qWpUT4ed5MlkyqrGjLH0O663zEE6oBYB0HKYd60aFMTCECKKmrwIz6AyoGpf
	Qs95dFTHTD+92BRy2EH53dFnFdN/kV7dg0vSIEUkweiaCC58IJsKc/UPQJ+DuT9u9b8V8w
	icqIJ0N9z2E2BAQpwZ5wzOKSIo4ThfyBxgN1UmSuIO648tVKTifRj0IPf+Tvkv4tN7IUpM
	tn1bI89k187KSw4OZj2zTZgfrEStKHN3oIWG2QCkK8a9vyDPXI6xE8x2VcTGLuOZXOqJJD
	Rmk9v3yiEjtG/EaYttcCF+hRWrx88hW3tWUgkf2UQY2TMGTtFR4b52Cs3AGO7Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 26 Jun 2025 17:15:45 +0200
Subject: [PATCH 3/3] buildtools-docs-tarball: add sphinx-argparse and
 sphinx-copybutton
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-buildtools-docs-additions-v1-3-f0a80b001998@bootlin.com>
References: <20250626-buildtools-docs-additions-v1-0-f0a80b001998@bootlin.com>
In-Reply-To: <20250626-buildtools-docs-additions-v1-0-f0a80b001998@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=888;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=61PU3DPW/BUhLdKvOl3dM+8NMKv2Bl21s77woNiiagw=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoXWQ/71OAZh6FTTbMp4mBMl+AfyDSpvnq2UPay
 +7/0kTPCZ6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaF1kPwAKCRDRgEFAKaOo
 NjXEEACg4fwM/uD6Xy1G/sne/6cjxPR0Lr17Kx+BsxkViOiuNAXH4wGdTf/kuPvT7+VhXSTNoGE
 1OD/uizluXnQOeHt+Vlhl6ern8c5NpHUkaQeFQ4L2W/2WfKA0uIzuBodUrsO3WBSysSZDHwDUIr
 fgmtRDG2hb1x9xVuZI85hK91gg6Hqj5sm3FiN6I18buiuaM6aPf8nByk4BrUIdo8/g6sCzKCsAa
 rT2Y9e5+G1IXFnxIdnl891cvBtwhw4tCmT6dXJB41CXxoojtvw3D7zTHMvTWyQSDZ3Rb/h62tUw
 JTqaPjIhitgsPQswmVs+M0rqGNjU17JFOPu4X3amvlMKudvLG1l8iQ/dvgcYMm3EMBvtFQ4o10N
 2B+/8lcfkD2w5EF7wImWfwDNn/Rey0T8XYLD3HgN72X+0eMtaAFpkPmczV+ILW4RVqe26LC2CJx
 IIzaL3FE25PJ5nt9c4oRw0WCzuQDr3HkVqmwv6kZ89OMcUY9D0XMw0EkB3qQzBZ2Iv/hSw4w53f
 1nPp16NP6/OUDu/Y8VMTgp7P0z0gh4uoC1CELxG01h3mfyNiUBPMVfnhm30qEdlsQ9JciQsyY1I
 f+gXnDC6v4AtVzdVgLDrvgM1wN2aBoiv1glP3SPYDLTmAEdZAXQbGgax58o7cxYa1ohWO8woqrZ
 j7yJRNUdKVlB3fA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehieeguefhfeegheffgfeuieetheeileefheejkeetgfekueehueeluddvlefghfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 15:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219361

Include these sphinx extensions in the buildtools tarball to make them
available when building the documentation.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/recipes-core/meta/buildtools-docs-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-docs-tarball.bb b/meta/recipes-core/meta/buildtools-docs-tarball.bb
index b9ef68eb6d..24fbc33000 100644
--- a/meta/recipes-core/meta/buildtools-docs-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-docs-tarball.bb
@@ -7,6 +7,8 @@ LICENSE = "MIT"
 # Add nativesdk equivalent of build-essentials
 TOOLCHAIN_HOST_TASK += "\
     nativesdk-python3-sphinx \
+    nativesdk-python3-sphinx-argparse \
+    nativesdk-python3-sphinx-copybutton \
     nativesdk-python3-sphinx-rtd-theme \
     nativesdk-python3-pyyaml \
     nativesdk-rsvg \

-- 
2.49.0


