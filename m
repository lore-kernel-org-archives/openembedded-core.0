Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93064C52D7E
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:25 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.75740.1722536824022174707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=g6vfq+c5;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=WRGRXN7Q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101910f324423-b5a38e3e-05bf-4063-93be-786e8a205a56-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=us/5W53w97Fz4zA4gyJkuDzwnOIWowdNGOcAV/137XI=;
	b=g6vfq+c5PxM/KmDN5ehVC+CIdRonhnNZZYlFj65OqMElTsrlSJTlcktgc0MzNyQ5
	A+zdmW3eI4eJwAbj2fPUmbgPFMYPRaCs6DAKngaYHCiLd1ZAg5V8pEUPGbr0zgdB7xg
	tRXYKodyjyuNw5sWN1qkLXL6vkREx0zqCq+YHkm4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536838;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=us/5W53w97Fz4zA4gyJkuDzwnOIWowdNGOcAV/137XI=;
	b=WRGRXN7QYh/s/rWxXwaRjZnPy4Y1BIig6fuhUr/YzOW60+3ZJRiS3O4CelI/eT8G
	9AaV+bxg/jxQx8sECe8ZvaqCIXJTqqP5ZH3aHjy+zzoYy+HqHtC2XLnOSlYvgVgbIyJ
	XXLRmsp8vuwvSdttBGtiG9bqNtDmWu6jQtoqLj2o=
Content-Type: multipart/mixed; boundary="===============6409937645464352377=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxslt: upgrading to 1.1.42 FAILED
Message-ID: <010101910f324423-b5a38e3e-05bf-4063-93be-786e8a205a56-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202879

--===============6409937645464352377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxslt* to *1.1.42* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxslt-upgrade-1.1.39-1.1.42.patch
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
From 149a4ccef8d59525c2f0a712db44255de0c6e044 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 17:43:51 +0000
Subject: [PATCH] libxslt: upgrade 1.1.39 -> 1.1.42

---
 .../libxslt/{libxslt_1.1.39.bb => libxslt_1.1.42.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.39.bb => libxslt_1.1.42.bb} (95%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.39.bb b/meta/recipes-support/libxslt/libxslt_1.1.42.bb
similarity index 95%
rename from meta/recipes-support/libxslt/libxslt_1.1.39.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.42.bb
index 2cc0c84bec..6c5864e63a 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.39.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.42.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0"
+SRC_URI[sha256sum] = "85ca62cac0d41fc77d3f6033da9df6fd73d20ea2fc18b0a3609ffb4110e1baeb"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.44.0


--===============6409937645464352377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-c82205018a36e51a4d5d483c851de8c78faf0e37"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c82205018a36e51a4d5d483c851de8c78faf0e37"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 154 Local 142 Mirrors 0 Missed 12 Current 263 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 270 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: Running task 673 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_recipe_qa)
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 380 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_recipe_qa unihash changed to 2915be3425c92bc8c3186da6dee4477c44245408cc831f625be276875df7b493
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 811 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.42-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 812 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_unpack)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 388 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_patch)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 397 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_patch: Succeeded
NOTE: Running task 827 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 828 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_populate_lic)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 402 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.42-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_populate_lic unihash changed to 53e15d54a49a2d8e6023f2a9a2588cf5fcaff948c55e1942622be7cf014a311d
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_deploy_source_date_epoch unihash changed to 24414536b390669bbfb5e22b3fc595b022f4eb15f7e70595d7ca3f9d65ede447
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1154 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1187 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_collect_spdx_deps)
NOTE: recipe libxslt-1.1.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxslt-1.1.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1188 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_configure)
NOTE: recipe libxslt-1.1.42-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.42-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1188 tasks of which 1179 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801174306.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801174306.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libxslt-1.1.42-r0 do_configure: QA Issue: libxslt: configure was passed unrecognised options: --without-mem-debug [unknown-configure-option]
ERROR: libxslt-1.1.42-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libxslt/1.1.42/temp/log.do_configure.2000534
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_configure) failed with exit code '1'

--===============6409937645464352377==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxslt-upgrade-1.1.39-1.1.42.patch"

RnJvbSAxNDlhNGNjZWY4ZDU5NTI1YzJmMGE3MTJkYjQ0MjU1ZGUwYzZlMDQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNzo0Mzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnhzbHQ6IHVwZ3JhZGUgMS4xLjM5IC0+IDEuMS40MgoKLS0tCiAuLi4vbGlieHNsdC97bGlieHNs
dF8xLjEuMzkuYmIgPT4gbGlieHNsdF8xLjEuNDIuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ4c2x0L3tsaWJ4c2x0XzEuMS4zOS5iYiA9PiBsaWJ4c2x0XzEuMS40
Mi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xp
YnhzbHRfMS4xLjM5LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEu
MS40Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjM5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4xLjQyLmJiCmluZGV4IDJjYzBjODRiZWMuLjZjNTg2NGU2
M2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEu
MzkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS40Mi5i
YgpAQCAtMTUsNyArMTUsNyBAQCBERVBFTkRTID0gImxpYnhtbDIiCiAKIFNSQ19VUkkgPSAiaHR0
cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJ4c2x0LzEuMS9saWJ4c2x0LSR7UFZ9
LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJhMjBhZDYyMTE0ODMzOWIwNzU5YzRk
NGU5NjcxOTM2MmRlZTY0YzlhMDk2ZGJiYTYyNWJhMDUzODQ2MzQ5ZjAiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiODVjYTYyY2FjMGQ0MWZjNzdkM2Y2MDMzZGE5ZGY2ZmQ3M2QyMGVhMmZjMThiMGEz
NjA5ZmZiNDExMGUxYmFlYiIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibGlieHNsdC0oP1A8
cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi40NC4wCgo=

--===============6409937645464352377==--

