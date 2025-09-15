Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659B8CCA475
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:55:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.30886.1757937278971684233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Gl9X/FWx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HLDCe+nO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101994d3a6a04-268353cd-1c6a-49a1-b49d-fe7259bb4dd1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937298;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4MkvRb0+salTnHwXU5viuKQ4bvDKNe2BgHYt0H+dWXM=;
	b=Gl9X/FWx5m590/C24n+plpAdBt5ePoe84o5Quc05ZLLiM8qbFTtTiHOgbdUYxx4I
	zxu77hNNVAq3LItO/3AdJux1fFmM7xldO2P6pBRCDGD0/cUyKzBCYnZGzTBu5sLbw8D
	ilJwFqBHNa4BBfrWeODukgwMLMDtwKB0anMvvIg8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937298;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4MkvRb0+salTnHwXU5viuKQ4bvDKNe2BgHYt0H+dWXM=;
	b=HLDCe+nOWz7JuiPInGnNclNxvmln5sY79TUSYYYuUlNS4Hr0NOG2k3sfr2ahLoG4
	SfOaIwwBTbCZNd51CK4q6fd9b7YgJlbV57KoWRkELPrx6QDxtl0Yuk225v3DxLgjzcZ
	7f0MrIN3oGfnTgL4u2aIQfsYhMNxTFgtC2u4OtFM=
Content-Type: multipart/mixed; boundary="===============1538924514622476631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] utfcpp: upgrading to 4.0.7 FAILED
Message-ID: <010101994d3a6a04-268353cd-1c6a-49a1-b49d-fe7259bb4dd1-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223483

--===============1538924514622476631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.0.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-utfcpp-upgrade-4.0.6-4.0.7.patch
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
From 6b6a9578411947c05f415e8c6435175956e07a62 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 11:49:09 +0000
Subject: [PATCH] utfcpp: upgrade 4.0.6 -> 4.0.7

