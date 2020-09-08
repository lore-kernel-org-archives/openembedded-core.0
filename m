Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24667.1599583667163413695
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 09:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76D5D31B
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2020 09:47:46 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 196893F68F
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2020 09:47:45 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cmake: whitelist CVE-2016-10642
Date: Tue,  8 Sep 2020 17:47:44 +0100
Message-Id: <20200908164744.3791001-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This CVE is specific to the npm package that can install cmake, so isn't
relevant to our cmake recipe.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/cmake/cmake.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtool=
s/cmake/cmake.inc
index 1334977225..fa1b818ae4 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -25,3 +25,7 @@ SRC_URI =3D "https://cmake.org/files/v${CMAKE_MAJOR_VER=
SION}/cmake-${PV}.tar.gz \
 SRC_URI[sha256sum] =3D "5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b3=
6a1cb552bbd51d7e"
=20
 UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
+
+# This is specific to the npm package that installs cmake, so isn't
+# relevant to OpenEmbedded
+CVE_CHECK_WHITELIST +=3D "CVE-2016-10642"
--=20
2.28.0

