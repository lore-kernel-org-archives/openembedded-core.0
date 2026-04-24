Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A6CFED3D9
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 15:10:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25102.1777043430793604604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 08:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=cTe/xDv4;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C6DAD4E42B01
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 15:10:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D234604EB
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 15:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF2B9107208EE;
	Fri, 24 Apr 2026 17:10:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777043428; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Dag0H6LNWZtgagl7rB4urMVl0DyOlWcGGWl0Ue1BnYc=;
	b=cTe/xDv4k1njg1hk0ZvbA/pH7MlbVzWUhqGPfwPY0kIwUUsxYyMOyBV3KfVgosWbVr2Tgk
	hZwu4Qx2qQNPJxYu12KpeGsdAHrNLIeA1YJFMBT+cXrpWSEPzHBpA5lqKKS57TiHZ89d4G
	IySepwcHbdgQ/Ai4ACizx6ySTPWC4hTR/QfOO1d+c3jvqSihtVLVW6FZ28+5VMHIIDlTny
	vF2CMTZV6ZvZk5DEeGaUoeuplOeL4xPTM0LRi4d2tyznXU2NcSTCnkioDju0JqwSa27806
	Xqs0nFB1JAK3OE7kPC3d2JLQHfxiXcSEKzQg7vz9UeXWyug2AgeU45qOFyjPcQ==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] soc-family.inc: improve clarity at MACHINEOVERRIDES's prepend
Date: Fri, 24 Apr 2026 17:10:13 +0200
Message-ID: <20260424151013.12534-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 15:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235867

Use Python's ternary operator "A if condition else B".

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/machine/include/soc-family.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/soc-family.inc b/meta/conf/machine=
/include/soc-family.inc
index 1ff0899812..cdc7a5a64c 100644
--- a/meta/conf/machine/include/soc-family.inc
+++ b/meta/conf/machine/include/soc-family.inc
@@ -1,3 +1,3 @@
 # Add SOC_FAMILY to machine overrides so we get access to e.g. 'omap3' a=
nd 'ti335x'
 SOC_FAMILY ??=3D ""
-MACHINEOVERRIDES =3D. "${@['', '${SOC_FAMILY}:']['${SOC_FAMILY}' !=3D ''=
]}"
+MACHINEOVERRIDES =3D. "${@'${SOC_FAMILY}:' if '${SOC_FAMILY}' else '' }"
--=20
2.47.0


