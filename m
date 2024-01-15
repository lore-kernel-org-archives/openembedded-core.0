Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B409C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:28:35 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.74553.1705310907343283177
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="145637382"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="145637382"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:28:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AA4B0D6186
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:28:22 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EAADDCF7E9
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:28:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8053B202D32A1
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:28:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 23ABE1A015F;
	Mon, 15 Jan 2024 17:28:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] swig: upgrade 4.1.1 -> 4.2.0
Date: Mon, 15 Jan 2024 17:27:54 +0800
Message-Id: <1705310874-24840-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--13.542600-10.000000
X-TMASE-MatchedRID: yX2NuvXOYO2jz0nOeth/yZAk4Vz6rKor1QQ6Jx/fflbk0tAJchybnDoj
	JH9oiMoV2nPTJ66uXI9eC+9qSyjST8zBf2DNkF054v0ZcDzkTyuqoB1rZZZKK8fASe7knCttYM7
	CqUrhUu/8d9roYUbk1WNIdFYGulCvFnA5QvLQGoV85pjA/x1xfiBfZe3im9iRd0JDhaqahqGJgy
	9IhGp7G5BzGmFDoeOdObLrgOkR5lHbxNjgsY/JTQPZZctd3P4BN5dqZcIK7Vgg9R3V8qg5xNb2e
	7N2CFQyoTssFGSH7W3mn3xyPJAJoswrDggcQ6d1x0gyixf3FjjlhMBfJp59WeT76EYzadJ7PLvP
	GJ0eFinnk+PPhXCmbE6L/b6Yh2JdfIAvTw0zTR6BQTHl0mqX8Wvaomg0i4KNeGHkpR2WBaIOpIL
	C4elYk4G1cHO6yZ4n60tqR0V4+fFO8fMZwaqIgp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gKq
	42LRYkfWZ63Mb7pWt0lFtmw7ugSEADJ3Nn8WSJxy/NYTssQ+x+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193664

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
0001-configure-use-pkg-config-for-pcre-detection.patch
determinism.patch
refreshed for 4.2.0

Changelog:
============
-Various template wrapping improvements: template template parameters,
 variadic templates, partially specialized templates, const template
 parameters and improved error checking instantiating templates.
-Improved decltype() support for expressions.
-C++14 auto without trailing return type and C++11 auto variables.
-Numerous C++ using declarations improvements.
-Numerous fixes for constructors, destructors and assignment operators:
 implicit, default and deleted and related non-assignable variable
 wrappers.
-STL: std::array and std::map improvements, std::string_view support
 added.
-Various C preprocessor improvements.
-Various issues fixed to do with architecture specific long type.
-Various Doxygen improvements.
-D1/Tango support removed. D2/Phobos is now the supported D version
 and SWIG now generates code which works with recent D2 releases.
-New Javascript generator targeting Node.js binary stable ABI Node-API.
-Octave 8.1 support added.
-PHP7 support removed, PHP8 is now the supported PHP version.
-Python STL container wrappers now use the Python Iterator Protocol.
-Python stable ABI support added.
-Python 3.12 support added.
-Ruby 3.2 and 3.3 support.
-Scilab 2023.* support added.
-Various minor enhancements for C#, Go, Guile, Javascript, Lua, Ocaml,
 Perl, PHP, R, Racket, Ruby, Scilab and Tcl.
-A number of deprecated features have been removed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...self-exe-for-swig-swiglib-on-non-Win32-plat.patch | 10 ++++++----
 ...configure-use-pkg-config-for-pcre-detection.patch |  6 +++---
 meta/recipes-devtools/swig/swig/determinism.patch    | 12 +++++++++++-
 .../swig/{swig_4.1.1.bb => swig_4.2.0.bb}            |  2 +-
 4 files changed, 21 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.1.1.bb => swig_4.2.0.bb} (72%)

diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
index f27f80ea18..3f9c298430 100644
--- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
+++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
@@ -1,4 +1,4 @@
-From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17 00:00:00 2001
+From ca02368e2fcb469649534e00eeb21a3c86300f1e Mon Sep 17 00:00:00 2001
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
index cfcbd8c73a..40e98af77c 100644
--- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
+++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
@@ -1,4 +1,4 @@
-From ffb785ed8d3cac3c28e014b1238d93e2bc1f0c01 Mon Sep 17 00:00:00 2001
+From 94f53f3f6629c2b7ffcffe0dd6ff4b5874271d26 Mon Sep 17 00:00:00 2001
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
index 84c399182a..8e6b01deb3 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,13 +1,23 @@
+From 2a106412fa86e57b6c069a6498fa6181ec5f983e Mon Sep 17 00:00:00 2001
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
index b9e0175299..2ab4ed006c 100644
--- a/meta/recipes-devtools/swig/swig_4.1.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.2.0.bb
@@ -4,4 +4,4 @@ SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.pat
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "2af08aced8fcd65cdb5cc62426768914bedc735b1c250325203716f78e39ac9b"
+SRC_URI[sha256sum] = "261ca2d7589e260762817b912c075831572b72ff2717942f75b3e51244829c97"
-- 
2.34.1


