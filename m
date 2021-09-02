Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1617.1630599887985732704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD23E1063
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78E613F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/14] python3-numpy: remove redundant BSD license
Date: Thu,  2 Sep 2021 17:24:23 +0100
Message-Id: <20210902162435.1375245-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The license list already includes BSD-2-Clause and BSD-3-Clause, so
remove the redundant and ambiguous BSD license.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb b=
/meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb
index 2d4c62af811..8e09585712d 100644
--- a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb
+++ b/meta/recipes-devtools/python-numpy/python3-numpy_1.21.2.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "A sophisticated Numeric Processing Package f=
or Python"
 HOMEPAGE =3D "https://numpy.org/"
 DESCRIPTION =3D "NumPy is the fundamental package needed for scientific =
computing with Python."
 SECTION =3D "devel/python"
-LICENSE =3D "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD & MIT"
+LICENSE =3D "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db076ad374a7d311ba3126a22b=
2d52596"
=20
 SRCNAME =3D "numpy"
--=20
2.25.1

