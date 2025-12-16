Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0FAD5E390
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17195.1765872154046813139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ngVoMK27;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=TfKFpXrV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019b262ed233-ae5286a6-1329-46fa-a729-10578c19c4fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9wCydMiaOtE8TO8x1NOoMiDClsiJg5yQ9dM2IzV2CzI=;
	b=ngVoMK27FWpaqWFQI+fjaxZ/GFKkNwbK+SREw0PQtKoPvxEixwIwzswtYTYry2+8
	PQlGloKTFYp+qVOkSxE/JWyz3rh8C7Y1wiRNNsdKIvQeODgVwt47428MglqyJEbvHQd
	sl2jwJGwsL3cTr0DlSb00z/qXXEw+3xsd5pA0Pg0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872161;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9wCydMiaOtE8TO8x1NOoMiDClsiJg5yQ9dM2IzV2CzI=;
	b=TfKFpXrVosQQdFH1OxOzyQO2jYcel0RRRy0VkpLJ/LpL0k25piOr8owXVeCiE5Ck
	W75ggl5Qz6y2R6ylcxnfjdyVgCFDq3AhSROuEGz3So221HCTbsPbgoZ2jcdcc3FujoN
	6xCYAW2i/PHgRBh2l7Tv0HhYJSJmk2td4/Q0rYs4=
Content-Type: multipart/mixed; boundary="===============3977656930581090538=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vulkan-volk: upgrading to 1.4.335.0 SUCCEEDED
Message-ID: <0101019b262ed233-ae5286a6-1329-46fa-a729-10578c19c4fd-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227877

--===============3977656930581090538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.4.335.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.4.328.1-1.4.335.0.patch
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
From 3413ca3ac039ad4444f0c2258b965ad4fa14d3f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:13:45 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.4.328.1 -> 1.4.335.0

