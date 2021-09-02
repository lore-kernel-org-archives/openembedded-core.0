Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1733.1630599887160860984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Sep 2021 09:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47F84101E
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E676F3F766
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Sep 2021 09:24:45 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/14] lz4: remove redundant BSD license
Date: Thu,  2 Sep 2021 17:24:22 +0100
Message-Id: <20210902162435.1375245-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The upstream license is BSD-2-Clause or GPLv2, so remove the redundant
and ambiguous BSD license.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/lz4/lz4_1.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support=
/lz4/lz4_1.9.3.bb
index 74f6743b916..b22eea3156a 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Extremely Fast Compression algorithm"
 DESCRIPTION =3D "LZ4 is a very fast lossless compression algorithm, prov=
iding compression speed at 400 MB/s per core, scalable with multi-cores C=
PU. It also features an extremely fast decoder, with speed in multiple GB=
/s per core, typically reaching RAM speed limits on multi-core systems."
 HOMEPAGE =3D "https://github.com/lz4/lz4"
=20
-LICENSE =3D "BSD | BSD-2-Clause | GPL-2.0"
+LICENSE =3D "BSD-2-Clause | GPL-2.0"
 LIC_FILES_CHKSUM =3D "file://lib/LICENSE;md5=3Debc2ea4814a64de7708f15719=
04b32cc \
                     file://programs/COPYING;md5=3Db234ee4d69f5fce4486a80=
fdaf4a4263 \
                     file://LICENSE;md5=3Dd57c0d21cb917fb4e0af2454aa48b95=
6 \
--=20
2.25.1

