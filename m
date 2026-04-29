Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735E6FF887E
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 18:06:49 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2550.1777486003461849628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 11:06:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=u74Rksgh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 504BDC5CD5D;
	Wed, 29 Apr 2026 18:07:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DF215FD43;
	Wed, 29 Apr 2026 18:06:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E4571072B189;
	Wed, 29 Apr 2026 20:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777486000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=AzGtV+LFiDpf6u2K7wi0G5hiCGHJzVtUYMan90Qylnk=;
	b=u74RksghpNInaSJWiG1tlgHJxJieTnBiOr3ps3FH15/s9xhLPP3/dFgQfOCBerNd0X+x9J
	sPmwbGX7HDHvuKpKypqSna+2DQ44hsn0vrZkolmuscfCxG0Fpfg7TgCfsCw1PuTP43MzUo
	wCR6CMa1mWsgQoYsbMmR9BIQUDoMCk6V3AAolJJzpFZgbY408rDRJIeCT5ouPWF10SPKDY
	0N0cN/ppU6MizQm6hthEu2+d5uZ30zpNy0UVJaXaBmFO/R0EMqZRIpCVxRIWGG4sCQca9V
	dobp9m0pLrYtlHZO1KGat2evg/qF07y+OoNXr1FOB0wxtBXfgSWJWJhDDtm9Jw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	marek.vasut@mailbox.org,
	festevam@gmail.com,
	khem.raj@oss.qualcomm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 0/1] u-boot-tools: drop yaml in DT validation
Date: Wed, 29 Apr 2026 20:06:30 +0200
Message-ID: <20260429180631.170081-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 18:06:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236128

Hello,

I hope this fixes the DTC build issues once and for all!

Changes since v1:
- The patch was added to SRC_URI_RISCV only, so I replaced it by an appen=
d
  straight to SRC_URI

Jo=C3=A3o Marcos Costa (1):
  u-boot-tools: drop yaml in DT validation

 ...ripts-dtc-drop-yaml-in-DT-validation.patch | 85 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-tools.inc      |  2 +-
 meta/recipes-bsp/u-boot/u-boot_2026.04.bb     |  1 +
 3 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-scripts-dtc-drop-y=
aml-in-DT-validation.patch

--=20
2.47.0


