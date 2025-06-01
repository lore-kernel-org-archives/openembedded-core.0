Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4294BC54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.27776.1748786130431140761
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PL9gtO9i;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=AVjyvAoq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101972bc6b447-93c2af88-f29e-4509-a5d1-4d7e348bcf5d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786132;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h32yyIeD2XtG0cE+OSSh6P5EReahYI/CBVGOfWKFQhI=;
	b=PL9gtO9iiliY5GxVwP4mxo7M4Q3mmrfGSP9LoNhDnfTjwy7DfS4yccpWvrrzY/TQ
	G/FRLDRDjj22+kxDdFSuQVnXjio2WwmGqQtbQIbB3SzxQdx62FpxJhPws2/wFLktRIj
	wVtoWfBrRKdW7IWsOGUdO9iKp+GW2JDtifMMKSCw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786132;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h32yyIeD2XtG0cE+OSSh6P5EReahYI/CBVGOfWKFQhI=;
	b=AVjyvAoqZySQA2CxcfMqyYp0EAaP9CxEX5kua4hkZ5M2s3yjbRa3lP08U4L5ILrI
	U6j+PoNtEciJ6C83TeW8E5UfyVs2RNNk+gGXJgGOY6aKLdVbD0+eZMNED0wbFj1CaWg
	0n7OICDZQfz7TGygHKzm2AIOwO1+kc9gw/+ruAJY=
Content-Type: multipart/mixed; boundary="===============7809118962526276624=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 a23ad7875b89df0dedc23f0b173926374f01bc76 SUCCEEDED
Message-ID: <010101972bc6b447-93c2af88-f29e-4509-a5d1-4d7e348bcf5d-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217593

--===============7809118962526276624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *mmc-utils* to *a23ad7875b89df0dedc23f0b173926374f01bc76* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
From 60f557ffe6ac4eb41a3d567f4f13898efeb57c40 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:03:53 +0000
Subject: [PATCH] mmc-utils: upgrade to latest revision

---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 1f287a8df9..043ac71846 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58"
+SRCREV = "a23ad7875b89df0dedc23f0b173926374f01bc76"
 
 PV = "0.1+git"
 
-- 
2.47.1


--===============7809118962526276624==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSA2MGY1NTdmZmU2YWM0ZWI0MWEzZDU2N2Y0ZjEzODk4ZWZlYjU3YzQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOTowMzo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1t
Yy11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21tYy9tbWMt
dXRpbHNfZ2l0LmJiCmluZGV4IDFmMjg3YThkZjkuLjA0M2FjNzE4NDYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbW1jLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMDttZDU9ZmFlMzI3OTJlMjBmNGQyN2FkZTFjNWE3NjJkMTZiN2QiCiAK
IFNSQ0JSQU5DSCA/PSAibWFzdGVyIgotU1JDUkVWID0gImM1MTVlYTJlMWNlYmZiZjlkODFhYTZh
NWMxYmY2N2E3OWQyYTdlNTgiCitTUkNSRVYgPSAiYTIzYWQ3ODc1Yjg5ZGYwZGVkYzIzZjBiMTcz
OTI2Mzc0ZjAxYmM3NiIKIAogUFYgPSAiMC4xK2dpdCIKIAotLSAKMi40Ny4xCgo=

