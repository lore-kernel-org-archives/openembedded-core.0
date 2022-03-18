Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E185BC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:30:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.10195.1647613837536509369
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 07:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97C721515
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 07:30:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 291693F7D7
	for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 07:30:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] classes/setuptools_build_meta: rename to
 python_setuptools_build_meta
Date: Fri, 18 Mar 2022 14:30:33 +0000
Message-Id: <20220318143033.1703970-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 14:30:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163451

Rename this class to be python-prefixed to match the other new Python
build system classes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ..._build_meta.bbclass =3D> python_setuptools_build_meta.bbclass} | 0
 meta/recipes-devtools/meson/meson_0.61.2.bb                     | 2 +-
 meta/recipes-devtools/python/python3-attrs_21.4.0.bb            | 2 +-
 meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb            | 2 +-
 meta/recipes-devtools/python/python3-git_3.1.27.bb              | 2 +-
 .../python/python3-importlib-metadata_4.11.3.bb                 | 2 +-
 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb         | 2 +-
 meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb        | 2 +-
 meta/recipes-devtools/python/python3-mako_1.1.6.bb              | 2 +-
 meta/recipes-devtools/python/python3-markdown_3.3.6.bb          | 2 +-
 meta/recipes-devtools/python/python3-packaging_21.3.bb          | 2 +-
 meta/recipes-devtools/python/python3-pip_22.0.3.bb              | 2 +-
 meta/recipes-devtools/python/python3-pluggy_1.0.0.bb            | 2 +-
 meta/recipes-devtools/python/python3-py_1.11.0.bb               | 2 +-
 meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb       | 2 +-
 meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb     | 2 +-
 meta/recipes-devtools/python/python3-pytest_7.0.1.bb            | 2 +-
 meta/recipes-devtools/python/python3-pyyaml_6.0.bb              | 2 +-
 .../python/python3-setuptools-rust-native_1.1.2.bb              | 2 +-
 meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb    | 2 +-
 meta/recipes-devtools/python/python3-setuptools_59.5.0.bb       | 2 +-
 meta/recipes-devtools/python/python3-zipp_3.7.0.bb              | 2 +-
 22 files changed, 21 insertions(+), 21 deletions(-)
 rename meta/classes/{setuptools_build_meta.bbclass =3D> python_setuptool=
s_build_meta.bbclass} (100%)

diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/py=
thon_setuptools_build_meta.bbclass
similarity index 100%
rename from meta/classes/setuptools_build_meta.bbclass
rename to meta/classes/python_setuptools_build_meta.bbclass
diff --git a/meta/recipes-devtools/meson/meson_0.61.2.bb b/meta/recipes-d=
evtools/meson/meson_0.61.2.bb
index 8304bfdac98..356f00ce875 100644
--- a/meta/recipes-devtools/meson/meson_0.61.2.bb
+++ b/meta/recipes-devtools/meson/meson_0.61.2.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] =3D "0233a7f8d959079318f6052b0939c27=
f68a5de86ba601f25c9ee6869fb
 UPSTREAM_CHECK_URI =3D "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX =3D "meson-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-inherit setuptools_build_meta
+inherit python_setuptools_build_meta
=20
 RDEPENDS:${PN} =3D "ninja python3-modules python3-pkg-resources"
=20
diff --git a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb b/meta/=
recipes-devtools/python/python3-attrs_21.4.0.bb
index 20e4541f81c..1839ce62450 100644
--- a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd4ab25949a73fe=
7d4fdee93bcbdbf8ff"
=20
 SRC_URI[sha256sum] =3D "626ba8234211db98e869df76230a137c4c40a12d72445c45=
d5f5b716f076e2fd"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN}:class-target +=3D " \
     ${PYTHON_PN}-crypt \
diff --git a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb b/meta/=
recipes-devtools/python/python3-bcrypt_3.2.0.bb
index 731aff299ba..6a4d1aef5cc 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
@@ -8,7 +8,7 @@ DEPENDS +=3D "${PYTHON_PN}-cffi-native"
 SRC_URI[md5sum] =3D "fe31390dab603728f756cd3d6830c80a"
 SRC_URI[sha256sum] =3D "5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a689=
