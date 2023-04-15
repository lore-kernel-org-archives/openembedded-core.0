Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8461C87FE4
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.13532.1681581686460611776
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Q6qIDRAF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101878614395e-be9a0946-d7fe-40ba-9d54-0f854b0ff35a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=sCqnBhtIwFM0/Xnu+0Typ0Dm4xR8IKW6+z0E+NRHuK4=;
	b=Q6qIDRAFGJjnJSrLLh1rCEQ7EozHj8x1WB33k5S8fFoQbS81DFXKew6JBEX124p/
	MK2vGIbo9LlI02UX0qMdBpCI0qQJJ+E6qxKhTFvD6r9W4mhnMiqWcbdykXI846oJROn
	Dm/rzQQponJuE542QfqW9cMDnjCjbbnM498a9eug=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=sCqnBhtIwFM0/Xnu+0Typ0Dm4xR8IKW6+z0E+NRHuK4=;
	b=Y/UpHCXjcBSKhvFDU+cf8/C4l0ndYebu+HNhq09Rfqf/BJrQ+HgANwXphssW7VHG
	ltkK8zWN9VHcIlQhwqSXfqlCZHzqUqs/pr+0Rrwo03alpUG5k5amoZIo8JvJwMylN9w
	FS4k3PzpQrJrAUAvxA+g6A80t2W5ISax82uqjyDU=
Content-Type: multipart/mixed; boundary="===============6447466840135883163=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 7.3.1 SUCCEEDED
Message-ID: <010101878614395e-be9a0946-d7fe-40ba-9d54-0f854b0ff35a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180073

--===============6447466840135883163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *7.3.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-7.2.2-7.3.1.patch
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
--===============6447466840135883163==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-7.2.2-7.3.1.patch"

RnJvbSBiMTFkZTVhOGZlYzQyYjEwY2UzNGE2NDBmMDI2OThhZTkwNGYxMzllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTA6MzQ6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdDogdXBncmFkZSA3LjIuMiAtPiA3LjMuMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5dGVzdF83LjIuMi5iYiA9PiBweXRob24zLXB5dGVzdF83LjMuMS5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dGVzdF83LjIuMi5iYiA9PiBw
eXRob24zLXB5dGVzdF83LjMuMS5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzcuMi4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF83LjMuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDky
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0
XzcuMi4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHl0ZXN0XzcuMy4xLmJiCmluZGV4IDRlMmM4NmY2NDEuLjk5NjU4NDRkMWEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfNy4yLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF83LjMuMS5iYgpA
QCAtNSw3ICs1LDcgQEAgREVTQ1JJUFRJT04gPSAiVGhlIHB5dGVzdCBmcmFtZXdvcmsgbWFrZXMg
aXQgZWFzeSB0byB3cml0ZSBzbWFsbCB0ZXN0cywgeWV0IHNjYWwKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YmQyN2U0MWI2NTUwZmUwZmM0
NTM1NmQxZDgxZWUzN2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjOTlhYjBjNzNhY2ViMDUw
ZjY4OTI5YmM5M2FmMTlhYjZkYjA1NTg3OTFjNmEwNzE1NzIzYWJlOWQwYWRlOWQ0IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjQzNGFmYWZkNzhiMWQ3OGVkMGFkZGYxNjBhZDJiNzdhMzBkMzVkNGJk
ZjhhZjIzNGZlNjIxOTE5ZDllZDE1ZTMiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29s
cy1zY20tbmF0aXZlIgogCi0tIAoyLjM5LjIKCg==

