Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DFACED618
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12133.1763224737780450573
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=obi0m8gB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YSEjQmXY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a8862554b-270944e4-49f6-4389-927d-a9ad9910214a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224737;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7htbjOZhzzwnrzUgmMPi+F08SVETUlgn44nSFeV57bI=;
	b=obi0m8gBLNmHMbl4xZUjac2CNRoQV4qCin1WZ6sHyOeBbKbug6F2th+Mx9FmMVa2
	9m7HLEQpRo5l+7jdz6WgSjPEpuedzUDFPWddV0Suf2xOTqaLVTUbGWLjsEequnQwylb
	PK2GmwIGE3kETAxvjmBr3L4Yc/N00rQQJ/rsbLqA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224737;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7htbjOZhzzwnrzUgmMPi+F08SVETUlgn44nSFeV57bI=;
	b=YSEjQmXYloG0d+EDBVyoPjRoocOINAhe+bjEx0UGjV/FugRc6D73SN0pKMbthGFF
	qnQiV2NKE9j2Dx2dsW7W8SEI9vXpjkq1ocON1mEFjq54WgkTvyhx2Py+KjfqB2D0gOS
	6QIOBgDqbpRcMlsWoYzaJB6NyTBsnZ5pkFEuUHiM=
Content-Type: multipart/mixed; boundary="===============7264677806673477636=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-xmltodict: upgrading to 1.0.2 FAILED
Message-ID: <0101019a8862554b-270944e4-49f6-4389-927d-a9ad9910214a-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226385

--===============7264677806673477636==
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
From 0cab32624a03de2501f7633bddd87659843a8cb0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 11:36:47 +0000
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


--===============7264677806673477636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1946 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (946 cached, 1 parsed). 1944 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-651aa4d188f1f3b20e1e0c746bc44788a46a3e2a"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:651aa4d188f1f3b20e1e0c746bc44788a46a3e2a"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 324 Local 313 Mirrors 0 Missed 11 Current 402 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 494 of 726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 644 of 726 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_deploy_source_date_epoch_setscene)
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
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_patch: Succeeded
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2895129:170 exit 2 from 'nativepython3 setup.py --verbose build -j 16 bdist_wheel --dist-dir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/dist'
| WARNING: Backtrace (BB generated script):
| 	#1: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2895129, line 170
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2895129, line 153
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2895129, line 177
NOTE: recipe python3-xmltodict-1.0.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2040 tasks of which 2031 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115113633.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115113633.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/log.do_compile.2895129
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-xmltodict-1.0.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/run.do_compile.2895129' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-xmltodict/1.0.2/temp/log.do_compile.2895129
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-xmltodict_1.0.2.bb:do_compile) failed with exit code '1'

--===============7264677806673477636==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-xmltodict-upgrade-0.15.1-1.0.2.patch"

RnJvbSAwY2FiMzI2MjRhMDNkZTI1MDFmNzYzM2JkZGQ4NzY1OTg0M2E4Y2IwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTE6MzY6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXhtbHRvZGljdDogdXBncmFkZSAwLjE1LjEgLT4gMS4wLjIKCi0tLQogLi4uL3tweXRo
b24zLXhtbHRvZGljdF8wLjE1LjEuYmIgPT4gcHl0aG9uMy14bWx0b2RpY3RfMS4wLjIuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy14bWx0b2RpY3RfMC4xNS4x
LmJiID0+IHB5dGhvbjMteG1sdG9kaWN0XzEuMC4yLmJifSAoODElKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy14bWx0b2RpY3RfMC4xNS4xLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8xLjAuMi5iYgpz
aW1pbGFyaXR5IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMteG1sdG9kaWN0XzAuMTUuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXhtbHRvZGljdF8xLjAuMi5iYgppbmRleCBhMWQxYmI0N2U0
Li5iOWY5ZjgwZTM4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMteG1sdG9kaWN0XzAuMTUuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMteG1sdG9kaWN0XzEuMC4yLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9
ICJodHRwczovL2dpdGh1Yi5jb20vbWFydGluYmxlY2gveG1sdG9kaWN0IgogTElDRU5TRSA9ICJN
SVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0wMTQ0MWQ1MGRjNzQ0
NzZkYjU4YTQxYWMxMGNiOWZhMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNkOGQ0OTEyN2Yz
Y2U2OTc5ZDQwYTM2ZGJjYWQ5NmY4YmFiMTA2ZDIzMmQyNGI0OWVmZGQ0YmQyMTcxNjk4M2MiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNTQzMDY3ODBiN2MyMTc1YTM5NjdjYWQxZGI5MmYyMTgyMDdl
NWJjMWFiYTY5N2Q4ODc4MDdjMGZiNjhiNzY0OSIKIAogUFlQSV9QQUNLQUdFID0gInhtbHRvZGlj
dCIKIAotLSAKMi40Ny4xCgo=

--===============7264677806673477636==--

