Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.85.1622564513916620875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 09:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73CA21042
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jun 2021 09:21:53 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DA8B3F719
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Jun 2021 09:21:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] oeqa: remove Clutter usage
Date: Tue,  1 Jun 2021 17:21:42 +0100
Message-Id: <20210601162144.2379642-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601162144.2379642-1-ross.burton@arm.com>
References: <20210601162144.2379642-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Remove the use of core-image-clutter in selftest and manual Toaster QA.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/manual/toaster-managed-mode.json |  6 +++---
 meta/lib/oeqa/selftest/cases/imagefeatures.py  | 12 ------------
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/manual/toaster-managed-mode.json b/meta/lib/oe=
qa/manual/toaster-managed-mode.json
index 12374c7c64..38b396ab09 100644
--- a/meta/lib/oeqa/manual/toaster-managed-mode.json
+++ b/meta/lib/oeqa/manual/toaster-managed-mode.json
@@ -2348,7 +2348,7 @@
           "expected_results": ""
         },
         "3": {
-          "action": "Build 6 recipes example (core-image-sato, core-imag=
e-minimal, core-image-base, core-image-clutter) to name a few. ",
+          "action": "Build 6 recipes example (core-image-sato, core-imag=
e-minimal, core-image-base) to name a few. ",
           "expected_results": " All recipes are built correctly \n\n"
         },
         "4": {
@@ -2382,7 +2382,7 @@
           "expected_results": ""
         },
         "3": {
-          "action": "Build 6 recipes example (core-image-sato, core-imag=
e-minimal, core-image-base, core-image-clutter) to name a few. \n\n",
+          "action": "Build 6 recipes example (core-image-sato, core-imag=
e-minimal, core-image-base) to name a few. \n\n",
           "expected_results": "All recipes are built correctly \n\n"
         },
         "4": {
@@ -2420,7 +2420,7 @@
           "expected_results": ""
         },
         "3": {
-          "action": "Build 4 recipes example (core-image-sato, core-imag=
e-minimal, core-image-base, core-image-clutter) to name a few. \n\n",
+          "action": "Build 4 recipes example (core-image-sato, core-imag=
e-minimal, core-image-base) to name a few. \n\n",
           "expected_results": " All recipes are built correctly \n\n"
         },
         "4": {
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeq=
a/selftest/cases/imagefeatures.py
index 5d4330b48f..2de22d3404 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -68,18 +68,6 @@ class ImageFeatures(OESelftestTestCase):
                     self.assertEqual(status, 0, 'ssh to user tester fail=
ed with %s' % output)
=20
=20
-    def test_clutter_image_can_be_built(self):
-        """
-        Summary:     Check if clutter image can be built
-        Expected:    1. core-image-clutter can be built
-        Product:     oe-core
-        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
-        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com=
>
-        """
-
-        # Build a core-image-clutter
-        bitbake('core-image-clutter')
-
     def test_wayland_support_in_image(self):
         """
         Summary:     Check Wayland support in image
--=20
2.25.1

