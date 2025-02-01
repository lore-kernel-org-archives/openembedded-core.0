Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAEAC02197
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.42628.1738416048431017767
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NVl0Cf+G;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=LmMulnSd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194c1abc59c-e3a9cf9e-64e3-432b-b533-d193fe4bfc52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n7wtqv9C7uVGvzQxijUuGy12IGLsk2vFGnVS3LUSzis=;
	b=NVl0Cf+GUPWiDGEyJukGAbngBZYO01BXDhoRGMzOkhoV48+2x3hP5H1TlTuepPRq
	wPzAhDe9OxMZbywLsYzl0Zfq8J2RpK1tE+L3hw47FlnRXKIdICDd3ilSPOeU+y0FgTu
	jDkl6gqlAFh1SRrvhudl8GyLhd/RK4zQW9bMTUgE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n7wtqv9C7uVGvzQxijUuGy12IGLsk2vFGnVS3LUSzis=;
	b=LmMulnSdebntz2a6HhT5vA9mkEqei0Op4O01OIeE5d4yKwaYwKxwttrZEWcdW2u7
	hOUW/qn5WDXLFWVIiW9Z750M2EkbHA79AHQMyt0B6LQ/RziPoUyK9Y1Acy2R6nRk23m
	2DAulIfYMOh+kS9DYkOYeFDXGTKpWtTkzu5WcnAs=
Content-Type: multipart/mixed; boundary="===============5047387624427580115=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Enrico_J=C3=B6rns_=3Cyocto=40pengutronix=2Ede=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] barebox-tools: upgrading to 2025.01.0 FAILED
Message-ID: <01010194c1abc59c-e3a9cf9e-64e3-432b-b533-d193fe4bfc52-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210521

--===============5047387624427580115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2025.01.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-barebox-tools-upgrade-2024.12.0-2025.01.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 194b829abb6b7397d59637a6286cc6839a24a1c4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 06:40:41 +0000
Subject: [PATCH] barebox-tools: upgrade 2024.12.0 -> 2025.01.0

---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index fce3b825ae..9b8dc4ea60 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2024.12.0"
+PV = "2025.01.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "717a2416b37942f584b0bb2eb61ccbf85dc0f1a5c841318f47cd6967b9c4dcab"
+SRC_URI[sha256sum] = "288a838e6fe8897ea46dabd112e42287177353c88a7d442cefc8be8d1a85f5b5"
-- 
2.44.1


--===============5047387624427580115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dbg: PKGSIZE changed from 70296 to 70696 (+1%)
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-dev: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-doc: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-locale: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-src: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools-staticdev: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools/barebox-tools: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]
packages/core2-64-poky-linux/barebox-tools: PV changed from "2024.12.0" to "2025.01.0"
packages/core2-64-poky-linux/barebox-tools: SRC_URI changed from "https://barebox.org/download/barebox-2024.12.0.tar.bz2" to "https://barebox.org/download/barebox-2025.01.0.tar.bz2"
packages/core2-64-poky-linux/barebox-tools: PKGV changed from 2024.12.0 [default] to 2025.01.0 [default]

--===============5047387624427580115==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-barebox-tools-upgrade-2024.12.0-2025.01.0.patch"

RnJvbSAxOTRiODI5YWJiNmI3Mzk3ZDU5NjM3YTYyODZjYzY4MzlhMjRhMWM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNjo0MDo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGJh
cmVib3gtdG9vbHM6IHVwZ3JhZGUgMjAyNC4xMi4wIC0+IDIwMjUuMDEuMAoKLS0tCiBtZXRhL3Jl
Y2lwZXMtYnNwL2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jIHwgNCArKy0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMgYi9tZXRhL3JlY2lwZXMtYnNw
L2JhcmVib3gvYmFyZWJveC1jb21tb24uaW5jCmluZGV4IGZjZTNiODI1YWUuLjliOGRjNGVhNjAg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3AvYmFyZWJveC9iYXJlYm94LWNvbW1vbi5pbmMK
KysrIGIvbWV0YS9yZWNpcGVzLWJzcC9iYXJlYm94L2JhcmVib3gtY29tbW9uLmluYwpAQCAtMyw2
ICszLDYgQEAgU0VDVElPTiA9ICJib290bG9hZGVycyIKIAogTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vQ09QWUlORzttZDU9ZjUxMjVkMTNlMDAwYjljYTFmMGQzMzY0Mjg2YzQxOTIiCiAKLVBW
ID0gIjIwMjQuMTIuMCIKK1BWID0gIjIwMjUuMDEuMCIKIFNSQ19VUkkgPSAiaHR0cHM6Ly9iYXJl
Ym94Lm9yZy9kb3dubG9hZC9iYXJlYm94LSR7UFZ9LnRhci5iejIiCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNzE3YTI0MTZiMzc5NDJmNTg0YjBiYjJlYjYxY2NiZjg1ZGMwZjFhNWM4NDEzMThmNDdj
ZDY5NjdiOWM0ZGNhYiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyODhhODM4ZTZmZTg4OTdlYTQ2
ZGFiZDExMmU0MjI4NzE3NzM1M2M4OGE3ZDQ0MmNlZmM4YmU4ZDFhODVmNWI1IgotLSAKMi40NC4x
Cgo=

