Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249F0C3527B
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:42 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.10618.1648819421078681757
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aNWVg6Lf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 0101017fe54bbcd7-c43b0424-c846-4945-af7e-3e3f2f900588-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oEBq6E1VFngOwnDJhwthDk1GB1qK1VeHpKoPsiEew3g=;
	b=aNWVg6LfsCKTt8HNAHT3628ra4eBUD1Ddez25HIvKN1XRMkzsnnLbHy5NQl3XeAa
	NIssXq/2jgriZM4IAiAGLkmbdRzYL1l99MpIw/wGO33paCS3ZkuzLHuki3Tlpb/VHOr
	0qTCZveJUSXMm8k4hnAYchMUoKbXDncgd4YGmfD0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819420;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oEBq6E1VFngOwnDJhwthDk1GB1qK1VeHpKoPsiEew3g=;
	b=jI+98Ujdof+jjsaTL9UMS2385w/k36VXzMLxT/Akvbicj8ohfyFK64VZDEKWzpEB
	iNeBp0mvdyIjdDqCjEFsuOF5t9RDIa+NnTMcMewsDvZ47lOywVTexBRSBMbOTBzxX3D
	Ia6Yhnkbr/z4uonbslHeaHRWCGycDWlRiM7LmH7Q=
Content-Type: multipart/mixed; boundary="===============8208081790153424433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.10.4 SUCCEEDED
Message-ID: 
 <0101017fe54bbcd7-c43b0424-c846-4945-af7e-3e3f2f900588-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163908

--===============8208081790153424433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.10.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.10.3-3.10.4.patch
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
--===============8208081790153424433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3/python3-2to3: FILELIST: removed "/usr/lib/python3.10/lib2to3/Grammar3.10.3.final.0.pickle /usr/lib/python3.10/lib2to3/PatternGrammar3.10.3.final.0.pickle", added "/usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle"
packages/core2-32-poky-linux/python3/python3-tests: FILELIST: removed "/usr/lib/python3.10/test/test_asyncio/test_asyncio_waitfor.py /usr/lib/python3.10/test/test_asyncio/__pycache__/test_asyncio_waitfor.cpython-310.pyc", added "/usr/lib/python3.10/test/test_asyncio/test_waitfor.py /usr/lib/python3.10/test/test_asyncio/__pycache__/test_waitfor.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3 (sysroot):
  /usr/lib/python3.10/lib2to3/Grammar3.10.3.final.0.pickle moved to /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle
  /usr/lib/python3.10/lib2to3/PatternGrammar3.10.3.final.0.pickle moved to /usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.10/lib2to3/Grammar3.10.3.final.0.pickle moved to /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle
  /usr/lib/python3.10/lib2to3/PatternGrammar3.10.3.final.0.pickle moved to /usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle

--===============8208081790153424433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3: SRC_URI changed from "http://www.python.org/ftp/python/3.10.3/Python-3.10.3.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://cgi_py.patch file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch file://avoid_warning_about_tkinter.patch file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch file://python-config.patch file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch file://crosspythonpath.patch file://0001-Use-FLAG_REF-always-for-interned-strings.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch file://0001-Makefile-do-not-compile-.pyc-in-par
 allel.patch file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch file://makerace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch" to "http://www.python.org/ftp/python/3.10.4/Python-3.10.4.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://cgi_py.patch file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch file://avoid_warning_about_tkinter.patch file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch file://python-config.patch file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch file://0001-bpo-36852-p
 roper-detection-of-mips-architecture-for-.patch file://crosspythonpath.patch file://0001-Use-FLAG_REF-always-for-interned-strings.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch file://makerace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch"