--===============7809118962526276624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1915 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (935 cached, 1 parsed). 1915 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0ff2424cd93f972f719ca382c47412635c3841ea"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 179 Local 168 Mirrors 0 Missed 11 Current 317 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 496 of 496 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_recipe_qa_setscene)
NOTE: recipe mmc-utils-0.1+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1235 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_fetch)
NOTE: recipe mmc-utils-0.1+git-r0: task do_fetch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_fetch: Succeeded
NOTE: Running task 1530 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_unpack)
NOTE: Running task 1531 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mmc-utils-0.1+git-r0: task do_unpack: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_unpack: Succeeded
NOTE: Running task 1532 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_patch)
NOTE: Running task 1533 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_collect_spdx_deps)
NOTE: recipe mmc-utils-0.1+git-r0: task do_patch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_patch: Succeeded
NOTE: Running task 1534 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1535 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic unihash changed to 76213182aba340856010169a91bbdcad927a49ad5c704133aef971a5d6d4ad00
NOTE: recipe mmc-utils-0.1+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch unihash changed to 4a0e4baebd70ab8cc13ff11b8ab9d5cad7b8628453cdfc79503be7e717ee54a4
NOTE: Setscene tasks completed
NOTE: Running task 1536 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_configure)
NOTE: recipe mmc-utils-0.1+git-r0: task do_configure: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_configure: Succeeded
NOTE: Running task 1537 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile)
NOTE: recipe mmc-utils-0.1+git-r0: task do_compile: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_compile: Succeeded
NOTE: Running task 1538 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_install)
NOTE: recipe mmc-utils-0.1+git-r0: task do_install: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_install: Succeeded
NOTE: Running task 1539 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package)
NOTE: Running task 1540 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot)
NOTE: recipe mmc-utils-0.1+git-r0: task do_package: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_sysroot: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot unihash changed to 14ad94e8e6c7ce50c374b9f78164b2ee98a05d277656bd8991f54d789da21733
NOTE: Setscene tasks completed
NOTE: recipe mmc-utils-0.1+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package unihash changed to 012f08d2e2c0ed5743f54b9cf43ecc14748278d19f572a1b0582ba1c822705db
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata became valid
NOTE: Running setscene task 496 of 496 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata_setscene)
NOTE: recipe mmc-utils-0.1+git-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mmc-utils/0.1+git/temp/log.do_packagedata_setscene.452123
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 1541 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata)
NOTE: recipe mmc-utils-0.1+git-r0: task do_packagedata: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_packagedata: Succeeded
NOTE: Running task 1542 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_create_spdx)
NOTE: Running task 1543 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package_write_ipk)
NOTE: Running task 1544 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package_write_deb)
NOTE: Running task 1545 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package_write_rpm)
NOTE: Running task 1546 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package_qa)
NOTE: recipe mmc-utils-0.1+git-r0: task do_create_spdx: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_package_write_ipk: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_package_write_deb: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_package_write_rpm: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_package_qa: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 1547 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_create_package_spdx)
NOTE: recipe mmc-utils-0.1+git-r0: task do_create_package_spdx: Started
NOTE: recipe mmc-utils-0.1+git-r0: task do_create_package_spdx: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_package_qa: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package_qa unihash changed to 6d32c11e3748655e2fd884c24ab8d849e58d4e823f08ee7ca22ae2799326f7f1
NOTE: recipe mmc-utils-0.1+git-r0: task do_package_write_deb: Succeeded
NOTE: recipe mmc-utils-0.1+git-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1548 of 1548 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1548 tasks of which 1528 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: mmc-utils-0.1+git-r0 do_packagedata_setscene: QA Issue: Package version for package mmc-utils-src went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata_setscene: QA Issue: Package version for package mmc-utils-dbg went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata_setscene: QA Issue: Package version for package mmc-utils-staticdev went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata_setscene: QA Issue: Package version for package mmc-utils-dev went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata_setscene: QA Issue: Package version for package mmc-utils-doc went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata_setscene: QA Issue: Package version for package mmc-utils-locale went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata_setscene: QA Issue: Package version for package mmc-utils went backwards which would break package feeds (from 0:0.1+git0+c515ea2e1c-r0 to 0:0.1+git0+a23ad7875b-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+git-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7809118962526276624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 358888 to 354872 (-1%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+c515ea2e1c-r0'])", added "mmc-utils (['= 0.1+git0+a23ad7875b-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 227386 to 225668 (-1%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+c515ea2e1c-r0'])", added "mmc-utils-dev (['= 0.1+git0+a23ad7875b-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 127984 to 127632 (-0%)
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b

--===============7809118962526276624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+c515ea2e1c-r0'])", added "mmc-utils (['= 0.1+git0+a23ad7875b-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+c515ea2e1c-r0'])", added "mmc-utils-dev (['= 0.1+git0+a23ad7875b-r0'])"
packages/core2-64-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b
packages/core2-64-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+c515ea2e1c to 0.1+git0+a23ad7875b

--===============7809118962526276624==--