---
 .../recipes-support/utfcpp/{utfcpp_4.0.6.bb => utfcpp_4.0.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.0.6.bb => utfcpp_4.0.7.bb} (89%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb
similarity index 89%
rename from meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
rename to meta/recipes-support/utfcpp/utfcpp_4.0.7.bb
index 344f270158..f53eda303a 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.6.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 
 SRC_URI = "gitsm://github.com/nemtrif/utfcpp;protocol=https;branch=master"
 
-SRCREV = "b26a5f718f4f370af1852a0d5c6ae8fa031ba7d0"
+SRCREV = "cfea16a7347d1232f399781fdfb6917eb682b804"
 
 inherit cmake
 
-- 
2.47.1


--===============1538924514622476631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-4f621734aab1b6fc95e1a1b06c918c23c973663c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:4f621734aab1b6fc95e1a1b06c918c23c973663c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 111 Local 99 Mirrors 0 Missed 12 Current 241 (89% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 313 of 352 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running task 679 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_recipe_qa)
NOTE: recipe utfcpp-4.0.7-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 319 of 352 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe utfcpp-4.0.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 751 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_fetch)
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_fetch: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 330 of 352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_unpack)
NOTE: Running task 1004 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe utfcpp-4.0.7-r0: task do_unpack: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe utfcpp-4.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_patch)
NOTE: Running task 1034 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_collect_spdx_deps)
NOTE: recipe utfcpp-4.0.7-r0: task do_patch: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_patch: Succeeded
NOTE: recipe utfcpp-4.0.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1035 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1036 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_generate_toolchain_file)
NOTE: Running task 1037 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_populate_lic)
NOTE: recipe utfcpp-4.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_populate_lic: Started
WARNING: utfcpp-4.0.7-r0 do_populate_lic: Could not copy license file /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.7/sources/utfcpp-4.0.7/extern/ftest/LICENSE to /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.7/license-destdir/x86-64-v3/utfcpp/LICENSE.1: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.7/sources/utfcpp-4.0.7/extern/ftest/LICENSE'
NOTE: recipe utfcpp-4.0.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe utfcpp-4.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1038 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_configure)
NOTE: recipe utfcpp-4.0.7-r0: task do_configure: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1039 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_compile)
NOTE: recipe utfcpp-4.0.7-r0: task do_compile: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1040 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_install)
NOTE: recipe utfcpp-4.0.7-r0: task do_install: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_install: Succeeded
NOTE: Running task 1041 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_package)
NOTE: Running task 1042 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_populate_sysroot)
NOTE: recipe utfcpp-4.0.7-r0: task do_package: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe utfcpp-4.0.7-r0: task do_package: Succeeded
NOTE: Running task 1043 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_packagedata)
NOTE: recipe utfcpp-4.0.7-r0: task do_packagedata: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_packagedata: Succeeded
NOTE: Running task 1044 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_create_spdx)
NOTE: Running task 1045 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_package_write_ipk)
NOTE: Running task 1046 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_package_write_deb)
NOTE: Running task 1047 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_package_write_rpm)
NOTE: Running task 1048 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_package_qa)
NOTE: recipe utfcpp-4.0.7-r0: task do_create_spdx: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_package_write_ipk: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_package_write_deb: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_package_write_rpm: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_package_qa: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_create_spdx: Succeeded
NOTE: Running task 1049 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_create_package_spdx)
NOTE: recipe utfcpp-4.0.7-r0: task do_package_write_ipk: Succeeded
NOTE: recipe utfcpp-4.0.7-r0: task do_package_qa: Succeeded
NOTE: recipe utfcpp-4.0.7-r0: task do_create_package_spdx: Started
NOTE: recipe utfcpp-4.0.7-r0: task do_package_write_deb: Succeeded
NOTE: recipe utfcpp-4.0.7-r0: task do_create_package_spdx: Succeeded
NOTE: recipe utfcpp-4.0.7-r0: task do_populate_lic: Failed
NOTE: recipe utfcpp-4.0.7-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1049 tasks of which 1028 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915114853.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250915114853.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.7/temp/log.do_populate_lic.2854824
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: utfcpp-4.0.7-r0 do_populate_lic: QA Issue: utfcpp: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.7/sources/utfcpp-4.0.7/extern/ftest/LICENSE [license-checksum]
ERROR: utfcpp-4.0.7-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.7/temp/log.do_populate_lic.2854824
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.7.bb:do_populate_lic) failed with exit code '1'

--===============1538924514622476631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.0.6-4.0.7.patch"

RnJvbSA2YjZhOTU3ODQxMTk0N2MwNWY0MTVlOGM2NDM1MTc1OTU2ZTA3YTYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMTE6NDk6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGZjcHA6IHVwZ3JhZGUgNC4wLjYgLT4gNC4wLjcKCi0tLQogLi4uL3JlY2lwZXMtc3VwcG9ydC91
dGZjcHAve3V0ZmNwcF80LjAuNi5iYiA9PiB1dGZjcHBfNC4wLjcuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvdXRmY3BwL3t1dGZjcHBfNC4wLjYuYmIgPT4gdXRmY3BwXzQuMC43LmJifSAo
ODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4w
LjYuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMC43LmJiCnNpbWls
YXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91
dGZjcHBfNC4wLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZj
cHBfNC4wLjcuYmIKaW5kZXggMzQ0ZjI3MDE1OC4uZjUzZWRhMzAzYSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjAuNi5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMC43LmJiCkBAIC03LDcgKzcsNyBAQCBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1lNDIyNGNjYWVjYjE0ZDk0MmM3MWQzMWJl
ZjIwZDc4YyBcCiAKIFNSQ19VUkkgPSAiZ2l0c206Ly9naXRodWIuY29tL25lbXRyaWYvdXRmY3Bw
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiCiAKLVNSQ1JFViA9ICJiMjZhNWY3MThmNGYz
NzBhZjE4NTJhMGQ1YzZhZThmYTAzMWJhN2QwIgorU1JDUkVWID0gImNmZWExNmE3MzQ3ZDEyMzJm
Mzk5NzgxZmRmYjY5MTdlYjY4MmI4MDQiCiAKIGluaGVyaXQgY21ha2UKIAotLSAKMi40Ny4xCgo=

--===============1538924514622476631==--

