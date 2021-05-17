Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17857.1621252687656897934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 04:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 231D112FC
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:58:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C23553F73B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 04:58:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libsolv: add missing db dependency
Date: Mon, 17 May 2021 12:58:03 +0100
Message-Id: <20210517115803.866262-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517115803.866262-1-ross.burton@arm.com>
References: <20210517115803.866262-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The RPM option currently enables ENABLE_RPMDB_BDB which means libsolv
depends on db.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/libsolv/libsolv_0.7.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb b/meta/recip=
es-extended/libsolv/libsolv_0.7.19.bb
index 98e106f6f8a..0c69636323b 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.19.bb
@@ -20,7 +20,7 @@ S =3D "${WORKDIR}/git"
 inherit cmake
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm=
','rpm','',d)}"
-PACKAGECONFIG[rpm] =3D "-DENABLE_RPMMD=3DON -DENABLE_RPMDB=3DON -DENABLE=
_RPMDB_BDB=3DON,,rpm"
+PACKAGECONFIG[rpm] =3D "-DENABLE_RPMMD=3DON -DENABLE_RPMDB=3DON -DENABLE=
_RPMDB_BDB=3DON,,db rpm"
=20
 EXTRA_OECMAKE =3D "-DMULTI_SEMANTICS=3DON -DENABLE_COMPLEX_DEPS=3DON"
=20
--=20
2.25.1

