Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DFEC04AB1
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.102666.1697399114305380349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=EuNBqhtC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=A8t4qCUe;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b34df0aad-bc92c286-fcab-481a-932e-908085817da6-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qDpf+Z6mRggSzUT8wt4fnxwQAER8SiX4ZR7QqofIhPo=;
	b=EuNBqhtCtj+Ld9iVi2t3uY8SecbuV/xwov1u7Lw3FxPvpT50hCwtzS++NtQxYjzu
	kJ2zhu8NfpODX3M7armJVr7/cQtwj5BGeCYRBCFKH06jB3J4XtJHVQzlUD9gLqoHk/h
	1B1NbIsITlKHJ/VCLF/p2nPCYB2Q8y9SUbhG/+w8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399114;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qDpf+Z6mRggSzUT8wt4fnxwQAER8SiX4ZR7QqofIhPo=;
	b=A8t4qCUefu7Fvns1KiWtHu9q4BAl5OHQXwH+EqVNynzPcs1VUOFevq16EFSpb9sL
	3aiKX77g+S0Yza9BjpQFDL/zVvbn2LFkHvkVjqy0FjyxGgD0c4qeAJ7M5aeQls+dRF/
	J72g1jDhMp2i7cakMsVFx88F2fG+9zvKP57lO7YY=
Content-Type: multipart/mixed; boundary="===============8940555827797704161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.2.8 SUCCEEDED
Message-ID: <0101018b34df0aad-bc92c286-fcab-481a-932e-908085817da6-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189197

--===============8940555827797704161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wcwidth* to *0.2.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.2.6-0.2.8.patch
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
From 1e699d63058e4479db3a6a8d7fa860afd7b4024d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 12:41:17 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.2.6 -> 0.2.8

