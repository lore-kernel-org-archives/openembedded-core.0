Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD07C05051
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:28:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.17587.1690907328561283700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NZRNTS2Z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EzCM6jfS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010189b1ee45ea-805103b8-895c-4da4-b1e3-2a8ad2fb1327-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1690907330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fOUNrCrG6aUCKekCeHXrDBRAzqS0ugjL96OMcwA6ePk=;
	b=NZRNTS2Zc34P5y4L0ecZxBvz/mByGmxY56vXpdHAnOfkrGphhvf923Y2G8f45D3n
	JPb6+y9tdelIkcOR0t4FSDfnXktK58955E6MVMFmCNUjNp5KKLDdiKdgDSga6ejKlWl
	jNhHia4re+Ka6CQRJv7ENBSKfcOvQWUihqB6b3A4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1690907330;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fOUNrCrG6aUCKekCeHXrDBRAzqS0ugjL96OMcwA6ePk=;
	b=EzCM6jfSoNGLUb5nZBVNCIftdCeN+vUF2fcevvqQB+sORrT6zdSuhwZ8GsvP8qBB
	6MtGU/yj8qjhCIwh7QsW+pNlE6aDm5GM/GZeLsOQdKJJeyw3BImOyM4wYPilgWaPZvh
	f/QM5G721v/sWDS7SoIQJgz9X1gdpm/vz2gvVZZI=
Content-Type: multipart/mixed; boundary="===============8723771055781488760=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-libarchive-c: upgrading to 5.0 FAILED
Message-ID: <01010189b1ee45ea-805103b8-895c-4da4-b1e3-2a8ad2fb1327-000000@us-west-2.amazonses.com>
Date: Tue, 1 Aug 2023 16:28:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:28:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185284

--===============8723771055781488760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-libarchive-c* to *5.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-libarchive-c -V 5.0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (09:55:35.788639)
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.

Summary: There was 1 WARNING message.
WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
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
INFO: Fetching https://files.pythonhosted.org/packages/source/l/libarchive-c/libarchive-c-5.0.tar.gz;downloadfilename=libarchive-c-5.0.tar.gz...
ERROR: Execution of 'git add -f -A "libarchive-c-5.0/.gitattributes" "libarchive-c-5.0/.github/FUNDING.yml" "libarchive-c-5.0/.github/workflows/main.yml" "libarchive-c-5.0/.gitignore" "libarchive-c-5.0/LICENSE.md" "libarchive-c-5.0/MANIFEST.in" "libarchive-c-5.0/PKG-INFO" "libarchive-c-5.0/README.rst" "libarchive-c-5.0/libarchive/__init__.py" "libarchive-c-5.0/libarchive/entry.py" "libarchive-c-5.0/libarchive/exception.py" "libarchive-c-5.0/libarchive/extract.py" "libarchive-c-5.0/libarchive/ffi.py" "libarchive-c-5.0/libarchive/flags.py" "libarchive-c-5.0/libarchive/read.py" "libarchive-c-5.0/libarchive/write.py" "libarchive-c-5.0/libarchive_c.egg-info/PKG-INFO" "libarchive-c-5.0/libarchive_c.egg-info/SOURCES.txt" "libarchive-c-5.0/libarchive_c.egg-info/dependency_links.txt" "libarchive-c-5.0/libarchive_c.egg-info/top_level.txt" "libarchive-c-5.0/setup.cfg" "libarchive-c-5.0/setup.py" "libarchive-c-5.0/tests/__init__.py" "libarchive-c-5.0/tests/data/flags.tar" "libarchive-c-5.0/tests
 /data/special.tar" "libarchive-c-5.0/tests/data/tar_relative.tar" "libarchive-c-5.0/tests/data/testtar.README" "libarchive-c-5.0/tests/data/testtar.tar" "libarchive-c-5.0/tests/data/testtar.tar.json" "libarchive-c-5.0/tests/data/unicode.tar" "libarchive-c-5.0/tests/data/unicode.tar.json" "libarchive-c-5.0/tests/data/unicode.zip" "libarchive-c-5.0/tests/data/unicode.zip.json" "libarchive-c-5.0/tests/data/unicode2.zip" "libarchive-c-5.0/tests/data/unicode2.zip.json" ""libarchive-c-5.0/tests/data/\355\224\204\353\241\234\352\267\270\353\236\250.README"" ""libarchive-c-5.0/tests/data/\355\224\204\353\241\234\352\267\270\353\236\250.zip"" ""libarchive-c-5.0/tests/data/\355\224\204\353\241\234\352\267\270\353\236\250.zip.json"" "libarchive-c-5.0/tests/test_atime_mtime_ctime.py" "libarchive-c-5.0/tests/test_convert.py" "libarchive-c-5.0/tests/test_entry.py" "libarchive-c-5.0/tests/test_errors.py" "libarchive-c-5.0/tests/test_rwx.py" "libarchive-c-5.0/tests/test_security_flags.py" "libarchi
 ve-c-5.0/tox.ini" "libarchive-c-5.0/version.py" "source-date-epoch/__source_date_epoch.txt" ".gitattributes" ".github/FUNDING.yml" ".github/workflows/main.yml" ".gitignore" "LICENSE.md" "MANIFEST.in" "PKG-INFO" "README.rst" "libarchive/__init__.py" "libarchive/entry.py" "libarchive/exception.py" "libarchive/extract.py" "libarchive/ffi.py" "libarchive/flags.py" "libarchive/read.py" "libarchive/write.py" "libarchive_c.egg-info/PKG-INFO" "libarchive_c.egg-info/SOURCES.txt" "libarchive_c.egg-info/dependency_links.txt" "libarchive_c.egg-info/top_level.txt" "setup.cfg" "setup.py" "tests/__init__.py" "tests/data/flags.tar" "tests/data/special.tar" "tests/data/tar_relative.tar" "tests/data/testtar.README" "tests/data/testtar.tar" "tests/data/testtar.tar.json" "tests/data/unicode.tar" "tests/data/unicode.tar.json" "tests/data/unicode.zip" "tests/data/unicode.zip.json" "tests/data/unicode2.zip" "tests/data/unicode2.zip.json" ""tests/data/\355\224\204\353\241\234\352\267\270\353\236\250.README
 "" ""tests/data/\355\224\204\353\241\234\352\267\270\353\236\250.zip"" ""tests/data/\355\224\204\353\241\234\352\267\270\353\236\250.zip.json"" "tests/test_atime_mtime_ctime.py" "tests/test_convert.py" "tests/test_entry.py" "tests/test_errors.py" "tests/test_rwx.py" "tests/test_security_flags.py" "tox.ini" "version.py"' failed with exit code 128:
fatal: pathspec 'libarchive-c-5.0/tests/data/355224204353241234352267270353236250.README' did not match any files



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8723771055781488760==--

