Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23071.1625673387725747819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EE051042
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jul 2021 08:56:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D88C53F694
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jul 2021 08:56:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/recipetool: update socat version to fix failing download
Date: Wed,  7 Jul 2021 16:56:20 +0100
Message-Id: <20210707155620.1145640-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If the recipetool tests are run with an empty DL_DIR the fetch of
socat 1.7.3.0 fails as that URL doesn't exist anymore.

Update the version to 1.7.4.1 to fix the test.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
index 9d56e9e1e32..f0685d37182 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -374,7 +374,7 @@ class RecipetoolTests(RecipetoolBase):
         # Try adding a recipe
         temprecipe =3D os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
-        pv =3D '1.7.3.0'
+        pv =3D '1.7.4.1'
         srcuri =3D 'http://www.dest-unreach.org/socat/download/socat-%s.=
tar.bz2' % pv
         result =3D runCmd('recipetool create %s -o %s' % (srcuri, tempre=
cipe))
         dirlist =3D os.listdir(temprecipe)
--=20
2.25.1

