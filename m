Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61570CD4851
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 09:10:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3557.1778663406437632209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 02:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=HtmgaNWH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: thomas.perrot@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3EC9E1A3598
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 09:10:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08EF8606CE
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 09:10:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22B6A11AF8CB5;
	Wed, 13 May 2026 11:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778663403; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=D8V04Rp7BrHGAk0OojyOq1KUxjO8gXu1uescp/m+hC8=;
	b=HtmgaNWHOtEqr+Eq+c9g0l44TCI2ZZHGo/2+F+2Ulw84viBLqq+Sa/fwLDx4OPNFCfnnLm
	Xmv2QfngaISpD8xkhI1Gj9xw5FelXrGip04r1V93AusEQZTOrkU3sVZ0CuzoQIXD5dY+2C
	UsR42X5gTLC3bVspyejtVRRdSeRWg9fBI5UjEG0q9dkg+RKRHCSE0a7mwtEqFJzcJnvEzS
	3IguNLs4BbW1yjbapCYpgJ/dGLv2iJ4fFfa8ts5EUOuSOJ8RQFZDrThI7sLGczPH/FEWuS
	exnK2xEe67fN3/2MdAeE8KUCPGSCFRL4Qqb3kmGNQGtZd/AsYx5ahkWTZuuHTQ==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] compiler-rt: fix DESCRIPTION variable name typo
Date: Wed, 13 May 2026 11:07:51 +0200
Message-ID: <20260513090751.888177-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 09:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236951

From: Thomas Perrot <thomas.perrot@bootlin.com>

Fix a typo in the variable name: "DESCRIPTIOM" -> "DESCRIPTION".
This misspelling caused BitBake to silently ignore the description
assignment.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-devtools/clang/compiler-rt_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipe=
s-devtools/clang/compiler-rt_git.bb
index a265c2aa9387..a35af99ff615 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -2,7 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
=20
 SUMMARY =3D "LLVM based C/C++ compiler Runtime"
-DESCRIPTIOM =3D "Simple builtin library that provides an \
+DESCRIPTION =3D"Simple builtin library that provides an \
 				implementation of the low-level target-specific \
 				hooks required by code generation and other runtime \
 				components"
--=20
2.54.0


