Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ED7CA0EFC
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.88817.1754057284012420384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AdmOpvMj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hMFYCOqL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019865f616e9-5a465b1e-7033-462d-a6a2-6f3f9ce56259-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057283;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nXWaMVhEi3TKCMBRvxdyhJUKDRfMU0oPqoRaBJRUh6I=;
	b=AdmOpvMjdpSgxMUa2MaRidofalexp40q7Zg3MMZz/lVgWUvmW/RXFXfoTkxq2cTr
	8S3YCPK7EJQEv2Q2KZXCV5NbbN7F1QOc4h+6rZ5FPuA1VSISR8S+BOLn+JykghycUyX
	b7ap1RrSWJ7eMTr/IE/fkGAWHBemgFmJN48oOsM0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057283;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nXWaMVhEi3TKCMBRvxdyhJUKDRfMU0oPqoRaBJRUh6I=;
	b=hMFYCOqLDwaE0O+wXfk4L0H0h/HnoM1N3i76mcU9ZwAup5kLj/EDr0QPW2kxJmS9
	wg/mFZtnBeKsnz9L3JIhqOZJ8Asjfj2YD1RiNMSsKRx6Q5BS5mNKuiVsPZO5UXgLOn6
	lVgQCZAEzhJFw7iw2fxKxEO/H1y1Nn6sZUObgBE4=
Content-Type: multipart/mixed; boundary="===============8173533914227761309=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.4.321.0 FAILED
Message-ID: <0101019865f616e9-5a465b1e-7033-462d-a6a2-6f3f9ce56259-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:08:03 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221314

--===============8173533914227761309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *spirv-tools* to *1.4.321.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.4.313.0-1.4.321.0.patch
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
From bd248ffa8d411c34ca8669b7335ff5aa2c809f11 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 11:46:04 +0000
Subject: [PATCH] spirv-tools: upgrade 1.4.313.0 -> 1.4.321.0

---
 .../spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} (97%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
index 4594a1a942..319b25b7f4 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "a62abcb402009b9ca5975e6167c09f237f630e0e"
+SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            "
 PE = "1"
-- 
2.47.1


--===============8173533914227761309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1935 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (941 cached, 1 parsed). 1933 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-68d1ef609a2546b7421c078a227ec5e83e22f748"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:68d1ef609a2546b7421c078a227ec5e83e22f748"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 200 Local 188 Mirrors 0 Missed 12 Current 308 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 397 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 435 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 455 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1038 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.4.313.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 468 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_fetch: Succeeded
NOTE: Running task 1065 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_unpack)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 487 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 500 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_unpack: Succeeded
NOTE: Running task 1169 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_patch)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_patch: Succeeded
NOTE: Running task 1170 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1171 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_generate_toolchain_file)
NOTE: Running task 1172 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_lic)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_lic unihash changed to bdebaabc9f05f00afea6c48df0440124328c88c80ab6720638e733e939fa7034
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1372 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1458 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1468 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1480 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_compile)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| ninja: error: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/recipe-sysroot/usr/include/spirv/unified1/extinst.tosa.001000.1.grammar.json', needed by 'core_tables_body.inc', missing and no known rule to make it
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/temp/run.do_compile.2866498:154 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/temp/run.do_compile.2866498, line 154
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/temp/run.do_compile.2866498, line 148
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/temp/run.do_compile.2866498, line 143
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/temp/run.do_compile.2866498, line 167
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1469 tasks of which 1459 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801114550.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801114550.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/temp/log.do_compile.2866498
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: spirv-tools-1_1.4.321.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/temp/run.do_compile.2866498' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/spirv-tools/1.4.321.0/temp/log.do_compile.2866498
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_compile) failed with exit code '1'

--===============8173533914227761309==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.4.313.0-1.4.321.0.patch"

RnJvbSBiZDI0OGZmYThkNDExYzM0Y2E4NjY5YjczMzVmZjVhYTJjODA5ZjExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAxMTo0NjowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNw
aXJ2LXRvb2xzOiB1cGdyYWRlIDEuNC4zMTMuMCAtPiAxLjQuMzIxLjAKCi0tLQogLi4uL3NwaXIv
e3NwaXJ2LXRvb2xzXzEuNC4zMTMuMC5iYiA9PiBzcGlydi10b29sc18xLjQuMzIxLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIve3NwaXJ2LXRvb2xzXzEuNC4zMTMuMC5iYiA9
PiBzcGlydi10b29sc18xLjQuMzIxLjAuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS40LjMxMy4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS40LjMyMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEu
NC4zMTMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9v
bHNfMS40LjMyMS4wLmJiCmluZGV4IDQ1OTRhMWE5NDIuLjMxOWIyNWI3ZjQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2LXRvb2xzXzEuNC4zMTMuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29sc18xLjQuMzIxLjAuYmIKQEAg
LTcsNyArNyw3IEBAIFNFQ1RJT04gPSAiZ3JhcGhpY3MiCiBMSUNFTlNFICA9ICJBcGFjaGUtMi4w
IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2
NTVmYzg1NGRkYzNjNmJkNTciCiAKLVNSQ1JFViA9ICJhNjJhYmNiNDAyMDA5YjljYTU5NzVlNjE2
N2MwOWYyMzdmNjMwZTBlIgorU1JDUkVWID0gIjMzZTAyNTY4MTgxZTMzMTJmNDlhM2NmMzNkZjQ3
MGJmOTZlZjI5M2EiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1NQ
SVJWLVRvb2xzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgICIK
IFBFID0gIjEiCi0tIAoyLjQ3LjEKCg==

--===============8173533914227761309==--

