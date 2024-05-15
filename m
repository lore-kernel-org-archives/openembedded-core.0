Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6423EC3065D
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.1281.1715794338438560651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=EzGRShMx;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FwSSv2DV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018f7d4fe074-919c6ea6-b322-4c73-b43e-752260ea7985-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jZyMc9WYJti3J+9DY1uA8F2XsZuo+u0oV7lBm5I/u84=;
	b=EzGRShMxH0JlKUFKNijJrmHCnddVBlnk/7nYxR+5vdhYLBLbG5myVTVLP8EvcuG1
	tUbvh/t3wMR3dGC00XW5mhDcrymq/EuX3y9o6ixfzcRDOB3ygdKi1onGmR88wPDm7F8
	oRO2pBtWtgaSujtpxzPVd8Wl0zf2mW6WuGwNOq/0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794338;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jZyMc9WYJti3J+9DY1uA8F2XsZuo+u0oV7lBm5I/u84=;
	b=FwSSv2DVnboDnPiKPWoOgoZJBayVISSRQiiHHvSmH/JjKMSOKaIJlQf9SoiF1zno
	60wUTTpAi6ly0s74V4tF+tCku2F63pVrVbmuGqku/j4iVRZUL+S9ChB+smptrQb5s72
	TFBMkNuSFakG6QXOOrysZ/eU4zqtRXV0zrNrBJe0=
Content-Type: multipart/mixed; boundary="===============6356054545297996907=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-meson-python: upgrading to 0.16.0 FAILED
Message-ID: <0101018f7d4fe074-919c6ea6-b322-4c73-b43e-752260ea7985-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199335

--===============6356054545297996907==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-meson-python* to *0.16.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-meson-python -V 0.16.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8293c88c58b7415ad3b5272c9cf1105f559b33fc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8293c88c58b7415ad3b5272c9cf1105f559b33fc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (920 cached, 2 parsed). 1880 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8293c88c58b7415ad3b5272c9cf1105f559b33fc"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8293c88c58b7415ad3b5272c9cf1105f559b33fc"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/m/meson_python/meson_python-0.16.0.tar.gz;downloadfilename=meson_python-0.16.0.tar.gz...
ERROR: Execution of 'git add -f -A ".readthedocs.yaml" "tests/packages/complex/complex/more/baz.pyx" "tests/packages/complex/complex/more/meson.build" "tests/packages/complex/foo.py" "tests/packages/complex/move.py" "tests/packages/custom-target-dir/codegen.py" "tests/packages/custom-target-dir/meson.build" "tests/packages/custom-target-dir/pyproject.toml" "tests/packages/encoding/meson.build" "tests/packages/encoding/pyproject.toml" ""tests/packages/encoding/\343\203\206\343\202\271\343\203\210.py"" ".cirrus.yml" ".github/workflows/docs.yml" ".github/workflows/tests.yml" ".pre-commit-config.yaml" ".readthedocs.yml" "CHANGELOG.rst" "PKG-INFO" "README.rst" "ci/alpine-3.docker" "ci/debian-11.docker" "ci/debian-12.docker" "ci/fedora-37.docker" "ci/miniconda.docker" "docs/changelog.rst" "docs/conf.py" "docs/contributing/commit-format.rst" "docs/contributing/documentation.rst" "docs/contributing/getting-started.rst" "docs/contributing/index.rst" "docs/contributing/release-process.rst" "do
 cs/contributing/test-suite.rst" "docs/explanations/design.rst" "docs/explanations/editable-installs.rst" "docs/explanations/internal-dependencies.rst" "docs/how-to-guides/build-directory.rst" "docs/how-to-guides/config-settings.rst" "docs/how-to-guides/first-project.rst" "docs/index.rst" "docs/projects-using-meson-python.rst" "docs/reference/environment-variables.rst" "docs/reference/meson-compatibility.rst" "docs/reference/pyproject-settings.rst" "docs/reference/quirks.rst" "docs/tutorials/entrypoints.rst" "docs/tutorials/executable.rst" "docs/tutorials/introduction.rst" "meson.build" "mesonpy/__init__.py" "mesonpy/_editable.py" "mesonpy/_tags.py" "mesonpy/_util.py" "pyproject.toml" "tests/packages/complex/meson.build" "tests/packages/imports-itself-during-build/meson.build" "tests/test_editable.py" "tests/test_output.py" "tests/test_project.py" "tests/test_tags.py" "tests/test_wheel.py"' failed with exit code 128:
fatal: pathspec 'tests/packages/encoding/343203206343202271343203210.py' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6356054545297996907==--

