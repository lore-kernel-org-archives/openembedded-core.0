Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3CECA5FA1
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 17:32:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64295.1790616725203041414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 10:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=YewYCpWJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45D1C1655
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:32:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 33EF93F763
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790616724; bh=Cnxxf8W7y8iYsuKa/L7TbaUIHht8UyEVoN6d8yOGkh0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YewYCpWJTfy2WSViLhXOnT0ZqCid7Cu4o5wpjiZhfBdeSKeFgp03+76goed4mWJPS
	 I/nYVUzHQk4xvFQUun5pUxM6a2/0Um8w1zLeJaMQNvxLJwvv2H8W1NujOsfEQLNprx
	 aBMcw+KkjhUHbiiy/GQ/5q+tXrcjrgS1ouiMzkjQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 2/4] recipes: update for PYPI_PACKAGE changes
Date: Mon, 28 Sep 2026 18:31:56 +0100
Message-ID: <20260928173158.781301-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928173158.781301-1-ross.burton@arm.com>
References: <20260928173158.781301-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 17:32:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246779

Remove now-redundant PYPI_PACKAGE values that were only needed because
the sdist filename has been normalised.

Set PYPI_PACKAGE where the package name does not match the recipe name.

Set PYPI_PACKAGE_SDIST where the sdist is _not_ normalised currently.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-booleanpy_5.0.bb          | 2 +-
 .../recipes-devtools/python/python3-coherent-licensed_0.5.2.bb | 2 --
 meta/recipes-devtools/python/python3-cryptography-vectors.bb   | 2 --
 meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb        | 2 +-
 meta/recipes-devtools/python/python3-flit-core_3.12.0.bb       | 2 --
 .../python/python3-hatch-build-scripts_1.0.0.bb                | 1 -
 .../python/python3-hatch-fancy-pypi-readme_25.1.0.bb           | 2 --
 meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb        | 2 --
 .../python/python3-jsonschema-specifications_2025.9.1.bb       | 2 --
 meta/recipes-devtools/python/python3-libarchive-c_5.1.bb       | 2 ++
 .../python/python3-license-expression_30.4.4.bb                | 1 -
 meta/recipes-devtools/python/python3-magic_0.4.27.bb           | 1 +
 meta/recipes-devtools/python/python3-meson-python_0.21.1.bb    | 2 --
 meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb  | 2 --
 meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb     | 2 --
 meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb | 2 --
 meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb      | 2 --
 meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb  | 2 --
 .../python/python3-pyproject-metadata_0.12.1.bb                | 2 --
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb          | 2 +-
 meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb | 2 --
 .../recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb | 2 --
 meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb   | 1 -
 meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb       | 2 --
 meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb     | 2 --
 .../recipes-devtools/python/python3-semantic-version_2.10.0.bb | 2 --
 meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb | 2 --
 meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb  | 2 --
 .../recipes-devtools/python/python3-spdx-python-model_0.0.6.bb | 1 -
 meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb       | 2 ++
 meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb  | 2 --
 .../recipes-devtools/python/python3-sphinx-copybutton_0.5.2.bb | 2 ++
 meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb | 2 --
 .../python/python3-sphinxcontrib-applehelp_2.0.0.bb            | 2 --
 .../python/python3-sphinxcontrib-devhelp_2.0.0.bb              | 2 --
 .../python/python3-sphinxcontrib-htmlhelp_2.1.0.bb             | 2 --
 .../python/python3-sphinxcontrib-jquery_4.1.bb                 | 2 ++
 .../python/python3-sphinxcontrib-jsmath_1.0.1.bb               | 2 ++
 .../python/python3-sphinxcontrib-qthelp_2.0.0.bb               | 2 --
 .../python/python3-sphinxcontrib-serializinghtml_2.0.0.bb      | 2 --
 .../python/python3-sphinxcontrib-svg2pdfconverter_2.1.0.bb     | 2 --
 meta/recipes-devtools/python/python3-subunit_1.4.4.bb          | 1 +
 .../python/python3-trove-classifiers_2026.9.21.13.bb           | 2 --
 .../python/python3-typing-extensions_4.16.0.bb                 | 3 ---
 meta/recipes-devtools/python/python3-uv-build_0.12.17.bb       | 2 --
 meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb   | 1 -
 meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb           | 2 --
 .../sbom-cve-check/python3-sbom-cve-check_1.3.5.bb             | 1 -
 48 files changed, 15 insertions(+), 74 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-booleanpy_5.0.bb b/meta=