2f5d9e7c6cfbfb29"
=20
-inherit pypi setuptools_build_meta ptest
+inherit pypi python_setuptools_build_meta ptest
=20
 SRC_URI +=3D " \
 	file://run-ptest \
diff --git a/meta/recipes-devtools/python/python3-git_3.1.27.bb b/meta/re=
cipes-devtools/python/python3-git_3.1.27.bb
index 3e7aa883f21..fb1bae8f8e4 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.27.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.27.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8b8d26c37c1d=
5a04f9b0186edbebc183"
=20
 PYPI_PACKAGE =3D "GitPython"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "1c885ce809e8ba2d88a29befeb385fcea06338d3640712b5=
9ca623c220bb5704"
=20
diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.11=
.3.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
index b2da69b0551..d8e56ccb253 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://pypi.org/project/importlib-metadata=
/"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De88ae122f3925d8bde8319060f2dd=
b8e"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "importlib_metadata"
 UPSTREAM_CHECK_REGEX =3D "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/me=
ta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
index 5338980e699..4643437b800 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -9,4 +9,4 @@ SRC_URI[sha256sum] =3D "bc3af051d7d14b2ee5ef9969666def0cd=
1a000e121eaea580d4a313df4
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb b/m=
eta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
index 4c142296410..10b39e76b2d 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7a60a81c146ec2=
5599a3e1dabb8610a8 \
=20
 SRC_URI[sha256sum] =3D "636694eb41b3535ed608fe04129f26542b59ed99808b4f68=
8aa32dcf55317a83"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-sc=
m-native"
=20
diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/re=
cipes-devtools/python/python3-mako_1.1.6.bb
index 23e13cff948..71e5d96ba1c 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D943eb67718222d=
b21d44a4ef1836675f"
=20
 PYPI_PACKAGE =3D "Mako"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "4e9e345a41924a954251b95b4b28e14a301145b544901332=
e658907a7464b6b2"
=20
diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb b/met=
a/recipes-devtools/python/python3-markdown_3.3.6.bb
index a46a9ae0667..5ce9fef7dd6 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.3.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://python-markdown.github.io/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D745aaad0c69c60039e638bff9f=
fc59ed"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 PYPI_PACKAGE =3D "Markdown"
 SRC_URI[sha256sum] =3D "76df8ae32294ec39dcf89340382882dfa12975f87f45c3ed=
1ecdb1e8cefc7006"
diff --git a/meta/recipes-devtools/python/python3-packaging_21.3.bb b/met=
a/recipes-devtools/python/python3-packaging_21.3.bb
index a81fd94d37a..e3b9a440c4e 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.3.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dfaadaedca9251a=
90b205c9167578ce91"
=20
 SRC_URI[sha256sum] =3D "dd47c42927d89ab911e606518907cc2d3a1f38bbd0263859=
70643f9c5b8ecfeb"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/re=
cipes-devtools/python/python3-pip_22.0.3.bb
index 9ca8fbc1e5a..ee3e578b2c8 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52baf95163b597008bb46=
db68030"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
 SRC_URI +=3D "file://no_shebang_mangling.patch"
diff --git a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb b/meta/=
recipes-devtools/python/python3-pluggy_1.0.0.bb
index 73bbcb02697..3f2895a061b 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} +=3D "${PYTHON_PN}-importlib-metadata \
                    ${PYTHON_PN}-more-itertools \
 "
=20
-inherit pypi ptest setuptools_build_meta
+inherit pypi ptest python_setuptools_build_meta
=20
 SRC_URI +=3D " \
 	file://run-ptest \
diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb b/meta/rec=
ipes-devtools/python/python3-py_1.11.0.bb
index 02027248f46..a2bd2d84fc1 100644
--- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] =3D "51c75c4126074b472f746a24399ad32f6=
053d1b34b68d2fa41e558e6f4
=20
 DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb b/=
meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
index ecd55672f5e..b4d9e3af393 100644
--- a/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.mit;md5=3Db695eb9c6e=
7a6fb1b1bc2d193c42776e"
=20
 SRC_URI[sha256sum] =3D "d4d61f8b993a7255ba714df3aca52700f8125289f84f704c=
f80916517c46eb96"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN} +=3D " \
     ${PYTHON_PN}-numbers \
diff --git a/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb =
b/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
index 0748886609d..1020b2be261 100644
--- a/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest-runner_5.3.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7a7126e0682062=
90f3fe9f8d6c713ea6"
=20
 SRC_URI[sha256sum] =3D "0fce5b8dc68760f353979d99fdd6b3ad46330b6b1837e207=
7a89ebcf204aac91"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D " \
     ${PYTHON_PN}-setuptools-scm-native"
diff --git a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb b/meta/=
recipes-devtools/python/python3-pytest_7.0.1.bb
index ea6ba80300a..19eb9b15e80 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.0.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] =3D "e30905a0c131d3d94b89624a1cc5afec3=
e0ba2fbdb151867d8e0ebd498
=20
 DEPENDS +=3D "python3-setuptools-scm-native"
=20
-inherit update-alternatives pypi setuptools_build_meta
+inherit update-alternatives pypi python_setuptools_build_meta
=20
 RDEPENDS:${PN}:class-target +=3D " \
     ${PYTHON_PN}-atomicwrites \
diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.bb b/meta/re=
cipes-devtools/python/python3-pyyaml_6.0.bb
index 6fe726110db..d142a0fc3e2 100644
--- a/meta/recipes-devtools/python/python3-pyyaml_6.0.bb
+++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d8242660a8371=
add5fe547adf083079"
=20
 PYPI_PACKAGE =3D "PyYAML"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI[sha256sum] =3D "68fb519c14306fec9720a2a5b45bc9f0c8d1b9c72adf45c3=
7baedfcd949c35a2"
=20
diff --git a/meta/recipes-devtools/python/python3-setuptools-rust-native_=
1.1.2.bb b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.=
1.2.bb
index bac7b6434a5..8ec9a86f007 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.b=
b
+++ b/meta/recipes-devtools/python/python3-setuptools-rust-native_1.1.2.b=
b
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D011cd92e702d=
d9e6b1a26157b6fd53f5"
 SRC_URI =3D "https://files.pythonhosted.org/packages/67/08/e1aa2c582c62a=
c76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar=
.gz"
 SRC_URI[sha256sum] =3D "a0adb9b503c0ffc4e8fe80b7c617898cefa78049983aaaea=
7f747e153a3e65d1"
=20
-inherit cargo pypi setuptools_build_meta native
+inherit cargo pypi python_setuptools_build_meta native
=20
 DEPENDS +=3D "python3-setuptools-scm-native python3-wheel-native"
=20
diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb=
 b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
index 182ccecbbfc..e09c598bf52 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endli=
ne=3D8;md5=3D8227180126797a0148
 SRC_URI[sha256sum] =3D "6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c1=
2f6eff280a5a9e30"
=20
 PYPI_PACKAGE =3D "setuptools_scm"
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 UPSTREAM_CHECK_REGEX =3D "setuptools_scm-(?P<pver>.*)\.tar"
=20
diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/=
meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index 35bec19e33d..f2810e18d31 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;beginline=3D1;endline=3D19;md5=3D7a=
7126e068206290f3fe9f8d6c713ea6"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 SRC_URI:append:class-native =3D " file://0001-conditionally-do-not-fetch=
-code-by-easy_install.patch"
=20
diff --git a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb b/meta/re=
cipes-devtools/python/python3-zipp_3.7.0.bb
index d0f936faf7c..495e7f51f01 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.7.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] =3D "9f50f446828eb9d45b267433fd3e9da8d=
801f614129124863f9c51ebce
=20
 DEPENDS +=3D "${PYTHON_PN}-setuptools-scm-native"
=20
-inherit pypi setuptools_build_meta
+inherit pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "${PYTHON_PN}-toml-native"
=20
--=20
2.25.1


