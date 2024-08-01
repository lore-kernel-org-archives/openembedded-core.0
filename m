Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3027BC5473F
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.75481.1722536822847967021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NynlHNkr;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=X/Ppv20e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101910f3204cb-0ded0d41-517d-4515-9e6b-a4294af39929-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fTMFioy0Nff2u19r698ABgcOy+g6Y88mh3OSvHoCW5U=;
	b=NynlHNkrEPT0mhmbl8TUqjebewD5r3YVT3X7r+bYANEzS/ExYoks7s1tA/I7McVr
	58FbsfHCsXgbxtjZaDrD4zcZT8pOv5yb6eq9zXiGfYh9UnjOCT0mNnIMyEpJUBuowXg
	YrfNUAoL/oLtuC0aXPXhLb7uNo4B0kwXL4TbZAm8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fTMFioy0Nff2u19r698ABgcOy+g6Y88mh3OSvHoCW5U=;
	b=X/Ppv20erNhwdpTVp+TxKaBBc4NLcf662t406HPc4f69RyKpq9rcAbS4hvG73jFX
	UrhfCmJCLyYTqlMfijIOYYYGm+thLRAxK2q+xUA0lm167b1k2Cc87oZGMVqubg+vOvu
	9HElEshcfok1zdn1tvI2Z93D8rBveXcfNOswoCp4=
Content-Type: multipart/mixed; boundary="===============7143345679128435021=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>, 
	Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cryptodev-tests,cryptodev-linux,cryptodev-module: upgrading to
 1.14,1.14,1.14 FAILED
Message-ID: <010101910f3204cb-0ded0d41-517d-4515-9e6b-a4294af39929-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202769

--===============7143345679128435021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *cryptodev-tests,cryptodev-linux,cryptodev-module* to *1.14,1.14,1.14* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cryptodev-tests-cryptodev-linux-cryptodev-module-upg.patch
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
From f63e2e799fc7b49eec9154ea3c0a2439b06d2c46 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 08:00:12 +0000
Subject: [PATCH] cryptodev-tests,cryptodev-linux,cryptodev-module: upgrade
 1.13 -> 1.14,1.13 -> 1.14,1.13 -> 1.14

---
 meta/recipes-kernel/cryptodev/cryptodev.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 64a9c2926b..8d0aad4a01 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux;branch=master;protocol=https \
            "
-SRCREV = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
-PV = "1.13+git${SRCPV}"
+SRCREV = "135cbff90af2ba97d88f1472be595ce78721972c"
+PV = "1.14"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============7143345679128435021==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cryptodev-tests-cryptodev-linux-cryptodev-module-upg.patch"

RnJvbSBmNjNlMmU3OTlmYzdiNDllZWM5MTU0ZWEzYzBhMjQzOWIwNmQyYzQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAwODowMDoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGNy
eXB0b2Rldi10ZXN0cyxjcnlwdG9kZXYtbGludXgsY3J5cHRvZGV2LW1vZHVsZTogdXBncmFkZQog
MS4xMyAtPiAxLjE0LDEuMTMgLT4gMS4xNCwxLjEzIC0+IDEuMTQKCi0tLQogbWV0YS9yZWNpcGVz
LWtlcm5lbC9jcnlwdG9kZXYvY3J5cHRvZGV2LmluYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9j
cnlwdG9kZXYvY3J5cHRvZGV2LmluYwppbmRleCA2NGE5YzI5MjZiLi44ZDBhYWQ0YTAxIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2NyeXB0b2Rldi9jcnlwdG9kZXYuaW5jCisrKyBi
L21ldGEvcmVjaXBlcy1rZXJuZWwvY3J5cHRvZGV2L2NyeXB0b2Rldi5pbmMKQEAgLTEwLDggKzEw
LDggQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1
ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9jcnlw
dG9kZXYtbGludXgvY3J5cHRvZGV2LWxpbnV4O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMg
XAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiYmI4YmM3Y2Y2MGQyYzBiMDk3YzhiM2IwZTgwN2Y4
MDViNTc3YTUzZiIKLVBWID0gIjEuMTMrZ2l0JHtTUkNQVn0iCitTUkNSRVYgPSAiMTM1Y2JmZjkw
YWYyYmE5N2Q4OGYxNDcyYmU1OTVjZTc4NzIxOTcyYyIKK1BWID0gIjEuMTQiCiAKIFMgPSAiJHtX
T1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMAoK

--===============7143345679128435021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (917 cached, 3 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-ec648a03beb1629c1c67c18152d6212003c40077"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:ec648a03beb1629c1c67c18152d6212003c40077"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 135 Local 99 Mirrors 0 Missed 36 Current 226 (73% match, 90% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 860 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_recipe_qa)
NOTE: Running task 900 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_recipe_qa)
NOTE: Running task 901 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb:do_recipe_qa)
NOTE: recipe cryptodev-linux-1.14-r0: task do_recipe_qa: Started
NOTE: recipe cryptodev-tests-1.14-r0: task do_recipe_qa: Started
NOTE: recipe cryptodev-module-1.14-r0: task do_recipe_qa: Started
NOTE: recipe cryptodev-module-1.14-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_recipe_qa unihash changed to 99e35f6e3fc22b56ff33996015c32354722bee32027d517fbd35949f350203e1
NOTE: recipe cryptodev-tests-1.14-r0: task do_recipe_qa: Succeeded
NOTE: recipe cryptodev-linux-1.14-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_recipe_qa unihash changed to 365bdd6bee82ddac182c9fa8b9849906e727dd25af2b6fa10abb2ec15847cc80
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb:do_recipe_qa unihash changed to 341f69fe40bc2c4fd2b3261d7b2e87b5254afb1ccc8270898beb7a8e03eec65a
NOTE: Setscene tasks completed
NOTE: Running task 1012 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_fetch)
NOTE: Running task 1013 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_fetch)
NOTE: Running task 1014 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb:do_fetch)
NOTE: recipe cryptodev-linux-1.14-r0: task do_fetch: Started
NOTE: recipe cryptodev-tests-1.14-r0: task do_fetch: Started
NOTE: recipe cryptodev-module-1.14-r0: task do_fetch: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 1015 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_unpack)
NOTE: Running task 1016 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-linux-1.14-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 1017 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_unpack)
NOTE: recipe cryptodev-module-1.14-r0: task do_unpack: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 1018 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_patch)
NOTE: Running task 1019 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_collect_spdx_deps)
NOTE: recipe cryptodev-linux-1.14-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_patch: Succeeded
NOTE: Running task 1020 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1021 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_populate_lic)
NOTE: recipe cryptodev-linux-1.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cryptodev-linux-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_populate_lic: Started
NOTE: recipe cryptodev-module-1.14-r0: task do_unpack: Succeeded
NOTE: Running task 1022 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch)
NOTE: recipe cryptodev-tests-1.14-r0: task do_fetch: Succeeded
NOTE: Running task 1023 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb:do_unpack)
NOTE: Running task 1024 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.14-r0: task do_patch: Started
NOTE: recipe cryptodev-tests-1.14-r0: task do_unpack: Started
NOTE: recipe cryptodev-tests-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cryptodev-linux-1.14-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_deploy_source_date_epoch unihash changed to 873f12d800b091995002c83c186a6d2dbeac4bc0908602dd68ba8ebc66875b13
NOTE: recipe cryptodev-tests-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-tests-1.14-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_populate_lic unihash changed to 94a25660f1725d6100742fef147b68f7888944a45236a5d1cc645dd30659dceb
NOTE: Setscene tasks completed
NOTE: Running task 1025 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_configure)
NOTE: Running task 1026 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb:do_patch)
NOTE: Running task 1027 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb:do_collect_spdx_deps)
NOTE: recipe cryptodev-tests-1.14-r0: task do_patch: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_configure: Started
NOTE: recipe cryptodev-tests-1.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe cryptodev-tests-1.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cryptodev-linux-1.14-r0: task do_configure: Succeeded
NOTE: Running noexec task 1028 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_compile)
NOTE: Running task 1029 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_install)
NOTE: recipe cryptodev-linux-1.14-r0: task do_install: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_install: Succeeded
NOTE: Running task 1030 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package)
NOTE: Running task 1031 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_populate_sysroot)
NOTE: recipe cryptodev-linux-1.14-r0: task do_populate_sysroot: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_package: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_populate_sysroot unihash changed to eaf0e41249a3b8a6832c67f88e649f259c115f807a8ebc6216c988ecbcd5b1ab
NOTE: Setscene tasks completed
NOTE: Running task 1032 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe cryptodev-module-1.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cryptodev-module-1.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cryptodev-linux-1.14-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package unihash changed to bac55fec0029b6ec2b3643d38a50b93bacf66f8a19f958aeff8eeca246fa82dd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_packagedata became valid
NOTE: Running setscene task 360 of 361 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_packagedata_setscene)
NOTE: recipe cryptodev-linux-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1034 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_create_spdx)
NOTE: Running task 1035 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package_write_ipk)
NOTE: Running task 1036 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package_write_deb)
NOTE: Running task 1037 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package_write_rpm)
NOTE: Running task 1038 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package_qa)
NOTE: recipe cryptodev-linux-1.14-r0: task do_create_spdx: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_package_write_ipk: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_package_write_deb: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_package_write_rpm: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_package_qa: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 1039 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_collect_spdx_deps)
NOTE: Running task 1040 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_create_package_spdx)
NOTE: recipe cryptodev-linux-1.14-r0: task do_package_qa: Succeeded
NOTE: recipe cryptodev-module-1.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe cryptodev-linux-1.14-r0: task do_create_package_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package_qa unihash changed to 4958fc0d931656ae8de7bbcbbcd8467caf4947e507ea1504af75acd8b203bdfa
NOTE: recipe cryptodev-linux-1.14-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package_write_ipk unihash changed to 8762c3fb07bf984a95222aa158874a3dd9e602403e3f6698878f76605e52b37f
NOTE: recipe cryptodev-linux-1.14-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package_write_deb unihash changed to c3372eb369824fdc777e24e9568c313b13738f90bff5564bea792c6fcdfd0274
NOTE: recipe cryptodev-module-1.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cryptodev-linux-1.14-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_package_write_rpm unihash changed to a84f8fd36917b29cf276a8ac3f987fcebcc7c9d5b289d6bbf2c68fabd79b542f
NOTE: recipe cryptodev-linux-1.14-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 1041 of 1071 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-linux_1.13.bb:do_build)
NOTE: recipe cryptodev-module-1.14-r0: task do_patch: Failed
NOTE: recipe cryptodev-tests-1.14-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1041 tasks of which 1009 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801075952.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801075952.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cryptodev-module-1.14-r0 do_patch: Applying patch '0001-Disable-installing-header-file-provided-by-another-p.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/cryptodev-module/1.14/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/cryptodev-module/1.14/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Disable-installing-header-file-provided-by-another-p.patch
patching file Makefile
Hunk #1 FAILED at 36.
1 out of 1 hunk FAILED -- rejects in file Makefile
Patch 0001-Disable-installing-header-file-provided-by-another-p.patch can be reverse-applied

stderr: ')
ERROR: cryptodev-tests-1.14-r0 do_patch: Applying patch '0001-tests-Makefile-do-not-use-Werror.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cryptodev-tests/1.14/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cryptodev-tests/1.14/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-tests-Makefile-do-not-use-Werror.patch
patching file tests/Makefile
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file tests/Makefile
Patch 0001-tests-Makefile-do-not-use-Werror.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/qemux86_64-poky-linux/cryptodev-module/1.14/temp/log.do_patch.919630
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-module_1.13.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/cryptodev-tests/1.14/temp/log.do_patch.919853
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/cryptodev/cryptodev-tests_1.13.bb:do_patch) failed with exit code '1'

--===============7143345679128435021==--

