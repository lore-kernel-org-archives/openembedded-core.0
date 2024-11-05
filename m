Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1355DD3E777
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 21:56:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.32294.1730843810790832232
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 13:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 123AA1063
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 13:57:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CC1743F528
	for <openembedded-core@lists.openembedded.org>; Tue,  5 Nov 2024 13:56:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-cython: remove obsolete SETUPTOOLS_INSTALL_ARGS
Date: Tue,  5 Nov 2024 21:56:43 +0000
Message-Id: <20241105215644.1884070-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 21:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206756

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-cython_3.0.11.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cython_3.0.11.bb b/meta=
/recipes-devtools/python/python3-cython_3.0.11.bb
index 81ee1b799cb..020a8e7205c 100644
--- a/meta/recipes-devtools/python/python3-cython_3.0.11.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.0.11.bb
@@ -17,11 +17,6 @@ DEPENDS:remove =3D "python3-cython-native"
=20
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "Cython"
=20
-# running build_ext a second time during install fails, because Python
-# would then attempt to import cythonized modules built for the target
-# architecture.
-SETUPTOOLS_INSTALL_ARGS +=3D "--skip-build"
-
 do_install:append() {
     # rename scripts that would conflict with the Python 2 build of Cyth=
on
     mv ${D}${bindir}/cython ${D}${bindir}/cython3
--=20
2.34.1


