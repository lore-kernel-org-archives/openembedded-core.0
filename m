Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E5EC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 12:02:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4599.1647000131150839092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 04:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E62B91762
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 04:02:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 958AA3FA8E
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 04:02:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] meta: remove obsolete PIP_INSTALL_PACKAGE
Date: Fri, 11 Mar 2022 12:02:04 +0000
Message-Id: <20220311120205.3020751-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 12:02:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163048

PIP_INSTALL_PACKAGE isn't used anymore, so remove all instances of it
from the recipes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson_0.61.2.bb                   | 2 --
 meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb       | 1 -
 meta/recipes-devtools/python/python3-flit-core_3.7.1.bb       | 1 -
 meta/recipes-devtools/python/python3-libarchive-c_4.0.bb      | 2 --
 meta/recipes-devtools/python/python3-magic_0.4.25.bb          | 1 -
 meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb | 2 --
 meta/recipes-devtools/python/python3-numpy_1.22.2.bb          | 1 -
 meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb    | 2 --
 meta/recipes-devtools/python/python3-subunit_1.4.0.bb         | 2 --
 meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb             | 1 -
 meta/recipes-gnome/gi-docgen/gi-docgen_git.bb                 | 1 -
 meta/recipes-support/bmap-tools/bmap-tools_git.bb             | 2 --
 12 files changed, 18 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_0.61.2.bb b/meta/recipes-d=
evtools/meson/meson_0.61.2.bb
index a51db1e3d4..8304bfdac9 100644
--- a/meta/recipes-devtools/meson/meson_0.61.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.61.2.bb
@@ -23,8 +23,6 @@ UPSTREAM_CHECK_REGEX =3D "meson-(?P<pver>\d+(\.\d+)+)\.=
tar"
=20
 inherit setuptools_build_meta
=20
-PIP_INSTALL_PACKAGE =3D "meson"
-
 RDEPENDS:${PN} =3D "ninja python3-modules python3-pkg-resources"
=20
 FILES:${PN} +=3D "${datadir}/polkit-1"
diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb b/me=
ta/recipes-devtools/python/python3-dbusmock_0.26.1.bb
index d892ac9804..dc98810726 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.26.1.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De6a600fd5e1d9c=
bde2d983680233ad02"
 SRC_URI[sha256sum] =3D "0e95ef6ec1e6b58aeb0e08839a76972debea94184570f09e=
29e5f12551399e55"
=20
 PYPI_PACKAGE =3D "python-dbusmock"
-PIP_INSTALL_PACKAGE =3D "python_dbusmock"
=20
 inherit pypi setuptools3
=20
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.7.1.bb
index c6bc24555e..1f14345d50 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
@@ -19,7 +19,6 @@ DEPENDS:append:class-native =3D " unzip-native"
 # We need the full flit tarball
 PYPI_PACKAGE =3D "flit"
 PEP517_SOURCE_PATH =3D "${S}/flit_core"
-PIP_INSTALL_PACKAGE =3D "flit_core"
=20
 do_install:class-native () {
     pip_install_wheel_do_bootstrap_install
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb b/m=
eta/recipes-devtools/python/python3-libarchive-c_4.0.bb
index 99837848a6..3c6bc1e1ca 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb
@@ -9,8 +9,6 @@ PYPI_PACKAGE =3D "libarchive-c"
=20
 inherit pypi setuptools3
=20
-PIP_INSTALL_PACKAGE =3D "libarchive_c"
-
 SRC_URI[sha256sum] =3D "a5b41ade94ba58b198d778e68000f6b7de41da768de7140c=
984f71d7fa8416e5"
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta/recipes-devtools/python/python3-magic_0.4.25.bb b/meta/=
recipes-devtools/python/python3-magic_0.4.25.bb
index bd46b294ae..efc8b6daaa 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.25.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.25.bb
@@ -8,7 +8,6 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D61495c152d794e6be5799a9edca14=
9e3"
=20
 PYPI_PACKAGE =3D "python-magic"
-PIP_INSTALL_PACKAGE =3D "python_magic"
=20
 inherit pypi setuptools3
=20
diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.b=
b b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
index 5788af3f71..c1e34b205d 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "7dc6ad46f05f545f900dd59e8dfb4e84a=
4827b97b3cfecb175ea0c7d24
=20
 inherit pypi setuptools3 ptest
=20
-PIP_INSTALL_PACKAGE =3D "more_itertools"
-
 SRC_URI +=3D " \
 	file://run-ptest \
 "
diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb b/meta/=
recipes-devtools/python/python3-numpy_1.22.2.bb
index 43e7427eab..6ceb451ff3 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
@@ -20,7 +20,6 @@ UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)\.tar"
 DEPENDS +=3D "python3-cython-native"
=20
 inherit ptest setuptools3
-PIP_INSTALL_PACKAGE =3D "numpy"
=20
 S =3D "${WORKDIR}/numpy-${PV}"
=20
diff --git a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb b=
/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
index b592cb95d4..c377c3bfb0 100644
--- a/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
+++ b/meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
@@ -8,6 +8,4 @@ SRC_URI[sha256sum] =3D "5cad17bedfc3af57b399db0fed32771f1=
8fc54bbd917e85546088607ac
=20
 inherit pypi setuptools3
=20
-PIP_INSTALL_PACKAGE =3D "strict_rfc3339"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.0.bb b/meta=
/recipes-devtools/python/python3-subunit_1.4.0.bb
index bc49a2b69e..e4e3bf191d 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.0.bb
@@ -10,8 +10,6 @@ SRC_URI[sha256sum] =3D "042039928120fbf392e8c983d60f3d8=
ae1b88f90a9f8fd7188ddd9c26c
=20
 inherit pypi setuptools3
=20
-PIP_INSTALL_PACKAGE =3D "python_subunit"
-
 RDEPENDS:${PN} =3D " python3-testtools"
=20
 BBCLASSEXTEND =3D "nativesdk"
diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb b/meta/rec=
ipes-extended/asciidoc/asciidoc_10.1.4.bb
index 484250b33e..4ab9edbce4 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
@@ -21,7 +21,6 @@ S =3D "${WORKDIR}/git"
 export SGML_CATALOG_FILES=3D"file://${STAGING_ETCDIR_NATIVE}/xml/catalog=
"
=20
 inherit setuptools3
-PIP_INSTALL_PACKAGE =3D "asciidoc"
 CLEANBROKEN =3D "1"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb b/meta/recipes=
-gnome/gi-docgen/gi-docgen_git.bb
index 67617fca39..6a7124c3fe 100644
--- a/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
+++ b/meta/recipes-gnome/gi-docgen/gi-docgen_git.bb
@@ -16,7 +16,6 @@ SRCREV =3D "37b04455ff58cb2ec3f58917d0737c435344f2fb"
 S =3D "${WORKDIR}/git"
=20
 inherit setuptools3
-PIP_INSTALL_PACKAGE =3D "gi_docgen"
=20
 RDEPENDS:${PN} +=3D "python3-asyncio python3-core python3-jinja2 python3=
-json python3-markdown python3-markupsafe python3-pygments python3-toml p=
ython3-typogrify python3-xml"
=20
diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/rec=
ipes-support/bmap-tools/bmap-tools_git.bb
index 2999fdcea1..78c51e7731 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -23,6 +23,4 @@ RDEPENDS:${PN} =3D "python3-core python3-compression py=
thon3-mmap python3-setuptoo
=20
 inherit setuptools3
=20
-PIP_INSTALL_PACKAGE =3D "bmap_tools"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


