Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 37CC274F99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 08:21:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2018 01:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,476,1520924400"; d="scan'208";a="64092197"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 04 Jun 2018 01:21:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 11:21:51 +0300
Message-Id: <20180604082153.5814-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/3] oeqa: replace Alex Kanavin's @intel email address with a personal one
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Jun 2018 08:21:38 -0000

As I will be leaving Intel, this address will no longer be valid,
so swap it for my personal one for now.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py | 2 +-
 meta/lib/oeqa/runtime/cases/rpm.py                  | 2 +-
 meta/lib/oeqa/selftest/cases/distrodata.py          | 4 ++--
 meta/lib/oeqa/selftest/cases/runtime_test.py        | 4 ++--
 meta/lib/oeqa/selftest/cases/signing.py             | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 81c50ed97b7..5e9ccfb7bd0 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -24,7 +24,7 @@ class DnfSelftest(DnfTest):
         Expected: 1. Feeds were correctly set for dnf
                   2. Update recovers packages from host's repo
         Author: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
-        Author: Alexander Kanavin <alexander.kanavin@intel.com>
+        Author: Alexander Kanavin <alex.kanavin@gmail.com>
         """
         # When we created an image, we had to supply fake ip and port
         # for the feeds. Now we can patch the real ones into the config file.
diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 05b94c7b40e..4ccfebe075e 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -106,7 +106,7 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
         Expected:    There should be some RPM prefixed entries in the above file.
         Product:     BSPs
         Author:      Alexandru Georgescu <alexandru.c.georgescu@intel.com>
-        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
+        Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
         db_files_cmd = 'ls /var/lib/rpm/__db.*'
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 7b2800464cb..e7b5e349564 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -21,7 +21,7 @@ class Distrodata(OESelftestTestCase):
         Summary:     Test that upstream version checks do not regress
         Expected:    Upstream version checks should succeed except for the recipes listed in the exception list.
         Product:     oe-core
-        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
+        Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         """
         checkpkg_result = open(os.path.join(get_bb_var("LOG_DIR"), "checkpkg.csv")).readlines()[1:]
         regressed_failures = [pkg_data[0] for pkg_data in [pkg_line.split('\t') for pkg_line in checkpkg_result] if pkg_data[11] == 'UNKNOWN_BROKEN']
@@ -46,7 +46,7 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
         Summary:     Test that oe-core recipes have a maintainer
         Expected:    All oe-core recipes (except a few special static/testing ones) should have a maintainer listed in maintainers.inc file.
         Product:     oe-core
-        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
+        Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         """
         def is_exception(pkg):
             exceptions = ["packagegroup-", "initramfs-", "systemd-machine-units", "target-sdk-provides-dummy"]
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 9c9b4b34111..30fd9b2a50f 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -135,7 +135,7 @@ class TestImage(OESelftestTestCase):
         Summary: Check package feeds functionality for dnf
         Expected: 1. Check that remote package feeds can be accessed
         Product: oe-core
-        Author: Alexander Kanavin <alexander.kanavin@intel.com>
+        Author: Alexander Kanavin <alex.kanavin@gmail.com>
         """
         if get_bb_var('DISTRO') == 'poky-tiny':
             self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
@@ -231,7 +231,7 @@ class Postinst(OESelftestTestCase):
         Expected:       The scriptlet failure is properly reported.
                         The file that is created after the error in the scriptlet is not present.
         Product: oe-core
-        Author: Alexander Kanavin <alexander.kanavin@intel.com>
+        Author: Alexander Kanavin <alex.kanavin@gmail.com>
         """
 
         import oe.path
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index a750cfc7b28..a130ac96cf9 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -41,7 +41,7 @@ class Signing(OESelftestTestCase):
         Expected:    Images can be created from signed packages
         Product:     oe-core
         Author:      Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        Author:      Alexander Kanavin <alexander.kanavin@intel.com>
+        Author:      Alexander Kanavin <alex.kanavin@gmail.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
         import oe.packagedata
-- 
2.17.0


