Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68200C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 14:36:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55470.1786458973010026772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 07:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=aLqrn4MH;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B721516
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:36:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 227793F86F
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786458972; bh=0DDTtvzLeCxHqqP5MDiZgAE/5W2zZCulnKFqZ5K4H6s=;
	h=From:To:Subject:Date:From;
	b=aLqrn4MHiXgLxx7CGxfI+/Bbk8UWdzRGfI6pxuz0W9UZFhRLR1QKOAhgIlacJljR7
	 iaXuiyZYA/wccIb7VCEpBf1Y1gVarOJTg0bYLzDfJuq9wE3u4XtEqK+ysDMX78cY6c
	 VeBeEYu9oMyaV66JI2/LiMh4LQz2u9G3zbTStkkE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] python3-setuptools-rust: remove wheel dependency
Date: Tue, 11 Aug 2026 15:36:04 +0100
Message-ID: <20260811143607.1200407-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 14:36:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243206

The dependency on wheel was removed in 2021[1].

[1] https://github.com/PyO3/setuptools-rust/commit/1d7ee9fc239c846fdd5aac=
5f3a28705333d47d77

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.=
bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
index 884d6a6771e..ecb2169a3f6 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
@@ -16,7 +16,7 @@ PYPI_PACKAGE =3D "setuptools_rust"
=20
 inherit cargo pypi python_setuptools_build_meta
=20
-DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
+DEPENDS +=3D "python3-setuptools-scm-native"
=20
 RDEPENDS:${PN} +=3D " \
     python3-json \
@@ -25,7 +25,6 @@ RDEPENDS:${PN} +=3D " \
     python3-setuptools-scm \
     python3-shell \
     python3-typing-extensions \
-    python3-wheel \
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