--===============6447466840135883163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1799 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f8fc9759a2003f355eeb117b6c8716750a5d82d"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 54 Local 12 Mirrors 0 Missed 42 Current 341 (22% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 356 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1094752
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 394 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 948 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 949 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 950 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1018 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_fetch)
NOTE: Running task 1090 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 1092 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1093 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 1094 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_fetch)
NOTE: Running task 1095 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_fetch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: Running task 1357 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1358 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1359 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1360 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1361 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1362 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1363 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1364 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_unpack)
NOTE: Running task 1365 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: Running task 1367 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1368 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running task 1369 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_unpack)
NOTE: Running task 1370 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_unpack)
NOTE: Running task 1371 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: Running task 1375 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: Running task 1376 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1379 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: Running task 1380 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1381 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1382 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1383 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: Running task 1384 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_patch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1386 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_patch)
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 395 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1396 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: Running task 1397 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_patch)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1399 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1400 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1402 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1403 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1406 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Started
NOTE: Running task 1407 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_write_rpm)
NOTE: Running task 1408 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1409 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1410 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic unihash changed to 5c4f43bad1b6c7533e7b04037aa6df082d5a98c53495f9c40267d0d698e9e847
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1411 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1412 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: Running task 1413 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1414 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_configure)
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1415 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: Running task 1416 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1417 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: Running task 1419 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: Running task 1420 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1421 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1422 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: Running task 1423 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 1424 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1426 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: Running task 1427 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Started
NOTE: Running task 1428 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_compile)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1429 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: Running task 1430 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Succeeded
NOTE: Running task 1431 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_install)
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1433 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: Running task 1434 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1435 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1436 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package)
NOTE: Running task 1438 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Started
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1439 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1440 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1441 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1442 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1443 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1444 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_install)
NOTE: Running task 1446 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: Running task 1447 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1448 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1450 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: Running task 1452 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1453 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1454 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package)
NOTE: Running task 1455 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_sysroot)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1455 tasks of which 1358 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-packaging/23.0-r0/temp/log.do_packagedata.1099550
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata) failed with exit code '1'

--===============6447466840135883163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.2.2.tar.gz;downloadfilename=pytest-7.2.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-7.3.1.tar.gz;downloadfilename=pytest-7.3.1.tar.gz"
packages/core2-32-poky-linux/python3-pytest: PV changed from "7.2.2" to "7.3.1"
packages/core2-32-poky-linux/python3-pytest: PKGV changed from 7.2.2 [default] to 7.3.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "7.2.2" to "7.3.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 7.2.2 [default] to 7.3.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "7.2.2" to "7.3.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 7.2.2 [default] to 7.3.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "7.2.2" to "7.3.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 7.2.2 [default] to 7.3.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "7.2.2" to "7.3.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 7.2.2 [default] to 7.3.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PV changed from "7.2.2" to "7.3.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 7.2.2 [default] to 7.3.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "7.2.2" to "7.3.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 7.2.2 [default] to 7.3.1 [default]
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2613851 to 2642878 (+1%)
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PV changed from "7.2.2" to "7.3.1"
packages/core2-32-poky-linux/python3-pytest/python3-pytest: PKGV changed from 7.2.2 [default] to 7.3.1 [default]
Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.2.2.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.3.1.dist-info

