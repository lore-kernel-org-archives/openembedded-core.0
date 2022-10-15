Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DEAC64E93
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.24538.1665871394223375402
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LbSbzeQE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010183ddac32cc-876aa836-762e-4ce0-86ad-c9135a9269e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NLZ0DuLR2cVWKJwvq/QjOspNZkbeV9fLBsXzW/7lexg=;
	b=LbSbzeQEs1Jutm2DIG9ijQdGPcCRNY/ZkBDtirBBx/43gRTpXAFrh+MN0+sZXeNP
	9CvwKDztjJX9RTtPoJimHdowcVE0EsI9p8ZZWyfsgNXGqVIWAzJ2SbOmSgFl4l78NvN
	tYfcckvhT25ILadf6KkmsBzHLgOtMHMxNOnsiYgA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NLZ0DuLR2cVWKJwvq/QjOspNZkbeV9fLBsXzW/7lexg=;
	b=b5mzGM/60h2Nnc7PyHSfw7G9hLg5MgbQOJfRkDGCRzEuFCQbp2sqNQT4Hkvytu0r
	T/UxpKny2YgXhcN4cC+u5t+gd86CbuJRkTcaPxtLXBrLrYFmBH/xAo29cxZ2NPdT+Gb
	y0RzD8Dhm8Z2gpuQ+MTnh48hs4wDHJsP8viXlAjc=
Content-Type: multipart/mixed; boundary="===============5384169797269520484=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-git: upgrading to 3.1.29 SUCCEEDED
Message-ID: <01010183ddac32cc-876aa836-762e-4ce0-86ad-c9135a9269e7-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171785

--===============5384169797269520484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-git* to *3.1.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-git-upgrade-3.1.27-3.1.29.patch
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
--===============5384169797269520484==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-git-upgrade-3.1.27-3.1.29.patch"

RnJvbSA3NjhkODk1YzUxYjdhYmQ3MTlkMjZmMmM2NjRlODJiZmUxZTc3MGFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6MTA6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWdpdDogdXBncmFkZSAzLjEuMjcgLT4gMy4xLjI5CgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtZ2l0XzMuMS4yNy5iYiA9PiBweXRob24zLWdpdF8zLjEuMjkuYmJ9ICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZ2l0XzMuMS4yNy5iYiA9PiBweXRo
b24zLWdpdF8zLjEuMjkuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMjcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4yOS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZ2l0XzMuMS4yNy5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMjku
YmIKaW5kZXggZmIxYmFlOGY4ZS4uZTc1ZjhiNGUzZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMjcuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWdpdF8zLjEuMjkuYmIKQEAgLTEyLDcgKzEyLDcgQEAg
UFlQSV9QQUNLQUdFID0gIkdpdFB5dGhvbiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRv
b2xzX2J1aWxkX21ldGEKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFjODg1Y2U4MDllOGJhMmQ4
OGEyOWJlZmViMzg1ZmNlYTA2MzM4ZDM2NDA3MTJiNTljYTYyM2MyMjBiYjU3MDQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiY2MzNmJmYzRhM2Y5MTNlNjY4MDVhMjhlODQ3MDNlNDE5ZDljMjY0YzEw
NzdlNTM3YjU0ZjBlMWFmODVkYmVmZCIKIAogREVQRU5EUyArPSAiICR7UFlUSE9OX1BOfS1naXRk
YiIKIAotLSAKMi4zMS4xCgo=

--===============5384169797269520484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.10/site-packages/GitPython-3.1.27.dist-info moved to /usr/lib/python3.10/site-packages/GitPython-3.1.29.dist-info