/recipes-devtools/python/python3-booleanpy_5.0.bb
index a834cdef7bb..f95de3e135e 100644
--- a/meta/recipes-devtools/python/python3-booleanpy_5.0.bb
+++ b/meta/recipes-devtools/python/python3-booleanpy_5.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd118b5fece=
ee598ebeca76e13395c2bd"
=20
 SRC_URI[sha256sum] =3D "60cbc4bad079753721d32649545505362c754e121570ada4=
658b852a3a318d95"
=20
-PYPI_PACKAGE =3D "boolean_py"
+PYPI_PACKAGE =3D "boolean-py"
=20
 inherit pypi setuptools3
=20
diff --git a/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2=
.bb b/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
index 9148fe4e36a..6bb6629a016 100644
--- a/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
+++ b/meta/recipes-devtools/python/python3-coherent-licensed_0.5.2.bb
@@ -10,6 +10,4 @@ SRC_URI[sha256sum] =3D "d8071403ce742d3ac3592ddc4fb7057=
a46caffb415b928b4d52802e5f2
=20
 inherit pypi python_flit_core
=20
-PYPI_PACKAGE =3D "coherent_licensed"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors.bb=
 b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
index 0f25199f68d..87302e1b2f3 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors.bb
@@ -11,8 +11,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8c3617db4fb6=
fae01f1d253ab91511e4 \
 require python3-cryptography-common.inc
 SRC_URI[sha256sum] =3D "90066d0f7351b12ebac2b4ce594ce0a6f05c19ad3068e4d5=
cfc64d9d2bec8d80"
=20
-PYPI_PACKAGE =3D "cryptography_vectors"
-
 inherit pypi python_uv_build
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb b/me=
ta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
index ecec075f6f2..12fc704f756 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De6a600fd5e1d9c=
bde2d983680233ad02"
=20
 SRC_URI[sha256sum] =3D "221b65e1c2e48de9fd11bf7e8c165adaf91648f49a11f390=
d086a498386f2984"
=20
-PYPI_PACKAGE =3D "python_dbusmock"
+PYPI_PACKAGE =3D "python-dbusmock"
=20
 inherit pypi python_setuptools_build_meta
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb b/m=
eta/recipes-devtools/python/python3-flit-core_3.12.0.bb
index d6b37fe904b..786906b4b41 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.12.0.bb
@@ -16,8 +16,6 @@ inherit pypi python_flit_core
 DEPENDS:remove:class-native =3D " python3-build-native python3-installer=
-native"
 DEPENDS:append:class-native =3D " unzip-native"
=20
-PYPI_PACKAGE =3D "flit_core"
-
 do_compile:class-native () {
     python_flit_core_do_manual_build
 }
diff --git a/meta/recipes-devtools/python/python3-hatch-build-scripts_1.0=
.0.bb b/meta/recipes-devtools/python/python3-hatch-build-scripts_1.0.0.bb
index ba7d8b40ffc..3806e8589fa 100644
--- a/meta/recipes-devtools/python/python3-hatch-build-scripts_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-build-scripts_1.0.0.bb
@@ -4,7 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D9ad584cda56221c7eaf48c23a=
5874a2a"
=20
-PYPI_PACKAGE =3D "hatch_build_scripts"
 SRC_URI[sha256sum] =3D "563735e2f265c9e1b92dece6f762309114505ffaf6e5d51d=
462eb6a3b4f14640"
=20
 inherit pypi python_hatchling
diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme=
_25.1.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme=
_25.1.0.bb
index 13cc07d76ca..9324db61501 100644
--- a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0=
.bb
+++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_25.1.0=
.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dba5633c60b=
d3e243091013aa83b4d807"
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "hatch_fancy_pypi_readme"
-
 SRC_URI[sha256sum] =3D "9c58ed3dff90d51f43414ce37009ad1d5b0f08ffc9fc2169=
