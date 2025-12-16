Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D39DD5C0D9
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:25 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17392.1765872135156596590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3aOju8w9;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YqOnP6Np;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019b262e72f5-33289ba1-4a2d-4862-8607-47a6aa63b4f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qOHz84KDfU67TrNX7cWorJI1igGzunVJNg91Q6EFTk4=;
	b=3aOju8w9ozjTMTaseNn79oI8VLBpkapiAS/Z1h5hiccLTauj+YuWl5tMViAG1FrC
	Uz2gIMWO5Nq3o0BlhtIWNvHY3MeQrKXVpUKAqg0LZvaAVpFI0aBihW65PFJgK2OMxA4
	eaaz1YmzN/ZW+ZbQAzOsrDIYEJsoC9UszFkam+EY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872137;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qOHz84KDfU67TrNX7cWorJI1igGzunVJNg91Q6EFTk4=;
	b=YqOnP6Np0WDS2Soh+WKCO2glnKGBG1G9YJqbfa8SW5lubqxoqYshLo8UAoa7hFdZ
	XQJqWH/LYAMkF+Jg2Vgp0Pf7RRjJRAoYhDrabs9BhB3EABM0/srJMVBKSlOAuH0JGxP
	kEwlGdn+yXBJS5BqbJs1eH1xMEDXf4z8BSIyHACY=
Content-Type: multipart/mixed; boundary="===============7053443779001430884=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 4e0818fd86bffc0b4a4b61d3295a6732ba08d715
 SUCCEEDED
Message-ID: <0101019b262e72f5-33289ba1-4a2d-4862-8607-47a6aa63b4f4-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227789

--===============7053443779001430884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *4e0818fd86bffc0b4a4b61d3295a6732ba08d715* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From d4b488ed0fcf86b875597840113d3138a726fa83 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 22:56:46 +0000
Subject: [PATCH] gn: upgrade to latest revision

---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 8637216988..c705f07ad4 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "092f4f0d612e5982728c8b872c2e69cf3d04b21f"
+SRCREV = "4e0818fd86bffc0b4a4b61d3295a6732ba08d715"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============7053443779001430884==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSBkNGI0ODhlZDBmY2Y4NmI4NzU1OTc4NDAxMTNkMzEzOGE3MjZmYTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjI6NTY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2duL2duX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCmluZGV4IDg2MzcyMTY5ODgu
LmM3MDVmMDdhZDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2duL2duX2dpdC5iYgpAQCAtNyw3ICs3LDcg
QEAgREVQRU5EUyArPSAibmluamEtbmF0aXZlIgogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIx
IgogCiBTUkNfVVJJID0gImdpdDovL2duLmdvb2dsZXNvdXJjZS5jb20vZ247cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW4iCi1TUkNSRVYgPSAiMDkyZjRmMGQ2MTJlNTk4MjcyOGM4Yjg3MmMyZTY5
Y2YzZDA0YjIxZiIKK1NSQ1JFViA9ICI0ZTA4MThmZDg2YmZmYzBiNGE0YjYxZDMyOTVhNjczMmJh
MDhkNzE1IgogUFYgPSAiMCtnaXQiCiAKIEJCX0dJVF9TSEFMTE9XID0gIiIKLS0gCjIuNDcuMQoK

--===============7053443779001430884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+092f4f0d61-r0'])", added "gn (['= 0+git0+4e0818fd86-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+092f4f0d61-r0'])", added "gn-dev (['= 0+git0+4e0818fd86-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86

