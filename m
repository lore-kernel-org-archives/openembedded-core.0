Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.1514.1618620529555849759
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 17:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=HYL0RMNM;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id ACC5720B8004;
	Fri, 16 Apr 2021 17:48:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com ACC5720B8004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1618620529;
	bh=DuhzvdgbJ3ubUyZiamm6Xm7+IfUZILP9CC8hVBI2f0E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HYL0RMNMAKj9NMewI6cvCGFpH4SLENHSCOi245ZpKf10JkcXe5zOAjgH1NzPRdfoe
	 P9kuRwwgADl8c5NvJzgXLQY40uwJaLb9EAFSONe6Z/pOsE8JxP5Pwzub2miCEPtSJW
	 +kTbltTHbCSXx/UXiAtZf55F04yl71MLHk/pGsJo=
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH 2/2] python3: Upgrade 3.9.2 -> 3.9.4
Date: Fri, 16 Apr 2021 18:48:35 -0600
Message-Id: <20210417004835.2958450-2-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210417004835.2958450-1-alhe@linux.microsoft.com>
References: <20210417004835.2958450-1-alhe@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>

- Rebased patch 0001-test_locale.py-correct-the-test-output-format
  Maintainer needs to sign CLA and resubmit
- configure now explicitly requires autoconf-archive to be present

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.o=
rg>
---
 ...le.py-correct-the-test-output-format.patch | 22 +++++++++----------
 .../{python3_3.9.2.bb =3D> python3_3.9.4.bb}    |  4 ++--
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.9.2.bb =3D> python3_3.9.4=
.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-cor=
rect-the-test-output-format.patch b/meta/recipes-devtools/python/python3/=
0001-test_locale.py-correct-the-test-output-format.patch
index 35b7e0c480..c3d1e06d00 100644
--- a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-th=
e-test-output-format.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-th=
e-test-output-format.patch
@@ -23,24 +23,24 @@ Before this patch:
=20
 Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132=
]
=20
+
+Rebased for 3.9.4, still not accepted upstream Signed-off-by: Alejandro =
Hernandez <alejandro@enedino.org>
+
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  Lib/test/test_locale.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
-diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
-index e2c2178..558d63c 100644
---- a/Lib/test/test_locale.py
-+++ b/Lib/test/test_locale.py
-@@ -527,7 +527,7 @@ class TestMiscellaneous(unittest.TestCase):
+Index: Python-3.9.4/Lib/test/test_locale.py
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- Python-3.9.4.orig/Lib/test/test_locale.py
++++ Python-3.9.4/Lib/test/test_locale.py
+@@ -562,7 +562,7 @@ class TestMiscellaneous(unittest.TestCas
              self.skipTest('test needs Turkish locale')
          loc =3D locale.getlocale(locale.LC_CTYPE)
          if verbose:
 -            print('testing with %a' % (loc,), end=3D' ', flush=3DTrue)
 +            print('testing with %a...' % (loc,), end=3D' ', flush=3DTru=
e)
-         locale.setlocale(locale.LC_CTYPE, loc)
-         self.assertEqual(loc, locale.getlocale(locale.LC_CTYPE))
-=20
---=20
-2.7.4
-
+         try:
+             locale.setlocale(locale.LC_CTYPE, loc)
+         except locale.Error as exc:
diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb b/meta/recipes=
-devtools/python/python3_3.9.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.9.2.bb
rename to meta/recipes-devtools/python/python3_3.9.4.bb
index fd1172335a..cb371ceed7 100644
--- a/meta/recipes-devtools/python/python3_3.9.2.bb
+++ b/meta/recipes-devtools/python/python3_3.9.4.bb
@@ -38,7 +38,7 @@ SRC_URI_append_class-native =3D " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] =3D "3c2034c54f811448f516668dce09d24008a0716c3a794dd8=
639b5388cbde247d"
+SRC_URI[sha256sum] =3D "4b0e6644a76f8df864ae24ac500a51bbf68bd098f6a173e2=
7d3b61cdca9aa134"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -69,7 +69,7 @@ ALTERNATIVE_LINK_NAME[python3-config] =3D "${bindir}/py=
thon${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] =3D "${bindir}/python${PYTHON_MAJMIN}=
-config-${MULTILIB_SUFFIX}"
=20
=20
-DEPENDS =3D "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib =
virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2"
+DEPENDS =3D "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib =
virtual/libintl xz virtual/crypt util-linux libtirpc libnsl2 autoconf-arc=
hive-native"
 DEPENDS_append_class-target =3D " python3-native"
 DEPENDS_append_class-nativesdk =3D " python3-native"
=20
--=20
2.25.1