---
 .../{python3-wcwidth_0.2.6.bb => python3-wcwidth_0.2.8.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.6.bb => python3-wcwidth_0.2.8.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
index fbd008c13d..e906a6d73a 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "a5220780a404dbe3353789870978e472cfe477761f06ee55077256e509b156d0"
+SRC_URI[sha256sum] = "8705c569999ffbb4f6a87c6d1b80f324bd6db952f5eb0b95bc07517f4c1813d4"
 
 inherit pypi setuptools3 ptest
 
-- 
2.39.2


--===============8940555827797704161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.2.6-0.2.8.patch"

RnJvbSAxZTY5OWQ2MzA1OGU0NDc5ZGIzYTZhOGQ3ZmE4NjBhZmQ3YjQwMjRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTI6NDE6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC4yLjYgLT4gMC4yLjgKCi0tLQogLi4uL3tweXRob24z
LXdjd2lkdGhfMC4yLjYuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuMi44LmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13Y3dpZHRoXzAuMi42LmJiID0+
IHB5dGhvbjMtd2N3aWR0aF8wLjIuOC5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjIuNi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuMi44LmJiCnNpbWlsYXJpdHkgaW5k
ZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13
Y3dpZHRoXzAuMi42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2N3aWR0aF8wLjIuOC5iYgppbmRleCBmYmQwMDhjMTNkLi5lOTA2YTZkNzNhIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjIu
Ni5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8w
LjIuOC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2px
dWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2YjRiNTJjYiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImE1MjIwNzgwYTQwNGRiZTMzNTM3ODk4NzA5NzhlNDcyY2ZlNDc3NzYx
ZjA2ZWU1NTA3NzI1NmU1MDliMTU2ZDAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODcwNWM1Njk5
OTlmZmJiNGY2YTg3YzZkMWI4MGYzMjRiZDZkYjk1MmY1ZWIwYjk1YmMwNzUxN2Y0YzE4MTNkNCIK
IAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzIHB0ZXN0CiAKLS0gCjIuMzkuMgoK

--===============8940555827797704161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 50 skipped, 0 masked, 0 errors.
Removing 26 recipes from the core2-32 sysroot...done.
Removing 68 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 435 Local 420 Mirrors 0 Missed 15 Current 330 (96% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 331 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_10.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 360 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pluggy-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 386 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_recipe_qa)
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 386 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 396 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-packaging/23.1/temp/log.do_packagedata_setscene.2680751
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 416 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_setscene)
NOTE: recipe python3-pluggy-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-68.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 417 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 420 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_setscene)
NOTE: Running setscene task 442 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 449 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 521 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 540 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 473 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 503 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 570 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 538 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1035 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_patch)
NOTE: Running task 1076 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1099 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 542 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 543 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 554 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1291 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1292 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1294 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_lic)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 575 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1316 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 595 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_lic unihash changed to bbc6d6a47b2661008f9a6cbb9228aff0cdd24172c30332fcfb42f18dfbc882df
NOTE: recipe python3-pytest-7.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1332 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 624 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running setscene task 625 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 627 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 630 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 632 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1348 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 649 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.43.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 670 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 673 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 675 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 676 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 684 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 686 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 688 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 703 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 705 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1435 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 724 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 731 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 737 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running setscene task 745 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1488 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 755 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 756 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 65b6804f18b5304f7fc6bf26f99eb080c6989c489e5ea6be5abbbd4524adf075
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash ce7d3de0f4af530b38158b4216c7dbb774ddac9b89ea9a5127f0d6791990878f to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '1528d25a4ebd7d29feb3bd4d84d71f623df02f706bbc26372121b67e1a7b1352', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'ce7d3de0f4af530b38158b4216c7dbb774ddac9b89ea9a5127f0d6791990878f'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 1528d25a4ebd7d29feb3bd4d84d71f623df02f706bbc26372121b67e1a7b1352 -> ce7d3de0f4af530b38158b4216c7dbb774ddac9b89ea9a5127f0d6791990878f as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 763 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 765 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1801 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2020 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2152 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2166 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2167 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2168 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2169 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2170 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Succeeded
NOTE: Running task 2171 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2172 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package)
NOTE: Running task 2173 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Succeeded
NOTE: Running task 2174 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2175 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_spdx)
NOTE: Running task 2176 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm)
NOTE: Running task 2177 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_write_rpm)
NOTE: Running task 2178 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_qa)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2179 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_runtime_spdx)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm unihash changed to 6787e71054acaede42c5103f464ab36149cd90888520ceb50229e4a9955bb11e
NOTE: Running noexec task 2180 of 2180 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_build)
NOTE: Tasks Summary: Attempted 2180 tasks of which 2147 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8940555827797704161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: removed "/usr/lib/python3-wcwidth/ptest/tests/__init__.py"
Changes to packages/core2-32-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.6.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.8.dist-info

