Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058D1CEDD81
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12106.1763224707847198131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FfG2yDdr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AKqyfTWA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019a88629c25-4d0e2248-45a2-4182-a829-9177a58b23da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O8agcYs6u+aXj1SOXtk7qalY5u3LtGpMkpTrlsr2pG0=;
	b=FfG2yDdrokxvZTOE7HwDGuBK9eEqiha0nYt08MYE+haw1XJapuPsYyQalNethvmU
	AIkKn04cTECOCBZUh3JaVt4OpM6UvT+tgNa/KP727+7x1Ofpx3fwsp1H+aQQd+azBS7
	bysolB9e6lML+X8lc691/JQsol1fkEsT6nivi2Rg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224755;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O8agcYs6u+aXj1SOXtk7qalY5u3LtGpMkpTrlsr2pG0=;
	b=AKqyfTWAg1STAiSR8E4zltpLjPV48Zfd8HRibKHzFlBngrBM4DaiAIDR23wx7IQT
	LytqJVTWJSDlbnSRKbocOczoeJul9hGaqn9m4/q2frXuRUZ63wWiwrJKMeJfa6q2Iza
	Vfw1yIP9KHA51naWN+j18KcBswvNEnYh9kTscmV0=
Content-Type: multipart/mixed; boundary="===============2309470668432687621=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] utfcpp: upgrading to 4.0.8 FAILED
Message-ID: <0101019a88629c25-4d0e2248-45a2-4182-a829-9177a58b23da-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226459

--===============2309470668432687621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.0.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-utfcpp-upgrade-4.0.6-4.0.8.patch
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
From 3dc97b13563a2ad8939aec0136f92ba82fdebee5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 16:38:23 +0000
Subject: [PATCH] utfcpp: upgrade 4.0.6 -> 4.0.8

---
 .../recipes-support/utfcpp/{utfcpp_4.0.6.bb => utfcpp_4.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.0.6.bb => utfcpp_4.0.8.bb} (89%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
similarity index 89%
rename from meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
index 344f270158..e1a0c46e3d 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 
 SRC_URI = "gitsm://github.com/nemtrif/utfcpp;protocol=https;branch=master"
 
-SRCREV = "b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0"
+SRCREV = "f9319195dfddf369f68f18e7c0039b3f351797fd"
 
 inherit cmake
 
-- 
2.47.1


--===============2309470668432687621==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.0.6-4.0.8.patch"

RnJvbSAzZGM5N2IxMzU2M2EyYWQ4OTM5YWVjMDEzNmY5MmJhODJmZGViZWU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTY6Mzg6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGZjcHA6IHVwZ3JhZGUgNC4wLjYgLT4gNC4wLjgKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC91
dGZjcHAve3V0ZmNwcF80LjAuNi5iYiA9PiB1dGZjcHBfNC4wLjguYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdXRmY3BwL3t1dGZjcHBfNC4wLjYuYmIgPT4gdXRmY3BwXzQuMC44LmJifSAo
ODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4w
LjYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMC44LmJiCnNpbWls
YXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91
dGZjcHBfNC4wLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZj
cHBfNC4wLjguYmIKaW5kZXggMzQ0ZjI3MDE1OC4uZTFhMGM0NmUzZCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjAuNi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMC44LmJiCkBAIC03LDcgKzcsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1lNDIyNGNjYWVjYjE0ZDk0MmM3MWQzMWJl
ZjIwZDc4YyBcCiAKIFNSQ19VUkkgPSAiZ2l0c206Ly9naXRodWIuY29tL25lbXRyaWYvdXRmY3Bw
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCiAKLVNSQ1JFViA9ICJiMjZhNWY3MThmNGYz
NzBhZjE4NTJhMGQ1YzZhZThmYTAzMWJhN2QwIgorU1JDUkVWID0gImY5MzE5MTk1ZGZkZGYzNjlm
NjhmMThlN2MwMDM5YjNmMzUxNzk3ZmQiCiAKIGluaGVyaXQgY21ha2UKIAotLSAKMi40Ny4xCgo=

--===============2309470668432687621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1944 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9b9dde1d4994c2020e58576f842b4654c521ea1f"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:9b9dde1d4994c2020e58576f842b4654c521ea1f"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 106 Local 96 Mirrors 0 Missed 10 Current 246 (90% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 312 of 352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 315 of 352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe utfcpp-4.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 318 of 352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 320 of 352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe utfcpp-4.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 751 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_fetch)
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 331 of 352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe utfcpp-4.0.8-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe utfcpp-4.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1031 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_unpack)
NOTE: Running task 1032 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe utfcpp-4.0.8-r0: task do_unpack: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_patch)
NOTE: Running task 1034 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_collect_spdx_deps)
NOTE: recipe utfcpp-4.0.8-r0: task do_patch: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1036 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_generate_toolchain_file)
NOTE: Running task 1037 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_populate_lic)
NOTE: recipe utfcpp-4.0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_populate_lic: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_generate_toolchain_file: Started
WARNING: utfcpp-4.0.8-r0 do_populate_lic: Could not copy license file /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/sources/utfcpp-4.0.8/extern/ftest/LICENSE to /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/license-destdir/x86-64-v3/utfcpp/LICENSE.1: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/sources/utfcpp-4.0.8/extern/ftest/LICENSE'
NOTE: recipe utfcpp-4.0.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1038 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_configure)
NOTE: recipe utfcpp-4.0.8-r0: task do_configure: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1039 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_compile)
NOTE: recipe utfcpp-4.0.8-r0: task do_compile: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1040 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_install)
NOTE: recipe utfcpp-4.0.8-r0: task do_install: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_install: Succeeded
NOTE: Running task 1041 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package)
NOTE: Running task 1042 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_populate_sysroot)
NOTE: recipe utfcpp-4.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_populate_sysroot unihash changed to 1201afbcd96f0d3588131bed02cd4644288a5c54f48012d6f81b99db2e831f55
NOTE: Setscene tasks completed
NOTE: recipe utfcpp-4.0.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package unihash changed to b7c02834e03e38d0b3210ff22f9412cb250ea083dbdcb28cc9dcc4c6c5ef752f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_write_ipk became valid
NOTE: Running setscene task 346 of 352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 347 of 352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 350 of 352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_qa_setscene)
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_qa_setscene: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 352 of 352 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_packagedata_setscene)
NOTE: recipe utfcpp-4.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1044 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_create_spdx)
NOTE: Running task 1047 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_write_rpm)
NOTE: recipe utfcpp-4.0.8-r0: task do_create_spdx: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 1049 of 1050 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_create_package_spdx)
NOTE: recipe utfcpp-4.0.8-r0: task do_create_package_spdx: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_write_rpm unihash changed to b8eaaf80bd24c87e1bfc94521940795164438b97be72621d350cb45601d8ba17
NOTE: recipe utfcpp-4.0.8-r0: task do_create_package_spdx: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_populate_lic: Failed
NOTE: Tasks Summary: Attempted 1049 tasks of which 1034 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115163809.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115163809.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/temp/log.do_populate_lic.2263927
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: utfcpp-4.0.8-r0 do_populate_lic: QA Issue: utfcpp: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/sources/utfcpp-4.0.8/extern/ftest/LICENSE [license-checksum]
ERROR: utfcpp-4.0.8-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/temp/log.do_populate_lic.2263927
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_populate_lic) failed with exit code '1'

--===============2309470668432687621==--

