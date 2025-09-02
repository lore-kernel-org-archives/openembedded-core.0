Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEBDCAC59E
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:43 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.90003.1756850193856220405
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zqRYFsY7;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PzA7VNbh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101990c6e834b-f9822dad-64ab-43a4-80df-b7cbb8384a91-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850193;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M7hfghSX8Afidjn46q9YIdBzxMZ5yRlUSpO6cq5KAw4=;
	b=zqRYFsY7GqtixC30BbGePY4gIFwxW4H197PkGdBk7CQn2MAC/RN0hKQWV6Yx0rij
	9dBq2Vg9EkEYesd/C/O71C+qPJhCpPoZ1AY93FuVkc3fM9eE2qdCEx8b+s66DCvMaP0
	QM7xh4Q05mtINh1T0KxYXSLNCIlnTWRynTxKIxPE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850193;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M7hfghSX8Afidjn46q9YIdBzxMZ5yRlUSpO6cq5KAw4=;
	b=PzA7VNbhEjy1C9tjCBrQzX5PE7oKrfjGNqNNpQ1sD2cOD/mboFmNPRt2Vg5DvYEV
	2BqaugXbx/yfG+abHFbiGbB3ItEZECkMNYILMFCxKMo0CBaE9ZmPtne1jwQCiVauIoM
	6LTHis/FN/zOdn7crWrTYCuzktD7ZduKzbDUMYEY=
Content-Type: multipart/mixed; boundary="===============8234215451993026805=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] repo: upgrading to 2.58 SUCCEEDED
Message-ID: <010101990c6e834b-f9822dad-64ab-43a4-80df-b7cbb8384a91-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222789

--===============8234215451993026805==
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
From 48e95102934992695f466c622208488e9829d2f9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 18:51:13 +0000
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


--===============8234215451993026805==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.56-2.58.patch"

RnJvbSA0OGU5NTEwMjkzNDk5MjY5NWY0NjZjNjIyMjA4NDg4ZTk4MjlkMmY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxODo1MToxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi41NiAtPiAyLjU4CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3tyZXBvXzIuNTYuYmIgPT4gcmVwb18yLjU4LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3tyZXBvXzIuNTYuYmIgPT4gcmVwb18yLjU4LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41Ni5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi41OC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTYuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi41OC5iYgppbmRleCBlZmRiOWJkMGM5Li43NmZi
MmQyMTRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNTYu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjU4LmJiCkBAIC0xMSw3
ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2
Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5nb29n
bGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9
diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gIjk5YjVhMTdmMmM5NTFmZTU5NzkxMDBj
MzZlN2UxZGJiNGM2MWIzNmMiCitTUkNSRVYgPSAiMzhkMmZlMTFiOWRmNTIxNzI3ZmNjYTIzYzlk
YWMwODZjZTgzNzhkMyIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5j
b20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVw
by5naXQiCiAKLS0gCjIuNDcuMQoK

--===============8234215451993026805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.56" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.58"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.56 [default] to 2.58 [default]
packages/x86-64-v3-poky-linux/repo: PV changed from "2.56" to "2.58"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.56 [default] to 2.58 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.56" to "2.58"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.56 [default] to 2.58 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.56" to "2.58"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.56 [default] to 2.58 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.56" to "2.58"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.56 [default] to 2.58 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.56" to "2.58"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.56 [default] to 2.58 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.56" to "2.58"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.56 [default] to 2.58 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.56" to "2.58"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.56 [default] to 2.58 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.56" to "2.58"

