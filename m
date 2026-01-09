Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3886D1A614
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 12:32:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9014.1767961972815551015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 04:32:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=PWj3oLwC;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CB9B34E42023;
	Fri,  9 Jan 2026 12:32:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A278C60734;
	Fri,  9 Jan 2026 12:32:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6C8D103C8900;
	Fri,  9 Jan 2026 13:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767961970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=oo6nJELB6ydQpUlP4A5R8TJTf/2owq/fX5CEQ9erBGI=;
	b=PWj3oLwCwcyXZvOKLE1J3/1MTaE7BxR6vihXX1c7Xq5GwCv828RSzknpj5WBci0B88/hPv
	vc7Y/iFBRywlonIzcDIekxqPPiVIGCN/E6DSA1DhBrkRJLadWZ4hJ7tsVxCAMZFB/ghy86
	ekPhHiIl7BO4JJJ6sIKbqwImlyBbfS/HcngN+D7UGLErr26fyaqjjGk7U3Bd1lwrLJr+JL
	Z3JhExy5ZK7llTfnbaOf+VUAoQ06lTuC5y/jZX2y2MwRNOV2F2lW8OYnFeRa8VkluF3QKr
	qCYo0y/dGIMESrKrEhrLaa23oqfQ3txslpJVVep1NW+M/zwrOtkjb2HH7kMX2A==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	thomas.perrot@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v1 0/2] mesa: fix build-time issues in Whinlatter and master
Date: Fri,  9 Jan 2026 13:32:30 +0100
Message-ID: <20260109123232.1199822-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 12:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229103

Hello,

This series contains a couple fixes for build-time issues I found while b=
uilding
with 'MACHINE =3D "qemuriscv64".

The first patch is a backport for a Whinlatter-specific issue. Pior to th=
at, I
believe LLVM was not recent enough. On the other hand, in master branch, =
the
mesa's version used already contains the fix.

The second patch fixes a QA error found while building mesa-gl.

Best regards,

Jo=C3=A3o Marcos Costa (2):
  mesa: fix build error with llvmpipe gallium driver
  mesa-gl: fix QA issue in do_package

 .../files/0001-gallivm-support-LLVM-21.patch  | 56 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-support=
-LLVM-21.patch

--=20
2.47.0


