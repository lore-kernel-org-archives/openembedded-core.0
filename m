Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92909C27C55
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.17591.1690907329176044908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aWw3c94y;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bUZhR7mV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010189b1ee4752-a68f7f2c-7915-4763-941a-ceaae1fb1d83-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=e8a2Imx/uTRk4X988un4WwqOj06yQklKLvlxCCuqOi4=;
	b=aWw3c94ypkY4PKSWkUt9iV5fAC6cb+PKtk39yMcbiuOeNXws9DAKp8mW6xST9AVR
	5g4zQxX0fxUZVinW/8XtAvdS2F9dMraSbxBEB5w8W9AbLzkSEJMtAyP8+XoPzC1ANIh
	Pwcwvb53UuKX6Wnt+FY/U+ORfUDfQsQeXNlCkzDU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=e8a2Imx/uTRk4X988un4WwqOj06yQklKLvlxCCuqOi4=;
	b=bUZhR7mV825UuC0eyl4FpPaFw/tsq3l7mGgZPK6sLsmbFqxfiNr8sA7l/oZ6PgXO
	LJCJY8cFFCNh+dMpHTDuqdTVSjKNr0QlcMGR4t5pm9JFyy5kExicXM7VeZnk3WHIhbp
	hKBJULP1rA4ZY/nvezwj9rt5YRZgZpFi0R2d1eVM=
Content-Type: multipart/mixed; boundary="===============3932988922096739883=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.41.0 FAILED
Message-ID: <01010189b1ee4752-a68f7f2c-7915-4763-941a-ceaae1fb1d83-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185293

