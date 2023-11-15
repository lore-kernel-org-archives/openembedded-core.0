Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228A6C54F60
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:11 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.14615.1700059029410658477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DKgXCoTJ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ow1lk7RI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018bd36a1cfd-8a4571a3-f06e-48eb-a89b-d8d98d2a3c95-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vwPp6zQeReNNimKFzVD2DCMSEATwC54bM0rTJTSQkyQ=;
	b=DKgXCoTJrtjb3O4ZRQF2FLeHfPghE5I7reTPoDPfx5I98cw/lLAshxfyQuLnYFO5
	ccOq3mMypQX5U76F4nBWJhwBJsH6PABqXB0NVrN7rSO4JStVtaS4bfLmSAccOJs/BMN
	KaBllPrrpzAJFe2WZKXZ/Q/evfb+cPrYT9SIXcmY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vwPp6zQeReNNimKFzVD2DCMSEATwC54bM0rTJTSQkyQ=;
	b=Ow1lk7RIC6fiXrjRH5nHMNq0hzF5RhidgCC6KkQInl4V0+Q30z3htHNB6Zyg6xbG
	SkrDYArKeZ58a+vGK3KzEuVyaqrHSQBoggFJXxQbiA4mNUnWJAfMhDNGR0iR/D2itI3
	1/1n4zVJsnEApEUnRklo9KvRsr8RD4BEw7XftXLQ=
Content-Type: multipart/mixed; boundary="===============1202754316130597543=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] desktop-file-utils: upgrading to 0.27 FAILED
Message-ID: <0101018bd36a1cfd-8a4571a3-f06e-48eb-a89b-d8d98d2a3c95-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190610

--===============1202754316130597543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *desktop-file-utils* to *0.27* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-desktop-file-utils-upgrade-0.26-0.27.patch
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
From 108c0b38f75156f81507e83f4ae75626bbd711ff Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:47:20 +0000
Subject: [PATCH] desktop-file-utils: upgrade 0.26 -> 0.27

---
 .../{desktop-file-utils_0.26.bb => desktop-file-utils_0.27.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.26.bb => desktop-file-utils_0.27.bb} (84%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
similarity index 84%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
index f6d1146e89..6c3f8b1921 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
 SRC_URI = "http://freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "29739e005f5887cf41639b8450f3c23f"
-SRC_URI[sha256sum] = "b26dbde79ea72c8c84fb7f9d870ffd857381d049a86d25e0038c4cef4c747309"
+SRC_URI[sha256sum] = "a0817df39ce385b6621880407c56f1f298168c040c2032cedf88d5b76affe836"
 
 DEPENDS = "glib-2.0"
 
-- 
2.39.2


--===============1202754316130597543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1846 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6937960b1aeb9676d3910e8535ce4e6724e97bd5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6937960b1aeb9676d3910e8535ce4e6724e97bd5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 115 Local 103 Mirrors 0 Missed 12 Current 336 (89% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 343 of 451 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_create_spdx_setscene)
NOTE: Running task 417 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa)
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.78.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa unihash changed to a9a128387601ede696a2637259f8b91371de3212adec3e8a048283a95a2d7042
NOTE: Running setscene task 429 of 451 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1000 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 443 of 451 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: Running task 1051 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 446 of 451 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: Running task 1064 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1065 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_lic)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 451 of 451 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/dwarfsrcfiles/dwarfsrcfiles.bb:do_populate_sysroot_setscene)
NOTE: Running task 1201 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_lic: Started
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_lic unihash changed to 7e9040fe923af576216b2476d81821011a114f57d86b5337ec2c40c1946369bd
NOTE: recipe dwarfsrcfiles-native-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch unihash changed to 81812d295327f253ea68a77b5f0cdf4d9a631b039c3cb23bb23802aab9f070ea
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1288 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: Setscene tasks completed
NOTE: Running task 1289 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 1290 of 1301 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 52
| make: *** No targets specified and no makefile found.  Stop.
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.3736634:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.3736634, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.3736634, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.3736634, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.3736634, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.3736634, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.3736634, line 195
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1290 tasks of which 1280 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115054702.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115054702.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: desktop-file-utils-0.27-r0 do_compile: oe_runmake failed
ERROR: desktop-file-utils-0.27-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.3736634', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/desktop-file-utils/0.27/temp/log.do_compile.3736634
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile) failed with exit code '1'

--===============1202754316130597543==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-desktop-file-utils-upgrade-0.26-0.27.patch"

RnJvbSAxMDhjMGIzOGY3NTE1NmY4MTUwN2U4M2Y0YWU3NTYyNmJiZDcxMWZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6NDc6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
ZXNrdG9wLWZpbGUtdXRpbHM6IHVwZ3JhZGUgMC4yNiAtPiAwLjI3CgotLS0KIC4uLi97ZGVza3Rv
cC1maWxlLXV0aWxzXzAuMjYuYmIgPT4gZGVza3RvcC1maWxlLXV0aWxzXzAuMjcuYmJ9IHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVza3RvcC1maWxlLXV0aWxzL3tkZXNrdG9wLWZpbGUt
dXRpbHNfMC4yNi5iYiA9PiBkZXNrdG9wLWZpbGUtdXRpbHNfMC4yNy5iYn0gKDg0JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVza3RvcC1maWxlLXV0aWxzL2Rlc2t0b3At
ZmlsZS11dGlsc18wLjI2LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Rlc2t0b3AtZmlsZS11
dGlscy9kZXNrdG9wLWZpbGUtdXRpbHNfMC4yNy5iYgpzaW1pbGFyaXR5IGluZGV4IDg0JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVza3RvcC1maWxlLXV0aWxzL2Rlc2t0b3At
ZmlsZS11dGlsc18wLjI2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGVza3Rv
cC1maWxlLXV0aWxzL2Rlc2t0b3AtZmlsZS11dGlsc18wLjI3LmJiCmluZGV4IGY2ZDExNDZlODku
LjZjM2Y4YjE5MjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kZXNrdG9wLWZp
bGUtdXRpbHMvZGVza3RvcC1maWxlLXV0aWxzXzAuMjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2Rlc2t0b3AtZmlsZS11dGlscy9kZXNrdG9wLWZpbGUtdXRpbHNfMC4yNy5iYgpAQCAt
OCw4ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVl
NGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
c3JjL3ZhbGlkYXRvci5jO2JlZ2lubGluZT00O2VuZGxpbmU9Mjc7bWQ1PTI4MWUxMTE0ZWU2YzQ4
NmExYTBhNDI5NTk4NmI5NDE2IgogCiBTUkNfVVJJID0gImh0dHA6Ly9mcmVlZGVza3RvcC5vcmcv
c29mdHdhcmUvJHtCUE59L3JlbGVhc2VzLyR7QlB9LnRhci54eiIKLVNSQ19VUklbbWQ1c3VtXSA9
ICIyOTczOWUwMDVmNTg4N2NmNDE2MzliODQ1MGYzYzIzZiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9
ICJiMjZkYmRlNzllYTcyYzhjODRmYjdmOWQ4NzBmZmQ4NTczODFkMDQ5YTg2ZDI1ZTAwMzhjNGNl
ZjRjNzQ3MzA5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImEwODE3ZGYzOWNlMzg1YjY2MjE4ODA0
MDdjNTZmMWYyOTgxNjhjMDQwYzIwMzJjZWRmODhkNWI3NmFmZmU4MzYiCiAKIERFUEVORFMgPSAi
Z2xpYi0yLjAiCiAKLS0gCjIuMzkuMgoK

--===============1202754316130597543==--

