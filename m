Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83E5C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 11:07:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35200.1782731216685723973
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 04:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=g1rQ0J6x;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4D4B0C5145E;
	Mon, 29 Jun 2026 11:07:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FD985FF96;
	Mon, 29 Jun 2026 11:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88D7B106F1732;
	Mon, 29 Jun 2026 13:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782731213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kpd9gjNV+J5BQWdI1bpYN6voReIGKx0/RApgYLIw7qE=;
	b=g1rQ0J6x6NhpWcMHWD0Xwd+NGCOFR2BZWeWC2RnagOcyRIOADw2dP/zBW+Ye9xGxHXQihV
	5TTVUXlKmsIxYOpe81j2qWcmLp9zc3bBmcUtTTDCeFLMDBLiKbXctdUZYG0HY7RzFS8RMk
	aIjBUiU1LkevG+9DoArpRKlJ7sMDkpGuUR/x44QginXxJzO3ie17DYs21p/GWKzDJrqzaE
	HXDlcGCjkSn4oq4+HrCkcTno+MmaB0qslRQWz94TffUahKPPUPw8OLAqy078g4cQKgA4q5
	KOdepWbjh+l4IE5ZnNrw0Q/15OQ7kDlKp5jEUKo9d+BTqrxFglu+HjgIDQv0gg==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 2/2] clang_git.bb: remove dangling comment
Date: Mon, 29 Jun 2026 13:06:19 +0200
Message-ID: <20260629110619.530623-3-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260629110619.530623-1-joaomarcos.costa@bootlin.com>
References: <20260629110619.530623-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 11:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239758

CMAKE_VERBOSE is already enabled in cmake.bbclass (inherited in this
recipe). I would have considering uncommenting the line if it originally
meant to disable the verbose mode.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 662cda1b2e..d55c59ffa0 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -54,8 +54,6 @@ OECMAKE_SOURCEPATH =3D "${S}/clang"
 # linux hosts (.so) on Windows .pyd
 SOLIBSDEV:mingw32 =3D ".pyd"
=20
-#CMAKE_VERBOSE =3D "VERBOSE=3D1"
-
 EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_ENABLE_PIC=3DON \
                   -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
--=20
2.47.0


