Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F81CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 16:26:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61655.1790612788887184894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 09:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=mEXdodEU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E9454E4109B;
	Mon, 28 Sep 2026 16:26:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C1AF601BD;
	Mon, 28 Sep 2026 16:26:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EC061032968C;
	Mon, 28 Sep 2026 18:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790612781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=tFfGQaNMrkSZjqPtTNUPa13Y0gvosbWYUwwyLae7/vw=;
	b=mEXdodEUfOcad0ECxENSvd61/y7bbR6E6GXhQvHz2JiFvHKgQwAg7i+dKBVLEw0J+I3v2U
	oL3vkWN9VrkHr2BcLfS4hyZqWYKzMGPWzBFUutGurOlz3G/EgjtyoQS5DAnxs2BObtgopH
	Gu32F8rrcCcCXSsjhTMGqjTPynSMCO07gDADJwMfsxFDlqOhIpDcz/2e19KhBnTx4tgHD6
	UDJOg9w0oNSAznbU+OgV8TIOwpAnj9YlGAp29VBBikWDet9cLZf9kULt5TkH+PTJaYhI83
	tCpOj8piK1BeiGoLyzc8ob1LNyYw3ek87wM8D9aQD60w3XZKd/wVQrisaJi84g==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	tgamblin@baylibre.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 0/1] recipes-support/gnutls: disable slow tests for RISCV64
Date: Mon, 28 Sep 2026 18:26:13 +0200
Message-ID: <20260928162614.1685239-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 16:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246774

Hello,

After Trevor's investigation, I was able to remove only the most time
consuming test cases.

Changes since v1 [1]:
- patched the tests instead of entirely disabling gnutls ptests
- updated the title accordingly

Best regards,

[1] https://lists.openembedded.org/g/openembedded-core/message/246201

Jo=C3=A3o Marcos Costa (1):
  recipes-support/gnutls: disable slow tests for RISCV64

 ...m-disable-slow-test-cases-in-RISCV64.patch | 109 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.13.bb  |   4 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-tests-Makefil=
e.am-disable-slow-test-cases-in-RISCV64.patch

--=20
2.55.0


