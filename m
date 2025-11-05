Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F076CCFA19
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2348.1762384572259116327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=w9ejVzKi;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jvGpHvgm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a564e9486-fc2a118e-a6ee-40f9-9ad0-82339deef5e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GPqlv3xvDeukdDFseEaR83H66Eo7QoeKriLBtsq55dw=;
	b=w9ejVzKillrKlVwPcGwuBSH7KifFG4OGzt24gUiQfaD77w75IBC0kuDmOBEeBSKR
	GhIKjq+5xzI3m0ADmMKdLXSpAWzta6K43yZmixCSgYaQzjn1nPJNOxaOUBKdNBgVjjf
	2vhEla02hScWM1tGcdI0jkhF8s7x8PKU33212cuU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GPqlv3xvDeukdDFseEaR83H66Eo7QoeKriLBtsq55dw=;
	b=jvGpHvgmMolaACEx/vnH+gCBIevZxfc+KolmDEfo0zo+czQVYJeVm3SCWE2xtfFf
	z9jprCoZIR7VXNleQWmEi3R/YjGPtuGQ6PxSTbTkfE33BAiwFCDpkmdEl5vbobNpeZp
	vbVqZU530W1xLzm5l8uLxxb1xDUD/MkLlyunFY9g=
Content-Type: multipart/mixed; boundary="===============6989048483107832796=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 25.4.0 FAILED
Message-ID: <0101019a564e9486-fc2a118e-a6ee-40f9-9ad0-82339deef5e6-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225823

--===============6989048483107832796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-attrs* to *25.4.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-attrs-upgrade-25.3.0-25.4.0.patch
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
From 3354b87799ecfe785e99affb358fc0164fa921b6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 16:34:21 +0000
Subject: [PATCH] python3-attrs: upgrade 25.3.0 -> 25.4.0

---
 .../python/{python3-attrs_25.3.0.bb => python3-attrs_25.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_25.3.0.bb => python3-attrs_25.4.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-attrs_25.3.0.bb b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-attrs_25.3.0.bb
rename to meta/recipes-devtools/python/python3-attrs_25.4.0.bb
index bed26a5184..c003a836c0 100644
--- a/meta/recipes-devtools/python/python3-attrs_25.3.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "75d7cefc7fb576747b2c81b4442d4d4a1ce0900973527c011d1030fd3bf4af1b"
+SRC_URI[sha256sum] = "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35c57e11"
 
 inherit pypi ptest-python-pytest python_hatchling
 
-- 
2.47.1


--===============6989048483107832796==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-25.3.0-25.4.0.patch"

RnJvbSAzMzU0Yjg3Nzk5ZWNmZTc4NWU5OWFmZmIzNThmYzAxNjRmYTkyMWI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNjozNDoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYXR0cnM6IHVwZ3JhZGUgMjUuMy4wIC0+IDI1LjQuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLWF0dHJzXzI1LjMuMC5iYiA9PiBweXRob24zLWF0dHJzXzI1LjQuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWF0dHJzXzI1LjMuMC5iYiA9PiBw
eXRob24zLWF0dHJzXzI1LjQuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNfMjUuMy4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI1LjQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNf
MjUuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
YXR0cnNfMjUuNC4wLmJiCmluZGV4IGJlZDI2YTUxODQuLmMwMDNhODM2YzAgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yNS4zLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI1LjQuMC5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5hdHRycy5vcmcvIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT01ZTU1NzMx
ODI0Y2Y5MjA1Y2ZhYmVhYjlhMDYwMDg4NyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc1ZDdj
ZWZjN2ZiNTc2NzQ3YjJjODFiNDQ0MmQ0ZDRhMWNlMDkwMDk3MzUyN2MwMTFkMTAzMGZkM2JmNGFm
MWIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTZkNTk2OWI4N2YwODU5ZWYzM2E0OGIzNWQ1NWFj
MWJlNmU0MmFlNDlkNWU4NTNiNTk3ZGI3MGMzNWM1N2UxMSIKIAogaW5oZXJpdCBweXBpIHB0ZXN0
LXB5dGhvbi1weXRlc3QgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============6989048483107832796==
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
DISTRO_VERSION       = "5.2.99+snapshot-c80174d91dd0c7127c290779998475b25901256e"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:c80174d91dd0c7127c290779998475b25901256e"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 261 Local 246 Mirrors 0 Missed 15 Current 490 (94% match, 98% complete)
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 614 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 654 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb:do_package_setscene)
NOTE: Running setscene task 728 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 750 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_package_setscene: Started
NOTE: Running task 1430 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_fetch)
NOTE: recipe python3-attrs-25.4.0-r0: task do_fetch: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1726 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_unpack)
NOTE: Running task 1727 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-25.4.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2027 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_patch)
NOTE: Running task 2028 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-attrs-25.4.0-r0: task do_patch: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 751 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-attrs-25.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_patch: Succeeded
NOTE: Running task 2092 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_configure)
NOTE: recipe python3-attrs-25.4.0-r0: task do_configure: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2093 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_configure_ptest_base)
NOTE: recipe python3-attrs-25.4.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2094 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_compile)
NOTE: recipe python3-attrs-25.4.0-r0: task do_compile: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2095 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_compile_ptest_base)
NOTE: recipe python3-attrs-25.4.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2096 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_install)
NOTE: recipe python3-attrs-25.4.0-r0: task do_install: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_install: Succeeded
NOTE: Running task 2097 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_install_ptest_base)
NOTE: recipe python3-attrs-25.4.0-r0: task do_install_ptest_base: Started
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| install: cannot stat '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/sources/attrs-25.4.0/conftest.py': No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.1011885:210 exit 1 from 'install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/sources/attrs-25.4.0/conftest.py /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/image/usr/lib/python3-attrs/ptest/'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install_ptest, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.1011885, line 210
| 	#2: do_install_ptest_base, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.1011885, line 161
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.1011885, line 240
NOTE: recipe python3-attrs-25.4.0-r0: task do_install_ptest_base: Failed
NOTE: Tasks Summary: Attempted 2097 tasks of which 2086 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105163404.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105163404.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_install_ptest_base
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/log.do_install_ptest_base.1011885
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-attrs-25.4.0-r0 do_install_ptest_base: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.1011885' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/log.do_install_ptest_base.1011885
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_install_ptest_base) failed with exit code '1'

--===============6989048483107832796==--

