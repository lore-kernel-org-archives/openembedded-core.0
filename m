Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47036C3527A
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.13919.1646329344956540771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MVprjqNA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017f50e02fcc-89e36863-77db-4595-9df1-dc73dcb7bd61-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nMoFj9QaKgaaSzuVXDBd3p1daSCiblG5YH4KaEhEObc=;
	b=MVprjqNAAK7Xsh26WGUbkQHyy1gDlnBJFFpbhH4M75PI0jrDTcvZIvfQQKuv/SRV
	sG7YcKqOJLEbaiMMyroyzlM7B+jHXC2TgoR4nAqHmTC6hgOOok+yJpuRuocdoDkVFFK
	Nj+yz2oACmiczco7yKfWAFk1jHF7c4FbVJtYGBBQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nMoFj9QaKgaaSzuVXDBd3p1daSCiblG5YH4KaEhEObc=;
	b=BKetLW2U4h3Xm60eIKZWzhwMcPi6qQQP0LGy83A8nisk3N6vZSbpBcDjindi50q1
	seB3OkfZgASNrRlCNPWJvPWINR2vpqe2jL3VlGx6n5l7qOeJSX/Crbl15LxMKhx58qP
	BjVkuVnFNAKSf5QmFqjnjBZmg9E37kMQSZ4Ilb8w=
Content-Type: multipart/mixed; boundary="===============7867251654168983363=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.4.0 FAILED
Message-ID: 
 <0101017f50e02fcc-89e36863-77db-4595-9df1-dc73dcb7bd61-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162682

--===============7867251654168983363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.4.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-3.2.0-4.4.0.patch
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
--===============7867251654168983363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1521 entries from dependency cache.
Parsing recipes...done.
Parsing of 843 .bb files complete (842 cached, 1 parsed). 1521 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.53.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.4+snapshot-b6dc3fd019a750cfa0f56e80545ec2ae654bd0f0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b6dc3fd019a750cfa0f56e80545ec2ae654bd0f0"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 98 Local 91 Mirrors 0 Missed 7 Current 283 (92% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1039 of 1400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1387 of 1400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_unpack)
NOTE: Running task 1388 of 1400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1389 of 1400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_patch)
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1390 of 1400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1391 of 1400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_populate_lic)
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1392 of 1400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1393 of 1400 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.4.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.4.0-r0/jsonschema-4.4.0/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.4.0-r0/temp/run.do_compile.2557868:178 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.4.0-r0/temp/run.do_compile.2557868, line 178
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.4.0-r0/temp/run.do_compile.2557868, line 168
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.4.0-r0/temp/run.do_compile.2557868, line 157
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.4.0-r0/temp/run.do_compile.2557868, line 182
NOTE: recipe python3-jsonschema-4.4.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1393 tasks of which 1385 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-jsonschema-4.4.0-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-jsonschema-4.4.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.4.0-r0/temp/run.do_compile.2557868', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-jsonschema/4.4.0-r0/temp/log.do_compile.2557868
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb:do_compile) failed with exit code '1'

--===============7867251654168983363==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-3.2.0-4.4.0.patch"

From 27b3d81c48a3cf65e966984e6fbf66f52679cb20 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 14:21:26 +0000
Subject: [PATCH] python3-jsonschema: upgrade 3.2.0 -> 4.4.0

---
 ...python3-jsonschema_3.2.0.bb => python3-jsonschema_4.4.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_3.2.0.bb => python3-jsonschema_4.4.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
index c7efe33a83..48e634b369 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.4.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
-SRC_URI[md5sum] = "f1a0b5011f05a02a8dee1070cd10a26d"
-SRC_URI[sha256sum] = "c8a85b28d377cc7737e46e2d9f2b4f44ee3c0e1deac6bf46ddefc7187d30797a"
+SRC_URI[sha256sum] = "636694eb41b3535ed608fe04129f26542b59ed99808b4f688aa32dcf55317a83"
 
 inherit pypi setuptools3
 
-- 
2.27.0


--===============7867251654168983363==--

