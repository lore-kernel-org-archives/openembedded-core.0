Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id B74C17D90E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:07 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g3so2867796wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=An0D3xeyZogBT3C2CJzJ7D52XDRU0nly9Y++9MfB/vc=;
	b=m0DrU9dtuWWn7rhHIh14l0J7B1/+VJ50w5zWazSvGA6FToBjueizY9gSxpZSTiXgcZ
	Aind7CDCJNQ/pgKMFh/u1wNiR1j4tj/ZR1Knyp+2D57zFryGgwXW3xhrN5Vxc7T0GMTM
	GgHpLsRtsXbGdpDwhb5ViWX1kVzltTzqLti/YuO5P/gpRKhuEjqwmVMmv4yxQuXzBVQo
	LtIwTmMlONbWHso9VWyQxd7Wqzjl+AlNdYrXm5Rdj6WXaDJNfwKTCnU9MbflNR8W0TYg
	ZzNhvf5SJxuBjpqX0Rknnx0dcwB/f1xrnQNMK9ScpCEBSyIkTzHP0v4m45vkimwZccky
	eyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=An0D3xeyZogBT3C2CJzJ7D52XDRU0nly9Y++9MfB/vc=;
	b=ELxZXAWIx9yRkNoHPjH0TUbBoOzG8jb+mRE0vYKpC+NKHz99g31S3uyTzU8BZ53ea9
	1mi87H+4WWk15ZNeX7BwB0+im/XlWQGjEctLlyQMH6xSU6ZG1Bc8IptlJeJcbLv3ijB0
	77YIQuJfndON5SCkMvzWv8kZyEQ+hWrGnGAMcsRIgEz8CuMnpQbmQlS5tz+AZQs9mWrF
	IT7MKTOg14eweTu1G8IMiqc3gkyzuUmT24aU/j+JXULDnmdSdYWzzOcaclKv+XnDn+8w
	+K36W41AyFve4FYCTn/kqbuuRB3jnoGGJGV883I8oV5Ih/idd6bMSIygdmw6A882Dsn6
	sNnw==
X-Gm-Message-State: APjAAAXPhcPsSEv3lCdGnIqHWAKhca8gViedYSgu3orlNxKjDYr69VBE
	ASBFh+IOn2SAB9Evy+agluJr8TggNDM=
X-Google-Smtp-Source: APXvYqzU0ZWep7y3ZoWbMOYRkwo4n2loMT+2Pb+cN84th5ZrsQ+uBy1gKjPvqiWr6C5S2tq1VFhuMg==
X-Received: by 2002:adf:f285:: with SMTP id k5mr12472795wro.110.1554901928277; 
	Wed, 10 Apr 2019 06:12:08 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:25 +0530
Message-Id: <4e26c3a6aa647a322a8e8a3027a4114caed38f7d.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 06/33] oeqa/manual/sdk.json: Updated toolchain tarball to core-image-sato
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:08 -0000

From: sangeeta jain <sangeeta.jain@intel.com>

Manual test step for SDK is updated. Previously toolchain was "poky-glibc-x86_64-core-image-sato-sdk<type-arch>-toolchain-<release-version>.sh"
But toochain for core-image-sato-sdk is not available in releases after 2.1, hence changed it to "poky-glibc-x86_64-core-image-sato-<type-arch>-toolchain-<release-version>.sh

Other less significant update is to add exepcted result in intermediate test steps.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>

"poky-glibc-x86_64-core-image-sato-<type-arch>-toolchain-<release-version>.sh"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


