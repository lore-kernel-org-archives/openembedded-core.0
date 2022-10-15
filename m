Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B2DC64E96
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.24351.1665871392994675221
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JEtyLUlt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac323d-151975c8-0e9f-4193-bacf-dbbe7d336e76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5Tw6Ur9pM0UR+e2zbDb/JApnC39G6E9yrfFNXtMD+1w=;
	b=JEtyLUltcVcxagM8BPMrd1LPLUG/8qe6SAuWsG6TIeGAzPoLRpoPu60e9fwGZiKM
	KnYi60qEQiVjzjG83J+Cb+A6Pt7ahAziNm44CiK48TNThRbktrUbF87qEufqHWuSUZ+
	kx9HrA5AfDUlF3VIKmtnVvd97qrMsjIvJYt30geE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5Tw6Ur9pM0UR+e2zbDb/JApnC39G6E9yrfFNXtMD+1w=;
	b=SStbxt8AKQdCf23z6/KYMS3HxL+0OpBSDNT7kGcx3UHM0CSQJRGGy3LgDUWqQkJM
	0Iqr0jSV8aQE4tyq0tSU1j3jsW4fOmVefSP7XWpvcU95rcZhpT0bkihkG4QCAqDFX3E
	NyXdxninnmah/iDLgNvsHka1lWk3a5vn5tZ2zrDM=
Content-Type: multipart/mixed; boundary="===============5698223151061129161=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.28.6 FAILED
Message-ID: <01010183ddac323d-151975c8-0e9f-4193-bacf-dbbe7d336e76-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171782

--===============5698223151061129161==
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
--===============5698223151061129161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:4d6a28247ab184a440f4fc4a88371d77efb5ae40"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 147 Local 140 Mirrors 0 Missed 7 Current 415 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1743 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_fetch)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_fetch: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_fetch: Succeeded
NOTE: Running task 1974 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_unpack)
NOTE: Running task 1975 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_unpack: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_unpack: Succeeded
NOTE: Running task 1976 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_patch)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_patch: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_patch: Succeeded
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1977 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1978 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_populate_lic)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_populate_lic: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1979 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_configure)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_configure: Succeeded
NOTE: Running task 1980 of 1987 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_compile)
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/expand.py", line 81, in __getattr__
|     return next(
| StopIteration
| 
| The above exception was the direct cause of the following exception:
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/expand.py", line 191, in read_attr
|     return getattr(StaticModule(module_name, spec), attr_name)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/expand.py", line 87, in __getattr__
|     raise AttributeError(f"{self.name} has no attribute {attr}") from e
| AttributeError: dbusmock has no attribute __version__
| 
| During handling of the above exception, another exception occurred:
| 
| Traceback (most recent call last):
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/python-dbusmock-0.28.6/setup.py", line 7, in <module>
|     setuptools.setup()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/__init__.py", line 87, in setup
|     return distutils.core.setup(**attrs)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/_distutils/core.py", line 159, in setup
|     dist.parse_config_files()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/dist.py", line 864, in parse_config_files
|     setupcfg.parse_configuration(
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/setupcfg.py", line 174, in parse_configuration
|     meta.parse()
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/setupcfg.py", line 496, in parse
|     section_parser_method(section_options)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/setupcfg.py", line 470, in parse_section
|     self[name] = value
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/setupcfg.py", line 278, in __setitem__
|     value = parser(value)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/setupcfg.py", line 602, in _parse_version
|     return expand.version(self._parse_attr(value, self.package_dir, self.root_dir))
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/setupcfg.py", line 412, in _parse_attr
|     return expand.read_attr(attr_desc, package_dir, root_dir)
|   File "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/setuptools/config/expand.py", line 195, in read_attr
|     return getattr(module, attr_name)
| AttributeError: module 'dbusmock' has no attribute '__version__'
| ERROR: 'python3 setup.py bdist_wheel ' execution failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.1058479:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.1058479, line 174
| 	#2: setuptools3_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.1058479, line 164
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.1058479, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.1058479, line 178
NOTE: recipe python3-dbusmock-0.28.6-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1980 tasks of which 1972 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-dbusmock-0.28.6-r0 do_compile: 'python3 setup.py bdist_wheel ' execution failed.
ERROR: python3-dbusmock-0.28.6-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/run.do_compile.1058479', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/python3-dbusmock/0.28.6-r0/temp/log.do_compile.1058479
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.28.6.bb:do_compile) failed with exit code '1'

--===============5698223151061129161==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dbusmock-upgrade-0.28.4-0.28.6.patch"

RnJvbSBhNDdhMWE2OTNkY2Y3ZDAwNDhmZTU4NWU0OGFjMjYwZmI4Y2Q2ODQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6MDI6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
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

--===============5698223151061129161==--