--===============8940555827797704161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1848 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1845 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 44 Mirrors 0 Missed 15 Current 688 (74% match, 97% complete)
Removing 1 stale sstate objects for arch core2-64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 698 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-packaging/23.1/temp/log.do_packagedata_setscene.2664610
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 745 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_setscene)
NOTE: Running task 1279 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_recipe_qa)
NOTE: Running task 1595 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1787 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 2093 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_unpack)
NOTE: Running task 2094 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_patch)
NOTE: Running setscene task 747 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_recipe_qa_setscene)
NOTE: Running task 2096 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2097 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Succeeded
NOTE: Running task 2114 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2115 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_lic)
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2116 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2117 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2118 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2119 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 41de79a8e5aa4adff5c84d9689e46f868ca74cfd324d8705ad647ed0c045a6a1
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 52ae0598114cae56bc6a4167fad33016304a2181b4bbcb5f962d80e5359bb592 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'd828f20832ef72e869cc07683f16d67f63122c3a4dee1cc818228a58c86d0a1f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '52ae0598114cae56bc6a4167fad33016304a2181b4bbcb5f962d80e5359bb592'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed d828f20832ef72e869cc07683f16d67f63122c3a4dee1cc818228a58c86d0a1f -> 52ae0598114cae56bc6a4167fad33016304a2181b4bbcb5f962d80e5359bb592 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2127 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2128 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2130 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package)
NOTE: Running task 2131 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Succeeded
NOTE: Running task 2132 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2133 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_spdx)
NOTE: Running task 2134 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm)
NOTE: Running task 2135 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_write_rpm)
NOTE: Running task 2136 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_qa)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2137 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_runtime_spdx)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm unihash changed to 21f2a510f11350efedde7c50865ab842e4d33766a595d0d3f9bb16c1bebe455e
NOTE: Running noexec task 2138 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_build)
NOTE: Tasks Summary: Attempted 2138 tasks of which 2111 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8940555827797704161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 65 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 45 Mirrors 0 Missed 15 Current 687 (75% match, 97% complete)
Removing 2 stale sstate objects for arch qemumips...done.
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 697 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-packaging/23.1/temp/log.do_packagedata_setscene.2672654
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 745 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_setscene)
NOTE: Running task 1279 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_recipe_qa)
NOTE: Running task 1596 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1706 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 2093 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_unpack)
NOTE: Running task 2094 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_patch)
NOTE: Running setscene task 747 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_recipe_qa_setscene)
NOTE: Running task 2096 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Succeeded
NOTE: Running task 2114 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2115 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_lic)
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2116 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2117 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure_ptest_base)
NOTE: Running task 2118 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2119 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 92d337ef06d6815edfae603f3065f50a80d7a4e3b16f348bd050c3d4b458d813
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 74f38ab4a59f84fef858938b45bc52ebe66498471a79c4885a68ded80cc419a9 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '631caa88da0ac65605955332ab40ffddb4a9864f3e8b134f9766b4aab0702ce8', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '74f38ab4a59f84fef858938b45bc52ebe66498471a79c4885a68ded80cc419a9'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 631caa88da0ac65605955332ab40ffddb4a9864f3e8b134f9766b4aab0702ce8 -> 74f38ab4a59f84fef858938b45bc52ebe66498471a79c4885a68ded80cc419a9 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2127 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2128 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2130 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package)
NOTE: Running task 2131 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Succeeded
NOTE: Running task 2132 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2133 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_spdx)
NOTE: Running task 2134 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm)
NOTE: Running task 2135 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_write_rpm)
NOTE: Running task 2136 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_qa)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2137 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_runtime_spdx)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm unihash changed to 8076a28276e80953cead8339d7641e8489d1b7d9726fdac431efbf4b8d2663ae
NOTE: Running noexec task 2138 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_build)
NOTE: Tasks Summary: Attempted 2138 tasks of which 2111 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8940555827797704161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.6.tar.gz;downloadfilename=wcwidth-0.2.6.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.2.8.tar.gz;downloadfilename=wcwidth-0.2.8.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-wcwidth: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 8627 to 8585 (-0%)
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: FILELIST: removed "/usr/lib/python3-wcwidth/ptest/tests/__init__.py"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.2.6" to "0.2.8"
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 498153 to 534989 (+7%)
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.2.6 [default] to 0.2.8 [default]
packages/core2-32-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.2.6" to "0.2.8"
Changes to packages/core2-32-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.11/site-packages/wcwidth-0.2.6.dist-info moved to /usr/lib/python3.11/site-packages/wcwidth-0.2.8.dist-info

