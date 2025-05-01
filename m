Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4231C3ABDE
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:45 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.1783.1746113613410305285
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cg45ACfX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=c6wz6Dc2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101968c7b78fb-d78f060f-c11a-4cc7-943b-327e055b935e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+BIzu/SXgjDx2eAGIr1rCE1VedLjKxYy+BOFYwhavCM=;
	b=cg45ACfXuXqCqyu87v3GQCSM3I31zx8DGwpIVFuBAU4MKQNhjT7E3TLutnrbBCet
	epH2/1lYQYFY6Na/KjBXIh/L0uwHRBblvcw8NZkq3Fbli8hSIgJFRZqj5fWMgBuvlA3
	ylD3GE5wRRCQpAIBFQlne5WI6pgBAO2ZHyrzFVRc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113624;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+BIzu/SXgjDx2eAGIr1rCE1VedLjKxYy+BOFYwhavCM=;
	b=c6wz6Dc2BXaK8jPGGzT2/2UBmyrNoHRHqYRANtsM3+rQTVvoUuD1+fkJkvB+UpN8
	q6pDy5KzojWWTpsr/wF97m0ma/4L5kQNxKii9at816dlHzhnJl7voCtHKtR8KsuueDK
	J+FLe76lqw1KpaUbtPqhrK3DCepqbp4xwZErW3mc=
Content-Type: multipart/mixed; boundary="===============4992182253090019430=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wheel: upgrading to 0.46.1 FAILED
Message-ID: <010101968c7b78fb-d78f060f-c11a-4cc7-943b-327e055b935e-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215832

--===============4992182253090019430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wheel* to *0.46.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-wheel -V 0.46.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1897 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d7815b0c4b2994e92aeeb42e97764bdec7d63eee"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 929 .bb files complete (0 cached, 929 parsed). 1898 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d7815b0c4b2994e92aeeb42e97764bdec7d63eee"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
WARNING: tmp-recipetool-dt1c8e6s: the directory /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-ajxldj_m/emptysrc (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-ajxldj_m/emptysrc) pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/w/wheel/wheel-0.46.1.tar.gz;downloadfilename=wheel-0.46.1.tar.gz...
ERROR: Execution of 'git add -f -A "src/wheel/_commands/__init__.py" "src/wheel/_commands/convert.py" "src/wheel/_commands/pack.py" "src/wheel/_commands/tags.py" "src/wheel/_commands/unpack.py" "src/wheel/_metadata.py" "tests/commands/__init__.py" "tests/commands/test_convert.py" "tests/commands/test_pack.py" "tests/commands/test_tags.py" "tests/commands/test_unpack.py" "tests/commands/util.py" "tests/testdata/eggnames.txt" "PKG-INFO" "docs/installing.rst" "docs/news.rst" "pyproject.toml" "setup.py" "src/wheel/__init__.py" "src/wheel/__main__.py" "src/wheel/_bdist_wheel.py" "src/wheel/_setuptools_logging.py" "src/wheel/bdist_wheel.py" "src/wheel/cli/__init__.py" "src/wheel/cli/convert.py" "src/wheel/cli/pack.py" "src/wheel/cli/tags.py" "src/wheel/cli/unpack.py" "src/wheel/macosx_libfile.py" "src/wheel/metadata.py" "src/wheel/util.py" "src/wheel/vendored/__init__.py" "src/wheel/vendored/packaging/LICENSE" "src/wheel/vendored/packaging/LICENSE.APACHE" "src/wheel/vendored/packaging/LICE
 NSE.BSD" "src/wheel/vendored/packaging/__init__.py" "src/wheel/vendored/packaging/_elffile.py" "src/wheel/vendored/packaging/_manylinux.py" "src/wheel/vendored/packaging/_musllinux.py" "src/wheel/vendored/packaging/_parser.py" "src/wheel/vendored/packaging/_structures.py" "src/wheel/vendored/packaging/_tokenizer.py" "src/wheel/vendored/packaging/markers.py" "src/wheel/vendored/packaging/requirements.py" "src/wheel/vendored/packaging/specifiers.py" "src/wheel/vendored/packaging/tags.py" "src/wheel/vendored/packaging/utils.py" "src/wheel/vendored/packaging/version.py" "src/wheel/vendored/vendor.txt" "src/wheel/wheelfile.py" "tests/cli/eggnames.txt" "tests/cli/test_convert.py" "tests/cli/test_pack.py" "tests/cli/test_tags.py" "tests/cli/test_unpack.py" "tests/conftest.py" "tests/test_bdist_wheel.py" "tests/test_macosx_libfile.py" "tests/test_metadata.py" "tests/test_sdist.py" "tests/test_tagopt.py" "tests/test_wheelfile.py" "tests/testdata/abi3extension.dist/extension.c" "tests/testdat
 a/abi3extension.dist/setup.cfg" "tests/testdata/abi3extension.dist/setup.py" "tests/testdata/commasinfilenames.dist/mypackage/__init__.py" "tests/testdata/commasinfilenames.dist/mypackage/data/1,2,3.txt" "tests/testdata/commasinfilenames.dist/mypackage/data/__init__.py" "tests/testdata/commasinfilenames.dist/setup.py" "tests/testdata/commasinfilenames.dist/testrepo-0.1.0/mypackage/__init__.py" "tests/testdata/complex-dist/complexdist/__init__.py" "tests/testdata/complex-dist/setup.py" "tests/testdata/extension.dist/extension.c" "tests/testdata/extension.dist/setup.py" "tests/testdata/headers.dist/header.h" "tests/testdata/headers.dist/headersdist.py" "tests/testdata/headers.dist/setup.cfg" "tests/testdata/headers.dist/setup.py" "tests/testdata/macosx_minimal_system_version/libb.dylib" "tests/testdata/macosx_minimal_system_version/test_lib.c" "tests/testdata/macosx_minimal_system_version/test_lib_10_10.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_10_10_10.dylib" "tes
 ts/testdata/macosx_minimal_system_version/test_lib_10_10_386.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_10_10_fat.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_10_14.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_10_14_386.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_10_14_fat.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_10_6.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_10_6_386.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_10_6_fat.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_10_9_universal2.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_11.dylib" "tests/testdata/macosx_minimal_system_version/test_lib_multiple_fat.dylib" "tests/testdata/simple.dist/setup.py" "tests/testdata/simple.dist/simpledist/__init__.py" "tests/testdata/unicode.dist/setup.py" "tests/testdata/unicode.dist/unicodedist/__init__.py" ""tests/testdata/unicode.dist/unico
 dedist/\303\245\303\244\303\266_\346\227\245\346\234\254\350\252\236.py""' failed with exit code 128:
fatal: pathspec 'tests/testdata/unicode.dist/unicodedist/303245303244303266_346227245346234254350252236.py' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4992182253090019430==--

