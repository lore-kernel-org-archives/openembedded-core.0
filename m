Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5947.1630682634306241170
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 08:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F6E4D6E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 08:23:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADA163F766
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 08:23:52 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/selftest/recipetool: update for license changes
Date: Fri,  3 Sep 2021 16:23:47 +0100
Message-Id: <20210903152348.3138708-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that recipetool writes BSD-3-Clause, update the test appropriately.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/s=
elftest/cases/recipetool.py
index 6f531dfa364..c2a53815d0e 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -481,7 +481,7 @@ class RecipetoolTests(RecipetoolBase):
         result =3D runCmd('recipetool create -o %s %s' % (temprecipe, sr=
curi))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars =3D {}
-        checkvars['LICENSE'] =3D set(['PSF', '&', 'BSD', 'GPL'])
+        checkvars['LICENSE'] =3D set(['PSF', '&', 'BSD-3-Clause', 'GPL']=
)
         checkvars['LIC_FILES_CHKSUM'] =3D 'file://COPYING.txt;md5=3D35a2=
3d42b615470583563132872c97d6'
         checkvars['SRC_URI'] =3D 'https://files.pythonhosted.org/package=
s/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docu=
tils-${PV}.tar.gz'
         checkvars['SRC_URI[md5sum]'] =3D 'c53768d63db3873b7d452833553469=
de'
--=20
2.25.1