98a06380f01c0045"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb b/me=
ta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
index b8df54a8b37..7fbe8769614 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D26501cfd0b=
bddf830ee820e95551fa3d"
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "hatch_vcs"
-
 SRC_URI[sha256sum] =3D "0395fa126940340215090c344a2bf4e2a77bcbe7daab16f4=
1b37b98c95809ff9"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-jsonschema-specificatio=
ns_2025.9.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specific=
ations_2025.9.1.bb
index c324753ef2c..86fc3a67abf 100644
--- a/meta/recipes-devtools/python/python3-jsonschema-specifications_2025=
.9.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2025=
.9.1.bb
@@ -9,8 +9,6 @@ SRC_URI[sha256sum] =3D "b540987f239e745613c7a9176f3edb72b=
832a4ac465cf0271228839783
=20
 inherit pypi python_hatchling
=20
-PYPI_PACKAGE =3D "jsonschema_specifications"
-
 DEPENDS +=3D "python3-hatch-vcs-native"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/m=
eta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 6bb4e491042..791326ba24a 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -13,6 +13,8 @@ SRC_URI +=3D " \
=20
 inherit pypi setuptools3 ptest-python-pytest
=20
+PYPI_PACKAGE_SDIST =3D "libarchive-c"
+
 SRC_URI[sha256sum] =3D "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a3=
72027c10615a2721"
=20
 DEPENDS +=3D "patchelf-native libarchive"
diff --git a/meta/recipes-devtools/python/python3-license-expression_30.4=
.4.bb b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
index 5751542cb33..38db3951534 100644
--- a/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
+++ b/meta/recipes-devtools/python/python3-license-expression_30.4.4.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://apache-2.0.LICENSE;md5=3D86d=
3f3a95c324c9479bd8986968f43
 SRC_URI[sha256sum] =3D "73448f0aacd8d0808895bdc4b2c8e01a8d67646e4188f887=
375398c761f340fd"
=20
 inherit pypi ptest-python-pytest python_setuptools_build_meta
-PYPI_PACKAGE =3D "license_expression"
=20
 DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
=20
diff --git a/meta/recipes-devtools/python/python3-magic_0.4.27.bb b/meta/=
recipes-devtools/python/python3-magic_0.4.27.bb
index 2e561e69d71..f871b1c2cb8 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.27.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
@@ -8,6 +8,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D61495c152d794e6be5799a9edca14=
9e3"
=20
 PYPI_PACKAGE =3D "python-magic"
+PYPI_PACKAGE_SDIST =3D "python-magic"
=20
 inherit pypi setuptools3
=20
diff --git a/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb =
b/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
index 2c86f7fed41..4abe3d8414f 100644
--- a/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
+++ b/meta/recipes-devtools/python/python3-meson-python_0.21.1.bb
@@ -10,8 +10,6 @@ DEPENDS =3D " \
 	python3-pyproject-metadata-native \
 "
=20
-PYPI_PACKAGE =3D "meson_python"
-
 inherit pypi python_mesonpy
 SRC_URI[sha256sum] =3D "78b3345dcbc0fed7b939e7e37a9faab35bddaae07bf62e75=
42c8ad479c395af5"
=20
diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.b=
b b/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
index 32fcc5694be..053197ea5c7 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3396ea30f9d213=
89d7857719816f83b5"
=20
 SRC_URI[sha256sum] =3D "f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad72=
5c67503f13ba30bd"
=20
-PYPI_PACKAGE =3D "more_itertools"
-
 inherit pypi python_flit_core ptest-python-pytest
=20
 RDEPENDS:${PN} +=3D " \
diff --git a/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb b=
/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
index 1458f514b49..2f68172a4ae 100644
--- a/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
+++ b/meta/recipes-devtools/python/python3-pdm-backend_2.4.10.bb
@@ -8,6 +8,4 @@ SRC_URI[sha256sum] =3D "551b049379d4f270cba18f5bf73031cc2=
29a4f883e085265465d326d4a
=20
 inherit pypi python_pep517
=20
-PYPI_PACKAGE =3D "pdm_backend"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.=
bb b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb
index 2b707a0a93b..fb42de5f67c 100644
--- a/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb
+++ b/meta/recipes-devtools/python/python3-pdm-build-locked_0.3.8.bb
@@ -7,6 +7,4 @@ SRC_URI[sha256sum] =3D "c2a608b288ed08618228880c2e6d6a616=
049c25eeb71786d06d1061d12
=20
 inherit pypi python_pdm
