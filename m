Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29687C43219
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 18:32:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.438.1647455568638149023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55CF11515
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0625B3F766
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] classes/python_pep517: add more comments
Date: Wed, 16 Mar 2022 18:32:41 +0000
Message-Id: <20220316183243.876234-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316183243.876234-1-ross.burton@arm.com>
References: <20220316183243.876234-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 18:32:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163352

Remove mention of prebuilt wheels, this is for the full PEP517 build
process and recipes that want to install prebuilt wheels can use
pypa/installer directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/python_pep517.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/python_pep517.bbclass b/meta/classes/python_pep=
517.bbclass
index 83c6dcb5c7..73bcf9ba07 100644
--- a/meta/classes/python_pep517.bbclass
+++ b/meta/classes/python_pep517.bbclass
@@ -1,5 +1,8 @@
 # Common infrastructure for Python packages that use PEP-517 compliant p=
ackaging.
 # https://www.python.org/dev/peps/pep-0517/
+#
+# This class will build a wheel in do_compile, and use pypa/installer to=
 install
+# it in do_install.
=20
 DEPENDS:append =3D " python3-installer-native"
=20
@@ -9,14 +12,14 @@ PEP517_SOURCE_PATH ?=3D "${S}"
 # The PEP517 build API entry point
 PEP517_BUILD_API ?=3D "unset"
=20
-# The directory where wheels should be written too. Build classes
-# will ideally [cleandirs] this but we don't do that here in case
-# a recipe wants to install prebuilt wheels.
+# The directory where wheels will be written
 PEP517_WHEEL_PATH ?=3D "${WORKDIR}/dist"
=20
+# The interpreter to use for installed scripts
 PEP517_INSTALL_PYTHON =3D "python3"
 PEP517_INSTALL_PYTHON:class-native =3D "nativepython3"
=20
+# pypa/installer option to control the bytecode compilation
 INSTALL_WHEEL_COMPILE_BYTECODE ?=3D "--compile-bytecode=3D0"
=20
 # When we have Python 3.11 we can parse pyproject.toml to determine the =
build
--=20
2.25.1


