Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A445C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10634.1710313742948911421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=s+LNyEM8;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313742; x=1741849742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=X+/23Vqwcwff+9uTcygMl/PWvq7iIF9a/hcithyA4dY=;
  b=s+LNyEM8l03kpLbUzEITmYZMsAe5h8g7PXJJE9zcHOrY1+/nwFBPjPG6
   NTiwuBe8+emgtb1QB0cw8jKEzH5+B1EGZZpMMIJueqwEqPeJ15wOskR6U
   hzqMBasbgMgwxWCsBkFX/Vq5p4pCs0NEHsMcxlkpUZS/b2VJ+L7ObpK1r
   UIy0CdrQB0I7k1H3DpOsED8o2pFMD5mftk3OZl85DWSIhUJSjvC8RXXi1
   VgLoEmZ+X2uw4Oi84I2Mxx7l3+CyMDZsdDrT29shrdDGvQlypQCA1LOGk
   9eId5nx2DCuY2twes5XdzZbIG2SMrCacDxmAiIwcZOJ7J7QFWoXksyHOE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131428966"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131428966"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 19823E964B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C3E7D6247
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D4F8821BD41
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:08:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 817E11A006B;
	Wed, 13 Mar 2024 15:08:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/36] ghostscript: upgrade 10.02.1 -> 10.03.0
Date: Wed, 13 Mar 2024 15:08:03 +0800
Message-Id: <1710313714-12541-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--3.169000-10.000000
X-TMASE-MatchedRID: glcCYClYkBMFWIzFaWZsv31zro62qhdC1QQ6Jx/fflbozDhGeQC9Ejhy
	bhbsVgIwVjEyNw7OFVEMyw6hMrtYUIgrKnsJ1GRgv5rsfD7H2pk/xRB6OGnb2rKw8Hx0EGitgg8
	W5tsFXIChOywUZIftbeaffHI8kAmi9LwLCmL3tlKVUcz8XpiS9GmQExgOfwV4uBsk5njfgGylNp
	x3XgfaSFFKzhdzLpKRQXIKpfDyJNFdInhzedP5B9DcymdiVMdWsK2kKj9eN5/iKUaoIhea7cDlp
	28LM+NycCgPTZ/vDuCzE1I26BnC6NwzzDg33EmMYVvyqiyuzVAgX2Xt4pvYkfZl9pEUBjhNDuhh
	x8YYGQ9bJcQH3furV3k48PxckV+kHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUBV8HfWv/OGFiwRR
	IYSugsGCKeMtTAZRHmD5JOuhLSiuXP4dEV0JHbrApHZFBwm1Z4eFXrecc1Ugc/FV4/zLaZYhBZy
	ggM4oJ7H2fVekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197007

From: Wang Mingyu <wangmy@fujitsu.com>

avoid-host-contamination.patch
refreshed for 10.03.0

configure.ac-add-option-to-explicitly-disable-neon.patch
removed since it's included in 10.03.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../avoid-host-contamination.patch            | 11 +--
 ...dd-option-to-explicitly-disable-neon.patch | 99 -------------------
 ...ript_10.02.1.bb => ghostscript_10.03.0.bb} |  3 +-
 3 files changed, 5 insertions(+), 108 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_10.02.1.bb => ghostscript_10.03.0.bb} (94%)

diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
index 15c7eb5a77..67f14bd368 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -1,7 +1,7 @@
-From 0ccbaa134093bf6afc79f2d20d061bca5a8754ed Mon Sep 17 00:00:00 2001
+From b36713c8f1ba0e5755b78845a433354a63663b1a Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Thu, 29 Mar 2018 16:02:05 +0800
-Subject: [PATCH 04/10] avoid host contamination
+Subject: [PATCH] avoid host contamination
 
 Remove hardcode path refer to host to avoid host contamination.
 
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/devices/devs.mak b/devices/devs.mak
-index 846aa50..9570182 100644
+index 186f704..88ab8c9 100644
 --- a/devices/devs.mak
 +++ b/devices/devs.mak
-@@ -393,7 +393,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
+@@ -397,7 +397,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
  ### NON PORTABLE, ONLY UNIX WITH GCC SUPPORT
  
  $(DEVOBJ)X11.so : $(x11alt_) $(x11_) $(DEVS_MAK) $(MAKEDIRS)
