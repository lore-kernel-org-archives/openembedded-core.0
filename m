Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D443C7113E
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.20185.1672605968138949701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=J78tkTaL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101856f15a390-5d0b19c1-9052-4ed7-b096-cfab08ce50dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v/0OdCmhJUH0QfNEHUiX0NmN2stdqf1aCO8HhCX66y0=;
	b=J78tkTaLss2mfSOmKtTPWy4e1ebVyHBcouLEJt+36NnhpwmqpHPmQj0xYBhvjYnD
	XymFHf2cc6/4FhH8Y2qAOVrQC/t2KkVtAsJ+q1hjLzx0YSu3RsWA5cF3Qd5RnzvuuXi
	DMaUg3WJvSQAmMcJ/wPzLslrR7k2J447yCMsMtqA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v/0OdCmhJUH0QfNEHUiX0NmN2stdqf1aCO8HhCX66y0=;
	b=fhHgO5fp13pM9+PRdYIyf4w0qGgPmumEnmkO3J32mg46xo6Mi7jZqN5ciixj/e+m
	k1cSDuyeTpwb+d7zuzc78YLbE/bMpSQtEfImWeBnvdDkMYBUV6VBUaoRN2MPeN0aQ2K
	pMYxq8phboH+D2iQv1MzpYtLro+VHemGt40+lSE8=
Content-Type: multipart/mixed; boundary="===============7252637731701872561=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 1.26.13 SUCCEEDED
Message-ID: <010101856f15a390-5d0b19c1-9052-4ed7-b096-cfab08ce50dd-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175271

--===============7252637731701872561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-urllib3* to *1.26.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-1.26.12-1.26.13.patch
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
--===============7252637731701872561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.12.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info

--===============7252637731701872561==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-1.26.12-1.26.13.patch"

RnJvbSA5NzM5ZmIwYzU5YWQ3MzhlOTk2NGJiOWFiZTliYzdlZThmOWJkYjUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMDo0NToyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXJsbGliMzogdXBncmFkZSAxLjI2LjEyIC0+IDEuMjYuMTMKCi0tLQogLi4uL3tweXRo
b24zLXVybGxpYjNfMS4yNi4xMi5iYiA9PiBweXRob24zLXVybGxpYjNfMS4yNi4xMy5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzEuMjYuMTIu
YmIgPT4gcHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xMi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmIKc2lt
aWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXVybGxpYjNfMS4yNi4xMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXVybGxpYjNfMS4yNi4xMy5iYgppbmRleCAxY2Q2OWJjYjEwLi43
YWY5NTExN2NmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXJsbGliM18xLjI2LjEyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11cmxsaWIzXzEuMjYuMTMuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9zaGF6b3cvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWMyODIzY2I5OTU0MzljOTg0ZmQ2
MmE5NzNkNzk4MTVjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2ZhOTZjZjQyM2U2OTg3OTk3
ZmMzMjZhZThkZjM5NmRiMmE4YjdjNjY3NzQ3ZDQ3ZGRkOGVjYmE5MWY0YTc0ZSIKK1NSQ19VUklb
c2hhMjU2c3VtXSA9ICJjMDgzZGQwZGNlNjhkYmZiZTExMjlkNTI3MWNiOTBmOTQ0N2RlYTdkNTIw
OTdjNmUwMTI2MTIwYzUyMWRkZWE4IgogCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMKIAotLSAK
Mi4zNy4zCgo=

