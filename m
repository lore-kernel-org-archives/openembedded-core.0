Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E28F513F1
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 15:07:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10636.1772896063378258304
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Mar 2026 07:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ehNHSn1Y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752655555d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 627DYs1g2381383
	for <openembedded-core@lists.openembedded.org>; Sat, 7 Mar 2026 07:07:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=TgAKf2gdI4caWmMT2XI8FKxaQ7HQKKJxL0O8787YUDs=; b=ehNHSn1YJOq3
	3GMt04zqp2SIDUCydCEv0PIHMbkTw4QW4GN5TSk17kC4cZb7SyAfE2jGRC2lqI8a
	YlY5z9B/OKh4MS9kpeynazzLcTdxtLTnOcJ7GhOSBCrg2khdD4CYxfJNd3wFC5Vo
	dHw7wwUm1Tx6vnTDulEByBtfUt92gFZNfqaRu6nz8oOEAj3eMGyXbcoRV/mlF5bg
	xnv7FN9QSAd0h1VbyvH3BYPyup8e+5AXHPtd6gvFpRHAfyOxIml+M50QCllMJoFf
	fmMc2W6OcvTcZDt2CHnCXlr+TcU4prtfYCJiJNaeNT7nj2GsshOnvgUHneThyqWu
	mZ7VOC9OEg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crmdm02ar-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 07:07:42 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sat, 7 Mar 2026 07:07:42 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sat, 7 Mar 2026 07:07:42 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] gettext: 0.26 -> 1.0
Date: Sat, 7 Mar 2026 07:07:42 -0800
Message-ID: <191df553a920c1de37bf8ddadc492c6230a15398.1772895871.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1772895871.git.liezhi.yang@windriver.com>
References: <cover.1772895871.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tfnSeJYoB6fUZO_EdhU-rJIMenZaCVCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDE0MyBTYWx0ZWRfX6lwDQ/GfssSJ
 LQNBg9aYrhome47leCb43r4oVSv8glHIDKjjYl6ekvszHHc2z5aUjo28tbCrx74qBph1AXl9nAr
 bGncQl6uAzCqSXzGJAg8SsMhkYUqp5f4kQ4Ds/TthRpJwBI+g0Jsfv/lXhjD50WuMGvgUAudJ7+
 oaZbpvr0bI3VrY6XxtkCTXwxCmY+FZNpdVftHbNrdditAZxLAoZuxhRQ3XVuI7mQEfAiwSq1cMk
 9L7shOuM5wqcBT6kNFiwvki4JDwzfB9Wv96h0+rMnTpGguk+dnTfW+3QUD3gFd2YLaVUYAeDLlc
 yArTJ90jyUuUeYgZ+xjyu37G6G7LNTwqcnvGH757x+vfHfjTxG/dSgiv9ebIzH9Y3mGhG8D3fxx
 pU9fZmGv+4kDbkhUQCRTox90Gp7kmmVtzNCNbLnAnHwuOASe3tYu7Ip+j9e0dCjd78lSErJIAEG
 MR6c4ijs9XN3x0ybkcw==
X-Proofpoint-GUID: tfnSeJYoB6fUZO_EdhU-rJIMenZaCVCv
X-Authority-Analysis: v=2.4 cv=QppTHFyd c=1 sm=1 tr=0 ts=69ac3f3e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=j0J-eIwMWGaSe3hVMn4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Mar 2026 15:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232613

From: Robert Yang <liezhi.yang@windriver.com>

