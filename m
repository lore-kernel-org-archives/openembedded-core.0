Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87BAC43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:17:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2482.1658805461027623013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rnIKv3hi;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4206bd8ec9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26Q38bBw013944
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:17:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=jmxMf5w0syMtFXSV6cmT6zhSJXZIyr9vhDMIZBPE3qg=;
 b=rnIKv3hipuiIx8vsgRAgsHB/ocqH2H3vnr/cQxdr/+fkJiVCyUhHX5Pw/vZsIztSb0Vn
 OsASHjzKtdNHkR1jF/a42YNj9aw3t9INUi3SBEfCIPv+zUzRofu6mKsUFaqK3uDGwmgB
 RTn5e6n6KCPyd54AAbHzV1bP7BYEvybQVPbTCId5o3tUekP4Kbo5T+XxCNmBxieMOhLH
 +hNK8hSkFcRO+Ue0qLx9ZaGTiEi2YH9QaL4B/ttwr4/CxyRU1HTgCcZAfqAVXvjZjQVA
 JVs7EeCt98TgnkJ0s5pdcjYD3iSE9MtqEQs5NMiog2GXTiiDazxnWPxyHFxaU5Cb6PUh Tw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgggk9ske-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:17:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Jul 2022 20:17:39 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 25 Jul 2022 20:17:38 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] vim: Upgrade 9.0.0021 -> 9.0.0063
Date: Tue, 26 Jul 2022 11:17:38 +0800
Message-ID: <20220726031738.1375688-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Lo78rPxqxaTtLKZmSHJGdA4JmPlKRw-V
X-Proofpoint-GUID: Lo78rPxqxaTtLKZmSHJGdA4JmPlKRw-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_13,2022-07-25_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207260012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 03:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168491

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in several CVE fixes.
Added a patch to avoid timer_create cross compile issue (and submitted upstream).
Also submit the race fix upstream.
We disable timer_create in the native case since some systems have it
and some don't so this makes us consistent.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0c1de084c7ce030d47a428e4bbfbc4ce2996057)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../vim/files/crosscompile.patch              | 51 +++++++++++++++++++
 meta/recipes-support/vim/files/racefix.patch  | 12 +++--
 meta/recipes-support/vim/vim.inc              |  9 +++-
 3 files changed, 66 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/vim/files/crosscompile.patch

diff --git a/meta/recipes-support/vim/files/crosscompile.patch b/meta/recipes-support/vim/files/crosscompile.patch
new file mode 100644
index 0000000000..583d3fc7b0
--- /dev/null
+++ b/meta/recipes-support/vim/files/crosscompile.patch
@@ -0,0 +1,51 @@
+configure.ac: Fix create_timer solaris test for cross compiling
+
+A runtime test was added for create_timer however this meant cross compiling
+would no longer work. Allow a cache value to be specified to allow cross
+compiling again.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
+
+Upstream-Status: Submitted [https://github.com/vim/vim/pull/10777]
+
+Index: git/src/configure.ac
+===================================================================
+--- git.orig/src/configure.ac
++++ git/src/configure.ac
+@@ -3814,7 +3814,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
+ dnl Check for timer_create. It probably requires the 'rt' library.
+ dnl Run the program to find out if timer_create(CLOCK_MONOTONIC) actually
+ dnl works, on Solaris timer_create() exists but fails at runtime.
+-AC_MSG_CHECKING([for timer_create])
++AC_CACHE_CHECK([for timer_create], [vim_cv_timer_create],
+ save_LIBS="$LIBS"
+ LIBS="$LIBS -lrt"
+ AC_RUN_IFELSE([AC_LANG_PROGRAM([
+@@ -3831,7 +3831,7 @@ static void set_flag(union sigval sv) {}
+   if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
+     exit(1);  // cannot create a monotonic timer
+   ])],
+-  AC_MSG_RESULT(yes; with -lrt); AC_DEFINE(HAVE_TIMER_CREATE),
++  AC_MSG_NOTICE(timer_create with -lrt); vim_cv_timer_create=yes,
+   LIBS="$save_LIBS"
+   AC_RUN_IFELSE([AC_LANG_PROGRAM([
+ #include<signal.h>
+@@ -3847,8 +3847,16 @@ static void set_flag(union sigval sv) {}
+     if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
+       exit(1);  // cannot create a monotonic timer
+     ])],
+-    AC_MSG_RESULT(yes); AC_DEFINE(HAVE_TIMER_CREATE),
+-    AC_MSG_RESULT(no)))
++    vim_cv_timer_create=yes,
++    vim_cv_timer_create=no),
++    AC_MSG_ERROR(cross-compiling: please set 'vim_cv_timer_create')
++    )
++)
++
++if test "x$vim_cv_timer_create" = "xyes" ; then
++  AC_DEFINE(HAVE_TIMER_CREATE)
++fi
++
+ 
+ AC_CACHE_CHECK([whether stat() ignores a trailing slash], [vim_cv_stat_ignores_slash],
+   [
diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
index 1cb8fb442f..34bd37d650 100644
--- a/meta/recipes-support/vim/files/racefix.patch
+++ b/meta/recipes-support/vim/files/racefix.patch
@@ -1,9 +1,13 @@
+po/Makefile: Avoid race over LINGUAS file
+
 The creation of the LINGUAS file is duplicated for each desktop file
-which can lead the commands to race against each other. Rework
-the makefile to avoid this as the expense of leaving the file on disk.
+which can lead the commands to race against each other. One target might
+remove it before another has been able to use it. Rework the makefile to
+avoid this as the expense of leaving the file on disk.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
 
-Upstream-Status: Pending
-RP 2021/2/15
+Upstream-Status: Submitted [https://github.com/vim/vim/pull/10776]
 
 Index: git/src/po/Makefile
 ===================================================================
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 7e2c624bc1..31229534e4 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,10 +19,11 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
+           file://crosscompile.patch \
            "
 
-PV .= ".0021"
-SRCREV = "5e59ea54c0c37c2f84770f068d95280069828774"
+PV .= ".0063"
+SRCREV = "d61efa50f8f5b9d9dcbc136705cc33874f0fdcb3"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
@@ -95,6 +96,10 @@ EXTRA_OECONF = " \
     STRIP=/bin/true \
 "
 
+# Some host distros don't have it, disable consistently
+EXTRA_OECONF:append:class-native = " vim_cv_timer_create=no"
+EXTRA_OECONF:append:class-target = " vim_cv_timer_create=yes"
+
 do_install() {
     autotools_do_install
 
-- 
2.25.1


