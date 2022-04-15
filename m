Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B36C38A05
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web09.11572.1650052688575921789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=03dv4zFK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101802ecde8f2-3c3e218a-7958-48dc-835a-f0d832996383-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tG76fw80tXgugUWpo/UH48estoliMbLK6hrm8D7qpZc=;
	b=03dv4zFKMko5hyOSdL8uwyJA6bRzOcmmOm1NvG+0fDPnbShztkpJzA/ZgN18x820
	vvm2PAw/kTT28NlSXFyWzRzxgHBtTWO1QTJXmDnk6EfGG2TQdscSTH++fTiINlfIknU
	Zny79Gn9fMJbTwA8wQS3wM3eH/5Zs2KGHWqamY14=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tG76fw80tXgugUWpo/UH48estoliMbLK6hrm8D7qpZc=;
	b=hk7Y8CevhfwN6RMTzElDi4unaGFee/uLEyTDGgO098CYb0ixO1PCyklDXtznvIax
	5vIGsoF/gZpWa30WN+4Lh7paML5V951GsIk0QEz8BZ0WPVMv8hI8k74GMDaXnLqStCa
	3VxwbcVkxlheqxMKq7aOwDzWv3ckq7gV+jrxn9cE=
Content-Type: multipart/mixed; boundary="===============6217657670397161409=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.14.00 FAILED
Message-ID: 
 <010101802ecde8f2-3c3e218a-7958-48dc-835a-f0d832996383-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164470

