Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F99AC05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:55:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.18337.1676912135079629230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BD7EFEC;
	Mon, 20 Feb 2023 08:56:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DCB33F703;
	Mon, 20 Feb 2023 08:55:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 3/3] python3-pytest: set RDEPENDS globally, not just target
Date: Mon, 20 Feb 2023 16:55:29 +0000
Message-Id: <20230220165529.374011-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220165529.374011-1-ross.burton@arm.com>
References: <20230220165529.374011-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177446

Now that we have the dependencies we can set the RDEPENDS for all builds,
not just target.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pytest_7.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.2.1.bb b/meta/=
recipes-devtools/python/python3-pytest_7.2.1.bb
index 105b76a4a64..c7610d440c1 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.2.1.bb
@@ -11,7 +11,7 @@ DEPENDS +=3D "python3-setuptools-scm-native"
=20
 inherit update-alternatives pypi python_setuptools_build_meta
=20
-RDEPENDS:${PN}:class-target +=3D " \
+RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-atomicwrites \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-debugger \
--=20
2.34.1


