Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56BFC83030
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.8896.1749993292071222519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=J8+oZmgK;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=a4OgfqCG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019773ba7f07-5a10c2db-1082-43e8-b434-6405f891cb4d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993291;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B0swvTdUASGcbalSd0RV4z7lJU6DMSf1J4Vtsp+wDHE=;
	b=J8+oZmgKcSq9dMwsxVKfNIyG8O8hjVjQR+Ta70KS5ycNKrwusQhHNO9MsycWM3LU
	i6b6F+LSs1BSEa9wQ+wQO61LTDmtoMRmWl3FgCB13IG5Sj9PLofCR7TI7C4eUsfFFu1
	L9LFFa8kcm2SLtPviNAwBZypWvcpZ81UJV1qd9P0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993291;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B0swvTdUASGcbalSd0RV4z7lJU6DMSf1J4Vtsp+wDHE=;
	b=a4OgfqCGmPVZ4fu2Kyk3RJ0l5PIw2LhS4aliIDshKnPm0DGELtM9IWcyUqVRMIN9
	o20f5ix7UtJLtI7hHC7IsXJjTV1NV7AQWNig7KNyFT5CX2cItehihIJ+KxfssjwqEr6
	f1At+tFYls/N7yYwy46ewWRnhbPdoXpOfqhptUuI=
Content-Type: multipart/mixed; boundary="===============2051674781221311390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-unittest-automake-output: upgrading to 0.3 FAILED
Message-ID: <0101019773ba7f07-5a10c2db-1082-43e8-b434-6405f891cb4d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218694

--===============2051674781221311390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-unittest-automake-output* to *0.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-unittest-automake-output-upgrade-0.2-0.3.patch
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
From 8cbf4a5855ccc445a390909a5b4ebab3200e42f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 09:04:22 +0000
Subject: [PATCH] python3-unittest-automake-output: upgrade 0.2 -> 0.3

---
 ...ke-output_0.2.bb => python3-unittest-automake-output_0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-unittest-automake-output_0.2.bb => python3-unittest-automake-output_0.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
rename to meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb
index a8b834a126..3c8fe320d0 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f6f16008d9fb7349f06609329f1ab93b"
 SRC_URI = "git://gitlab.com/rossburton/python-unittest-automake-output;protocol=https;branch=main \
            file://0001-Update-__version__-to-match-the-tag-version.patch"
 
-SRCREV = "aebdfb188e368c690ea55cf6c9c9ffa1a52def65"
+SRCREV = "3376ff9bc319f8338849b7b9f63b9325d7b7663a"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


--===============2051674781221311390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1912 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (934 cached, 1 parsed). 1910 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bd283a4a904b1e2596f9c0aa6824e5c7b6824d7d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 314 Local 302 Mirrors 0 Missed 12 Current 324 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 464 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 600 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: Running task 914 of 1826 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 615 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa unihash changed to 573a6c127ee07a7bebbb024c4092fa9abb0087cc1eb8ac4575ecba853349bfe7
NOTE: Running task 1070 of 1826 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1308 of 1826 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_unpack)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_unpack: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1309 of 1826 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_patch)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 635 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1671 of 1826 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1807 of 1826 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1811 tasks of which 1805 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615090408.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615090408.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/temp/log.do_patch.1995165
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-unittest-automake-output-0.3-r0 do_patch: Applying patch '0001-Update-__version__-to-match-the-tag-version.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Update-__version__-to-match-the-tag-version.patch
patching file src/putao/__init__.py
Hunk #1 FAILED at 5.
1 out of 1 hunk FAILED -- rejects in file src/putao/__init__.py
Patch 0001-Update-__version__-to-match-the-tag-version.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/temp/log.do_patch.1995165
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_patch) failed with exit code '1'

--===============2051674781221311390==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-unittest-automake-output-upgrade-0.2-0.3.patch"

RnJvbSA4Y2JmNGE1ODU1Y2NjNDQ1YTM5MDkwOWE1YjRlYmFiMzIwMGU0MmY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDk6MDQ6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVuaXR0ZXN0LWF1dG9tYWtlLW91dHB1dDogdXBncmFkZSAwLjIgLT4gMC4zCgotLS0K
IC4uLmtlLW91dHB1dF8wLjIuYmIgPT4gcHl0aG9uMy11bml0dGVzdC1hdXRvbWFrZS1vdXRwdXRf
MC4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdW5pdHRl
c3QtYXV0b21ha2Utb3V0cHV0XzAuMi5iYiA9PiBweXRob24zLXVuaXR0ZXN0LWF1dG9tYWtlLW91
dHB1dF8wLjMuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXVuaXR0ZXN0LWF1dG9tYWtlLW91dHB1dF8wLjIuYmIgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0cHV0XzAuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0cHV0XzAuMi5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVuaXR0ZXN0LWF1dG9tYWtlLW91
dHB1dF8wLjMuYmIKaW5kZXggYThiODM0YTEyNi4uM2M4ZmUzMjBkMCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVuaXR0ZXN0LWF1dG9tYWtlLW91dHB1
dF8wLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXVuaXR0
ZXN0LWF1dG9tYWtlLW91dHB1dF8wLjMuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWY2ZjE2MDA4ZDlmYjczNDlmMDY2MDkzMjlmMWFiOTNi
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuY29tL3Jvc3NidXJ0b24vcHl0aG9uLXVuaXR0ZXN0
LWF1dG9tYWtlLW91dHB1dDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbiBcCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLVVwZGF0ZS1fX3ZlcnNpb25fXy10by1tYXRjaC10aGUtdGFnLXZlcnNpb24u
cGF0Y2giCiAKLVNSQ1JFViA9ICJhZWJkZmIxODhlMzY4YzY5MGVhNTVjZjZjOWM5ZmZhMWE1MmRl
ZjY1IgorU1JDUkVWID0gIjMzNzZmZjliYzMxOWY4MzM4ODQ5YjdiOWY2M2I5MzI1ZDdiNzY2M2Ei
CiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDcuMQoK

--===============2051674781221311390==--

