Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863CDC35FF4
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7065.1740828338038860341
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IT/7G5tC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=3dw1Ec6X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195517464cb-791b217c-5835-4bff-8e70-d65dabe91e6c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=caGBiTgkqy6ASwWBjak/4N84opjEvOT5q9gNRHfUW9s=;
	b=IT/7G5tC0X5GkqiCOdcpUc+pawHlu/T6FsoCa9Ooc10mm8zyE3xh4qWNn8noi+ot
	6dwg6+DB57nSvKczEcu/ebpSlGmN4aFikRrRm/SP8cXh1R3FKqlUUkWFX70eeC85kWo
	CzTgP71++4gMzJ7HyBLMXb+i+BKqqhAE6kadTOZ8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=caGBiTgkqy6ASwWBjak/4N84opjEvOT5q9gNRHfUW9s=;
	b=3dw1Ec6Xon+i3u56f8GlRdLZORsw1O8Z34uTrH70wIGJRYgaAMJiQt57/MrTbacO
	AG4tkD5j64qWCsHgITEbxWCI5+VIA05+TEqRYOsEjIqSasUOtDpjRv5Pf0BF4CvZ2h9
	TUqQkHWm2O5F07tr3/RaEdiLWlL1ufACoL08XS8o=
Content-Type: multipart/mixed; boundary="===============0738169760136100348=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.4.304.1 SUCCEEDED
Message-ID: <01010195517464cb-791b217c-5835-4bff-8e70-d65dabe91e6c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:37 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212162

--===============0738169760136100348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.4.304.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.3.296.0-1.4.304.1.patch
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
From 72f1363eecc8b0fab31a8f25a58d8ca5dd4be29d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 10:32:28 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.3.296.0 -> 1.4.304.1

---
 .../{vulkan-volk_1.3.296.0.bb => vulkan-volk_1.4.304.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.296.0.bb => vulkan-volk_1.4.304.1.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb
index bed4293490..f5e3b5b755 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "59d26900f53c7621a8ba8ab0e3f18d3bd883fa9a"
+SRCREV = "0b17a763ba5643e32da1b2152f8140461b3b7345"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============0738169760136100348==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.3.296.0-1.4.304.1.patch"

RnJvbSA3MmYxMzYzZWVjYzhiMGZhYjMxYThmMjVhNThkOGNhNWRkNGJlMjlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMDozMjoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi12b2xrOiB1cGdyYWRlIDEuMy4yOTYuMCAtPiAxLjQuMzA0LjEKCi0tLQogLi4uL3t2dWxr
YW4tdm9sa18xLjMuMjk2LjAuYmIgPT4gdnVsa2FuLXZvbGtfMS40LjMwNC4xLmJifSAgICAgIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZvbGtfMS4zLjI5Ni4wLmJi
ID0+IHZ1bGthbi12b2xrXzEuNC4zMDQuMS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuMy4yOTYuMC5iYiBiL21ldGEvcmVj
aXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS40LjMwNC4xLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2Fu
LXZvbGtfMS4zLjI5Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi12b2xrXzEuNC4zMDQuMS5iYgppbmRleCBiZWQ0MjkzNDkwLi5mNWUzYjViNzU1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuMy4y
OTYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEu
NC4zMDQuMS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTEyZTZhZjNhMGUyYTVlNWRiZjc3OTZhYTgy
YjY0NjI2IgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vemV1eC92b2xrLmdpdDticmFu
Y2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjU5ZDI2OTAwZjUzYzc2MjFhOGJh
OGFiMGUzZjE4ZDNiZDg4M2ZhOWEiCitTUkNSRVYgPSAiMGIxN2E3NjNiYTU2NDNlMzJkYTFiMjE1
MmY4MTQwNDYxYjNiNzM0NSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4xCgo=

--===============0738169760136100348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-volk: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-volk: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 396738 to 410684 (+4%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 388624 to 402570 (+4%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 672328 to 672344 (+0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.3.296.0" to "1.4.304.1"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.3.296.0 [default] to 1.4.304.1 [default]

--===============0738169760136100348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1882 targets, 50 skipped, 0 masked, 0 errors.
Removing 50 recipes from the core2-64 sysroot...done.
Removing 50 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0d1dd431a96dd4f78cdf4428b8367aa2c02a78d9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 126 Local 117 Mirrors 0 Missed 9 Current 191 (92% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 247 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 256 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 261 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 262 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 263 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 704 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_fetch)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/vulkan-headers/1.3.296.0/temp/log.do_packagedata_setscene.668029
NOTE: Running setscene task 267 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 268 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_package_setscene)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 272 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 705 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_unpack: Succeeded
NOTE: Running task 794 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_patch)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_patch: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_patch: Succeeded
NOTE: Running task 796 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 278 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 279 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 280 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 284 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 286 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 289 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 294 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 302 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 305 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 309 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 312 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 316 of 317 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 919 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.296.0.bb:do_packagedata)
NOTE: Running task 920 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.3.296.0-r0: task do_packagedata: Succeeded
NOTE: Running task 933 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_configure)
NOTE: Running task 935 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_configure: Succeeded
NOTE: Running task 936 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_compile)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_compile: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_compile: Succeeded
NOTE: Running task 937 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_install)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_install: Succeeded
NOTE: Running task 938 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_package)
NOTE: Running task 939 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package: Succeeded
NOTE: Running task 940 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_packagedata)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_packagedata unihash changed to 963264dcc60759b67dcf53f19fd7c0800c18a8d133452fc200acf1a23f69563f
NOTE: Setscene tasks completed
NOTE: Running task 941 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_create_spdx)
NOTE: Running task 942 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_package_write_ipk)
NOTE: Running task 943 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_package_write_deb)
NOTE: Running task 944 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_package_write_rpm)
NOTE: Running task 945 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_package_qa)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_create_spdx: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package_write_ipk: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package_write_deb: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package_qa: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 946 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_create_package_spdx)
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_create_package_spdx: Started
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_package_qa unihash changed to 5e6d25ba38e06677af3ac48ca9632929ced5e694f50b87a6d33700446a3d599f
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_package_write_ipk unihash changed to b40a1a16c271808c7446fe5442d59e68301b3bb604d35aeaf7b995a0136e09a5
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_package_write_rpm unihash changed to fd0812e16df12801f5116112322fd9321644636cf5285e134645d0e348e25d40
NOTE: recipe vulkan-volk-1.4.304.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_package_write_deb unihash changed to fd5e2106add24d6ff3b57a8a4cab6c2125d8e4ecaae90adb23ffcdaf13154768
NOTE: Running noexec task 947 of 947 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-volk_1.4.304.1.bb:do_build)
NOTE: Tasks Summary: Attempted 947 tasks of which 927 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.4.304.1-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.4.304.1-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.4.304.1-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.4.304.1-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.4.304.1-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.4.304.1-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.4.304.1-r0 to 0:1.3.296.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.296.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0738169760136100348==--

