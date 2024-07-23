Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE8FC52D1E
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45855.1721746316751632430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E74841476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 266F33F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 26/37] python3-pycryptodome(x): use python_setuptools_build_meta build class
Date: Tue, 23 Jul 2024 15:51:26 +0100
Message-Id: <20240723145137.74198-26-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202393

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb  | 2 +-
 meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb =
b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
index d24fa58d43f..6c93c205ac8 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "09609209ed7de61c2b560cc5c8c4fbf892f8b15b1faf7e4c=
bffac97db1fffda7"
=20
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb=
 b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
index 2673ea83262..54578d28509 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
@@ -1,5 +1,5 @@
 require python-pycryptodome.inc
-inherit setuptools3
+inherit python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "7a710b79baddd65b806402e14766c721aee8fb83381769c2=
7920f26476276c1e"
=20
--=20
2.34.1


