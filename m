Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B19CCF9E2
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.17964.1759325545869003275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l8W74cLl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UgQ3SWTx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101999ff9631e-750c8ffe-ddc8-4621-b9f1-b74044ff671f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l8Fw3QZ9NhCR9YjK+jbYEhAhXlC/PdHGOxndZhMnehY=;
	b=l8W74cLlOanbXLgED/zN4agiZoLxWTLgozwf+HTtKWv573nJJY3RRAXk7TkwtjlW
	dSawQXO4gvYrRkQRLrMV5UNpocmHTaIZDfZMyQoh+WYrY7L/6xpYDws4w3h8Idu34XI
	yzA6c/TNyz0ftUs/LITi3LpSyKQhzvF4KhPRgOMs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325545;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l8Fw3QZ9NhCR9YjK+jbYEhAhXlC/PdHGOxndZhMnehY=;
	b=UgQ3SWTxSrZ8es636o2pLlTrNqlm3DC+HVdv6Xc8OT0EYN6pQG8hbSZyi2m4no7F
	FeI2rr6WghzbnLmFhdyodBvv8cGW2KCy67Fcd8spb8RZh43NqO4TbW09bNMimHdb9xl
	37l8zq8ViiS6gHLE42FfxojJ07gMPpaCmiO4gtsg=
Content-Type: multipart/mixed; boundary="===============9018489303834937888=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-xmltodict: upgrading to 1.0.2 FAILED
Message-ID: <010101999ff9631e-750c8ffe-ddc8-4621-b9f1-b74044ff671f-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224257

--===============9018489303834937888==
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
From f9c11a9d521c178545f7d4080b7e0c4a83b6dcd0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 09:39:08 +0000
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


--===============9018489303834937888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1941 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1939 targets, 43 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-034ead4a1227d076275afa9c49c29c98ecc76be4"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:034ead4a1227d076275afa9c49c29c98ecc76be4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 323 Local 309 Mirrors 0 Missed 14 Current 403 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1354 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_recipe_qa)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2030 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_fetch)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_fetch: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 2031 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_unpack)
NOTE: Running task 2032 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_unpack: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 2033 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_patch)
NOTE: Running task 2034 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_patch: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 2035 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2036 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_check_backend)
NOTE: Running task 2037 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_populate_lic)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_check_backend: Started
WARNING: python3-xmltodict-1.0.2-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_populate_lic: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_check_backend: Succeeded
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2038 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_configure)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_configure: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_configure: Succeeded
NOTE: Running task 2039 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_configure_ptest_base)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2040 of 2053 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_compile)
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| nativepython3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/sources/xmltodict-1.0.2/setup.py': [Errno 2] No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2061773:170 exit 2 from 'nativepython3 setup.py --verbose build -j 16 bdist_wheel --dist-dir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/dist'
| WARNING: Backtrace (BB generated script):
| 	#1: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2061773, line 170
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2061773, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2061773, line 177
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2040 tasks of which 2028 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001093854.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001093854.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/log.do_compile.2061773
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-xmltodict-1.0.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2061773' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/log.do_compile.2061773
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_compile) failed with exit code '1'

--===============9018489303834937888==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-xmltodict-upgrade-0.15.1-1.0.2.patch"

RnJvbSBmOWMxMWE5ZDUyMWMxNzg1NDVmN2Q0MDgwYjdlMGM0YTgzYjZkY2QwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwOTozOTowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============9018489303834937888==--

