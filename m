Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD0DCDB46B
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 08:39:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38913.1782117587024099821
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 01:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Y1GaVYPz;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BBCCE4E405B4
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:39:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91482601BB
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CDE46106C89CF;
	Mon, 22 Jun 2026 10:39:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782117583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wZvfLQD3kOyj3P9Q1pHCe9Vs2EO7S2NaSNwqv37LIUE=;
	b=Y1GaVYPzBXkvrz0KPpmkg32FbaSLV4dGvthSD3jALMgxY7Lt43SF87COZND8ZNfmezOojS
	7FpTEq1+48GSew/SBpxo7ZznZDf794X2IBywVLK/ORvIXIJmcQfjbqYYXmPF5TjQpfQ3Tl
	ZCpYyMyKt6XftNK7fMG66x94k8MysL30hYhKg5WLafOfrB7XjOXOh7Vv6gSKEAeC0+QBOC
	RyjyvnAcnRPsvjuhVNw5Cy5E04N7m/cTAaAJmZZxSN1JC5fjceCLrLE3coDItNbpvj51lv
	TR71AaYNLa5R2AyyCAPdVrpKW37NtT47ZXd/m15WeJTkgYIAUM98mDVTk2Z0Gg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	thomas.perrot@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH] local.conf.sample.extended: update fortran example
Date: Mon, 22 Jun 2026 10:39:26 +0200
Message-ID: <20260622083926.37678-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239276

Since Whinlatter [1], FORTRAN is set by a weak assignment, so the
':forcevariable' is no longer needed.

Update the example accordingly, and replace the outdated comments above.

[1]: https://git.openembedded.org/openembedded-core/commit/?id=3D50abae55=
eda0115d073bbc6552f2fcb4ecbb7949

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/templates/default/local.conf.sample.extended | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/conf/templates/default/local.conf.sample.extended b/met=
a/conf/templates/default/local.conf.sample.extended
index 999a09dac1..f4e35d94fd 100644
--- a/meta/conf/templates/default/local.conf.sample.extended
+++ b/meta/conf/templates/default/local.conf.sample.extended
@@ -305,10 +305,9 @@
 #USERADD_ERROR_DYNAMIC =3D "1"
=20
 # Enabling FORTRAN
-# Note this is not officially supported and is just illustrated here to
-# show an example of how it can be done
-# You'll also need your fortran recipe to depend on libgfortran
-#FORTRAN:forcevariable =3D ",fortran"
+# This variable will fall into LANGUAGES variable (i.e., "c,c++${FORTRAN=
}"),
+# which is then consumed in gcc-configure-common.inc.
+#FORTRAN =3D ",fortran"
=20
 #
 # Kernel image features
--=20
2.47.0