packages/core2-32-poky-linux/python3: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/libpython3-staticdev: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/libpython3-staticdev: PKGSIZE changed from 13601060 to 13601948 (+0%)
packages/core2-32-poky-linux/python3/libpython3-staticdev: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/libpython3: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/libpython3: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-2to3: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-2to3: FILELIST: removed "/usr/lib/python3.10/lib2to3/Grammar3.10.3.final.0.pickle /usr/lib/python3.10/lib2to3/PatternGrammar3.10.3.final.0.pickle", added "/usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle"
packages/core2-32-poky-linux/python3/python3-2to3: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-asyncio: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-asyncio: PKGSIZE changed from 1013857 to 1014182 (+0%)
packages/core2-32-poky-linux/python3/python3-asyncio: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-audio: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-audio: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-codecs: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-codecs: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-compile: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-compile: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-compression: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-compression: PKGSIZE changed from 348692 to 348802 (+0%)
packages/core2-32-poky-linux/python3/python3-compression: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-core: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-core: PKGSIZE changed from 7571222 to 7571613 (+0%)
packages/core2-32-poky-linux/python3/python3-core: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-crypt: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-crypt: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-ctypes: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-ctypes: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-curses: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-curses: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-datetime: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-datetime: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-db: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-db: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-dbg: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-dbg: PKGSIZE changed from 16223876 to 16224632 (+0%)
packages/core2-32-poky-linux/python3/python3-dbg: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-debugger: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-debugger: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-dev: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-dev: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-difflib: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-difflib: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-distutils-windows: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-distutils-windows: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-distutils: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-distutils: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-doc: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-doc: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-doctest: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-doctest: PKGSIZE changed from 180850 to 181033 (+0%)
packages/core2-32-poky-linux/python3/python3-doctest: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-email: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-email: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-fcntl: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-fcntl: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-gdbm: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-gdbm: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-html: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-html: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-idle: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-idle: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-image: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-image: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-io: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-io: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-json: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-json: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-locale: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-locale: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-logging: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-logging: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-mailbox: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-mailbox: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-man: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-man: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-math: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-math: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-mime: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-mime: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-misc: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-misc: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-mmap: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-mmap: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-modules: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-modules: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-multiprocessing: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-multiprocessing: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-netclient: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-netclient: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-netserver: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-netserver: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-numbers: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-numbers: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-pickle: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-pickle: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-pkgutil: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-pkgutil: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-plistlib: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-plistlib: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-pprint: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-pprint: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-profile: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-profile: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-ptest: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-ptest: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-pydoc: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-pydoc: PKGSIZE changed from 1412731 to 1413266 (+0%)
packages/core2-32-poky-linux/python3/python3-pydoc: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-resource: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-resource: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-shell: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-shell: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-smtpd: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-smtpd: PKGSIZE changed from 115918 to 116135 (+0%)
packages/core2-32-poky-linux/python3/python3-smtpd: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-sqlite3: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-sqlite3: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-src: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-src: PKGSIZE changed from 21002742 to 21003748 (+0%)
packages/core2-32-poky-linux/python3/python3-src: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-staticdev: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-staticdev: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-statistics: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-statistics: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-stringold: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-stringold: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-syslog: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-syslog: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-terminal: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-terminal: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-tests: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-tests: PKGSIZE changed from 39823640 to 39829356 (+0%)
packages/core2-32-poky-linux/python3/python3-tests: FILELIST: removed "/usr/lib/python3.10/test/test_asyncio/__pycache__/test_asyncio_waitfor.cpython-310.pyc /usr/lib/python3.10/test/test_asyncio/test_asyncio_waitfor.py", added "/usr/lib/python3.10/test/test_asyncio/test_waitfor.py /usr/lib/python3.10/test/test_asyncio/__pycache__/test_waitfor.cpython-310.pyc"
packages/core2-32-poky-linux/python3/python3-tests: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-threading: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-threading: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-tkinter: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-tkinter: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-unittest: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-unittest: PKGSIZE changed from 436951 to 436987 (+0%)
packages/core2-32-poky-linux/python3/python3-unittest: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-unixadmin: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-unixadmin: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-venv: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-venv: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-xml: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-xml: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3-xmlrpc: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3-xmlrpc: PV changed from "3.10.3" to "3.10.4"
packages/core2-32-poky-linux/python3/python3: PKGV changed from 3.10.3 [default] to 3.10.4 [default]
packages/core2-32-poky-linux/python3/python3: PV changed from "3.10.3" to "3.10.4"
Changes to packages/core2-32-poky-linux/python3 (sysroot):
  /usr/lib/python3.10/lib2to3/Grammar3.10.3.final.0.pickle moved to /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle
  /usr/lib/python3.10/lib2to3/PatternGrammar3.10.3.final.0.pickle moved to /usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.10/lib2to3/Grammar3.10.3.final.0.pickle moved to /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle
  /usr/lib/python3.10/lib2to3/PatternGrammar3.10.3.final.0.pickle moved to /usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle

--===============8208081790153424433==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.10.3-3.10.4.patch"

From 5ed956cd733a447e69a357946e255c10a18d243b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 08:53:51 +0000
Subject: [PATCH] python3: upgrade 3.10.3 -> 3.10.4

---
 .../0001-Don-t-search-system-for-headers-libraries.patch    | 6 +++---
 ...b-sysconfig.py-use-prefix-value-from-build-configu.patch | 2 +-
 ...stutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch | 2 +-
 .../12-distutils-prefix-is-inside-staging-area.patch        | 2 +-
 .../python/{python3_3.10.3.bb => python3_3.10.4.bb}         | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.10.3.bb => python3_3.10.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 5485020eb4..411aaa419e 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From b6ead2d17ceafed47e598b6f50f3ff669deec5ab Mon Sep 17 00:00:00 2001
+From d6d39cf84c4a53b90bb198761837bf1f879f5252 Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index c190002..5ef368d 100644
+index 2e7f263..cec2ccf 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -854,8 +854,8 @@ class PyBuildExt(build_ext):
+@@ -856,8 +856,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index a9240b3c8a..367907639d 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 01d209277e145072e478d8b9acfea3638ee16cdc Mon Sep 17 00:00:00 2001
+From 5ccd646482d7ba3108e0e9989b9ac0aa59a4c74c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 3c62c2acb8..4bd128da18 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 78dd1def953e18e7cda0325bb26d27c051bb6890 Mon Sep 17 00:00:00 2001
+From 7bf06b225e2f6ad5bca3429d96f1756781896471 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index de4c6c4e19..463551cb82 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 33b5a31df6050110f4481a24f5a0a0bf7fe80096 Mon Sep 17 00:00:00 2001
+From a2eff188b89e0326099950cb4e1b41c1e17eebd0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.10.3.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.3.bb
rename to meta/recipes-devtools/python/python3_3.10.4.bb
index 5c0f0a9eb2..522f0d71ee 100644
--- a/meta/recipes-devtools/python/python3_3.10.3.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "596c72de998dc39205bc4f70ef0dbf7edec740a306d09b49a9bd0a77806730dc"
+SRC_URI[sha256sum] = "80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.27.0


--===============8208081790153424433==--

