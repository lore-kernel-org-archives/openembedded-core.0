Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68855CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 08:33:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3293.1790670798740208117
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 01:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=gIoqZNU+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C3AF4E40755;
	Tue, 29 Sep 2026 08:33:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD5D3601BD;
	Tue, 29 Sep 2026 08:33:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 774461032979B;
	Tue, 29 Sep 2026 10:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790670795; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=R3WTyq4+T0t4QFuwFIGcst0omc/11KXJUChPcLXOcQk=;
	b=gIoqZNU+CqVAojhRpzyuREO4wxixSBrXnUxj44+ROWDdodYoRCQ+Z+NW+5Xd3krkO9qVZ0
	ASNIgOczTjGUWQ/imSS4Oi3lZYntkFgw6j1X4r+NU0VaPvA5kWEW/oiYTkIdJvGr9vp+e/
	Z6cyXQLaiq8evjC7ImvDx1nWSL+gGNni95KP3kvf4DtAWWjOZrdGfn8v5RSRokepw/NDMa
	z5ROcgNa0Ew3suVT1g0Gw2APsJoPe0zeWvbSdOHk85ZXz5Pr44MDgAEXQ9V4NpSDRFCqj0
	yMSrEEzYAc7/VdRKo0lIHqy3HXzmJ7/P3x1H1tSe87EeTII/V+KxFhcm3TiGZw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	tgamblin@baylibre.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v3 0/1] recipes-support/gnutls: disable slow tests for RISCV64
Date: Tue, 29 Sep 2026 10:33:07 +0200
Message-ID: <20260929083308.1734775-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 08:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246847

Hello,

After Trevor's investigation, I was able to remove only the most time
consuming test cases.

Changes since v2:
- now we only remove the tests that take longer than 60000ms, so I
  brought back mini-dtls-hello-verify-48, tls12-ffdhe, and
  x509sign-verify-*
Changes since v1 [1]:
- patched the tests instead of entirely disabling gnutls ptests
- updated the title accordingly

Best regards,

[1] https://lists.openembedded.org/g/openembedded-core/message/246201

Jo=C3=A3o Marcos Costa (1):
  recipes-support/gnutls: disable slow tests for RISCV64

 ...m-disable-slow-test-cases-in-RISCV64.patch | 107 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.13.bb  |   4 +
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-Makefil=
e.am-disable-slow-test-cases-in-RISCV64.patch

--=20
2.55.0


