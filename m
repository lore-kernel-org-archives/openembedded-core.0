Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FAE4CA9EB6
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.3771.1684186748712335923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dh9PbPBR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a54c3-103caf21-9fab-4efb-9cd7-e8f655ff9635-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d/YMcYg+TSwV16A/R25zZfS/67DzyP/gy4YlDqwObCo=;
	b=dh9PbPBRMWZ1/6+6vJzDMBSCg/xcpWCSwF2CJJonFIHG3H90btmVpivB2daVqlKL
	3tscaD/rqCDByyJ2xrfrR9Tk5BswDasF6obgEndz7owAHP6WgRoaTnnOP1JNiFp7zhP
	KvN+jDAinZJQM7SRgJcDGVTt/KrzXDu7t1wK4lbE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d/YMcYg+TSwV16A/R25zZfS/67DzyP/gy4YlDqwObCo=;
	b=GTyETdcycWvwI5G1Y888QPeAPA0+9p9MnpSkdyIWcu9Ij/LIDSKIWhW3Z+5oC1AL
	S8CP3xIbOstW5Nfic1mn8zwFKZkFwbDEOxjVCedzdP7lzGawJ47cCxjyianKzv+mBuV
	QofV2+1SlBnMw6CSpn73zalmcmzkA1BoxXaW337Q=
Content-Type: multipart/mixed; boundary="===============5994256931628935703=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.11.3 SUCCEEDED
Message-ID: <01010188215a54c3-103caf21-9fab-4efb-9cd7-e8f655ff9635-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181322

--===============5994256931628935703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.11.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.11.2-3.11.3.patch
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
--===============5994256931628935703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3: SRC_URI changed from "http://www.python.org/ftp/python/3.11.2/Python-3.11.2.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://cgi_py.patch file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch file://avoid_warning_about_tkinter.patch file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch file://crosspythonpath.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch file://maker
 ace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch file://deterministic_imports.patch file://0001-Avoid-shebang-overflow-on-python-config.py.patch file://0001-Update-test_sysconfig-for-posix_user-purelib.patch" to "http://www.python.org/ftp/python/3.11.3/Python-3.11.3.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://cgi_py.patch file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch file://avoid_warning_about_tkinter.patch file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch file://crosspythonpath.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://0017-setup.py-do-no
 t-report-missing-dependencies-for-disa.patch file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch file://makerace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch file://deterministic_imports.patch file://0001-Avoid-shebang-overflow-on-python-config.py.patch file://0001-Update-test_sysconfig-for-posix_user-purelib.patch"
