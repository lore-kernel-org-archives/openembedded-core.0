Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62D8C83033
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8894.1749993286066454687
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=f+WnYD/D;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MwLb7brB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019773ba84a4-9b3b0fb5-f0e8-445d-9539-8878dfb22467-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bHn75ZUOg4g4DWTBRcyyp6Eyq7cKbktsVmujkswXa9k=;
	b=f+WnYD/Dp+ljttQUgHb+ji4rEK67bZ7n6opm2IzmSagnz+ltVNledc8CAOfVfzfM
	5ZlVjpF3vj7ml4J1gT1ci5UcPwk842ef40u40eFad1Aevt4iLTFrW0GaedbJmogN4M7
	Q71QMk5rCMM5t5L0EGvKrSwqsGpWw3VxVP93Emdw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bHn75ZUOg4g4DWTBRcyyp6Eyq7cKbktsVmujkswXa9k=;
	b=MwLb7brBjw7+i6QqPZEpF8OiFyZxamZSnH15QmaFSxbdhnl4nQgZAf2MLI2SHoy2
	W1Du+f0oMo64tIUH1WkTNpJkz3iLf9LtEzBiZlWXU6xst4NCD/dQzGQzsdFDOXG/9Gp
	T+0dpe6VGYpzLlEgrKRWCdNQxn+z1oo2YXnVqM34=
Content-Type: multipart/mixed; boundary="===============7586754187926678755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.55.2 SUCCEEDED
Message-ID: <0101019773ba84a4-9b3b0fb5-f0e8-445d-9539-8878dfb22467-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218700

--===============7586754187926678755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.55.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.55-2.55.2.patch
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
From bfbab7bdf7c794db4d8d633a879f50a6f6f8bc5c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 09:31:18 +0000
Subject: [PATCH] repo: upgrade 2.55 -> 2.55.2

