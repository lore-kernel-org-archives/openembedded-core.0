Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E1BCA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.11339.1755263229727033426
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MIuScLbp;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RX8N6BW/;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010198add75d45-05069803-849e-4400-951a-c966dbe29b1d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XkZqMqtdJmmgyk5ARfVo8PqP3SBMtF2Fmd7Ayt2Y8uY=;
	b=MIuScLbpY1yh17bRPzQUN9waGiHgxh0cGdh3u00+bbkG2JqDZVFxndu/Ovi6B5Zq
	/z9jv5ih/FlubtFf1BC6aG8W6tgfLmkPYbB9vS0haHwW+4tpU3xgDn22W9t98SwYXB8
	kavT6yBXeVYtvH89wjFWJBLR4ktwQwhSMx+FxsaM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XkZqMqtdJmmgyk5ARfVo8PqP3SBMtF2Fmd7Ayt2Y8uY=;
	b=RX8N6BW/P8L5IcsKPcaA1wpv5aY62kDbEAvRFRlz9Z9tdlredgVOW0+u+NBrHaKi
	j/AyGHi1jqvOrVCYVH/kb5m8h3+DxY5hajnzTYQ0QhGRhgVSHg0wt+FZuF18qO31/1r
	oERv2cnkpomjhRYCpo7UBlT1J0xRrRbuuKGwxnNg=
Content-Type: multipart/mixed; boundary="===============4471465459341153741=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.58 SUCCEEDED
Message-ID: <01010198add75d45-05069803-849e-4400-951a-c966dbe29b1d-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221922

--===============4471465459341153741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.58* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.56-2.58.patch
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
From c561619f72584c1413e9249d475fd86f207e1b61 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 10:03:25 +0000
Subject: [PATCH] repo: upgrade 2.56 -> 2.58

