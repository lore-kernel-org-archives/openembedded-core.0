Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1618.1630599888277276065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1AC0101E
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:50 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AD433F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:50 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/14] python3-packaging: fix license statement
Date: Thu,  2 Sep 2021 17:24:30 +0100
Message-Id: <20210902162435.1375245-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is licensed as Apache OR BSD, not AND.

Also use the precise license BSD-2-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-packaging_21.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-packaging_21.0.bb b/met=
a/recipes-devtools/python/python3-packaging_21.0.bb
index eacc48e56af..201b583de22 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Core utilities for Python packages"
 HOMEPAGE =3D "https://github.com/pypa/packaging"
-LICENSE =3D "Apache-2.0 & BSD"
+LICENSE =3D "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfaadaedca9251a90b205c9167578c=
e91"
=20
 SRC_URI[sha256sum] =3D "7dc96269f53a4ccec5c0670940a4281106dd0bb343f47b74=
71f779df49c2fbe7"
--=20
2.25.1

