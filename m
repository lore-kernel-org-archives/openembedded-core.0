Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12419.1607012176258254683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 08:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 282A711FB
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Dec 2020 08:16:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C744F3F575
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Dec 2020 08:16:14 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/containerimage: update for improved cleanup
Date: Thu,  3 Dec 2020 16:16:11 +0000
Message-Id: <20201203161611.1346206-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ldconfig/aux-cache isn't generated anymore, and the opkg directories
are correctly removed now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/containerimage.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oe=
qa/selftest/cases/containerimage.py
index 4ad7f0e654..5d498f5bf2 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -58,13 +58,7 @@ IMAGE_INSTALL_remove =3D "ssh-pregen-hostkeys"
                     '.{sysconfdir}/ld.so.cache',
                     '.{sysconfdir}/timestamp',
                     '.{sysconfdir}/version',
-                    './run/',
-                    '.{localstatedir}/cache/',
-                    '.{localstatedir}/cache/ldconfig/',
-                    '.{localstatedir}/cache/ldconfig/aux-cache',
-                    '.{localstatedir}/cache/opkg/',
-                    '.{localstatedir}/lib/',
-                    '.{localstatedir}/lib/opkg/'
+                    './run/'
                 ]
=20
         expected_files =3D [ x.format(bindir=3Dbbvars['bindir'],
--=20
2.25.1

