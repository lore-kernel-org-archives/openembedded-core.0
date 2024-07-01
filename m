Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44332C531DA
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:58:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.2131.1719853078861443517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IpZTwOjP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=zhAAj4Ip;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101906f3b52ea-a5a8ecb3-0ff2-4165-83ab-f15c7f5aae74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nMFdt0z3AqnJfLaNkgcYrtflr4q+kmNH08tCUzsc4fc=;
	b=IpZTwOjPM9lJiav5YKBbFtvpgv8esDC/1Ka6POSsGHQy2eEhmPEw9efVNKwzCDRH
	4MyekixTuDlhw1fT9TJEvmW+dHtTpKOJBgiIZ8iMOOoMVpijyT2Es6KFIoOFPweLxm9
	MKmgNXYH9HbNTq7EfV0ZVTuFJ61LBWxOgKOPJ3Q0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1719853077;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nMFdt0z3AqnJfLaNkgcYrtflr4q+kmNH08tCUzsc4fc=;
	b=zhAAj4IpwbVjcspRGDcqfzF8Bz6hX8nqCZu/HkgBiFw4INMfVFgtwcMz34qN8nqG
	04XxPwPsJ152Ewq7gn6k3j+fjvrOmbVVzfMCVxwXSohY83qrdq005UlA26m/+XCwthk
	6+LGf5HEM9LYUyvAIsFxDWEhi5zh9mh1FfcyKhXk=
Content-Type: multipart/mixed; boundary="===============5089825583411355963=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxslt: upgrading to 1.1.41 FAILED
Message-ID: <010101906f3b52ea-a5a8ecb3-0ff2-4165-83ab-f15c7f5aae74-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jul 2024 16:57:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201407

--===============5089825583411355963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxslt* to *1.1.41* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxslt-upgrade-1.1.39-1.1.41.patch
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
From 9134bd79238eab92af623e72139c3487fb351f7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jul 2024 16:30:26 +0000
Subject: [PATCH] libxslt: upgrade 1.1.39 -> 1.1.41

---
 .../libxslt/{libxslt_1.1.39.bb => libxslt_1.1.41.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.39.bb => libxslt_1.1.41.bb} (95%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.39.bb b/meta/recipes-support/libxslt/libxslt_1.1.41.bb
similarity index 95%
rename from meta/recipes-support/libxslt/libxslt_1.1.39.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.41.bb
index 2cc0c84bec..1199a030bf 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.39.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.41.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0"
+SRC_URI[sha256sum] = "3ad392af91115b7740f7b50d228cc1c5fc13afc1da7f16cb0213917a37f71bda"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.44.0


--===============5089825583411355963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1881 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (917 cached, 1 parsed). 1878 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-23b5ae6e7380e25db2a711e3e8665e07376d5219"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:23b5ae6e7380e25db2a711e3e8665e07376d5219"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 148 Local 136 Mirrors 0 Missed 12 Current 269 (91% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 279 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: Running task 674 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_recipe_qa)
NOTE: recipe libxslt-1.1.41-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 386 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.41-r0: task do_recipe_qa: Succeeded
NOTE: Running task 812 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 389 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.41-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.41-r0: task do_fetch: Succeeded
NOTE: Running task 813 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.41-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 395 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.41-r0: task do_unpack: Succeeded
NOTE: Running task 821 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.41-r0: task do_patch: Started
NOTE: recipe libxslt-1.1.41-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 828 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 829 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_populate_lic)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.41-r0: task do_populate_lic: Started
NOTE: recipe libxslt-1.1.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.41-r0: task do_populate_lic: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1154 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1187 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_collect_spdx_deps)
NOTE: recipe libxslt-1.1.41-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxslt-1.1.41-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1188 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_configure)
NOTE: recipe libxslt-1.1.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxslt-1.1.41-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.41-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1188 tasks of which 1179 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701162957.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240701162957.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libxslt-1.1.41-r0 do_configure: QA Issue: libxslt: configure was passed unrecognised options: --without-mem-debug [unknown-configure-option]
ERROR: libxslt-1.1.41-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libxslt/1.1.41/temp/log.do_configure.2581445
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.41.bb:do_configure) failed with exit code '1'

--===============5089825583411355963==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxslt-upgrade-1.1.39-1.1.41.patch"

RnJvbSA5MTM0YmQ3OTIzOGVhYjkyYWY2MjNlNzIxMzljMzQ4N2ZiMzUxZjdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKdWwgMjAyNCAxNjozMDoyNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhzbHQ6IHVwZ3JhZGUgMS4xLjM5IC0+IDEuMS40MQoKLS0tCiAuLi4vbGlieHNsdC97bGlieHNs
dF8xLjEuMzkuYmIgPT4gbGlieHNsdF8xLjEuNDEuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ4c2x0L3tsaWJ4c2x0XzEuMS4zOS5iYiA9PiBsaWJ4c2x0XzEuMS40
MS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xp
YnhzbHRfMS4xLjM5LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEu
MS40MS5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjM5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjQxLmJiCmluZGV4IDJjYzBjODRiZWMuLjExOTlhMDMw
YmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEu
MzkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS40MS5i
YgpAQCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0gImxpYnhtbDIiCiAKIFNSQ19VUkkgPSAiaHR0
cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJ4c2x0LzEuMS9saWJ4c2x0LSR7UFZ9
LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJhMjBhZDYyMTE0ODMzOWIwNzU5YzRk
NGU5NjcxOTM2MmRlZTY0YzlhMDk2ZGJiYTYyNWJhMDUzODQ2MzQ5ZjAiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiM2FkMzkyYWY5MTExNWI3NzQwZjdiNTBkMjI4Y2MxYzVmYzEzYWZjMWRhN2YxNmNi
MDIxMzkxN2EzN2Y3MWJkYSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibGlieHNsdC0oP1A8
cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi40NC4wCgo=

--===============5089825583411355963==--

