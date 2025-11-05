Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457A2CD3445
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:36 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2364.1762384581511897820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HCE6NOCy;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=CyUqyvzS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019a564eb9f5-eaeec718-9734-4bed-a8ec-ca765dce9632-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384591;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UZh9ara1kyloL/648nUO4qQaUltDU8uhek2ktsnz9Nw=;
	b=HCE6NOCytzjpNqQpF42kCz8oyA0Lzhos0m+98YTPh7vBAnTiHEU26mIQn0Q2TG8y
	/+tJTht8/Ri3Uh/JzxLNielgt+Ex+drMt/2q01XfffqyAiMB9XnZ/gPfxracHgFGeUH
	UB3HybrzixYaT8d0FJPtId0tCAc86a9feiMiAbKE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384591;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UZh9ara1kyloL/648nUO4qQaUltDU8uhek2ktsnz9Nw=;
	b=CyUqyvzS95X45Dj0K4nhkco+PcQ0ih8eS7yxc0Lu/TV1b0XhFlFQwxM2RG3s1QFr
	x5qE9aOlV+9StcWfvX0ZqYaLYbQMaPr/MqSXRkDK+PZa+7e/ble91gUfG8TZ0mQ4ycw
	pi/Hrj9fH+MwQzNExFV31F2JwDjszbEYuEyhQ8y0=
Content-Type: multipart/mixed; boundary="===============8289649779964244923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-xmltodict: upgrading to 1.0.2 FAILED
Message-ID: <0101019a564eb9f5-eaeec718-9734-4bed-a8ec-ca765dce9632-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225852

--===============8289649779964244923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-xmltodict* to *1.0.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-xmltodict-upgrade-0.15.1-1.0.2.patch
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
From 9510a083ff23f719ff124f9bf6d0e2cc6eb58cf8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 18:05:55 +0000
Subject: [PATCH] python3-xmltodict: upgrade 0.15.1 -> 1.0.2

---
 .../{python3-xmltodict_0.15.1.bb => python3-xmltodict_1.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-xmltodict_0.15.1.bb => python3-xmltodict_1.0.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb b/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb
rename to meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
index a1d1bb47e4..b9f9f80e38 100644
--- a/meta/recipes-devtools/python/python3-xmltodict_0.15.1.bb
+++ b/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[sha256sum] = "3d8d49127f3ce6979d40a36dbcad96f8bab106d232d24b49efdd4bd21716983c"
+SRC_URI[sha256sum] = "54306780b7c2175a3967cad1db92f218207e5bc1aba697d887807c0fb68b7649"
 
 PYPI_PACKAGE = "xmltodict"
 
-- 
2.47.1


--===============8289649779964244923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-xmltodict-upgrade-0.15.1-1.0.2.patch"

RnJvbSA5NTEwYTA4M2ZmMjNmNzE5ZmYxMjRmOWJmNmQwZTJjYzZlYjU4Y2Y4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxODowNTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMteG1sdG9kaWN0OiB1cGdyYWRlIDAuMTUuMSAtPiAxLjAuMgoKLS0tCiAuLi4ve3B5dGhv
bjMteG1sdG9kaWN0XzAuMTUuMS5iYiA9PiBweXRob24zLXhtbHRvZGljdF8xLjAuMi5iYn0gfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXhtbHRvZGljdF8wLjE1LjEu
YmIgPT4gcHl0aG9uMy14bWx0b2RpY3RfMS4wLjIuYmJ9ICg4MSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8wLjE1LjEuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMteG1sdG9kaWN0XzEuMC4yLmJiCnNp
bWlsYXJpdHkgaW5kZXggODElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy14bWx0b2RpY3RfMC4xNS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMteG1sdG9kaWN0XzEuMC4yLmJiCmluZGV4IGExZDFiYjQ3ZTQu
LmI5ZjlmODBlMzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy14bWx0b2RpY3RfMC4xNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy14bWx0b2RpY3RfMS4wLjIuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0g
Imh0dHBzOi8vZ2l0aHViLmNvbS9tYXJ0aW5ibGVjaC94bWx0b2RpY3QiCiBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTAxNDQxZDUwZGM3NDQ3
NmRiNThhNDFhYzEwY2I5ZmEyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Q4ZDQ5MTI3ZjNj
ZTY5NzlkNDBhMzZkYmNhZDk2ZjhiYWIxMDZkMjMyZDI0YjQ5ZWZkZDRiZDIxNzE2OTgzYyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICI1NDMwNjc4MGI3YzIxNzVhMzk2N2NhZDFkYjkyZjIxODIwN2U1
YmMxYWJhNjk3ZDg4NzgwN2MwZmI2OGI3NjQ5IgogCiBQWVBJX1BBQ0tBR0UgPSAieG1sdG9kaWN0
IgogCi0tIAoyLjQ3LjEKCg==

--===============8289649779964244923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1947 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (947 cached, 1 parsed). 1945 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-fd93490245bb42e7a5bb733a71cf396cff98c605"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:fd93490245bb42e7a5bb733a71cf396cff98c605"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 319 Local 308 Mirrors 0 Missed 11 Current 407 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 507 of 726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 607 of 726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 726 of 726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2030 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_fetch)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 2031 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_unpack)
NOTE: Running task 2032 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2033 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_patch)
NOTE: Running task 2034 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2036 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_check_backend)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_check_backend: Started
WARNING: python3-xmltodict-1.0.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_check_backend: Succeeded
NOTE: Running task 2038 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_configure)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 2039 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2040 of 2053 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_compile)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| nativepython3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/sources/xmltodict-1.0.2/setup.py': [Errno 2] No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.1727747:170 exit 2 from 'nativepython3 setup.py --verbose build -j 16 bdist_wheel --dist-dir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/dist'
| WARNING: Backtrace (BB generated script):
| 	#1: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.1727747, line 170
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.1727747, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.1727747, line 177
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2040 tasks of which 2031 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105180540.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105180540.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/log.do_compile.1727747
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-xmltodict-1.0.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.1727747' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/log.do_compile.1727747
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_compile) failed with exit code '1'

--===============8289649779964244923==--

