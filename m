Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.4288.1630675505705321806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53B5211B3
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F20A93F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:04 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/14] selftest/python-async-test: set precise BSD license
Date: Fri,  3 Sep 2021 14:24:49 +0100
Message-Id: <20210903132459.2560051-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-selftest/recipes-devtools/python/python-async-test.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-devtools/python/python-async-test.inc =
b/meta-selftest/recipes-devtools/python/python-async-test.inc
index 439a0b9276a..6d7c7458b03 100644
--- a/meta-selftest/recipes-devtools/python/python-async-test.inc
+++ b/meta-selftest/recipes-devtools/python/python-async-test.inc
@@ -1,7 +1,7 @@
 SUMMARY =3D "Python framework to process interdependent tasks in a pool =
of workers"
 HOMEPAGE =3D "http://github.com/gitpython-developers/async"
 SECTION =3D "devel/python"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D88=
df8e78b9edfd744953862179f2d14e"
=20
 inherit pypi
--=20
2.25.1

