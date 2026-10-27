Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16608.1793100654074447274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=t0bni8g7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4645815A1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:30:50 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EAD873F59E
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 04:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793100653; bh=CU4F5UzxFXXS2RqIoK+e+7ST1dFQ9hiBCS0R0t1wqtI=;
	h=From:To:Subject:Date:From;
	b=t0bni8g7A7ffWeafbdm99ok7GjWl0/qBUF3N4MrrSigR+WQM9uWDSuxAkEHQJQvX0
	 Ofv5R5lOonZGExEpLN+vShAdRutWPVBfxlbGapMu5PqhE7/aoaexE5Tv8a2yLpQkZ3
	 c+LnTgQl2bD4s165Jsu4TRL8HTtX/nEpabr9nSQQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] expat: use .tar.gz instead of .tar.bz2 in SRC_URI
Date: Tue, 27 Oct 2026 11:30:43 +0000
Message-ID: <20261027113048.1086884-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:31:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248729
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