=20
-PYPI_PACKAGE =3D "pdm_build_locked"
-
 BBCLASSEXTEND +=3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb b/=
meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb
index b0d3b8e2ada..a9ffc5682f1 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb
@@ -19,8 +19,6 @@ SRC_URI[sha256sum] =3D "81d04c9253b19d0604718268d781867=
c8f7b2128e5b25bbf1e84141eec
=20
 inherit python_poetry_core pypi
=20
-PYPI_PACKAGE =3D "poetry_core"
-
 RDEPENDS:${PN}:append:class-target =3D "\
     python3-compression \
     python3-core \
diff --git a/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.b=
b b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb
index 5f1507a0345..bcf0efcf41a 100644
--- a/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-hooks_1.3.3.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] =3D "defda19b854fa0d3bd4f76ea4ddcba8ab=
d7dcfcdd585a6690ade050744
=20
 inherit pypi python_flit_core
=20
-PYPI_PACKAGE =3D "pyproject_hooks"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
 # Bootstrap the native build
diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.12=
.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
index 9918cae0753..81fce2b2b8c 100644
--- a/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.12.1.bb
@@ -12,8 +12,6 @@ HOMEPAGE =3D "https://github.com/FFY00/python-pyproject=
-metadata"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D310439af287b0fb4780b2ad6907c2=
56c"
=20
-PYPI_PACKAGE =3D "pyproject_metadata"
-
 inherit pypi python_flit_core
=20
 SRC_URI[sha256sum] =3D "8809a4df6fe08279b39a8890669506ed3158e0617855ac9a=
ff098fcbe772ae4c"
diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta=
/recipes-devtools/python/python3-pysocks_1.7.1.bb
index 207d15d7025..18d6edc8f26 100644
--- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1d457bcffb9661=
b45f799d4efee72f16"
=20
 SRC_URI[sha256sum] =3D "3f8804571ebe159c380ac6de37643bb4685970655d3bba24=
3530d6558b799aa0"
=20
-PYPI_PACKAGE =3D "PySocks"
+PYPI_PACKAGE_SDIST =3D "PySocks"
=20
 inherit pypi setuptools3
=20
diff --git a/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.=
bb b/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
index a76c15119d5..99e0b0e2d07 100644
--- a/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-subtests_0.15.0.bb
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D242b4e17fa287d=
cf7aef372f6bc3dcb1"
=20
 SRC_URI[sha256sum] =3D "cb495bde05551b784b8f0b8adfaa27edb4131469a27c339b=
80fd8d6ba33f887c"
=20
-PYPI_PACKAGE =3D "pytest_subtests"
-
 inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4=
.bb b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
index 06eb833f7a9..8561b012bed 100644
--- a/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
+++ b/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
@@ -7,8 +7,6 @@ SRC_URI +=3D "file://0001-Remove-usage-of-six.patch"
=20
 SRC_URI[sha256sum] =3D "138a2abdf93304ad60530167e51d2dfb9549521a836871b8=
8d7f4695d0022f6b"
=20
-PYPI_PACKAGE =3D "rfc3339_validator"
-
 inherit pypi setuptools3
=20
 RDEPENDS:${PN} +=3D "\
diff --git a/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb=
 b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
index 08af23d765c..d7aaea006a9 100644
--- a/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
+++ b/meta/recipes-devtools/python/python3-roman-numerals_4.1.0.bb
@@ -4,7 +4,6 @@ LICENSE =3D "0BSD AND CC0-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENCE.rst;md5=3Dbfcc8b16e42929aafeb9d4143=
60bc2fd"
=20
 SRC_URI[sha256sum] =3D "1af8b147eb1405d5839e78aeb93131690495fe9da5c91856=
cb33ad55a7f1e5b2"
-PYPI_PACKAGE =3D "roman_numerals"
=20
 inherit pypi python_flit_core
=20
diff --git a/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb b/m=
eta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
index 5898649c3bf..68d13ccb963 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
@@ -10,8 +10,6 @@ require ${BPN}-crates.inc
=20
 inherit pypi cargo-update-recipe-crates python_maturin ptest-python-pyte=
