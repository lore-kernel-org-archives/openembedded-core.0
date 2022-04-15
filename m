Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3293C47087
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.11567.1650052688281558100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PaNh8GMU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101802ecde68a-68b3bed3-2ab4-42d0-9723-5d74e43c7bd0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1Tp2TmskTFvCVEnZM/W/6eewvHIxi2UEw/hC/XK0FYg=;
	b=PaNh8GMUNtLpIUre5IuL7VdPqWDqvbdq08bnCidDHeVVWuKoDI2Lg8ZAJF7csg2M
	qB6zjJvNRCYFOpa4C9kj4M3ecw2ksWmVc1rZJR494SvTvl9XoZh/jn/7bzytQYh4tVm
	LbfIK8KN/2TBLWPh00KUHZIHrv0VBt7Kpe50ENvY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052687;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1Tp2TmskTFvCVEnZM/W/6eewvHIxi2UEw/hC/XK0FYg=;
	b=HBQwfkUvSz8oVxYbLZXvGBgRP3uCJJrltgNvefzDLcOz55oRGxWp+Qs+YZsm/GZK
	eKBdPfIbSsmFX/AG7THvI+Bey4WEPaBZFfgbG3nKdrRcODGl2yLEF+buqhczCY+4QsK
	i/9SXNGlXDfNevygn7fACZ9oAvMdACYJS+CPaDQ0=
Content-Type: multipart/mixed; boundary="===============8062027008448519012=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.1.1 FAILED
Message-ID: 
 <010101802ecde68a-68b3bed3-2ab4-42d0-9723-5d74e43c7bd0-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:07 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164464

--===============8062027008448519012==
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
--===============8062027008448519012==
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
meta-yocto-bsp       = "tmp-auh-upgrades:ce0b9b10ff38cdae8f8d14f62f260c1ce24a73a9"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.3128374:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.3128374, line 174
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.3128374, line 164
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.3128374, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.3128374, line 178
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
ERROR: python3-typing-extensions-4.1.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/run.do_compile.3128374', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-typing-extensions/4.1.1-r0/temp/log.do_compile.3128374
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb:do_compile) failed with exit code '1'

--===============8062027008448519012==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-3.10.0.0-4.1.1.patch"

From e8dc5381d69a7f11c4de4079399f4f68121af140 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 09:40:50 +0000
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


--===============8062027008448519012==--

