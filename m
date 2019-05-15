Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC057DEA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 02:47:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 May 2019 19:47:55 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 14 May 2019 19:47:54 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 May 2019 10:47:50 +0800
Message-Id: <1557888470-57934-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557888470-57934-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1557888470-57934-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 2/2] oeqa/manual/bsp-hw.json: Remove rpm install dependency
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
X-List-Received-Date: Wed, 15 May 2019 02:47:54 -0000

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