st
=20
-PYPI_PACKAGE =3D "rpds_py"
-
 RDEPENDS:${PN}-ptest +=3D " \
     python3-iniconfig \
     python3-packaging \
diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb b=
/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb
index c27649e35d8..3117f878cb0 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.19.1.bb
@@ -4,8 +4,6 @@ HOMEPAGE =3D "https://pypi.org/project/ruamel.yaml/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfae78348fee46c087389813e0ebf5=
ed7"
=20
-PYPI_PACKAGE =3D "ruamel_yaml"
-
 inherit pypi python_setuptools_build_meta
=20
 S =3D "${UNPACKDIR}/ruamel.yaml-${PV}"
diff --git a/meta/recipes-devtools/python/python3-semantic-version_2.10.0=
.bb b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
index 64d1390475a..99c0c52e09b 100644
--- a/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
+++ b/meta/recipes-devtools/python/python3-semantic-version_2.10.0.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fb31e3c1c7eeb=
8b5e8c07657cdd54e2"
=20
 SRC_URI[sha256sum] =3D "bdabb6d336998cbb378d4b9db3a4b56a1e3235701dc05ea2=
690d9a997ed5041c"
=20
-PYPI_PACKAGE =3D "semantic_version"
-
 inherit pypi setuptools3
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.=
bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
index ecb2169a3f6..f07533793cb 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.13.0.bb
@@ -12,8 +12,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D011cd92e702d=
d9e6b1a26157b6fd53f5"
 SRC_URI +=3D "file://0001-setuptools_rust-rustc_info.py-do-not-add-unsta=
ble-op.patch"
 SRC_URI[sha256sum] =3D "f2afcf4baeee689910ce49cfa8aad4e08cce72f417449bcc=
32891b8664fdc726"
=20
-PYPI_PACKAGE =3D "setuptools_rust"
-
 inherit cargo pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.b=
b b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
index 0af4bd24f5e..14a46d77c3b 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.2.3.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D838c366f69b72c=
5df05c96dff79b35f2"
=20
 SRC_URI[sha256sum] =3D "f179ed3e2a63cf5823e5ee9aa9ca08386219400443a05532=
24d72dde3f206b44"
=20
-PYPI_PACKAGE =3D "setuptools_scm"
-
 inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "\
diff --git a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6=
.bb b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
index def12b20492..cebf27a11ce 100644
--- a/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
+++ b/meta/recipes-devtools/python/python3-spdx-python-model_0.0.6.bb
@@ -4,7 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968f4=
327"
=20
-PYPI_PACKAGE =3D "spdx_python_model"
 SRC_URI[sha256sum] =3D "f1938eb08d08218278122849bba123b8993a0171e9b4f5ea=
6af7aeb71f3204d7"
=20
 SRC_URI +=3D " \
diff --git a/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb b/m=
eta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
index 0f056793226..d58225f8baa 100644
--- a/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
+++ b/meta/recipes-devtools/python/python3-spdx-tools_0.8.3.bb
@@ -10,6 +10,8 @@ BBCLASSEXTEND =3D "native nativesdk"
=20
 inherit pypi python_setuptools_build_meta
=20
+PYPI_PACKAGE_SDIST =3D "spdx-tools"
+
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
 # Dependency required for pyspdxtools : python3-click
diff --git a/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.b=
b b/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb
index a60efa0fccc..c3af27584b3 100644
--- a/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-argparse_0.6.1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D5c1cd8f137=
74629fee215681e66a1056"
=20
 SRC_URI[sha256sum] =3D "f8be167aedf5670bd7c812ef515968ff4717c63cfc9cb4df=
5f34b54fd5649c37"
=20
-PYPI_PACKAGE =3D "sphinx_argparse"
-
 inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinx-copybutton_0.5.2=
.bb b/meta/recipes-devtools/python/python3-sphinx-copybutton_0.5.2.bb
index 04418046617..246837bd983 100644
--- a/meta/recipes-devtools/python/python3-sphinx-copybutton_0.5.2.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-copybutton_0.5.2.bb
@@ -7,4 +7,6 @@ SRC_URI[sha256sum] =3D "4cf17c82fb9646d1bc9ca92ac280813a3=
b605d8c421225fd9913154103
=20
 inherit setuptools3 pypi
