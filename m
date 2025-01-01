Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF21C0218A
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:36 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.11337.1735723943229020255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Rv5J4lFA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=lxR9sUnD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019421359648-1ff414bc-3314-4fe8-bd45-6c6d4a344981-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3G7Egdf5S8hGH7btTCBLRTF+c+8qA+bDKQtLwbsohDk=;
	b=Rv5J4lFAHTEVokJwfc1AJA4oBJwbsRZ14ZoY/R1U4VxJyJebJKbArgkVmhRUkTR7
	OKitrou/F3gW0kx8jQqoi7dQayAmGCiDnfnBZfmako0gd2uWE8rStWkW4+swje+QgEI
	A1mFoEutqTIvrjkCVkpcZmOpgu4v5rM0WzitHjTs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723948;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3G7Egdf5S8hGH7btTCBLRTF+c+8qA+bDKQtLwbsohDk=;
	b=lxR9sUnD693wKsQVfHe4vRsjqzLt9BQNvBEZ0MI8P3UY6N7liwROyTselL1o7Lxg
	4VlZmKS7ni3DU6waOqrsvOkOXRGWb2ey+iRyYADgc7vc+zlJ4jm/Oh5SUsCniF1c14r
	r0vdscrTm32fgqlbjpIpzOSouQiUv/x+9kKYUORE=
Content-Type: multipart/mixed; boundary="===============8024044128528295094=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-webcolors: upgrading to 24.11.1 FAILED
Message-ID: <0101019421359648-1ff414bc-3314-4fe8-bd45-6c6d4a344981-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209219

--===============8024044128528295094==
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
From aea6b6b0907f7e248bb626a61aea1aab4021bb36 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 07:28:22 +0000
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


--===============8024044128528295094==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-webcolors-upgrade-24.8.0-24.11.1.patch"

RnJvbSBhZWE2YjZiMDkwN2Y3ZTI0OGJiNjI2YTYxYWVhMWFhYjQwMjFiYjM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNzoyODoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtd2ViY29sb3JzOiB1cGdyYWRlIDI0LjguMCAtPiAyNC4xMS4xCgotLS0KIC4uLnB5dGhv
bjMtd2ViY29sb3JzXzI0LjguMC5iYiA9PiBweXRob24zLXdlYmNvbG9yc18yNC4xMS4xLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtd2ViY29sb3JzXzI0Ljgu
MC5iYiA9PiBweXRob24zLXdlYmNvbG9yc18yNC4xMS4xLmJifSAoODclKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuOC4wLmJi
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC4xMS4x
LmJiCnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy13ZWJjb2xvcnNfMjQuOC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2ViY29sb3JzXzI0LjExLjEuYmIKaW5kZXggMTk5
OGNmYzRjMS4uMTA0ODE2NjY4ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC44LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXdlYmNvbG9yc18yNC4xMS4xLmJiCkBAIC0zLDcgKzMsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3Qvd2ViY29sb3JzLyIKIExJQ0VOU0Ug
PSAiQlNELTMtQ2xhdXNlIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9
Y2JhZWJlYzQzYjdkMTk5YzdmZDhmNTQxMWIzYjA0NDgiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICIwOGIwN2FmMjg2YTAxYmNkMzBkNTgzYTdhY2FkZjYyOTU4M2QxZjc5YmZlZjI3ZGQyYzJjNWMy
NjM4MTcyNzdkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVjYjNkNzY4ZjMyMjAyYWY3NzA0Nzdi
OGI2NWYzMThmYTRmNTY2YzIyOTQ4NjczYTk3N2IwMGQ1ODlkZDgwZjYiCiAKIGluaGVyaXQgcHlw
aSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0CiAKLS0gCjIuNDQuMQoK

--===============8024044128528295094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:586924949eb537431be25fc3ca7a46bc1550c04c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 351 Local 342 Mirrors 0 Missed 9 Current 386 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 419 of 737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 697 of 737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 737 of 737 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2061 of 2083 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_fetch)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 2062 of 2083 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_unpack)
NOTE: Running task 2063 of 2083 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_unpack: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 2064 of 2083 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_patch)
NOTE: Running task 2065 of 2083 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_patch: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-webcolors-24.11.1-r0: task do_patch: Succeeded
NOTE: Running task 2067 of 2083 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_configure)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_configure: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_configure: Succeeded
NOTE: Running task 2069 of 2083 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_configure_ptest_base)
NOTE: recipe python3-webcolors-24.11.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-webcolors-24.11.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2070 of 2083 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_compile)
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.1342066:157 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/webcolors-24.11.1'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.1342066, line 157
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.1342066, line 152
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.1342066, line 168
NOTE: recipe python3-webcolors-24.11.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 2070 tasks of which 2062 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250101072808.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250101072808.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/log.do_compile.1342066
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-webcolors-24.11.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/run.do_compile.1342066' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/temp/log.do_compile.1342066
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb:do_compile) failed with exit code '1'

--===============8024044128528295094==--

