Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA92CED245
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11933.1763224717426646307
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uqfa5lSJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=mJK0hhwT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019a88621c6f-467f571a-5ed4-4d9f-b49c-7376e9c7d9b5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224722;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y0lO2EVRTG+m80bhXmZ5nkuGLBFoYwA0zQBGxkWsWkw=;
	b=uqfa5lSJoodcnAkc/XG5WnDqFK54GiFyTQfpwk0Onq57Z+jbqK9Q3ukyYj7mdeTZ
	avUQ0WuwrBwOf5KyCDkWEdgz940tCV6Ud+sVl++FequOt5Q6rBvubU0F12Mvaj0Gpml
	eu228lsgTK3iHIuclVwVhQAkZHPcuEx/ts2WVZ3c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224722;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y0lO2EVRTG+m80bhXmZ5nkuGLBFoYwA0zQBGxkWsWkw=;
	b=mJK0hhwTdAty1mm9RlFSzAygayxFRLQHxp8AYQ45zZrB/BaM2E7/YZRlEF1NU6B8
	0agrnW/20qp4+2CVkPphohdzxIqx7bvs9SPoOvfrOBzLJlegeM8qhJDuCgDo/Zh5sef
	gPojOzWTW0A+8X18+mbC+TRqWK3cZuH61zlblYOQ=
Content-Type: multipart/mixed; boundary="===============3039206600314206314=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-attrs: upgrading to 25.4.0 FAILED
Message-ID: <0101019a88621c6f-467f571a-5ed4-4d9f-b49c-7376e9c7d9b5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226346

--===============3039206600314206314==
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
From 12626dd2fb188f55b160e9710482e3089e9045f0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 09:50:14 +0000
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


--===============3039206600314206314==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-attrs-upgrade-25.3.0-25.4.0.patch"

RnJvbSAxMjYyNmRkMmZiMTg4ZjU1YjE2MGU5NzEwNDgyZTMwODllOTA0NWYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDk6NTA6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWF0dHJzOiB1cGdyYWRlIDI1LjMuMCAtPiAyNS40LjAKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1hdHRyc18yNS4zLjAuYmIgPT4gcHl0aG9uMy1hdHRyc18yNS40LjAuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1hdHRyc18yNS4zLjAuYmIgPT4g
cHl0aG9uMy1hdHRyc18yNS40LjAuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJzXzI1LjMuMC5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yNS40LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWF0dHJz
XzI1LjMuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWF0dHJzXzI1LjQuMC5iYgppbmRleCBiZWQyNmE1MTg0Li5jMDAzYTgzNmMwIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXR0cnNfMjUuMy4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hdHRyc18yNS40LjAuYmIK
QEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHA6Ly93d3cuYXR0cnMub3JnLyIKIExJQ0VO
U0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NWU1NTcz
MTgyNGNmOTIwNWNmYWJlYWI5YTA2MDA4ODciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3NWQ3
Y2VmYzdmYjU3Njc0N2IyYzgxYjQ0NDJkNGQ0YTFjZTA5MDA5NzM1MjdjMDExZDEwMzBmZDNiZjRh
ZjFiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE2ZDU5NjliODdmMDg1OWVmMzNhNDhiMzVkNTVh
YzFiZTZlNDJhZTQ5ZDVlODUzYjU5N2RiNzBjMzVjNTdlMTEiCiAKIGluaGVyaXQgcHlwaSBwdGVz
dC1weXRob24tcHl0ZXN0IHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40Ny4xCgo=

--===============3039206600314206314==
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
DISTRO_VERSION       = "5.2.99+snapshot-cd3cb65f99dabbf66524436c3fc7cbd218b4234c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:cd3cb65f99dabbf66524436c3fc7cbd218b4234c"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 298 Local 283 Mirrors 0 Missed 15 Current 453 (94% match, 98% complete)
Removing 4 stale sstate objects for arch x86-64-v3...done.
NOTE: Executing Tasks
NOTE: Running setscene task 470 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 665 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb:do_package_setscene)
NOTE: Running setscene task 722 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 750 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_package_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1798 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_fetch)
NOTE: recipe python3-attrs-25.4.0-r0: task do_fetch: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 2070 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_unpack)
NOTE: Running task 2071 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-attrs-25.4.0-r0: task do_unpack: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 751 of 751 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-attrs-25.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 2072 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_patch)
NOTE: Running task 2073 of 2111 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_patch: Started
NOTE: recipe python3-attrs-25.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-attrs-25.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_patch: Succeeded
NOTE: recipe python3-attrs-25.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.2098309:210 exit 1 from 'install /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/sources/attrs-25.4.0/conftest.py /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/image/usr/lib/python3-attrs/ptest/'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install_ptest, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.2098309, line 210
| 	#2: do_install_ptest_base, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.2098309, line 161
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.2098309, line 240
NOTE: recipe python3-attrs-25.4.0-r0: task do_install_ptest_base: Failed
NOTE: Tasks Summary: Attempted 2097 tasks of which 2086 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115094958.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115094958.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_install_ptest_base
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/log.do_install_ptest_base.2098309
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-attrs-25.4.0-r0 do_install_ptest_base: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/run.do_install_ptest_base.2098309' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-attrs/25.4.0/temp/log.do_install_ptest_base.2098309
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-attrs_25.4.0.bb:do_install_ptest_base) failed with exit code '1'

--===============3039206600314206314==--

