Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72919C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 11:40:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8256.1646912439389704725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DB551692
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:40:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D7D63F7D8
	for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 03:40:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-pip: remove redundant DEPENDS on
 python3-setuptools-native
Date: Thu, 10 Mar 2022 11:40:34 +0000
Message-Id: <20220310114035.2226442-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310114035.2226442-1-ross.burton@arm.com>
References: <20220310114035.2226442-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 11:40:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163013

This recipe inherits setuptools_build_meta which already depends on
python3-setuptools-native.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pip_22.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/re=
cipes-devtools/python/python3-pip_22.0.3.bb
index f7fcf47c06..bce3b68861 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf9=
5163b597008bb46db68030"
=20
 inherit pypi setuptools_build_meta
=20
-DEPENDS +=3D "python3 python3-setuptools-native"
+DEPENDS +=3D "python3"
=20
 # To avoid a dependency loop; we bootstrap -native
 DEPENDS:remove:class-native =3D "python3-pip-native"
--=20
2.25.1


