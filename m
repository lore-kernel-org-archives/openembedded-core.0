Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9015C83F2E
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:23 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1424.1751386807485108968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yyNGaIK3;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XX5cO4JJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010197c6c9ff8f-6f7d7001-c714-48aa-8f04-1a0ec9e5f628-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386816;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bt29a+HXiim61DkFxCpOjSbqBI9S1+ALxG9OtbcjRwQ=;
	b=yyNGaIK3t/xxo5ThMjFvdVSBt8o3TuX6cWNmcqetXLBe0qfU/VYCLrUdGrqpTadr
	ZM/yUnGYaan7OPQEQfNaJdM4g+tY2ubxorhbYcQsIGincl4NYCGtS71DRX+Lrtc0/O8
	MfWD8dC//Gq/iKxO/sEtWfF8hinGqWqFHguHGD+U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386816;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bt29a+HXiim61DkFxCpOjSbqBI9S1+ALxG9OtbcjRwQ=;
	b=XX5cO4JJ6cNCnH0zXOK6BK6WXvjW08DMsrER1ygEZ9f8odMt+NRa2Hfzo0iQzrq0
	ZX3hOEIhkitj9A97Dk/54FBDCzq4+AvFUDJeMS5XpTlQ1VTvak71Xsyu7kV9jZrHpnH
	/cCHv87+QLDiERM00Tz0E76qgSrtGhM+HFUHirTg=
Content-Type: multipart/mixed; boundary="===============0977008055331116435=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-unittest-automake-output: upgrading to 0.3 FAILED
Message-ID: <01010197c6c9ff8f-6f7d7001-c714-48aa-8f04-1a0ec9e5f628-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219643

--===============0977008055331116435==
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
From 121f604c791130a35a4bba641866af11c83af6c3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 10:02:40 +0000
Subject: [PATCH] python3-unittest-automake-output: upgrade 0.2 -> 0.3

---
 ...ke-output_0.2.bb => python3-unittest-automake-output_0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-unittest-automake-output_0.2.bb => python3-unittest-automake-output_0.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb b/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
rename to meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb
index 216fea2b93..4054385935 100644
--- a/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb
+++ b/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f6f16008d9fb7349f06609329f1ab93b"
 SRC_URI = "git://gitlab.com/rossburton/python-unittest-automake-output;protocol=https;branch=main \
            file://0001-Update-__version__-to-match-the-tag-version.patch"
 
-SRCREV = "aebdfb188e368c690ea55cf6c9c9ffa1a52def65"
+SRCREV = "3376ff9bc319f8338849b7b9f63b9325d7b7663a"
 
 inherit python_flit_core
 
-- 
2.47.1


--===============0977008055331116435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1919 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1917 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-6ce8aa67c772b9237dd6ba9b201d07de2b7bd88f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6ce8aa67c772b9237dd6ba9b201d07de2b7bd88f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 290 Local 277 Mirrors 0 Missed 13 Current 348 (95% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 470 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.5.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 603 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 950 of 1826 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 608 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa unihash changed to 573a6c127ee07a7bebbb024c4092fa9abb0087cc1eb8ac4575ecba853349bfe7
NOTE: Running task 1096 of 1826 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 629 of 638 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1308 of 1826 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
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
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701100226.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250701100226.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_patch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/temp/log.do_patch.2729158
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-unittest-automake-output-0.3-r0 do_patch: Applying patch '0001-Update-__version__-to-match-the-tag-version.patch' on target directory '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/sources/python3-unittest-automake-output-0.3'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Update-__version__-to-match-the-tag-version.patch
patching file src/putao/__init__.py
Hunk #1 FAILED at 5.
1 out of 1 hunk FAILED -- rejects in file src/putao/__init__.py
Patch 0001-Update-__version__-to-match-the-tag-version.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-unittest-automake-output/0.3/temp/log.do_patch.2729158
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_patch) failed with exit code '1'

--===============0977008055331116435==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-unittest-automake-output-upgrade-0.2-0.3.patch"

RnJvbSAxMjFmNjA0Yzc5MTEzMGEzNWE0YmJhNjQxODY2YWYxMWM4M2FmNmMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAxMDowMjo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0cHV0OiB1cGdyYWRlIDAuMiAtPiAwLjMKCi0tLQog
Li4ua2Utb3V0cHV0XzAuMi5iYiA9PiBweXRob24zLXVuaXR0ZXN0LWF1dG9tYWtlLW91dHB1dF8w
LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11bml0dGVz
dC1hdXRvbWFrZS1vdXRwdXRfMC4yLmJiID0+IHB5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0
cHV0XzAuMy5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0cHV0XzAuMi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11bml0dGVzdC1hdXRvbWFrZS1vdXRwdXRfMC4zLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy11bml0dGVzdC1hdXRvbWFrZS1vdXRwdXRfMC4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0
cHV0XzAuMy5iYgppbmRleCAyMTZmZWEyYjkzLi40MDU0Mzg1OTM1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdW5pdHRlc3QtYXV0b21ha2Utb3V0cHV0
XzAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdW5pdHRl
c3QtYXV0b21ha2Utb3V0cHV0XzAuMy5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZjZmMTYwMDhkOWZiNzM0OWYwNjYwOTMyOWYxYWI5M2Ii
CiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5jb20vcm9zc2J1cnRvbi9weXRob24tdW5pdHRlc3Qt
YXV0b21ha2Utb3V0cHV0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtVXBkYXRlLV9fdmVyc2lvbl9fLXRvLW1hdGNoLXRoZS10YWctdmVyc2lvbi5w
YXRjaCIKIAotU1JDUkVWID0gImFlYmRmYjE4OGUzNjhjNjkwZWE1NWNmNmM5YzlmZmExYTUyZGVm
NjUiCitTUkNSRVYgPSAiMzM3NmZmOWJjMzE5ZjgzMzg4NDliN2I5ZjYzYjkzMjVkN2I3NjYzYSIK
IAogaW5oZXJpdCBweXRob25fZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============0977008055331116435==--