--===============3932988922096739883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-wheel* to *0.41.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-wheel -V 0.41.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (10:22:48.760263)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cdd58910ff549d39538f5351aa02259810906a20"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 1 Mirrors 0 Missed 0 Current 29 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cdd58910ff549d39538f5351aa02259810906a20"
workspace            = "master:4ddeb8ee8baf964dddf9cf9085d78aa0bf7b28eb"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.41.0.tar.gz;downloadfilename=wheel-0.41.0.tar.gz...
ERROR: Execution of 'git add -f -A "source-date-epoch/__source_date_epoch.txt" "wheel-0.41.0/LICENSE.txt" "wheel-0.41.0/PKG-INFO" "wheel-0.41.0/README.rst" "wheel-0.41.0/docs/Makefile" "wheel-0.41.0/docs/conf.py" "wheel-0.41.0/docs/development.rst" "wheel-0.41.0/docs/index.rst" "wheel-0.41.0/docs/installing.rst" "wheel-0.41.0/docs/make.bat" "wheel-0.41.0/docs/manpages/wheel.rst" "wheel-0.41.0/docs/news.rst" "wheel-0.41.0/docs/quickstart.rst" "wheel-0.41.0/docs/reference/index.rst" "wheel-0.41.0/docs/reference/wheel_convert.rst" "wheel-0.41.0/docs/reference/wheel_pack.rst" "wheel-0.41.0/docs/reference/wheel_tags.rst" "wheel-0.41.0/docs/reference/wheel_unpack.rst" "wheel-0.41.0/docs/story.rst" "wheel-0.41.0/docs/user_guide.rst" "wheel-0.41.0/pyproject.toml" "wheel-0.41.0/setup.py" "wheel-0.41.0/src/wheel/__init__.py" "wheel-0.41.0/src/wheel/__main__.py" "wheel-0.41.0/src/wheel/_setuptools_logging.py" "wheel-0.41.0/src/wheel/bdist_wheel.py" "wheel-0.41.0/src/wheel/cli/__init__.py" "whee
 l-0.41.0/src/wheel/cli/convert.py" "wheel-0.41.0/src/wheel/cli/pack.py" "wheel-0.41.0/src/wheel/cli/tags.py" "wheel-0.41.0/src/wheel/cli/unpack.py" "wheel-0.41.0/src/wheel/macosx_libfile.py" "wheel-0.41.0/src/wheel/metadata.py" "wheel-0.41.0/src/wheel/util.py" "wheel-0.41.0/src/wheel/vendored/__init__.py" "wheel-0.41.0/src/wheel/vendored/packaging/__init__.py" "wheel-0.41.0/src/wheel/vendored/packaging/_elffile.py" "wheel-0.41.0/src/wheel/vendored/packaging/_manylinux.py" "wheel-0.41.0/src/wheel/vendored/packaging/_musllinux.py" "wheel-0.41.0/src/wheel/vendored/packaging/_parser.py" "wheel-0.41.0/src/wheel/vendored/packaging/_structures.py" "wheel-0.41.0/src/wheel/vendored/packaging/_tokenizer.py" "wheel-0.41.0/src/wheel/vendored/packaging/markers.py" "wheel-0.41.0/src/wheel/vendored/packaging/requirements.py" "wheel-0.41.0/src/wheel/vendored/packaging/specifiers.py" "wheel-0.41.0/src/wheel/vendored/packaging/tags.py" "wheel-0.41.0/src/wheel/vendored/packaging/utils.py" "wheel-0.41.
 0/src/wheel/vendored/packaging/version.py" "wheel-0.41.0/src/wheel/vendored/vendor.txt" "wheel-0.41.0/src/wheel/wheelfile.py" "wheel-0.41.0/tests/cli/eggnames.txt" "wheel-0.41.0/tests/cli/test_convert.py" "wheel-0.41.0/tests/cli/test_pack.py" "wheel-0.41.0/tests/cli/test_tags.py" "wheel-0.41.0/tests/cli/test_unpack.py" "wheel-0.41.0/tests/conftest.py" "wheel-0.41.0/tests/test_bdist_wheel.py" "wheel-0.41.0/tests/test_macosx_libfile.py" "wheel-0.41.0/tests/test_metadata.py" "wheel-0.41.0/tests/test_sdist.py" "wheel-0.41.0/tests/test_tagopt.py" "wheel-0.41.0/tests/test_wheelfile.py" "wheel-0.41.0/tests/testdata/abi3extension.dist/extension.c" "wheel-0.41.0/tests/testdata/abi3extension.dist/setup.cfg" "wheel-0.41.0/tests/testdata/abi3extension.dist/setup.py" "wheel-0.41.0/tests/testdata/commasinfilenames.dist/mypackage/__init__.py" "wheel-0.41.0/tests/testdata/commasinfilenames.dist/mypackage/data/1,2,3.txt" "wheel-0.41.0/tests/testdata/commasinfilenames.dist/mypackage/data/__init__.py"
  "wheel-0.41.0/tests/testdata/commasinfilenames.dist/setup.py" "wheel-0.41.0/tests/testdata/commasinfilenames.dist/testrepo-0.1.0/mypackage/__init__.py" "wheel-0.41.0/tests/testdata/complex-dist/complexdist/__init__.py" "wheel-0.41.0/tests/testdata/complex-dist/setup.py" "wheel-0.41.0/tests/testdata/extension.dist/extension.c" "wheel-0.41.0/tests/testdata/extension.dist/setup.py" "wheel-0.41.0/tests/testdata/headers.dist/header.h" "wheel-0.41.0/tests/testdata/headers.dist/headersdist.py" "wheel-0.41.0/tests/testdata/headers.dist/setup.cfg" "wheel-0.41.0/tests/testdata/headers.dist/setup.py" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/libb.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib.c" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_10.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_10_10.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_10_386.dylib" "wheel-
 0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_10_fat.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_14.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_14_386.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_14_fat.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_6.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_6_386.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_6_fat.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_10_9_universal2.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_11.dylib" "wheel-0.41.0/tests/testdata/macosx_minimal_system_version/test_lib_multiple_fat.dylib" "wheel-0.41.0/tests/testdata/simple.dist/setup.py" "wheel-0.41.0/tests/testdata/simple.dist/simpledist/__init__.py" "wheel-0.41.0/tests/testdata/test-1.0-py2.py3-n
 one-any.whl" "wheel-0.41.0/tests/testdata/unicode.dist/setup.py" "wheel-0.41.0/tests/testdata/unicode.dist/unicodedist/__init__.py" ""wheel-0.41.0/tests/testdata/unicode.dist/unicodedist/\303\245\303\244\303\266_\346\227\245\346\234\254\350\252\236.py"" "LICENSE.txt"' failed with exit code 128:
fatal: pathspec 'wheel-0.41.0/tests/testdata/unicode.dist/unicodedist/303245303244303266_346227245346234254350252236.py' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3932988922096739883==--

