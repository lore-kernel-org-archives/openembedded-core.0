Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704B1C7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 15:16:23 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.10583.1750950977536759917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 08:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LqnWzyqs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C38C43A30;
	Thu, 26 Jun 2025 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750950975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NHGx1RUozORJQrV0gsFaGla5erQvKEicC7r9tM8H+Ao=;
	b=LqnWzyqsG7wM7Ciu21agtnel8vLWuqQE4fG6+6jBsFdPZZMi5fM+8DbDiTBOpzKxywZswF
	64wE7+q3roW7DQe6sfYRDuc0GcXS89b4snQum9IIXZi8od/ejS4X4aRXbloXwT9pa80sBO
	3fd9BZrei63FUCi/2aAlNsgXgY1f/JJl1XIVu9cptHobg+9hQNZ06FVir2EnmVrgq5z6MJ
	ZdapiIpb9XBK2jIzb+ZBNqixhzbveURiF7EE365cLOgVK1udmTC22X8OlHb6DQ59QD/L2v
	6VcjgMwbG10eJDOs0td5NGg5YOJnIeEyJi728J7xcU4ie51d6jlyFWgWPepCtg==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Buildtools docs tarball additions
Date: Thu, 26 Jun 2025 17:15:42 +0200
Message-Id: <20250626-buildtools-docs-additions-v1-0-f0a80b001998@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5kXWgC/yXMQQqDQAxA0atI1gY04Ii9SnGhk7SmiFMmowji3
 TvV5Vv8f4BJVDF4FAdE2dQ0LBl1WYCfhuUtqJwNVFFTOXI4rjpzCmE25OANB2ZNOTJsXMttLdI
 Recj9N8pL9+v97G/bOn7Ep/8QzvMHOa7ZV30AAAA=
X-Change-ID: 20250626-buildtools-docs-additions-567d71ee922c
To: openembedded-core@lists.openembedded.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=woObv25Au0GCsczhVcETS34IgttGoLfCvU493ovY9XA=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoXWQ+XrDkF0ehmzocBmCCkSxhMqt7pAnRVRgp/
 fPxqGSqeYSJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaF1kPgAKCRDRgEFAKaOo
 NphyD/9uwNgKVq06oMVb++692s2/aDipzK3fAOey8La0brSHgzcmkcUMTt2Clta1PzAi57LrmPE
 BTUco1TBAQ68zJvh8DKCHb6N6VrctcuBhy9EETAoe2AIgA+47GxRFeecMA7gINSpBMbtWQaIC29
 mB6jQYwIaj3zO/gu0tWJOMP5Nedm2u66wJPbvT27AeOjN8k49liSF7c1mQIU6J9IIl2hxbnqmZs
 G8BXSXYXx5FAIdB/hkazt1/YnW4aL/UEyRWCQrN7+/BhCt/IgAiRiWIoArWkEyeIP6/G2aDlOPt
 haj2tRSMgbJWPM6DZLOeFYqbaO6FmEX6EHY59LJuE5XObQvNMgDNTQPCPkESAGvUvtYuVGsbY4N
 tNPGxSU0UvERl3OvXh7SxJhCn+E3rzKLeeo/daANFA0LnKdMS6Y3/XDvlVeDutMxypiD9SVOaxJ
 rMEypP/I1kNiA7E1Wcq0XeuGOwCWfICs+qDLOMe/Ru+ThnjDyDXZCmP8Jy0hjLZlTOFUFp24Z72
 KjG3aGrXoa7MzVTSI8+o31t0TyxoWfI2a6oqKJzI0LfuzHCNeWUZBdmbB5QEJh8z8CLDH3/crvp
 xHMDhU6yXoTWcR4oVSK3DAKqpTDv8ediAnu7YxOJjksZGXo6omhJD4dPVfYRUMKq3M85F0EtTUr
 kyrH+Hb48FkPyPA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduvdefkeffteeluedvgffhjeegffduveegfffghfejteejkedvgfeuvedtudejkeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeftgekudemvggsrgejmedusgeksgemrgehtgelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 15:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219362

Add the sphinx-argparse and sphinx-copybutton extensions to the
buildtools docs tarball to make them available when building the docs on
the Autobuilder.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      python3-sphinx-argparse: add recipe
      python3-sphinx-copybutton: add recipe
      buildtools-docs-tarball: add sphinx-argparse and sphinx-copybutton

 meta/conf/distro/include/maintainers.inc                    |  2 ++
 meta/recipes-core/meta/buildtools-docs-tarball.bb           |  2 ++
 .../python/python3-sphinx-argparse_0.5.2.bb                 | 13 +++++++++++++
 .../python/python3-sphinx-copybutton_0.5.2.bb               | 10 ++++++++++
 4 files changed, 27 insertions(+)
---
base-commit: d50e12e5ae6a72535cacd0f767b1be1f89278f79
change-id: 20250626-buildtools-docs-additions-567d71ee922c

Best regards,
--  
Antonin Godard <antonin.godard@bootlin.com>


