Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F460C3526F
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.10397.1648819420958445734
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=pvfPJDTb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017fe54bbc89-bd4948cd-0735-4c80-9757-7ec41d3fe414-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KboZkQgtE84QmCO3pEuBIXwM9o7cANST1ISeiqKfA/I=;
	b=pvfPJDTb8D96K9GbOCC1I5F8emFDKejXZo09Vqij6uNjNPX22D8B9viZKTLyCJOP
	CkrZIn/6VeUHq2Z31OgHr3Z9eEas6P3vaVXxTEiymeBSznm8I04+A3/qNTJhmtag1o0
	BgF/qhQIMkAKVUHjbC+qWOegtgRtxnJx6kt7J2RA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KboZkQgtE84QmCO3pEuBIXwM9o7cANST1ISeiqKfA/I=;
	b=AyuVvJeFfyBIkgg2uVgR2y2PjxP0m5mkV8Iwpaat0Z/D+Iiv9EpAD/vrxxoz+IJ1
	coePIdlPyMaMemcidZxRkuQJ49clJeqb298HjtP9gtcUhnp+m69oucqfOzoV1JoIkjf
	2lw2UBgJKQIbmilFFuaDNaUSHP5MxNFBVjkSpc+s=
Content-Type: multipart/mixed; boundary="===============2939841942095880440=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.1.1 FAILED
Message-ID: 
 <0101017fe54bbc89-bd4948cd-0735-4c80-9757-7ec41d3fe414-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163901

--===============2939841942095880440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-typing-extensions* to *4.1.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-3.10.0.0-4.1.1.patch
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
--===============2939841942095880440==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-3.10.0.0-4.1.1.patch"

From 8da7a6c75221dec59a38c6ab6fe632574bfb2c02 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 08:16:26 +0000
Subject: [PATCH] python3-typing-extensions: upgrade 3.10.0.0 -> 4.1.1

---
 ...xtensions_3.10.0.0.bb => python3-typing-extensions_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_3.10.0.0.bb => python3-typing-extensions_4.1.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb
index a8e83fc824..2831b79f9d 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342"
+SRC_URI[sha256sum] = "1a9462dcc3347a79b1f1c0271fbe79e844580bb598bafa1ed208b94da3cdcd42"
 
 inherit pypi setuptools3
 
-- 
2.27.0


--===============2939841942095880440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:603b52beb03cfc41137f9c654999ccb0f9b79a2a"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 91 Local 84 Mirrors 0 Missed 7 Current 201 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 918 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_fetch)
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_fetch: Started
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1097 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_unpack)
NOTE: Running task 1098 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_unpack: Started
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1099 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_patch)
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_patch: Started
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1100 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1101 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_populate_lic)
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_populate_lic: Started
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1102 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_configure)
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_configure: Started
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1103 of 1110 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_compile)
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/typing_extensions-4.1.1/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.4060952:177 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.4060952, line 177
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.4060952, line 167
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.4060952, line 156
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.4060952, line 181
NOTE: recipe python3-typing-extensions-4.1.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1103 tasks of which 1095 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-typing-extensions-4.1.1-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-typing-extensions-4.1.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.4060952', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/log.do_compile.4060952
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_compile) failed with exit code '1'

--===============2939841942095880440==--

