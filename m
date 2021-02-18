Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.32.1613667413130576165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GPzCp6aN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id v15so3762109wrx.4
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8DT7R1cWz9J2BPq2im5PVsG/pTwxw8qJffuSE/G1n1A=;
        b=GPzCp6aN11abHTWNbdOx5xB18Em0VMceXiEV4tdFnVbPeCKRWhnbp9Vc7tOccs0iPx
         3U/Cye7ncR83kyqens7R9ZP5zF7k6LrNtvbig/aq7Cc5nSyyg8UNk8p9Tq4kMjCEw/MZ
         lqWjqskwVide0ptZiJur8BVhMxkuBSRjhsd04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8DT7R1cWz9J2BPq2im5PVsG/pTwxw8qJffuSE/G1n1A=;
        b=IVg04Ef2ttp2a5wsH7ih6XEEt4dtKJGl9mTt+2hx9+pqZIUQqgzDB7/NK1p+nNiucm
         ftLP3afxnZgihvu03G+xBvp+CYMUgFgU+pFDNhs66FbkLEiNHy91OED+WcMNso1+j4DZ
         sAjTtezi72EDArwBW2VAqfbpHE2us0FB+lHO4zlzTWmAL8SzV0wMhnU8x1A+3YaqK7/X
         BP9CCeLEwHMypoE1thJTDNxAbq2pItfXPB9yi82geTrhVXjodaXfP54Yewls/vCH4D87
         ToYtYvVogLgYhRcWMipJPQHykbNOSfFi0Jb7BJkfQnb2e82ZAU0Y9x8dYWZQWsM8YyKU
         OwrA==
X-Gm-Message-State: AOAM531x7Cn1kh9mpeLRZ3ROknibMELEPeeuNuSKOfJ4IYJBu8O94VqZ
	JYN76NmtgWCUiG2inW0U6eenJ3QuIq9yLg==
X-Google-Smtp-Source: ABdhPJz6ePDncOG2cF3NGs+XjWAsVTd8IWAPfrOjBpbSW191H9+d5oFJDEqcd6vFSA0ui9ezgGjf5A==
X-Received: by 2002:adf:9226:: with SMTP id 35mr5247708wrj.408.1613667411318;
        Thu, 18 Feb 2021 08:56:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id b13sm9290328wrs.35.2021.02.18.08.56.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 08:56:51 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] selftest/incompatible_lic: Update the tests after the 'or-later' license handling changes
Date: Thu, 18 Feb 2021 16:56:43 +0000
Message-Id: <20210218165646.2109894-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the separate of the "-only" and "-or-later" licenses, we need to
update the tests to match the messages now given in the output.

Also use a mix of canonicalised and non-canonlised names in the
reference recipes to help test those cases and ensure coverage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../license/incompatible-license.bb           |  2 +-
 .../license/incompatible-licenses.bb          |  2 +-
 .../oeqa/selftest/cases/incompatible_lic.py   | 26 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-selftest/recipes-test/license/incompatible-license.bb b/meta-selftest/recipes-test/license/incompatible-license.bb
index 1728ad76b71..282f5c28751 100644
--- a/meta-selftest/recipes-test/license/incompatible-license.bb
+++ b/meta-selftest/recipes-test/license/incompatible-license.bb
@@ -1,3 +1,3 @@
 SUMMARY = "Recipe with an SPDX license"
 DESCRIPTION = "Is licensed with an SPDX license to be used for testing"
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0-only"
diff --git a/meta-selftest/recipes-test/license/incompatible-licenses.bb b/meta-selftest/recipes-test/license/incompatible-licenses.bb
index 9c1545efba2..ab3b58d2c97 100644
--- a/meta-selftest/recipes-test/license/incompatible-licenses.bb
+++ b/meta-selftest/recipes-test/license/incompatible-licenses.bb
@@ -1,3 +1,3 @@
 SUMMARY = "Recipe with multiple SPDX licenses"
 DESCRIPTION = "Is licensed with multiple SPDX licenses to be used for testing"
-LICENSE = "GPL-2.0 & GPL-3.0 & LGPL-3.0"
+LICENSE = "GPL-2.0-only & GPL-3.0 & LGPL-3.0-only"
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 2a6382a1a85..152da6332ab 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -15,66 +15,66 @@ class IncompatibleLicenseTests(OESelftestTestCase):
     # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
     # cannot be built when INCOMPATIBLE_LICENSE contains this SPDX license
     def test_incompatible_spdx_license(self):
