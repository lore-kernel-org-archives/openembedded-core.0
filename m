Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47D1C636F8
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.24230.1665871395445709524
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Yu8v5C1W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010183ddac341b-a3de6c7f-fc9e-431a-8ab6-286197aef164-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cK9Cp+XnuuI7ezybNRlUIX4EWNfrmTcsn4d4HacBPi0=;
	b=Yu8v5C1WMEOsMZFlgLjcE5WT5QNVCDiuIMVkroY99zclcVnPmpwJ/PAjIMzdsD+u
	Hz997HNkz2IRTsZ7r2t07buJ5XT/gxeOu4iodx93GaegaEw/Kum5zPpFaXOzYwLLeMS
	Wa0aSGlVKBP4z6VGxyj4977Xi+TdudrTYKkuorM0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cK9Cp+XnuuI7ezybNRlUIX4EWNfrmTcsn4d4HacBPi0=;
	b=DbtpVGW7RnyoQoGMaSXlrENJ+0kbYQQRWAW+jgYE1EdoJQsObtfPaCTP31luMVBo
	lWpsucczHbcL2v4qJdhTl31HL5SiwGk1Zl7vCYS3hsrqqxwgGkRFnNrhr3rl5eHPORW
	Plg8XYQ2MFzZh0Uj5zY5M3r6/yUQFyURyDhgTzto=
Content-Type: multipart/mixed; boundary="===============0518929986965629410=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.23.4 SUCCEEDED
Message-ID: <01010183ddac341b-a3de6c7f-fc9e-431a-8ab6-286197aef164-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171823

--===============0518929986965629410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.23.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.23.3-1.23.4.patch
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
--===============0518929986965629410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.10/site-packages/numpy-1.23.3.dist-info moved to /usr/lib/python3.10/site-packages/numpy-1.23.4.dist-info

--===============0518929986965629410==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.23.3-1.23.4.patch"

RnJvbSAwMTk1YWRlYWFmZDc0Mzk4ZDNiM2NmY2I5NzE0YmQxZTUwMGI5YWRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTA6NTI6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW51bXB5OiB1cGdyYWRlIDEuMjMuMyAtPiAxLjIzLjQKCi0tLQogLi4uL3B5dGhvbi97
cHl0aG9uMy1udW1weV8xLjIzLjMuYmIgPT4gcHl0aG9uMy1udW1weV8xLjIzLjQuYmJ9IHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1udW1weV8xLjIzLjMuYmIgPT4g
cHl0aG9uMy1udW1weV8xLjIzLjQuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjMuMy5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjIzLjQuYmIKc2ltaWxhcml0eSBpbmRleCA5
NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5
XzEuMjMuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzEuMjMuNC5iYgppbmRleCA5ZDA4NmFlZGZkLi5kOTE3MjY5MmI1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yMy4zLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weV8xLjIzLjQuYmIK
QEAgLTEzLDcgKzEzLDcgQEAgU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQv
diR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1w
dGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWdlbmVyYXRlX3VtYXRoLnB5LWRvLW5vdC13
cml0ZS1mdWxsLXBhdGgtdG8tb3V0cHV0LWYucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNTFiZjQ5YzBjZDFkNTJiZTBhMjQwYWE2NmYzNDU4YWZjNGI5NWQ4OTkz
ZDJkMDRmMGQ5MWZhNjBjMTBhZjZjZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlZDJjYzkyYWYw
ZWZhZDIwMTk4NjM4YzY5YmIwZmMyODcwYTU4ZGFiZmJhNmViNzIyYzkzM2I0ODU1NmM2ODZjIgog
CiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3JlbGVh
c2VzIgogCi0tIAoyLjMxLjEKCg==

--===============0518929986965629410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1663 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:917ff1e1f32633041a9126f854a4ba83e606540f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 7 Mirrors 0 Missed 11 Current 346 (38% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 348 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene)
NOTE: Running task 883 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: Running task 915 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Succeeded
NOTE: Running task 1335 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: Running task 1336 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_unpack)
NOTE: Running task 1337 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1338 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-importlib-metadata/4.12.0-r0/temp/log.do_packagedata_setscene.1434656
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 363 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package_setscene)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_patch)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1341 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1343 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: Running task 1344 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 84eee1b357280d5ebec89bd37ac27fc1241b9d8d4ccfcf04af16a61164539f96
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Succeeded
NOTE: Running task 1345 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: Running task 1346 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1347 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: Running task 1348 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1358 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_package)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1365 tasks of which 1342 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.54.5-r0/temp/log.do_packagedata.1436197
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata) failed with exit code '1'

--===============0518929986965629410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:917ff1e1f32633041a9126f854a4ba83e606540f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 7 Mirrors 0 Missed 11 Current 346 (38% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 348 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene)
NOTE: Running task 883 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: Running task 915 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: Running task 1335 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: Running task 1336 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_unpack)
NOTE: Running task 1337 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1338 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-importlib-metadata/4.12.0-r0/temp/log.do_packagedata_setscene.1442441
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 363 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package_setscene)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_patch)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1341 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1343 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1344 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure)
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 84eee1b357280d5ebec89bd37ac27fc1241b9d8d4ccfcf04af16a61164539f96
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Succeeded
NOTE: Running task 1345 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: Running task 1346 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1347 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1348 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: Setscene tasks completed
NOTE: Running task 1358 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_package)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1365 tasks of which 1342 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.54.5-r0/temp/log.do_packagedata.1444023
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata) failed with exit code '1'

