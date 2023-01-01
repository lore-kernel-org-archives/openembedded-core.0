Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E201C64981
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:07 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.20176.1672605966987240334
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=muBlKgQr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101856f15a068-8f9afe07-06e4-4e8c-ab8e-ed8277f5b2b6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FhfvuXPlc6947uuF5RBDlihasq9dHwVZbphAfQ5/9zA=;
	b=muBlKgQrX9R1XB3Sm1f8A8I61KFLpDeUWrqiL8jLZ1MaBuGYcFT6mSRI+wuAJROa
	L8t41+QaE+8fIlk0nIgX/USGwx+XJSBHQO4mm81GFf5tUOg9kkrwFDHTc/THv2D/bLG
	Z6FzSugGIWykdqd75My0HZnkn7/Nc0GMvd26wQeE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FhfvuXPlc6947uuF5RBDlihasq9dHwVZbphAfQ5/9zA=;
	b=Nd6iyg7ASFNJVf9NK8co4eB8qD52a/x7TOG+55TGLji+PssBekYAoSrX2T0uSPeq
	LLMNB8B8YCGRIHkDF1OuoB/g9YycYY3IOEUW+YdBX4LpSiNROzqmCuFdK0yRJk6wj3W
	GhiejSFqy8j2XoNM3so4I6St7zGj+HqGj/4fMi2Y=
Content-Type: multipart/mixed; boundary="===============2475212888299421911=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-numpy: upgrading to 1.24.1 SUCCEEDED
Message-ID: <010101856f15a068-8f9afe07-06e4-4e8c-ab8e-ed8277f5b2b6-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175255

--===============2475212888299421911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-numpy* to *1.24.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-numpy-upgrade-1.23.4-1.24.1.patch
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
--===============2475212888299421911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.23.4.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.24.1.dist-info, added "/usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_docs.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/core/tests/test_nep50_promotions.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_docs.py /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_casting_floatingpoint_errors.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/value_attrspec/gh21665.f90 /usr/lib/python3.11/site-packages/numpy/tests/test_lazyloading.py /usr/lib/python3.11/site-packages/numpy/core/tests/test_strings.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_value_attrspec.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_strings.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy
 /polynomial/tests/test_symbol.py /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_nep50_promotions.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_character.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_character.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/unicode_comment.f90 /usr/lib/python3.11/site-packages/numpy/polynomial/tests/__pycache__/test_symbol.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/pubprivmod.f90 /usr/lib/python3.11/site-packages/numpy/core/tests/test_casting_floatingpoint_errors.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_value_attrspec.py /usr/lib/python3.11/site-packages/numpy/tests/__pycache__/test_lazyloading.cpython-311.pyc"
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.23.4.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.24.1.dist-info
  /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_casting_floatingpoint_errors.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_nep50_promotions.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_strings.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/test_casting_floatingpoint_errors.py was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/test_nep50_promotions.py was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/test_strings.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_character.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_docs.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_value_attrspec.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/pubprivmod.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/unicode_comment.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/value_attrspec was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/value_attrspec/gh21665.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_character.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_docs.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_value_attrspec.py was added
  /usr/lib/python3.11/site-packages/numpy/polynomial/tests/__pycache__/test_symbol.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/polynomial/tests/test_symbol.py was added
  /usr/lib/python3.11/site-packages/numpy/tests/__pycache__/test_lazyloading.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/tests/test_lazyloading.py was added

--===============2475212888299421911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 64 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:046d0bf024016d6368ad1f9f03a17acda8141029"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 4 Mirrors 0 Missed 10 Current 351 (28% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 353 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_setscene)
NOTE: Running setscene task 358 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: Running task 746 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_unpack)
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Succeeded
NOTE: Running task 975 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_patch)
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Succeeded
NOTE: Running task 976 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 977 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 365 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic unihash changed to 0f8c8920d2e38dec33aa2a6bdd6889c8e1f2bf26e88f44107cc0808f141ee08b
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1138 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1237 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: Running task 1363 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1363 tasks of which 1355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata.1281282
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata) failed with exit code '1'