* Rebased use-pkgconfig.patch
* Modify the location of Makevars.template

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ..._0.26.bb => gettext-minimal-native_1.0.bb} |  3 +-
 meta/recipes-core/gettext/gettext-sources.inc |  2 +-
 .../gettext/gettext/use-pkgconfig.patch       | 86 +++++++++----------
 .../{gettext_0.26.bb => gettext_1.0.bb}       |  0
 4 files changed, 44 insertions(+), 47 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.26.bb => gettext-minimal-native_1.0.bb} (93%)
 rename meta/recipes-core/gettext/{gettext_0.26.bb => gettext_1.0.bb} (100%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
similarity index 93%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
index b5c32d0786..372aac472d 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
@@ -44,5 +44,6 @@ do_install () {
 	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
 	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/
 	# The gettext recipe also installs the same Makevars.template at the same place, rename it
-	cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
+	cp ${S}/gettext-tools/wizard/po-templates/traditional/Makevars.template \
+		${D}${datadir}/gettext/po/Makevars.template.minimal
 }
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 2ddf47334d..02ad72fc9f 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,3 +1,3 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz"
-SRC_URI[sha256sum] = "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecccfc7f56e58bb1d7f"
+SRC_URI[sha256sum] = "85d99b79c981a404874c02e0342176cf75c7698e2b51fe41031cf6526d974f1a"
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
index 2b9fef1e94..3bea1ea371 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -18,16 +18,17 @@ Added also selinux discovery.
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 
 ---
- gettext-tools/gnulib-m4/libxml.m4       | 105 ++---------------------
- libtextstyle/gnulib-local/m4/libglib.m4 | 106 +++---------------------
- libtextstyle/gnulib-m4/libglib.m4       | 106 +++---------------------
- 3 files changed, 31 insertions(+), 286 deletions(-)
+ gettext-tools/gnulib-m4/libxml.m4            |  105 ++++-----------------------------------------------------------------------------------
+ gettext-tools/gnulib-m4/selinux-selinux-h.m4 |   13 ----------
+ libtextstyle/gnulib-local/m4/libglib.m4      |  106 ++++++++++------------------------------------------------------------------------------
+ libtextstyle/gnulib-m4/libglib.m4            |  106 ++++++++++------------------------------------------------------------------------------
+ 4 files changed, 32 insertions(+), 298 deletions(-)
 
 diff --git a/gettext-tools/gnulib-m4/libxml.m4 b/gettext-tools/gnulib-m4/libxml.m4
-index c7160d7..8e46cc7 100644
+index 8c1dc78..4dd7f33 100644
 --- a/gettext-tools/gnulib-m4/libxml.m4
 +++ b/gettext-tools/gnulib-m4/libxml.m4
-@@ -14,6 +14,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
+@@ -15,6 +15,7 @@ dnl gl_LIBXML(FORCE-INCLUDED)
  dnl   forces the use of the included or an external libxml.
  AC_DEFUN([gl_LIBXML],
  [
@@ -35,7 +36,7 @@ index c7160d7..8e46cc7 100644
    AC_REQUIRE([AM_ICONV_LINK])
  
    ifelse([$1], , [
-@@ -31,106 +32,10 @@ AC_DEFUN([gl_LIBXML],
+@@ -32,106 +33,10 @@ AC_DEFUN([gl_LIBXML],
    INCXML=
    ifelse([$1], [yes], , [
      if test "$gl_cv_libxml_use_included" != yes; then
@@ -146,11 +147,40 @@ index c7160d7..8e46cc7 100644
      fi
    ])
    AC_SUBST([LIBXML])
+diff --git a/gettext-tools/gnulib-m4/selinux-selinux-h.m4 b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
+index c964ced..1641bd5 100644
+--- a/gettext-tools/gnulib-m4/selinux-selinux-h.m4
++++ b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
+@@ -71,6 +71,7 @@ AC_DEFUN([gl_LIBSELINUX],
+ [
+   AC_REQUIRE([AC_CANONICAL_HOST])
+   AC_REQUIRE([AC_CANONICAL_BUILD])
++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
+ 
+   AC_ARG_WITH([selinux],
+     AS_HELP_STRING([[--without-selinux]], [do not use SELinux, even on systems with SELinux]),
+@@ -87,16 +88,4 @@ AC_DEFUN([gl_LIBSELINUX],
+     LIBS=$gl_saved_LIBS
+   fi
+   AC_SUBST([LIB_SELINUX])
+-
+-  # Warn if SELinux is found but libselinux is absent;
+-  if test "$ac_cv_search_getfilecon_raw" = no; then
+-    if test "$host" = "$build" \
+-       && { test -d /sys/fs/selinux || test -d /selinux; }; then
+-      AC_MSG_WARN([This system supports SELinux but libselinux is missing.])
+-      AC_MSG_WARN([AC_PACKAGE_NAME will be compiled without SELinux support.])
+-    fi
+-    if test "$with_selinux" = maybe; then
+-      with_selinux=no
+-    fi
+-  fi
+ ])
 diff --git a/libtextstyle/gnulib-local/m4/libglib.m4 b/libtextstyle/gnulib-local/m4/libglib.m4
-index baa2cf4..b287c5b 100644
+index d9305cd..2501461 100644
 --- a/libtextstyle/gnulib-local/m4/libglib.m4
 +++ b/libtextstyle/gnulib-local/m4/libglib.m4
-@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this notice is preserved.
+@@ -8,106 +8,26 @@ dnl This file is offered as-is, without any warranty.
  
  dnl From Bruno Haible.
  
@@ -271,10 +301,10 @@ index baa2cf4..b287c5b 100644
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
 diff --git a/libtextstyle/gnulib-m4/libglib.m4 b/libtextstyle/gnulib-m4/libglib.m4
-index baa2cf4..b287c5b 100644
+index d9305cd..2501461 100644
 --- a/libtextstyle/gnulib-m4/libglib.m4
 +++ b/libtextstyle/gnulib-m4/libglib.m4
-@@ -7,106 +7,26 @@ dnl with or without modifications, as long as this notice is preserved.
+@@ -8,106 +8,26 @@ dnl This file is offered as-is, without any warranty.
  
  dnl From Bruno Haible.
  
@@ -394,37 +424,3 @@ index baa2cf4..b287c5b 100644
    AC_SUBST([LIBGLIB])
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
-
-diff --git a/gettext-tools/gnulib-m4/selinux-selinux-h.m4 b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
-index e2613fa..2a733a7 100644
---- a/gettext-tools/gnulib-m4/selinux-selinux-h.m4
-+++ b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
-@@ -71,6 +71,7 @@ AC_DEFUN([gl_LIBSELINUX],
- [
-   AC_REQUIRE([AC_CANONICAL_HOST])
-   AC_REQUIRE([AC_CANONICAL_BUILD])
-+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
- 
-   AC_ARG_WITH([selinux],
-     AS_HELP_STRING([[--without-selinux]], [do not use SELinux, even on systems with SELinux]),
-@@ -79,19 +80,8 @@ AC_DEFUN([gl_LIBSELINUX],
-   LIB_SELINUX=
-   if test "$with_selinux" != no; then
-     gl_saved_LIBS=$LIBS
--    AC_SEARCH_LIBS([setfilecon], [selinux],
--                   [test "$ac_cv_search_setfilecon" = "none required" ||
--                    LIB_SELINUX=$ac_cv_search_setfilecon])
-+    PKG_CHECK_MODULES([SELINUX], [libselinux], [LIB_SELINUX=$SELINUX_LIBS])
-     LIBS=$gl_saved_LIBS
-   fi
-   AC_SUBST([LIB_SELINUX])
--
--  # Warn if SELinux is found but libselinux is absent;
--  if test "$ac_cv_search_setfilecon" = no; then
--    if test "$host" = "$build" && test -d /selinux; then
--      AC_MSG_WARN([This system supports SELinux but libselinux is missing.])
--      AC_MSG_WARN([AC_PACKAGE_NAME will be compiled without SELinux support.])
--    fi
--    with_selinux=no
--  fi
- ])
diff --git a/meta/recipes-core/gettext/gettext_0.26.bb b/meta/recipes-core/gettext/gettext_1.0.bb
similarity index 100%
rename from meta/recipes-core/gettext/gettext_0.26.bb
rename to meta/recipes-core/gettext/gettext_1.0.bb
-- 
2.49.1


