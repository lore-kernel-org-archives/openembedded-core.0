Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CE7C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 12:54:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.128205.1683032059865354318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 05:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EC8EC14;
	Tue,  2 May 2023 05:55:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C92913F64C;
	Tue,  2 May 2023 05:54:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] python3-pytest: add missing tomllib RDEPENDS
Date: Tue,  2 May 2023 13:54:16 +0100
Message-Id: <20230502125416.1430729-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 12:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180728

Pytest can call tomllib (for example, when running the
python3-cryptography tests), so add it as a RDEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pytest_7.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb b/meta/=
recipes-devtools/python/python3-pytest_7.3.1.bb
index 9965844d1ad..914ea553464 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
@@ -26,6 +26,7 @@ RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
+    ${PYTHON_PN}-tomllib \
     ${PYTHON_PN}-wcwidth \
 "
=20
--=20
2.34.1


