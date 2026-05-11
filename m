Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3408ECD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:29:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46150.1778491790545634556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 02:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Y7CBV5aW;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 411321A3499
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:29:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16F2D60646;
	Mon, 11 May 2026 09:29:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBB7111AE8408;
	Mon, 11 May 2026 11:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778491787; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Fsyx099PeGC+1WxKPDcGd5X6Hy338CD6FQ42ub8U9cc=;
	b=Y7CBV5aWH2iH4HtPJpBKZ3g4lmQLnCdrAlndP/5hBD8GgLWG8l8bffm6CM6hlYSe2ccuKk
	Xer0PNAC77RVgL2Y4yItHlJS0ASOce7cnJRnUEKEYi1ze22UGbo5i5vJcChQYIsbpjR3/e
	FRhKCiba077zrNxNO+e8CHJW7AgH7+zKQrYN+p4n4NCL0kLNC+9HRlVT8vs1ghxsoUbt7V
	9HTVoJRr8LhhLZgLSV2QVvSStUt1UqrkBQFhR8v2DHtepCy1Qkc30AnxOTsX/gmkcp3XDf
	AUDcvkxcanht4Tj5em+kIZ6Cr1sJJEDR0NQQTrZw6A2jAiEC8umWWCVWIy4j4Q==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	khem.raj@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 0/3] ovmf: add some rework to the recipe
Date: Mon, 11 May 2026 11:29:32 +0200
Message-ID: <20260511092935.2631121-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236790

Hello,

This patch series contains, first of all, a slight issue with PACKAGECONF=
IG
previously evoked by Q. Schulz (cc'ed) in the mailing list.

The main point of the series is the support for Clang, which I tested wit=
h the
latest version llvm/clang available as of now in oe-core. I also tested t=
he
result with the help of runqemu.

Moreover, some of the settings are obsolete and can be removed.

Best regards,

Jo=C3=A3o Marcos Costa (3):
  ovmf: simplify PACKAGECONFIG's default value
  ovmf: drop gcc-12 specific BUILD_CFLAGS setting
  ovmf: add support for Clang toolchain

 meta/recipes-core/ovmf/ovmf_git.bb | 51 ++++++------------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

--=20
2.47.0