--===============6217657670397161409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *stress-ng* to *0.14.00* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.13.12-0.14.00.patch
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
--===============6217657670397161409==
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
meta-yocto-bsp       = "tmp-auh-upgrades:ee44d6a013cc7489d8a01422a28eff3426627541"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 34 Local 27 Mirrors 0 Missed 7 Current 143 (79% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 662 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_fetch)
NOTE: recipe stress-ng-0.14.00-r0: task do_fetch: Started
NOTE: recipe stress-ng-0.14.00-r0: task do_fetch: Succeeded
NOTE: Running task 707 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_unpack)
NOTE: Running task 708 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe stress-ng-0.14.00-r0: task do_unpack: Started
NOTE: recipe stress-ng-0.14.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe stress-ng-0.14.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe stress-ng-0.14.00-r0: task do_unpack: Succeeded
NOTE: Running task 709 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_patch)
NOTE: recipe stress-ng-0.14.00-r0: task do_patch: Started
NOTE: recipe stress-ng-0.14.00-r0: task do_patch: Succeeded
NOTE: Running task 710 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_deploy_source_date_epoch)
NOTE: Running task 711 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_populate_lic)
NOTE: recipe stress-ng-0.14.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe stress-ng-0.14.00-r0: task do_populate_lic: Started
NOTE: recipe stress-ng-0.14.00-r0: task do_populate_lic: Succeeded
NOTE: recipe stress-ng-0.14.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 712 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_configure)
NOTE: recipe stress-ng-0.14.00-r0: task do_configure: Started
NOTE: recipe stress-ng-0.14.00-r0: task do_configure: Succeeded
NOTE: Running task 713 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_compile)
NOTE: recipe stress-ng-0.14.00-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| make CC=i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/recipe-sysroot STATIC= -f Makefile.config
| make: invalid option -- '3'
| make: invalid option -- '2'
| make: invalid option -- 'a'
| make: invalid option -- 'c'
| make: invalid option -- '='
| make: invalid option -- 'c'
| make: invalid option -- 'u'
| make: invalid option -- '='
| make: invalid option -- 'c'
| make: invalid option -- '3'
| make: invalid option -- 'D'
| make: invalid option -- '_'
| make: invalid option -- 'F'
| make: unrecognized option '--sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/recipe-sysroot'
| Usage: make [options] [target] ...
| Options:
|   -b, -m                      Ignored for compatibility.
|   -B, --always-make           Unconditionally make all targets.
|   -C DIRECTORY, --directory=DIRECTORY
|                               Change to DIRECTORY before doing anything.
|   -d                          Print lots of debugging information.
|   --debug[=FLAGS]             Print various types of debugging information.
|   -e, --environment-overrides
|                               Environment variables override makefiles.
|   -E STRING, --eval=STRING    Evaluate STRING as a makefile statement.
|   -f FILE, --file=FILE, --makefile=FILE
|                               Read FILE as a makefile.
|   -h, --help                  Print this message and exit.
|   -i, --ignore-errors         Ignore errors from recipes.
|   -I DIRECTORY, --include-dir=DIRECTORY
|                               Search DIRECTORY for included makefiles.
|   -j [N], --jobs[=N]          Allow N jobs at once; infinite jobs with no arg.
|   -k, --keep-going            Keep going when some targets can't be made.
|   -l [N], --load-average[=N], --max-load[=N]
|                               Don't start multiple jobs unless load is below N.
|   -L, --check-symlink-times   Use the latest mtime between symlinks and target.
|   -n, --just-print, --dry-run, --recon
|                               Don't actually run any recipe; just print them.
|   -o FILE, --old-file=FILE, --assume-old=FILE
|                               Consider FILE to be very old and don't remake it.
|   -O[TYPE], --output-sync[=TYPE]
|                               Synchronize output of parallel jobs by TYPE.
|   -p, --print-data-base       Print make's internal database.
|   -q, --question              Run no recipe; exit status says if up to date.
|   -r, --no-builtin-rules      Disable the built-in implicit rules.
|   -R, --no-builtin-variables  Disable the built-in variable settings.
|   -s, --silent, --quiet       Don't echo recipes.
|   --no-silent                 Echo recipes (disable --silent mode).
|   -S, --no-keep-going, --stop
|                               Turns off -k.
|   -t, --touch                 Touch targets instead of remaking them.
|   --trace                     Print tracing information.
|   -v, --version               Print the version number of make and exit.
|   -w, --print-directory       Print the current directory.
|   --no-print-directory        Turn off -w, even if it was turned on implicitly.
|   -W FILE, --what-if=FILE, --new-file=FILE, --assume-new=FILE
|                               Consider FILE to be infinitely new.
|   --warn-undefined-variables  Warn when an undefined variable is referenced.
| 
| This program built for x86_64-pokysdk-linux-gnu
| Report bugs to <bug-make@gnu.org>
| make: *** [Makefile:435: config.h] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/temp/run.do_compile.3084690:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/temp/run.do_compile.3084690, line 180
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/temp/run.do_compile.3084690, line 165
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/temp/run.do_compile.3084690, line 170
| 	#4: base_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/temp/run.do_compile.3084690, line 148
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/temp/run.do_compile.3084690, line 142
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/temp/run.do_compile.3084690, line 190
NOTE: recipe stress-ng-0.14.00-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 713 tasks of which 705 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: stress-ng-0.14.00-r0 do_compile: oe_runmake failed
ERROR: stress-ng-0.14.00-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/temp/run.do_compile.3084690', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/stress-ng/0.14.00-r0/temp/log.do_compile.3084690
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb:do_compile) failed with exit code '1'

--===============6217657670397161409==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.13.12-0.14.00.patch"

From db43df3efbfd8074f301abd631e91760ac6900bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 12:07:47 +0000
Subject: [PATCH] stress-ng: upgrade 0.13.12 -> 0.14.00

---
 .../stress-ng/{stress-ng_0.13.12.bb => stress-ng_0.14.00.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.13.12.bb => stress-ng_0.14.00.bb} (93%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
similarity index 93%
rename from meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
index fe177a4de0..fb18eb193c 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.12.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "f59bcb2fe1e25042e77d5e4942f72bfa026fa305"
+SRCREV = "ec7f6c4731a54f0e515bef7f7e84ef9e9b8125a2"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.27.0


--===============6217657670397161409==--

