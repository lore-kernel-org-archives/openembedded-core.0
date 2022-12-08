Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0263CC10F1B
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 19:30:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.24587.1670527836245111910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 11:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A90D8D6E;
	Thu,  8 Dec 2022 11:30:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78A913F71A;
	Thu,  8 Dec 2022 11:30:35 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] python3-cryptography: remove python3-tomli RDEPENDS
Date: Thu,  8 Dec 2022 19:30:23 +0000
Message-Id: <20221208193024.3189494-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208193024.3189494-1-ross.burton@arm.com>
References: <20221208193024.3189494-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 19:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174410

The test suite doesn't use tomli, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-cryptography_38.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb =
b/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb
index 14ad459c1b1..4bbc0904ed7 100644
--- a/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb
@@ -45,7 +45,6 @@ RDEPENDS:${PN}-ptest +=3D " \
     ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytest-subtests \
     ${PYTHON_PN}-pytz \
-    ${PYTHON_PN}-tomli \
 "
=20
 inherit ptest
--=20
2.34.1