=20
+PYPI_PACKAGE_SDIST =3D "sphinx-copybutton"
+
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.=
bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
index 927664c5fbb..4afe6d2dfc5 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.1.0.bb
@@ -12,8 +12,6 @@ RDEPENDS:${PN} +=3D " \
     python3-sphinxcontrib-jquery \
 "
=20
-PYPI_PACKAGE =3D "sphinx_rtd_theme"
-
 SRC_URI[sha256sum] =3D "b44276f2c276e909239a4f6c955aa667aaafeb78597923b1=
c60babc76db78e4c"
=20
 inherit setuptools3 pypi
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp=
_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_=
2.0.0.bb
index 686a4a17ae2..544b5ffc09a 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.=
bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.=
bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.rst;md5=3Dc771585704=
2d4c8c0105999ca0c072c5"
=20
 SRC_URI[sha256sum] =3D "2f29ef331735ce958efa4734873f084941970894c6090408=
b079c61b2e1c06d1"
=20
-PYPI_PACKAGE =3D "sphinxcontrib_applehelp"
-
 inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2=
.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.=
0.bb
index 9f539737083..542e45d522f 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.rst;md5=3Dfd30d9972a=
142c857a80c9f312e92b93"
=20
 SRC_URI[sha256sum] =3D "411f5d96d445d1d73bb5d52133377b4248ec79db5c793ce7=
dbe59e074b4dd1ad"
=20
-PYPI_PACKAGE =3D "sphinxcontrib_devhelp"
-
 inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_=
2.1.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.=
1.0.bb
index 1a15ccd0c4a..944b990ae09 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.b=
b
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.b=
b
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.rst;md5=3D24dce5ef6a=
13563241c24bc366f48886"
=20
 SRC_URI[sha256sum] =3D "c9e2916ace8aad64cc13a0d233ee22317f2b9025b9cf3295=
249fa985cc7082e9"
=20
-PYPI_PACKAGE =3D "sphinxcontrib_htmlhelp"
-
 inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.=
1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb
index d21e802582d..eca7225c909 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-jquery_4.1.bb
@@ -7,4 +7,6 @@ SRC_URI[sha256sum] =3D "1620739f04e36a2c779f1a131a2dfd49b=
2fd07351bf1968ced07436593
=20
 inherit pypi python_flit_core
=20
+PYPI_PACKAGE_SDIST =3D "sphinxcontrib-jquery"
+
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.=
0.1.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.=
bb
index c06ba1242f9..0e2b9d2b44c 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb
@@ -7,4 +7,6 @@ SRC_URI[sha256sum] =3D "a9925e4a4587247ed2191a22df5f69706=
56cb8ca2bd6284309578f2153
=20
 inherit pypi setuptools3
=20
+PYPI_PACKAGE_SDIST =3D "sphinxcontrib-jsmath"
+
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.=
0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.=
bb
index f51a0ba64b6..7b805f98ea3 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.rst;md5=3Df7a83b72ea=
86d04827575ec0b63430eb"
=20
 SRC_URI[sha256sum] =3D "4fe7d0ac8fc171045be623aba3e2a8f613f8682731f9153b=
b2e40ece16b9bbab"
=20
-PYPI_PACKAGE =3D "sphinxcontrib_qthelp"
-
 inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-serializi=
nghtml_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-seri=
alizinghtml_2.0.0.bb
index 63c55d36ae4..ae526fae45e 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_=
2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_=
2.0.0.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.rst;md5=3D32a84ac5cd=
3bbd10c4d479233ad588b6"
=20
 SRC_URI[sha256sum] =3D "e9d912827f872c029017a53f0ef2180b327c3f7fd23c8722=
9f7a8e8b70031d4d"
=20
-PYPI_PACKAGE =3D "sphinxcontrib_serializinghtml"
-
 inherit pypi python_flit_core
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfco=
nverter_2.1.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-svg=
2pdfconverter_2.1.0.bb
index 6b5350f46cb..d17e2b924c4 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter=
_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-svg2pdfconverter=
_2.1.0.bb
@@ -9,8 +9,6 @@ inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-wheel-native"
=20
-PYPI_PACKAGE =3D "sphinxcontrib_svg2pdfconverter"
-
 RDEPENDS:${PN} =3D "python3-sphinx"
 # Only support sphinxcontrib.rsvgconverter for now.
 # sphinxcontrib.cairosvgconverter depends on cairosvg module, no recipe =
