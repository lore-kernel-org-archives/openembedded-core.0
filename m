Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F008D17132
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 20:36:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2711.1729542960814665628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 13:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7FFC497
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 13:36:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D79833F73B
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 13:35:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meson: upgrade to 1.6.0
Date: Mon, 21 Oct 2024 21:35:55 +0100
Message-Id: <20241021203555.3319437-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 20:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206132

Detailed release notes at https://mesonbuild.com/Release-notes-for-1-6-0.=
html.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch | 6 +++---
 ...on-module-do-not-manipulate-the-environment-when.patch | 8 ++++----
 .../0002-Support-building-allarch-recipes-again.patch     | 2 +-
 .../meson/{meson_1.5.2.bb =3D> meson_1.6.0.bb}              | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.5.2.bb =3D> meson_1.6.0.bb} =
(98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warni=
ngs-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-=
warnings-fatal.patch
index b272fd45b04..dcc8209c319 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fat=
al.patch
@@ -1,4 +1,4 @@
-From 13e05ca933a572c1caf93372df808a30976f99cd Mon Sep 17 00:00:00 2001
+From 32c4ccfbdc8649f595a79e7fd1bd39d6f8325340 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -26,10 +26,10 @@ index 86bad9b..9703315 100644
          endian =3D literal['endian']
          if endian not in ('little', 'big'):
 diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
-index 484ef45..cf4a3ba 100644
+index 71a2f3a..4cbeabe 100644
 --- a/mesonbuild/environment.py
 +++ b/mesonbuild/environment.py
-@@ -389,10 +389,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
+@@ -416,10 +416,8 @@ def detect_cpu_family(compilers: CompilersDict) -> =
str:
          if compilers and not any_compiler_has_define(compilers, '__mips=
64'):
              trial =3D 'mips'
 =20
diff --git a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-=
manipulate-the-environment-when.patch b/meta/recipes-devtools/meson/meson=
/0001-python-module-do-not-manipulate-the-environment-when.patch
index b4671f591fc..23f96f47883 100644
--- a/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipul=
ate-the-environment-when.patch
+++ b/meta/recipes-devtools/meson/meson/0001-python-module-do-not-manipul=
ate-the-environment-when.patch
@@ -1,4 +1,4 @@
-From 66e350bbbd65e56a0d19c75710f61503e15e24a2 Mon Sep 17 00:00:00 2001
+From 4ff04d388baf9d31efa73a92c0124a8d45b65377 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 19 Nov 2018 14:24:26 +0100
 Subject: [PATCH] python module: do not manipulate the environment when c=
alling
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
  1 file changed, 1 insertion(+), 5 deletions(-)
=20
 diff --git a/mesonbuild/dependencies/python.py b/mesonbuild/dependencies=
/python.py
-index 883a29a..52bfbf3 100644
+index fff4aaa..1fde2f6 100644
 --- a/mesonbuild/dependencies/python.py
 +++ b/mesonbuild/dependencies/python.py
-@@ -399,9 +399,6 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
+@@ -400,9 +400,6 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
                      empty.name =3D 'python'
                      return empty
 =20
@@ -24,7 +24,7 @@ index 883a29a..52bfbf3 100644
                  try:
                      return PythonPkgConfigDependency(name, env, kwargs,=
 installation, True)
                  finally:
-@@ -410,8 +407,7 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
+@@ -411,8 +408,7 @@ def python_factory(env: 'Environment', for_machine: =
'MachineChoice',
                              os.environ[name] =3D value
                          elif name in os.environ:
                              del os.environ[name]
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-alla=
rch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-=
building-allarch-recipes-again.patch
index 5149d61af4e..d3120e84e89 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-rec=
ipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-rec=
ipes-again.patch
@@ -1,4 +1,4 @@
-From 61430cf9a80e24eb33d72c6eae4e8d536d308e08 Mon Sep 17 00:00:00 2001
+From bcdd72ed1956e0a1b1b725e552fa391c549c2099 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
diff --git a/meta/recipes-devtools/meson/meson_1.5.2.bb b/meta/recipes-de=
vtools/meson/meson_1.6.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.5.2.bb
rename to meta/recipes-devtools/meson/meson_1.6.0.bb
index beb1751e6f4..46127b7a9ba 100644
--- a/meta/recipes-devtools/meson/meson_1.5.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.6.0.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/meson-${=
PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] =3D "f955e09ab0d71ef180ae85df65991d58ed8430323de7d77a=
37e11c9ea630910b"
+SRC_URI[sha256sum] =3D "999b65f21c03541cf11365489c1fad22e2418bb0c3d50ca6=
1139f2eec09d5496"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)$"
=20
 inherit python_setuptools_build_meta github-releases
--=20
2.34.1


