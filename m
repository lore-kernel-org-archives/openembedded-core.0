Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E404C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 10:58:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7960.1721818712029256457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 03:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B98F106F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 03:58:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A2DE3F766
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 03:58:31 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] python3-pytest: clean up RDEPENDS
Date: Wed, 24 Jul 2024 11:58:30 +0100
Message-Id: <20240724105830.1044394-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 10:58:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202441

These dependencies are only used in development:
- attrs
- setuptools

These dependencies are obsolete:
- atomicwrites removed 7.2.0
- importlib-metadata removed in 5.1.0
- more-itertools removed 6.1.0
- pathlib2 removed 6.2.2
- py removed in 7.2
- six removed in 5.0.0
- wcwidth removed in 6.0.0

This removals now means that python3-xml has to be added explicitly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pytest_8.2.2.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.2.2.bb b/meta/=
recipes-devtools/python/python3-pytest_8.2.2.bb
index 531f40df81d..f0d16f473f2 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.2.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.2.2.bb
@@ -12,22 +12,14 @@ DEPENDS +=3D "python3-setuptools-scm-native"
 inherit update-alternatives pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
-    python3-atomicwrites \
-    python3-attrs \
+    python3-xml \
     python3-debugger \
     python3-doctest \
-    python3-importlib-metadata \
     python3-iniconfig \
     python3-json \
-    python3-more-itertools \
     python3-packaging \
-    python3-pathlib2 \
     python3-pluggy \
-    python3-py \
-    python3-setuptools \
-    python3-six \
     python3-tomllib \
-    python3-wcwidth \
 "
=20
 ALTERNATIVE:${PN} +=3D "py.test pytest"
--=20
2.34.1


