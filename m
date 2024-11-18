Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E205D60073
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4671.1731964625253513889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hvQyjwOz;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=aUQo3obH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019341230b87-d35a2aa2-83dd-422f-9a2b-6c9c145ac96d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Uq5GYb7e6aa4zhIspKQP11N3d4R+tUuiT7gyyYlW2LE=;
	b=hvQyjwOzEz/dYkLQ5wIsqmNC0HaTFlhr5WX41RU0ZDSvmqvarfFiYgulK8RIOrLu
	wpuiXgnKKRF5B6CLw+wmZSz5syYttlCgdNZIV5skcEIWa0VVXRYvJUNXJ1npJFvwuSq
	1DvxHObeGRUvQS4SY/I3CViPX9gj51ch9rPicuJk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964636;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Uq5GYb7e6aa4zhIspKQP11N3d4R+tUuiT7gyyYlW2LE=;
	b=aUQo3obHahcbm2PqFp9/b+ojuLK3wThXe+y+zoupfC7YWqhq2qyKCr+PO5L/usxr
	5BX3Yc6MO7p/++ZUJIK3dLNemYRT7gnJX7d+TeBwpf4h3OAO1gRlJMX6p8vpU46Zfre
	QGfYlEwA0M7uPf72h4zGpe9LVfa0gFR64ASjZj20=
Content-Type: multipart/mixed; boundary="===============4826644357256761070=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 1.9.1 SUCCEEDED
Message-ID: <0101019341230b87-d35a2aa2-83dd-422f-9a2b-6c9c145ac96d-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207289

--===============4826644357256761070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-poetry-core* to *1.9.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-1.9.0-1.9.1.patch
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
From c871fb9769fc55be9c4e1aa8dc472a02e8d8a32c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 01:10:54 +0000
Subject: [PATCH] python3-poetry-core: upgrade 1.9.0 -> 1.9.1

---
 ...ython3-poetry-core_1.9.0.bb => python3-poetry-core_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.9.0.bb => python3-poetry-core_1.9.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
rename to meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
index a073f8b069..173c3bdb68 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "fa7a4001eae8aa572ee84f35feb510b321bd652e5cf9293249d62853e1f935a2"
+SRC_URI[sha256sum] = "7a2d49214bf58b4f17f99d6891d947a9836c9899a67a5069f52d7b67217f61b8"
 
 inherit python_poetry_core pypi
 
-- 
2.44.1


--===============4826644357256761070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-1.9.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-1.9.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-1.9.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-1.9.1.dist-info

--===============4826644357256761070==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-1.9.0-1.9.1.patch"

RnJvbSBjODcxZmI5NzY5ZmM1NWJlOWM0ZTFhYThkYzQ3MmEwMmU4ZDhhMzJjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDE6MTA6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBvZXRyeS1jb3JlOiB1cGdyYWRlIDEuOS4wIC0+IDEuOS4xCgotLS0KIC4uLnl0aG9u
My1wb2V0cnktY29yZV8xLjkuMC5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzEuOS4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS45
LjAuYmIgPT4gcHl0aG9uMy1wb2V0cnktY29yZV8xLjkuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS45LjAu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS45
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzEuOS4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS45LjEuYmIKaW5kZXgg
YTA3M2Y4YjA2OS4uMTczYzNiZGI2OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzEuOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8xLjkuMS5iYgpAQCAtMTUsNyArMTUs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIlwKICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192
ZW5kb3IvdG9tbGkvTElDRU5TRTttZDU9YWFhYWYwODc5ZDE3ZGYwMTEwZDFhYThjOGM5ZjQ2ZjUg
XAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmE3YTQwMDFlYWU4YWE1NzJlZTg0ZjM1ZmVi
NTEwYjMyMWJkNjUyZTVjZjkyOTMyNDlkNjI4NTNlMWY5MzVhMiIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3YTJkNDkyMTRiZjU4YjRmMTdmOTlkNjg5MWQ5NDdhOTgzNmM5ODk5YTY3YTUwNjlmNTJk
N2I2NzIxN2Y2MWI4IgogCiBpbmhlcml0IHB5dGhvbl9wb2V0cnlfY29yZSBweXBpCiAKLS0gCjIu
NDQuMQoK

