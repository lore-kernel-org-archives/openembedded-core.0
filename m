Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0D7CD4851
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 13:35:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11141.1778765724298936192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 06:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=0cUPOwzt;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0F8FB1A35BF;
	Thu, 14 May 2026 13:35:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C451660495;
	Thu, 14 May 2026 13:35:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CF3011AF8C61;
	Thu, 14 May 2026 15:35:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778765721; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9wKH44rh9ouBdpFLYpz4UcwKj54bAlyqIsDpdKs6unE=;
	b=0cUPOwztTvm/F6Vn+iU1jF3QT3PCRoyYZP+VNvQdjEQMtkGaf8bu4B4yuU6Kll/QNU4Oto
	E36ekVc2IIbYXCb+NXV3Umn5yZ/330EN1nIrEuwfv0Lu6i3IFsaNg8evTM6CLjur8Ov51M
	9OSPhpRG4hMenYvMIkTCNP0B7GdqEIg6+ExmC6cm0QXow+WwLLenZ2mglPfCpZcsv9QujH
	4h3hy8BnCCrAHCbJwsd25S1wpyKdM/YJzmt/33wsd7UIXejcsWsoaWP1VTpyCBbcUmUt/p
	H8tCDG4bWDUlhARfZjlVeH18/4CPluBfMYcCTV/zPHUbk6zS65bZmT4QH9QN/w==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	raj.khem@gmail.com,
	Ross.Burton@arm.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 0/3] ovmf: add some rework to the recipe
Date: Thu, 14 May 2026 15:34:43 +0200
Message-ID: <20260514133446.219612-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 13:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237031

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

---

Changes since v1:
- clarify the behaviour change in PACKAGECONFIG's assignment
- in the second patch, make it clear that the flag is obsolete because it=
 was
  already upstreamed (and is part of the currently used tag), not because=
 of
  GCC's version

Jo=C3=A3o Marcos Costa (3):
  ovmf: simplify PACKAGECONFIG's default value
  ovmf: drop upstreamed BUILD_CFLAGS setting
  ovmf: add support for Clang toolchain

 meta/recipes-core/ovmf/ovmf_git.bb | 51 ++++++------------------------
 1 file changed, 9 insertions(+), 42 deletions(-)

--=20
2.47.0


