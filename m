Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8D3C87FC9
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 08:21:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.35604.1753086082496869654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 01:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9297613b94=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L5Rdur1107151
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:21:22 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0sh74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 01:21:22 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 21 Jul 2025 01:21:09 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 21 Jul 2025 01:21:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/4] gpgme: upgrade 1.24.3 -> 2.0.0
Date: Mon, 21 Jul 2025 16:21:00 +0800
Message-ID: <20250721082103.2262095-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX5XD1VDYAOu9u
 L80pcxXxm0CKzYT0POZGrSBbR3frQQgdQF6QSImu3XMk//Uw73kQL3Y2UIllx3H6aLy/KTBCUoA
 B8y5zLYL0Ju2ay3hWyfmIspkdXiyR9OHMahll3InO//72rAEynw2ytNmZJ72QN2QMlJbUP4MlIg
 Dc74LvY7aEtCFyI5Hqj8nUzrZif6CC2ChwHBmDnvHxUxPWz3/FKB/auwLf30FwFJ+XOfFopbXk6
 pEaHlqzR49c51vA6uGiAiS3JT3Su7e2H+dwJAQRQzqZViVjKHOH8/CbB6Jg4YApiTJSqCAZv2Up
 vfQuEN3CEaiN80GfPxby6f24dJqnFkpHjtjUsY1LlGrjORyncCa9r3VUcmx55e2G1r5gpUQRslN
 3Sm+FVqM
X-Proofpoint-ORIG-GUID: NyGWh5Dqm0N64y0fUFAGIholfRrvQ_HM
X-Proofpoint-GUID: NyGWh5Dqm0N64y0fUFAGIholfRrvQ_HM
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687df882 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=GwUem0DFAAAA:8 a=vKivue9HAAAA:8 a=t7CeM3EgAAAA:8
 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=hsIBKhB-wN-B9OOGZs8A:9 a=4f0m0rT7cLEA:10
 a=r0dl5i_q2XGqDZkti5dn:22 a=czFSAQ7kI4cueanBugmn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 08:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220664

Refresh 0001-pkgconfig.patch

Due to upstream [python: Remove Python bindings][1], remove
following patches
- 0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
- 0003-Correctly-install-python-modules.patch
- 0006-fix-build-path-issue.patch

Due to upstream [cpp,qt: Remove C++ and Qt bindings][2],
remove cpp and qt bindings