yet
diff --git a/meta/recipes-devtools/python/python3-subunit_1.4.4.bb b/meta=
/recipes-devtools/python/python3-subunit_1.4.4.bb
index 0ff02ef3b86..ff93d19df43 100644
--- a/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
+++ b/meta/recipes-devtools/python/python3-subunit_1.4.4.bb
@@ -5,6 +5,7 @@ LICENSE =3D "Apache-2.0 OR BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D1;endline=3D20;md5=3Db1=
121e68d06c8d9ea544fcd895df0d39"
=20
 PYPI_PACKAGE =3D "python-subunit"
+PYPI_PACKAGE_SDIST =3D "python-subunit"
=20
 SRC_URI[sha256sum] =3D "1079363131aa1d3f45259237265bc2e61a77e35f20edfb6e=
3d1d2558a2cdea34"
=20
diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2026.=
9.21.13.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2026.=
9.21.13.bb
index b24753e381b..8dbf968310c 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13=
.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2026.9.21.13=
.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c=
9479bd8986968f4327"
=20
 SRC_URI[sha256sum] =3D "0a9ebc8d4e2f3e8a22848c5258033035bec17a3012ac3fea=
16dbaa764489eb71"
=20
-PYPI_PACKAGE =3D "trove_classifiers"
-
 inherit pypi python_setuptools_build_meta ptest-python-pytest
=20
 DEPENDS +=3D " python3-calver-native"
diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.16.=
0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
index cede81e1289..1e11251f5be 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.16.0.bb
@@ -12,9 +12,6 @@ SECTIONS =3D "libs"
 LICENSE =3D "PSF-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfcf6b249c2641540219a727f35d8d=
2c2"
=20
-# The name on PyPi is slightly different.
-PYPI_PACKAGE =3D "typing_extensions"
-
 SRC_URI[sha256sum] =3D "dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e=
907eb4db6f1a43e5"
=20
 inherit pypi python_flit_core
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.17.bb b/m=
eta/recipes-devtools/python/python3-uv-build_0.12.17.bb
index 322ac35f488..9752956f491 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.17.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.17.bb
@@ -19,7 +19,5 @@ inherit pypi python_maturin cargo-update-recipe-crates =
pkgconfig
=20
 DEPENDS +=3D "zstd"
=20
-PYPI_PACKAGE =3D "uv_build"
-
 BBCLASSEXTEND =3D "native"
 INSANE_SKIP:${PN} =3D "already-stripped"
diff --git a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb=
 b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
index 36bb2856a0b..64905dea773 100644
--- a/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
+++ b/meta/recipes-devtools/python/python3-vcs-versioning_2.4.1.bb
@@ -11,7 +11,6 @@ SRC_URI +=3D "\
     file://run-ptest \
 "
=20
-PYPI_PACKAGE =3D "vcs_versioning"
 PTEST_PYTEST_DIR =3D "testing_vcs"
=20
 inherit pypi python_setuptools_build_meta ptest-python-pytest
diff --git a/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb b/meta/=
recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
index 3b51a453b99..8d99297ac42 100644
--- a/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
+++ b/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cf66a49841200=
07c9881cc871cf49db"
=20
 inherit pypi python_setuptools_build_meta
=20
-PYPI_PACKAGE =3D "qemu_qmp"
-
 SRC_URI[sha256sum] =3D "a3c25d871fab549122b2340810de1f99481002c942a21324=
76b062aacdbf6e92"
=20
 DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_=
1.3.5.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.=
3.5.bb
index 83d420835da..5396720fbd0 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.b=
b
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.b=
b
@@ -4,7 +4,6 @@ SECTION =3D "devel/python"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D570a9b3749dd0463a1778803b12a6=
dce"
=20
-PYPI_PACKAGE =3D "sbom_cve_check"
 SRC_URI[sha256sum] =3D "9ed8b0e9c46015444cd3e30332d9558e0be5f5fec97f6df4=
7c6760166a314167"
=20
 inherit pypi python_hatchling
--=20
2.43.0