packages/core2-32-poky-linux/python3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/libpython3-staticdev: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/libpython3-staticdev: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/libpython3-staticdev: PKGSIZE changed from 19331736 to 19249074 (-0%)
packages/core2-32-poky-linux/python3/libpython3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/libpython3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/libpython3: PKGSIZE changed from 4930300 to 4905724 (-0%)
packages/core2-32-poky-linux/python3/python3-2to3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-2to3: FILELIST: removed "/usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle /usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle", added "/usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle /usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle"
packages/core2-32-poky-linux/python3/python3-2to3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-asyncio: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-asyncio: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-asyncio: PKGSIZE changed from 1376419 to 1379304 (+0%)
packages/core2-32-poky-linux/python3/python3-audio: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-audio: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-codecs: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-codecs: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-compile: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-compile: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-compression: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-compression: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-compression: PKGSIZE changed from 480965 to 482082 (+0%)
packages/core2-32-poky-linux/python3/python3-core: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-core: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-core: PKGSIZE changed from 9167845 to 9171120 (+0%)
packages/core2-32-poky-linux/python3/python3-crypt: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-crypt: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-ctypes: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-ctypes: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-curses: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-curses: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-datetime: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-datetime: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-db: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-db: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-dbg: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-dbg: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-dbg: PKGSIZE changed from 21410032 to 21318476 (-0%)
packages/core2-32-poky-linux/python3/python3-debugger: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-debugger: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-debugger: PKGSIZE changed from 220409 to 219646 (-0%)
packages/core2-32-poky-linux/python3/python3-dev: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-dev: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-difflib: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-difflib: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-distutils-windows: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-distutils-windows: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-distutils: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-distutils: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-doc: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-doc: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-doctest: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-doctest: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-email: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-email: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-ensurepip: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-ensurepip: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-fcntl: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-fcntl: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-gdbm: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-gdbm: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-html: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-html: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-html: PKGSIZE changed from 220811 to 220830 (+0%)
packages/core2-32-poky-linux/python3/python3-idle: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-idle: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-idle: PKGSIZE changed from 2225962 to 2225750 (-0%)
packages/core2-32-poky-linux/python3/python3-image: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-image: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-io: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-io: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-io: PKGSIZE changed from 1007707 to 1007745 (+0%)
packages/core2-32-poky-linux/python3/python3-json: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-json: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-locale: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-locale: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-logging: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-logging: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-mailbox: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-mailbox: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-man: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-man: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-math: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-math: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-mime: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-mime: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-misc: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-misc: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-misc: PKGSIZE changed from 2572952 to 2572992 (+0%)
packages/core2-32-poky-linux/python3/python3-mmap: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-mmap: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-modules: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-modules: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-multiprocessing: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-multiprocessing: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-netclient: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-netclient: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-netclient: PKGSIZE changed from 1011227 to 1011370 (+0%)
packages/core2-32-poky-linux/python3/python3-netserver: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-netserver: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-numbers: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-numbers: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-pickle: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-pickle: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-pkgutil: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-pkgutil: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-plistlib: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-plistlib: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-plistlib: PKGSIZE changed from 74083 to 74293 (+0%)
packages/core2-32-poky-linux/python3/python3-pprint: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-pprint: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-profile: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-profile: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-profile: PKGSIZE changed from 260416 to 260633 (+0%)
packages/core2-32-poky-linux/python3/python3-ptest: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-ptest: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-pydoc: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-pydoc: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-pydoc: PKGSIZE changed from 1490905 to 1489302 (-0%)
packages/core2-32-poky-linux/python3/python3-resource: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-resource: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-shell: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-shell: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-smtpd: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-smtpd: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-sqlite3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-sqlite3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-src: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-src: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-src: PKGSIZE changed from 26541501 to 26535847 (-0%)
packages/core2-32-poky-linux/python3/python3-staticdev: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-staticdev: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-statistics: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-statistics: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-stringold: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-stringold: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-syslog: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-syslog: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-terminal: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-terminal: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-tests: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-tests: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-tests: PKGSIZE changed from 59056335 to 59151351 (+0%)
packages/core2-32-poky-linux/python3/python3-threading: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-threading: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-tkinter: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-tkinter: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-tomllib: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-tomllib: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-unittest: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-unittest: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-unittest: PKGSIZE changed from 572070 to 572602 (+0%)
packages/core2-32-poky-linux/python3/python3-unixadmin: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-unixadmin: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-venv: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-venv: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-xml: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-xml: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-xmlrpc: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-xmlrpc: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-zoneinfo: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3-zoneinfo: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
packages/core2-32-poky-linux/python3/python3-zoneinfo: PKGSIZE changed from 113362 to 113359 (-0%)
packages/core2-32-poky-linux/python3/python3: PV changed from "3.11.2" to "3.11.3"
packages/core2-32-poky-linux/python3/python3: PKGV changed from 3.11.2 [default] to 3.11.3 [default]
Changes to packages/core2-32-poky-linux/python3 (sysroot):
  /usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle
  /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle
  /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle

--===============5994256931628935703==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.11.2-3.11.3.patch"

