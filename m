Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E35FC4167D
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:10:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.22671.1653585009041861381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 10:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94FFA168F;
	Thu, 26 May 2022 10:10:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31B383F66F;
	Thu, 26 May 2022 10:10:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH 02/10] setuptools3: clean up class
Date: Thu, 26 May 2022 18:09:53 +0100
Message-Id: <20220526171001.4074388-3-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166188

Remove a commented-out B, re-order DEPENDS< and add comments.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/setuptools3.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.=
bbclass
index 556bc801af7..66c94660d8e 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,7 +1,6 @@
 inherit setuptools3-base python_pep517
=20
-# bdist_wheel builds in ./dist
-#B =3D "${WORKDIR}/build"
+DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
=20
 SETUPTOOLS_BUILD_ARGS ?=3D ""
=20
@@ -23,6 +22,7 @@ setuptools3_do_compile() {
 setuptools3_do_compile[vardepsexclude] =3D "MACHINE"
 do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
=20
+# This could be removed in the future but some recipes in meta-oe still =
use it
 setuptools3_do_install() {
         python_pep517_do_install
 }
@@ -30,4 +30,3 @@ setuptools3_do_install() {
 EXPORT_FUNCTIONS do_configure do_compile do_install
=20
 export LDSHARED=3D"${CCLD} -shared"
-DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
--=20
2.25.1


