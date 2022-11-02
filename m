Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB06C64ECB
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.861.1667349633307502842
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ksfuh8Ay;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018435c8561c-8ece6e45-faf1-4e3b-87f3-49168bc4f7f1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bVIq5PKvu9qUuYSMii496JfHlVb7YtHc3/WMpNyjQQw=;
	b=Ksfuh8AyMsvu94cM7jJJNND3S1r+nkris0uQE2enWhf3nm8xL2Rw2BsPGWexp+CL
	7+NZsms/b7LCk5C4+SpmKjw8qTqPMPOz8Pj83OR+59UBWGiH404UN+1iDC8KQ3HGdBe
	pwp70k8tzJawR8pva2eSqV7XlU3A6XqtBAyNL+9U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bVIq5PKvu9qUuYSMii496JfHlVb7YtHc3/WMpNyjQQw=;
	b=UUscWNU8h02xvLAMBs57i9ecg3CiERbH+QiWLmwICyRc+wJKylGS+k7oxVwkAgjJ
	RArlWPIYEwWE0jJp/xwlIguevyBAxPQ4zxxaWemEjLcdQVNtQ4zkpdnU8lq3QZ7AtLP
	C8OvxkLr3AQxaCZW7kDRvIvCGHqLCugNsSvR6nZ4=
Content-Type: multipart/mixed; boundary="===============0168557088512153927=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.28.6 FAILED
Message-ID: <0101018435c8561c-8ece6e45-faf1-4e3b-87f3-49168bc4f7f1-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172424

--===============0168557088512153927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dbusmock* to *0.28.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-dbusmock-upgrade-0.28.4-0.28.6.patch
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
--===============0168557088512153927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:71d0ad16eb8ab766034b490629d83c169f9551b1"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 145 Local 138 Mirrors 0 Missed 7 Current 417 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1743 of 1988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_fetch)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_fetch: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_fetch: Succeeded
NOTE: Running task 1975 of 1988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_unpack)
NOTE: Running task 1976 of 1988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_unpack: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_unpack: Succeeded
NOTE: Running task 1977 of 1988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_patch)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_patch: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_patch: Succeeded
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1978 of 1988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1979 of 1988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_populate_lic)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_populate_lic: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1980 of 1988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_configure)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_configure: Succeeded
NOTE: Running task 1981 of 1988 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_compile)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/expand.py", line 81, in __getattr__
|     return next(
|            ^^^^^
| StopIteration
| 
| The above exception was the direct cause of the following exception:
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/expand.py", line 191, in read_attr
|     return getattr(StaticModule(module_name, spec), attr_name)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/expand.py", line 87, in __getattr__
|     raise AttributeError(f"{self.name} has no attribute {attr}") from e
| AttributeError: dbusmock has no attribute __version__
| 
| During handling of the above exception, another exception occurred:
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/python-dbusmock-0.28.6/setup.py", line 7, in <module>
|     setuptools.setup()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/__init__.py", line 87, in setup
|     return distutils.core.setup(**attrs)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/_distutils/core.py", line 159, in setup
|     dist.parse_config_files()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/dist.py", line 864, in parse_config_files
|     setupcfg.parse_configuration(
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/setupcfg.py", line 174, in parse_configuration
|     meta.parse()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/setupcfg.py", line 496, in parse
|     section_parser_method(section_options)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/setupcfg.py", line 470, in parse_section
|     self[name] = value
|     ~~~~^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/setupcfg.py", line 278, in __setitem__
|     value = parser(value)
|             ^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/setupcfg.py", line 602, in _parse_version
|     return expand.version(self._parse_attr(value, self.package_dir, self.root_dir))
|                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/setupcfg.py", line 412, in _parse_attr
|     return expand.read_attr(attr_desc, package_dir, root_dir)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/setuptools/config/expand.py", line 195, in read_attr
|     return getattr(module, attr_name)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^
| AttributeError: module 'dbusmock' has no attribute '__version__'
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.311079:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.311079, line 174
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.311079, line 164
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.311079, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.311079, line 178
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1981 tasks of which 1973 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-dbusmock-0.28.6-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dbusmock-0.28.6-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.311079', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/log.do_compile.311079
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_compile) failed with exit code '1'

--===============0168557088512153927==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.28.4-0.28.6.patch"

RnJvbSAzNTBiZGI1YzlhZjljYTI5NWZiZThiMzY1NjY5OTQ5Zjc3ODAwMTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwOTo0NDoyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZGJ1c21vY2s6IHVwZ3JhZGUgMC4yOC40IC0+IDAuMjguNgoKLS0tCiAuLi4ve3B5dGhv
bjMtZGJ1c21vY2tfMC4yOC40LmJiID0+IHB5dGhvbjMtZGJ1c21vY2tfMC4yOC42LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWRidXNtb2NrXzAuMjguNC5i
YiA9PiBweXRob24zLWRidXNtb2NrXzAuMjguNi5iYn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZGJ1c21vY2tfMC4yOC40LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjguNi5iYgpzaW1p
bGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZGJ1c21vY2tfMC4yOC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZGJ1c21vY2tfMC4yOC42LmJiCmluZGV4IGU4OTVkODdiN2IuLjdj
MzkzZjJhYjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kYnVzbW9ja18wLjI4LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWRidXNtb2NrXzAuMjguNi5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3B5dGhvbi1kYnVzbW9jay8iCiBMSUNFTlNFID0gIkdQTC0z
LjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU2YTYwMGZk
NWUxZDljYmRlMmQ5ODM2ODAyMzNhZDAyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTJhZDAy
NGE0NGQ0NjYwMjA4NGZkOTFjMGM0NjdhYjk1YjdlY2YyN2M0ZTIxNjhlMGQyMTYwNjIzZjE4YzBh
MiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzYjQ5NmZhYjg0YWZmMzkzNjA1NGY3NDdlOWEyMmJi
MDdhYzU3ODNiMWQ5NjdjNmNjMzk1MzZjN2JhMzE1ZmNlIgogCiBQWVBJX1BBQ0tBR0UgPSAicHl0
aG9uLWRidXNtb2NrIgogCi0tIAoyLjMxLjEKCg==

--===============0168557088512153927==--

