Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4106.1630675505913754540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 391DD101E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8BB23F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/14] lsof: add upstream check
Date: Fri,  3 Sep 2021 14:24:47 +0100
Message-Id: <20210903132459.2560051-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Upstream has moved to GitHub.  Whilst it's now too late to upgrade to
the latest release, we can add upstream check variables so that we get
notified we're out of date.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/lsof/lsof_4.91.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/lsof/lsof_4.91.bb b/meta/recipes-exten=
ded/lsof/lsof_4.91.bb
index 7c85bf23fc3..d7428ea2c49 100644
--- a/meta/recipes-extended/lsof/lsof_4.91.bb
+++ b/meta/recipes-extended/lsof/lsof_4.91.bb
@@ -18,6 +18,9 @@ SRC_URI =3D "http://www.mirrorservice.org/sites/lsof.it=
ap.purdue.edu/pub/tools/uni
 SRC_URI[md5sum] =3D "148ed410cb52e08c2adc0c60f480f11f"
 SRC_URI[sha256sum] =3D "c9da946a525fbf82ff80090b6d1879c38df090556f3fe0e6=
d782cb44172450a3"
=20
+UPSTREAM_CHECK_URI =3D "https://github.com/lsof-org/lsof/releases/"
+UPSTREAM_CHECK_REGEX =3D "lsof_(?P<pver>.*)\.linux\.tar"
+
 LOCALSRC =3D "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
=20
 S =3D "${WORKDIR}/lsof_${PV}_src"
--=20
2.25.1

