Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBBAC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 10:18:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.57680.1716200315934947666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 03:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FFE0FEC
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:18:59 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 319883F766
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 03:18:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] oeqa/sdk: rename test cases
Date: Mon, 20 May 2024 10:18:28 +0000
Message-Id: <20240520101833.1798907-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 10:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199563

Instead of having a test called eg "assimp", rename it to "cmake" as the
point of the test is to verify that CMake works.  This should make it
clearer what the tests are actually exercising.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/sdk/cases/{buildcpio.py =3D> autotools.py}  | 2 +-
 meta/lib/oeqa/sdk/cases/{assimp.py =3D> cmake.py}         | 4 ++--
 meta/lib/oeqa/sdk/cases/{buildgalculator.py =3D> gtk3.py} | 2 +-
 meta/lib/oeqa/sdk/cases/{buildlzip.py =3D> makefile.py}   | 2 +-
 meta/lib/oeqa/sdk/cases/{buildepoxy.py =3D> meson.py}     | 4 ++--
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{buildcpio.py =3D> autotools.py} (97%)
 rename meta/lib/oeqa/sdk/cases/{assimp.py =3D> cmake.py} (95%)
 rename meta/lib/oeqa/sdk/cases/{buildgalculator.py =3D> gtk3.py} (98%)
 rename meta/lib/oeqa/sdk/cases/{buildlzip.py =3D> makefile.py} (97%)
 rename meta/lib/oeqa/sdk/cases/{buildepoxy.py =3D> meson.py} (93%)

diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cas=
es/autotools.py
similarity index 97%
rename from meta/lib/oeqa/sdk/cases/buildcpio.py
rename to meta/lib/oeqa/sdk/cases/autotools.py
index 51003b19cd0..a711353791c 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/autotools.py
@@ -13,7 +13,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
=20
-class BuildCpioTest(OESDKTestCase):
+class AutotoolsTest(OESDKTestCase):
     """
     Check that autotools will cross-compile correctly.
     """
diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/=
cmake.py
similarity index 95%
rename from meta/lib/oeqa/sdk/cases/assimp.py
rename to meta/lib/oeqa/sdk/cases/cmake.py
index e986838aea7..4886435ddf1 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/cmake.py
@@ -13,7 +13,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
=20
-class BuildAssimp(OESDKTestCase):
+class CMakeTest(OESDKTestCase):
     """
     Test case to build a project using cmake.
     """
@@ -21,7 +21,7 @@ class BuildAssimp(OESDKTestCase):
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-cmake") or
                 self.tc.hasHostPackage("cmake-native")):
-            raise unittest.SkipTest("Needs cmake")
+            raise unittest.SkipTest("CMakeTest: needs cmake")
=20
     def test_assimp(self):
         with tempfile.TemporaryDirectory(prefix=3D"assimp", dir=3Dself.t=
c.sdk_dir) as testdir:
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/s=
dk/cases/gtk3.py
similarity index 98%
rename from meta/lib/oeqa/sdk/cases/buildgalculator.py
rename to meta/lib/oeqa/sdk/cases/gtk3.py
index 178f07472d5..c329c4bb86c 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/gtk3.py
@@ -13,7 +13,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
=20
-class GalculatorTest(OESDKTestCase):
+class GTK3Test(OESDKTestCase):
     """
     Test that autotools and GTK+ 3 compiles correctly.
     """
diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py b/meta/lib/oeqa/sdk/cas=
es/makefile.py
similarity index 97%
rename from meta/lib/oeqa/sdk/cases/buildlzip.py
rename to meta/lib/oeqa/sdk/cases/makefile.py
index b4b7d85b882..c0b40f1f728 100644
--- a/meta/lib/oeqa/sdk/cases/buildlzip.py
+++ b/meta/lib/oeqa/sdk/cases/makefile.py
@@ -9,7 +9,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
=20
-class BuildLzipTest(OESDKTestCase):
+class MakefileTest(OESDKTestCase):
     """
     Test that "plain" compilation works, using just $CC $CFLAGS etc.
     """
diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/ca=
ses/meson.py
similarity index 93%
rename from meta/lib/oeqa/sdk/cases/buildepoxy.py
rename to meta/lib/oeqa/sdk/cases/meson.py
index 147ee3e0eee..be53df204a5 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/meson.py
@@ -13,14 +13,14 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
=20
-class EpoxyTest(OESDKTestCase):
+class MesonTest(OESDKTestCase):
     """
     Test that Meson builds correctly.
     """
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-meson") or
                 self.tc.hasHostPackage("meson-native")):
-            raise unittest.SkipTest("EpoxyTest class: SDK doesn't contai=
n Meson")
+            raise unittest.SkipTest("MesonTest: needs meson")
=20
     def test_epoxy(self):
         with tempfile.TemporaryDirectory(prefix=3D"epoxy", dir=3Dself.tc=
.sdk_dir) as testdir:
--=20
2.34.1


