Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5D7FF8870
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:08:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6358.1777324131993818593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ahQCeTuO;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA26816F2
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:45 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EFE543F7B4
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777324131; bh=CYIYfOsKoCQG5Ep94zdS0YAFi9wEghnoCWFiOtpbN6c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ahQCeTuO4+D6Hu6Fpc9kZVE4dCN35d3Avz7K9ZTQ74Y456+CnTGeV3wmqI7YnyAY2
	 PhWJjP7uMuSTOXwfLzoQBSDlQClh1zbua+64zFOLmFkIh6JE20+87RG1z/KpDM3FjI
	 ys0NcZsDs3PZb62ftck8UPhBCOUN2/Qhj4hHZChU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] python3-cryptography: remove obsolete explicit debug packaging
Date: Mon, 27 Apr 2026 22:08:45 +0100
Message-ID: <20260427210847.3027890-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427210847.3027890-1-ross.burton@arm.com>
References: <20260427210847.3027890-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236027

The .debug directories are packaged automatically by default, so this is
redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-cryptography.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/=
recipes-devtools/python/python3-cryptography.bb
index fc5cb50b029..9387dd725a8 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -69,8 +69,4 @@ do_install_ptest() {
     cp -r ${S}/pyproject.toml ${D}${PTEST_PATH}/
 }
=20
-FILES:${PN}-dbg +=3D " \
-    ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
-"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


