Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD74D6D24D
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 23:36:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.84392.1732750565675221210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 15:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1061310084=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ARNVK0W014252
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 15:36:05 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43671c8cyk-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 15:36:05 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 27 Nov 2024 15:36:01 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 27 Nov 2024 15:36:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] gpgme: upgrade 1.23.2 -> 1.24.0
Date: Wed, 27 Nov 2024 15:35:59 -0800
Message-ID: <20241127233600.4124020-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127233600.4124020-1-hongxu.jia@windriver.com>
References: <20241127233600.4124020-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: W9CJ8lGqPyk45L6L7sVsJ7dIsypDyb9b
X-Proofpoint-ORIG-GUID: W9CJ8lGqPyk45L6L7sVsJ7dIsypDyb9b
X-Authority-Analysis: v=2.4 cv=QYicvtbv c=1 sm=1 tr=0 ts=6747ace5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=omOdbC7AAAAA:8 a=QyXUC8HyAAAA:8
 a=yZOkjnsv2i9aY3vixXIA:9 a=0F8nxsaTWsPSERmV:21 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-27_10,2024-11-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2411270185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 23:36:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207970

Reabse patches:
- 0001-pkgconfig.patch
- 0001-autogen.sh-remove-unknown-in-version.patch

Drop backport patch:
- 0004-python-import.patch

