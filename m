Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DADBC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 18:32:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.436.1647455567104115387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E69521476
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:45 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D0E23F766
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:45 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] python3-packaging: remove duplicate
 python3-setuptools-native DEPENDS
Date: Wed, 16 Mar 2022 18:32:36 +0000
Message-Id: <20220316183243.876234-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 18:32:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163347

setuptools_build_meta.bbclass already sets this dependency.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-packaging_21.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-packaging_21.3.bb b/met=
a/recipes-devtools/python/python3-packaging_21.3.bb
index c7d0cb7ef7..a81fd94d37 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.3.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.3.bb
@@ -9,5 +9,4 @@ inherit pypi setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-DEPENDS +=3D "${PYTHON_PN}-setuptools-native"
 RDEPENDS:${PN} +=3D "${PYTHON_PN}-pyparsing"
--=20
2.25.1


