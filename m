Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF05C35295
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:42:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.13794.1646329345018305542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:42:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=j0ciGIVh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101017f50e02fe3-5a3515f7-cfd0-4da8-9113-d9bdf4695139-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ODbXt76C8G0b9yZtxpTYNc6I2vp9dGnLgro221q7gdE=;
	b=j0ciGIVhZ0up1kLdsPCDy9qmn3RX8S3oF3gwysyAk1WFgXmoaxksA70dgjJjFmJE
	PBb2ME6oA//PEUjxSt8kdt8XFolFYhpy1nK+OJMjWspWRSGErUJe+qf9emcHJNgQ8+7
	aAgQ/tWjypo23H8JYAF9iwPNeHn06NwyDERIGiKc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1646329344;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ODbXt76C8G0b9yZtxpTYNc6I2vp9dGnLgro221q7gdE=;
	b=dd55Jbv2XZmbYykAejC7SHMaOpcpJwWbDT+HjrdeujuCWlHgugDyI89URE1zH4aW
	tfQ1ZhETPvc2U2LOjRwwKxCh1ii9AepeJ2sxA+mBsiYYbXWQ7NN7CIyq7Wfe7qQ2dBD
	0QUXgLZmrv98z20MR0Sbzhgn5Os3YHGkfWluVRlE=
Content-Type: multipart/mixed; boundary="===============4603557122034914160=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-importlib-metadata: upgrading to 4.11.2 FAILED
Message-ID: 
 <0101017f50e02fe3-5a3515f7-cfd0-4da8-9113-d9bdf4695139-000000@us-west-2.amazonses.com>
Date: Thu, 3 Mar 2022 17:42:24 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.03-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:42:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162684

--===============4603557122034914160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-importlib-metadata* to *4.11.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-importlib-metadata-upgrade-4.10.1-4.11.2.patch
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
--===============4603557122034914160==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-importlib-metadata-upgrade-4.10.1-4.11.2.patch"

From 9987508a899c7e8f0238facaa493847312d80188 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 3 Mar 2022 14:20:36 +0000
Subject: [PATCH] python3-importlib-metadata: upgrade 4.10.1 -> 4.11.2

---
 ...-metadata_4.10.1.bb => python3-importlib-metadata_4.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.10.1.bb => python3-importlib-metadata_4.11.2.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
rename to meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
index ff40def563..15c468e41b 100644
--- a/meta/recipes-devtools/python/python3-importlib-metadata_4.10.1.bb
+++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
 
-SRC_URI[sha256sum] = "951f0d8a5b7260e9db5e41d429285b5f451e928479f19d80818878527d36e95e"
+SRC_URI[sha256sum] = "b36ffa925fe3139b2f6ff11d6925ffd4fa7bc47870165e3ac260ac7b4f91e6ac"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.27.0


--===============4603557122034914160==
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
DISTRO_VERSION       = "3.4+snapshot-95c91b4ad71f01eb02dc0ae5e983734e5a1b4e4a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:95c91b4ad71f01eb02dc0ae5e983734e5a1b4e4a"
workspace            = "master:0447aace57d46c4de4d120b430384e99fc3a5e0c"

Initialising tasks...done.
Sstate summary: Wanted 92 Local 85 Mirrors 0 Missed 7 Current 236 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1028 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 1223 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_unpack)
NOTE: Running task 1224 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 1225 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_patch)
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_patch: Succeeded
NOTE: Running task 1226 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1227 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_populate_lic)
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1228 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_configure)
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_configure: Succeeded
NOTE: Running task 1229 of 1236 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_compile)
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/4.11.2-r0/recipe-sysroot-native/usr/bin/python3-native/python3: can't open file '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/4.11.2-r0/importlib_metadata-4.11.2/setup.py': [Errno 2] No such file or directory
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/4.11.2-r0/temp/run.do_compile.2541747:178 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/4.11.2-r0/temp/run.do_compile.2541747, line 178
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/4.11.2-r0/temp/run.do_compile.2541747, line 168
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/4.11.2-r0/temp/run.do_compile.2541747, line 157
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/4.11.2-r0/temp/run.do_compile.2541747, line 182
NOTE: recipe python3-importlib-metadata-4.11.2-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1229 tasks of which 1221 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_compile
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-4.11.2-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-importlib-metadata-4.11.2-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/4.11.2-r0/temp/run.do_compile.2541747', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-importlib-metadata/4.11.2-r0/temp/log.do_compile.2541747
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.11.2.bb:do_compile) failed with exit code '1'

--===============4603557122034914160==--

