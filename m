Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21640.1629104753117902897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 02:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC1796D
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 02:05:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 567123F40C
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 02:05:51 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tar: ignore node-tar CVEs
Date: Mon, 16 Aug 2021 10:05:49 +0100
Message-Id: <20210816090549.3990233-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

These two CVEs are specific to the Node package node-tar.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/tar/tar_1.34.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extende=
d/tar/tar_1.34.bb
index c096a8c9a88..98755a11cc5 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -61,3 +61,6 @@ PROVIDES:append:class-native =3D " tar-replacement-nati=
ve"
 NATIVE_PACKAGE_PATH_SUFFIX =3D "/${PN}"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+# These are both specific to the NPM package node-tar
+CVE_CHECK_WHITELIST +=3D "CVE-2021-32803 CVE-2021-32804"
--=20
2.32.0