License-Update: copyright years updated, remove blank line

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=932caf37d36eca2caec59bf48bc505364a5765bb
[2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=763d5f5d6a88ec938b8678ab597e1404af724553

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../gpgme/gpgme/0001-pkgconfig.patch          | 23 +++++++-----
 ...n-gpg-error-config-should-not-be-use.patch | 35 -------------------
 ...003-Correctly-install-python-modules.patch | 30 ----------------
 .../gpgme/0006-fix-build-path-issue.patch     | 34 ------------------
 .../gpgme/{gpgme_1.24.3.bb => gpgme_2.0.0.bb} | 35 ++++---------------
 5 files changed, 21 insertions(+), 136 deletions(-)
 delete mode 100644 meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
 delete mode 100644 meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
 delete mode 100644 meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
 rename meta/recipes-support/gpgme/{gpgme_1.24.3.bb => gpgme_2.0.0.bb} (61%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 9d0b4b282b7..67b65157d1b 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,6 +1,6 @@
-From 447fd26a43f40ccb071cd19198ee43fdfce87e3a Mon Sep 17 00:00:00 2001
+From 4b4e6fc898dd249387bbed4924fa22c1c494327a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 26 Nov 2024 23:04:52 -0800
+Date: Mon, 21 Jul 2025 12:43:29 +0800
 Subject: [PATCH] pkgconfig
 
 Update gpgme to use pkgconfig instead of -config files since its
@@ -17,6 +17,8 @@ Rebase to 1.17.0
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 Rebase to 1.24.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Rebase to 2.0.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac            |   1 +
  src/Makefile.am         |   4 +-
@@ -27,19 +29,19 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index c34f700..4eddc3d 100644
+index d4dcb1c..293fcc2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1176,6 +1176,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -844,6 +844,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+                 src/gpgme.pc
                  src/gpgme-glib.pc
                  src/gpgme.h)
- AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
 +AC_CONFIG_FILES(src/gpgme-pthread.pc)
- AC_CONFIG_FILES(lang/cpp/Makefile lang/cpp/src/Makefile)
- AC_CONFIG_FILES(lang/cpp/tests/Makefile)
- AC_CONFIG_FILES(lang/cpp/src/gpgmepp.pc)
+ AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
+ AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpgme.asd])
+ AC_CONFIG_FILES([lang/js/Makefile lang/js/src/Makefile
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 0370862..e716ce4 100644
+index edc239b..d427044 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
@@ -293,3 +295,6 @@ index 9ddef5c..932645b 100644
 +Cflags: -I${includedir}
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
deleted file mode 100644
index 3a1837e857e..00000000000
--- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 145adf290571b7dd47b7fca57b11349af0b94e74 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 10 May 2019 14:30:36 +0800
-Subject: [PATCH] gpgme/lang/python: gpg-error-config should not be used
-
-gpg-error-config was modified by OE to always return an error.
-So we want to find an alternative way to retrieve whatever it
-is we need.
-
-Upstream-Status: Inappropriate [changes are specific to OE]
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Rebase to 1.13.0
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- lang/python/setup.py.in | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
-index 1ddfbe7..d2fa4f0 100755
---- a/lang/python/setup.py.in
-+++ b/lang/python/setup.py.in
-@@ -173,9 +173,8 @@ class BuildExtFirstHack(build):
- 
-     def _generate_errors_i(self):
- 
--        ge_cflags='@GPG_ERROR_CFLAGS@'
-         gpg_error_content = self._read_header(
--            'gpg-error.h', ge_cflags.split(' ') if ge_cflags else [])
-+            "gpg-error.h", os.environ.get('CFLAGS').split())
- 
-         filter_re = re.compile(r'GPG_ERR_[^ ]* =')
-         rewrite_re = re.compile(r' *(.*) = .*')
diff --git a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
deleted file mode 100644
index 7b2831ba4f9..00000000000
--- a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d8e884d1fa8c35ce68e94a0668548580cf5ba2d3 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 30 Jan 2018 15:28:49 +0800
-Subject: [PATCH] Correctly install python modules
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
-Rebase to 1.9.0
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Rebase to 1.10.0
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- lang/python/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 1aa330f..d1d5c63 100644
---- a/lang/python/Makefile.am
-+++ b/lang/python/Makefile.am
-@@ -97,6 +97,7 @@ install-exec-local:
- 	  --build-base="$$(basename "$${PYTHON}")-gpg" \
- 	  install \
- 	  --prefix "$(DESTDIR)$(prefix)" \
-+	  --install-lib=$(DESTDIR)${pythondir} \
- 	  --verbose ; \
- 	done
- 
diff --git a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
deleted file mode 100644
index d64168b4fdb..00000000000
--- a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f9f82874048c5eec08e815ff871462184b6d7d6a Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 31 Jan 2018 11:01:09 +0800
-Subject: [PATCH] fix build path issue
-
-Get the "--root" directory supplied to the "install" command,
-and use it as a prefix to strip off the purported filename
-encoded in bytecode files.
-
-Since --root added, we need to tweak --prefix and --install-lib
-to use relative path.
-
-Upstream-Status: Submitted [gnupg-devel@gnupg.org]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- lang/python/Makefile.am | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index d1d5c63..148e1b9 100644
---- a/lang/python/Makefile.am
-+++ b/lang/python/Makefile.am
-@@ -96,8 +96,9 @@ install-exec-local:
- 	  build \
- 	  --build-base="$$(basename "$${PYTHON}")-gpg" \
- 	  install \
--	  --prefix "$(DESTDIR)$(prefix)" \
--	  --install-lib=$(DESTDIR)${pythondir} \
-+	  --root=${DESTDIR} \
-+	  --prefix "$(prefix)" \
-+	  --install-lib=${pythondir} \
- 	  --verbose ; \
- 	done
- 
diff --git a/meta/recipes-support/gpgme/gpgme_1.24.3.bb b/meta/recipes-support/gpgme/gpgme_2.0.0.bb
similarity index 61%
rename from meta/recipes-support/gpgme/gpgme_1.24.3.bb
rename to meta/recipes-support/gpgme/gpgme_2.0.0.bb
index 64e3c6635a1..c6887a0ebdc 100644
--- a/meta/recipes-support/gpgme/gpgme_1.24.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_2.0.0.bb
@@ -5,14 +5,12 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
 LICENSE:${PN} = "GPL-2.0-or-later & LGPL-2.1-or-later"
-LICENSE:${PN}-cpp = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LICENSE:${PN}-tool = "GPL-3.0-or-later"
-LICENSE:python3-gpg = "GPL-2.0-or-later & LGPL-2.1-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=2f0bf06d1c7dcb28532a9d0f94a7ca1d \
-                    file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d \
+                    file://src/gpgme.h.in;endline=23;md5=c0d051fa63f5a5514f4ab190d7ca495e \
+                    file://src/engine.h;endline=21;md5=f58f7a0b6488edae41b925ac9c890068 \
                     file://src/gpgme-tool.c;endline=21;md5=66c5381e0e05475792e24982d15e7ce8 \
                     "
 
@@ -20,40 +18,25 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch \
            file://0001-pkgconfig.patch \
-           file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch \
-           file://0003-Correctly-install-python-modules.patch \
            file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
-           file://0006-fix-build-path-issue.patch \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "bfc17f5bd1b178c8649fdd918956d277080f33df006a2dc40acdecdce68c50dd"
+SRC_URI[sha256sum] = "ddf161d3c41ff6a3fcbaf4be6c6e305ca4ef1cc3f1ecdfce0c8c2a167c0cc36d"
 
-PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
-
-DEPENDS = "libgpg-error libassuan ${PYTHON_DEPS}"
-RDEPENDS:${PN}-cpp += "libstdc++"
-
-RDEPENDS:python3-gpg += "python3-unixadmin"
+DEPENDS = "libgpg-error libassuan"
 
 RRECOMMENDS:${PN} += "${PN}-tool"
 
 BINCONFIG = "${bindir}/gpgme-config"
 
-# Default in configure.ac: "cl cpp python qt"
-# Supported: "cl cpp python python2 python3 qt"
-# python says 'search and find python2 or python3'
-
-# Building the C++ bindings for native requires a C++ compiler with C++11
-# support. Since these bindings are currently not needed, we can disable them.
+# Default in configure.ac: "cl"
+# Supported: "cl"
 DEFAULT_LANGUAGES = ""
-DEFAULT_LANGUAGES:class-target = "cpp"
 LANGUAGES ?= "${DEFAULT_LANGUAGES}"
 
-PYTHON_INHERIT = "${@bb.utils.contains('LANGUAGES', 'python', 'setuptools3-base', '', d)}"
-
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
                  --disable-gpg-test \
@@ -62,17 +45,14 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
 '
 
 inherit autotools texinfo binconfig-disabled pkgconfig multilib_header
-inherit_defer ${PYTHON_INHERIT} python3native
 
 export PKG_CONFIG = 'pkg-config'
 
 BBCLASSEXTEND = "native nativesdk"
 
-PACKAGES =+ "${PN}-cpp ${PN}-tool python3-gpg"
+PACKAGES =+ "${PN}-tool"
 
-FILES:${PN}-cpp = "${libdir}/libgpgmepp.so.*"
 FILES:${PN}-tool = "${bindir}/gpgme-tool"
-FILES:python3-gpg = "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-dev += "${datadir}/common-lisp/source/gpgme/*"
 
 CFLAGS:append:libc-musl = " -D__error_t_defined "
@@ -82,7 +62,6 @@ do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
 	rm -f ${S}/m4/gpg-error.m4
 	rm -f ${S}/m4/libassuan.m4
-	rm -f ${S}/m4/python.m4
 }
 
 do_install:append() {
-- 
2.34.1