--===============8234215451993026805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1941 targets, 53 skipped, 0 masked, 0 errors.
Removing 57 recipes from the qemux86_64 sysroot...done.
Removing 7 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-37c40bc838673a87d97b9e0ccaf9d4f5a96f0d6c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:37c40bc838673a87d97b9e0ccaf9d4f5a96f0d6c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 431 Local 420 Mirrors 0 Missed 11 Current 234 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 246 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_populate_lic_setscene)
NOTE: Running setscene task 248 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 255 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 284 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 285 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 291 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 297 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 302 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 305 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.58-r0: task do_populate_lic_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe repo-2.58-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_qa_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe repo-2.58-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 317 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 329 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe repo-2.58-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 330 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 331 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe repo-2.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 343 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.50.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 883 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 371 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 375 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_fetch: Started
NOTE: Running setscene task 382 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 385 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 410 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe git-2.50.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 416 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/findutils/findutils_4.10.0.bb:do_packagedata_setscene)
NOTE: Running task 985 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 428 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 429 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 435 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe repo-2.58-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 441 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 443 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1021 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_unpack)
NOTE: Running task 1022 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1023 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/git/2.50.1/temp/log.do_packagedata_setscene.246578
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 460 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_package_setscene)
NOTE: recipe repo-2.58-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe findutils-4.10.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 465 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running task 1084 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1088 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running setscene task 518 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe repo-2.58-r0: task do_unpack: Succeeded
NOTE: Running task 1104 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_patch)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running setscene task 523 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running task 1110 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.58-r0: task do_patch: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_patch: Succeeded
NOTE: recipe git-2.50.1-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1148 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1169 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe git-2.50.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 574 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe git-2.50.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 592 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1265 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running setscene task 630 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 633 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 640 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
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
NOTE: Running setscene task 659 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1699 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1721 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/git/git_2.50.1.bb:do_packagedata)
NOTE: Running task 1840 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_collect_spdx_deps)
NOTE: recipe repo-2.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.50.1-r0: task do_packagedata: Started
NOTE: recipe repo-2.58-r0: task do_collect_spdx_deps: Started
NOTE: recipe repo-2.58-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe repo-2.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_configure)
NOTE: recipe repo-2.58-r0: task do_configure: Started
NOTE: recipe git-2.50.1-r0: task do_packagedata: Succeeded
NOTE: recipe repo-2.58-r0: task do_configure: Succeeded
NOTE: Running task 1878 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_compile)
NOTE: recipe repo-2.58-r0: task do_compile: Started
NOTE: recipe repo-2.58-r0: task do_compile: Succeeded
NOTE: Running task 1879 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_install)
NOTE: recipe repo-2.58-r0: task do_install: Started
NOTE: recipe repo-2.58-r0: task do_install: Succeeded
NOTE: Running task 1880 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package)
NOTE: recipe repo-2.58-r0: task do_package: Started
NOTE: recipe repo-2.58-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package unihash changed to fff869a907b4ff2f9d5d52031dd7bd2b9335ce9ef511fa3b0b94b1378bd3d394
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_create_spdx became valid
NOTE: Running setscene task 659 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_qa_setscene)
NOTE: Running setscene task 661 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_create_spdx_setscene)
NOTE: Running setscene task 662 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 663 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_write_ipk_setscene)
NOTE: recipe repo-2.58-r0: task do_package_qa_setscene: Started
NOTE: recipe repo-2.58-r0: task do_create_spdx_setscene: Started
NOTE: recipe repo-2.58-r0: task do_package_write_deb_setscene: Started
NOTE: recipe repo-2.58-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe repo-2.58-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe repo-2.58-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 665 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_packagedata_setscene)
NOTE: recipe repo-2.58-r0: task do_packagedata_setscene: Started
NOTE: recipe repo-2.58-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1886 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_write_rpm)
NOTE: Running task 1888 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_create_package_spdx)
NOTE: recipe repo-2.58-r0: task do_package_write_rpm: Started
NOTE: recipe repo-2.58-r0: task do_create_package_spdx: Started
NOTE: recipe repo-2.58-r0: task do_create_package_spdx: Succeeded
NOTE: recipe repo-2.58-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_package_write_rpm unihash changed to c642c7a79aeed99ca2749c91a33977bf4d0d14663d143f52e0fbb83cbf5a965b
NOTE: Running noexec task 1889 of 1889 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/repo/repo_2.58.bb:do_build)
NOTE: Tasks Summary: Attempted 1889 tasks of which 1867 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.51.0-r0 to 0:2.50.1-r0) [version-going-backwards]
ERROR: git-2.50.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8234215451993026805==--

