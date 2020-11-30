Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.58402.1606735494190463805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 03:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0FF01042
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 03:24:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C2C13F66B
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 03:24:52 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/devtool: use Yocto mirror for pv-1.5.3 tarball
Date: Mon, 30 Nov 2020 11:24:50 +0000
Message-Id: <20201130112450.4137909-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Some of the selftests failed over the weekend with "access denied" errors
fetching this tarball.  Instead of relying on upstream when fetching the
tarball, use the Yocto source mirrors instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/self=
test/cases/devtool.py
index d3d2e04c20e..b8edc897687 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -269,7 +269,7 @@ class DevtoolAddTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         pn =3D 'pv'
         pv =3D '1.5.3'
-        url =3D 'http://www.ivarch.com/programs/sources/pv-1.5.3.tar.bz2=
'
+        url =3D 'http://downloads.yoctoproject.org/mirror/sources/pv-1.5=
.3.tar.bz2'
         result =3D runCmd('wget %s' % url, cwd=3Dtempdir)
         result =3D runCmd('tar xfv %s' % os.path.basename(url), cwd=3Dte=
mpdir)
         srcdir =3D os.path.join(tempdir, '%s-%s' % (pn, pv))
--=20
2.25.1