--===============5384169797269520484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1663 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e049dd5599c267f859e9062201b5d9009b145c9"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 4 Mirrors 0 Missed 24 Current 313 (14% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 958 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 959 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 981 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 1033 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 1040 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_fetch)
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe git-2.37.3-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: Running task 1216 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 1217 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 1218 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: Running task 1219 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.37.3-r0: task do_fetch: Succeeded
NOTE: Running task 1220 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1221 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 1222 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_unpack)
NOTE: Running task 1223 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe git-2.37.3-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1224 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: Running task 1225 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: Running task 1226 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1228 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: Running task 1229 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1230 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1231 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_patch)
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1232 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1233 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.37.3-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to 63323ef7a0d4ca275dc83f2360f9506dc2ac92600950871f8846a8755d59a9f3
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.37.3-r0: task do_patch: Succeeded
NOTE: Running task 1234 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1235 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: Running task 1236 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1237 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_configure)
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1238 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: Running task 1239 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: recipe git-2.37.3-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1240 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: Running task 1241 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1243 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1244 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: Running task 1245 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1246 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1247 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: Running task 1248 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1249 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: Running task 1250 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1251 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: Running task 1252 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: recipe git-2.37.3-r0: task do_configure: Succeeded
NOTE: Running task 1253 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: Running task 1254 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_compile)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.37.3-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1255 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1256 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: Running task 1257 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: Running task 1258 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1259 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1260 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: Running task 1261 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_package)
NOTE: Running task 1262 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_package: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_package: Succeeded
NOTE: Running task 1263 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_packagedata)
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Started
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.3-r0: task do_compile: Succeeded
NOTE: Running task 1264 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_install)
NOTE: recipe git-2.37.3-r0: task do_install: Started
NOTE: recipe git-2.37.3-r0: task do_install: Succeeded
NOTE: Running task 1265 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_package)
NOTE: recipe git-2.37.3-r0: task do_package: Started
NOTE: recipe git-2.37.3-r0: task do_package: Succeeded
NOTE: Running task 1266 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata)
NOTE: recipe git-2.37.3-r0: task do_packagedata: Started
NOTE: recipe git-2.37.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1266 tasks of which 1210 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/git/2.37.3-r0/temp/log.do_packagedata.1164882
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata) failed with exit code '1'

--===============5384169797269520484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e049dd5599c267f859e9062201b5d9009b145c9"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 4 Mirrors 0 Missed 24 Current 313 (14% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 958 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 959 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 981 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 1033 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 1040 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_fetch)
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe git-2.37.3-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: recipe git-2.37.3-r0: task do_fetch: Succeeded
NOTE: Running task 1216 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 1217 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 1218 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: Running task 1219 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1220 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1221 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 1222 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_unpack)
NOTE: Running task 1223 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe git-2.37.3-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1224 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: Running task 1225 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: Running task 1226 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: Running task 1228 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1229 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1230 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe git-2.37.3-r0: task do_unpack: Succeeded
NOTE: Running task 1231 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_patch)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1232 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1233 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.37.3-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to 63323ef7a0d4ca275dc83f2360f9506dc2ac92600950871f8846a8755d59a9f3
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.37.3-r0: task do_patch: Succeeded
NOTE: Running task 1234 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1235 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: Running task 1236 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: Running task 1237 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_configure)
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1238 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: Running task 1239 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: recipe git-2.37.3-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1240 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: Running task 1241 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1243 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1244 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: Running task 1245 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1246 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1247 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: Running task 1248 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1249 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: Running task 1250 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1251 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe git-2.37.3-r0: task do_configure: Succeeded
NOTE: Running task 1252 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_compile)
NOTE: recipe git-2.37.3-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: Running task 1253 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: Running task 1254 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1255 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1256 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: Running task 1257 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: Running task 1258 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1259 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1260 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: Running task 1261 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_package)
NOTE: Running task 1262 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_package: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_package: Succeeded
NOTE: Running task 1263 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_packagedata)
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Started
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.3-r0: task do_compile: Succeeded
NOTE: Running task 1264 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_install)
NOTE: recipe git-2.37.3-r0: task do_install: Started
NOTE: recipe git-2.37.3-r0: task do_install: Succeeded
NOTE: Running task 1265 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_package)
NOTE: recipe git-2.37.3-r0: task do_package: Started
NOTE: recipe git-2.37.3-r0: task do_package: Succeeded
NOTE: Running task 1266 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata)
NOTE: recipe git-2.37.3-r0: task do_packagedata: Started
NOTE: recipe git-2.37.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1266 tasks of which 1210 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/git/2.37.3-r0/temp/log.do_packagedata.1189078
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata) failed with exit code '1'

