Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1768.1630599891856570804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C950101E
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:51 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E670E3F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:50 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/14] iputils: set precise BSD license
Date: Thu,  2 Sep 2021 17:24:31 +0100
Message-Id: <20210902162435.1375245-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210902162435.1375245-1-ross.burton@arm.com>
References: <20210902162435.1375245-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/iputils/iputils_20210722.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_20210722.bb b/meta/rec=
ipes-extended/iputils/iputils_20210722.bb
index 2e8d9032e47..cafb0f634ec 100644
--- a/meta/recipes-extended/iputils/iputils_20210722.bb
+++ b/meta/recipes-extended/iputils/iputils_20210722.bb
@@ -4,7 +4,7 @@ tracepath, tracepath6, ping, ping6 and arping."
 HOMEPAGE =3D "https://github.com/iputils/iputils"
 SECTION =3D "console/network"
=20
-LICENSE =3D "BSD & GPLv2+"
+LICENSE =3D "BSD-3-Clause & GPLv2+"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D55aa8c9fcad0691cef0ecd420361e=
390"
=20
--=20
2.25.1