--===============2475212888299421911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1691 targets, 48 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:046d0bf024016d6368ad1f9f03a17acda8141029"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 197 Local 187 Mirrors 0 Missed 10 Current 164 (94% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 170 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: Running setscene task 176 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 177 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 178 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 179 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running task 610 of 1361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 733 of 1361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_unpack)
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 181 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_22.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 183 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_5.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 191 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_65.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-sortedcontainers_2.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Started
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-65.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 197 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 201 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-22.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-5.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sortedcontainers-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-65.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Succeeded
NOTE: Running task 794 of 1361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_patch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Succeeded
NOTE: Running task 815 of 1361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 816 of 1361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 244 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 246 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 248 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic unihash changed to 0f8c8920d2e38dec33aa2a6bdd6889c8e1f2bf26e88f44107cc0808f141ee08b
NOTE: Running setscene task 250 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 251 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 254 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 261 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 268 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 269 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 273 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 275 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 278 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 279 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 282 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 283 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 286 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 292 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 299 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 303 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 319 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 322 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 334 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 336 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 339 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 341 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 342 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 345 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 349 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 355 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 359 of 361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1131 of 1361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1228 of 1361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: Running task 1348 of 1361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1348 tasks of which 1340 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata.1291986
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata) failed with exit code '1'

