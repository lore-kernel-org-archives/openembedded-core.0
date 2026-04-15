Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F140F428E9
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19820.1776261879823134887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QcaWxuN4;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pKnPZBxm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019d91756377-62d7f641-d6bc-4cd1-aab1-4776d876c93b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JBYUSsw6sEgidyGALFPvJo5NW1HNzgvrAW1DgZW9Mm4=;
	b=QcaWxuN4r4Itqbwv89w3GD8pPr7MPQ0kh1giZKv5U5e0Ti4AO4MyxMFXlnsqSYKh
	yiSvM0brR1Y/48+Fxr3l4/mRZUEcEiXdX7y/ofTWpPhams9ZwSXN9Xut9PXrlu4Yv9Z
	3QcUhNI/1qtKLY4/mv+eH+0bTY8OYN7LmfE1mZ2k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JBYUSsw6sEgidyGALFPvJo5NW1HNzgvrAW1DgZW9Mm4=;
	b=pKnPZBxmAwLykYswbAIVeSJNVWrLRae+b+7ecn9wy3651e/4Wxq+usqVgAhH3+MU
	oE4fF34XHG//hRwjEjAYLa6MF95bUz5Viz5avlCm4zv1uIqFGQ0LIm+lCRIodAIphhL
	YB9ZKTShQMezN9PiG6OcVWdxmtcy/ZAEqZWyC+E8=
Content-Type: multipart/mixed; boundary="===============1951740827141838963=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 10.0.5 FAILED
Message-ID: <0101019d91756377-62d7f641-d6bc-4cd1-aab1-4776d876c93b-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235248

--===============1951740827141838963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-setuptools-scm* to *10.0.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-9.2.2-10.0.5.patch
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
From 437a0294f827a48ae7fd7832dc33aeb1ffc925e6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:57:55 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 9.2.2 -> 10.0.5

---
 ...setuptools-scm_9.2.2.bb => python3-setuptools-scm_10.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_9.2.2.bb => python3-setuptools-scm_10.0.5.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
index d16d79c79f..1f488f92f0 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_9.2.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb
@@ -6,7 +6,7 @@ argument or in a SCM managed file."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=838c366f69b72c5df05c96dff79b35f2"
 
-SRC_URI[sha256sum] = "1c674ab4665686a0887d7e24c03ab25f24201c213e82ea689d2f3e169ef7ef57"
+SRC_URI[sha256sum] = "bbba8fe754516cdefd017f4456721775e6ef9662bd7887fb52ae26813d4838c3"
 
 PYPI_PACKAGE = "setuptools_scm"
 
-- 
2.47.1


--===============1951740827141838963==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-9.2.2-10.0.5.patch"

RnJvbSA0MzdhMDI5NGY4MjdhNDhhZTdmZDc4MzJkYzMzYWViMWZmYzkyNWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6NTc6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNldHVwdG9vbHMtc2NtOiB1cGdyYWRlIDkuMi4yIC0+IDEwLjAuNQoKLS0tCiAuLi5z
ZXR1cHRvb2xzLXNjbV85LjIuMi5iYiA9PiBweXRob24zLXNldHVwdG9vbHMtc2NtXzEwLjAuNS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNldHVwdG9vbHMt
c2NtXzkuMi4yLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1zY21fMTAuMC41LmJifSAoODglKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRv
b2xzLXNjbV85LjIuMi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZXR1cHRvb2xzLXNjbV8xMC4wLjUuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtc2NtXzkuMi4y
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29scy1zY21fMTAuMC41LmJiCmluZGV4IGQxNmQ3OWM3OWYuLjFmNDg4ZjkyZjAgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXNjbV85
LjIuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0dXB0
b29scy1zY21fMTAuMC41LmJiCkBAIC02LDcgKzYsNyBAQCBhcmd1bWVudCBvciBpbiBhIFNDTSBt
YW5hZ2VkIGZpbGUuIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT04MzhjMzY2ZjY5YjcyYzVkZjA1Yzk2ZGZmNzliMzVmMiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjFjNjc0YWI0NjY1Njg2YTA4ODdkN2UyNGMwM2FiMjVmMjQyMDFjMjEz
ZTgyZWE2ODlkMmYzZTE2OWVmN2VmNTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYmJiYThmZTc1
NDUxNmNkZWZkMDE3ZjQ0NTY3MjE3NzVlNmVmOTY2MmJkNzg4N2ZiNTJhZTI2ODEzZDQ4MzhjMyIK
IAogUFlQSV9QQUNLQUdFID0gInNldHVwdG9vbHNfc2NtIgogCi0tIAoyLjQ3LjEKCg==