--===============6447466840135883163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 74 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f8fc9759a2003f355eeb117b6c8716750a5d82d"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 54 Local 12 Mirrors 0 Missed 42 Current 341 (22% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 356 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1121699
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 394 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 948 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 949 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 950 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 1018 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_fetch)
NOTE: Running task 1090 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1091 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_fetch)
NOTE: Running task 1092 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 1094 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 1095 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_fetch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: Running task 1357 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1358 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1359 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1360 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1361 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1362 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1363 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1364 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_unpack)
NOTE: Running task 1365 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1366 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1367 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_unpack)
NOTE: Running task 1368 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running task 1369 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: Running task 1370 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_unpack)
NOTE: Running task 1371 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1373 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: Running task 1375 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1376 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1379 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: Running task 1380 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Started
NOTE: Running task 1381 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1382 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1383 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1384 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1385 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_patch)
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1386 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_patch)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 395 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1396 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1397 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_patch)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 1399 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1400 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1401 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1402 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1403 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1405 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1406 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1407 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1408 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic unihash changed to 5c4f43bad1b6c7533e7b04037aa6df082d5a98c53495f9c40267d0d698e9e847
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1409 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1410 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1411 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1412 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1413 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1414 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_configure)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1415 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: Running task 1416 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_configure)
NOTE: Running task 1417 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Started
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1419 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: Running task 1420 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: Running task 1421 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_compile)
NOTE: Running task 1422 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1423 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1424 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: Running task 1425 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Started
NOTE: Running task 1426 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1427 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1428 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: Running task 1429 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Succeeded
NOTE: Running task 1430 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_install)
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: Running task 1431 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Started
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1433 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1434 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1435 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1436 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package)
NOTE: Running task 1437 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: Running task 1438 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1439 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1440 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1441 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_install)
NOTE: Running task 1442 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1443 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_install)
NOTE: Running task 1445 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: Running task 1446 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: Running task 1447 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: Running task 1448 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 1450 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1452 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1453 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1454 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package)
NOTE: Running task 1455 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_sysroot)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1455 tasks of which 1358 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-packaging/23.0-r0/temp/log.do_packagedata.1126487
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata) failed with exit code '1'

--===============6447466840135883163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.11/site-packages/pytest-7.2.2.dist-info moved to /usr/lib/python3.11/site-packages/pytest-7.3.1.dist-info

--===============6447466840135883163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
Removing 34 recipes from the core2-32 sysroot...done.
Removing 49 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f8fc9759a2003f355eeb117b6c8716750a5d82d"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 209 Local 167 Mirrors 0 Missed 42 Current 182 (79% match, 89% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 183 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 190 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: Running task 667 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 668 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 669 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 694 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_fetch)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 733 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 734 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 735 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_fetch)
NOTE: Running task 736 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 737 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: Running setscene task 238 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 840 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_unpack)
NOTE: Running task 841 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 842 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 843 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 844 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 845 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1130314
NOTE: Running task 846 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_unpack)
NOTE: Running task 847 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running setscene task 242 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 243 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: Running setscene task 244 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb:do_package_setscene)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: Running setscene task 245 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 248 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: Running setscene task 249 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 250 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 852 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: Running task 853 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: Running task 854 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: Running task 855 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_patch)
NOTE: Running task 862 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: Running task 863 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 864 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_patch)
NOTE: Running task 865 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: Running task 866 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 257 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: Running task 877 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 878 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 879 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 880 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 881 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 882 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 883 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 884 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running task 885 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 269 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.68.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic unihash changed to 5c4f43bad1b6c7533e7b04037aa6df082d5a98c53495f9c40267d0d698e9e847
NOTE: Running task 912 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_patch)
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_package_setscene: Started
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Succeeded
NOTE: Running task 917 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.68-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 287 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 288 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 289 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 290 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 291 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 295 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 300 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 309 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 315 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 317 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 320 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 327 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 350 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 356 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 364 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 366 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 369 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+1d5750b95c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 389 of 391 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1256 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1257 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1258 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1294 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1341 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1342 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1343 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1344 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1345 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1353 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1390 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1391 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1393 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1394 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: Running task 1395 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1396 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1397 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1398 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_configure)
NOTE: Running task 1399 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_configure)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1400 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_configure)
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1401 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: Running task 1402 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1403 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: Running task 1404 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: Running task 1405 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Succeeded
NOTE: Running task 1406 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_compile)
NOTE: Running task 1407 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1408 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_compile)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 1409 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 1410 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: Running task 1411 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Started
NOTE: Running task 1412 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1413 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Started
NOTE: Running task 1414 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Succeeded
NOTE: Running task 1415 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_install)
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1417 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1418 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: Running task 1419 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1420 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: Running task 1421 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Succeeded
NOTE: Running task 1422 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: Running task 1423 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Started
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1424 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1425 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1426 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: Running task 1428 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: Running task 1430 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1431 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1432 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1433 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Succeeded
NOTE: Running task 1434 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata)
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Started
NOTE: Running task 1435 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: Running task 1436 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1438 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Succeeded
NOTE: Running task 1439 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1440 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_sysroot)
NOTE: Running task 1441 of 1459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Failed
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1441 tasks of which 1343 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-packaging/23.0-r0/temp/log.do_packagedata.1140191
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata) failed with exit code '1'

