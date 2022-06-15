Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52021C04E85
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.4420.1655298221479653195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nNe8zdxa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 010101816776621f-b4421b08-c416-4094-9414-26a4af4ab726-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mRGZAkTkxIGyHmHPJU0x+bTYh1IP7A+xb+APKCHnsH8=;
	b=nNe8zdxaLZngdWhd3Kp3Jiy2ye7AQX44FuymKopJH+7G8O4Iv1nygH1Unj/dmF0I
	tIG/yM7oUDp6GyT6ZaYoOlYrQucLg0116rnO8czn2noJ2rUXhiVzn1B5q5brj/lDpQU
	Ac8JKhguSNhLJEpz9w8SaeiItsFGnd+N9XkajPGo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298220;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mRGZAkTkxIGyHmHPJU0x+bTYh1IP7A+xb+APKCHnsH8=;
	b=AJODlZnaHJ3gigFqG9lGm9WJ/bj/QElXMYzAeL7jzG/y6ORe1M+0GVfvRjN0ggyZ
	2NwLN3L+krCSmk7q+Hv0tYoXlFNS2yEaZK2IMV5JiQmQNmhy1jSfYC+DInk4VrbPh06
	hJsMntcdC9GOdF11vepL1GxU1/KLuGIWqN2/1iE4=
Content-Type: multipart/mixed; boundary="===============5261558160681383206=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3: upgrading to 3.10.5 SUCCEEDED
Message-ID: 
 <010101816776621f-b4421b08-c416-4094-9414-26a4af4ab726-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166948

--===============5261558160681383206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3* to *3.10.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-upgrade-3.10.4-3.10.5.patch
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
--===============5261558160681383206==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-upgrade-3.10.4-3.10.5.patch"

From 4a6d0e4559a8233b1e96553ae3c27f98d1dea695 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 09:22:01 +0000
Subject: [PATCH] python3: upgrade 3.10.4 -> 3.10.5

---
 .../0001-Don-t-search-system-for-headers-libraries.patch    | 6 +++---
 ...b-sysconfig.py-use-prefix-value-from-build-configu.patch | 2 +-
 ...stutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch | 2 +-
 .../12-distutils-prefix-is-inside-staging-area.patch        | 2 +-
 .../python/{python3_3.10.4.bb => python3_3.10.5.bb}         | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.10.4.bb => python3_3.10.5.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
index 5485020eb4..27ce278b70 100644
--- a/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
+++ b/meta/recipes-devtools/python/python3/0001-Don-t-search-system-for-headers-libraries.patch
@@ -1,4 +1,4 @@
-From b6ead2d17ceafed47e598b6f50f3ff669deec5ab Mon Sep 17 00:00:00 2001
+From d3ef85813041c37810ef514ead1d710d07f2840b Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 4 Mar 2020 00:06:42 +0000
 Subject: [PATCH] Don't search system for headers/libraries
@@ -11,10 +11,10 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index c190002..5ef368d 100644
+index f7a3d39..9d2273d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -854,8 +854,8 @@ class PyBuildExt(build_ext):
+@@ -857,8 +857,8 @@ class PyBuildExt(build_ext):
              add_dir_to_list(self.compiler.include_dirs,
                              sysconfig.get_config_var("INCLUDEDIR"))
  
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index a9240b3c8a..e73575f39a 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 01d209277e145072e478d8b9acfea3638ee16cdc Mon Sep 17 00:00:00 2001
+From 544951eb4c9407139f48815e28f272d009fb76b1 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 10 Sep 2021 12:28:31 +0200
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 3c62c2acb8..2324a4d008 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 78dd1def953e18e7cda0325bb26d27c051bb6890 Mon Sep 17 00:00:00 2001
+From 76993d76d71f5dad89d50c5bfdf0978b40808897 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index de4c6c4e19..916c101ed3 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From 33b5a31df6050110f4481a24f5a0a0bf7fe80096 Mon Sep 17 00:00:00 2001
+From ca1092f70790908c06ff33339669e3bad059a091 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.4.bb
rename to meta/recipes-devtools/python/python3_3.10.5.bb
index 6bd3a6aba8..5933654e12 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.5.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19"
+SRC_URI[sha256sum] = "8437efd5b106ef0a75aabfbf23d880625120a73a86a22ade4d2e2e68d7b74486"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.31.1


