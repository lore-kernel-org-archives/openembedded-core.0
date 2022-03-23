Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D52CCC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 16:15:03 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.121.1648052102566976721
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=S34ZpPxe;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648052102;
  x=1679588102;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xqiyKOCeKi0TCDUqAsK3Gpc9N1uEr3Vpwwu5IFvXP4o=;
  b=S34ZpPxeTzFdbjC2lRh90CVIVhBB01sEHQi/5X4BcOFx0uI9pY7D15vx
   mfE96JYKCFOUednn9FNyR8ybu8TtuDib/CjH5ipRbuHf1R5CPRKZgNfrK
   dtQCq6p2B66tJAyszPvn3kDrJrN5N0ztg/W1dvts6KEv84HUHjkP4HK/G
   WlyuuJZEXVjSxrTvNrcWTddv3LpQeFsIXyPYXvKdLyuDD5XrBhxTm/pRZ
   0Gn7OhRJbMwIrju9ayAdC5kpU1lJcuGdEh8YfkhCsrzqEEhbwssW4a4fW
   z5fHxvgSF8sZ58TlZa3pIlqec2zcLDvCw8LJjiCidrJ4NVsWfH5IUZjI3
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] selftest/incompatible_lic: Remove references to
 AVAILABLE_LICENSES
Date: Wed, 23 Mar 2022 17:14:57 +0100
Message-ID: <20220323161457.7850-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 16:15:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163588

The AVAILABLE_LICENSES variable has been removed from OE-Core.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../oeqa/selftest/cases/incompatible_lic.py   | 40 +++++++++----------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 0794d46e6d..6279d74245 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -13,15 +13,15 @@ class IncompatibleLicenseTestObsolete(OESelftestTestCase):
         if error_msg not in result.output:
             raise AssertionError(result.output)
 
-    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
-    # cannot be built when INCOMPATIBLE_LICENSE contains an alias (in
-    # SPDXLICENSEMAP) of this SPDX license
+    # Verify that a package with an SPDX license cannot be built when
+    # INCOMPATIBLE_LICENSE contains an alias (in SPDXLICENSEMAP) of this SPDX
+    # license
     def test_incompatible_alias_spdx_license(self):
         self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPLv3', "is an obsolete license, please use an SPDX reference in INCOMPATIBLE_LICENSE")
 
-    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
-    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded alias
-    # license matching this SPDX license
+    # Verify that a package with an SPDX license cannot be built when
+    # INCOMPATIBLE_LICENSE contains a wildcarded alias license matching this
+    # SPDX license
     def test_incompatible_alias_spdx_license_wildcard(self):
         self.lic_test('incompatible-license', 'GPL-3.0-only', '*GPLv3', "*GPLv3 is an invalid license wildcard entry")
 
@@ -43,16 +43,14 @@ class IncompatibleLicenseTestObsolete(OESelftestTestCase):
         self.lic_test('incompatible-license-alias', 'GPL-3.0-only', '*GPLv3', "*GPLv3 is an invalid license wildcard entry")
 
 
-    # Verify that a package with multiple SPDX licenses (from
-    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains a
-    # wildcard to some of them
+    # Verify that a package with multiple SPDX licenses cannot be built when
+    # INCOMPATIBLE_LICENSE contains a wildcard to some of them
     def test_incompatible_spdx_licenses_wildcard(self):
         self.lic_test('incompatible-licenses', 'GPL-3.0-only LGPL-3.0-only', '*GPL-3.0-only', "*GPL-3.0-only is an invalid license wildcard entry")
 
 
-    # Verify that a package with multiple SPDX licenses (from
-    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains a
-    # wildcard matching all licenses
+    # Verify that a package with multiple SPDX licenses cannot be built when
+    # INCOMPATIBLE_LICENSE contains a wildcard matching all licenses
     def test_incompatible_all_licenses_wildcard(self):
         self.lic_test('incompatible-licenses', 'GPL-2.0-only GPL-3.0-only LGPL-3.0-only', '*', "* is an invalid license wildcard entry")
 
@@ -67,14 +65,14 @@ class IncompatibleLicenseTests(OESelftestTestCase):
         if error_msg not in result.output:
             raise AssertionError(result.output)
 
-    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
-    # cannot be built when INCOMPATIBLE_LICENSE contains this SPDX license
+    # Verify that a package with an SPDX license cannot be built when
+    # INCOMPATIBLE_LICENSE contains this SPDX license
     def test_incompatible_spdx_license(self):
         self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPL-3.0-only')
 
-    # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
-    # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded license
-    # matching this SPDX license
+    # Verify that a package with an SPDX license cannot be built when
+    # INCOMPATIBLE_LICENSE contains a wildcarded license matching this SPDX
+    # license
     def test_incompatible_spdx_license_wildcard(self):
         self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPL-3.0*')
 
@@ -84,14 +82,12 @@ class IncompatibleLicenseTests(OESelftestTestCase):
     def test_incompatible_spdx_license_alias(self):
         self.lic_test('incompatible-license-alias', 'GPL-3.0-only', 'GPL-3.0-only')
 
-    # Verify that a package with multiple SPDX licenses (from
-    # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains
-    # some of them
+    # Verify that a package with multiple SPDX licenses cannot be built when
+    # INCOMPATIBLE_LICENSE contains some of them
     def test_incompatible_spdx_licenses(self):
         self.lic_test('incompatible-licenses', 'GPL-3.0-only LGPL-3.0-only', 'GPL-3.0-only LGPL-3.0-only')
 
-    # Verify that a package with a non-SPDX license (neither in
-    # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
+    # Verify that a package with a non-SPDX license cannot be built when
     # INCOMPATIBLE_LICENSE contains this license
     def test_incompatible_nonspdx_license(self):
         self.lic_test('incompatible-nonspdx-license', 'FooLicense', 'FooLicense')

