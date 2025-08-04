Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27A1C87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:11:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7312.1754341869225567043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A648F1E4D
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 14:11:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4FC183F673
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Aug 2025 14:11:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3-setuptools-scm: clean up dependencies
Date: Mon,  4 Aug 2025 22:11:05 +0100
Message-ID: <20250804211106.327799-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 21:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221447

typing-extensions is only needed with Python <3.10 we have 3.13, remove.

pyparsing and pip are not dependencies, not sure why they're here so
remove.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb=
 b/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
index 70eaf312d3f..81e04ddea55 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_8.3.1.bb
@@ -13,14 +13,11 @@ UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
 inherit pypi python_setuptools_build_meta
=20
-DEPENDS +=3D "python3-packaging-native python3-typing-extensions-native"
+DEPENDS +=3D "python3-packaging-native"
=20
 RDEPENDS:${PN} =3D "\
     python3-packaging \
-    python3-pip \
-    python3-pyparsing \
     python3-setuptools \
-    python3-typing-extensions \
 "
=20
 RDEPENDS:${PN}:append:class-target =3D " \
--=20
2.43.0