--===============6447466840135883163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 57 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f8fc9759a2003f355eeb117b6c8716750a5d82d"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 54 Local 12 Mirrors 0 Missed 42 Current 341 (22% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 356 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 948 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 949 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 950 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 1018 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_fetch)
NOTE: Running task 1090 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 1091 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 1092 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1094 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_fetch)
NOTE: Running task 1095 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1103293
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 394 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Started
NOTE: Running task 1185 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1186 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1187 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1188 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1189 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1190 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1191 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_unpack)
NOTE: Running task 1192 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1193 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running task 1194 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: Running task 1195 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1196 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_unpack)
NOTE: Running task 1205 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_unpack)
NOTE: Running task 1275 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1276 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1277 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1278 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: Running task 1280 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Started
NOTE: Running task 1371 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: Running task 1372 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: Running task 1377 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: Running task 1378 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: Running task 1379 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_patch)
NOTE: Running task 1380 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: Running task 1381 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: Running task 1382 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: Running task 1383 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_patch)
NOTE: Running task 1384 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Started
NOTE: Running task 1387 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_patch)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1388 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1389 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1390 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Succeeded
NOTE: Running task 1391 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1392 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1393 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 395 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1394 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1395 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1396 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1397 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1407 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic unihash changed to 5c4f43bad1b6c7533e7b04037aa6df082d5a98c53495f9c40267d0d698e9e847
NOTE: Setscene tasks completed
NOTE: Running task 1408 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1409 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1410 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: Running task 1411 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_configure)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1412 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: Running task 1413 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: Running task 1414 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: Running task 1415 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: Running task 1416 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1417 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Started
NOTE: Running task 1418 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Succeeded
NOTE: Running task 1419 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Succeeded
NOTE: Running task 1420 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_compile)
NOTE: Running task 1421 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1422 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1423 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1424 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 1426 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: Running task 1427 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1428 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: Running task 1429 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Succeeded
NOTE: Running task 1430 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_install)
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: Running task 1431 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1433 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1434 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1435 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1436 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: Running task 1438 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: Running task 1439 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1440 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1441 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 1442 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1443 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Succeeded
NOTE: Running task 1444 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_install)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1445 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1446 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1447 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: Running task 1448 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: Running task 1450 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata)
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1451 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: Running task 1452 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Succeeded
NOTE: Running task 1453 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: Running task 1454 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package)
NOTE: Running task 1455 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_sysroot)
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1456 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Failed
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1456 tasks of which 1358 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-packaging/23.0-r0/temp/log.do_packagedata.1108108
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata) failed with exit code '1'

