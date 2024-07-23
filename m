Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAD1C52CD9
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:52:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.45860.1721746320185328777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AA041476
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:52:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89B903F73F
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:51:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 32/37] python3-spdx-tools: use python_setuptools_build_meta build class
Date: Tue, 23 Jul 2024 15:51:32 +0100
Message-Id: <20240723145137.74198-32-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723145137.74198-1-ross.burton@arm.com>
References: <20240723145137.74198-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202399

This package can be built using pep517 classes now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb b/m=
eta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
index 53263ca032c..6573ae9eee4 100644
--- a/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
+++ b/meta/recipes-devtools/python/python3-spdx-tools_0.8.2.bb
@@ -8,7 +8,9 @@ SRC_URI[sha256sum] =3D "aea4ac9c2c375e7f439b1cef5ff32ef34=
914c083de0f61e08ed67cd3d9
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
+
+DEPENDS +=3D "python3-setuptools-scm-native"
=20
 # Dependency required for pyspdxtools : python3-click
 # Dependencies required for conversion to spdx3 : python3-semantic-versi=
on, python3-ply
--=20
2.34.1


