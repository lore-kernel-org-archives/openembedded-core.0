Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA67DC88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 10:40:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36806.1789123224490772245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 03:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hYXxPUup;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CD8E16F2
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 03:40:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D0323F7B4
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 03:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789123223; bh=R4hKBq4CZ2sJNJ84ZJYrqJWrv3gxwVSGqRB0353VlBY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hYXxPUupyFIu7xQ9B1UJi7TKIBV7+xp46DTHiE3dYd2fQXsjziN9zrDhCJNwAKJEM
	 XOTA06Wsf+X0sbXMbiM2kR7i9Pn3xN6DutQ42pEn3m4qg7b69YiYkWc42gJqZAmOzj
	 5NaFTmPIrtymDMAq6uJQgBcFou6TLeSP3cR7k2H0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-pytz: remove redundant RDEPENDS
Date: Fri, 11 Sep 2026 11:40:17 +0100
Message-ID: <20260911104018.1569984-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911104018.1569984-1-ross.burton@arm.com>
References: <20260911104018.1569984-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 10:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245630

The dependencies on python3-pytest and python3-unittest-automake-output
are added by the ptest-python-pytest class already.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pytz_2026.3.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pytz_2026.3.bb b/meta/r=
ecipes-devtools/python/python3-pytz_2026.3.bb
index cfcf33c8376..11d5c22c07b 100644
--- a/meta/recipes-devtools/python/python3-pytz_2026.3.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.3.bb
@@ -20,11 +20,6 @@ RDEPENDS:${PN}:class-target +=3D "\
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-RDEPENDS:${PN}-ptest +=3D " \
-	python3-pytest \
-	python3-unittest-automake-output \
-"
-
 do_install_ptest:append() {
 	cp -f ${S}/README.rst ${D}${PTEST_PATH}/
 }
--=20
2.43.0


