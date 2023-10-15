Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E103AC04FEC
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.102700.1697399113846607371
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HbLqraBb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Fj5k/CqH;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.33, mailfrom: 0101018b34df0555-7347b411-4a44-4d84-b5be-3c44f224344f-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qv0mD53REYZmntcgyxeD3T2QxNaGyDekb3O39RvGCFY=;
	b=HbLqraBbcDjVhlRzMTLEhQy3tLCwpN1Kco0FAwlHcdWvxW512UQgiN1eKIRWW6kz
	msTgZ8GaT3A3CBDgcTYIydCDyzK7pxFVECeootjW9Y2ISTTp2Cib0ryjGrbHtdYC8JI
	7p7e70Fdvh7dmfiw5w+hECTmRDnLMzglcw5i1APM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399113;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qv0mD53REYZmntcgyxeD3T2QxNaGyDekb3O39RvGCFY=;
	b=Fj5k/CqHPyn+4N+fnjcK+bU27BofrYXle6WE5Tf5ClPNrhrSWCJYLBQamlt8Bq8r
	SlGErrXFMbJTgK2LT7t0MSkeLGMybUQkeP91mMMalrVG8O6NYLnnn6wrk/LI8SxQQSc
	KK1WmCXRF9IIOUmbjzBqhfFqvN2F56FT3csgtDE0=
Content-Type: multipart/mixed; boundary="===============5978809770724839844=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] desktop-file-utils: upgrading to 0.27 FAILED
Message-ID: <0101018b34df0555-7347b411-4a44-4d84-b5be-3c44f224344f-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189167

--===============5978809770724839844==
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
From eb3e2723faab40870878deb83340e3f3b1ebb145 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 09:04:49 +0000
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


--===============5978809770724839844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-7c81ce2d07be3e9a2ce0c5ba21f637c010e7e202"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:7c81ce2d07be3e9a2ce0c5ba21f637c010e7e202"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 101 Local 91 Mirrors 0 Missed 10 Current 339 (90% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1174 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_recipe_qa)
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1252 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_fetch: Succeeded
NOTE: Running task 1253 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_unpack)
NOTE: Running task 1254 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_unpack: Succeeded
NOTE: Running task 1255 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_patch)
NOTE: Running task 1256 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_patch: Succeeded
NOTE: Running task 1257 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1258 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_lic)
NOTE: recipe desktop-file-utils-0.27-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_lic: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_populate_lic: Succeeded
NOTE: recipe desktop-file-utils-0.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1259 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_configure)
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.27-r0: task do_configure: Succeeded
NOTE: Running task 1260 of 1269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile)
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| make: *** No targets specified and no makefile found.  Stop.
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.332589:182 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.332589, line 182
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.332589, line 166
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.332589, line 161
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.332589, line 156
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.332589, line 151
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.332589, line 195
NOTE: recipe desktop-file-utils-0.27-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1260 tasks of which 1250 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: desktop-file-utils-0.27-r0 do_compile: oe_runmake failed
ERROR: desktop-file-utils-0.27-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/desktop-file-utils/0.27/temp/run.do_compile.332589', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/desktop-file-utils/0.27/temp/log.do_compile.332589
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_compile) failed with exit code '1'

--===============5978809770724839844==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-desktop-file-utils-upgrade-0.26-0.27.patch"

RnJvbSBlYjNlMjcyM2ZhYWI0MDg3MDg3OGRlYjgzMzQwZTNmM2IxZWJiMTQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDk6MDQ6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
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

--===============5978809770724839844==--