---
 meta/recipes-devtools/repo/{repo_2.56.bb => repo_2.58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.56.bb => repo_2.58.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.56.bb b/meta/recipes-devtools/repo/repo_2.58.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.56.bb
rename to meta/recipes-devtools/repo/repo_2.58.bb
index efdb9bd0c9..76fb2d214c 100644
--- a/meta/recipes-devtools/repo/repo_2.56.bb
+++ b/meta/recipes-devtools/repo/repo_2.58.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "99b5a17f2c951fe5979100c36e7e1dbb4c61b36c"
+SRCREV = "38d2fe11b9df521727fcca23c9dac086ce8378d3"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============4471465459341153741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: PV changed from "2.56" to "2.58"
packages/core2-64-poky-linux/repo: PKGV changed from 2.56 [default] to 2.58 [default]
packages/core2-64-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.56" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.58"
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.56" to "2.58"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.56 [default] to 2.58 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.56" to "2.58"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.56 [default] to 2.58 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.56" to "2.58"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.56 [default] to 2.58 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.56" to "2.58"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.56 [default] to 2.58 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.56" to "2.58"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.56 [default] to 2.58 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.56" to "2.58"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.56 [default] to 2.58 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.56" to "2.58"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.56 [default] to 2.58 [default]

--===============4471465459341153741==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.56-2.58.patch"

RnJvbSBjNTYxNjE5ZjcyNTg0YzE0MTNlOTI0OWQ0NzVmZDg2ZjIwN2UxYjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMTA6MDM6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNTYgLT4gMi41OAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by97cmVwb18yLjU2LmJiID0+IHJlcG9fMi41OC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcmVwby97cmVwb18yLjU2LmJiID0+IHJlcG9fMi41OC5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTYuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcmVwby9yZXBvXzIuNTguYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU2LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTguYmIKaW5kZXggZWZkYjliZDBjOS4uNzZm
YjJkMjE0YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU2
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41OC5iYgpAQCAtMTEs
NyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYjgzZWY5
NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9nZXJyaXQuZ29v
Z2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW47dGFn
PXYke1BWfSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICI5OWI1YTE3ZjJjOTUxZmU1OTc5MTAw
YzM2ZTdlMWRiYjRjNjFiMzZjIgorU1JDUkVWID0gIjM4ZDJmZTExYjlkZjUyMTcyN2ZjY2EyM2M5
ZGFjMDg2Y2U4Mzc4ZDMiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5nb29nbGVzb3VyY2Uu
Y29tL2dpdC1yZXBvLmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVSZXZpZXcvZ2l0LXJl
cG8uZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============4471465459341153741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1942 targets, 50 skipped, 0 masked, 0 errors.
Removing 16 recipes from the core2-64 sysroot...done.
Removing 57 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-933b5b5daa7bc1b8e4e991b5504a680c9fd3ed73"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:933b5b5daa7bc1b8e4e991b5504a680c9fd3ed73"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 435 Local 421 Mirrors 0 Missed 14 Current 230 (96% match, 97% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 234 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 235 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 246 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 252 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_populate_lic_setscene)
NOTE: Running setscene task 258 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 262 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_qa_setscene)
NOTE: Running setscene task 272 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 274 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 296 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.58-r0: task do_populate_lic_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_qa_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe repo-2.58-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 633 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_recipe_qa)
NOTE: recipe python3-3.13.6-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.58-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 328 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 329 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running task 757 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_fetch)
NOTE: recipe git-2.50.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe git-2.50.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 340 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.58-r0: task do_fetch: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 346 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.6-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe git-2.50.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 837 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_unpack)
NOTE: Running setscene task 382 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe git-2.50.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 400 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe repo-2.58-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3/3.13.6/temp/log.do_packagedata_setscene.4190517
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 416 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running task 902 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.58-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 908 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_patch)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 909 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 910 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe repo-2.58-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 454 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 465 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_patch: Succeeded
NOTE: Running task 995 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe repo-2.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 479 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running task 1019 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 497 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 513 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1040 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1066 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1082 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1194 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe python3-3.13.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 563 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 642 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1699 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1722 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.6.bb:do_packagedata)
NOTE: Running task 1840 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe repo-2.58-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.13.6-r0: task do_packagedata: Started
NOTE: recipe repo-2.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe repo-2.58-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1872 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_configure)
NOTE: recipe repo-2.58-r0: task do_configure: Started
NOTE: recipe repo-2.58-r0: task do_configure: Succeeded
NOTE: Running task 1873 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_compile)
NOTE: recipe repo-2.58-r0: task do_compile: Started
NOTE: recipe repo-2.58-r0: task do_compile: Succeeded
NOTE: Running task 1874 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_install)
NOTE: recipe python3-3.13.6-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.58-r0: task do_install: Started
NOTE: recipe repo-2.58-r0: task do_install: Succeeded
NOTE: Running task 1880 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package)
NOTE: Running task 1881 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_populate_sysroot)
NOTE: recipe repo-2.58-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.58-r0: task do_package: Started
NOTE: recipe repo-2.58-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.58-r0: task do_package: Succeeded
NOTE: Running task 1882 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_packagedata)
NOTE: recipe repo-2.58-r0: task do_packagedata: Started
NOTE: recipe repo-2.58-r0: task do_packagedata: Succeeded
NOTE: Running task 1883 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_create_spdx)
NOTE: Running task 1884 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_write_ipk)
NOTE: Running task 1885 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_write_deb)
NOTE: Running task 1886 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_write_rpm)
NOTE: Running task 1887 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_qa)
NOTE: recipe repo-2.58-r0: task do_create_spdx: Started
NOTE: recipe repo-2.58-r0: task do_package_write_ipk: Started
NOTE: recipe repo-2.58-r0: task do_package_write_deb: Started
NOTE: recipe repo-2.58-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.58-r0: task do_package_qa: Started
NOTE: recipe repo-2.58-r0: task do_create_spdx: Succeeded
NOTE: Running task 1888 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_create_package_spdx)
NOTE: recipe repo-2.58-r0: task do_create_package_spdx: Started
NOTE: recipe repo-2.58-r0: task do_package_qa: Succeeded
NOTE: recipe repo-2.58-r0: task do_package_write_ipk: Succeeded
NOTE: recipe repo-2.58-r0: task do_create_package_spdx: Succeeded
NOTE: recipe repo-2.58-r0: task do_package_write_deb: Succeeded
NOTE: recipe repo-2.58-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1889 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_build)
NOTE: Tasks Summary: Attempted 1889 tasks of which 1859 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 70 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.13.7-r0 to 0:3.13.6-r0) [version-going-backwards]
ERROR: python3-3.13.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4471465459341153741==--

