Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 702617997F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:42:14 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id y134so17569869itc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=sb3MW7nbWRI1EQOE/bWnsYPKZmGy042IPXDsVb+Fn1I=;
	b=EYCGaQmxfnhDmZHdzrNORfK5IaL5yQeDE/6HkS0/QzIIq0ileskVfaCTaBCSXoNjYi
	6jnNcfYoP6I57jFz/aTDGV0DDGFqURTVEdS0UzoEyXORzHTX7dYCRwCkxddfB3hyPj/5
	TNEaAx3Ymx8vvtM6jUKITEuBmB3RIe834xiqzLDGkkq3BOasBKLiyC21HKm64B8/gaSP
	SUVbG2n7JzjTSXE2c5PI9MJAI5uRNac6MIHZYbBbq4rNUS5zZL5t81uXAyRqJ3c48Glu
	gFYvKAVXJVwFbTi0XLWQ1xWouc3SCWlZF0YNvvN2gFgBTa0ceum1WbHby/r5W9QqGbCA
	q+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=sb3MW7nbWRI1EQOE/bWnsYPKZmGy042IPXDsVb+Fn1I=;
	b=CL8zm5TSBL8TbpOV/h9IhSmBdPHq4x6z6DS+CAAGfIhG+G/7yvkjJVqghemZHtik8h
	ODRlF1mo2mmu5XuNKToZ2yLLiVTcxmV0kzHZFvisnfkbYt5/J5mSesmnINheZpgqWLPt
	0udNtKxrtCehTTD/AkijgMikxj+q1EzX+7qDmAIr0ZrO2I6G3iQkVCe000DBb3Za3TzB
	drWcQn2bdcXEw5qxAtxS7jm/p3ez/csiP9HnUVqP4xuiymZW0LL5xXzVpBI8Y5pm+Kxk
	JPObV6KFxIJ26CEmBV0QyCF8fGt7Sd5fljYHWmSH7xXoXV9+ToOmY0GoSIv0oRaSHA0G
	TNcA==
X-Gm-Message-State: APjAAAUrR1dWAtCQIYw3bbAClJi0E1QfaFrFttGk3gbjta1FWHJX1XlE
	kfdtFf8rq9+REQLCa7uTcC9LzS8W
X-Google-Smtp-Source: APXvYqyO5ErJh3T7hA9alUEKuDjj8RssBp50OlUpUj6gYADr1nC57+38bsEWEeNESIbAcKymS0Q1LQ==
X-Received: by 2002:a24:3556:: with SMTP id k83mr14859664ita.68.1555936935461; 
	Mon, 22 Apr 2019 05:42:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	h133sm6173634itb.34.2019.04.22.05.42.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:42:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:41:59 -0600
Message-Id: <1555936919-19078-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
References: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 7/7] manual sdk: remove this manual sdk test
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
X-List-Received-Date: Mon, 22 Apr 2019 12:42:14 -0000

This is done during nearly all qemu testimage
This seems to test "release" artifacts on the web

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/sdk.json | 32 --------------------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 meta/lib/oeqa/manual/sdk.json

diff --git a/meta/lib/oeqa/manual/sdk.json b/meta/lib/oeqa/manual/sdk.json
deleted file mode 100644
index 434982f..0000000
--- a/meta/lib/oeqa/manual/sdk.json
+++ /dev/null
@@ -1,32 +0,0 @@
-[
-    {
-        "test": {
-            "@alias": "sdk.sdk_runqemu.test_install_cross_toolchain_can_run_multiple_qemu_for_x86",
-            "author": [
-                {
-                    "email": "ee.peng.yeoh@intel.com",
-                    "name": "ee.peng.yeoh@intel.com"
-                }
-            ],
-            "execution": {
-                "1": {
-                    "action": "Prepare kernel, rootfs tar.bz2 image, and qemu configuration  \n    \ta. Download kernel, rootfs tar.bz2 image and qemu configuration from public autobuilder webpage  \n    \tb. Goto https://autobuilder.yocto.io/pub/releases/<target_release>/machines/qemu/qemux86/ \n    \tc. Download  \n    \t  \ti. rootfs tar.bz2: core-image-sato-sdk-qemux86.tar.bz2 \n      \t\tii. kernel: bzImage-qemux86.bin \n      \t\tiii. qemu configuration: core-image-sato-sdk-qemux86.qemuboot.conf ",
-                    "expected_results": "Download completes successfully."
-                },
-                "2": {
-                    "action": "Download & install toolchain tarball matching your host from public autobuilder \n    \ta. Goto https://autobuilder.yocto.io/pub/releases/<target_release>/toolchain/x86_64/ \n    \tb. Download poky-glibc-x86_64-core-image-sato-<type-arch>-toolchain-<release-version>.sh \n    \tc. Run command: poky-glibc-x86_64-core-image-sato-<type-arch>-toolchain-<release-version>.sh \n    \td. After installation toolchain  Run source command :   source  /toolchain-installed-path/environment-setup-<architecture name>-poky-linux",
-                    "expected_results": "Toolchain gets installed successfully."
-                },
-                "3": {
-                    "action": "Extract rootfs twice into two images \n    \ta. Run 2 commands below:  \n                  runqemu-extract-sdk core-image-sato-sdk-qemux86.tar.bz2 qemux86_rootfs_image1  \n                  runqemu-extract-sdk core-image-sato-sdk-qemux86.tar.bz2 qemux86_rootfs_image2",
-                    "expected_results": "Both images build successfully."
-                },
-                "4": {
-                    "action": " From the 2 terminals, start qemu to boot up both two images \n    \ta. Run 2 commands below:  \n                  runqemu <kernel-name> core-image-sato-sdk-qemux86.qemuboot.conf qemux86_rootfs_image1  \n                  runqemu <kernel-name> core-image-sato-sdk-qemux86.qemuboot.conf qemux86_rootfs_image2 ",
-                    "expected_results": "Expect both qemu to boot up successfully."
-                }
-            },
-            "summary": "test_install_cross_toolchain_can_run_multiple_qemu_for_x86"
-        }
-    }
-]
\ No newline at end of file
-- 
2.7.4


