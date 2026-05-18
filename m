Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E91CD4F54
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 10:32:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5490.1779100376273881378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 03:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nr6gCyCz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 600644617
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:32:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 162E73F85F
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 03:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779100375; bh=jZHdtPFxXUXosb80jRpTPDcInvn4uoO/dDBMjGUO2ig=;
	h=From:To:Subject:Date:From;
	b=nr6gCyCzSZTURxsvZqXEPjODmQEC6ahBZ336JZ6mFHPcuXME0vOjNXG30CmYREmMJ
	 LTP9PqpmpA4HQ+9ONJjYc5ZiBd2Dj+HoCTuF6h2eIrWAl4fB/zkgClXRes97p0Qq+E
	 hfyhs1EJcXIwMeOLqhYMg9crD26a/EvPCq+Vizvo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] nasm: remove groff-native dependency
Date: Mon, 18 May 2026 11:32:46 +0100
Message-ID: <20260518103249.592747-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 10:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237213

The documentation hasn't been built with groff since 2013[1], remove the
dependency.

[1] nasm 1a63699c ("man: Generate manpages from asciidoc format")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/nasm/nasm_3.01.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devto=
ols/nasm/nasm_3.01.bb
index 1e4719000f8..237ea947c7e 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -19,6 +19,4 @@ inherit autotools-brokensep
=20
 BBCLASSEXTEND =3D "native"
=20
-DEPENDS =3D "groff-native"
-
 CVE_PRODUCT =3D "netwide_assembler"
--=20
2.43.0