--===============5047387624427580115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1875 targets, 52 skipped, 0 masked, 0 errors.
Removing 53 recipes from the core2-64 sysroot...done.
Removing 53 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a1f0e95296f084c639709b1cb009de8b84448a13"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 231 Local 222 Mirrors 0 Missed 9 Current 243 (96% match, 98% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 267 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_populate_lic_setscene)
NOTE: Running setscene task 318 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_create_spdx_setscene)
NOTE: Running setscene task 327 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libusb1-1.0.27-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 328 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 329 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 347 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_recipe_qa_setscene)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 954 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 353 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libusb/libusb1_1.0.27.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 354 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_fetch: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_fetch: Succeeded
NOTE: Running task 955 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.27-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-33-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 380 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_33.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-33-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 392 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 400 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 406 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.47.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.47.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 419 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.47.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 437 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 442 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 444 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 446 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 447 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 449 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 450 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 459 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 461 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_unpack: Succeeded
NOTE: Running task 1081 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe barebox-tools-2025.01.0-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 465 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 466 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 470 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 473 of 474 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1322 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1352 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_collect_spdx_deps)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe barebox-tools-2025.01.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1353 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_configure)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_configure: Started
NOTE: recipe barebox-tools-2025.01.0-r0: task do_configure: Succeeded
NOTE: Running task 1354 of 1365 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_compile)
NOTE: recipe barebox-tools-2025.01.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 ARCH=sandbox CROSS_COMPILE=x86_64-poky-linux-musl- -C /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0 O=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/build CROSS_PKG_CONFIG=pkg-config CC=x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/recipe-sysroot LD=x86_64-poky-linux-musl-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/recipe-sysroot   targettools_defconfig
| make: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0'
|   GEN     Makefile
|   HOSTCC  scripts/basic/fixdep
|   HOSTCC  scripts/kconfig/conf.o
|   HOSTCC  scripts/kconfig/confdata.o
|   HOSTCC  scripts/kconfig/expr.o
|   LEX     scripts/kconfig/lexer.lex.c
|   YACC    scripts/kconfig/parser.tab.[ch]
|   HOSTCC  scripts/kconfig/menu.o
|   HOSTCC  scripts/kconfig/preprocess.o
|   HOSTCC  scripts/kconfig/symbol.o
|   HOSTCC  scripts/kconfig/util.o
|   HOSTCC  scripts/kconfig/lexer.lex.o
|   HOSTCC  scripts/kconfig/parser.tab.o
|   HOSTLD  scripts/kconfig/conf
| #
| # configuration written to .config
| #
| make: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0'
| NOTE: make -j 16 -l 75 ARCH=sandbox CROSS_COMPILE=x86_64-poky-linux-musl- -C /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0 O=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/build CROSS_PKG_CONFIG=pkg-config CC=x86_64-poky-linux-musl-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/recipe-sysroot LD=x86_64-poky-linux-musl-ld --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/recipe-sysroot   scripts
| make: Entering directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0'
|   UPD     include/generated/utsrelease.h
|   HOSTCC  scripts/bin2c
|   HOSTCC  scripts/fix_size
|   HOSTCC  scripts/bareboxenv
|   HOSTCC  scripts/bareboxcrc32
|   HOSTCC  scripts/kernel-install
|   HOSTCC  scripts/bareboximd
|   HOSTCC  scripts/dtc/dtc.o
|   CC [U]  scripts/bareboxenv-target
|   CC [U]  scripts/imx/imx-usb-loader-target.o
|   HOSTCC  scripts/dtc/flattree.o
|   CC [U]  scripts/kernel-install-target
|   CC [U]  scripts/imx/imx-target.o
|   HOSTCC  scripts/dtc/fstree.o
|   CC [U]  scripts/bareboxcrc32-target
|   CC      scripts/mod/empty.o
|   CC [U]  scripts/bareboximd-target
|   HOSTCC  scripts/mod/mk_elfconfig
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/bareboximd.c:18,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/bareboximd-target.c:1:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.h:9:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|     9 | int pread_full(int fd, void *buf, size_t size, loff_t offset);
|       |                                                ^~~~~~
|       |                                                off_t
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/imx-usb-loader.c:36,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/imx-usb-loader-target.c:1:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.h:9:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|     9 | int pread_full(int fd, void *buf, size_t size, loff_t offset);
|       |                                                ^~~~~~
|       |                                                off_t
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/bareboximd.c:19:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c: In function 'read_fd':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c:132:15: error: implicit declaration of function 'pread_full'; did you mean 'read_full'? [-Wimplicit-function-declaration]
|   132 |         ret = pread_full(fd, buf, st.st_size, 0);
|       |               ^~~~~~~~~~
|       |               read_full
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/common.c:200:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|   200 | int pread_full(int fd, void *buf, size_t size, loff_t offset)
|       |                                                ^~~~~~
|       |                                                off_t
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/imx-usb-loader.c:40:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.c: In function 'read_fd':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.c:132:15: error: implicit declaration of function 'pread_full'; did you mean 'read_full'? [-Wimplicit-function-declaration]
|   132 |         ret = pread_full(fd, buf, st.st_size, 0);
|       |               ^~~~~~~~~~
|       |               read_full
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.c: At top level:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/imx/../common.c:200:48: error: unknown type name 'loff_t'; did you mean 'off_t'?
|   200 | int pread_full(int fd, void *buf, size_t size, loff_t offset)
|       |                                                ^~~~~~
|       |                                                off_t
| make[2]: *** [scripts/Makefile.userprogs:28: scripts/bareboximd-target] Error 1
| make[2]: *** Waiting for unfinished jobs....
|   HOSTCC  scripts/dtc/data.o
|   HOSTCC  scripts/dtc/livetree.o
| make[3]: *** [scripts/Makefile.userprogs:43: scripts/imx/imx-usb-loader-target.o] Error 1
| make[3]: *** Waiting for unfinished jobs....
|   HOSTCC  scripts/dtc/treesource.o
|   HOSTCC  scripts/dtc/srcpos.o
|   HOSTCC  scripts/dtc/checks.o
|   MKELF   scripts/mod/elfconfig.h
|   HOSTCC  scripts/mod/modpost.o
|   HOSTCC  scripts/dtc/util.o
|   HOSTCC  scripts/mod/sumversion.o
|   LEX     scripts/dtc/dtc-lexer.lex.c
|   YACC    scripts/dtc/dtc-parser.tab.[ch]
|   HOSTCC  scripts/dtc/fdtget.o
|   HOSTCC  scripts/dtc/libfdt/fdt.o
|   HOSTCC  scripts/dtc/libfdt/fdt_ro.o
| make[2]: *** [/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/scripts/Makefile.build:282: scripts/imx] Error 2
|   HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
|   HOSTCC  scripts/dtc/libfdt/fdt_wip.o
|   HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
|   HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
|   HOSTCC  scripts/dtc/libfdt/fdt_rw.o
|   HOSTCC  scripts/dtc/libfdt/fdt_sw.o
|   HOSTCC  scripts/dtc/dtc-lexer.lex.o
|   HOSTCC  scripts/dtc/dtc-parser.tab.o
|   HOSTLD  scripts/dtc/fdtget
|   HOSTLD  scripts/mod/modpost
|   HOSTLD  scripts/dtc/dtc
| make[1]: *** [/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0/Makefile:1036: scripts] Error 2
| make: *** [Makefile:185: sub-make] Error 2
| make: Leaving directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/barebox-2025.01.0'
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.1789354:169 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.1789354, line 169
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.1789354, line 153
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.1789354, line 148
| 	#4: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.1789354, line 143
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.1789354, line 182
NOTE: recipe barebox-tools-2025.01.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1354 tasks of which 1347 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201064023.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250201064023.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/log.do_compile.1789354
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: barebox-tools-2025.01.0-r0 do_compile: oe_runmake failed
ERROR: barebox-tools-2025.01.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/run.do_compile.1789354' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/barebox-tools/2025.01.0/temp/log.do_compile.1789354
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/barebox/barebox-tools.bb:do_compile) failed with exit code '1'

--===============5047387624427580115==--