--===============7252637731701872561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5d3377a3e6f69c399d37e6b05002a1a94c5688af"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 8 Mirrors 0 Missed 22 Current 363 (26% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 372 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running setscene task 373 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata_setscene)
NOTE: Running task 1163 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1165 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: Running task 1288 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: Running task 1395 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1397 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1398 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1399 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1400 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1401 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: Running task 1432 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: Running task 1450 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: Running task 1451 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 393 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: Running task 1452 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1453 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1454 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1455 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: Running task 1456 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: Running task 1476 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1477 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to df73dccbaae41c7bde76bc8bf392fd16fc0639b8ba74183e613e0791103195b1
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1478 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1479 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: Running task 1480 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1482 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: Running task 1483 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1484 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: Running task 1488 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1489 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1490 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1491 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: Running task 1494 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1496 tasks of which 1458 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.2252499
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============7252637731701872561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1691 targets, 48 skipped, 0 masked, 0 errors.
Removing 24 recipes from the core2-32 sysroot...done.
Removing 50 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5d3377a3e6f69c399d37e6b05002a1a94c5688af"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 218 Local 197 Mirrors 0 Missed 21 Current 189 (90% match, 94% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 194 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 197 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 200 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 201 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iso8601_1.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 205 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 207 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 209 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest-subtests_0.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 228 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 795 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 796 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: Running task 800 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_fetch)
NOTE: Running task 801 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_fetch)
NOTE: Running setscene task 234 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 855 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_fetch)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iso8601-1.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 856 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_fetch)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 253 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 254 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 257 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 893 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_unpack)
NOTE: Running task 894 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 896 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_unpack)
NOTE: Running task 897 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 901 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_unpack)
NOTE: Running task 902 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_unpack: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: Running task 903 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: Running task 904 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_patch)
NOTE: Running task 905 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_unpack: Succeeded
NOTE: Running task 906 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: Running task 916 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_patch: Succeeded
NOTE: Running task 917 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 918 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 271 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to df73dccbaae41c7bde76bc8bf392fd16fc0639b8ba74183e613e0791103195b1
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 279 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 944 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_patch)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 945 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_patch)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_patch: Succeeded
NOTE: Running task 948 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_gen_targets)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 289 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 290 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 407 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.66.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libstd-rs-1.66.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 296 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 298 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 304 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 407 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 310 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 324 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 332 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 342 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 348 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 364 of 407 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.6.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 369 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 376 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 382 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 385 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 404 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 407 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1357 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1393 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1405 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1406 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1445 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1448 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1511 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1512 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-cffi-1.15.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1513 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1514 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_configure)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1515 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_rust_create_wrappers)
NOTE: Running task 1517 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1518 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-cffi-1.15.1-r0: task do_configure: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: Running task 1519 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: Running task 1520 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1521 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 1522 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1523 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1524 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1526 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_compile: Succeeded
NOTE: Running task 1527 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1529 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1530 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1531 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1532 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: Running task 1533 of 1551 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_compile: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1533 tasks of which 1482 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.2267905
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============7252637731701872561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-urllib3: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.12.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-1.26.13.tar.gz"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 1.26.12 [default] to 1.26.13 [default]
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PV changed from "1.26.12" to "1.26.13"
packages/core2-32-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 899179 to 900718 (+0%)
Changes to packages/core2-32-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.11/site-packages/urllib3-1.26.12.dist-info moved to /usr/lib/python3.11/site-packages/urllib3-1.26.13.dist-info

