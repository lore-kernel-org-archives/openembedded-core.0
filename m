Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C30137DE82
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 01:22:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2019 18:22:45 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 15 May 2019 18:22:45 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 09:22:29 +0800
Message-Id: <1557969749-80524-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557969749-80524-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1557969749-80524-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/2 v2] oeqa/manual/bsp-hw.json: Remove rpm install dependency
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
X-List-Received-Date: Thu, 16 May 2019 01:22:43 -0000

Remove the bsps-hw.bsps-hw.rpm_-__install_dependency_package
as it was replaced by the test_rpm_install_dependency inside
oeqa/runtime/cases/rpm.py.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/manual/bsp-hw.json | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index 4b7c76f..017de9d 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -1,32 +1,6 @@
 [
     {
         "test": {
-            "@alias": "bsps-hw.bsps-hw.rpm_-__install_dependency_package",
-            "author": [
-                {
-                    "email": "alexandru.c.georgescu@intel.com",
-                    "name": "alexandru.c.georgescu@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Get a not previously installed RPM package or build one on local machine, which should have run-time dependency.For example, \"mc\" (Midnight Commander, which is a visual file manager) should depend on \"ncurses-terminfo\".   \n\n$ bitbake mc  \n\n\n",
-                    "expected_results": ""
-                },
-                "2": {
-                    "action": "Copy the package into a system folder (for example /home/root/rpm_packages).  \n\n\n",
-                    "expected_results": ""
-                },
-                "3": {
-                    "action": "Run \"rpm -ivh package_name\" and check the output, for example \"rpm -ivh mc.rpm*\" should report the dependency on \"ncurses-terminfo\".\n\n\n\n",
-                    "expected_results": "3 . rpm command should report message when some RPM installation depends on other packages."
-                }
-            },
-            "summary": "rpm_-__install_dependency_package"
-        }
-    },
-    {
-        "test": {
             "@alias": "bsps-hw.bsps-hw.boot_and_install_from_USB",
             "author": [
                 {
-- 
2.7.4