--===============5384169797269520484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e049dd5599c267f859e9062201b5d9009b145c9"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 4 Mirrors 0 Missed 24 Current 313 (14% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 958 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 959 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 981 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 1033 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 1040 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_fetch)
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe git-2.37.3-r0: task do_fetch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: recipe git-2.37.3-r0: task do_fetch: Succeeded
NOTE: Running task 1216 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 1217 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 1218 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: Running task 1219 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1220 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1221 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 1222 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_unpack)
NOTE: Running task 1223 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: recipe git-2.37.3-r0: task do_unpack: Started
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1224 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: Running task 1225 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: Running task 1226 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1228 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: Running task 1229 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1230 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.37.3-r0: task do_unpack: Succeeded
NOTE: Running task 1231 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_patch)
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.37.3-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1232 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1233 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to 63323ef7a0d4ca275dc83f2360f9506dc2ac92600950871f8846a8755d59a9f3
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.37.3-r0: task do_patch: Succeeded
NOTE: Running task 1234 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_deploy_source_date_epoch)
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1235 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: Running task 1236 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1237 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_configure)
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1238 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: Running task 1239 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: recipe git-2.37.3-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1240 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1241 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1243 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1244 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: Running task 1245 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1246 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1247 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: Running task 1248 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: Running task 1249 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1250 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1251 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: recipe git-2.37.3-r0: task do_configure: Succeeded
NOTE: Running task 1252 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: Running task 1253 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: Running task 1254 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_compile)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe git-2.37.3-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1255 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1256 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: Running task 1257 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: Running task 1258 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1259 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1260 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: Running task 1261 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_package)
NOTE: Running task 1262 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_package: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_package: Succeeded
NOTE: Running task 1263 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_packagedata)
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Started
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.3-r0: task do_compile: Succeeded
NOTE: Running task 1264 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_install)
NOTE: recipe git-2.37.3-r0: task do_install: Started
NOTE: recipe git-2.37.3-r0: task do_install: Succeeded
NOTE: Running task 1265 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_package)
NOTE: recipe git-2.37.3-r0: task do_package: Started
NOTE: recipe git-2.37.3-r0: task do_package: Succeeded
NOTE: Running task 1266 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata)
NOTE: recipe git-2.37.3-r0: task do_packagedata: Started
NOTE: recipe git-2.37.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1266 tasks of which 1210 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/git/2.37.3-r0/temp/log.do_packagedata.1201110
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata) failed with exit code '1'

--===============5384169797269520484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 51 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e049dd5599c267f859e9062201b5d9009b145c9"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 4 Mirrors 0 Missed 24 Current 313 (14% match, 92% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 958 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 959 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 981 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 1033 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 1040 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_fetch)
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe git-2.37.3-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe git-2.37.3-r0: task do_fetch: Succeeded
NOTE: Running task 1216 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 1217 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 1218 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: Running task 1219 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1220 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1221 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 1222 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_unpack)
NOTE: Running task 1223 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1224 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: Running task 1225 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: Running task 1226 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.3-r0: task do_unpack: Started
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: Running task 1227 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1228 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: Running task 1229 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1230 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe git-2.37.3-r0: task do_unpack: Succeeded
NOTE: Running task 1231 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_patch)
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1232 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1233 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe git-2.37.3-r0: task do_patch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to 63323ef7a0d4ca275dc83f2360f9506dc2ac92600950871f8846a8755d59a9f3
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe git-2.37.3-r0: task do_patch: Succeeded
NOTE: Running task 1234 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1235 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1236 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1237 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: Running task 1238 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_configure)
NOTE: Running task 1239 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe git-2.37.3-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1240 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1241 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: Running task 1242 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1243 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1244 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: Running task 1245 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1246 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1247 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1248 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: Running task 1249 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: Running task 1250 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1251 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: Running task 1252 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: Running task 1253 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe git-2.37.3-r0: task do_configure: Succeeded
NOTE: Running task 1254 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_compile)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1255 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe git-2.37.3-r0: task do_compile: Started
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1256 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: Running task 1257 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: Running task 1258 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1259 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1260 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: Running task 1261 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_package)
NOTE: Running task 1262 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_package: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_package: Succeeded
NOTE: Running task 1263 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_packagedata)
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Started
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.3-r0: task do_compile: Succeeded
NOTE: Running task 1264 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_install)
NOTE: recipe git-2.37.3-r0: task do_install: Started
NOTE: recipe git-2.37.3-r0: task do_install: Succeeded
NOTE: Running task 1265 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_package)
NOTE: recipe git-2.37.3-r0: task do_package: Started
NOTE: recipe git-2.37.3-r0: task do_package: Succeeded
NOTE: Running task 1266 of 1270 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata)
NOTE: recipe git-2.37.3-r0: task do_packagedata: Started
NOTE: recipe git-2.37.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1266 tasks of which 1210 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/git/2.37.3-r0/temp/log.do_packagedata.1176986
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata) failed with exit code '1'

