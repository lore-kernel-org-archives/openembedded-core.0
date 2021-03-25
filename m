Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.580.1616693959070822220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 10:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B90951476
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 10:39:08 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 636F23F718
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 10:39:08 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/3] bitbake.conf: ensure BUILD_* tools match target tools
Date: Thu, 25 Mar 2021 17:39:00 +0000
Message-Id: <20210325173901.3057180-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210325173901.3057180-1-ross.burton@arm.com>
References: <20210325173901.3057180-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add a few more tools to the BUILD_* list, to match the target tool list.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ecd4d1638e..4c472156e9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -541,7 +541,10 @@ export BUILD_AR =3D "${BUILD_PREFIX}ar"
 export BUILD_AS =3D "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
 export BUILD_RANLIB =3D "${BUILD_PREFIX}ranlib"
 export BUILD_STRIP =3D "${BUILD_PREFIX}strip"
+BUILD_OBJCOPY =3D "${BUILD_PREFIX}objcopy"
+BUILD_OBJDUMP =3D "${BUILD_PREFIX}objdump"
 export BUILD_NM =3D "${BUILD_PREFIX}nm"
+BUILD_READELF =3D "${BUILD_PREFIX}readelf"
=20
 export MAKE =3D "make"
 EXTRA_OEMAKE =3D ""
--=20
2.25.1