--===============7053443779001430884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1950 targets, 47 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-a0813d21c20fd4fb7b3a11f60f4d87188c9a073c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:a0813d21c20fd4fb7b3a11f60f4d87188c9a073c"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 96 Local 87 Mirrors 0 Missed 9 Current 261 (90% match, 97% complete)
done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 9 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 351 of 357 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gn-0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1044 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_fetch)
NOTE: recipe gn-0+git-r0: task do_fetch: Started
NOTE: recipe gn-0+git-r0: task do_fetch: Succeeded
NOTE: Running task 1045 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_unpack)
NOTE: Running task 1046 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gn-0+git-r0: task do_unpack: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gn-0+git-r0: task do_unpack: Succeeded
NOTE: Running task 1047 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_patch)
NOTE: Running task 1048 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_collect_spdx_deps)
NOTE: recipe gn-0+git-r0: task do_patch: Started
NOTE: recipe gn-0+git-r0: task do_collect_spdx_deps: Started
NOTE: recipe gn-0+git-r0: task do_patch: Succeeded
NOTE: Running task 1050 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_configure)
NOTE: recipe gn-0+git-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gn-0+git-r0: task do_configure: Started
NOTE: recipe gn-0+git-r0: task do_configure: Succeeded
NOTE: Running task 1052 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_compile)
NOTE: recipe gn-0+git-r0: task do_compile: Started
NOTE: recipe gn-0+git-r0: task do_compile: Succeeded
NOTE: Running task 1053 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_install)
NOTE: recipe gn-0+git-r0: task do_install: Started
NOTE: recipe gn-0+git-r0: task do_install: Succeeded
NOTE: Running task 1054 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package)
NOTE: Running task 1055 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot)
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Started
NOTE: recipe gn-0+git-r0: task do_package: Started
NOTE: recipe gn-0+git-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_populate_sysroot unihash changed to 0d36df327e545e659b266f0da708c62c76d7a784d91d0928937209346714062d
NOTE: Setscene tasks completed
NOTE: recipe gn-0+git-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package unihash changed to cf0426cca9853b145d4852794a0a34cc641680133115a5406b709158acd31ddb
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata became valid
NOTE: Running setscene task 357 of 357 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata_setscene)
NOTE: recipe gn-0+git-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gn/0+git/temp/log.do_packagedata_setscene.3670180
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 1056 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_packagedata)
NOTE: recipe gn-0+git-r0: task do_packagedata: Started
NOTE: recipe gn-0+git-r0: task do_packagedata: Succeeded
NOTE: Running task 1057 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_create_spdx)
NOTE: Running task 1058 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package_write_ipk)
NOTE: Running task 1059 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package_write_deb)
NOTE: Running task 1060 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package_write_rpm)
NOTE: Running task 1061 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package_qa)
NOTE: recipe gn-0+git-r0: task do_create_spdx: Started
NOTE: recipe gn-0+git-r0: task do_package_write_ipk: Started
NOTE: recipe gn-0+git-r0: task do_package_write_deb: Started
NOTE: recipe gn-0+git-r0: task do_package_write_rpm: Started
NOTE: recipe gn-0+git-r0: task do_package_qa: Started
NOTE: recipe gn-0+git-r0: task do_create_spdx: Succeeded
NOTE: Running task 1062 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_create_package_spdx)
NOTE: recipe gn-0+git-r0: task do_create_package_spdx: Started
NOTE: recipe gn-0+git-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_package_qa unihash changed to 785ce47771c31174ccc12d0e7b9accdbf22acb9f8a2604725d269e51bf3f89dc
NOTE: recipe gn-0+git-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gn-0+git-r0: task do_create_package_spdx: Succeeded
NOTE: recipe gn-0+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gn-0+git-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 1063 of 1063 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gn/gn_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1063 tasks of which 1045 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: gn-0+git-r0 do_packagedata_setscene: QA Issue: Package version for package gn-src went backwards which would break package feeds (from 0:0+git0+092f4f0d61-r0 to 0:0+git0+4e0818fd86-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata_setscene: QA Issue: Package version for package gn-dbg went backwards which would break package feeds (from 0:0+git0+092f4f0d61-r0 to 0:0+git0+4e0818fd86-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata_setscene: QA Issue: Package version for package gn-staticdev went backwards which would break package feeds (from 0:0+git0+092f4f0d61-r0 to 0:0+git0+4e0818fd86-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata_setscene: QA Issue: Package version for package gn-dev went backwards which would break package feeds (from 0:0+git0+092f4f0d61-r0 to 0:0+git0+4e0818fd86-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata_setscene: QA Issue: Package version for package gn-doc went backwards which would break package feeds (from 0:0+git0+092f4f0d61-r0 to 0:0+git0+4e0818fd86-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata_setscene: QA Issue: Package version for package gn-locale went backwards which would break package feeds (from 0:0+git0+092f4f0d61-r0 to 0:0+git0+4e0818fd86-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata_setscene: QA Issue: Package version for package gn went backwards which would break package feeds (from 0:0+git0+092f4f0d61-r0 to 0:0+git0+4e0818fd86-r0) [version-going-backwards]
ERROR: gn-0+git-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7053443779001430884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 99979912 to 100387040 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-dev: RRECOMMENDS: removed "gn (['= 0+git0+092f4f0d61-r0'])", added "gn (['= 0+git0+4e0818fd86-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3106896 to 3122197 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-src: FILELIST: added "/usr/src/debug/gn/0+git/src/base/sha2.h /usr/src/debug/gn/0+git/src/base/sha2.cc"
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn-staticdev: RDEPENDS: removed "gn-dev (['= 0+git0+092f4f0d61-r0'])", added "gn-dev (['= 0+git0+4e0818fd86-r0'])"
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 3657912 to 3678392 (+1%)
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+092f4f0d61 to 0+git0+4e0818fd86

--===============7053443779001430884==--