--===============5384169797269520484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 24 recipes from the core2-32 sysroot...done.
Removing 44 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e049dd5599c267f859e9062201b5d9009b145c9"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 187 Local 163 Mirrors 0 Missed 24 Current 150 (87% match, 92% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 152 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 157 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 158 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 178 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 179 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 180 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 183 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 643 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_fetch)
NOTE: Running task 644 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_fetch)
NOTE: Running task 651 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_fetch)
NOTE: Running task 652 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_fetch)
NOTE: Running task 653 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_fetch)
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.37.3-r0: task do_fetch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_fetch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_fetch: Succeeded
NOTE: recipe git-2.37.3-r0: task do_fetch: Succeeded
NOTE: Running task 692 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_unpack)
NOTE: Running task 693 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_unpack)
NOTE: Running task 694 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_unpack)
NOTE: Running task 695 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_unpack)
NOTE: Running task 696 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_unpack)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Started
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Started
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Started
NOTE: recipe git-2.37.3-r0: task do_unpack: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_unpack: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 697 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_patch)
NOTE: Running task 698 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 699 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_patch)
NOTE: Running task 700 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_patch)
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 194 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata_setscene)
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 195 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 197 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Started
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_patch: Succeeded
NOTE: Running task 718 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_patch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_patch: Succeeded
NOTE: Running task 719 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 720 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 721 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_deploy_source_date_epoch)
NOTE: Running task 722 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic)
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe git-2.37.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Started
NOTE: Running task 723 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 213 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe git-2.37.3-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_populate_lic: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_lic unihash changed to 63323ef7a0d4ca275dc83f2360f9506dc2ac92600950871f8846a8755d59a9f3
NOTE: recipe python3-gitdb-4.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 219 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe python3-async-0.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 226 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 227 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 228 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 229 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 230 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 233 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 235 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 237 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 238 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 239 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 241 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 242 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe git-2.37.3-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 756 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 246 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 253 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 257 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 259 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 265 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 269 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe git-2.37.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 292 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 304 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 312 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 314 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 316 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 324 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 331 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 334 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 337 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1106 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1107 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1167 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe git-2.37.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1220 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_configure)
NOTE: recipe python3-smmap-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1221 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_configure)
NOTE: Running task 1222 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_configure)
NOTE: recipe git-2.37.3-r0: task do_configure: Started
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_configure: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1223 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_compile)
NOTE: Running task 1224 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_compile)
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-async-0.6.2-r0: task do_compile: Succeeded
NOTE: recipe python3-smmap-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1225 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_install)
NOTE: Running task 1226 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_install)
NOTE: recipe python3-async-0.6.2-r0: task do_install: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_install: Succeeded
NOTE: Running task 1227 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_populate_sysroot)
NOTE: Running task 1228 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_package)
NOTE: Running task 1229 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_populate_sysroot)
NOTE: Running task 1230 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_package)
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Started
NOTE: recipe python3-async-0.6.2-r0: task do_package: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1231 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1232 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_configure)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-gitdb-4.0.9-r0: task do_configure: Succeeded
NOTE: Running task 1233 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_compile)
NOTE: recipe python3-async-0.6.2-r0: task do_package: Succeeded
NOTE: Running task 1234 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-smmap_5.0.0.bb:do_packagedata)
NOTE: Running task 1235 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-async_0.6.2.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-smmap-5.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-async-0.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.3-r0: task do_configure: Succeeded
NOTE: Running task 1236 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_compile)
NOTE: recipe git-2.37.3-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_compile: Succeeded
NOTE: Running task 1237 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_install)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_install: Succeeded
NOTE: Running task 1238 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package)
NOTE: Running task 1239 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_populate_sysroot)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1240 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1241 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_configure)
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Started
NOTE: recipe python3-git-3.1.29-r0: task do_configure: Succeeded
NOTE: Running task 1242 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_compile)
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package: Succeeded
NOTE: Running task 1243 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_packagedata)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_packagedata: Succeeded
NOTE: Running task 1244 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-gitdb_4.0.9.bb:do_package_write_rpm)
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-gitdb-4.0.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-git-3.1.29-r0: task do_compile: Succeeded
NOTE: Running task 1245 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_install)
NOTE: recipe python3-git-3.1.29-r0: task do_install: Started
NOTE: recipe python3-git-3.1.29-r0: task do_install: Succeeded
NOTE: Running task 1246 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_package)
NOTE: Running task 1247 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_populate_sysroot)
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Started
NOTE: recipe python3-git-3.1.29-r0: task do_package: Started
NOTE: recipe python3-git-3.1.29-r0: task do_populate_sysroot: Succeeded
NOTE: recipe git-2.37.3-r0: task do_compile: Succeeded
NOTE: Running task 1248 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_install)
NOTE: recipe git-2.37.3-r0: task do_install: Started
NOTE: recipe python3-git-3.1.29-r0: task do_package: Succeeded
NOTE: Running task 1249 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-git_3.1.29.bb:do_packagedata)
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Started
NOTE: recipe python3-git-3.1.29-r0: task do_packagedata: Succeeded
NOTE: recipe git-2.37.3-r0: task do_install: Succeeded
NOTE: Running task 1250 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_package)
NOTE: recipe git-2.37.3-r0: task do_package: Started
NOTE: recipe git-2.37.3-r0: task do_package: Succeeded
NOTE: Running task 1251 of 1255 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata)
NOTE: recipe git-2.37.3-r0: task do_packagedata: Started
NOTE: recipe git-2.37.3-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1251 tasks of which 1195 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-src went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dbg went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package gitweb went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-tk went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-perltools went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-staticdev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-dev went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-doc went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-locale went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: QA Issue: Package version for package git-bash-completion went backwards which would break package feeds (from 0:2.38.0-r0 to 0:2.37.3-r0) [version-going-backwards]
ERROR: git-2.37.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/git/2.37.3-r0/temp/log.do_packagedata.1218222
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/git/git_2.37.3.bb:do_packagedata) failed with exit code '1'