--===============0518929986965629410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:917ff1e1f32633041a9126f854a4ba83e606540f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 7 Mirrors 0 Missed 11 Current 346 (38% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 348 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene)
NOTE: Running task 883 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: Running task 915 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: Running task 1335 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: Running task 1336 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_unpack)
NOTE: Running task 1337 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1338 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-importlib-metadata/4.12.0-r0/temp/log.do_packagedata_setscene.1446089
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 363 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package_setscene)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_patch)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1341 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1343 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1344 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure)
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 84eee1b357280d5ebec89bd37ac27fc1241b9d8d4ccfcf04af16a61164539f96
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Succeeded
NOTE: Running task 1345 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: Running task 1346 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1347 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: Running task 1348 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1358 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_package)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1365 tasks of which 1342 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.54.5-r0/temp/log.do_packagedata.1447622
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata) failed with exit code '1'

--===============0518929986965629410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 51 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:917ff1e1f32633041a9126f854a4ba83e606540f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 18 Local 7 Mirrors 0 Missed 11 Current 346 (38% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 348 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene)
NOTE: Running task 883 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: Running task 915 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_fetch)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Succeeded
NOTE: Running task 1335 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: Running task 1336 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_unpack)
NOTE: Running task 1337 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1338 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_prepare_recipe_sysroot)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-importlib-metadata/4.12.0-r0/temp/log.do_packagedata_setscene.1438780
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 363 of 364 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package_setscene)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Succeeded
NOTE: Running task 1339 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_patch)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1341 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1343 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: Running task 1344 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 84eee1b357280d5ebec89bd37ac27fc1241b9d8d4ccfcf04af16a61164539f96
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Succeeded
NOTE: Running task 1345 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: Running task 1346 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1347 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: Running task 1348 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1358 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1359 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Succeeded
NOTE: Running task 1361 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1362 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Succeeded
NOTE: Running task 1363 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1364 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_package)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Succeeded
NOTE: Running task 1365 of 1375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1365 tasks of which 1342 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.54.5-r0/temp/log.do_packagedata.1440313
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata) failed with exit code '1'

--===============0518929986965629410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 24 recipes from the core2-32 sysroot...done.
Removing 50 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:917ff1e1f32633041a9126f854a4ba83e606540f"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 200 Local 188 Mirrors 0 Missed 12 Current 160 (94% match, 96% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 173 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 174 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 175 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 176 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 611 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_fetch)
NOTE: Running task 630 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_fetch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_fetch: Succeeded
NOTE: Running task 734 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_unpack)
NOTE: Running task 735 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_unpack)
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 181 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_8.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_21.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Started
NOTE: Running setscene task 195 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.5.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 197 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 736 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_patch)
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-21.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-65.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-importlib-metadata/4.12.0-r0/temp/log.do_packagedata_setscene.1450079
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 214 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_package_setscene)
NOTE: recipe python3-more-itertools-8.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_unpack: Succeeded
NOTE: recipe psmisc-23.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 753 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 754 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 243 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 245 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 247 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 252 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 257 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_patch: Succeeded
NOTE: Running task 831 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 832 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_populate_lic unihash changed to 84eee1b357280d5ebec89bd37ac27fc1241b9d8d4ccfcf04af16a61164539f96
NOTE: recipe python3-numpy-1.23.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 262 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 268 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 275 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 288 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 290 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 292 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 294 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 298 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 307 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 311 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 323 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 327 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 333 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 335 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 338 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 341 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 348 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 354 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 357 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1130 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1155 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1328 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_4.12.0.bb:do_packagedata)
NOTE: Running task 1337 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-4.12.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.23.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1340 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure)
NOTE: Running task 1341 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure: Succeeded
NOTE: Running task 1342 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_configure_ptest_base)
NOTE: Running task 1343 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_configure_ptest_base)
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-numpy-1.23.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1344 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.23.4.bb:do_compile)
NOTE: Running task 1345 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile)
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile: Succeeded
NOTE: Running task 1346 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_compile_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1347 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install: Succeeded
NOTE: Running task 1348 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_install_ptest_base)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1349 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_package)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_package: Succeeded
NOTE: Running task 1350 of 1360 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.54.5-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.23.4-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1350 tasks of which 1326 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.12.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-4.12.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.56.2-r0 to 0:6.54.5-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.54.5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.54.5-r0/temp/log.do_packagedata.1457251
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.54.5.bb:do_packagedata) failed with exit code '1'

--===============0518929986965629410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.23.3/numpy-1.23.3.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch" to "https://github.com/numpy/numpy/releases/download/v1.23.4/numpy-1.23.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch"
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 37166628 to 37166664 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 18712977 to 18713031 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 260610 to 260614 (+0%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.23.3 [default] to 1.23.4 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.23.3" to "1.23.4"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 34270534 to 34274428 (+0%)
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.10/site-packages/numpy-1.23.3.dist-info moved to /usr/lib/python3.10/site-packages/numpy-1.23.4.dist-info

--===============0518929986965629410==--