Drop obsolete patch:
- 0008-do-not-auto-check-var-PYTHON.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...autogen.sh-remove-unknown-in-version.patch | 17 ++++---
 .../gpgme/gpgme/0001-pkgconfig.patch          | 51 ++++++++++---------
 .../gpgme/gpgme/0004-python-import.patch      | 34 -------------
 .../0008-do-not-auto-check-var-PYTHON.patch   | 35 -------------
 .../{gpgme_1.23.2.bb => gpgme_1.24.0.bb}      |  4 +-
 5 files changed, 39 insertions(+), 102 deletions(-)
 delete mode 100644 meta/recipes-support/gpgme/gpgme/0004-python-import.patch
 delete mode 100644 meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
 rename meta/recipes-support/gpgme/{gpgme_1.23.2.bb => gpgme_1.24.0.bb} (94%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
index 6d67e6d6c9..920df3d4c3 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-autogen.sh-remove-unknown-in-version.patch
@@ -1,6 +1,6 @@
-From acc4750ffa79a5c2ef3c95cf31ef51352a68837b Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 28 Feb 2023 13:43:51 +0800
+From 0d76b00111a112032eb8522791b70664100d4e0a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 26 Nov 2024 23:23:42 -0800
 Subject: [PATCH] autogen.sh: remove '-unknown' in version
 
 python setuptools >=66.0.0 treats '-unknown' as an invalid version.
@@ -13,20 +13,25 @@ Upstream-Status: Submitted [https://lists.gnupg.org/pipermail/gnupg-devel/2023-F
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 
+Rebase to 1.24.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  autogen.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 4e1665b..a55326d 100755
+index 9f912972..9f7559b4 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -269,7 +269,7 @@ if [ "$myhost" = "find-version" ]; then
+@@ -271,7 +271,7 @@ if [ "$myhost" = "find-version" ]; then
      else
        ingit=no
        beta=yes
 -      tmp="-unknown"
 +      tmp=""
+       cid="0000000"
        rev="0000000"
        rvd="0"
-     fi
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 831771ca2d..2fddf4c553 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,6 +1,6 @@
-From 7b3a00cb0fc27c896dd85c9afc474bd9c2aea30d Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 10 May 2019 14:23:55 +0800
+From e4e75bee348d297bd8288e6fd7e99ab033cbb90c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 26 Nov 2024 23:04:52 -0800
 Subject: [PATCH] pkgconfig
 
 Update gpgme to use pkgconfig instead of -config files since its
@@ -15,30 +15,31 @@ Rebase to 1.13.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Rebase to 1.17.0
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
-
+Rebase to 1.24.0
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  configure.ac            |   1 +
  src/Makefile.am         |   4 +-
  src/gpgme-pthread.pc.in |  15 +++++
- src/gpgme.m4            | 119 +++-------------------------------------
+ src/gpgme.m4            | 118 +++-------------------------------------
  src/gpgme.pc.in         |   4 +-
- 5 files changed, 29 insertions(+), 114 deletions(-)
+ 5 files changed, 28 insertions(+), 114 deletions(-)
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index ae4c7da..df892c9 100644
+index 933fb150..08589a6b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1112,6 +1112,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -1160,6 +1160,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
 +AC_CONFIG_FILES(src/gpgme-pthread.pc)
  AC_CONFIG_FILES(lang/cpp/Makefile lang/cpp/src/Makefile)
  AC_CONFIG_FILES(lang/cpp/tests/Makefile)
- AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
+ AC_CONFIG_FILES(lang/cpp/src/gpgmepp.pc)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index ca70950..bda5498 100644
+index 03708620..e716ce4d 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
@@ -57,7 +58,7 @@ index ca70950..bda5498 100644
  noinst_SCRIPTS = gpgme-config
 diff --git a/src/gpgme-pthread.pc.in b/src/gpgme-pthread.pc.in
 new file mode 100644
-index 0000000..074bbf6
+index 00000000..074bbf6e
 --- /dev/null
 +++ b/src/gpgme-pthread.pc.in
 @@ -0,0 +1,15 @@
@@ -77,19 +78,18 @@ index 0000000..074bbf6
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 8cc2898..0ff550e 100644
+index 5f689e18..249e8c98 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
-@@ -168,7 +168,7 @@ dnl config script does not match the host specification the script
- dnl is added to the gpg_config_script_warn variable.
+@@ -166,7 +166,6 @@ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPGME],
--[ AC_REQUIRE([_AM_PATH_GPGME_CONFIG])dnl
-+[
+ [ AC_REQUIRE([AC_CANONICAL_HOST])dnl
+-  AC_REQUIRE([_AM_PATH_GPGME_CONFIG])dnl
    tmp=ifelse([$1], ,1:0.4.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -178,36 +178,12 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -176,36 +175,12 @@ AC_DEFUN([AM_PATH_GPGME],
       min_gpgme_version="$tmp"
    fi
  
@@ -128,7 +128,7 @@ index 8cc2898..0ff550e 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -216,19 +192,11 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -214,19 +189,11 @@ AC_DEFUN([AM_PATH_GPGME],
       fi
    fi
    if test $ok = yes; then
@@ -148,7 +148,7 @@ index 8cc2898..0ff550e 100644
  ])
  
  dnl AM_PATH_GPGME_PTHREAD([MINIMUM-VERSION,
-@@ -236,9 +204,8 @@ dnl                       [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
+@@ -234,9 +201,8 @@ dnl                       [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND ]]])
  dnl Test for libgpgme and define GPGME_PTHREAD_CFLAGS
  dnl  and GPGME_PTHREAD_LIBS.
  dnl
@@ -160,7 +160,7 @@ index 8cc2898..0ff550e 100644
    tmp=ifelse([$1], ,1:0.4.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -248,40 +215,12 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],[
+@@ -246,40 +212,12 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],[
       min_gpgme_version="$tmp"
    fi
  
@@ -203,7 +203,7 @@ index 8cc2898..0ff550e 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -290,19 +229,11 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],[
+@@ -288,19 +226,11 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],[
       fi
    fi
    if test $ok = yes; then
@@ -223,7 +223,7 @@ index 8cc2898..0ff550e 100644
  ])
  
  
-@@ -321,36 +252,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -319,36 +249,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       min_gpgme_version="$tmp"
    fi
  
@@ -262,7 +262,7 @@ index 8cc2898..0ff550e 100644
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -359,17 +266,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -357,17 +263,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       fi
    fi
    if test $ok = yes; then
@@ -281,7 +281,7 @@ index 8cc2898..0ff550e 100644
 -  AC_SUBST(GPGME_GLIB_LIBS)
  ])
 diff --git a/src/gpgme.pc.in b/src/gpgme.pc.in
-index 9ddef5c..932645b 100644
+index 9ddef5cd..932645be 100644
 --- a/src/gpgme.pc.in
 +++ b/src/gpgme.pc.in
 @@ -9,6 +9,6 @@ Name: gpgme
@@ -293,3 +293,6 @@ index 9ddef5c..932645b 100644
 +Cflags: -I${includedir}
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
deleted file mode 100644
index fa0eccfce3..0000000000
--- a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From f51bf1114bee6d56a950dcc6ebb46d6138b3faed Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 16 Aug 2017 02:06:45 -0400
-Subject: [PATCH 4/7] python import
-
-Don't check for output on stderr to know if an import worked, host inputrc and
-sysroot readline can cause warnings on stderr.
-
-Upstream-Status: Backport (from autoconf-archive 883a2abd)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Rebase to 1.9.0
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- m4/ax_python_devel.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/ax_python_devel.m4 b/m4/ax_python_devel.m4
-index b990d5b..318b089 100644
---- a/m4/ax_python_devel.m4
-+++ b/m4/ax_python_devel.m4
-@@ -137,7 +137,7 @@ variable to configure. See ``configure --help'' for reference.
- 	#
- 	AC_MSG_CHECKING([for the distutils Python package])
- 	ac_distutils_result=`$PYTHON -c "import distutils" 2>&1`
--	if test -z "$ac_distutils_result"; then
-+	if test $? -eq 0; then
- 		AC_MSG_RESULT([yes])
- 	else
- 		AC_MSG_RESULT([no])
--- 
-2.7.4
-
diff --git a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
deleted file mode 100644
index a11621ed64..0000000000
--- a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 84c389705e7742d2b68e144a5733e618441d293e Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 10 May 2019 16:19:54 +0800
-Subject: [PATCH] do not auto check var-PYTHON
-
-Upstream auto check the version of python rather than specify option
-[ff6ff61 python: Auto-check for all installed python versions.]
-
-In oe-core, don't check var-PYTHON, use the setting from recipe,
-only check specific python 2.7 and 3.7
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- configure.ac | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index df892c9..8c6194e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -590,9 +590,8 @@ if test "$found_py" = "1"; then
- 	if test "$found_py" = "1" -o "$found_py3" = "1"; then
- 	  # Reset everything, so that we can look for another Python.
-           m4_foreach([mym4pythonver],
--                     [[2.7],[3.4],[3.5],[3.6],[3.7],[3.8],[3.9],[3.10],
--                      [3.11],[3.12],[all]],
--           [unset PYTHON
-+                     [[2.7],[3.7]],
-+           [
- 	    unset PYTHON_VERSION
- 	    unset PYTHON_CPPFLAGS
- 	    unset PYTHON_LDFLAGS
diff --git a/meta/recipes-support/gpgme/gpgme_1.23.2.bb b/meta/recipes-support/gpgme/gpgme_1.24.0.bb
similarity index 94%
rename from meta/recipes-support/gpgme/gpgme_1.23.2.bb
rename to meta/recipes-support/gpgme/gpgme_1.24.0.bb
index 55f164e4a9..d717c0cbb7 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.24.0.bb
@@ -22,16 +22,14 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0001-pkgconfig.patch \
            file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch \
            file://0003-Correctly-install-python-modules.patch \
-           file://0004-python-import.patch \
            file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
            file://0006-fix-build-path-issue.patch \
-           file://0008-do-not-auto-check-var-PYTHON.patch \
            file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
            file://0001-posix-io.c-Use-off_t-instead-of-off64_t.patch \
            file://0001-autogen.sh-remove-unknown-in-version.patch \
            "
 
-SRC_URI[sha256sum] = "9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224"
+SRC_URI[sha256sum] = "61e3a6ad89323fecfaff176bc1728fb8c3312f2faa83424d9d5077ba20f5f7da"
 
 PYTHON_DEPS = "${@bb.utils.contains('LANGUAGES', 'python', 'swig-native', '', d)}"
 
-- 
2.25.1