--===============2475212888299421911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-numpy: SRC_URI changed from "https://github.com/numpy/numpy/releases/download/v1.23.4/numpy-1.23.4.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest file://0001-generate_umath.py-do-not-write-full-path-to-output-f.patch" to "https://github.com/numpy/numpy/releases/download/v1.24.1/numpy-1.24.1.tar.gz file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch file://0001-numpy-core-Define-RISCV-32-support.patch file://run-ptest"
packages/core2-32-poky-linux/python3-numpy: PKGV changed from 1.23.4 [default] to 1.24.1 [default]
packages/core2-32-poky-linux/python3-numpy: PV changed from "1.23.4" to "1.24.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGV changed from 1.23.4 [default] to 1.24.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PV changed from "1.23.4" to "1.24.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dbg: PKGSIZE changed from 37824728 to 40972536 (+8%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PKGV changed from 1.23.4 [default] to 1.24.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-dev: PV changed from "1.23.4" to "1.24.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PKGV changed from 1.23.4 [default] to 1.24.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-doc: PV changed from "1.23.4" to "1.24.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PKGV changed from 1.23.4 [default] to 1.24.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-locale: PV changed from "1.23.4" to "1.24.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PKGV changed from 1.23.4 [default] to 1.24.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-ptest: PV changed from "1.23.4" to "1.24.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: FILELIST: directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/npymath -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/npymath, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/random/src/sfc64 -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/random/src/sfc64, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/dlpack -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/dlpack, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/npysort -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/npysort, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/_simd -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/_simd, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/fft -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/fft, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/rando
 m/include -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/random/include, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/linalg/lapack_lite -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/linalg/lapack_lite, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/build/src.linux-x86_64-3.11/numpy/core/include/numpy -> /usr/src/debug/python3-numpy/1.24.1-r0/build/src.linux-x86_64-3.11/numpy/core/include/numpy, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/avx2 -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx2, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/sse -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/sse, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/random -> /usr/src/debug
 /python3-numpy/1.24.1-r0/numpy/random, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/multiarray/textreading -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/multiarray/textreading, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/random/src/legacy -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/random/src/legacy, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/include/numpy -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/include/numpy, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/random/src/pcg64 -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/random/src/pcg64, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/multiarray -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/multiarray, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/linalg -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/linalg, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/num
 py/random/src/philox -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/random/src/philox, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/random/src/distributions -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/random/src/distributions, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/include/numpy/libdivide -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/include/numpy/libdivide, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/include/numpy/random -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/include/numpy/random, directory renamed /usr/src/debug/python3-numpy/1.23.4-r0/numpy/random/src/mt19937 -> /usr/src/debug/python3-numpy/1.24.1-r0/numpy/random/src/mt19937, removed "/usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/_struct_ufunc_tests.c /usr/src/debug/python3-numpy
 /1.23.4-r0/numpy/core/src/common/simd/avx512/misc.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/funcs.inc.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_arithm_fp.dispatch.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/fast_loop_macros.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/_rational_tests.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/clip.cpp /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_arithmetic.dispatch.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_trigonometric.dispatch.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/avx512/math.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops.h.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/clip.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/_operand_flag_tests.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/npy_si
 md_data.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/ufunc_type_resolution.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/_scaled_float_dtype.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/ufunc_type_resolution.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/ufunc_object.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/dispatching.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/ufunc_object.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/avx512/conversion.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/dispatching.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/extobj.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/override.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/avx512/arithmetic.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/u
 math/reduction.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/scalarmath.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/extobj.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_umath_fp.dispatch.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_unary_fp.dispatch.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/override.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/reduction.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/simd.inc.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/umathmodule.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_minmax.dispatch.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_modulo.dispatch.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/avx512/reorder.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/_umath_tests.dispatch.c /usr/src/debug/python
 3-numpy/1.23.4-r0/numpy/core/src/umath/matmul.h.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/wrapping_array_method.c /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_hyperbolic.dispatch.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/_umath_tests.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/avx512/operators.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_utils.h.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/avx512/maskop.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/avx512/memory.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/loops_exponent_log.dispatch.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/matmul.c.src /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/umath/legacy_array_method.h /usr/src/debug/python3-numpy/1.23.4-r0/numpy/core/src/common/simd/avx512/avx512.h /usr/src/debug/python3-numpy/1.2
 3.4-r0/numpy/core/src/umath/legacy_array_method.c", added "/usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/string_ufuncs.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_arithmetic.dispatch.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/scalarmath.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/reduction.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/simd.inc.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx512/operators.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_comparison.dispatch.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/reduction.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/legacy_array_method.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/extobj.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/override.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/clip.cpp /usr/src
 /debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_hyperbolic.dispatch.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_arithm_fp.dispatch.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/clip.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_exponent_log.dispatch.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/extobj.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/_scaled_float_dtype.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/legacy_array_method.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/override.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/wrapping_array_method.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx512/math.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_utils.h.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/string_ufuncs.cpp /usr/src/debug/python3-numpy/1.24.1-r
 0/numpy/core/src/umath/loops.h.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/matmul.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx512/maskop.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx512/memory.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/_struct_ufunc_tests.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx512/avx512.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/_rational_tests.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_umath_fp.dispatch.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_unary_fp.dispatch.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/_umath_tests.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/funcs.inc.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/matmul.h.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/ufunc_object.c /u
 sr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/umathmodule.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx512/reorder.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx512/arithmetic.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/ufunc_object.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/npy_simd_data.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/_umath_tests.dispatch.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/ufunc_type_resolution.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/fast_loop_macros.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/ufunc_type_resolution.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx512/conversion.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_minmax.dispatch.c.src /usr/src/debug/python3-numpy
 /1.24.1-r0/numpy/core/src/common/simd/avx512/utils.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/_operand_flag_tests.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/dispatching.h /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_modulo.dispatch.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/loops_trigonometric.dispatch.c.src /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/umath/dispatching.c /usr/src/debug/python3-numpy/1.24.1-r0/numpy/core/src/common/simd/avx512/misc.h"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGV changed from 1.23.4 [default] to 1.24.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PV changed from "1.23.4" to "1.24.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-src: PKGSIZE changed from 18713031 to 18889974 (+1%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGV changed from 1.23.4 [default] to 1.24.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PV changed from "1.23.4" to "1.24.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy-staticdev: PKGSIZE changed from 260602 to 243660 (-7%)
packages/core2-32-poky-linux/python3-numpy/python3-numpy: FILELIST: directory renamed /usr/lib/python3.11/site-packages/numpy-1.23.4.dist-info -> /usr/lib/python3.11/site-packages/numpy-1.24.1.dist-info, added "/usr/lib/python3.11/site-packages/numpy/tests/test_lazyloading.py /usr/lib/python3.11/site-packages/numpy/polynomial/tests/__pycache__/test_symbol.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/core/tests/test_nep50_promotions.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_character.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/value_attrspec/gh21665.f90 /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_value_attrspec.py /usr/lib/python3.11/site-packages/numpy/tests/__pycache__/test_lazyloading.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/unicode_comment.f90 /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_character.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/polynomial
 /tests/test_symbol.py /usr/lib/python3.11/site-packages/numpy/core/tests/test_strings.py /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_docs.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_casting_floatingpoint_errors.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/core/tests/test_casting_floatingpoint_errors.py /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_nep50_promotions.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_value_attrspec.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/pubprivmod.f90 /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_strings.cpython-311.pyc /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_docs.py"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGV changed from 1.23.4 [default] to 1.24.1 [default]
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PV changed from "1.23.4" to "1.24.1"
packages/core2-32-poky-linux/python3-numpy/python3-numpy: PKGSIZE changed from 39924901 to 39468353 (-1%)
Changes to packages/core2-32-poky-linux/python3-numpy (sysroot):
  /usr/lib/python3.11/site-packages/numpy-1.23.4.dist-info moved to /usr/lib/python3.11/site-packages/numpy-1.24.1.dist-info
  /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_casting_floatingpoint_errors.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_nep50_promotions.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/__pycache__/test_strings.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/test_casting_floatingpoint_errors.py was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/test_nep50_promotions.py was added
  /usr/lib/python3.11/site-packages/numpy/core/tests/test_strings.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_character.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_docs.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/__pycache__/test_value_attrspec.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/pubprivmod.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/crackfortran/unicode_comment.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/value_attrspec was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/src/value_attrspec/gh21665.f90 was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_character.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_docs.py was added
  /usr/lib/python3.11/site-packages/numpy/f2py/tests/test_value_attrspec.py was added
  /usr/lib/python3.11/site-packages/numpy/polynomial/tests/__pycache__/test_symbol.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/polynomial/tests/test_symbol.py was added
  /usr/lib/python3.11/site-packages/numpy/tests/__pycache__/test_lazyloading.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/numpy/tests/test_lazyloading.py was added

--===============2475212888299421911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:046d0bf024016d6368ad1f9f03a17acda8141029"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 4 Mirrors 0 Missed 10 Current 351 (28% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 353 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_setscene)
NOTE: Running setscene task 358 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: Running task 746 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_unpack)
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Succeeded
NOTE: Running task 975 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_patch)
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Succeeded
NOTE: Running task 976 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 977 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 365 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic unihash changed to 0f8c8920d2e38dec33aa2a6bdd6889c8e1f2bf26e88f44107cc0808f141ee08b
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1138 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1237 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: Running task 1363 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1363 tasks of which 1355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata.1278571
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata) failed with exit code '1'

