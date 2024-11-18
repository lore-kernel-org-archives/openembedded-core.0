Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E36AD49207
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:54 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.4729.1731964673293210959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FhC/JYj2;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=fS66KAGX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019341239b59-0e3579b7-c0dd-4453-9a46-17d458613358-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964672;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KMUDnjDwGAQPvi6rWicIQ9Xatwu7VFUU4vV2AKUDNPU=;
	b=FhC/JYj25Ta09s8CVL1d6X0POs7lm8I4Tpm2B6IC34hftOdytVh8vMOgA4sZE14Q
	shNY6roq3hjjBNITcQcX/KSpnYoje0hjd8aUbAydSL2HoTriVpmkHuH4jptRHEjZCaC
	LTtTyCTQ2OYoPMEjeZUCxHsqrlFD1fYVVJUnQvJU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964672;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KMUDnjDwGAQPvi6rWicIQ9Xatwu7VFUU4vV2AKUDNPU=;
	b=fS66KAGXWVUzvUXP5Kl7bNUXkLEM20WvBvpCofu4NB0+vy7oMp8NKlbIX1BGiQU+
	EsdjHjcqm9MHnTStWLX0ecAg25TBHgfV88SC2McIDJy0he3vn4rKuyyAUoXeRGPWWqF
	Dzth+H971HZFYfc+OJVb2t283t4vY5FDELrfgFGM=
Content-Type: multipart/mixed; boundary="===============2798141828686872317=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dtc: upgrading to 1.7.2 FAILED
Message-ID: <0101019341239b59-0e3579b7-c0dd-4453-9a46-17d458613358-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207340

--===============2798141828686872317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dtc* to *1.7.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-dtc-upgrade-1.7.0-1.7.2.patch
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
From 35131d31d6ca18be2c88b04f6790220b516dcad4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 03:08:58 +0000
Subject: [PATCH] dtc: upgrade 1.7.0 -> 1.7.2

---
 meta/recipes-kernel/dtc/{dtc_1.7.0.bb => dtc_1.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/dtc/{dtc_1.7.0.bb => dtc_1.7.2.bb} (96%)

diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
similarity index 96%
rename from meta/recipes-kernel/dtc/dtc_1.7.0.bb
rename to meta/recipes-kernel/dtc/dtc_1.7.2.bb
index 0702fc16df..01670e532a 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-meson.build-bump-version-to-1.7.0.patch \
     file://0002-meson-allow-building-from-shallow-clones.patch \
 "
-SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
+SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.44.1


--===============2798141828686872317==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-dtc-upgrade-1.7.0-1.7.2.patch"

RnJvbSAzNTEzMWQzMWQ2Y2ExOGJlMmM4OGIwNGY2NzkwMjIwYjUxNmRjYWQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMDM6MDg6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
dGM6IHVwZ3JhZGUgMS43LjAgLT4gMS43LjIKCi0tLQogbWV0YS9yZWNpcGVzLWtlcm5lbC9kdGMv
e2R0Y18xLjcuMC5iYiA9PiBkdGNfMS43LjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9k
dGMve2R0Y18xLjcuMC5iYiA9PiBkdGNfMS43LjIuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9kdGMvZHRjXzEuNy4wLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9k
dGMvZHRjXzEuNy4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1rZXJuZWwvZHRjL2R0Y18xLjcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5l
bC9kdGMvZHRjXzEuNy4yLmJiCmluZGV4IDA3MDJmYzE2ZGYuLjAxNjcwZTUzMmEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvZHRjL2R0Y18xLjcuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMta2VybmVsL2R0Yy9kdGNfMS43LjIuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICIg
XAogICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxkLWJ1bXAtdmVyc2lvbi10by0xLjcuMC5wYXRj
aCBcCiAgICAgZmlsZTovLzAwMDItbWVzb24tYWxsb3ctYnVpbGRpbmctZnJvbS1zaGFsbG93LWNs
b25lcy5wYXRjaCBcCiAiCi1TUkNSRVYgPSAiMDM5YTk5NDE0ZTc3ODMzMmQ4ZjljMDRjYmQzMDcy
ZTFkY2M2Mjc5OCIKK1NSQ1JFViA9ICIyZDEwYWEyYWZlMzU1Mjc3MjhkYjMwYjM1ZWM0OTFlY2I2
OTU5ZTVjIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrKFwu
XGQrKSspIgogCi0tIAoyLjQ0LjEKCg==

--===============2798141828686872317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:2385fa1eab3abd79e99b9f19794da99e112e8815"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 223 Local 211 Mirrors 0 Missed 12 Current 293 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 346 of 516 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 946 of 1493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa)
NOTE: Running task 1020 of 1493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa: Started
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 516 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1085 of 1493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 497 of 516 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 1092 of 1493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 516 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1169 of 1493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 516 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1384 of 1493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1462 of 1493 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_patch: Failed
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Tasks Summary: Attempted 1478 tasks of which 1471 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241118030805.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241118030805.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.2/temp/log.do_patch.1871229
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: dtc-1.7.2-r0 do_patch: Applying patch '0001-meson.build-bump-version-to-1.7.0.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.2/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.2/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-meson.build-bump-version-to-1.7.0.patch
patching file meson.build
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file meson.build
Patch 0001-meson.build-bump-version-to-1.7.0.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.2/temp/log.do_patch.1871229
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch) failed with exit code '1'

--===============2798141828686872317==--

