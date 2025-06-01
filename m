Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DCCC7115D
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.27768.1748786126246727473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=oqYGtuV/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KTx/tGw6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101972bc6ce3f-f448127f-8298-4e52-9c14-b790b1886f94-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TuIPcd5eENESOWitWBtiYHhr6JW28khuWMKD59Rc4qI=;
	b=oqYGtuV/jhshqSukJdCrafd69nZsEauENFE5ESWnRWmstB8yq1BE/W4Pjrmqhpmi
	KMa1zZ8egA/qPEdkeT3fLD6YxyJhMVorD3vATjiz0LlghkniXPrmAaOHlSR8A4e7nzA
	xZ/C8zSLbzV8PZQuUqP2RLd8DoLETTUrVXxuHK7o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TuIPcd5eENESOWitWBtiYHhr6JW28khuWMKD59Rc4qI=;
	b=KTx/tGw60K5B+XET5dvLXMX0OQjdy6TIbCqIZpXN0g8jxD1rJrrTu3+2pHqVkPg9
	bempOZDFbtuefOXXrIScp+NEDG4weIP7ZYt2ckO7gEwgDPVYUJMxaTZkz3s/QWbW00b
	PE75zD5idvriTO8y5a+Ni32+Sz/NS7vtdTqt739w=
Content-Type: multipart/mixed; boundary="===============1200794039473762448=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-unittest-automake-output: upgrading to 0.3 FAILED
Message-ID: <010101972bc6ce3f-f448127f-8298-4e52-9c14-b790b1886f94-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217615

--===============1200794039473762448==
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
From 6f1ba4dde2f8896d6658772a6de1ce80ced33376 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 10:06:27 +0000
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


--===============1200794039473762448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1917 entries from dependency cache.
Parsing recipes...done.
Parsing of 936 .bb files complete (935 cached, 1 parsed). 1915 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:7fb835d9997ec9224e4e8ab9438a99378eff0f0c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 333 Local 322 Mirrors 0 Missed 11 Current 325 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 483 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 508 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 616 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 936 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_fetch)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 622 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1082 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_unpack)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 631 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1343 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_patch)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 658 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1719 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1859 of 1878 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 1863 tasks of which 1858 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601100615.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250601100615.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/temp/log.do_patch.992828
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-unittest-automake-output-0.3-r0 do_patch: Applying patch '0001-Update-__version__-to-match-the-tag-version.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/git'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Update-__version__-to-match-the-tag-version.patch
patching file src/putao/__init__.py
Hunk #1 FAILED at 5.
1 out of 1 hunk FAILED -- rejects in file src/putao/__init__.py
Patch 0001-Update-__version__-to-match-the-tag-version.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/temp/log.do_patch.992828
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_patch) failed with exit code '1'

--===============1200794039473762448==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-unittest-automake-output-upgrade-0.2-0.3.patch"

RnJvbSA2ZjFiYTRkZGUyZjg4OTZkNjY1ODc3MmE2ZGUxY2U4MGNlZDMzMzc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMDowNjoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0cHV0OiB1cGdyYWRlIDAuMiAtPiAwLjMKCi0tLQog
Li4ua2Utb3V0cHV0XzAuMi5iYiA9PiBweXRob24zLXVuaXR0ZXN0LWF1dG9tYWtlLW91dHB1dF8w
LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11bml0dGVz
dC1hdXRvbWFrZS1vdXRwdXRfMC4yLmJiID0+IHB5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0
cHV0XzAuMy5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0cHV0XzAuMi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11bml0dGVzdC1hdXRvbWFrZS1vdXRwdXRfMC4zLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy11bml0dGVzdC1hdXRvbWFrZS1vdXRwdXRfMC4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0
cHV0XzAuMy5iYgppbmRleCBhOGI4MzRhMTI2Li4zYzhmZTMyMGQwIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0cHV0
XzAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdW5pdHRl
c3QtYXV0b21ha2Utb3V0cHV0XzAuMy5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZjZmMTYwMDhkOWZiNzM0OWYwNjYwOTMyOWYxYWI5M2Ii
CiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5jb20vcm9zc2J1cnRvbi9weXRob24tdW5pdHRlc3Qt
YXV0b21ha2Utb3V0cHV0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtVXBkYXRlLV9fdmVyc2lvbl9fLXRvLW1hdGNoLXRoZS10YWctdmVyc2lvbi5w
YXRjaCIKIAotU1JDUkVWID0gImFlYmRmYjE4OGUzNjhjNjkwZWE1NWNmNmM5YzlmZmExYTUyZGVm
NjUiCitTUkNSRVYgPSAiMzM3NmZmOWJjMzE5ZjgzMzg4NDliN2I5ZjYzYjkzMjVkN2I3NjYzYSIK
IAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Ny4xCgo=

--===============1200794039473762448==--

