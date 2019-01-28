Return-Path: <sangeeta.jain@intel.com>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Jan 2019 08:52:11 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3836C3AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 08:52:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jan 2019 00:42:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,533,1539673200"; d="scan'208";a="315419442"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga005.fm.intel.com with ESMTP; 28 Jan 2019 00:42:37 -0800
From: sangeeta.jain@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 16:11:15 +0800
Message-Id: <1548663075-1543-1-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] oeqa/manual/sdk.json: Updated toolchain tarball to core-image-sato
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
X-List-Received-Date: Mon, 28 Jan 2019 08:52:12 -0000

From: sangeeta jain <sangeeta.jain@intel.com>

Manual test step for SDK is updated. Previously toolchain was "poky-glibc-x86_64-core-image-sato-sdk<type-arch>-toolchain-<release-version>.sh"
But toochain for core-image-sato-sdk is not available in releases after 2.1, hence changed it to "poky-glibc-x86_64-core-image-sato-<type-arch>-toolchain-<release-version>.sh

Other less significant update is to add exepcted result in intermediate test steps.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>

"poky-glibc-x86_64-core-image-sato-<type-arch>-toolchain-<release-version>.sh"
---
 meta/lib/oeqa/manual/sdk.json | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/manual/sdk.json b/meta/lib/oeqa/manual/sdk.json
index 6475586..434982f 100644
--- a/meta/lib/oeqa/manual/sdk.json
+++ b/meta/lib/oeqa/manual/sdk.json
@@ -1,7 +1,7 @@
 [
     {
         "test": {
-            "@alias": "sdk.sdk_runqemu.test_sdk_toolchain_can_run_multiple_QEMU_machines_under_UNFS",
+            "@alias": "sdk.sdk_runqemu.test_install_cross_toolchain_can_run_multiple_qemu_for_x86",
             "author": [
                 {
                     "email": "ee.peng.yeoh@intel.com",
@@ -11,22 +11,22 @@
             "execution": {
                 "1": {
                     "action": "Prepare kernel, rootfs tar.bz2 image, and qemu configuration  \n    \ta. Download kernel, rootfs tar.bz2 image and qemu configuration from public autobuilder webpage  \n    \tb. Goto https://autobuilder.yocto.io/pub/releases/<target_release>/machines/qemu/qemux86/ \n    \tc. Download  \n    \t  \ti. rootfs tar.bz2: core-image-sato-sdk-qemux86.tar.bz2 \n      \t\tii. kernel: bzImage-qemux86.bin \n      \t\tiii. qemu configuration: core-image-sato-sdk-qemux86.qemuboot.conf ",
-                    "expected_results": ""
+                    "expected_results": "Download completes successfully."
                 },
                 "2": {
-                    "action": "Download & install sdk toolchain from public autobuilder \n    \ta. Goto https://autobuilder.yocto.io/pub/releases/<target_release>/toolchain/x86_64/ \n    \tb. Download poky-glibc-x86_64-core-image-sato-sdk-<type-arch>-toolchain-<release-version>.sh \n    \tc. Run command: poky-glibc-x86_64-core-image-sato-sdk-<type-arch>-toolchain-<release-version>.sh",
-                    "expected_results": ""
+                    "action": "Download & install toolchain tarball matching your host from public autobuilder \n    \ta. Goto https://autobuilder.yocto.io/pub/releases/<target_release>/toolchain/x86_64/ \n    \tb. Download poky-glibc-x86_64-core-image-sato-<type-arch>-toolchain-<release-version>.sh \n    \tc. Run command: poky-glibc-x86_64-core-image-sato-<type-arch>-toolchain-<release-version>.sh \n    \td. After installation toolchain  Run source command :   source  /toolchain-installed-path/environment-setup-<architecture name>-poky-linux",
+                    "expected_results": "Toolchain gets installed successfully."
                 },
                 "3": {
                     "action": "Extract rootfs twice into two images \n    \ta. Run 2 commands below:  \n                  runqemu-extract-sdk core-image-sato-sdk-qemux86.tar.bz2 qemux86_rootfs_image1  \n                  runqemu-extract-sdk core-image-sato-sdk-qemux86.tar.bz2 qemux86_rootfs_image2",
-                    "expected_results": ""
+                    "expected_results": "Both images build successfully."
                 },
                 "4": {
-                    "action": " From the 2 terminals, start qemu to boot up both two images \n    \ta. Run 2 commands below:  \n                  runqemu core-image-sato-sdk-qemux86.qemuboot.conf qemux86_rootfs_image1  \n                  runqemu core-image-sato-sdk-qemux86.qemuboot.conf qemux86_rootfs_image2 ",
+                    "action": " From the 2 terminals, start qemu to boot up both two images \n    \ta. Run 2 commands below:  \n                  runqemu <kernel-name> core-image-sato-sdk-qemux86.qemuboot.conf qemux86_rootfs_image1  \n                  runqemu <kernel-name> core-image-sato-sdk-qemux86.qemuboot.conf qemux86_rootfs_image2 ",
                     "expected_results": "Expect both qemu to boot up successfully."
                 }
             },
-            "summary": "test_sdk_toolchain_can_run_multiple_QEMU_machines_under_UNFS"
+            "summary": "test_install_cross_toolchain_can_run_multiple_qemu_for_x86"
         }
     }
 ]
\ No newline at end of file
-- 
2.7.4


