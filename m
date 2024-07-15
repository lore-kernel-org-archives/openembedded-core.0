Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2579C3DA7E
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:13 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1306.1721071146992678871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NBxgBBaS;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=b7Thtn9d;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010190b7d59ef4-a230e20a-99b8-40bd-96b2-97e27b58d754-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ivA4H02QibrCgVHSyJEcfjQs6SWuiaElyAKUoGnsCHM=;
	b=NBxgBBaSyQPLIR1IB8kkPU0ZaIQRfWCjWWL+J1oJR6hrK5tFF46vZweNPk8fxOFl
	pYNh7mklAGg/i7c27FfGc8z9xBzT4yg41a1UhJc903cS1ybHWd+xDcB4ZDxYyEzLusR
	x2ecQnroEIATzlYbYdcW3Tnh9oSQZg9bAIgglLwM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ivA4H02QibrCgVHSyJEcfjQs6SWuiaElyAKUoGnsCHM=;
	b=b7Thtn9duoJqZZ3PDYv+OJJj5HmNM32HT31nUjdFaElFXYsV20MKYx3Zlbbx0dtr
	/cIr8XB8OAaUk4D1exI6UUuhVinCvV44oxA71uW5Pb3HSCXZ1YOIjTphavfByVDOR71
	efwWvmWRli+fPNwjjpBJyLKaczO2tdiIouTr0CYQ=
Content-Type: multipart/mixed; boundary="===============7700907832077020411=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxslt: upgrading to 1.1.42 FAILED
Message-ID: <01010190b7d59ef4-a230e20a-99b8-40bd-96b2-97e27b58d754-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202050

--===============7700907832077020411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxslt* to *1.1.42* has Failed(do_compile).

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
From 69a831349261f403dcaba8a94a8c303e4df6d182 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 18:57:09 +0000
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


--===============7700907832077020411==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxslt-upgrade-1.1.39-1.1.42.patch"

RnJvbSA2OWE4MzEzNDkyNjFmNDAzZGNhYmE4YTk0YThjMzAzZTRkZjZkMTgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTg6NTc6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4c2x0OiB1cGdyYWRlIDEuMS4zOSAtPiAxLjEuNDIKCi0tLQogLi4uL2xpYnhzbHQve2xpYnhz
bHRfMS4xLjM5LmJiID0+IGxpYnhzbHRfMS4xLjQyLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlieHNsdC97bGlieHNsdF8xLjEuMzkuYmIgPT4gbGlieHNsdF8xLjEu
NDIuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9s
aWJ4c2x0XzEuMS4zOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8x
LjEuNDIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4zOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS40Mi5iYgppbmRleCAyY2MwYzg0YmVjLi42YzU4NjRl
NjNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4x
LjM5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEuNDIu
YmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJ4bWwyIgogCiBTUkNfVVJJID0gImh0
dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlieHNsdC8xLjEvbGlieHNsdC0ke1BW
fS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyYTIwYWQ2MjExNDgzMzliMDc1OWM0
ZDRlOTY3MTkzNjJkZWU2NGM5YTA5NmRiYmE2MjViYTA1Mzg0NjM0OWYwIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjg1Y2E2MmNhYzBkNDFmYzc3ZDNmNjAzM2RhOWRmNmZkNzNkMjBlYTJmYzE4YjBh
MzYwOWZmYjQxMTBlMWJhZWIiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImxpYnhzbHQtKD9Q
PHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKLS0gCjIuNDQuMAoK

--===============7700907832077020411==
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
DISTRO_VERSION       = "5.0+snapshot-af5fe32f2ec8371c56863d983606ab3f414ce7d6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:af5fe32f2ec8371c56863d983606ab3f414ce7d6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 150 Local 138 Mirrors 0 Missed 12 Current 267 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 275 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: Running task 739 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_recipe_qa)
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 383 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa: Succeeded
NOTE: Running task 879 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_fetch: Succeeded
NOTE: Running task 880 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_unpack)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_unpack: Succeeded
NOTE: Running task 888 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_patch: Succeeded
NOTE: Running task 895 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 896 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_populate_lic)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_populate_lic: Started
NOTE: recipe libxslt-1.1.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.42-r0: task do_populate_lic: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
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
NOTE: Running task 1188 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_configure)
NOTE: recipe libxslt-1.1.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.42-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1188 tasks of which 1179 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715185645.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240715185645.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libxslt-1.1.42-r0 do_configure: QA Issue: libxslt: configure was passed unrecognised options: --without-mem-debug [unknown-configure-option]
ERROR: libxslt-1.1.42-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libxslt/1.1.42/temp/log.do_configure.90716
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_configure) failed with exit code '1'

--===============7700907832077020411==--

