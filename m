Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EF1CFD35D
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:18 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.53262.1728588944704958677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=baJVmc2Y;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=0/uILaPK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019277ee6af4-b5075bab-9b72-437a-8e4e-17b6ebf0ada0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=butIN2BuAnjCY/sZHQjwWIeERhBeyNTu8YwXPzM6MiU=;
	b=baJVmc2YriF8S5B8d4DP1OoD3T5E1SOE82lPtjkeI3UzwcDcq6LxiMT1r2ZWJWhy
	EN679hPBg03E0c3Kmj12pG91tjS0AhpCyBSqWdcJOcNV+Y8fR1hmInITG9IvsJM4m3u
	GFXvuOkghw+QqbmR2Ue++UfL/UTf4XFff21ZsfMA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=butIN2BuAnjCY/sZHQjwWIeERhBeyNTu8YwXPzM6MiU=;
	b=0/uILaPKLq/+CMmvrOWlhgrSgl4HWZ5IqBXI7f71viiUJnvVN54InV9Ru1aGd6mQ
	NEVbKNfdmP7Xssn1e7yypDs910UAuYEpwfriSolpbHeRoQ9ucCYgbXF9ld698sAgwT2
	oq8T6yy+vR0PN7kB3wK1hqZQO0N8/9PwGXcCyGXQ=
Content-Type: multipart/mixed; boundary="===============2437670901247888219=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dtc: upgrading to 1.7.1 FAILED
Message-ID: <0101019277ee6af4-b5075bab-9b72-437a-8e4e-17b6ebf0ada0-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205542

--===============2437670901247888219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dtc* to *1.7.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-dtc-upgrade-1.7.0-1.7.1.patch
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
From 55f98d20f23115b23b513a3eaa9b170c1246f5ab Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 15:49:21 +0000
Subject: [PATCH] dtc: upgrade 1.7.0 -> 1.7.1

---
 meta/recipes-kernel/dtc/{dtc_1.7.0.bb => dtc_1.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/dtc/{dtc_1.7.0.bb => dtc_1.7.1.bb} (96%)

diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.1.bb
similarity index 96%
rename from meta/recipes-kernel/dtc/dtc_1.7.0.bb
rename to meta/recipes-kernel/dtc/dtc_1.7.1.bb
index 0702fc16df..741bd5e45c 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.1.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
     file://0001-meson.build-bump-version-to-1.7.0.patch \
     file://0002-meson-allow-building-from-shallow-clones.patch \
 "
-SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
+SRCREV = "99031e3a4a6e479466ae795790b44727434ca27d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.44.1


--===============2437670901247888219==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-dtc-upgrade-1.7.0-1.7.1.patch"

RnJvbSA1NWY5OGQyMGYyMzExNWIyM2I1MTNhM2VhYTliMTcwYzEyNDZmNWFiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMTU6NDk6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
dGM6IHVwZ3JhZGUgMS43LjAgLT4gMS43LjEKCi0tLQogbWV0YS9yZWNpcGVzLWtlcm5lbC9kdGMv
e2R0Y18xLjcuMC5iYiA9PiBkdGNfMS43LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9k
dGMve2R0Y18xLjcuMC5iYiA9PiBkdGNfMS43LjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWtlcm5lbC9kdGMvZHRjXzEuNy4wLmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9k
dGMvZHRjXzEuNy4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1rZXJuZWwvZHRjL2R0Y18xLjcuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5l
bC9kdGMvZHRjXzEuNy4xLmJiCmluZGV4IDA3MDJmYzE2ZGYuLjc0MWJkNWU0NWMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvZHRjL2R0Y18xLjcuMC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMta2VybmVsL2R0Yy9kdGNfMS43LjEuYmIKQEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICIg
XAogICAgIGZpbGU6Ly8wMDAxLW1lc29uLmJ1aWxkLWJ1bXAtdmVyc2lvbi10by0xLjcuMC5wYXRj
aCBcCiAgICAgZmlsZTovLzAwMDItbWVzb24tYWxsb3ctYnVpbGRpbmctZnJvbS1zaGFsbG93LWNs
b25lcy5wYXRjaCBcCiAiCi1TUkNSRVYgPSAiMDM5YTk5NDE0ZTc3ODMzMmQ4ZjljMDRjYmQzMDcy
ZTFkY2M2Mjc5OCIKK1NSQ1JFViA9ICI5OTAzMWUzYTRhNmU0Nzk0NjZhZTc5NTc5MGI0NDcyNzQz
NGNhMjdkIgogCiBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+XGQrKFwu
XGQrKSspIgogCi0tIAoyLjQ0LjEKCg==

--===============2437670901247888219==
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
workspace            = "tmp-auh-upgrades:dd78b7a1c9ebc0d1836b2f60690c0806f4506da8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 258 Local 247 Mirrors 0 Missed 11 Current 256 (95% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 298 of 514 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 514 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/diffutils/diffutils_3.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 310 of 514 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running task 484 of 1491 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.1.bb:do_write_config)
NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe diffutils-3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.1-r0: task do_write_config: Started
NOTE: recipe dtc-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 504 of 1491 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.1.bb:do_fetch)
NOTE: recipe diffutils-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 459 of 514 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe dtc-1.7.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 477 of 514 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe dtc-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 521 of 1491 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.1.bb:do_unpack)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.1-r0: task do_unpack: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 484 of 514 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 514 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 514 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1112 of 1491 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.1.bb:do_patch)
NOTE: recipe dtc-1.7.1-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 509 of 514 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 513 of 514 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1362 of 1491 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1462 of 1491 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dtc-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dtc-1.7.1-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1476 tasks of which 1470 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010154908.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010154908.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.1.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.1/temp/log.do_patch.2032875
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: dtc-1.7.1-r0 do_patch: Applying patch '0001-meson.build-bump-version-to-1.7.0.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.1/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.1/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-meson.build-bump-version-to-1.7.0.patch
patching file meson.build
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file meson.build
Patch 0001-meson.build-bump-version-to-1.7.0.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.1/temp/log.do_patch.2032875
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.1.bb:do_patch) failed with exit code '1'

--===============2437670901247888219==--