-        self.lic_test('incompatible-license', 'GPL-3.0', 'GPL-3.0')
+        self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPL-3.0-only')
 
     # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
     # cannot be built when INCOMPATIBLE_LICENSE contains an alias (in
     # SPDXLICENSEMAP) of this SPDX license
     def test_incompatible_alias_spdx_license(self):
-        self.lic_test('incompatible-license', 'GPL-3.0', 'GPLv3')
+        self.lic_test('incompatible-license', 'GPL-3.0-only', 'GPLv3')
 
     # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
     # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded license
     # matching this SPDX license
     def test_incompatible_spdx_license_wildcard(self):
-        self.lic_test('incompatible-license', 'GPL-3.0', '*GPL-3.0')
+        self.lic_test('incompatible-license', 'GPL-3.0-only', '*GPL-3.0-only')
 
     # Verify that a package with an SPDX license (from AVAILABLE_LICENSES)
     # cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded alias
     # license matching this SPDX license
     def test_incompatible_alias_spdx_license_wildcard(self):
-        self.lic_test('incompatible-license', 'GPL-3.0', '*GPLv3')
+        self.lic_test('incompatible-license', 'GPL-3.0-only', '*GPLv3')
 
     # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
     # license cannot be built when INCOMPATIBLE_LICENSE contains this SPDX
     # license
     def test_incompatible_spdx_license_alias(self):
-        self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPL-3.0')
+        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', 'GPL-3.0-only')
 
     # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
     # license cannot be built when INCOMPATIBLE_LICENSE contains this alias
     def test_incompatible_alias_spdx_license_alias(self):
-        self.lic_test('incompatible-license-alias', 'GPL-3.0', 'GPLv3')
+        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', 'GPLv3')
 
     # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
     # license cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
     # license matching this SPDX license
     def test_incompatible_spdx_license_alias_wildcard(self):
-        self.lic_test('incompatible-license-alias', 'GPL-3.0', '*GPL-3.0')
+        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', '*GPL-3.0')
 
     # Verify that a package with an alias (from SPDXLICENSEMAP) to an SPDX
     # license cannot be built when INCOMPATIBLE_LICENSE contains a wildcarded
     # alias license matching the SPDX license
     def test_incompatible_alias_spdx_license_alias_wildcard(self):
-        self.lic_test('incompatible-license-alias', 'GPL-3.0', '*GPLv3')
+        self.lic_test('incompatible-license-alias', 'GPL-3.0-only', '*GPLv3')
 
     # Verify that a package with multiple SPDX licenses (from
     # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains
     # some of them
     def test_incompatible_spdx_licenses(self):
-        self.lic_test('incompatible-licenses', 'GPL-3.0 LGPL-3.0', 'GPL-3.0 LGPL-3.0')
+        self.lic_test('incompatible-licenses', 'GPL-3.0-only LGPL-3.0-only', 'GPL-3.0-only LGPL-3.0-only')
 
     # Verify that a package with multiple SPDX licenses (from
     # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains a
     # wildcard to some of them
     def test_incompatible_spdx_licenses_wildcard(self):
-        self.lic_test('incompatible-licenses', 'GPL-3.0 LGPL-3.0', '*GPL-3.0')
+        self.lic_test('incompatible-licenses', 'GPL-3.0-only LGPL-3.0-only', '*GPL-3.0-only')
 
     # Verify that a package with multiple SPDX licenses (from
     # AVAILABLE_LICENSES) cannot be built when INCOMPATIBLE_LICENSE contains a
     # wildcard matching all licenses
     def test_incompatible_all_licenses_wildcard(self):
-        self.lic_test('incompatible-licenses', 'GPL-2.0 GPL-3.0 LGPL-3.0', '*')
+        self.lic_test('incompatible-licenses', 'GPL-2.0-only GPL-3.0-only LGPL-3.0-only', '*')
 
     # Verify that a package with a non-SPDX license (neither in
     # AVAILABLE_LICENSES nor in SPDXLICENSEMAP) cannot be built when
@@ -91,7 +91,7 @@ INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 
     def test_bash_default(self):
         self.write_config(self.default_config())
-        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0+"
+        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0-or-later"
 
         result = bitbake('core-image-minimal', ignore_status=True)
         if error_msg not in result.output:
@@ -99,7 +99,7 @@ INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
 
     def test_bash_and_license(self):
         self.write_config(self.default_config() + '\nLICENSE_append_pn-bash = " & SomeLicense"')
-        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0+"
+        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package bash cannot be installed into the image because it has incompatible license(s): GPL-3.0-or-later"
 
         result = bitbake('core-image-minimal', ignore_status=True)
         if error_msg not in result.output:
-- 
2.27.0

