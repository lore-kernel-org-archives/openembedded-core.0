Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4332.1630675506898010091
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7837B101E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 204683F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/14] dev-manual/common-tasks: sync libxpm fragment with the recipe
Date: Fri,  3 Sep 2021 14:24:51 +0100
Message-Id: <20210903132459.2560051-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Specifically, the actual recipe now has LICENSE=3DMIT.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/dev-manual/common-tasks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/de=
v-manual/common-tasks.rst
index 4a5011ea749..dba0885110d 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -2361,7 +2361,7 @@ into separate packages::
    require xorg-lib-common.inc
=20
    SUMMARY =3D "Xpm: X Pixmap extension library"
-   LICENSE =3D "BSD"
+   LICENSE =3D "MIT"
    LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D51f4270b012ecd4ab1a164f5f4=
ed6cf7"
    DEPENDS +=3D "libxext libsm libxt"
    PE =3D "1"
--=20
2.25.1

