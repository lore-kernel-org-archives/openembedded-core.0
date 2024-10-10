Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D24CCFC61F
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:35:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.53272.1728588950984090610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fpes8i9v;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=OjtUn3wi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019277ee2aaf-c8c93571-b32f-437f-84ea-a907e834b5d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3aEyiuhR5dGqmlPQdMxkvb0z7XY1ZIG40hvR6/Ppr4M=;
	b=fpes8i9vojvlg5xre2YmjIEacfQQlKQqZl+/Y0Uh1pDoAQGLyu/OE12SXN72OgBd
	0dWM+MyRA34rVvEzF/tPeCVzwZP6GM736SVHUv6C3t5V/U5Y6ymnGiBUhX3to2Fd8AH
	HGcX4eI5QwBq29kG6CpHZEpYQ3ozNUNLuQjqP3GI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3aEyiuhR5dGqmlPQdMxkvb0z7XY1ZIG40hvR6/Ppr4M=;
	b=OjtUn3wiv699cdW4BdKebhh0/OAM8aDxWvLKrqXWgIDMZXYDl4Id+2JdDGPd+P1+
	WyjUwj6fUqXgEo8baCyLfRUVoZ+qAYNzEm3Ht0Vt+rqpbdvFsq4ATjM6zRHaVfWPPx1
	W1+q2jlKA+rPr0djqDiTueMurWBxCULMLa3O5lRg=
Content-Type: multipart/mixed; boundary="===============5165323667024517517=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.19.0 FAILED
Message-ID: <0101019277ee2aaf-c8c93571-b32f-437f-84ea-a907e834b5d9-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:35:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205465

--===============5165323667024517517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-beartype* to *0.19.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.18.5-0.19.0.patch
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
From bed384cca074d6f799e896bba2d6957e5eaf39c1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 13:18:15 +0000
Subject: [PATCH] python3-beartype: upgrade 0.18.5 -> 0.19.0

---
 .../{python3-beartype_0.18.5.bb => python3-beartype_0.19.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.18.5.bb => python3-beartype_0.19.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb b/meta/recipes-devtools/python/python3-beartype_0.19.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.18.5.bb
rename to meta/recipes-devtools/python/python3-beartype_0.19.0.bb
index 95d947c90e..ebdc7abab3 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.19.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "264ddc2f1da9ec94ff639141fbe33d22e12a9f75aa863b83b7046ffff1381927"
+SRC_URI[sha256sum] = "de42dfc1ba5c3710fde6c3002e3bd2cad236ed4d2aabe876345ab0b4234a6573"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.44.1


--===============5165323667024517517==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.18.5-0.19.0.patch"

RnJvbSBiZWQzODRjY2EwNzRkNmY3OTllODk2YmJhMmQ2OTU3ZTVlYWYzOWMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTM6MTg6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJlYXJ0eXBlOiB1cGdyYWRlIDAuMTguNSAtPiAwLjE5LjAKCi0tLQogLi4uL3tweXRo
b24zLWJlYXJ0eXBlXzAuMTguNS5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTkuMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iZWFydHlwZV8wLjE4LjUu
YmIgPT4gcHl0aG9uMy1iZWFydHlwZV8wLjE5LjAuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTguNS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iZWFydHlwZV8wLjE5LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJlYXJ0eXBlXzAuMTguNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTkuMC5iYgppbmRleCA5NWQ5NDdjOTBlLi5l
YmRjN2FiYWIzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmVhcnR5cGVfMC4xOC41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iZWFydHlwZV8wLjE5LjAuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vYmVhcnR5cGUucmVhZHRoZWRvY3MuaW8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWU3MWY5NDI2MWMxYjM5ODk2Y2FjYWNmZWFm
NjA1NjBlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjY0ZGRjMmYxZGE5ZWM5NGZmNjM5MTQx
ZmJlMzNkMjJlMTJhOWY3NWFhODYzYjgzYjcwNDZmZmZmMTM4MTkyNyIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJkZTQyZGZjMWJhNWMzNzEwZmRlNmMzMDAyZTNiZDJjYWQyMzZlZDRkMmFhYmU4NzYz
NDVhYjBiNDIzNGE2NTczIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRf
bWV0YQogCi0tIAoyLjQ0LjEKCg==

--===============5165323667024517517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1873 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (916 cached, 1 parsed). 1871 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:1e5b4d8ddceb18599e3489208ebfe1209794c561"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 326 Local 317 Mirrors 0 Missed 9 Current 309 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 345 of 635 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 347 of 635 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 348 of 635 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 505 of 635 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-wheel_0.44.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-beartype-0.19.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-wheel-native-0.44.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-beartype-0.19.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 540 of 635 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-wheel-native-0.44.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 635 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-build_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-beartype-0.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 589 of 635 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-build-native-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 566 of 1805 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_fetch)
NOTE: recipe python3-build-native-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 597 of 635 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-beartype-0.19.0-r0: task do_fetch: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 575 of 1805 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_unpack)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 602 of 635 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_unpack: Succeeded
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 614 of 635 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 635 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1175 of 1805 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_patch)
NOTE: recipe python3-beartype-0.19.0-r0: task do_patch: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 632 of 635 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1635 of 1805 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1789 of 1805 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-beartype-0.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-beartype-0.19.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1793 of 1805 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_configure)
NOTE: recipe python3-beartype-0.19.0-r0: task do_configure: Started
NOTE: recipe python3-beartype-0.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1794 of 1805 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_compile)
NOTE: recipe python3-beartype-0.19.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'hatchling.build'
| 
| ERROR Backend 'hatchling.build' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.498394:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/beartype-0.19.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.498394, line 157
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.498394, line 152
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.498394, line 168
NOTE: recipe python3-beartype-0.19.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1794 tasks of which 1787 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010131800.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010131800.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/log.do_compile.498394
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-beartype-0.19.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/run.do_compile.498394' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-beartype/0.19.0/temp/log.do_compile.498394
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-beartype_0.19.0.bb:do_compile) failed with exit code '1'

--===============5165323667024517517==--

