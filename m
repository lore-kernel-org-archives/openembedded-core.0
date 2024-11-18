Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AA7D60055
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.4677.1731964628616939121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MTT+sp9o;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=OkgZsoQj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101934122ea5c-e747e691-bff9-4cc9-867b-f376082a1244-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KOPPXErSGfKC8O1M0eupWEKIgDDiANqIfMzA4t8tau4=;
	b=MTT+sp9oI6Io2WrOMP9l9u+glH9xPBfl6jtvwzemM3YC05UzkgeKczRdpjYdldaD
	mUQhImhkBwsDLydCcCTRTMOkMr4rBFLTbZCRmffvOfeWvnSm8IDR3roW5QZcUhRgr8g
	8mGhNT5qLVAVQX6+hUaotHgWwThG7RtMpZQeTQl0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964628;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KOPPXErSGfKC8O1M0eupWEKIgDDiANqIfMzA4t8tau4=;
	b=OkgZsoQjC+p7kmq+letotDj/vf++wxA3ehvRv8jCF4r4oIE5foGWxbCikSP+F8j4
	zckNbRGAIqDgHjKHrImRIGa5marcxuIUE07ZzhJrnTBcBA3QVYaZV9BjVc8W9ClQD1J
	x6OAqYIdmDltpzTrkcM4k5908vxAFfIFfzxGwuAg=
Content-Type: multipart/mixed; boundary="===============0224752885524467127=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-hatchling: upgrading to 1.26.3 FAILED
Message-ID: <010101934122ea5c-e747e691-bff9-4cc9-867b-f376082a1244-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207278

--===============0224752885524467127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-hatchling* to *1.26.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-hatchling-upgrade-1.25.0-1.26.3.patch
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
From 3c7a4f94e41d5e48dc08e16967f869c8d57d3f45 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 21:17:40 +0000
Subject: [PATCH] python3-hatchling: upgrade 1.25.0 -> 1.26.3

---
 ...{python3-hatchling_1.25.0.bb => python3-hatchling_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.25.0.bb => python3-hatchling_1.26.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
index 111b447815..590456ad9b 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.25.0.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-pathspec-native python3-packaging-native python3-editables-native python3-trove-classifiers-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "7064631a512610b52250a4d3ff1bd81551d6d1431c4eb7b72e734df6c74f4262"
+SRC_URI[sha256sum] = "b672a9c36a601a06c4e88a1abb1330639ee8e721e0535a37536e546a667efc7a"
 
 do_compile:prepend() {
     export PYTHONPATH=src
-- 
2.44.1


--===============0224752885524467127==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-hatchling-upgrade-1.25.0-1.26.3.patch"

RnJvbSAzYzdhNGY5NGU0MWQ1ZTQ4ZGMwOGUxNjk2N2Y4NjljOGQ1N2QzZjQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMjE6MTc6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWhhdGNobGluZzogdXBncmFkZSAxLjI1LjAgLT4gMS4yNi4zCgotLS0KIC4uLntweXRo
b24zLWhhdGNobGluZ18xLjI1LjAuYmIgPT4gcHl0aG9uMy1oYXRjaGxpbmdfMS4yNi4zLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjUu
MC5iYiA9PiBweXRob24zLWhhdGNobGluZ18xLjI2LjMuYmJ9ICg4NSUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI1LjAuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjYuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtaGF0Y2hsaW5nXzEuMjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI2LjMuYmIKaW5kZXggMTExYjQ0
NzgxNS4uNTkwNDU2YWQ5YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWhhdGNobGluZ18xLjI1LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWhhdGNobGluZ18xLjI2LjMuYmIKQEAgLTgsNyArOCw3IEBAIGluaGVy
aXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiBERVBFTkRTICs9ICJweXRob24zLXBsdWdneS1uYXRp
dmUgcHl0aG9uMy1wYXRoc3BlYy1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIHB5dGhv
bjMtZWRpdGFibGVzLW5hdGl2ZSBweXRob24zLXRyb3ZlLWNsYXNzaWZpZXJzLW5hdGl2ZSIKIERF
UEVORFM6cmVtb3ZlOmNsYXNzLW5hdGl2ZSA9ICJweXRob24zLWhhdGNobGluZy1uYXRpdmUiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3MDY0NjMxYTUxMjYxMGI1MjI1MGE0ZDNmZjFiZDgxNTUx
ZDZkMTQzMWM0ZWI3YjcyZTczNGRmNmM3NGY0MjYyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI2
NzJhOWMzNmE2MDFhMDZjNGU4OGExYWJiMTMzMDYzOWVlOGU3MjFlMDUzNWEzNzUzNmU1NDZhNjY3
ZWZjN2EiCiAKIGRvX2NvbXBpbGU6cHJlcGVuZCgpIHsKICAgICBleHBvcnQgUFlUSE9OUEFUSD1z
cmMKLS0gCjIuNDQuMQoK

--===============0224752885524467127==
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
workspace            = "tmp-auh-upgrades:c6136fa39a5b8e31de6527e38c3ec7c9c541e2bd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 317 Local 301 Mirrors 0 Missed 16 Current 358 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1471 of 1924 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_recipe_qa)
NOTE: Running task 1472 of 1924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_recipe_qa)
NOTE: recipe python3-hatchling-1.26.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-hatchling-1.26.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1894 of 1924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_fetch)
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1895 of 1924 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_fetch)
NOTE: recipe python3-hatchling-1.26.3-r0: task do_fetch: Started
NOTE: recipe python3-hatchling-1.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 1896 of 1924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_unpack)
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_fetch: Started
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_fetch: Succeeded
NOTE: Running task 1897 of 1924 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_unpack)
NOTE: Running task 1898 of 1924 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hatchling-1.26.3-r0: task do_unpack: Started
NOTE: recipe python3-hatchling-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 1899 of 1924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_patch)
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_unpack: Started
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_unpack: Succeeded
NOTE: Running task 1900 of 1924 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_patch)
NOTE: Running task 1901 of 1924 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-hatchling-1.26.3-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_patch: Started
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hatchling-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 1902 of 1924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1903 of 1924 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_populate_lic)
NOTE: recipe python3-hatchling-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-1.26.3-r0: task do_populate_lic: Started
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-hatchling-1.26.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_patch: Succeeded
NOTE: Running task 1904 of 1924 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hatchling-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1905 of 1924 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_configure)
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_configure: Started
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_configure: Succeeded
NOTE: Running task 1906 of 1924 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_compile)
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| 
| ERROR Missing dependencies:
| 	packaging>=24.2
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.26.3/temp/run.do_compile.2304485:159 exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.26.3/dist /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.26.3/hatchling-1.26.3'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.26.3/temp/run.do_compile.2304485, line 159
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.26.3/temp/run.do_compile.2304485, line 154
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.26.3/temp/run.do_compile.2304485, line 163
NOTE: recipe python3-hatchling-native-1.26.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1906 tasks of which 1891 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116211637.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241116211637.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.26.3/temp/log.do_compile.2304485
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-hatchling-native-1.26.3-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.26.3/temp/run.do_compile.2304485' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/python3-hatchling-native/1.26.3/temp/log.do_compile.2304485
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hatchling_1.26.3.bb:do_compile) failed with exit code '1'

--===============0224752885524467127==--

