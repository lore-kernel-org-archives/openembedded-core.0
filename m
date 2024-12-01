Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90242D10DC9
	for <webhook@archiver.kernel.org>; Sun,  1 Dec 2024 10:06:09 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.148760.1733047555842754100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 02:06:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LfakOkWt;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=xXvqADM7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019381af3f26-404d837d-0a02-4420-ac12-8fbe60bbb2ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1733047566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ay8inyTnqgyXHBbD4bX2tig5cegLMl9w23FxNMAvFrk=;
	b=LfakOkWt0RoZFKDlGxIcP1rE/0yNbMqAqZdzlUoRngCqaz73F51E6qyKcsi3X/tt
	0GxpBH5kR+vmVZDjRFGxvhhh4x7wRHVT/xhJQ1UtYA5oxP+ljbjBR+jzaXatBHOywlD
	UJgRXpxlUIfu4Nwi1CuW2OsaB6+jbG8zMsZFm8FE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1733047566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ay8inyTnqgyXHBbD4bX2tig5cegLMl9w23FxNMAvFrk=;
	b=xXvqADM7cfmn47LoaFeYaxAPIxGAiVngJna40XUKg6h3y0LNh2780k0mnURpoxRG
	QHoheizvJcIBevBWHMvoG9wQ3NOVjGkNmtKOjYkQs/FkBkNxztrfc7Fi8FTZE/RAOdE
	YUQW5ghyL0QTpgguSVbtZLb9QrC1n5oVhpNpDBy4=
Content-Type: multipart/mixed; boundary="===============0927484049303363408=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dtc: upgrading to 1.7.2 FAILED
Message-ID: <0101019381af3f26-404d837d-0a02-4420-ac12-8fbe60bbb2ec-000000@us-west-2.amazonses.com>
Date: Sun, 1 Dec 2024 10:06:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Dec 2024 10:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208095

--===============0927484049303363408==
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
From 9b6df3bcb6d099058d3a03537bc5f2345d93f033 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Dec 2024 08:43:10 +0000
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


--===============0927484049303363408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1877 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:061f5e8b505398e7114f383330f654a3bb4d000a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 225 Local 214 Mirrors 0 Missed 11 Current 283 (95% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 457 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 464 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 1004 of 1471 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1068 of 1471 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 482 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 486 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 1077 of 1471 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 493 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 1154 of 1471 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 508 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1360 of 1471 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1440 of 1471 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1456 tasks of which 1450 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201084256.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241201084256.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.2/temp/log.do_patch.1696587
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: dtc-1.7.2-r0 do_patch: Applying patch '0001-meson.build-bump-version-to-1.7.0.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.2/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.2/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-meson.build-bump-version-to-1.7.0.patch
patching file meson.build
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file meson.build
Patch 0001-meson.build-bump-version-to-1.7.0.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/dtc/1.7.2/temp/log.do_patch.1696587
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch) failed with exit code '1'

--===============0927484049303363408==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-dtc-upgrade-1.7.0-1.7.2.patch"

RnJvbSA5YjZkZjNiY2I2ZDA5OTA1OGQzYTAzNTM3YmM1ZjIzNDVkOTNmMDMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBEZWMgMjAyNCAwODo0MzoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGR0
YzogdXBncmFkZSAxLjcuMCAtPiAxLjcuMgoKLS0tCiBtZXRhL3JlY2lwZXMta2VybmVsL2R0Yy97
ZHRjXzEuNy4wLmJiID0+IGR0Y18xLjcuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMta2VybmVsL2R0
Yy97ZHRjXzEuNy4wLmJiID0+IGR0Y18xLjcuMi5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMta2VybmVsL2R0Yy9kdGNfMS43LjAuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2R0
Yy9kdGNfMS43LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWtlcm5lbC9kdGMvZHRjXzEuNy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVs
L2R0Yy9kdGNfMS43LjIuYmIKaW5kZXggMDcwMmZjMTZkZi4uMDE2NzBlNTMyYSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9kdGMvZHRjXzEuNy4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1rZXJuZWwvZHRjL2R0Y18xLjcuMi5iYgpAQCAtMTMsNyArMTMsNyBAQCBTUkNfVVJJID0gIiBc
CiAgICAgZmlsZTovLzAwMDEtbWVzb24uYnVpbGQtYnVtcC12ZXJzaW9uLXRvLTEuNy4wLnBhdGNo
IFwKICAgICBmaWxlOi8vMDAwMi1tZXNvbi1hbGxvdy1idWlsZGluZy1mcm9tLXNoYWxsb3ctY2xv
bmVzLnBhdGNoIFwKICIKLVNSQ1JFViA9ICIwMzlhOTk0MTRlNzc4MzMyZDhmOWMwNGNiZDMwNzJl
MWRjYzYyNzk4IgorU1JDUkVWID0gIjJkMTBhYTJhZmUzNTUyNzcyOGRiMzBiMzVlYzQ5MWVjYjY5
NTllNWMiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCsoXC5c
ZCspKykiCiAKLS0gCjIuNDQuMQoK

--===============0927484049303363408==--