---
 .../{vulkan-volk_1.4.328.1.bb => vulkan-volk_1.4.335.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.328.1.bb => vulkan-volk_1.4.335.0.bb} (88%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb
similarity index 88%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb
index a6b4b27355..b60a29b3d2 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.328.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 
-SRC_URI = "git://github.com/zeux/volk.git;branch=vulkan-sdk-1.4.328;protocol=https"
-SRCREV = "f30088b3f4160810b53e19258dd2f7395e5f0ba3"
+SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
+SRCREV = "4f3bcee79618a9abe79f4c717c50379197c77512"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============3977656930581090538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 450678 to 500843 (+11%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 442565 to 492730 (+11%)

--===============3977656930581090538==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.4.328.1-1.4.335.0.patch"

RnJvbSAzNDEzY2EzYWMwMzlhZDQ0NDRmMGMyMjU4Yjk2NWFkNGZhMTRkM2Y5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6MTM6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdm9sazogdXBncmFkZSAxLjQuMzI4LjEgLT4gMS40LjMzNS4wCgotLS0KIC4uLi97dnVs
a2FuLXZvbGtfMS40LjMyOC4xLmJiID0+IHZ1bGthbi12b2xrXzEuNC4zMzUuMC5iYn0gICAgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZvbGtfMS40LjMyOC4x
LmJiID0+IHZ1bGthbi12b2xrXzEuNC4zMzUuMC5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuNC4zMjguMS5iYiBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS40LjMzNS4wLmJiCnNpbWlsYXJp
dHkgaW5kZXggODglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXZvbGtfMS40LjMyOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi12b2xrXzEuNC4zMzUuMC5iYgppbmRleCBhNmI0YjI3MzU1Li5iNjBhMjliM2Qy
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEu
NC4zMjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xr
XzEuNC4zMzUuMC5iYgpAQCAtOSw4ICs5LDggQEAgU0VDVElPTiA9ICJsaWJzIgogTElDRU5TRSA9
ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1mYjNkNmU4
MDUxYTcxZWRjYTFlNTRiYzM4ZDM1ZTVhZiIKIAotU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L3pldXgvdm9say5naXQ7YnJhbmNoPXZ1bGthbi1zZGstMS40LjMyODtwcm90b2NvbD1odHRwcyIK
LVNSQ1JFViA9ICJmMzAwODhiM2Y0MTYwODEwYjUzZTE5MjU4ZGQyZjczOTVlNWYwYmEzIgorU1JD
X1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3pldXgvdm9say5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90
b2NvbD1odHRwcyIKK1NSQ1JFViA9ICI0ZjNiY2VlNzk2MThhOWFiZTc5ZjRjNzE3YzUwMzc5MTk3
Yzc3NTEyIgogCiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAidnVsa2FuIgogCi0tIAoyLjQ3
LjEKCg==

--===============3977656930581090538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-volk: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/vulkan-volk: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk: SRC_URI changed from "git://github.com/zeux/volk.git;branch=vulkan-sdk-1.4.328;protocol=https" to "git://github.com/zeux/volk.git;branch=master;protocol=https"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 450678 to 500843 (+11%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 442565 to 492730 (+11%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: FILELIST: directory renamed /usr/src/debug/vulkan-volk/1.4.328.1 -> /usr/src/debug/vulkan-volk/1.4.335.0
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 739664 to 774770 (+5%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.4.328.1" to "1.4.335.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.4.328.1 [default] to 1.4.335.0 [default]

--===============3977656930581090538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-e80eb9eef1ac300602ac042dde54359692774354"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:e80eb9eef1ac300602ac042dde54359692774354"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 115 Local 106 Mirrors 0 Missed 9 Current 195 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 259 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 263 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 264 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 265 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 267 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 782 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 269 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-headers/1.4.328.1/temp/log.do_packagedata_setscene.2681338
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 270 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_package_setscene)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_fetch: Succeeded
NOTE: Running task 783 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_unpack)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_unpack: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_unpack: Succeeded
NOTE: Running task 784 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_patch)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_package_setscene: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_patch: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_patch: Succeeded
NOTE: Running task 786 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 275 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 278 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 282 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 287 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 290 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 292 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 299 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 300 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 308 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 310 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 898 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata)
NOTE: Running task 899 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata: Succeeded
NOTE: Running task 912 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 913 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_configure)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_configure: Succeeded
NOTE: Running task 914 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_compile)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_compile: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_compile: Succeeded
NOTE: Running task 915 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_install)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_install: Succeeded
NOTE: Running task 916 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package)
NOTE: Running task 917 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_populate_sysroot unihash changed to baa3ab91c3fc479aab20e20f148bb95a69461367731c2dec0caa56adbf2be6a3
NOTE: Setscene tasks completed
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package unihash changed to afe506ca66c9403b373a32d47ecd66ae3d22f722d559224e8488d2269a79aa29
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_packagedata became valid
NOTE: Running setscene task 305 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 307 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package_write_deb_setscene)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 310 of 310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 919 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_create_spdx)
NOTE: Running task 923 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package_qa)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_create_spdx: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package_qa: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 924 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_create_package_spdx)
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_package_qa unihash changed to 8163874e8c55464684b471c1706da8c8efb857830bce3a109c0ed9b2a6e760ad
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_create_package_spdx: Started
NOTE: recipe vulkan-volk-1.4.335.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 925 of 925 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.335.0.bb:do_build)
NOTE: Tasks Summary: Attempted 925 tasks of which 909 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.4.335.0-r0 to 0:1.4.328.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.4.335.0-r0 to 0:1.4.328.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.4.335.0-r0 to 0:1.4.328.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.4.335.0-r0 to 0:1.4.328.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.4.335.0-r0 to 0:1.4.328.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.4.335.0-r0 to 0:1.4.328.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.328.1-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.4.335.0-r0 to 0:1.4.328.1-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.328.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3977656930581090538==--

