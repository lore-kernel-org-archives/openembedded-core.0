Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98703C19F2A
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 12:52:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24298.1659358357060772732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 05:52:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NhSs7i7X;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5212971c79=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 271ClIdk002045
	for <openembedded-core@lists.openembedded.org>;
 Mon, 1 Aug 2022 05:52:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=9kW4fV4+Wr4r/YEwtFoBWAVkzxbeMQeR0Mo1cdlh1zY=;
 b=NhSs7i7XhRQFj2jpDIiOckmV9yOG0piSsE8sn0jpZKDtEJg/Ykyf5PhMw7evryqbJj30
 66LQk7x6iACp5StnEMkLQgo1VVMHfwK029w0XxX3qjncRC6wk9cKq5xxLAjmcE8lS0Zj
 Hwn6zv/i46Jzcw5kr/jghoEZYqX5vIM0P0M1NlKRo56KtIH2xk1mh8AMSK6z3ACCVXhI
 Ih+Xx/m1qXSywg8noaQIjk3I3sPsLHCxlf3ju2xAjGs/pbOAS5esJOp7e4Z/xi2FaKX6
 gCr/3/6DOf2hZzBqc5VCfpTsY1h8dyM+EEJ8WEeRtPk6b3l3XWURim+2s6NW3DFr2MM/ UQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hmyx49cnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 05:52:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Aug 2022 05:52:35 -0700
Received: from vme.wrs.com (172.25.44.4) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Mon, 1 Aug 2022 05:52:35 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] vim: update from 9.0.0063 to 9.0.0115
Date: Mon, 1 Aug 2022 08:52:34 -0400
Message-ID: <20220801125234.1328890-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QtlcmvvI9kS8WFyao7uo2P2z1LA3M1ok
X-Proofpoint-ORIG-GUID: QtlcmvvI9kS8WFyao7uo2P2z1LA3M1ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_07,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 12:52:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168747

Drop crosscompile.patch which was merged as part of:
   509695c1c (tag: v9.0.0065) patch 9.0.0065: \
      cross-compiling doesn't work because of timer_create check

Also drop: racefix.patch which may have been fixed upstream
and is being tracked by:
   https://github.com/vim/vim/pull/10776
where upstream is asking if the different approach resolves the
race condition. Let's see what's out there!

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../vim/files/crosscompile.patch              | 51 -------------------
 meta/recipes-support/vim/files/racefix.patch  | 37 --------------
 meta/recipes-support/vim/vim.inc              |  6 +--
 3 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/crosscompile.patch
 delete mode 100644 meta/recipes-support/vim/files/racefix.patch

diff --git a/meta/recipes-support/vim/files/crosscompile.patch b/meta/recipes-support/vim/files/crosscompile.patch
deleted file mode 100644
index 583d3fc7b0..0000000000
--- a/meta/recipes-support/vim/files/crosscompile.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-configure.ac: Fix create_timer solaris test for cross compiling
-
-A runtime test was added for create_timer however this meant cross compiling
-would no longer work. Allow a cache value to be specified to allow cross
-compiling again.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-
-Upstream-Status: Submitted [https://github.com/vim/vim/pull/10777]
-
-Index: git/src/configure.ac
-===================================================================
---- git.orig/src/configure.ac
-+++ git/src/configure.ac
-@@ -3814,7 +3814,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
- dnl Check for timer_create. It probably requires the 'rt' library.
- dnl Run the program to find out if timer_create(CLOCK_MONOTONIC) actually
- dnl works, on Solaris timer_create() exists but fails at runtime.
--AC_MSG_CHECKING([for timer_create])
-+AC_CACHE_CHECK([for timer_create], [vim_cv_timer_create],
- save_LIBS="$LIBS"
- LIBS="$LIBS -lrt"
- AC_RUN_IFELSE([AC_LANG_PROGRAM([
-@@ -3831,7 +3831,7 @@ static void set_flag(union sigval sv) {}
-   if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
-     exit(1);  // cannot create a monotonic timer
-   ])],
--  AC_MSG_RESULT(yes; with -lrt); AC_DEFINE(HAVE_TIMER_CREATE),
-+  AC_MSG_NOTICE(timer_create with -lrt); vim_cv_timer_create=yes,
-   LIBS="$save_LIBS"
-   AC_RUN_IFELSE([AC_LANG_PROGRAM([
- #include<signal.h>
-@@ -3847,8 +3847,16 @@ static void set_flag(union sigval sv) {}
-     if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
-       exit(1);  // cannot create a monotonic timer
-     ])],
--    AC_MSG_RESULT(yes); AC_DEFINE(HAVE_TIMER_CREATE),
--    AC_MSG_RESULT(no)))
-+    vim_cv_timer_create=yes,
-+    vim_cv_timer_create=no),
-+    AC_MSG_ERROR(cross-compiling: please set 'vim_cv_timer_create')
-+    )
-+)
-+
-+if test "x$vim_cv_timer_create" = "xyes" ; then
-+  AC_DEFINE(HAVE_TIMER_CREATE)
-+fi
-+
- 
- AC_CACHE_CHECK([whether stat() ignores a trailing slash], [vim_cv_stat_ignores_slash],
-   [
diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
deleted file mode 100644
index 34bd37d650..0000000000
--- a/meta/recipes-support/vim/files/racefix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-po/Makefile: Avoid race over LINGUAS file
-
-The creation of the LINGUAS file is duplicated for each desktop file
-which can lead the commands to race against each other. One target might
-remove it before another has been able to use it. Rework the makefile to
-avoid this as the expense of leaving the file on disk.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-
-Upstream-Status: Submitted [https://github.com/vim/vim/pull/10776]
-
-Index: git/src/po/Makefile
-===================================================================
---- git.orig/src/po/Makefile
-+++ git/src/po/Makefile
-@@ -207,17 +207,16 @@ $(PACKAGE).pot: $(PO_INPUTLIST) $(PO_VIM
- 	# Delete the temporary files
- 	rm *.js
- 
--vim.desktop: vim.desktop.in $(POFILES)
-+LINGUAS:
- 	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
-+
-+vim.desktop: vim.desktop.in $(POFILES) LINGUAS
- 	$(MSGFMT) --desktop -d . --template vim.desktop.in -o tmp_vim.desktop
--	rm -f LINGUAS
- 	if command -v desktop-file-validate; then desktop-file-validate tmp_vim.desktop; fi
- 	mv tmp_vim.desktop vim.desktop
- 
--gvim.desktop: gvim.desktop.in $(POFILES)
--	echo $(LANGUAGES) | tr " " "\n" |sed -e '/\./d' | sort > LINGUAS
-+gvim.desktop: gvim.desktop.in $(POFILES) LINGUAS
- 	$(MSGFMT) --desktop -d . --template gvim.desktop.in -o tmp_gvim.desktop
--	rm -f LINGUAS
- 	if command -v desktop-file-validate; then desktop-file-validate tmp_gvim.desktop; fi
- 	mv tmp_gvim.desktop gvim.desktop
- 
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 31229534e4..48896465ed 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,12 +18,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
-           file://racefix.patch \
-           file://crosscompile.patch \
            "
 
-PV .= ".0063"
-SRCREV = "d61efa50f8f5b9d9dcbc136705cc33874f0fdcb3"
+PV .= ".0115"
+SRCREV = "6747cf1671bd41cddee77c65b3f9a70509f968db"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.32.0


