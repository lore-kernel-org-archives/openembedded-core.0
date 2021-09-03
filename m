Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4216.1630675510786767647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D14AD6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08CAD3F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:09 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/14] hdparm: set correct license
Date: Fri,  3 Sep 2021 14:24:58 +0100
Message-Id: <20210903132459.2560051-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The bulk of hdparm is under a unique license. Set the correct BSD
version, and specify that the hdparm license is also used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/hdparm/hdparm_9.62.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.62.bb b/meta/recipes-e=
xtended/hdparm/hdparm_9.62.bb
index 3d4081c2b3d..61bb44ff389 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.62.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.62.bb
@@ -4,10 +4,11 @@ DESCRIPTION =3D "hdparm is a Linux shell utility for vi=
ewing \
 and manipulating various IDE drive and driver parameters."
 SECTION =3D "console/utils"
=20
-LICENSE =3D "BSD & GPLv2"
-LICENSE:${PN} =3D "BSD"
-LICENSE:${PN}-dbg =3D "BSD"
+LICENSE =3D "BSD-2-Clause & GPLv2 & hdparm"
+LICENSE:${PN} =3D "BSD-2-Clause & hdparm"
+LICENSE:${PN}-dbg =3D "BSD-2-Clause & hdparm"
 LICENSE:wiper =3D "GPLv2"
+NO_GENERIC_LICENSE[hdparm] =3D "LICENSE.TXT"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D495d03e50dc6c89d6a30107ab=
0df5b03 \
                     file://debian/copyright;md5=3Da82d7ba3ade9e8ec902749=
db98c592f3 \
--=20
2.25.1