--===============7252637731701872561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5d3377a3e6f69c399d37e6b05002a1a94c5688af"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 8 Mirrors 0 Missed 22 Current 363 (26% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 372 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running setscene task 373 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata_setscene)
NOTE: Running task 1163 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1164 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: Running task 1290 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: Running task 1398 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1400 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: Running task 1401 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1402 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1403 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1404 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: Running task 1439 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: Running task 1450 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: Running task 1451 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 393 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: Running task 1452 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1453 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: Running task 1454 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1455 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: Running task 1456 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1476 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1477 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to df73dccbaae41c7bde76bc8bf392fd16fc0639b8ba74183e613e0791103195b1
NOTE: Setscene tasks completed
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1478 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1479 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1480 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1482 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1483 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1484 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: Running task 1488 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1489 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: Running task 1490 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1491 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1492 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1493 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1494 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1496 tasks of which 1458 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.2247015
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============7252637731701872561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5d3377a3e6f69c399d37e6b05002a1a94c5688af"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 33 Local 11 Mirrors 0 Missed 22 Current 360 (33% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 369 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running setscene task 370 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata_setscene)
NOTE: Running task 1121 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1124 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: Running task 1345 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: Running task 1347 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1348 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1349 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1350 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1388 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: Running task 1400 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: Running task 1401 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 390 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 391 of 393 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-rust_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1402 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1403 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1404 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1405 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-setuptools-rust-native-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 393 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to df73dccbaae41c7bde76bc8bf392fd16fc0639b8ba74183e613e0791103195b1
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1416 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: Running task 1417 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1418 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: recipe cargo-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 393 of 393 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.66.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1425 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rust-native-1.66.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1477 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1478 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: Running task 1479 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1480 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1481 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1482 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: Running task 1484 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: Running task 1485 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1486 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1487 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1488 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1489 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1490 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1491 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1493 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1494 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: Running task 1496 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1496 tasks of which 1458 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.2241096
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============7252637731701872561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 71 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:5d3377a3e6f69c399d37e6b05002a1a94c5688af"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 8 Mirrors 0 Missed 22 Current 363 (26% match, 94% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 372 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_package_setscene)
NOTE: Running setscene task 373 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytz_2022.6.bb:do_packagedata_setscene)
NOTE: Running task 1163 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_fetch)
NOTE: Running task 1166 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_fetch)
NOTE: Running task 1288 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_compile_ptest_base)
NOTE: Running task 1398 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_install)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_fetch: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_fetch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 1400 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_unpack)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2022.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1401 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_unpack)
NOTE: Running task 1402 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1403 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1404 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install)
NOTE: Running task 1438 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-psutil_5.9.4.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_unpack: Succeeded
NOTE: Running task 1450 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_patch)
NOTE: Running task 1451 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_patch)
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Started
NOTE: recipe python3-psutil-5.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cryptography-38.0.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 393 of 393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography_38.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_patch: Succeeded
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install: Succeeded
NOTE: Running task 1452 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1453 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_deploy_source_date_epoch)
NOTE: Running task 1454 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_install: Succeeded
NOTE: Running task 1455 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_install_ptest_base)
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1456 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Started
NOTE: recipe python3-cryptography-38.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1476 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_install)
NOTE: Running task 1477 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_lic unihash changed to df73dccbaae41c7bde76bc8bf392fd16fc0639b8ba74183e613e0791103195b1
NOTE: recipe python3-certifi-2022.9.24-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-urllib3-1.26.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Started
NOTE: Running task 1478 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_configure)
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1479 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_configure)
NOTE: Running task 1480 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_package)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_configure: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_compile)
NOTE: Running task 1482 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_compile)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_install: Succeeded
NOTE: Running task 1483 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1484 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_configure)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Started
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.3.bb:do_compile)
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Started
NOTE: recipe python3-cffi-1.15.1-r0: task do_package: Succeeded
NOTE: Running task 1486 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-cffi_1.15.1.bb:do_packagedata)
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_compile: Succeeded
NOTE: Running task 1487 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_install)
NOTE: Running task 1488 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb:do_packagedata)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_compile: Succeeded
NOTE: recipe python3-cffi-1.15.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1489 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_install)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package: Succeeded
NOTE: Running task 1490 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.0.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1491 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb:do_package_write_rpm)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_package)
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_install: Succeeded
NOTE: Running task 1493 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_package)
NOTE: Running task 1494 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-22.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata)
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-1.26.13-r0: task do_package: Succeeded
NOTE: recipe python3-certifi-2022.9.24-r0: task do_packagedata: Failed
NOTE: recipe python3-cryptography-vectors-38.0.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1495 tasks of which 1458 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2022.12.7-r0 to 0:2022.9.24-r0) [version-going-backwards]
ERROR: python3-certifi-2022.9.24-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-certifi/2022.9.24-r0/temp/log.do_packagedata.2257924
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-certifi_2022.9.24.bb:do_packagedata) failed with exit code '1'

--===============7252637731701872561==--

