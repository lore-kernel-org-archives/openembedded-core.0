Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FF1C64E7C
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.5248.1668517536269372822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=C6c+9U/i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101847b651e64-8364eb13-dfbc-4335-8fae-d343b25bdf11-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+RTvTuPoSRqs9HzRJiMnyUzA7/13xFpHbj05ImKoh24=;
	b=C6c+9U/iHe09W6YVuZTfqyDELCKGA2tPecXNZUButJWw+1+6gvSpdz9BDjkdaXDt
	4MrB8Ru4fTBGNiflxyBV01Ght0vkiN8zbCyN44ZmXqxObigMMmvKwIkRTgtxcOs1czA
	M2yvunf9/m2zqLboS/4PeZhfU95xD/AB2otCOxJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+RTvTuPoSRqs9HzRJiMnyUzA7/13xFpHbj05ImKoh24=;
	b=K5Us2270SlwJXZSbCaCQqKvJC+mshKCbKCJNB+IGa9vYKo0Izazno3aNvLoBkqei
	L6vWZqg8eDgzt4Q+eAsgzNHk+EhFOOa0mj3AXHGuw6ogl0hq27tOJPo8YydhxPHzyMw
	37IBtWMz909iF+YGDLKFjwbkz3KJHCUdEFFTlvNM=
Content-Type: multipart/mixed; boundary="===============3910021688341524644=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.28.6 FAILED
Message-ID: <010101847b651e64-8364eb13-dfbc-4335-8fae-d343b25bdf11-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173300

--===============3910021688341524644==
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
--===============3910021688341524644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 887 .bb files complete (886 cached, 1 parsed). 1665 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:73ba41028cf4bc7c1ec137df6e19a23814bb0733"
workspace            = "master:1a8272f40f071fda3b2039e433cee6fa6e42d783"

Initialising tasks...done.
Sstate summary: Wanted 246 Local 239 Mirrors 0 Missed 7 Current 317 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1744 of 1989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_fetch)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_fetch: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_fetch: Succeeded
NOTE: Running task 1976 of 1989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_unpack)
NOTE: Running task 1977 of 1989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_unpack: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_unpack: Succeeded
NOTE: Running task 1978 of 1989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_patch)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_patch: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_patch: Succeeded
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1979 of 1989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1980 of 1989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_populate_lic)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_populate_lic: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1981 of 1989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_configure)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_configure: Succeeded
NOTE: Running task 1982 of 1989 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_compile)
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.2438455:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.2438455, line 173
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.2438455, line 163
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.2438455, line 152
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.2438455, line 177
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1982 tasks of which 1974 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-dbusmock-0.28.6-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dbusmock-0.28.6-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.2438455', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/log.do_compile.2438455
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_compile) failed with exit code '1'

--===============3910021688341524644==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.28.4-0.28.6.patch"

RnJvbSAxNzMzZmY1NTAyNWMxNTczODJkYjAyNDQ0MzBlNGVmOTkyNmU0OTk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMDc6NTY6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWRidXNtb2NrOiB1cGdyYWRlIDAuMjguNCAtPiAwLjI4LjYKCi0tLQogLi4uL3tweXRo
b24zLWRidXNtb2NrXzAuMjguNC5iYiA9PiBweXRob24zLWRidXNtb2NrXzAuMjguNi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kYnVzbW9ja18wLjI4LjQu
YmIgPT4gcHl0aG9uMy1kYnVzbW9ja18wLjI4LjYuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjguNC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kYnVzbW9ja18wLjI4LjYuYmIKc2lt
aWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWRidXNtb2NrXzAuMjguNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWRidXNtb2NrXzAuMjguNi5iYgppbmRleCBlODk1ZDg3YjdiLi43
YzM5M2YyYWIwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZGJ1c21vY2tfMC4yOC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kYnVzbW9ja18wLjI4LjYuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9weXRob24tZGJ1c21vY2svIgogTElDRU5TRSA9ICJHUEwt
My4wLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lNmE2MDBm
ZDVlMWQ5Y2JkZTJkOTgzNjgwMjMzYWQwMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUyYWQw
MjRhNDRkNDY2MDIwODRmZDkxYzBjNDY3YWI5NWI3ZWNmMjdjNGUyMTY4ZTBkMjE2MDYyM2YxOGMw
YTIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2I0OTZmYWI4NGFmZjM5MzYwNTRmNzQ3ZTlhMjJi
YjA3YWM1NzgzYjFkOTY3YzZjYzM5NTM2YzdiYTMxNWZjZSIKIAogUFlQSV9QQUNLQUdFID0gInB5
dGhvbi1kYnVzbW9jayIKIAotLSAKMi4zMS4xCgo=

--===============3910021688341524644==--

