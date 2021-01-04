Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16967.1609781967953640637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 09:39:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93F98101E
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Jan 2021 09:39:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 401F43F66E
	for <openembedded-core@lists.openembedded.org>; Mon,  4 Jan 2021 09:39:27 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] diffstat: point the license checksum at the license
Date: Mon,  4 Jan 2021 17:39:25 +0000
Message-Id: <20210104173925.2362700-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Previously install-sh was used, which is installed by autoconf so isn't
a relevant license.

Also remove S assignment, as that's the default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.63.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.63.bb b/meta/recip=
es-devtools/diffstat/diffstat_1.63.bb
index 61b2ea5dc2..863f924b22 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.63.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
@@ -5,7 +5,7 @@ reviewing large, complex patch files."
 HOMEPAGE =3D "http://invisible-island.net/diffstat/"
 SECTION =3D "devel"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://install-sh;endline=3D42;md5=3Db3549726c1022=
bee09c174c72a0ca4a5"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da3d0bb117493e804b0c1a868ddf23=
321"
=20
 SRC_URI =3D "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
@@ -16,8 +16,6 @@ SRC_URI =3D "http://invisible-mirror.net/archives/${BPN=
}/${BP}.tgz \
 SRC_URI[md5sum] =3D "b9272ec8af6257103261ec3622692991"
 SRC_URI[sha256sum] =3D "7eddd53401b99b90bac3f7ebf23dd583d7d99c6106e67a4f=
1161b7a20110dc6f"
=20
-S =3D "${WORKDIR}/diffstat-${PV}"
-
 inherit autotools gettext ptest
=20
 EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
--=20
2.25.1

