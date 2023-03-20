Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D31CC7618D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 13:28:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13895.1679318875533752304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 06:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58BB81042;
	Mon, 20 Mar 2023 06:28:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E99773F71E;
	Mon, 20 Mar 2023 06:27:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 01/17] python3-numpy: add missing dependency for the tests
Date: Mon, 20 Mar 2023 13:27:35 +0000
Message-Id: <20230320132751.518693-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 13:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178813

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-numpy_1.24.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.24.2.bb b/meta/=
recipes-devtools/python/python3-numpy_1.24.2.bb
index 78a857bf160..bfcfc527298 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
@@ -66,6 +66,7 @@ RDEPENDS:${PN}-ptest +=3D "${PYTHON_PN}-pytest \
                          ${PYTHON_PN}-hypothesis \
                          ${PYTHON_PN}-sortedcontainers \
                          ${PYTHON_PN}-resource \
+                         ${PYTHON_PN}-typing-extensions \
                          ldd \
 "
=20
--=20
2.34.1