--===============2475212888299421911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1692 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (892 cached, 1 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:046d0bf024016d6368ad1f9f03a17acda8141029"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 13 Local 3 Mirrors 0 Missed 10 Current 352 (23% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 358 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: Running task 883 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_fetch)
NOTE: Running task 1345 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 1346 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_unpack)
NOTE: Running task 1347 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 365 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Succeeded
NOTE: Running task 1348 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_patch)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1361 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Succeeded
NOTE: Running task 1362 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1363 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic)
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic unihash changed to 0f8c8920d2e38dec33aa2a6bdd6889c8e1f2bf26e88f44107cc0808f141ee08b
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1363 tasks of which 1355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata.1275685
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata) failed with exit code '1'

--===============2475212888299421911==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-numpy-upgrade-1.23.4-1.24.1.patch"

RnJvbSAwNGFiYmQwMmQzYmJhY2UxN2JjOWE3MzA4Mjg5NjJlN2JkNjFmY2JhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwOTo0OToyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbnVtcHk6IHVwZ3JhZGUgMS4yMy40IC0+IDEuMjQuMQoKLS0tCiAuLi55LWRvLW5vdC13
cml0ZS1mdWxsLXBhdGgtdG8tb3V0cHV0LWYucGF0Y2ggfCAyOCAtLS0tLS0tLS0tLS0tLS0tLS0t
CiAuLi51bXB5XzEuMjMuNC5iYiA9PiBweXRob24zLW51bXB5XzEuMjQuMS5iYn0gfCAgMyArLQog
MiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMzAgZGVsZXRpb25zKC0pCiBkZWxldGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5LzAw
MDEtZ2VuZXJhdGVfdW1hdGgucHktZG8tbm90LXdyaXRlLWZ1bGwtcGF0aC10by1vdXRwdXQtZi5w
YXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtbnVtcHlf
MS4yMy40LmJiID0+IHB5dGhvbjMtbnVtcHlfMS4yNC4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLWdlbmVyYXRl
X3VtYXRoLnB5LWRvLW5vdC13cml0ZS1mdWxsLXBhdGgtdG8tb3V0cHV0LWYucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbnVtcHkvMDAwMS1nZW5lcmF0ZV91bWF0
aC5weS1kby1ub3Qtd3JpdGUtZnVsbC1wYXRoLXRvLW91dHB1dC1mLnBhdGNoCmRlbGV0ZWQgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCA0MWRlYTg5NjgyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1udW1weS8wMDAxLWdlbmVyYXRlX3VtYXRoLnB5
LWRvLW5vdC13cml0ZS1mdWxsLXBhdGgtdG8tb3V0cHV0LWYucGF0Y2gKKysrIC9kZXYvbnVsbApA
QCAtMSwyOCArMCwwIEBACi1Gcm9tIDNjN2RlYWEzYTk2MWEwZjNjZTRmZjEwODQ2OGUzZDcwMTE4
ZjE3YjMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgotRGF0ZTogVGh1LCA5IEp1biAyMDIyIDE3OjIzOjQyICswMjAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIGdlbmVyYXRlX3VtYXRoLnB5OiBkbyBub3Qgd3JpdGUgZnVsbCBw
YXRoIHRvIG91dHB1dCBmaWxlcwotCi1UaGlzIGhlbHBzIHJlcHJvZHVjaWJpbGl0eSBhcyB0aG9z
ZSBwYXRocyB2YXJ5IGluIGF1dG9tYXRlZAotYnVpbGQgZW52aXJvbm1lbnRzLgotCi1VcHN0cmVh
bS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL251bXB5L251bXB5L3B1bGwv
MjE3MDddCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4
LmRlPgotCi0tLS0KLSBudW1weS9jb3JlL2NvZGVfZ2VuZXJhdG9ycy9nZW5lcmF0ZV91bWF0aC5w
eSB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
LQotZGlmZiAtLWdpdCBhL251bXB5L2NvcmUvY29kZV9nZW5lcmF0b3JzL2dlbmVyYXRlX3VtYXRo
LnB5IGIvbnVtcHkvY29yZS9jb2RlX2dlbmVyYXRvcnMvZ2VuZXJhdGVfdW1hdGgucHkKLWluZGV4
IDI5MmQ5ZTAuLmRmMzc5NDEgMTAwNjQ0Ci0tLS0gYS9udW1weS9jb3JlL2NvZGVfZ2VuZXJhdG9y
cy9nZW5lcmF0ZV91bWF0aC5weQotKysrIGIvbnVtcHkvY29yZS9jb2RlX2dlbmVyYXRvcnMvZ2Vu
ZXJhdGVfdW1hdGgucHkKLUBAIC0xMjMzLDcgKzEyMzMsNyBAQCBkZWYgbWFrZV9jb2RlKGZ1bmNk
aWN0LCBmaWxlbmFtZSk6Ci0gCi0gICAgICAgICByZXR1cm4gMDsKLSAgICAgfQotLSAgICAiIiIp
ICUgKGZpbGVuYW1lLCBjb2RlMSwgY29kZTIsIGNvZGUzKQotKyAgICAiIiIpICUgKG9zLnBhdGgu
YmFzZW5hbWUoZmlsZW5hbWUpLCBjb2RlMSwgY29kZTIsIGNvZGUzKQotICAgICByZXR1cm4gY29k
ZQotIAotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LW51bXB5XzEuMjMuNC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1u
dW1weV8xLjI0LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjMuNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW51bXB5XzEuMjQuMS5iYgppbmRleCA2
NzlhNmY0MDgxLi44M2I4YWM0MjMyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbnVtcHlfMS4yMy40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1udW1weV8xLjI0LjEuYmIKQEAgLTExLDkgKzExLDggQEAgU1JDX1VS
SSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0u
dGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtRG9uLXQtc2VhcmNoLXVzci1hbmQtc28t
b24tZm9yLWxpYnJhcmllcy1ieS1kZWZhdWx0LS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLW51bXB5LWNvcmUtRGVmaW5lLVJJU0NWLTMyLXN1cHBvcnQucGF0Y2ggXAogICAgICAgICAg
ICBmaWxlOi8vcnVuLXB0ZXN0IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtZ2VuZXJhdGVfdW1h
dGgucHktZG8tbm90LXdyaXRlLWZ1bGwtcGF0aC10by1vdXRwdXQtZi5wYXRjaCBcCiAgICAgICAg
ICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlZDJjYzkyYWYwZWZhZDIwMTk4NjM4YzY5YmIw
ZmMyODcwYTU4ZGFiZmJhNmViNzIyYzkzM2I0ODU1NmM2ODZjIgorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjIzODZkYTlhNDcxY2MwMGExZjQ3ODQ1ZTI3ZDkxNmQ1ZWM1MzQ2YWU5Njk2ZTAxYThhMzQ3
NjA4NThmZTlkZDIiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbnVt
cHkvbnVtcHkvcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcv
dj8oP1A8cHZlcj5cZCsoXC5cZCspKykkIgotLSAKMi4zNy4zCgo=