--===============5384169797269520484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-git: PKGV changed from 3.1.27 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git: PV changed from "3.1.27" to "3.1.29"
packages/core2-32-poky-linux/python3-git: SRC_URI changed from "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.27.tar.gz" to "https://files.pythonhosted.org/packages/source/G/GitPython/GitPython-3.1.29.tar.gz"
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PKGV changed from 3.1.27 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dbg: PV changed from "3.1.27" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-dev: PKGV changed from 3.1.27 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-dev: PV changed from "3.1.27" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-doc: PKGV changed from 3.1.27 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-doc: PV changed from "3.1.27" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-locale: PKGV changed from 3.1.27 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-locale: PV changed from "3.1.27" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-src: PKGV changed from 3.1.27 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-src: PV changed from "3.1.27" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PKGV changed from 3.1.27 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git-staticdev: PV changed from "3.1.27" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git: PKGV changed from 3.1.27 [default] to 3.1.29 [default]
packages/core2-32-poky-linux/python3-git/python3-git: PV changed from "3.1.27" to "3.1.29"
packages/core2-32-poky-linux/python3-git/python3-git: PKGSIZE changed from 1036525 to 1047209 (+1%)
Changes to packages/core2-32-poky-linux/python3-git (sysroot):
  /usr/lib/python3.10/site-packages/GitPython-3.1.27.dist-info moved to /usr/lib/python3.10/site-packages/GitPython-3.1.29.dist-info

--===============5384169797269520484==--