--===============1951740827141838963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-84afec03db3b6770337fc5d9fe2de59cdff8ef0a"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:84afec03db3b6770337fc5d9fe2de59cdff8ef0a"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 175 Local 157 Mirrors 0 Missed 18 Current 587 (89% match, 97% complete)
done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 636 of 762 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_populate_lic_setscene)
NOTE: Running setscene task 757 of 762 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 759 of 762 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 760 of 762 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 761 of 762 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 762 of 762 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_recipe_qa_setscene)
NOTE: Running task 1654 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1871 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_create_recipe_spdx)
NOTE: recipe python3-pytest-9.0.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1886 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_unpack)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1888 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_recipe_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 1890 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_fetch)
NOTE: recipe python3-pytest-9.0.2-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1891 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_unpack)
NOTE: Running task 1892 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_fetch: Started
NOTE: Running task 1893 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_patch)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_fetch: Succeeded
NOTE: Running task 1894 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_unpack)
NOTE: Running task 1895 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1896 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_patch)
NOTE: recipe python3-pytest-9.0.2-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_unpack: Succeeded
NOTE: Running task 1897 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_patch)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_patch: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_patch: Succeeded
NOTE: Running task 1903 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_configure)
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 1928 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_compile: Started
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_configure: Succeeded
NOTE: Running task 1905 of 1928 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile)
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 15, in <module>
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/sources/setuptools_scm-10.0.5/src/setuptools_scm/__init__.py", line 8, in <module>
|     from vcs_versioning import Configuration
| ModuleNotFoundError: No module named 'vcs_versioning'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.2676265:154 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/sources/setuptools_scm-10.0.5'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.2676265, line 154
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.2676265, line 149
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.2676265, line 158
NOTE: recipe python3-setuptools-scm-native-10.0.5-r0: task do_compile: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 389, in <module>
|     main()
|     ~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 373, in main
|     json_out["return_val"] = hook(**hook_input["kwargs"])
|                              ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/pyproject_hooks/_in_process/_in_process.py", line 143, in get_requires_for_build_wheel
|     return hook(config_settings)
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 333, in get_requires_for_build_wheel
|     return self._get_build_requires(config_settings, requirements=[])
|            ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 301, in _get_build_requires
|     self.run_setup()
|     ~~~~~~~~~~~~~~^^
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/recipe-sysroot-native/usr/lib/python3.14/site-packages/setuptools/build_meta.py", line 317, in run_setup
|     exec(code, locals())
|     ~~~~^^^^^^^^^^^^^^^^
|   File "<string>", line 15, in <module>
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/sources/setuptools_scm-10.0.5/src/setuptools_scm/__init__.py", line 8, in <module>
|     from vcs_versioning import Configuration
| ModuleNotFoundError: No module named 'vcs_versioning'
| 
| ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.2676285:151 exit 1 from 'pyproject-build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/sources/setuptools_scm-10.0.5'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.2676285, line 151
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.2676285, line 146
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.2676285, line 163
NOTE: recipe python3-setuptools-scm-10.0.5-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1905 tasks of which 1889 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415085740.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260415085740.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/log.do_compile.2676265
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/log.do_compile.2676285
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: python3-setuptools-scm-native-10.0.5-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/run.do_compile.2676265' failed with exit code 1
ERROR: python3-setuptools-scm-10.0.5-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/run.do_compile.2676285' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-setuptools-scm-native/10.0.5/temp/log.do_compile.2676265
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-setuptools-scm/10.0.5/temp/log.do_compile.2676285
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools-scm_10.0.5.bb:do_compile) failed with exit code '1'

--===============1951740827141838963==--