--===============5261558160681383206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3: SRC_URI changed from "http://www.python.org/ftp/python/3.10.4/Python-3.10.4.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://cgi_py.patch file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch file://avoid_warning_about_tkinter.patch file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch file://python-config.patch file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch file://crosspythonpath.patch file://0001-Use-FLAG_REF-always-for-interned-strings.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch file://0001-Makefile-do-not-compile-.pyc-in-par
 allel.patch file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch file://makerace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch file://deterministic_imports.patch" to "http://www.python.org/ftp/python/3.10.5/Python-3.10.5.tar.xz file://run-ptest file://create_manifest3.py file://get_module_deps3.py file://python3-manifest.json file://check_build_completeness.py file://reformat_sysconfig.py file://cgi_py.patch file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch file://avoid_warning_about_tkinter.patch file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch file://python-config.patch file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-pr
 ofile.patch file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch file://crosspythonpath.patch file://0001-Use-FLAG_REF-always-for-interned-strings.patch file://0001-test_locale.py-correct-the-test-output-format.patch file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch file://makerace.patch file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch file://deterministic_imports.patch"
packages/core2-32-poky-linux/python3: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/libpython3-staticdev: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/libpython3-staticdev: PKGSIZE changed from 13618202 to 13629614 (+0%)
packages/core2-32-poky-linux/python3/libpython3-staticdev: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/libpython3: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/libpython3: PKGSIZE changed from 3733680 to 3733488 (-0%)
packages/core2-32-poky-linux/python3/libpython3: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-2to3: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-2to3: FILELIST: removed "/usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle", added "/usr/lib/python3.10/lib2to3/Grammar3.10.5.final.0.pickle /usr/lib/python3.10/lib2to3/PatternGrammar3.10.5.final.0.pickle"
packages/core2-32-poky-linux/python3/python3-2to3: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-asyncio: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-asyncio: PKGSIZE changed from 1014182 to 1016405 (+0%)
packages/core2-32-poky-linux/python3/python3-asyncio: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-audio: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-audio: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-codecs: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-codecs: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-compile: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-compile: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-compression: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-compression: PKGSIZE changed from 348802 to 348954 (+0%)
packages/core2-32-poky-linux/python3/python3-compression: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-core: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-core: PKGSIZE changed from 7550329 to 7556240 (+0%)
packages/core2-32-poky-linux/python3/python3-core: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-crypt: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-crypt: PKGSIZE changed from 296374 to 296118 (-0%)
packages/core2-32-poky-linux/python3/python3-crypt: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-ctypes: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-ctypes: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-curses: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-curses: PKGSIZE changed from 194182 to 193862 (-0%)
packages/core2-32-poky-linux/python3/python3-curses: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-datetime: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-datetime: PKGSIZE changed from 340712 to 340753 (+0%)
packages/core2-32-poky-linux/python3/python3-datetime: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-db: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-db: PKGSIZE changed from 48334 to 48270 (-0%)
packages/core2-32-poky-linux/python3/python3-db: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-dbg: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-dbg: PKGSIZE changed from 16221592 to 16240832 (+0%)
packages/core2-32-poky-linux/python3/python3-dbg: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-debugger: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-debugger: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-dev: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-dev: PKGSIZE changed from 705106 to 705676 (+0%)
packages/core2-32-poky-linux/python3/python3-dev: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-difflib: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-difflib: PKGSIZE changed from 142235 to 142237 (+0%)
packages/core2-32-poky-linux/python3/python3-difflib: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-distutils-windows: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-distutils-windows: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-distutils: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-distutils: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-doc: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-doc: PKGSIZE changed from 18366 to 18460 (+1%)
packages/core2-32-poky-linux/python3/python3-doc: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-doctest: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-doctest: PKGSIZE changed from 181033 to 181320 (+0%)
packages/core2-32-poky-linux/python3/python3-doctest: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-email: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-email: PKGSIZE changed from 769131 to 769185 (+0%)
packages/core2-32-poky-linux/python3/python3-email: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-fcntl: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-fcntl: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-gdbm: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-gdbm: PKGSIZE changed from 22636 to 22380 (-1%)
packages/core2-32-poky-linux/python3/python3-gdbm: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-html: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-html: PKGSIZE changed from 255986 to 256054 (+0%)
packages/core2-32-poky-linux/python3/python3-html: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-idle: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-idle: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-image: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-image: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-io: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-io: PKGSIZE changed from 852933 to 852870 (-0%)
packages/core2-32-poky-linux/python3/python3-io: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-json: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-json: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-locale: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-locale: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-logging: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-logging: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-mailbox: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-mailbox: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-man: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-man: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-math: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-math: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-mime: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-mime: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-misc: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-misc: PKGSIZE changed from 5283642 to 5283450 (-0%)
packages/core2-32-poky-linux/python3/python3-misc: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-mmap: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-mmap: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-modules: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-modules: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-multiprocessing: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-multiprocessing: PKGSIZE changed from 532645 to 532646 (+0%)
packages/core2-32-poky-linux/python3/python3-multiprocessing: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-netclient: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-netclient: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-netserver: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-netserver: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-numbers: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-numbers: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-pickle: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-pickle: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-pkgutil: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-pkgutil: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-plistlib: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-plistlib: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-pprint: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-pprint: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-profile: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-profile: PKGSIZE changed from 206891 to 206827 (-0%)
packages/core2-32-poky-linux/python3/python3-profile: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-ptest: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-ptest: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-pydoc: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-pydoc: PKGSIZE changed from 1413266 to 1413360 (+0%)
packages/core2-32-poky-linux/python3/python3-pydoc: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-resource: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-resource: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-shell: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-shell: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-smtpd: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-smtpd: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-sqlite3: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-sqlite3: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-src: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-src: PKGSIZE changed from 21003748 to 21018624 (+0%)
packages/core2-32-poky-linux/python3/python3-src: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-staticdev: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-staticdev: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-statistics: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-statistics: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-stringold: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-stringold: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-syslog: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-syslog: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-terminal: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-terminal: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-tests: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-tests: PKGSIZE changed from 39829356 to 39905175 (+0%)
packages/core2-32-poky-linux/python3/python3-tests: FILELIST: added "/usr/lib/python3.10/test/__pycache__/doctest_lineno.cpython-310.pyc /usr/lib/python3.10/test/doctest_lineno.py"
packages/core2-32-poky-linux/python3/python3-tests: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-threading: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-threading: PKGSIZE changed from 50325 to 54383 (+8%)
packages/core2-32-poky-linux/python3/python3-threading: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-tkinter: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-tkinter: PKGSIZE changed from 714969 to 714977 (+0%)
packages/core2-32-poky-linux/python3/python3-tkinter: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-unittest: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-unittest: PKGSIZE changed from 436987 to 437209 (+0%)
packages/core2-32-poky-linux/python3/python3-unittest: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-unixadmin: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-unixadmin: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-venv: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-venv: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-xml: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-xml: PKGSIZE changed from 844319 to 844111 (-0%)
packages/core2-32-poky-linux/python3/python3-xml: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3-xmlrpc: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3-xmlrpc: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
packages/core2-32-poky-linux/python3/python3: PV changed from "3.10.4" to "3.10.5"
packages/core2-32-poky-linux/python3/python3: PKGV changed from 3.10.4 [default] to 3.10.5 [default]
Changes to packages/core2-32-poky-linux/python3 (sysroot):
  /usr/lib/python3.10/socket.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle moved to /usr/lib/python3.10/lib2to3/Grammar3.10.5.final.0.pickle
  /usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle moved to /usr/lib/python3.10/lib2to3/PatternGrammar3.10.5.final.0.pickle
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.10/socket.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle moved to /usr/lib/python3.10/lib2to3/Grammar3.10.5.final.0.pickle
  /usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle moved to /usr/lib/python3.10/lib2to3/PatternGrammar3.10.5.final.0.pickle

