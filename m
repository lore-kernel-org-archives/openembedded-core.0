Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B1FC48BC4
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 13:12:08 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4625.1704114719290561820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 05:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FZyCp4Az;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GU50E1ar;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018cc52708f7-a3a921af-1faa-4ff2-9ff3-e991b2616cb4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f+CbsbC70cDB9KWlkSOIjCYEQFpm0/m1jNhAVwfDmqI=;
	b=FZyCp4AzCM7LufcAtbRoh2Zo85sDRYwZFvJB2JNbxX25676G2JMSxQ/VgI8Ho3yt
	SD/zA705uLaiC+TBogDUhrz7POwG8M3LXX8A6QsSUwJQbTzF2e+xZ0JDC5bw9+E4xrU
	FFpK2ZDMmtV/KYFaQfkvZimE8pbUukAXIQhCUDBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1704114719;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f+CbsbC70cDB9KWlkSOIjCYEQFpm0/m1jNhAVwfDmqI=;
	b=GU50E1arANBZS2u0fxmLg+6J8C92atjVhb5D3VYceCovAcHbVKRnMQ7vjWNrBiF9
	yIV3pUn6VPFxQ49WgLAMu0NUtyIlc0TPyDKt/2xSR3IfyfzVT0eQhUcGsJQIGmzIUpB
	d5P2PdRwEya1DGBxfONuJcPt3aEragZddOQI0oVA=
Content-Type: multipart/mixed; boundary="===============3107115226158536221=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 23.2.0 FAILED
Message-ID: <0101018cc52708f7-a3a921af-1faa-4ff2-9ff3-e991b2616cb4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Jan 2024 13:11:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.01.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 13:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193120

--===============3107115226158536221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-attrs* to *23.2.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-attrs-upgrade-23.1.0-23.2.0.patch
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
From 768cb331c3eeed9bbb8a3100a67b0fcc3dfdf9be Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Jan 2024 06:43:13 +0000
Subject: [PATCH] python3-attrs: upgrade 23.1.0 -> 23.2.0

---
 .../python/{python3-attrs_23.1.0.bb => python3-attrs_23.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_23.1.0.bb => python3-attrs_23.2.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-attrs_23.1.0.bb
rename to meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index 314053de08..e00e152015 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc50e015"
+SRC_URI[sha256sum] = "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30"
 
 inherit pypi python_hatchling
 
-- 
2.42.0


--===============3107115226158536221==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-23.1.0-23.2.0.patch"

RnJvbSA3NjhjYjMzMWMzZWVlZDliYmI4YTMxMDBhNjdiMGZjYzNkZmRmOWJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBKYW4gMjAyNCAwNjo0MzoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYXR0cnM6IHVwZ3JhZGUgMjMuMS4wIC0+IDIzLjIuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWF0dHJzXzIzLjEuMC5iYiA9PiBweXRob24zLWF0dHJzXzIzLjIuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWF0dHJzXzIzLjEuMC5iYiA9PiBw
eXRob24zLWF0dHJzXzIzLjIuMC5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNfMjMuMS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzIzLjIuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgy
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNf
MjMuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
YXR0cnNfMjMuMi4wLmJiCmluZGV4IDMxNDA1M2RlMDguLmUwMGUxNTIwMTUgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yMy4xLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzIzLjIuMC5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5hdHRycy5vcmcvIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01ZTU1NzMx
ODI0Y2Y5MjA1Y2ZhYmVhYjlhMDYwMDg4NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYyNzk4
MzZkNTgxNTEzYTI2ZjFiZjIzNWY5YWNkMzMzYmM5MTE1NjgzZjE0ZjdlOGZhZTQ2Yzk4ZmM1MGUw
MTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTM1ZGMzYjUyOWMyNjJmNmNmNzZlNTA4NzdkMzVh
NGJkM2MxZGUxOTRmZDQxZjQ3YTJiN2FlOGYxOTk3MWYzMCIKIAogaW5oZXJpdCBweXBpIHB5dGhv
bl9oYXRjaGxpbmcKIAotLSAKMi40Mi4wCgo=

--===============3107115226158536221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1850 entries from dependency cache.
Parsing recipes...done.
Parsing of 913 .bb files complete (912 cached, 1 parsed). 1847 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-0028f489e3d1dd6eec91905c7ab8387ea6ed6e64"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0028f489e3d1dd6eec91905c7ab8387ea6ed6e64"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 329 Local 316 Mirrors 0 Missed 13 Current 364 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 400 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 547 of 693 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 548 of 693 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 693 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 550 of 693 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 922 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_recipe_qa)
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 599 of 693 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.21.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 647 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 654 of 693 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 656 of 693 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatch-vcs_0.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1195 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_fetch)
NOTE: recipe python3-hatchling-native-1.21.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_fetch: Started
NOTE: recipe python3-hatchling-native-1.21.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-hatch-fancy-pypi-readme-native-23.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: Running task 1384 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1425 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 677 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 679 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1432 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1433 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_populate_lic)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_populate_lic: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 693 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1821 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1967 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-23.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1971 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_configure)
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1972 of 1983 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_compile)
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Missing dependencies:
| 	hatch-fancy-pypi-readme>=23.2.0
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/23.2.0/temp/run.do_compile.86679:156 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/23.2.0/dist /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/23.2.0/attrs-23.2.0'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/23.2.0/temp/run.do_compile.86679, line 156
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/23.2.0/temp/run.do_compile.86679, line 151
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/23.2.0/temp/run.do_compile.86679, line 167
NOTE: recipe python3-attrs-23.2.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1972 tasks of which 1962 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101064251.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240101064251.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-attrs-23.2.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/23.2.0/temp/run.do_compile.86679', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-attrs/23.2.0/temp/log.do_compile.86679
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_compile) failed with exit code '1'

--===============3107115226158536221==--

