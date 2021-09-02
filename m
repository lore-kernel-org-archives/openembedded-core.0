Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1618.1630599888277276065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A2BD101E
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA27A3F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/14] acpica: set precise BSD license
Date: Thu,  2 Sep 2021 17:24:27 +0100
Message-Id: <20210902162435.1375245-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/acpica/acpica_20210730.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpica_20210730.bb b/meta/recip=
es-extended/acpica/acpica_20210730.bb
index 490e8124348..b66e605f8b2 100644
--- a/meta/recipes-extended/acpica/acpica_20210730.bb
+++ b/meta/recipes-extended/acpica/acpica_20210730.bb
@@ -9,7 +9,7 @@ ACPI tables."
 HOMEPAGE =3D "http://www.acpica.org/"
 SECTION =3D "console/tools"
=20
-LICENSE =3D "Intel | BSD | GPLv2"
+LICENSE =3D "Intel | BSD-3-Clause | GPLv2"
 LIC_FILES_CHKSUM =3D "file://source/compiler/aslcompile.c;beginline=3D7;=
endline=3D150;md5=3Dc33ce358fdcd142684e41e336b7992e8"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
--=20
2.25.1