--===============6447466840135883163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f8fc9759a2003f355eeb117b6c8716750a5d82d"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 54 Local 12 Mirrors 0 Missed 42 Current 341 (22% match, 89% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 356 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 948 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_fetch)
NOTE: Running task 949 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_fetch)
NOTE: Running task 950 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_fetch)
NOTE: Running task 1018 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1112527
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 394 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1052 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_unpack)
NOTE: Running task 1053 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_unpack)
NOTE: Running task 1054 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_unpack)
NOTE: Running task 1055 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1056 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1057 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1058 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_unpack)
NOTE: Running task 1097 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_fetch)
NOTE: Running task 1098 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_fetch)
NOTE: Running task 1099 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_fetch)
NOTE: Running task 1100 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_fetch)
NOTE: Running task 1102 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_fetch)
NOTE: Running task 1170 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Started
NOTE: Running task 1366 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_unpack: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1367 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_patch)
NOTE: recipe python3-py-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_fetch: Succeeded
NOTE: Running task 1368 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_patch)
NOTE: Running task 1369 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_patch)
NOTE: Running task 1370 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_patch)
NOTE: Running task 1371 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_unpack)
NOTE: Running task 1372 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_unpack)
NOTE: Running task 1373 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_unpack)
NOTE: Running task 1374 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_unpack)
NOTE: Running task 1375 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_unpack)
NOTE: Running task 1376 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1377 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1378 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1379 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1380 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1381 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1383 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_patch)
NOTE: recipe python3-packaging-23.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 1384 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_patch)
NOTE: Running task 1385 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_patch)
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1386 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_patch)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Started
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_patch: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1387 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1388 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1389 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 395 of 395 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-7.3.1-r0: task do_patch: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1390 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1391 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_unpack: Succeeded
NOTE: Running task 1392 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_patch)
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Started
NOTE: Running task 1402 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1403 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1404 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_patch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_lic unihash changed to 5c4f43bad1b6c7533e7b04037aa6df082d5a98c53495f9c40267d0d698e9e847
NOTE: Setscene tasks completed
NOTE: Running task 1406 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-py-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 1407 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1408 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-py-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1409 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1410 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1411 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_configure_ptest_base)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1413 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_configure_ptest_base)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1414 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1415 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-7.3.1-r0: task do_configure: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1416 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_compile)
NOTE: Running task 1417 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Started
NOTE: Running task 1418 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_configure)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-22.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1419 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_configure)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 1420 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1421 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1422 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_configure)
NOTE: Running task 1423 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1424 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile)
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Started
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_compile)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_configure: Succeeded
NOTE: Running task 1426 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_compile)
NOTE: Running task 1427 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_compile)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1428 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_compile)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1429 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_compile)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Started
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile: Succeeded
NOTE: Running task 1430 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_compile_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1431 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_compile_ptest_base)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_compile: Succeeded
NOTE: Running task 1432 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_install)
NOTE: recipe python3-packaging-23.0-r0: task do_compile: Succeeded
NOTE: Running task 1433 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1434 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_install: Started
NOTE: Running task 1435 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1436 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_install)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_install: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package)
NOTE: Running task 1438 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install: Succeeded
NOTE: Running task 1439 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_install_ptest_base)
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1440 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_install_ptest_base)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Started
NOTE: recipe python3-packaging-23.0-r0: task do_package: Started
NOTE: Running task 1441 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_package)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1442 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_install)
NOTE: Running task 1443 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1444 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_package)
NOTE: Running task 1445 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_package)
NOTE: recipe python3-setuptools-67.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1446 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Started
NOTE: Running task 1447 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Started
NOTE: recipe python3-py-1.11.0-r0: task do_compile: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Started
NOTE: Running task 1448 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_install)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Started
NOTE: recipe python3-py-1.11.0-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 1449 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_install: Succeeded
NOTE: Running task 1450 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package)
NOTE: recipe python3-packaging-23.0-r0: task do_package: Succeeded
NOTE: Running task 1451 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata)
NOTE: Running task 1452 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_populate_sysroot)
NOTE: recipe python3-py-1.11.0-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Started
NOTE: Running task 1453 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata)
NOTE: Running task 1454 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_package)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Started
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1455 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_package)
NOTE: recipe python3-py-1.11.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1456 of 1474 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-23.0-r0: task do_packagedata: Failed
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_package: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_install: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_package: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1456 tasks of which 1358 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.3.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.1-r0 to 0:23.0-r0) [version-going-backwards]
ERROR: python3-packaging-23.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-packaging/23.0-r0/temp/log.do_packagedata.1117838
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.0.bb:do_packagedata) failed with exit code '1'

--===============6447466840135883163==--