--===============4826644357256761070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-1.9.0.tar.gz;downloadfilename=poetry_core-1.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry_core/poetry_core-1.9.1.tar.gz;downloadfilename=poetry_core-1.9.1.tar.gz"
packages/core2-64-poky-linux/python3-poetry-core: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "1.9.0" to "1.9.1"
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 2290962 to 2291057 (+0%)
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 1.9.0 [default] to 1.9.1 [default]
packages/core2-64-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "1.9.0" to "1.9.1"
Changes to packages/core2-64-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-1.9.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-1.9.1.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.13/site-packages/poetry_core-1.9.0.dist-info moved to /usr/lib/python3.13/site-packages/poetry_core-1.9.1.dist-info

--===============4826644357256761070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1881 targets, 52 skipped, 0 masked, 0 errors.
Removing 23 recipes from the core2-64 sysroot...done.
Removing 58 recipes from the qemux86_64 sysroot...done.
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
workspace            = "tmp-auh-upgrades:d31c1b588209bc361fd698b48ff96bb89209654c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 454 Local 445 Mirrors 0 Missed 9 Current 234 (98% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 239 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 240 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 241 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 242 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 252 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 254 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 255 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 256 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 257 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 258 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 259 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 261 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 262 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 263 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pip-24.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pip-24.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pip-24.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pip-24.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 314 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pip-24.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 335 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 337 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_72.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 338 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-72.1.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pip/24.2/temp/log.do_packagedata_setscene.2954570
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-3.13.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 342 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_package_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.43.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 356 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 815 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_fetch)
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_fetch: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 375 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 923 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_unpack)
NOTE: recipe tzdata-2024b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 382 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 959 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_patch)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 420 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 431 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pip-24.2-r0: task do_package_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.50.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 500 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe curl-8.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.50-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 560 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 561 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-24.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pip-24.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 574 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 578 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 581 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 582 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 584 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 586 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 589 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 595 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 599 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 602 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 603 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 608 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 613 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 617 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 621 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 624 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 627 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 630 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 638 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 646 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 655 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 658 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 680 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 688 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1736 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1767 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pip_24.2.bb:do_packagedata)
NOTE: Running task 1898 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-24.2-r0: task do_packagedata: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pip-24.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1917 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_configure)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_configure: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_configure: Succeeded
NOTE: Running task 1918 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_compile)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_compile: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_compile: Succeeded
NOTE: Running task 1919 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_install)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_install: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_install: Succeeded
NOTE: Running task 1920 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_package)
NOTE: Running task 1921 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_populate_sysroot)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package: Succeeded
NOTE: Running task 1922 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_packagedata)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_packagedata: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_packagedata unihash changed to b4fafb02763f2555bca0564731445f59bb9da0970fe3f49222cf081c477446a2
NOTE: Setscene tasks completed
NOTE: Running task 1923 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_create_spdx)
NOTE: Running task 1924 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_package_write_ipk)
NOTE: Running task 1925 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_package_write_deb)
NOTE: Running task 1926 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_package_write_rpm)
NOTE: Running task 1927 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_package_qa)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_create_spdx: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package_qa: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1928 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_create_package_spdx)
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_create_package_spdx: Started
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_package_write_ipk unihash changed to 7a6e811aed0cbeea25608fe228d5610672b16726e652098ecec650da2696c7e8
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_package_qa unihash changed to a8af9b019f2fb8207049988db84ad4be7063517e19a5ff045e361646b56abd2c
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_package_write_deb unihash changed to e34674e3b8d27c0988186c3d1674dce5a5fb412fb0dc1cd2fd0ad5d7829e4b65
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-poetry-core-1.9.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_package_write_rpm unihash changed to 02eed31bd1970f91c1063b319d58b825ec6c4306cac091706496d61eba8a2387
NOTE: Running noexec task 1929 of 1929 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-poetry-core_1.9.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1929 tasks of which 1910 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 12 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pip-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-src went backwards which would break package feeds (from 0:24.3.1-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-dbg went backwards which would break package feeds (from 0:24.3.1-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-staticdev went backwards which would break package feeds (from 0:24.3.1-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-dev went backwards which would break package feeds (from 0:24.3.1-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-doc went backwards which would break package feeds (from 0:24.3.1-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip-locale went backwards which would break package feeds (from 0:24.3.1-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-24.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pip went backwards which would break package feeds (from 0:24.3.1-r0 to 0:24.2-r0) [version-going-backwards]
ERROR: python3-pip-24.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4826644357256761070==--