--===============5261558160681383206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3/python3-2to3: FILELIST: removed "/usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle /usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle", added "/usr/lib/python3.10/lib2to3/Grammar3.10.5.final.0.pickle /usr/lib/python3.10/lib2to3/PatternGrammar3.10.5.final.0.pickle"
packages/core2-32-poky-linux/python3/python3-tests: FILELIST: added "/usr/lib/python3.10/test/doctest_lineno.py /usr/lib/python3.10/test/__pycache__/doctest_lineno.cpython-310.pyc"
Changes to packages/core2-32-poky-linux/python3 (sysroot):
  /usr/lib/python3.10/socket.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle moved to /usr/lib/python3.10/lib2to3/Grammar3.10.5.final.0.pickle
  /usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle moved to /usr/lib/python3.10/lib2to3/PatternGrammar3.10.5.final.0.pickle
Changes to packages/x86_64-linux/python3-native (sysroot):
  /usr/lib/python3.10/socket.py changed permissions from rwxr-xr-x to rw-r--r--
  /usr/lib/python3.10/lib2to3/Grammar3.10.4.final.0.pickle moved to /usr/lib/python3.10/lib2to3/Grammar3.10.5.final.0.pickle
  /usr/lib/python3.10/lib2to3/PatternGrammar3.10.4.final.0.pickle moved to /usr/lib/python3.10/lib2to3/PatternGrammar3.10.5.final.0.pickle

--===============5261558160681383206==--

