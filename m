Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B61C54E51
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:52 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8420.1709105611380585283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h0/Sisqr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105624; x=1740641624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sa3n85HrcpaQ4RSmDaDspjD8RItdnsgw1f71p6N7q0w=;
  b=h0/SisqrIwy4Y3G/xB7OYZi4+NtKtgJMmEn9keejEW8ZKWNXs4n1OVTV
   LKWbnvEJ97HskFxnVQrJ2xr+6LcWYNCJqgOifQXT910XZF35+IyZIC6uk
   0Pnh+0P/i0m72ATJmPkOetlLMVa11IOulADMgkKEQ7sL4N3Afyq3uR2H8
   Np8c6ogtQEr69fIP9j465AqQ7reV1nWLc1cjEtlU1XNOjOxhzTX93WAhK
   lwOsgpOUpbawI0r5uhC8HMddlD8KDdBQHvVXRr035IhzN40P9WHvBa05S
   XdheXQea4mqxfvQxm5NyAe5cTmlSECcJirT3LCCk65JZflbp0m2+bZ69Z
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150945789"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150945789"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:43 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 381A0A028B
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 73A9A3094C
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B1F12008FF86
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC18A1A006A;
	Wed, 28 Feb 2024 15:33:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 45/48] swig: upgrade 4.2.0 -> 4.2.1
Date: Wed, 28 Feb 2024 15:32:52 +0800
Message-Id: <1709105575-24259-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--0.241900-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yZAk4Vz6rKornJdsOLB4zv79wRnyxuPjhGiX
	cD8fWgFvhJtbBPDn7JslMcFNu44sG0Kry8ky4RfFYO2LBxTMwiCd2Wz0X3OaLRS+IkcP9rkh89Q
	6mRxQQ0fvAkvb7xTgscYoh/qEF/tVWuiZFrpf1Hw/QdUh6LEl0ME5XPQnBzGXvpLsd+70hTHO/T
	5SZgJlw/ooqscwEThrdrB+hWODDbKZadYkfG0U4BlxrtI3TxRkSLyuC617NWkD6N7jKVbdyOLSd
	VP2tZn5LY0Km6kFDTLlgC90JZPVsFxBtSwl5ViufOaYwP8dcX5B7u3CoX1QWwIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZLEK1KsZFfG/8itLe17Bv2uEwWVyxeRPlYWxh9
	eIUDijHZWGY0E+h9RT25wtXH/bE+s/0aN+CdCBUyiInO54r0FwfmXxU1IQTlLv5Eyr/YIrqsDhz
	tRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196370

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
determinism.patch
refreshed for 4.2.1

Changelog:
============
-Correctly ignore duplicate template instantiation (when the
 duplicate contains typedef'd template parameters).
-Fix segfault shrinking STL containers.
-Fix -Wundef warning about testing the value of __cplusplus when compiling
 SWIG-generated C code.  Warning introduced by a change in SWIG 4.2.0.
-Fix memory leak when getting or setting a PHP attribute which wraps a C++
 member variable.
-Fix for wrapping STL containers that are static member variables or global
 variables (most scripting languages).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...roc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch | 9 ++++-----
 meta/recipes-devtools/swig/swig/determinism.patch        | 7 +++----
 .../swig/{swig_4.2.0.bb => swig_4.2.1.bb}                | 2 +-
 3 files changed, 8 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/swig/{swig_4.2.0.bb => swig_4.2.1.bb} (72%)

diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
index 9c6ae389be..5e83e92725 100644
--- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
+++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
@@ -1,4 +1,4 @@
-From ab0ab5e685bd9077c44fdca5c1a27b0f477444d7 Mon Sep 17 00:00:00 2001
+From b88a98348b3841f0b702e314631883d46f9f362d Mon Sep 17 00:00:00 2001
 From: "NODA, Kai" <nodakai@gmail.com>
 Date: Sun, 22 Apr 2012 17:01:02 +0900
 Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
@@ -8,13 +8,12 @@ If it wasn't found, then fall back to a fixed string just as before.
 
 Upstream-Status: Submitted
 http://sourceforge.net/mailarchive/message.php?msg_id=29179733
-
 ---
  Source/Modules/main.cxx | 24 ++++++++++++++++++++++--
  1 file changed, 22 insertions(+), 2 deletions(-)
 
 diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index 8a44921..8250dee 100644
+index 76b4f9d..de0a512 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
 @@ -25,6 +25,11 @@
@@ -29,7 +28,7 @@ index 8a44921..8250dee 100644
  
  // Global variables
  
-@@ -886,9 +891,9 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
+@@ -895,9 +900,9 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
  
    // Check for SWIG_LIB environment variable
    if ((c = getenv("SWIG_LIB")) == (char *) 0) {
@@ -40,7 +39,7 @@ index 8a44921..8250dee 100644
      if (!(GetModuleFileName(0, buf, MAX_PATH) == 0 || (p = strrchr(buf, '\\')) == 0)) {
        *(p + 1) = '\0';
        SwigLib = NewStringf("%sLib", buf); // Native windows installation path
-@@ -898,7 +903,22 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
+@@ -907,7 +912,22 @@ int SWIG_main(int argc, char *argv[], const TargetLanguageModule *tlm) {
      if (Len(SWIG_LIB_WIN_UNIX) > 0)
        SwigLibWinUnix = NewString(SWIG_LIB_WIN_UNIX); // Unix installation path using a drive letter (for msys/mingw)
  #else
diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/recipes-devtools/swig/swig/determinism.patch
index 417f0c4317..9c49414ad7 100644
--- a/meta/recipes-devtools/swig/swig/determinism.patch
+++ b/meta/recipes-devtools/swig/swig/determinism.patch
@@ -1,4 +1,4 @@
-From 25bf9893ec1f557781eb241508ea1bec959061fe Mon Sep 17 00:00:00 2001
+From 28648b3873d83e26bd19b64ce2c0a41ced9292d3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 00:11:10 +0000
 Subject: [PATCH] swig: Fix reproducibility issue
@@ -8,16 +8,15 @@ breaks reproducibilty.
 
 Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlikely to take]
 RP 2021/3/1
-
 ---
  Source/Modules/main.cxx | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
-index 8250dee..415761d 100644
+index de0a512..ac9e825 100644
 --- a/Source/Modules/main.cxx
 +++ b/Source/Modules/main.cxx
-@@ -629,7 +629,6 @@ static void getoptions(int argc, char *argv[]) {
+@@ -638,7 +638,6 @@ static void getoptions(int argc, char *argv[]) {
  	}
        } else if (strcmp(argv[i], "-version") == 0) {
  	fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
diff --git a/meta/recipes-devtools/swig/swig_4.2.0.bb b/meta/recipes-devtools/swig/swig_4.2.1.bb
similarity index 72%
rename from meta/recipes-devtools/swig/swig_4.2.0.bb
rename to meta/recipes-devtools/swig/swig_4.2.1.bb
index 2ab4ed006c..4b438a7298 100644
--- a/meta/recipes-devtools/swig/swig_4.2.0.bb
+++ b/meta/recipes-devtools/swig/swig_4.2.1.bb
@@ -4,4 +4,4 @@ SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.pat
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
             file://determinism.patch \
            "
-SRC_URI[sha256sum] = "261ca2d7589e260762817b912c075831572b72ff2717942f75b3e51244829c97"
+SRC_URI[sha256sum] = "fa045354e2d048b2cddc69579e4256245d4676894858fcf0bab2290ecf59b7d8"
-- 
2.34.1