RnJvbSA0MTU4MWViZjEyNzVhMzE2NjMzM2RiN2ViMmZiYTBmZjg4MTEzMTJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTM6MDg6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zOiB1cGdyYWRlIDMuMTEuMiAtPiAzLjExLjMKCi0tLQogLi4uLzAwMDEtRG9uLXQtc2Vh
cmNoLXN5c3RlbS1mb3ItaGVhZGVycy1saWJyYXJpZXMucGF0Y2ggICAgICAgIHwgMiArLQogLi4u
MS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1idWlsZC1jb25maWd1LnBh
dGNoIHwgMiArLQogLi4uL3B5dGhvbjMvMTItZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNpZGUtc3Rh
Z2luZy1hcmVhLnBhdGNoICAgIHwgMiArLQogLi4uL3B5dGhvbi97cHl0aG9uM18zLjExLjIuYmIg
PT4gcHl0aG9uM18zLjExLjMuYmJ9ICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi97cHl0aG9uM18zLjExLjIuYmIgPT4gcHl0aG9uM18zLjExLjMuYmJ9ICg5
OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAw
MDEtRG9uLXQtc2VhcmNoLXN5c3RlbS1mb3ItaGVhZGVycy1saWJyYXJpZXMucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1Eb24tdC1zZWFyY2gtc3lzdGVt
LWZvci1oZWFkZXJzLWxpYnJhcmllcy5wYXRjaAppbmRleCA5NmU1ZTgxMzQyLi4wZjE4YjBlYTU3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1E
b24tdC1zZWFyY2gtc3lzdGVtLWZvci1oZWFkZXJzLWxpYnJhcmllcy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1Eb24tdC1zZWFyY2gtc3lzdGVt
LWZvci1oZWFkZXJzLWxpYnJhcmllcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2QyOTZk
YzYzNWFkM2FjMjc5Mjk1NWNlMzdlMTQwYTQxMDRiMDk4ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNDg0YmI5YzY0MmU4NjQwYzU5NGFiY2ZhY2VhYmE3Njc5MDY4YWVkMiBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEplcmVteSBQdWhsbWFuIDxqcHVobG1hbkBtdmlzdGEu
Y29tPgogRGF0ZTogV2VkLCA0IE1hciAyMDIwIDAwOjA2OjQyICswMDAwCiBTdWJqZWN0OiBbUEFU
Q0hdIERvbid0IHNlYXJjaCBzeXN0ZW0gZm9yIGhlYWRlcnMvbGlicmFyaWVzCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMDAwMS1MaWItc3lzY29uZmln
LnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1idWlsZC1jb25maWd1LnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzAwMDEtTGliLXN5c2NvbmZpZy5weS11c2UtcHJl
Zml4LXZhbHVlLWZyb20tYnVpbGQtY29uZmlndS5wYXRjaAppbmRleCA4Njk3MWY0MDQ4Li5hYzgw
OWNhOGVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMv
MDAwMS1MaWItc3lzY29uZmlnLnB5LXVzZS1wcmVmaXgtdmFsdWUtZnJvbS1idWlsZC1jb25maWd1
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy8wMDAxLUxp
Yi1zeXNjb25maWcucHktdXNlLXByZWZpeC12YWx1ZS1mcm9tLWJ1aWxkLWNvbmZpZ3UucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGNhYjhiOGIxMzkwMTY1YTkzZGZiMjdjNDhjMWNjNGMzZTQy
ODBkZmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlkMmU5OWVkMmUzMjRhZTBjZTJl
YThiODlmNDZiNmQyMjI1Nzc5MmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogRGF0ZTogRnJpLCAxMCBTZXAgMjAy
MSAxMjoyODozMSArMDIwMAogU3ViamVjdDogW1BBVENIXSBMaWIvc3lzY29uZmlnLnB5OiB1c2Ug
cHJlZml4IHZhbHVlIGZyb20gYnVpbGQgY29uZmlndXJhdGlvbgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLzEyLWRpc3R1dGlscy1wcmVmaXgtaXMtaW5z
aWRlLXN0YWdpbmctYXJlYS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy8xMi1kaXN0dXRpbHMtcHJlZml4LWlzLWluc2lkZS1zdGFnaW5nLWFyZWEucGF0Y2gKaW5k
ZXggZTA4MGI1YzU2Mi4uZWEzZGQ0YWNkNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLzEyLWRpc3R1dGlscy1wcmVmaXgtaXMtaW5zaWRlLXN0YWdpbmct
YXJlYS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMvMTIt
ZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNpZGUtc3RhZ2luZy1hcmVhLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA3OWU3ZWQ1OTc1MDYxMmU1NzY0Nzg0Nzk1N2FiODU3MDkzMDdlYTM4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmMDBjYTJmZDc3YTU3MGFhNDA0YmQ5OTRmZDBhZWU1
YjA0MTIzZGU1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTQgTWF5IDIwMTMgMTU6MDA6MjYgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gcHl0aG9uMzogQWRkIHRhcmdldCBhbmQgbmF0aXZlIHJlY2lwZXMKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uM18zLjExLjIuYmIg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xMS4zLmJiCnNpbWlsYXJp
dHkgaW5kZXggOTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uM18zLjExLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uM18zLjExLjMuYmIKaW5kZXggNDIxYTMwNWUyMi4uYzc5NzQ4NDliNiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zXzMuMTEuMi5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjNfMy4xMS4zLmJiCkBAIC0zOSw3ICszOSw3
IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZSA9ICIgXAogICAgICAgICAgICBmaWxlOi8v
MTItZGlzdHV0aWxzLXByZWZpeC1pcy1pbnNpZGUtc3RhZ2luZy1hcmVhLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovLzAwMDEtRG9uLXQtc2VhcmNoLXN5c3RlbS1mb3ItaGVhZGVycy1saWJyYXJp
ZXMucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjllNGI4ZjVm
MTY1ODU0MmE4YzEzZTJkZDI3NzM1OGM5YzQ4ZjJiMmY3MzE4NjUyZWYxNjc1ZTQwMmI5ZDJhZiIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4YTVkYjk5Yzk2MWE3ZWNmMjdjNzU5NTYxODljOTYwMmM5
Njg3NTFmMTFkYmVhZTJiOTAwZGJmZjFjMDg1YjVlIgogCiAjIGV4Y2x1ZGUgcHJlLXJlbGVhc2Vz
IGZvciBib3RoIHB5dGhvbiAyLnggYW5kIDMueAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiW1Bw
XXl0aG9uLSg/UDxwdmVyPlxkKyhcLlxkKykrKS50YXIiCi0tIAoyLjM5LjIKCg==

--===============5994256931628935703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3/python3-2to3: FILELIST: removed "/usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle", added "/usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle"
Changes to packages/core2-32-poky-linux/python3 (sysroot):
  /usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle
  /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.11/lib2to3/Grammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/Grammar3.11.3.final.0.pickle
  /usr/lib/python3.11/lib2to3/PatternGrammar3.11.2.final.0.pickle moved to /usr/lib/python3.11/lib2to3/PatternGrammar3.11.3.final.0.pickle

--===============5994256931628935703==--

