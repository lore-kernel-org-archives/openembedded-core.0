Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16671.1793100956467075243
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=f2GWl/bM;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC48715A1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:35:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 642FC3F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793100955; bh=CU4F5UzxFXXS2RqIoK+e+7ST1dFQ9hiBCS0R0t1wqtI=;
	h=From:To:Subject:Date:From;
	b=f2GWl/bMARKVekMX2wZ7bC5yW4j5qNU1gfJ2OzPw5uVd1C6U0fmUb/KRLNDl7IPTJ
	 lY7XzD7IS4fstJOC1NyRb2xZ5cqoP2PeOMgvf0+zuYpyAsmD6R/eF3qWw12QESk6qd
	 Wh4krqVbivI0UC75K2A9bPur9duUBjER3W8tfqyM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/6] expat: use .tar.xz instead of .tar.bz2 in SRC_URI
Date: Tue, 27 Oct 2026 11:35:48 +0000
Message-ID: <20261027113553.1088639-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248736
Content-Type: text/plain; charset="utf-8"

.xz files are significantly smaller than .bz2, so download that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/expat/expat_2.9.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/expat/expat_2.9.0.bb b/meta/recipes-core/e=
xpat/expat_2.9.0.bb
index e9bb21bd55c..9b337648390 100644
--- a/meta/recipes-core/expat/expat_2.9.0.bb
+++ b/meta/recipes-core/expat/expat_2.9.0.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df4fedd6116da=
0e171f7cb4d2923d7ac2"
=20
 VERSION_TAG =3D "${@d.getVar('PV').replace('.', '_')}"
=20
-SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.ta=
r.bz2  \
+SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.ta=
r.xz  \
            file://run-ptest \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
=20
-SRC_URI[sha256sum] =3D "775e8a68f81a748a401dc3168318d4a39484eb4f954726f2=
1517c8f42c0ba984"
+SRC_URI[sha256sum] =3D "1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b8=
5ae3741f5d803051"
=20
 EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
=20
--=20
2.43.0