--===============2475212888299421911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 71 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:046d0bf024016d6368ad1f9f03a17acda8141029"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 4 Mirrors 0 Missed 10 Current 351 (28% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 353 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_setscene)
NOTE: Running setscene task 358 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_package_setscene)
NOTE: Running task 746 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_fetch)
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 974 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_unpack)
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_unpack: Succeeded
NOTE: Running task 975 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_patch)
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_patch: Succeeded
NOTE: Running task 976 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 977 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic)
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Started
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-numpy-1.24.1-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 365 of 365 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_populate_lic unihash changed to 0f8c8920d2e38dec33aa2a6bdd6889c8e1f2bf26e88f44107cc0808f141ee08b
NOTE: recipe python3-numpy-1.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1138 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-numpy_1.24.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1237 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata)
NOTE: Running task 1362 of 1376 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_package_write_rpm)
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Started
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Started
NOTE: recipe python3-hypothesis-6.57.1-r0: task do_packagedata: Failed
NOTE: recipe python3-numpy-1.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.36-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 1363 tasks of which 1355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.61.0-r0 to 0:6.57.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.57.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-hypothesis/6.57.1-r0/temp/log.do_packagedata.1283940
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-hypothesis_6.57.1.bb:do_packagedata) failed with exit code '1'

--===============2475212888299421911==--

