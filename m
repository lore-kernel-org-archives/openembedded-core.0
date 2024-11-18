Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A2FD6007F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4671.1731964625253513889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=dONHLdLp;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FpJP0ikk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019341231dfc-df2715bf-ed60-47d0-8279-bea8a58a8e78-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964640;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=87IpT40aHvocCdgTtIuY2RjxFlfW4/vx/I7/+CMFJPY=;
	b=dONHLdLpWrZLqbDyaVWg3gFuPm8tr7JejmHAZs25vI0+7ILJ7y9YeqMGDWdwaHul
	QDZfcN9tbjYNVjYrd/gWPJzf9oDPepMCjI5S+PVQwzdPdk16a8BocMvcTvHqCiEFpm4
	AOnaiqLkRxcB9oyADNL65ErK9MbFK7FpFZis5Qbs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964640;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=87IpT40aHvocCdgTtIuY2RjxFlfW4/vx/I7/+CMFJPY=;
	b=FpJP0ikkG2dIe8JTkOYsfo6019rFEaoC8p+KCjNFFTCNsY0d2nPbXTi9nUDvByM+
	2yQzytc6wIE/fIbB8WwfJK6Vidi1frPA1ZJI4I/eiewLD+3gC9exFA53XpgZx9FBlpD
	eNjmfg6V2HloD+HXBikGJkNRsv7uEOm0Pa5klQbc=
Content-Type: multipart/mixed; boundary="===============2414925613209826202=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-webcolors: upgrading to 24.11.1 FAILED
Message-ID: <0101019341231dfc-df2715bf-ed60-47d0-8279-bea8a58a8e78-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207296

--===============2414925613209826202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-webcolors* to *24.11.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-webcolors-upgrade-24.8.0-24.11.1.patch
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
From 35fe0ce8bff6288bbe6848fd76a9b8e046f466c3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 17 Nov 2024 03:18:03 +0000
Subject: [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1

---
 ...python3-webcolors_24.8.0.bb => python3-webcolors_24.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-webcolors_24.8.0.bb => python3-webcolors_24.11.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
rename to meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
index 1998cfc4c1..104816668e 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
 
-SRC_URI[sha256sum] = "08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd2c2c5c263817277d"
+SRC_URI[sha256sum] = "ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f6"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.44.1


--===============2414925613209826202==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-webcolors-upgrade-24.8.0-24.11.1.patch"

RnJvbSAzNWZlMGNlOGJmZjYyODhiYmU2ODQ4ZmQ3NmE5YjhlMDQ2ZjQ2NmMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTcgTm92IDIwMjQgMDM6MTg6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdlYmNvbG9yczogdXBncmFkZSAyNC44LjAgLT4gMjQuMTEuMQoKLS0tCiAuLi5weXRo
b24zLXdlYmNvbG9yc18yNC44LjAuYmIgPT4gcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXdlYmNvbG9yc18yNC44
LjAuYmIgPT4gcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYn0gKDg3JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjguMC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEu
MS5iYgpzaW1pbGFyaXR5IGluZGV4IDg3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjguMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC4xMS4xLmJiCmluZGV4IDE5
OThjZmM0YzEuLjEwNDgxNjY2OGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuOC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuMTEuMS5iYgpAQCAtMyw3ICszLDcgQEAg
SE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3dlYmNvbG9ycy8iCiBMSUNFTlNF
ID0gIkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1
PWNiYWViZWM0M2I3ZDE5OWM3ZmQ4ZjU0MTFiM2IwNDQ4IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMDhiMDdhZjI4NmEwMWJjZDMwZDU4M2E3YWNhZGY2Mjk1ODNkMWY3OWJmZWYyN2RkMmMyYzVj
MjYzODE3Mjc3ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlY2IzZDc2OGYzMjIwMmFmNzcwNDc3
YjhiNjVmMzE4ZmE0ZjU2NmMyMjk0ODY3M2E5NzdiMDBkNTg5ZGQ4MGY2IgogCiBpbmhlcml0IHB5
cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBwdGVzdAogCi0tIAoyLjQ0LjEKCg==

--===============2414925613209826202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1882 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1880 targets, 41 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:beedaafa9500357689e4e0b6d59c5a58455dc137"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 330 Local 318 Mirrors 0 Missed 12 Current 396 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1300 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_recipe_qa)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2020 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_fetch)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 2021 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_unpack)
NOTE: Running task 2022 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 2023 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_patch)
NOTE: Running task 2024 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_patch: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_patch: Succeeded
NOTE: Running task 2025 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2026 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_populate_lic)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_populate_lic: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2027 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_configure)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_configure: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_configure: Succeeded
NOTE: Running task 2028 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_configure_ptest_base)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2029 of 2042 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_compile)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
|     raise BackendUnavailable(
|     ...<4 lines>...
|     )
| pyproject_hooks._impl.BackendUnavailable: Cannot import 'pdm.backend'
| 
| ERROR Backend 'pdm.backend' is not available.
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.3362378:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/webcolors-24.11.1'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.3362378, line 157
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.3362378, line 152
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.3362378, line 168
NOTE: recipe python3-webcolors-24.11.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2029 tasks of which 2018 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241117031659.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241117031659.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/log.do_compile.3362378
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-webcolors-24.11.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.3362378' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/log.do_compile.3362378
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_compile) failed with exit code '1'

--===============2414925613209826202==--

