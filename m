Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E98CD4848
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:48 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2351.1762384574631610807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P7rxn5p/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=seNGSv0Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a564ee865-7c7094ca-cba0-427a-842e-6e17dd5879e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tkRKnDCewT/GfBKXIVfuEDYbDTGZqvP8i5PsrpO1p30=;
	b=P7rxn5p/sqlImlwCVfLlbgrpqbwVhb63qAy/m0htP850TEUiM96akAqSkf1PHKyC
	sOjdAy+hXw2L4KXEuh2WPiDGaPbVOUG4qHLIR7htgOsC21iAVVLvJAJnNIFbeBmTTsX
	IApPmEaVTHFgjOm8YZ0OGXtnwEZFTb3T3RYmppfQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384603;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tkRKnDCewT/GfBKXIVfuEDYbDTGZqvP8i5PsrpO1p30=;
	b=seNGSv0YM/D4Jl9BljifSatMmVfKNs0SaYb3CvxihojdJeuCQpLKBrgc2dBXQ43o
	9JWvBCPhqgebhgAeVQxvPUrvsSYdSLLLYj8Qcamkf2DxiUNnLujPaOqMY8ubCT0dvJV
	f7qOyOofN1SAE9AkLv7OD0RbQVMByr/Ib+UZVVvM=
Content-Type: multipart/mixed; boundary="===============4445059507130826298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] puzzles: upgrading to 790f5851507be5845164d3ae7b32b2f86717fe50
 SUCCEEDED
Message-ID: <0101019a564ee865-7c7094ca-cba0-427a-842e-6e17dd5879e6-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225902

--===============4445059507130826298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *puzzles* to *790f5851507be5845164d3ae7b32b2f86717fe50* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
From 739097d3becb7279113c1c58dd4805c1d3e2a460 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 22:01:55 +0000
Subject: [PATCH] puzzles: upgrade to latest revision

---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 91b5740df3..537e891800 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "a7c7826bce5cbb9b9c337c11b9b7f8b278e76fba"
+SRCREV = "790f5851507be5845164d3ae7b32b2f86717fe50"
 PE = "2"
 PV = "0.0+git"
 
-- 
2.47.1


--===============4445059507130826298==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA3MzkwOTdkM2JlY2I3Mjc5MTEzYzFjNThkZDQ4MDVjMWQzZTJhNDYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAyMjowMTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCA5MWI1NzQwZGYzLi41MzdlODkxODAwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbjtwcm90b2NvbD1odHRwcyIKIAogVVBTVFJFQU1fQ0hFQ0tf
Q09NTUlUUyA9ICIxIgotU1JDUkVWID0gImE3Yzc4MjZiY2U1Y2JiOWI5YzMzN2MxMWI5YjdmOGIy
NzhlNzZmYmEiCitTUkNSRVYgPSAiNzkwZjU4NTE1MDdiZTU4NDUxNjRkM2FlN2IzMmIyZjg2NzE3
ZmU1MCIKIFBFID0gIjIiCiBQViA9ICIwLjArZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============4445059507130826298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+a7c7826bce-r0'])", added "puzzles (['= 2:0.0+git0+790f585150-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+a7c7826bce-r0'])", added "puzzles-dev (['= 2:0.0+git0+790f585150-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150

--===============4445059507130826298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 21986144 to 21997120 (+0%)
packages/x86-64-v3-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: RRECOMMENDS: removed "puzzles (['= 2:0.0+git0+a7c7826bce-r0'])", added "puzzles (['= 2:0.0+git0+790f585150-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3865943 to 3870939 (+0%)
packages/x86-64-v3-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: RDEPENDS: removed "puzzles-dev (['= 2:0.0+git0+a7c7826bce-r0'])", added "puzzles-dev (['= 2:0.0+git0+790f585150-r0'])"
packages/x86-64-v3-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150
packages/x86-64-v3-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+a7c7826bce to 0.0+git0+790f585150

--===============4445059507130826298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1945 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6d26012483d04eb52189b00a73ed5ece0ecd86f5"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:6d26012483d04eb52189b00a73ed5ece0ecd86f5"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 489 Local 479 Mirrors 0 Missed 10 Current 761 (97% match, 99% complete)
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 9 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1036 of 1250 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2987 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_fetch)
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 3434 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_unpack)
NOTE: Running task 3435 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_unpack: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3436 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_patch)
NOTE: Running task 3437 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_collect_spdx_deps)
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_patch: Succeeded
NOTE: Running task 3439 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_generate_toolchain_file)
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 3441 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_configure)
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe puzzles-2_0.0+git-r0: task do_configure: Succeeded
NOTE: Running task 3442 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_compile)
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_compile: Succeeded
NOTE: Running task 3443 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_install)
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_install: Succeeded
NOTE: Running task 3444 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_package)
NOTE: Running task 3445 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot)
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_populate_sysroot unihash changed to 2963d2edcacb715de75828460f5c9ed224f0b0e2b793ee90eaa084c40797b712
NOTE: Setscene tasks completed
NOTE: recipe puzzles-2_0.0+git-r0: task do_package: Succeeded
NOTE: Running task 3446 of 3453 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata)
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Started
NOTE: recipe puzzles-2_0.0+git-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 3446 tasks of which 3434 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105220033.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105220033.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.4033265
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-src went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+790f585150-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dbg went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+790f585150-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-staticdev went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+790f585150-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-dev went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+790f585150-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-doc went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+790f585150-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles-locale went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+790f585150-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: QA Issue: Package version for package puzzles went backwards which would break package feeds (from 2:0.0+git0+a7c7826bce-r0 to 2:0.0+git0+790f585150-r0) [version-going-backwards]
ERROR: puzzles-2_0.0+git-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/puzzles/0.0+git/temp/log.do_packagedata.4033265
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/puzzles/puzzles_git.bb:do_packagedata) failed with exit code '1'

--===============4445059507130826298==--

