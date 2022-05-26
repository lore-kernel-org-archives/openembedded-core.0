Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D66C43217
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:10:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.22571.1653585009676254892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 10:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45BFC1688;
	Thu, 26 May 2022 10:10:11 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA57A3F66F;
	Thu, 26 May 2022 10:10:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH 06/10] python3-setuptools-scm: DEPEND on python3-packaging
Date: Thu, 26 May 2022 18:09:57 +0100
Message-Id: <20220526171001.4074388-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526171001.4074388-1-ross.burton@arm.com>
References: <20220526171001.4074388-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 17:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166192

This is a build dependency that isn't flagged when we call the build
API directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb=
 b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
index 9aaae071d31..212aa8a005a 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
@@ -11,7 +11,7 @@ inherit pypi python_setuptools_build_meta
=20
 UPSTREAM_CHECK_REGEX =3D "setuptools_scm-(?P<pver>.*)\.tar"
=20
-DEPENDS +=3D "python3-tomli-native"
+DEPENDS +=3D "python3-tomli-native python3-packaging-native"
=20
 RDEPENDS:${PN} =3D "\
     ${PYTHON_PN}-packaging \
--=20
2.25.1


