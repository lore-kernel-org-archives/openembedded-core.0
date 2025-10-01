Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51681CCD18A
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:47 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.17936.1759325535033520858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZBBRYrPr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=E9RxjRnE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101999ff99013-bd00e55c-82ca-40d8-b3bd-e21564dbf08f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0CJ92U/QHe9WFgqHrdTeyp2bifbGq/yGaRQWl76bk8s=;
	b=ZBBRYrPrnGefoxhZ9nRYXSQIZRDjZmDWo1OvW6Nwf4vINshKv+SY6VlMkJqdqCCV
	3CK01Axe/0xlsmI1c/fiFnEZgSl24H5DpWpUEeC9CZRv4owcHSli7Pjy9Z9gCoeR2KM
	ZATE45mMoLThWSUOxgWNc9YDc6aiqTdpNs9Y9YDI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325556;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0CJ92U/QHe9WFgqHrdTeyp2bifbGq/yGaRQWl76bk8s=;
	b=E9RxjRnE20/WyCjOUWWHyAO+lFzjMQnU2l4DV+UnU2neaKQGcYgOuhLdnVkWILbZ
	ZSJhdUVoJ5jyOiWD0uTlQg1P9z4hWrD3py5EhH3j+h2jWvez+0N8ODQBLk3Xuy5/Slp
	SW7zBcRgpKsudBTQgqW4rDbm+JJ0CP/eepmSZZDY=
Content-Type: multipart/mixed; boundary="===============3367768560871397806=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] utfcpp: upgrading to 4.0.8 FAILED
Message-ID: <010101999ff99013-bd00e55c-82ca-40d8-b3bd-e21564dbf08f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:36 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224301

--===============3367768560871397806==
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
From 0a2319c013c8ebffb6e9929c8faf1bd97ecedb37 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 13:26:32 +0000
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


--===============3367768560871397806==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.0.6-4.0.8.patch"

RnJvbSAwYTIzMTljMDEzYzhlYmZmYjZlOTkyOWM4ZmFmMWJkOTdlY2VkYjM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMzoyNjozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
ZmNwcDogdXBncmFkZSA0LjAuNiAtPiA0LjAuOAoKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L3V0
ZmNwcC97dXRmY3BwXzQuMC42LmJiID0+IHV0ZmNwcF80LjAuOC5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC91dGZjcHAve3V0ZmNwcF80LjAuNi5iYiA9PiB1dGZjcHBfNC4wLjguYmJ9ICg4
OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjAu
Ni5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4wLjguYmIKc2ltaWxh
cml0eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0
ZmNwcF80LjAuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNw
cF80LjAuOC5iYgppbmRleCAzNDRmMjcwMTU4Li5lMWEwYzQ2ZTNkIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMC42LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNC4wLjguYmIKQEAgLTcsNyArNyw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWU0MjI0Y2NhZWNiMTRkOTQyYzcxZDMxYmVm
MjBkNzhjIFwKIAogU1JDX1VSSSA9ICJnaXRzbTovL2dpdGh1Yi5jb20vbmVtdHJpZi91dGZjcHA7
cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciIKIAotU1JDUkVWID0gImIyNmE1ZjcxOGY0ZjM3
MGFmMTg1MmEwZDVjNmFlOGZhMDMxYmE3ZDAiCitTUkNSRVYgPSAiZjkzMTkxOTVkZmRkZjM2OWY2
OGYxOGU3YzAwMzliM2YzNTE3OTdmZCIKIAogaW5oZXJpdCBjbWFrZQogCi0tIAoyLjQ3LjEKCg==

--===============3367768560871397806==
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
DISTRO_VERSION       = "5.2.99+snapshot-a16101f79506de36e74d51c275d12a7dd8a7ba85"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:a16101f79506de36e74d51c275d12a7dd8a7ba85"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 106 Local 94 Mirrors 0 Missed 12 Current 246 (88% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 314 of 352 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running task 679 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_recipe_qa)
NOTE: recipe utfcpp-4.0.8-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 319 of 352 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.42+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 352 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: recipe utfcpp-4.0.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 977 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_fetch)
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_fetch: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe utfcpp-4.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 1031 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_unpack)
NOTE: Running task 1032 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe utfcpp-4.0.8-r0: task do_unpack: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_patch)
NOTE: Running task 1034 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_collect_spdx_deps)
NOTE: recipe utfcpp-4.0.8-r0: task do_patch: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1035 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1036 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_generate_toolchain_file)
NOTE: Running task 1037 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_populate_lic)
NOTE: recipe utfcpp-4.0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_populate_lic: Started
WARNING: utfcpp-4.0.8-r0 do_populate_lic: Could not copy license file /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/sources/utfcpp-4.0.8/extern/ftest/LICENSE to /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/license-destdir/x86-64-v3/utfcpp/LICENSE.1: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/sources/utfcpp-4.0.8/extern/ftest/LICENSE'
NOTE: recipe utfcpp-4.0.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1038 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_configure)
NOTE: recipe utfcpp-4.0.8-r0: task do_configure: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1039 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_compile)
NOTE: recipe utfcpp-4.0.8-r0: task do_compile: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1040 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_install)
NOTE: recipe utfcpp-4.0.8-r0: task do_install: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_install: Succeeded
NOTE: Running task 1041 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package)
NOTE: Running task 1042 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_populate_sysroot)
NOTE: recipe utfcpp-4.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_package: Succeeded
NOTE: Running task 1043 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_packagedata)
NOTE: recipe utfcpp-4.0.8-r0: task do_packagedata: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1044 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_create_spdx)
NOTE: Running task 1045 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_write_ipk)
NOTE: Running task 1046 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_write_deb)
NOTE: Running task 1047 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_write_rpm)
NOTE: Running task 1048 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_package_qa)
NOTE: recipe utfcpp-4.0.8-r0: task do_create_spdx: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_ipk: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_deb: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_rpm: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_qa: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_qa: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 1049 of 1050 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_create_package_spdx)
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_ipk: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_deb: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_create_package_spdx: Started
NOTE: recipe utfcpp-4.0.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_create_package_spdx: Succeeded
NOTE: recipe utfcpp-4.0.8-r0: task do_populate_lic: Failed
NOTE: Tasks Summary: Attempted 1049 tasks of which 1028 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001132618.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001132618.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_populate_lic
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/temp/log.do_populate_lic.691780
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: utfcpp-4.0.8-r0 do_populate_lic: QA Issue: utfcpp: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/sources/utfcpp-4.0.8/extern/ftest/LICENSE [license-checksum]
ERROR: utfcpp-4.0.8-r0 do_populate_lic: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/utfcpp/4.0.8/temp/log.do_populate_lic.691780
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb:do_populate_lic) failed with exit code '1'

--===============3367768560871397806==--

