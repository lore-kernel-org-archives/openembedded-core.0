Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BA5CCA49C
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.39385.1656687063615705655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fDbrjVM5;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010181ba3e6db7-8567370a-b871-4691-b25a-bf5a87387283-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=W+puxDdkLfoGXs/3IEIQAQeWsTZ/8Xe5tPOrInR2NfI=;
	b=fDbrjVM5uP7RTO95mWwf8ZOpdhOIaAot4OxJsJRIhQXQBayAcqo1Y8pZpozXmkA2
	mlFIJ0nuRKQE0nLv1kCzHd1bgOcn9Gr9jAcwGLNBoy+YOjK3y0JS9MLCt8Ohli7kagN
	AkR3iVqn6+6Yb1sdX9hE3sYyJfM3mRs/CvC/7vm8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687062;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=W+puxDdkLfoGXs/3IEIQAQeWsTZ/8Xe5tPOrInR2NfI=;
	b=XxjclyY5sCqo8sCzyMBK9a1JK3sLgTl0xVasLSiPX2PIs/unZVI6fQTh6yWZUOP3
	rep95KTYvXvmit1EQuqWCZhxzNkQx25QyA188hU8xXM2OhBn5evpWPxjzwy6WRBUxR/
	JjBrJ/b9csFQxohi1XBGrr3DQGXgx9c93Tu8PpiI=
Content-Type: multipart/mixed; boundary="===============9109314067608618219=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-scm: upgrading to 7.0.3 FAILED
Message-ID: 
 <01010181ba3e6db7-8567370a-b871-4691-b25a-bf5a87387283-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167501

--===============9109314067608618219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-scm* to *7.0.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-setuptools-scm-upgrade-6.4.2-7.0.3.patch
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
--===============9109314067608618219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1654 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1654 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-dc128ddf4c8486553c5a564a4dddc0edd3444afe"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dc128ddf4c8486553c5a564a4dddc0edd3444afe"
workspace            = "master:6958024ed2aa199e56851bf960c06dec1a3d81a1"

Initialising tasks...done.
Sstate summary: Wanted 89 Local 82 Mirrors 0 Missed 7 Current 219 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 946 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_fetch)
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1141 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_unpack)
NOTE: Running task 1142 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_patch)
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_patch: Started
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1144 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1145 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_populate_lic)
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_populate_lic: Started
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1146 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_configure)
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_configure: Started
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1147 of 1154 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_compile)
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "<string>", line 1, in <module>
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/build_meta.py", line 244, in build_wheel
|     return self._build_with_temp_dir(['bdist_wheel'], '.whl',
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/build_meta.py", line 229, in _build_with_temp_dir
|     self.run_setup()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/build_meta.py", line 174, in run_setup
|     exec(compile(code, __file__, 'exec'), locals())
|   File "setup.py", line 51, in <module>
|     version=scm_version(),
|   File "setup.py", line 26, in scm_version
|     from setuptools_scm import get_version
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/setuptools_scm-7.0.3/src/setuptools_scm/__init__.py", line 13, in <module>
|     from ._entrypoints import _call_entrypoint_fn
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/setuptools_scm-7.0.3/src/setuptools_scm/_entrypoints.py", line 11, in <module>
|     from .version import ScmVersion
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/setuptools_scm-7.0.3/src/setuptools_scm/version.py", line 24, in <module>
|     from ._version_cls import Version as PkgVersion
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/setuptools_scm-7.0.3/src/setuptools_scm/_version_cls.py", line 5, in <module>
|     from packaging.version import InvalidVersion
| ModuleNotFoundError: No module named 'packaging'
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/temp/run.do_compile.3404961:159 exit 1 from 'nativepython3 -c "import setuptools.build_meta as api; api.build_wheel('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/dist')"'
| WARNING: Backtrace (BB generated script):
| 	#1: python_pep517_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/temp/run.do_compile.3404961, line 159
| 	#2: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/temp/run.do_compile.3404961, line 153
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/temp/run.do_compile.3404961, line 163
NOTE: recipe python3-setuptools-scm-7.0.3-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1147 tasks of which 1139 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-setuptools-scm-7.0.3-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/temp/run.do_compile.3404961', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-setuptools-scm/7.0.3-r0/temp/log.do_compile.3404961
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb:do_compile) failed with exit code '1'

--===============9109314067608618219==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-setuptools-scm-upgrade-6.4.2-7.0.3.patch"

From dc534c9129c8d8eb3e082ff7080d9747302ba889 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 08:58:04 +0000
Subject: [PATCH] python3-setuptools-scm: upgrade 6.4.2 -> 7.0.3

---
 ...-setuptools-scm_6.4.2.bb => python3-setuptools-scm_7.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_6.4.2.bb => python3-setuptools-scm_7.0.3.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
rename to meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
index 9aaae071d3..810f89fd95 100644
--- a/meta/recipes-devtools/python/python3-setuptools-scm_6.4.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-scm_7.0.3.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "setuptools_scm handles managing your Python package versions in S
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30"
+SRC_URI[sha256sum] = "cf8ab8e235bed840cd4559b658af0d8e8a70896a191bbc510ee914ec5325332d"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi python_setuptools_build_meta
-- 
2.31.1


--===============9109314067608618219==--

