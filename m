Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D12C48BF5
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.16724.1708083641400806033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=iPwGYKe5;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708083649; x=1739619649;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3hBp3i6rFZonXnncVX+VSMkS9LKKV8RDu8srDnFBNX0=;
  b=iPwGYKe5Fbikuo1pgM90gNV7E3p5v7kMIm065d0tU031Yho5i/26e0BF
   0nVeuuF2BoswrY3IGyuqqhgz7yYCj3sMweVzJf9P35PSyRo5zKxk4D+ez
   NEQGR8frg4oqKGuEvd3RrhDn7AjcjaYL13ODb/5lZ16PgPXUWBlUZKVHH
   BYD2F20MAtSrohj/JpqdJYEUyOzeC8OEDZs8YQ9WI4+SjWrutp7jrsVpt
   ZtHIMHcZjkuJgaXcEzrvM8w9eu+a9N3RgOFm3vxUeNv58TgOBiXA5ye3J
   CRC3AKz1Qz0ZwZ9gewCzJv/eoa427TiJbfwR1C4H0+Kl0JhEi3CJkMrQc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2612866"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2612866"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912349735"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912349735"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.3])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:48 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] swig: upgrade 4.1.1 -> 4.2.0
Date: Fri, 16 Feb 2024 19:40:32 +0800
Message-ID: <20240216114034.109257-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240216114034.109257-1-anuj.mittal@intel.com>
References: <20240216114034.109257-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195754

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...self-exe-for-swig-swiglib-on-non-Win32-plat.patch | 10 ++++++----
 ...configure-use-pkg-config-for-pcre-detection.patch |  6 +++---
 meta/recipes-devtools/swig/swig/determinism.patch    | 12 +++++++++++-
 .../swig/{swig_4.1.1.bb => swig_4.2.0.bb}            |  2 +-
 4 files changed, 21 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.1.1.bb => swig_4.2.0.bb} (72%)

diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
index f27f80ea184..9c6ae389be2 100644
--- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
+++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
@@ -1,4 +1,4 @@
-From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17 00:00:00 2001
+From ab0ab5e685bd9077c44fdca5c1a27b0f477444d7 Mon Sep 17 00:00:00 2001
 From: "NODA, Kai" <nodakai@gmail.com>
 Date: Sun, 22 Apr 2012 17:01:02 +0900
 Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
@@ -10,9 +10,11 @@ Upstream-Status: Submitted
 http://sourceforge.net/mailarchive/message.php?msg_id=29179733
 
 ---
- Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
+ Source/Modules/main.cxx | 24 ++++++++++++++++++++++--
  1 file changed, 22 insertions(+), 2 deletions(-)
 
+diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
+index 8a44921..8250dee 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
 @@ -25,6 +25,11 @@
@@ -27,7 +29,7 @@ http://sourceforge.net/mailarchive/message.php?msg_id=29179733
  
  // Global variables
  
-@@ -934,9 +939,9 @@ int SWIG_main(int argc, char *argv[], co
+@@ -886,9 +891,9 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
  
    // Check for SWIG_LIB environment variable
    if ((c = getenv("SWIG_LIB")) == (char *) 0) {
@@ -38,7 +40,7 @@ http://sourceforge.net/mailarchive/message.php?msg_id=29179733
      if (!(GetModuleFileName(0, buf, MAX_PATH) == 0 || (p = strrchr(buf, '\\')) == 0)) {
        *(p + 1) = '\0';
        SwigLib = NewStringf("%sLib", buf); // Native windows installation path
-@@ -946,7 +951,22 @@ int SWIG_main(int argc, char *argv[], co
+@@ -898,7 +903,22 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
      if (Len(SWIG_LIB_WIN_UNIX) > 0)
        SwigLibWinUnix = NewString(SWIG_LIB_WIN_UNIX); // Unix installation path using a drive letter (for msys/mingw)
  #else
diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
index cfcbd8c73ae..9e16caecca1 100644
--- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
+++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
@@ -1,4 +1,4 @@
-From ffb785ed8d3cac3c28e014b1238d93e2bc1f0c01 Mon Sep 17 00:00:00 2001
+From 57a15651b46a0f1f84a4dd15d67d104fbfbe3f6e Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Tue, 17 Jun 2014 08:18:17 +0200
 Subject: [PATCH] configure: use pkg-config for pcre detection
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 7 insertions(+), 32 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f88004a..3a2b47c 100644
+index c060028..a330266 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -57,39 +57,14 @@ AC_MSG_RESULT([$with_pcre])
+@@ -49,39 +49,14 @@ AC_MSG_RESULT([$with_pcre])
  
  dnl To make configuring easier, check for a locally built PCRE using the Tools/pcre-build.sh script
  if test x"${with_pcre}" = xyes ; then
diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 84c399182a4..417f0c43178 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,13 +1,23 @@
+From 25bf9893ec1f557781eb241508ea1bec959061fe Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 1 Mar 2021 00:11:10 +0000
+Subject: [PATCH] swig: Fix reproducibility issue
+
 Remove the compiler commandline/platform from the compiled binary as this
 breaks reproducibilty.
 
 Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlikely to take]
 RP 2021/3/1
 
+---
+ Source/Modules/main.cxx | 1 -
+ 1 file changed, 1 deletion(-)
 
+diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
+index 8250dee..415761d 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
-@@ -642,7 +642,6 @@ static void getoptions(int argc, char *a
+@@ -629,7 +629,6 @@ static void getoptions(int argc, char *argv[]) {
  	}
        } else if (strcmp(argv[i], "-version") == 0) {
  	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
diff --git a/meta/recipes-devtools/swig/swig_4.1.1.bb b/meta/recipes-devtools/swig/swig_4.2.0.bb
similarity index 72%
rename from meta/recipes-devtools/swig/swig_4.1.1.bb
rename to meta/recipes-devtools/swig/swig_4.2.0.bb
index b9e01752993..2ab4ed006c6 100644
--- a/meta/recipes-devtools/swig/swig_4.1.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.2.0.bb
@@ -4,4 +4,4 @@ SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.pat
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b"
+SRC_URI[sha256sum] = "261ca2d7589e260762817b912c075831572b72ff2717942f75b3e51244829c97"
-- 
2.43.2