--===============8940555827797704161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 71 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 44 Mirrors 0 Missed 15 Current 688 (74% match, 97% complete)
Removing 2 stale sstate objects for arch qemuppc...done.
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 698 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-packaging/23.1/temp/log.do_packagedata_setscene.2676661
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 745 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_setscene)
NOTE: Running task 1279 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_recipe_qa)
NOTE: Running task 1595 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1862 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 2093 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_unpack)
NOTE: Running task 2094 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 747 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_patch)
NOTE: Running task 2096 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Succeeded
NOTE: Running task 2114 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2115 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_lic)
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2116 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2117 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2118 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2119 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 200bb33903ec133f456f3590c1839eabe64198ee0b7808a12285742dded5600b
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 5675734a00a3b352add5e9d891feb5159e1082e4422d4159dbbdbcca5b4cb46d to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '28483a4c3eea894d5d4c1904e3969a53f5457a8b5880f564d4779dca75f0e486', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '5675734a00a3b352add5e9d891feb5159e1082e4422d4159dbbdbcca5b4cb46d'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 28483a4c3eea894d5d4c1904e3969a53f5457a8b5880f564d4779dca75f0e486 -> 5675734a00a3b352add5e9d891feb5159e1082e4422d4159dbbdbcca5b4cb46d as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2127 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2128 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2130 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package)
NOTE: Running task 2131 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Succeeded
NOTE: Running task 2132 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2133 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_spdx)
NOTE: Running task 2134 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm)
NOTE: Running task 2135 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_write_rpm)
NOTE: Running task 2136 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_qa)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2137 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_runtime_spdx)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm unihash changed to cb0eb472d789c065642cf21ae15024432411a9f2bb6ea3091bc548e22a7b132b
NOTE: Running noexec task 2138 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_build)
NOTE: Tasks Summary: Attempted 2138 tasks of which 2111 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8940555827797704161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 55 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5dc28ec7a9762d87686b0caf84e2456fc4a9a109"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 44 Mirrors 0 Missed 15 Current 688 (74% match, 97% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 2 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 698 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-packaging/23.1/temp/log.do_packagedata_setscene.2668660
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 745 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_package_setscene)
NOTE: Running task 1279 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_recipe_qa)
NOTE: Running task 1595 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1683 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_fetch: Succeeded
NOTE: Running task 2093 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_unpack)
NOTE: Running task 2094 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_unpack: Succeeded
NOTE: Running task 2095 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_patch)
NOTE: Running task 2096 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_collect_spdx_deps)
NOTE: recipe python3-packaging-23.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 747 of 747 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Started
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-packaging-23.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2113 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_patch: Succeeded
NOTE: Running task 2114 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 2115 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_lic)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Started
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2116 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure: Succeeded
NOTE: Running task 2117 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2118 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2119 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 2572f28bd6d6ab3b8d5d65dea143291e7936867d7b6c5b21c4c3d1e3b7a8e7fe
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash f34a99a525db18c96bd9e4dbecb44f74047406918a8e7d85a4adff56300ceb41 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '66db8f57532b14021291c428852fb516ee897d1513b5d82a17a26d52d5b27671', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'f34a99a525db18c96bd9e4dbecb44f74047406918a8e7d85a4adff56300ceb41'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 66db8f57532b14021291c428852fb516ee897d1513b5d82a17a26d52d5b27671 -> f34a99a525db18c96bd9e4dbecb44f74047406918a8e7d85a4adff56300ceb41 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile: Succeeded
NOTE: Running task 2127 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_compile_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2128 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install: Succeeded
NOTE: Running task 2129 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_install_ptest_base)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2130 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package)
NOTE: Running task 2131 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_populate_sysroot)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package: Succeeded
NOTE: Running task 2132 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_packagedata)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2133 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_spdx)
NOTE: Running task 2134 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm)
NOTE: Running task 2135 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_write_rpm)
NOTE: Running task 2136 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_package_qa)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Started
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2137 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_create_runtime_spdx)
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_qa: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-wcwidth-0.2.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-7.4.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.2.bb:do_package_write_rpm unihash changed to 0631a4aceba12a438d65be509a092582f2a529196750f708fb1a19ee5eeed6d4
NOTE: Running noexec task 2138 of 2138 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb:do_build)
NOTE: Tasks Summary: Attempted 2138 tasks of which 2111 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-src went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dbg went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-staticdev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-dev went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-doc went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging-locale went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-packaging went backwards which would break package feeds (from 0:23.2-r0 to 0:23.1-r0) [version-going-backwards]
ERROR: python3-packaging-23.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8940555827797704161==--

