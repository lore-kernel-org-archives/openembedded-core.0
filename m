Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4214.1630675506386042163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCCD0D6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:05 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 867ED3F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:05 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/14] oeqa/recipeutils: update for license change to python-async-test
Date: Fri,  3 Sep 2021 14:24:50 +0100
Message-Id: <20210903132459.2560051-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The python-async-test recipe is now BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipeutils.py b/meta/lib/oeqa/=
selftest/cases/recipeutils.py
index 97edad88b57..f1dd63f65b4 100644
--- a/meta/lib/oeqa/selftest/cases/recipeutils.py
+++ b/meta/lib/oeqa/selftest/cases/recipeutils.py
@@ -40,7 +40,7 @@ class RecipeUtilsTests(OESelftestTestCase):
  SUMMARY =3D "Python framework to process interdependent tasks in a pool=
 of workers"
  HOMEPAGE =3D "http://github.com/gitpython-developers/async"
  SECTION =3D "devel/python"
--LICENSE =3D "BSD"
+-LICENSE =3D "BSD-3-Clause"
 +LICENSE =3D "something"
  LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D8=
8df8e78b9edfd744953862179f2d14e"
 =20
--=20
2.25.1

