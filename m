Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C53C9833F
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 14:37:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91158.1767710254504236915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 06:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ee6k5mzm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6D25D1A264A
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Jan 2026 14:37:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C3EF60739
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Jan 2026 14:37:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95208103C81A4;
	Tue,  6 Jan 2026 15:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767710251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wiC/5EcHEFK5U6QFCL3pSAfs2rf9JvdICEinkHNSzbI=;
	b=ee6k5mzmqZM6lArSa2smR4Rs4KKNJPbbgDrI+SVVgOyGquVbNhmcOMt4T7t6CmmdkyFfjc
	TFgigd0L7BIexQkc4ZjBb2Flzs2tsQrvdFxPUg8dD+XT2svjZOdJTr7shKOojyIuRfz6sL
	XaiR/Yc3sRFMa++QCIoowbTwqZ+1Lffd+7nV3h1gRBf1FRl5G+LiWO2wdj/S60KjAEH8kH
	yynrubbx3XArxPGOSHNQaAAFikBqKD584tFv09cveX4x2rdJaBdlvdsFLGDJQSOqNpApGD
	KhGh7qBSgOZdXAe/Yj/Z7dpNUt6umwJNisdhsXp2NzhUJzrjWjJmLki5wwL7QQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 0/2] Move RISC-V recipe-specific configuration out of common includes
Date: Tue,  6 Jan 2026 15:37:10 +0100
Message-ID: <20260106143712.843971-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 14:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228889

This series moves RISC-V specific configuration out of common include
files and into the corresponding versioned recipes for u-boot and
linux-yocto.

By relocating these RISC-V specific settings into the versioned
recipes, the configuration remains available for oe-core builds while
avoiding unintended side effects for external or custom recipes that requ=
ire
such include files.

Jo=C3=A3o Marcos Costa (2):
  u-boot: relocate SRC_URI_RISCV into recipe
  linux-yocto/6.12: riscv: relocate KERNEL_FEATURES_RISCV into recipe

 meta/recipes-bsp/u-boot/u-boot-common.inc     | 12 ------------
 meta/recipes-bsp/u-boot/u-boot_2025.10.bb     | 12 ++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc     | 16 ----------------
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 16 ++++++++++++++++
 4 files changed, 28 insertions(+), 28 deletions(-)

--=20
2.47.0