---
 meta/recipes-devtools/repo/{repo_2.55.bb => repo_2.55.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.55.bb => repo_2.55.2.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.55.bb b/meta/recipes-devtools/repo/repo_2.55.2.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.55.bb
rename to meta/recipes-devtools/repo/repo_2.55.2.bb
index 5fea49abb3..9cff3c0b7c 100644
--- a/meta/recipes-devtools/repo/repo_2.55.bb
+++ b/meta/recipes-devtools/repo/repo_2.55.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "08815ad3eb245872700201e03c47cb504d1dc3f9"
+SRCREV = "b262d0e4619c406a2708856ed312091d21c5bf39"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============7586754187926678755==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.55-2.55.2.patch"

RnJvbSBiZmJhYjdiZGY3Yzc5NGRiNGQ4ZDYzM2E4NzlmNTBhNmY2ZjhiYzVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDk6MzE6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNTUgLT4gMi41NS4yCgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
ZXBvL3tyZXBvXzIuNTUuYmIgPT4gcmVwb18yLjU1LjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JlcG8ve3JlcG9fMi41NS5iYiA9PiByZXBvXzIuNTUuMi5iYn0gKDk0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTUuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTUuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTUuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41NS4yLmJiCmluZGV4IDVmZWE0
OWFiYjMuLjljZmYzYzBiN2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi41NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTUu
Mi5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIAogU1JDX1VSSSA9ICJnaXQ6
Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQ7cHJvdG9jb2w9aHR0cHM7YnJh
bmNoPW1haW47dGFnPXYke1BWfSBcCiAgICAgICAgICAgICIKLVNSQ1JFViA9ICIwODgxNWFkM2Vi
MjQ1ODcyNzAwMjAxZTAzYzQ3Y2I1MDRkMWRjM2Y5IgorU1JDUkVWID0gImIyNjJkMGU0NjE5YzQw
NmEyNzA4ODU2ZWQzMTIwOTFkMjFjNWJmMzkiCiAKIE1JUlJPUlMgKz0gImdpdDovL2dlcnJpdC5n
b29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdCBnaXQ6Ly9naXRodWIuY29tL0dlcnJpdENvZGVS
ZXZpZXcvZ2l0LXJlcG8uZ2l0IgogCi0tIAoyLjQ3LjEKCg==

--===============7586754187926678755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (0 cached, 935 parsed). 1911 targets, 47 skipped, 0 masked, 0 errors.
Removing 16 recipes from the core2-64 sysroot...done.
Removing 57 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:05ef600e728868f1bd812e58bc8c71fc65d64fc1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 443 Local 432 Mirrors 0 Missed 11 Current 222 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 244 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 251 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 260 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 262 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 267 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 281 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 292 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 295 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_create_spdx_setscene)
NOTE: recipe git-2.49.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe repo-2.55.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_package_qa_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe repo-2.55.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe git-2.49.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe git-2.49.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 324 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 326 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe git-2.49.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe git-2.49.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 327 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 330 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 608 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_recipe_qa)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.49.0.bb:do_recipe_qa_setscene)
NOTE: recipe repo-2.55.2-r0: task do_recipe_qa: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.49.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe git-2.49.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.55.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: Running task 727 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3/3.13.4/temp/log.do_packagedata_setscene.4136459
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 416 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_package_setscene)
NOTE: recipe shadow-4.17.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_fetch: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 423 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running task 742 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.55.2-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe curl-8.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.4-r0: task do_package_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 496 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.55.2-r0: task do_unpack: Succeeded
NOTE: Running task 1026 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_patch)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 510 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.55.2-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe repo-2.55.2-r0: task do_patch: Succeeded
NOTE: Running task 1067 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 536 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.55.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 565 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 601 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 625 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 630 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 631 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 635 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 641 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 646 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 649 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 654 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 657 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 659 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 662 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1699 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1721 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_packagedata)
NOTE: recipe repo-2.55.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1840 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-3.13.4-r0: task do_packagedata: Started
NOTE: recipe repo-2.55.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe repo-2.55.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_configure)
NOTE: recipe repo-2.55.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_configure: Started
NOTE: recipe repo-2.55.2-r0: task do_configure: Succeeded
NOTE: Running task 1873 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_compile)
NOTE: recipe repo-2.55.2-r0: task do_compile: Started
NOTE: recipe repo-2.55.2-r0: task do_compile: Succeeded
NOTE: Running task 1874 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_install)
NOTE: recipe repo-2.55.2-r0: task do_install: Started
NOTE: recipe python3-3.13.4-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_install: Succeeded
NOTE: Running task 1880 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_package)
NOTE: Running task 1881 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_populate_sysroot)
NOTE: recipe repo-2.55.2-r0: task do_populate_sysroot: Started
NOTE: recipe repo-2.55.2-r0: task do_package: Started
NOTE: recipe repo-2.55.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_package: Succeeded
NOTE: Running task 1882 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_packagedata)
NOTE: recipe repo-2.55.2-r0: task do_packagedata: Started
NOTE: recipe repo-2.55.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1883 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_create_spdx)
NOTE: Running task 1884 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_package_write_ipk)
NOTE: Running task 1885 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_package_write_deb)
NOTE: Running task 1886 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_package_write_rpm)
NOTE: Running task 1887 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_package_qa)
NOTE: recipe repo-2.55.2-r0: task do_create_spdx: Started
NOTE: recipe repo-2.55.2-r0: task do_package_write_ipk: Started
NOTE: recipe repo-2.55.2-r0: task do_package_write_deb: Started
NOTE: recipe repo-2.55.2-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.55.2-r0: task do_package_qa: Started
NOTE: recipe repo-2.55.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 1888 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_create_package_spdx)
NOTE: recipe repo-2.55.2-r0: task do_create_package_spdx: Started
NOTE: recipe repo-2.55.2-r0: task do_package_qa: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe repo-2.55.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1889 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.55.2.bb:do_build)
NOTE: Tasks Summary: Attempted 1889 tasks of which 1868 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 70 ERROR messages, returning a non-zero exit code.
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-src went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dbg went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tests went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-asyncio went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-audio went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-codecs went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compile went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-compression went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-core went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-crypt went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ctypes went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-curses went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-datetime went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-db went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-debugger went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-difflib went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doctest went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-email went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ensurepip went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-fcntl went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-gdbm went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-html went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-idle went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-image went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-io went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-json went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-logging went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mailbox went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-math went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mime went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-mmap went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-modules went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-multiprocessing went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netclient went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-netserver went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-numbers went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pickle went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkgutil went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-plistlib went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pprint went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-profile went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pydoc went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-resource went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-shell went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-sqlite3 went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-statistics went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-stringold went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-syslog went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-terminal went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-threading went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tkinter went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-tomllib went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unittest went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-unixadmin went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-venv went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xml went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-xmlrpc went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zipapp went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-zoneinfo went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3 went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package libpython3-staticdev went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-ptest went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-staticdev went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-dev went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-doc went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-locale went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3 went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-misc went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-man went backwards which would break package feeds (from 0:3.13.5-r0 to 0:3.13.4-r0) [version-going-backwards]
ERROR: python3-3.13.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7586754187926678755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.55" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.55.2"
packages/core2-64-poky-linux/repo: PKGV changed from 2.55 [default] to 2.55.2 [default]
packages/core2-64-poky-linux/repo: PV changed from "2.55" to "2.55.2"
packages/core2-64-poky-linux/repo/repo-dbg: PKGV changed from 2.55 [default] to 2.55.2 [default]
packages/core2-64-poky-linux/repo/repo-dbg: PV changed from "2.55" to "2.55.2"
packages/core2-64-poky-linux/repo/repo-dev: PKGV changed from 2.55 [default] to 2.55.2 [default]
packages/core2-64-poky-linux/repo/repo-dev: PV changed from "2.55" to "2.55.2"
packages/core2-64-poky-linux/repo/repo-doc: PKGV changed from 2.55 [default] to 2.55.2 [default]
packages/core2-64-poky-linux/repo/repo-doc: PV changed from "2.55" to "2.55.2"
packages/core2-64-poky-linux/repo/repo-locale: PKGV changed from 2.55 [default] to 2.55.2 [default]
packages/core2-64-poky-linux/repo/repo-locale: PV changed from "2.55" to "2.55.2"
packages/core2-64-poky-linux/repo/repo-src: PKGV changed from 2.55 [default] to 2.55.2 [default]
packages/core2-64-poky-linux/repo/repo-src: PV changed from "2.55" to "2.55.2"
packages/core2-64-poky-linux/repo/repo-staticdev: PKGV changed from 2.55 [default] to 2.55.2 [default]
packages/core2-64-poky-linux/repo/repo-staticdev: PV changed from "2.55" to "2.55.2"
packages/core2-64-poky-linux/repo/repo: PKGV changed from 2.55 [default] to 2.55.2 [default]
packages/core2-64-poky-linux/repo/repo: PV changed from "2.55" to "2.55.2"

--===============7586754187926678755==--

