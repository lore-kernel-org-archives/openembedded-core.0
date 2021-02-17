Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by mx.groups.io with SMTP id smtpd.web10.6385.1613563083829870469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 03:58:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=HHDmaG7c;
 spf=pass (domain: gmx.de, ip: 212.227.15.18, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1613563081;
	bh=ji0dBWHmE4168MN9Bh+GC/I8hB+azhc4uiBmdI0AyAw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=HHDmaG7cwNFiNpWc6AAv9teuVUEmNLOiPTzXtFd/H3nERok8Kc9DTHrB8Zwq/MhXp
	 VlCBoFImpCvCNG0PbwsjwcfPcFgYb6qevx8E88y+ORJ29f2+Y8T5+p4f0ALldCpcWV
	 Ird8UKutPik2qhCEmpCca2m6HzIOTUXOBo7Eq6LE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([95.88.58.204]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMofW-1lSuNh0lIi-00Iii3; Wed, 17
 Feb 2021 12:58:01 +0100
From: =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <jsmoeller@linuxfoundation.org>
Subject: [PATCH] oe-selftests: add rpm to reproducible build selftest
Date: Wed, 17 Feb 2021 12:57:57 +0100
Message-Id: <20210217115757.18324-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:F/pUwcloiNZCN3JEHBsMIUI7i3z3PKhWI7RZEh7uf+YHFG9vo/y
 OzTJi6AFGlcEOv8UmQymwBVhNb9FD0C759iwlTp+0zODbBQDFjLXnHEjhF3ZY4o232icbgH
 3485qye/9Let1QqzQukrXw2MXOFHv+fATZBeK9bOVkDySCt3XKxQXIGoVsCamCjmej82JlY
 wSyMHqdko7+II27BkNfFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6rixDGY4e9g=:J2pd9mAN7vIkfQY+qf/B9T
 nBYDuEwN31tpZHtEZ7acpIfg6dv3O/v7RKxthxaWfGigqD4K+dNEf3ayXfJ+G7lOQDcPE4yow
 CAU7W3dQmGYjFoYYeXuA9al5OLvSoBX2q4ZY+5KZeJpun8PYVeBATaZjtRE+srxMp4bbYXscU
 mEJEtk+80Hx/Mocb+I6vTKwVjcynHTxTXxoKVsJWdjJ1tu/Va4zzqXVvYmMAU0vK6weHZZ8+/
 uIE8/mNlCJXlVshqApJt8ZgCR1L21VQ5dXErHtBkHc5Zsith/vHW2jbTkFm+3KkhbENdm6Ojx
 jr6fymjcHbw91t2PogYWciO34pbjbVBU8zIjQowU4/Jb71yGwPOE6IATnckfseKh/B4gKSlOr
 IUifCKOAhiD528UJrwwnwYNiII8UVXm99zh3vnlhN+KINNFa529MmBEeV2LoQN8kdiftpol4m
 6C5ao81myZfHE6AVZ8JbbtC2uo/QEMHZc2fdaQjPmUsprgFolenTu3ozULDwdvdR67R1czBDt
 r/Saaar0wuB+E7lR4eqTsEtGgW7ytHZ53gnmpchQEq1eSoGuncphivRNQ7HZvuvXja0EMqs+L
 OCWOmQUPDNdG79h6/r7e+hLSQuh16wVgHmuHlIfqCyYyuUcKtOJOsLFy8XulsMoH+ofT1docu
 rCPWtOGulCSOr5KCUzPtjI3va6mItmEB6dpmrDxv24ZDx1JW5X4kCi6V8lBNSweoZ+gkhTzkT
 g1YNIQ/DfvjrMy/Zauf1wn68u3FctalduCcY9u/jdSSQI2KwrBovPWho39gfs47M6SoRRgWeO
 VckUr+ubHfdEyGXpWgUDzzljqgv4iqycPkD0OrwLkK1W2BrA9Gk2r5UtZIJxVovJiO6VZaE/4
 6D1s2xxNKWvFNd4KvK/Q==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>

rpm packaging has shown good numbers wrt reproducible builds as well
when testing core-image-minimal locally:

 Reproducibility summary for rpm: same=3D4671 different=3D0 missing=3D0 to=
tal=3D4671

Thus enable it in the autobuilder to be more widely tested.

v2: also add the define for "use_source_date_epoch_as_buildtime 1"

Signed-off-by: Jan-Simon M=C3=B6ller <jsmoeller@linuxfoundation.org>
=2D--
 meta/classes/package_rpm.bbclass             | 1 +
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.b=
bclass
index c48bece742..c1824306ee 100644
=2D-- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -687,6 +687,7 @@ python do_package_rpm () {
     cmd =3D cmd + " --define '_binary_payload w6T.xzdio'"
     cmd =3D cmd + " --define '_source_payload w6T.xzdio'"
     cmd =3D cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
+    cmd =3D cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd =3D cmd + " --define '_buildhost reproducible'"
     if perfiledeps:
         cmd =3D cmd + " --define '__find_requires " + outdepends + "'"
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/=
selftest/cases/reproducible.py
index 0963c2f11a..9785c5ffac 100644
=2D-- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -173,7 +173,7 @@ class DiffoscopeTests(OESelftestTestCase):
             self.assertTrue(os.path.exists(os.path.join(tmpdir, 'index.ht=
ml')), "HTML index not found!")

 class ReproducibleTests(OESelftestTestCase):
-    package_classes =3D ['deb', 'ipk']
+    package_classes =3D ['deb', 'ipk', 'rpm']
     images =3D ['core-image-minimal', 'core-image-sato', 'core-image-full=
-cmdline', 'world']
     save_results =3D False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
=2D-
2.30.0