@@ -27,6 +27,3 @@ index 846aa50..9570182 100644
  
  ###### --------------- Memory-buffered printer devices --------------- ######
  
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch b/meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch
deleted file mode 100644
index 7873396045..0000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/configure.ac-add-option-to-explicitly-disable-neon.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From fd37229a17822c5ad21a369f670b8a6f6cc6b95b Mon Sep 17 00:00:00 2001
-From: Benjamin Bara <benjamin.bara@skidata.com>
-Date: Mon, 4 Sep 2023 12:16:39 +0200
-Subject: [PATCH] configure.ac: add option to explicitly disable neon
-
-Uncomment an already existing possibility to explicitly disable neon and
-use it on both implemented neon checks.
-
-Upstream-Status: Submitted [https://bugs.ghostscript.com/show_bug.cgi?id=707097]
-
-Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
----
- configure.ac | 52 +++++++++++++++++++++++++++++-----------------------
- 1 file changed, 29 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 09d881dd1..62718e15e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -749,6 +749,33 @@ SUBCONFIG_OPTS="--build=$build --host=$host"
- #  SUBCONFIG_OPTS="$SUBCONFIG_OPTS --host=$host_alias"
- #fi
- 
-+dnl --------------------------------------------------
-+dnl Check for NEON support
-+dnl --------------------------------------------------
-+save_cflags=$CFLAGS
-+AC_MSG_CHECKING([neon support])
-+CFLAGS="$save_cflags $OPT_CFLAGS -mfpu=neon -mcpu=cortex-a53"
-+HAVE_NEON=""
-+AC_LINK_IFELSE(
-+  [AC_LANG_PROGRAM([#include "arm_neon.h"], [
-+  int32x4_t round = vdupq_n_s32(10);
-+  return(0);
-+  ])],
-+  [HAVE_NEON="-DHAVE_NEON"], [HAVE_NEON=""])
-+
-+AC_ARG_ENABLE([neon], AS_HELP_STRING([--disable-neon],
-+       [Do not use neon instrinsics]), [
-+             if test "x$enable_neon" = xno; then
-+                HAVE_NEON=""
-+             fi])
-+
-+if test "x$HAVE_NEON" != x; then
-+  AC_MSG_RESULT(yes)
-+else
-+  AC_MSG_RESULT(no)
-+fi
-+CFLAGS=$save_cflags
-+
- dnl --------------------------------------------------
- dnl Check for libraries
- dnl --------------------------------------------------
-@@ -971,11 +998,12 @@ if test x$with_tesseract != xno; then
-          [TESS_NEON="-mfpu=neon -mcpu=cortex-a53 -D__ARM_NEON__"],
-          [TESS_NEON=""])
- 
--        if test "x$TESS_NEON" != x; then
-+        if test "x$TESS_NEON" != x && test "x$enable_neon" != xno; then
-           AC_MSG_RESULT(yes)
-           TESS_CXXFLAGS="$TESS_CXXFLAGS -DHAVE_NEON"
-         else
-           AC_MSG_RESULT(no)
-+          TESS_NEON=""
-         fi
- 
-         CXXFLAGS="$save_cxxflags"
-@@ -2387,28 +2415,6 @@ if test x$WITH_CAL != x0; then
-     AC_MSG_RESULT(no)
-   fi
- 
--  AC_MSG_CHECKING([neon support])
--  CFLAGS="$save_cflags $OPT_CFLAGS -mfpu=neon -mcpu=cortex-a53"
--  HAVE_NEON=""
--  AC_LINK_IFELSE(
--    [AC_LANG_PROGRAM([#include "arm_neon.h"], [
--    int32x4_t round = vdupq_n_s32(10);
--    return(0);
--    ])],
--    [HAVE_NEON="-DHAVE_NEON"], [HAVE_NEON=""])
--
--  #AC_ARG_ENABLE([neon], AS_HELP_STRING([--disable-neon],
--  #       [Do not use neon instrinsics]), [
--  #             if test "x$enable_neon" = xno; then
--  #                HAVE_NEON=""
--  #             fi])
--
--  if test "x$HAVE_NEON" != x; then
--    AC_MSG_RESULT(yes)
--  else
--    AC_MSG_RESULT(no)
--  fi
--
-   #AC_SUBST(HAVE_SSE4_2)
-   #AC_SUBST(HAVE_NEON)
-   CFLAGS=$save_cflags
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.03.0.bb
similarity index 94%
rename from meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
rename to meta/recipes-extended/ghostscript/ghostscript_10.03.0.bb
index 3dff16eec2..ff7d38676e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.03.0.bb
@@ -25,10 +25,9 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
-           file://configure.ac-add-option-to-explicitly-disable-neon.patch \
            "
 
-SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
+SRC_URI[sha256sum] = "6f2bc61023469fcf7c7c2d7f1bdd75b75f2b41836aa1d5e641396246d4abbb59"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
-- 
2.34.1


