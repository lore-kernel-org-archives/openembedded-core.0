Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49B4C433F5
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 15:37:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.12521.1647358647289039599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E0571474
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:37:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09F583F766
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 08:37:25 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-setuptools-rust-native: use setuptools_build_meta
Date: Tue, 15 Mar 2022 15:37:21 +0000
Message-Id: <20220315153721.601437-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 15:37:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163303

The wheel generation problems are solved now: a wheel is correctly built
to setuptools_rust-1.1.2-py3-none-any.whl, so we can use
setuptools_build_meta.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-setuptools-rust-native_1.1.2.bb           | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust-native_=
1.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.=
1.2.bb
index 2b92972700..bac7b6434a 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.b=
b
+++ b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.b=
b
@@ -12,10 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D011cd92e702=
dd9e6b1a26157b6fd53f5"
 SRC_URI =3D "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62a=
c76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar=
.gz"
 SRC_URI[sha256sum] =3D "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea=
7f747e153a3e65d1"
=20
-# While this has a pyproject.toml and declares that setuptools_build_met=
a should work
-# it results in a wheel named UNKNOWN-0.0.0-py3-none-any.whl so stay wit=
h setuptools3
-# until that can be resolved
-inherit cargo pypi setuptools3 native
+inherit cargo pypi setuptools_build_meta native
=20
 DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
=20
--=20
2.25.1


