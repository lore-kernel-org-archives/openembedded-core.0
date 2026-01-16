Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A07D489B8
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:04 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1484.1768526754809234104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DAZRUtEU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bonoroEa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019bc468c276-09560d18-8166-402d-9643-2424f3a51754-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526758;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nFYoJWz9NrxOM7bu8Vg3ViFh/Ikyqah7Oc/0kzeK1jQ=;
	b=DAZRUtEUZEOdbtErceJpqCsEJY2PxD51ObozVrXdb/Tmaycvmk4jZCVoSiaow5Tx
	IKMeyvYpXc4UHSCjgz9Sd6MLZbq20Yuxmn9h76QX0VLRPJK4mLfVHnmNAymDES91etX
	hWNPDSmQlKkN5ePpofU6I/UovCs7zSWpE+pgYr4I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526758;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nFYoJWz9NrxOM7bu8Vg3ViFh/Ikyqah7Oc/0kzeK1jQ=;
	b=bonoroEa8GDH5i6SSx1fiod1h2XTrMGDWvp0rMfqpSJE0l4VyNNe5Tv4v//VwtOc
	H5zeQTbOwwwZrFzS2cLGUVeZm+ZfSNnZsWIskSSoCcJaIzp/BoM6nTK0VD9v5syy4ck
	SMc+dg/p4ga5WXVybLmImTcOV7KEh/uBn5lHpdzM=
Content-Type: multipart/mixed; boundary="===============5631620457121023558=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] icu: upgrading to 78.2 FAILED
Message-ID: <0101019bc468c276-09560d18-8166-402d-9643-2424f3a51754-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229512

--===============5631620457121023558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *icu* to *78.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-icu-upgrade-78.1-78.2.patch
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

-- >8 --
From 32748e7d7f235ef0fc91b31c786ba78380494d5a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 01:07:29 +0000
Subject: [PATCH] icu: upgrade 78.1 -> 78.2

---
 .../0001-Disable-LDFLAGSICUDT-for-Linux.patch | 10 ++--
 ...nicodeStringTest-TestLargeMemory-on-.patch | 18 +++----
 ...tput-compatible-with-Automake-format.patch | 39 +++++++-------
 .../icu/0001-icu-Added-armeb-support.patch    | 10 ++--
 .../icu/icu/0001-test-Add-support-ptest.patch | 51 +++++++++----------
 .../icu/{icu_78.1.bb => icu_78.2.bb}          |  2 +-
 6 files changed, 61 insertions(+), 69 deletions(-)
 rename meta/recipes-support/icu/{icu_78.1.bb => icu_78.2.bb} (98%)

diff --git a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
index c0e9e2806b..7b224cf5bf 100644
--- a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
+++ b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
@@ -1,4 +1,4 @@
-From 0f4e9eee64bd4220aa4fae1ab4f7bbf10b87cd69 Mon Sep 17 00:00:00 2001
+From 80aa05d54ee8c7a0f47dd4d3e19c631a40107aaf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Feb 2014 21:06:42 +0000
 Subject: [PATCH] Disable LDFLAGSICUDT for Linux
@@ -7,13 +7,13 @@ Upstream-Status: Inappropriate [ OE Configuration ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- config/mh-linux | 2 +-
+ source/config/mh-linux | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/config/mh-linux b/config/mh-linux
+diff --git a/source/config/mh-linux b/source/config/mh-linux
 index 53d6780..b622513 100644
---- a/config/mh-linux
-+++ b/config/mh-linux
+--- a/source/config/mh-linux
++++ b/source/config/mh-linux
 @@ -23,7 +23,7 @@ LD_RPATH= -Wl,-zorigin,-rpath,'$$'ORIGIN
  LD_RPATH_PRE = -Wl,-rpath,
  
diff --git a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
index e2e9546679..8d2e81aa7a 100644
--- a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
+++ b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
@@ -1,20 +1,21 @@
-From 4b3e6888c2aaba6465f1bc96f61b17a2513050f3 Mon Sep 17 00:00:00 2001
+From 14f170d07716e6dabbaba790edae4ec5bf4db82c Mon Sep 17 00:00:00 2001
 From: David Seifert <soap@gentoo.org>
 Date: Sat, 21 Jun 2025 12:28:15 +0200
 Subject: [PATCH] ICU-23120 Mask UnicodeStringTest::TestLargeMemory on 32-bit
+
  platforms
 
 Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/3496]
 Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
 ---
- test/intltest/ustrtest.cpp | 2 +-
+ source/test/intltest/ustrtest.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/test/intltest/ustrtest.cpp b/test/intltest/ustrtest.cpp
-index 56976b3e3d2..26225f5b5b5 100644
---- a/test/intltest/ustrtest.cpp
-+++ b/test/intltest/ustrtest.cpp
-@@ -2353,7 +2353,7 @@ void UnicodeStringTest::TestUnicodeStringInsertAppendToSelf() {
+diff --git a/source/test/intltest/ustrtest.cpp b/source/test/intltest/ustrtest.cpp
+index 3f382c5..6049332 100644
+--- a/source/test/intltest/ustrtest.cpp
++++ b/source/test/intltest/ustrtest.cpp
+@@ -2375,7 +2375,7 @@ void UnicodeStringTest::TestUnicodeStringInsertAppendToSelf() {
  }
  
  void UnicodeStringTest::TestLargeMemory() {
@@ -23,6 +24,3 @@ index 56976b3e3d2..26225f5b5b5 100644
      if(quick) { return; }
      IcuTestErrorCode status(*this, "TestLargeMemory");
      constexpr uint32_t len = 2147483643;
--- 
-2.43.0
-
diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch b/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
index 484e1c7f6f..bddebfb682 100644
--- a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
+++ b/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
@@ -1,4 +1,4 @@
-From 4779f798463d673dd74623979ec93141eb60d07a Mon Sep 17 00:00:00 2001
+From a1a1f1a57ac569ab866296f01591e5419e732ff1 Mon Sep 17 00:00:00 2001
 From: Jiaying Song <jiaying.song.cn@windriver.com>
 Date: Fri, 21 Nov 2025 10:47:59 +0800
 Subject: [PATCH] Make ICU test output compatible with Automake format
@@ -16,16 +16,16 @@ Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/3764]
 
 Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
 ---
- configure.ac               | 17 +++++++++++++++++
- test/intltest/intltest.cpp | 10 +++++++++-
- tools/ctestfw/ctest.c      |  9 ++++++++-
+ source/configure.ac               | 17 +++++++++++++++++
+ source/test/intltest/intltest.cpp | 10 +++++++++-
+ source/tools/ctestfw/ctest.c      |  9 ++++++++-
  3 files changed, 34 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index da4f170..514fa0c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1165,6 +1165,21 @@ If set, it will REPLACE any automatic list of libraries.],
+diff --git a/source/configure.ac b/source/configure.ac
+index 8ffacf8..9ba3b4e 100644
+--- a/source/configure.ac
++++ b/source/configure.ac
+@@ -1103,6 +1103,21 @@ If set, it will REPLACE any automatic list of libraries.],
  		*) AC_MSG_ERROR(bad value ${enableval} for --enable-samples) ;;
  		esac],
  	samples=true)
@@ -47,17 +47,17 @@ index da4f170..514fa0c 100644
  ICU_CONDITIONAL(SAMPLES, test "$samples" = true)
  
  ICUDATA_CHAR=$U_ENDIAN_CHAR
-@@ -1428,3 +1443,5 @@ then
+@@ -1366,3 +1381,5 @@ then
  fi
  
  $as_unset _CXX_CXXSUFFIX
 +
 +
-diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
-index 33829b0..bf3ef56 100644
---- a/test/intltest/intltest.cpp
-+++ b/test/intltest/intltest.cpp
-@@ -830,11 +830,19 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+diff --git a/source/test/intltest/intltest.cpp b/source/test/intltest/intltest.cpp
+index 5379479..579dcbc 100644
+--- a/source/test/intltest/intltest.cpp
++++ b/source/test/intltest/intltest.cpp
+@@ -824,11 +824,19 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
              saveBaseLoc[0]=0; /* reset path */
              
              if (lastErrorCount == errorCount) {
@@ -78,10 +78,10 @@ index 33829b0..bf3ef56 100644
                  if(!no_time) str_timeDelta(msg+strlen(msg),timeStop-timeStart);
  
                  for(int i=0;i<LL_indentlevel;i++) {
-diff --git a/tools/ctestfw/ctest.c b/tools/ctestfw/ctest.c
+diff --git a/source/tools/ctestfw/ctest.c b/source/tools/ctestfw/ctest.c
 index 7634526..c2e11dd 100644
---- a/tools/ctestfw/ctest.c
-+++ b/tools/ctestfw/ctest.c
+--- a/source/tools/ctestfw/ctest.c
++++ b/source/tools/ctestfw/ctest.c
 @@ -413,9 +413,16 @@ static void iterateTestsWithLevel ( const TestNode* root,
          ctest_xml_testcase(pathToFunction, pathToFunction, timeSeconds, (myERROR_COUNT!=ERROR_COUNT)?"error":NULL);
  
@@ -100,6 +100,3 @@ index 7634526..c2e11dd 100644
            if(!ON_LINE) { /* had some output */
              int spaces = FLAG_INDENT-(depth-1);
              log_testinfo_i("} %*s[OK] ", spaces, "---");
--- 
-2.34.1
-
diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
index a25285fb54..c878a158fb 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From cf55c077b77b7a219502364eaadf12c074ab005e Mon Sep 17 00:00:00 2001
+From 77c79b44c1fc6d1f0e628a6edfd474d15219464a Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@cn.fujitsu.com>
 Date: Wed, 8 May 2019 14:42:30 +0900
 Subject: [PATCH] icu: Added armeb support.
@@ -9,13 +9,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
 ---
- i18n/double-conversion-utils.h | 2 +-
+ source/i18n/double-conversion-utils.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
+diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
 index 303668f..7d859dc 100644
---- a/i18n/double-conversion-utils.h
-+++ b/i18n/double-conversion-utils.h
+--- a/source/i18n/double-conversion-utils.h
++++ b/source/i18n/double-conversion-utils.h
 @@ -146,7 +146,7 @@ int main(int argc, char** argv) {
  //
  // If it prints "correct" then the architecture should be here, in the "correct" section.
diff --git a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
index 88350c0db5..20a5b9e382 100644
--- a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
+++ b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
@@ -1,4 +1,4 @@
-From 783d9e0d3d7824fbca53c2c3a80e8e5e23eacc82 Mon Sep 17 00:00:00 2001
+From 6e37ab9dd088b37ef26f8285fd06e34a5ffb09bc Mon Sep 17 00:00:00 2001
 From: Daisuke Yamane <yamane07ynct@gmail.com>
 Date: Tue, 1 Jul 2025 18:35:25 +0900
 Subject: [PATCH] test: Add support ptest
@@ -7,17 +7,17 @@ Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
 ---
- test/cintltst/Makefile.in  | 2 +-
- test/intltest/Makefile.in  | 2 +-
- test/intltest/intltest.cpp | 2 +-
- test/iotest/Makefile.in    | 2 +-
- test/letest/Makefile.in    | 2 +-
+ source/test/cintltst/Makefile.in  | 2 +-
+ source/test/intltest/Makefile.in  | 2 +-
+ source/test/intltest/intltest.cpp | 2 +-
+ source/test/iotest/Makefile.in    | 2 +-
+ source/test/letest/Makefile.in    | 2 +-
  5 files changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/test/cintltst/Makefile.in b/test/cintltst/Makefile.in
+diff --git a/source/test/cintltst/Makefile.in b/source/test/cintltst/Makefile.in
 index 552a105..9cf3071 100644
---- a/test/cintltst/Makefile.in
-+++ b/test/cintltst/Makefile.in
+--- a/source/test/cintltst/Makefile.in
++++ b/source/test/cintltst/Makefile.in
 @@ -39,7 +39,7 @@ CPPFLAGS += -I$(top_srcdir)/common -I$(top_srcdir)/i18n -I$(top_srcdir)/tools/ct
  ifdef QNX_TARGET
  DEFS += -D'ICU_UNICODE_VERSION="$(UNICODE_VERSION)"' -D'ICU_VERSION="@VERSION@"' -D'ICUDATA_NAME="$(ICUDATA_PLATFORM_NAME)"' -D'U_TOPSRCDIR="/var/icu_tests"' -D'U_TOPBUILDDIR="/var/icu_tests/"'
@@ -27,10 +27,10 @@ index 552a105..9cf3071 100644
  endif
  LIBS = $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUTOOLUTIL) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
  
-diff --git a/test/intltest/Makefile.in b/test/intltest/Makefile.in
-index 5d4a03b..ca4e4cd 100644
---- a/test/intltest/Makefile.in
-+++ b/test/intltest/Makefile.in
+diff --git a/source/test/intltest/Makefile.in b/source/test/intltest/Makefile.in
+index 2e44831..d5bd240 100644
+--- a/source/test/intltest/Makefile.in
++++ b/source/test/intltest/Makefile.in
 @@ -39,7 +39,7 @@ CPPFLAGS += -DUNISTR_FROM_CHAR_EXPLICIT= -DUNISTR_FROM_STRING_EXPLICIT=
  ifdef QNX_TARGET
  DEFS += -D'U_TOPSRCDIR="/var/icu_tests"' -D'U_TOPBUILDDIR="/var/icu_tests/"'
@@ -40,11 +40,11 @@ index 5d4a03b..ca4e4cd 100644
  endif
  LIBS = $(LIBCTESTFW) $(LIBICUI18N) $(LIBICUUC) $(LIBICUTOOLUTIL) $(DEFAULT_LIBS) $(LIB_M) $(LIB_THREAD)
  
-diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
-index 3806d0f..33829b0 100644
---- a/test/intltest/intltest.cpp
-+++ b/test/intltest/intltest.cpp
-@@ -1713,7 +1713,7 @@ static bool fileExists(const char* fileName) {
+diff --git a/source/test/intltest/intltest.cpp b/source/test/intltest/intltest.cpp
+index a856715..5379479 100644
+--- a/source/test/intltest/intltest.cpp
++++ b/source/test/intltest/intltest.cpp
+@@ -1707,7 +1707,7 @@ static bool fileExists(const char* fileName) {
   * Returns the path to icu/testdata/
   */
  const char *IntlTest::getSharedTestData(UErrorCode& err) {
@@ -53,10 +53,10 @@ index 3806d0f..33829b0 100644
  #define REPO_TOP SOURCE_TARBALL_TOP ".." U_FILE_SEP_STRING
  #define FILE_NAME U_FILE_SEP_STRING "message2" U_FILE_SEP_STRING "valid-tests.json"
      const char *srcDataDir = nullptr;
-diff --git a/test/iotest/Makefile.in b/test/iotest/Makefile.in
+diff --git a/source/test/iotest/Makefile.in b/source/test/iotest/Makefile.in
 index 16c510f..9eeff4b 100644
---- a/test/iotest/Makefile.in
-+++ b/test/iotest/Makefile.in
+--- a/source/test/iotest/Makefile.in
++++ b/source/test/iotest/Makefile.in
 @@ -39,7 +39,7 @@ CPPFLAGS += -DUNISTR_FROM_CHAR_EXPLICIT= -DUNISTR_FROM_STRING_EXPLICIT=
  ifdef QNX_TARGET
  DEFS += -D'U_TOPSRCDIR="/var/icu_tests"' -D'U_TOPBUILDDIR="/var/icu_tests/"'
@@ -66,10 +66,10 @@ index 16c510f..9eeff4b 100644
  endif
  LIBS = $(LIBCTESTFW) $(LIBICUTOOLUTIL) $(LIBICUIO) $(LIBICUI18N) $(LIBICUUC) $(DEFAULT_LIBS) $(LIB_M)
  
-diff --git a/test/letest/Makefile.in b/test/letest/Makefile.in
+diff --git a/source/test/letest/Makefile.in b/source/test/letest/Makefile.in
 index 156c86f..555a820 100644
---- a/test/letest/Makefile.in
-+++ b/test/letest/Makefile.in
+--- a/source/test/letest/Makefile.in
++++ b/source/test/letest/Makefile.in
 @@ -30,7 +30,7 @@ BUILDDIR := $(BUILDDIR:test\\cintltst/../../=)
  BUILDDIR := $(BUILDDIR:TEST\\CINTLTST/../../=)
  
@@ -79,6 +79,3 @@ index 156c86f..555a820 100644
  LIBS = $(LIBICULX) $(LIBICUUC) $(LIBICUI18N) $(LIBCTESTFW) $(LIBICUTOOLUTIL) $(DEFAULT_LIBS) $(LIB_M) $(ICULEHB_LIBS)
  
  COMMONOBJECTS = SimpleFontInstance.o
--- 
-2.43.0
-
diff --git a/meta/recipes-support/icu/icu_78.1.bb b/meta/recipes-support/icu/icu_78.2.bb
similarity index 98%
rename from meta/recipes-support/icu/icu_78.1.bb
rename to meta/recipes-support/icu/icu_78.2.bb
index ee7245c27b..30ac776e3c 100644
--- a/meta/recipes-support/icu/icu_78.1.bb
+++ b/meta/recipes-support/icu/icu_78.2.bb
@@ -116,7 +116,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "6217f58ca39b23127605cfc6c7e0d3475fe4b0d63157011383d716cb41617886"
+SRC_URI[code.sha256sum] = "3e99687b5c435d4b209630e2d2ebb79906c984685e78635078b672e03c89df35"
 SRC_URI[data.sha256sum] = "e7b652244f27194e0ea46a0d21cfc714ee8a818e1fd82d51a93bc91516fdcf65"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
-- 
2.47.1


--===============5631620457121023558==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-icu-upgrade-78.1-78.2.patch"

RnJvbSAzMjc0OGU3ZDdmMjM1ZWYwZmM5MWIzMWM3ODZiYTc4MzgwNDk0ZDVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDE6MDc6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
Y3U6IHVwZ3JhZGUgNzguMSAtPiA3OC4yCgotLS0KIC4uLi8wMDAxLURpc2FibGUtTERGTEFHU0lD
VURULWZvci1MaW51eC5wYXRjaCB8IDEwICsrLS0KIC4uLm5pY29kZVN0cmluZ1Rlc3QtVGVzdExh
cmdlTWVtb3J5LW9uLS5wYXRjaCB8IDE4ICsrKy0tLS0KIC4uLnRwdXQtY29tcGF0aWJsZS13aXRo
LUF1dG9tYWtlLWZvcm1hdC5wYXRjaCB8IDM5ICsrKysrKystLS0tLS0tCiAuLi4vaWN1LzAwMDEt
aWN1LUFkZGVkLWFybWViLXN1cHBvcnQucGF0Y2ggICAgfCAxMCArKy0tCiAuLi4vaWN1L2ljdS8w
MDAxLXRlc3QtQWRkLXN1cHBvcnQtcHRlc3QucGF0Y2ggfCA1MSArKysrKysrKystLS0tLS0tLS0t
CiAuLi4vaWN1L3tpY3VfNzguMS5iYiA9PiBpY3VfNzguMi5iYn0gICAgICAgICAgfCAgMiArLQog
NiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA2OSBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3Uve2ljdV83OC4xLmJiID0+IGljdV83OC4yLmJifSAo
OTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1EaXNh
YmxlLUxERkxBR1NJQ1VEVC1mb3ItTGludXgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9p
Y3UvaWN1LzAwMDEtRGlzYWJsZS1MREZMQUdTSUNVRFQtZm9yLUxpbnV4LnBhdGNoCmluZGV4IGMw
ZTllMjgwNmIuLjdiMjI0Y2Y1YmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lj
dS9pY3UvMDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VEVC1mb3ItTGludXgucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAxLURpc2FibGUtTERGTEFHU0lDVURULWZvci1M
aW51eC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMGY0ZTllZWU2NGJkNDIyMGFhNGZhZTFh
YjRmN2JiZjEwYjg3Y2Q2OSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODBhYTA1ZDU0
ZWU4YzdhMGY0N2RkNGQzZTE5YzYzMWE0MDEwN2FhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBTYXQsIDE1IEZlYiAy
MDE0IDIxOjA2OjQyICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgTERGTEFHU0lDVURU
IGZvciBMaW51eApAQCAtNywxMyArNywxMyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlh
dGUgWyBPRSBDb25maWd1cmF0aW9uIF0KIAogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIC0tLQotIGNvbmZpZy9taC1saW51eCB8IDIgKy0KKyBzb3VyY2UvY29u
ZmlnL21oLWxpbnV4IHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogCi1kaWZmIC0tZ2l0IGEvY29uZmlnL21oLWxpbnV4IGIvY29uZmlnL21oLWxp
bnV4CitkaWZmIC0tZ2l0IGEvc291cmNlL2NvbmZpZy9taC1saW51eCBiL3NvdXJjZS9jb25maWcv
bWgtbGludXgKIGluZGV4IDUzZDY3ODAuLmI2MjI1MTMgMTAwNjQ0Ci0tLS0gYS9jb25maWcvbWgt
bGludXgKLSsrKyBiL2NvbmZpZy9taC1saW51eAorLS0tIGEvc291cmNlL2NvbmZpZy9taC1saW51
eAorKysrIGIvc291cmNlL2NvbmZpZy9taC1saW51eAogQEAgLTIzLDcgKzIzLDcgQEAgTERfUlBB
VEg9IC1XbCwtem9yaWdpbiwtcnBhdGgsJyQkJ09SSUdJTgogIExEX1JQQVRIX1BSRSA9IC1XbCwt
cnBhdGgsCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEt
SUNVLTIzMTIwLU1hc2stVW5pY29kZVN0cmluZ1Rlc3QtVGVzdExhcmdlTWVtb3J5LW9uLS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1JQ1UtMjMxMjAtTWFzay1Vbmlj
b2RlU3RyaW5nVGVzdC1UZXN0TGFyZ2VNZW1vcnktb24tLnBhdGNoCmluZGV4IGUyZTk1NDY2Nzku
LjhkMmU4MWFhN2EgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAw
MS1JQ1UtMjMxMjAtTWFzay1Vbmljb2RlU3RyaW5nVGVzdC1UZXN0TGFyZ2VNZW1vcnktb24tLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1JQ1UtMjMxMjAtTWFz
ay1Vbmljb2RlU3RyaW5nVGVzdC1UZXN0TGFyZ2VNZW1vcnktb24tLnBhdGNoCkBAIC0xLDIwICsx
LDIxIEBACi1Gcm9tIDRiM2U2ODg4YzJhYWJhNjQ2NWYxYmM5NmY2MWIxN2EyNTEzMDUwZjMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDE0ZjE3MGQwNzcxNmU2ZGFiYmFiYTc5MGVkYWU0
ZWM1YmY0ZGI4MmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBEYXZpZCBTZWlmZXJ0
IDxzb2FwQGdlbnRvby5vcmc+CiBEYXRlOiBTYXQsIDIxIEp1biAyMDI1IDEyOjI4OjE1ICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIElDVS0yMzEyMCBNYXNrIFVuaWNvZGVTdHJpbmdUZXN0OjpUZXN0
TGFyZ2VNZW1vcnkgb24gMzItYml0CisKICBwbGF0Zm9ybXMKIAogVXBzdHJlYW0tU3RhdHVzOiBT
dWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS91bmljb2RlLW9yZy9pY3UvcHVsbC8zNDk2XQog
U2lnbmVkLW9mZi1ieTogRGFpc3VrZSBZYW1hbmUgPHlhbWFuZTA3eW5jdEBnbWFpbC5jb20+CiAt
LS0KLSB0ZXN0L2ludGx0ZXN0L3VzdHJ0ZXN0LmNwcCB8IDIgKy0KKyBzb3VyY2UvdGVzdC9pbnRs
dGVzdC91c3RydGVzdC5jcHAgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiAKLWRpZmYgLS1naXQgYS90ZXN0L2ludGx0ZXN0L3VzdHJ0ZXN0LmNw
cCBiL3Rlc3QvaW50bHRlc3QvdXN0cnRlc3QuY3BwCi1pbmRleCA1Njk3NmIzZTNkMi4uMjYyMjVm
NWI1YjUgMTAwNjQ0Ci0tLS0gYS90ZXN0L2ludGx0ZXN0L3VzdHJ0ZXN0LmNwcAotKysrIGIvdGVz
dC9pbnRsdGVzdC91c3RydGVzdC5jcHAKLUBAIC0yMzUzLDcgKzIzNTMsNyBAQCB2b2lkIFVuaWNv
ZGVTdHJpbmdUZXN0OjpUZXN0VW5pY29kZVN0cmluZ0luc2VydEFwcGVuZFRvU2VsZigpIHsKK2Rp
ZmYgLS1naXQgYS9zb3VyY2UvdGVzdC9pbnRsdGVzdC91c3RydGVzdC5jcHAgYi9zb3VyY2UvdGVz
dC9pbnRsdGVzdC91c3RydGVzdC5jcHAKK2luZGV4IDNmMzgyYzUuLjYwNDkzMzIgMTAwNjQ0Cist
LS0gYS9zb3VyY2UvdGVzdC9pbnRsdGVzdC91c3RydGVzdC5jcHAKKysrKyBiL3NvdXJjZS90ZXN0
L2ludGx0ZXN0L3VzdHJ0ZXN0LmNwcAorQEAgLTIzNzUsNyArMjM3NSw3IEBAIHZvaWQgVW5pY29k
ZVN0cmluZ1Rlc3Q6OlRlc3RVbmljb2RlU3RyaW5nSW5zZXJ0QXBwZW5kVG9TZWxmKCkgewogIH0K
ICAKICB2b2lkIFVuaWNvZGVTdHJpbmdUZXN0OjpUZXN0TGFyZ2VNZW1vcnkoKSB7CkBAIC0yMyw2
ICsyNCwzIEBAIGluZGV4IDU2OTc2YjNlM2QyLi4yNjIyNWY1YjViNSAxMDA2NDQKICAgICAgaWYo
cXVpY2spIHsgcmV0dXJuOyB9CiAgICAgIEljdVRlc3RFcnJvckNvZGUgc3RhdHVzKCp0aGlzLCAi
VGVzdExhcmdlTWVtb3J5Iik7CiAgICAgIGNvbnN0ZXhwciB1aW50MzJfdCBsZW4gPSAyMTQ3NDgz
NjQzOwotLS0gCi0yLjQzLjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1
L2ljdS8wMDAxLU1ha2UtSUNVLXRlc3Qtb3V0cHV0LWNvbXBhdGlibGUtd2l0aC1BdXRvbWFrZS1m
b3JtYXQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtTWFrZS1JQ1Ut
dGVzdC1vdXRwdXQtY29tcGF0aWJsZS13aXRoLUF1dG9tYWtlLWZvcm1hdC5wYXRjaAppbmRleCA0
ODRlMWM3ZjZmLi5iZGRlYmZiNjgyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9p
Y3UvaWN1LzAwMDEtTWFrZS1JQ1UtdGVzdC1vdXRwdXQtY29tcGF0aWJsZS13aXRoLUF1dG9tYWtl
LWZvcm1hdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtTWFr
ZS1JQ1UtdGVzdC1vdXRwdXQtY29tcGF0aWJsZS13aXRoLUF1dG9tYWtlLWZvcm1hdC5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gNDc3OWY3OTg0NjNkNjczZGQ3NDYyMzk3OWVjOTMxNDFlYjYw
ZDA3YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTFhMWYxYTU3YWM1NjlhYjg2NjI5
NmYwMTU5MWU1NDE5ZTczMmZmMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEppYXlp
bmcgU29uZyA8amlheWluZy5zb25nLmNuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBGcmksIDIxIE5v
diAyMDI1IDEwOjQ3OjU5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIE1ha2UgSUNVIHRlc3Qgb3V0
cHV0IGNvbXBhdGlibGUgd2l0aCBBdXRvbWFrZSBmb3JtYXQKQEAgLTE2LDE2ICsxNiwxNiBAQCBV
cHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3VuaWNvZGUtb3Jn
L2ljdS9wdWxsLzM3NjRdCiAKIFNpZ25lZC1vZmYtYnk6IEppYXlpbmcgU29uZyA8amlheWluZy5z
b25nLmNuQHdpbmRyaXZlci5jb20+CiAtLS0KLSBjb25maWd1cmUuYWMgICAgICAgICAgICAgICB8
IDE3ICsrKysrKysrKysrKysrKysrCi0gdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAgfCAxMCAr
KysrKysrKystCi0gdG9vbHMvY3Rlc3Rmdy9jdGVzdC5jICAgICAgfCAgOSArKysrKysrKy0KKyBz
b3VyY2UvY29uZmlndXJlLmFjICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysrKysrKysrKwor
IHNvdXJjZS90ZXN0L2ludGx0ZXN0L2ludGx0ZXN0LmNwcCB8IDEwICsrKysrKysrKy0KKyBzb3Vy
Y2UvdG9vbHMvY3Rlc3Rmdy9jdGVzdC5jICAgICAgfCAgOSArKysrKysrKy0KICAzIGZpbGVzIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKLWRpZmYgLS1naXQgYS9j
b25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IGRhNGYxNzAuLjUxNGZhMGMgMTAwNjQ0
Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTExNjUsNiArMTE2
NSwyMSBAQCBJZiBzZXQsIGl0IHdpbGwgUkVQTEFDRSBhbnkgYXV0b21hdGljIGxpc3Qgb2YgbGli
cmFyaWVzLl0sCitkaWZmIC0tZ2l0IGEvc291cmNlL2NvbmZpZ3VyZS5hYyBiL3NvdXJjZS9jb25m
aWd1cmUuYWMKK2luZGV4IDhmZmFjZjguLjliYTNiNGUgMTAwNjQ0CistLS0gYS9zb3VyY2UvY29u
ZmlndXJlLmFjCisrKysgYi9zb3VyY2UvY29uZmlndXJlLmFjCitAQCAtMTEwMyw2ICsxMTAzLDIx
IEBAIElmIHNldCwgaXQgd2lsbCBSRVBMQUNFIGFueSBhdXRvbWF0aWMgbGlzdCBvZiBsaWJyYXJp
ZXMuXSwKICAJCSopIEFDX01TR19FUlJPUihiYWQgdmFsdWUgJHtlbmFibGV2YWx9IGZvciAtLWVu
YWJsZS1zYW1wbGVzKSA7OwogIAkJZXNhY10sCiAgCXNhbXBsZXM9dHJ1ZSkKQEAgLTQ3LDE3ICs0
NywxNyBAQCBpbmRleCBkYTRmMTcwLi41MTRmYTBjIDEwMDY0NAogIElDVV9DT05ESVRJT05BTChT
QU1QTEVTLCB0ZXN0ICIkc2FtcGxlcyIgPSB0cnVlKQogIAogIElDVURBVEFfQ0hBUj0kVV9FTkRJ
QU5fQ0hBUgotQEAgLTE0MjgsMyArMTQ0Myw1IEBAIHRoZW4KK0BAIC0xMzY2LDMgKzEzODEsNSBA
QCB0aGVuCiAgZmkKICAKICAkYXNfdW5zZXQgX0NYWF9DWFhTVUZGSVgKICsKICsKLWRpZmYgLS1n
aXQgYS90ZXN0L2ludGx0ZXN0L2ludGx0ZXN0LmNwcCBiL3Rlc3QvaW50bHRlc3QvaW50bHRlc3Qu
Y3BwCi1pbmRleCAzMzgyOWIwLi5iZjNlZjU2IDEwMDY0NAotLS0tIGEvdGVzdC9pbnRsdGVzdC9p
bnRsdGVzdC5jcHAKLSsrKyBiL3Rlc3QvaW50bHRlc3QvaW50bHRlc3QuY3BwCi1AQCAtODMwLDEx
ICs4MzAsMTkgQEAgVUJvb2wgSW50bFRlc3Q6OnJ1blRlc3RMb29wKCBjaGFyKiB0ZXN0bmFtZSwg
Y2hhciogcGFyLCBjaGFyICpiYXNlTmFtZSApCitkaWZmIC0tZ2l0IGEvc291cmNlL3Rlc3QvaW50
bHRlc3QvaW50bHRlc3QuY3BwIGIvc291cmNlL3Rlc3QvaW50bHRlc3QvaW50bHRlc3QuY3BwCitp
bmRleCA1Mzc5NDc5Li41NzlkY2JjIDEwMDY0NAorLS0tIGEvc291cmNlL3Rlc3QvaW50bHRlc3Qv
aW50bHRlc3QuY3BwCisrKysgYi9zb3VyY2UvdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAKK0BA
IC04MjQsMTEgKzgyNCwxOSBAQCBVQm9vbCBJbnRsVGVzdDo6cnVuVGVzdExvb3AoIGNoYXIqIHRl
c3RuYW1lLCBjaGFyKiBwYXIsIGNoYXIgKmJhc2VOYW1lICkKICAgICAgICAgICAgICBzYXZlQmFz
ZUxvY1swXT0wOyAvKiByZXNldCBwYXRoICovCiAgICAgICAgICAgICAgCiAgICAgICAgICAgICAg
aWYgKGxhc3RFcnJvckNvdW50ID09IGVycm9yQ291bnQpIHsKQEAgLTc4LDEwICs3OCwxMCBAQCBp
bmRleCAzMzgyOWIwLi5iZjNlZjU2IDEwMDY0NAogICAgICAgICAgICAgICAgICBpZighbm9fdGlt
ZSkgc3RyX3RpbWVEZWx0YShtc2crc3RybGVuKG1zZyksdGltZVN0b3AtdGltZVN0YXJ0KTsKICAK
ICAgICAgICAgICAgICAgICAgZm9yKGludCBpPTA7aTxMTF9pbmRlbnRsZXZlbDtpKyspIHsKLWRp
ZmYgLS1naXQgYS90b29scy9jdGVzdGZ3L2N0ZXN0LmMgYi90b29scy9jdGVzdGZ3L2N0ZXN0LmMK
K2RpZmYgLS1naXQgYS9zb3VyY2UvdG9vbHMvY3Rlc3Rmdy9jdGVzdC5jIGIvc291cmNlL3Rvb2xz
L2N0ZXN0ZncvY3Rlc3QuYwogaW5kZXggNzYzNDUyNi4uYzJlMTFkZCAxMDA2NDQKLS0tLSBhL3Rv
b2xzL2N0ZXN0ZncvY3Rlc3QuYwotKysrIGIvdG9vbHMvY3Rlc3Rmdy9jdGVzdC5jCistLS0gYS9z
b3VyY2UvdG9vbHMvY3Rlc3Rmdy9jdGVzdC5jCisrKysgYi9zb3VyY2UvdG9vbHMvY3Rlc3Rmdy9j
dGVzdC5jCiBAQCAtNDEzLDkgKzQxMywxNiBAQCBzdGF0aWMgdm9pZCBpdGVyYXRlVGVzdHNXaXRo
TGV2ZWwgKCBjb25zdCBUZXN0Tm9kZSogcm9vdCwKICAgICAgICAgIGN0ZXN0X3htbF90ZXN0Y2Fz
ZShwYXRoVG9GdW5jdGlvbiwgcGF0aFRvRnVuY3Rpb24sIHRpbWVTZWNvbmRzLCAobXlFUlJPUl9D
T1VOVCE9RVJST1JfQ09VTlQpPyJlcnJvciI6TlVMTCk7CiAgCkBAIC0xMDAsNiArMTAwLDMgQEAg
aW5kZXggNzYzNDUyNi4uYzJlMTFkZCAxMDA2NDQKICAgICAgICAgICAgaWYoIU9OX0xJTkUpIHsg
LyogaGFkIHNvbWUgb3V0cHV0ICovCiAgICAgICAgICAgICAgaW50IHNwYWNlcyA9IEZMQUdfSU5E
RU5ULShkZXB0aC0xKTsKICAgICAgICAgICAgICBsb2dfdGVzdGluZm9faSgifSAlKnNbT0tdICIs
IHNwYWNlcywgIi0tLSIpOwotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvaWN1L2ljdS8wMDAxLWljdS1BZGRlZC1hcm1lYi1zdXBwb3J0LnBhdGNoIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAxLWljdS1BZGRlZC1hcm1lYi1zdXBwb3J0LnBh
dGNoCmluZGV4IGEyNTI4NWZiNTQuLmM4NzhhMTU4ZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1pY3UtQWRkZWQtYXJtZWItc3VwcG9ydC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtaWN1LUFkZGVkLWFybWViLXN1cHBv
cnQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNmNTVjMDc3Yjc3YjdhMjE5NTAyMzY0ZWFh
ZGYxMmMwNzRhYjAwNWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDc3Yzc5YjQ0YzFm
YzZkMWYwZTYyOGE2ZWRmZDQ3NGQxNTIxOTQ2NGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBMZWkgTWFvaHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+CiBEYXRlOiBXZWQsIDgg
TWF5IDIwMTkgMTQ6NDI6MzAgKzA5MDAKIFN1YmplY3Q6IFtQQVRDSF0gaWN1OiBBZGRlZCBhcm1l
YiBzdXBwb3J0LgpAQCAtOSwxMyArOSwxMyBAQCBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAog
U2lnbmVkLW9mZi1ieTogTGVpIE1hb2h1aSA8bGVpbWFvaHVpQGNuLmZ1aml0c3UuY29tPgogLS0t
Ci0gaTE4bi9kb3VibGUtY29udmVyc2lvbi11dGlscy5oIHwgMiArLQorIHNvdXJjZS9pMThuL2Rv
dWJsZS1jb252ZXJzaW9uLXV0aWxzLmggfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKLWRpZmYgLS1naXQgYS9pMThuL2RvdWJsZS1jb252ZXJz
aW9uLXV0aWxzLmggYi9pMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxzLmgKK2RpZmYgLS1naXQg
YS9zb3VyY2UvaTE4bi9kb3VibGUtY29udmVyc2lvbi11dGlscy5oIGIvc291cmNlL2kxOG4vZG91
YmxlLWNvbnZlcnNpb24tdXRpbHMuaAogaW5kZXggMzAzNjY4Zi4uN2Q4NTlkYyAxMDA2NDQKLS0t
LSBhL2kxOG4vZG91YmxlLWNvbnZlcnNpb24tdXRpbHMuaAotKysrIGIvaTE4bi9kb3VibGUtY29u
dmVyc2lvbi11dGlscy5oCistLS0gYS9zb3VyY2UvaTE4bi9kb3VibGUtY29udmVyc2lvbi11dGls
cy5oCisrKysgYi9zb3VyY2UvaTE4bi9kb3VibGUtY29udmVyc2lvbi11dGlscy5oCiBAQCAtMTQ2
LDcgKzE0Niw3IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyKiogYXJndikgewogIC8vCiAgLy8g
SWYgaXQgcHJpbnRzICJjb3JyZWN0IiB0aGVuIHRoZSBhcmNoaXRlY3R1cmUgc2hvdWxkIGJlIGhl
cmUsIGluIHRoZSAiY29ycmVjdCIgc2VjdGlvbi4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2ljdS9pY3UvMDAwMS10ZXN0LUFkZC1zdXBwb3J0LXB0ZXN0LnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAxLXRlc3QtQWRkLXN1cHBvcnQtcHRlc3QucGF0Y2gK
aW5kZXggODgzNTBjMGRiNS4uMjBhNWI5ZTM4MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvaWN1L2ljdS8wMDAxLXRlc3QtQWRkLXN1cHBvcnQtcHRlc3QucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAxLXRlc3QtQWRkLXN1cHBvcnQtcHRlc3QucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc4M2Q5ZTBkM2Q3ODI0ZmJjYTUzYzJjM2E4MGU4ZTVl
MjNlYWNjODIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZlMzdhYjlkZDA4OGIzN2Vm
MjZmODI4NWZkMDZlMzRhNWZmYjA5YmMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBE
YWlzdWtlIFlhbWFuZSA8eWFtYW5lMDd5bmN0QGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMSBKdWwg
MjAyNSAxODozNToyNSArMDkwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0OiBBZGQgc3VwcG9ydCBw
dGVzdApAQCAtNywxNyArNywxNyBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29l
LWNvcmUgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IERhaXN1a2UgWWFtYW5lIDx5YW1hbmUw
N3luY3RAZ21haWwuY29tPgogLS0tCi0gdGVzdC9jaW50bHRzdC9NYWtlZmlsZS5pbiAgfCAyICst
Ci0gdGVzdC9pbnRsdGVzdC9NYWtlZmlsZS5pbiAgfCAyICstCi0gdGVzdC9pbnRsdGVzdC9pbnRs
dGVzdC5jcHAgfCAyICstCi0gdGVzdC9pb3Rlc3QvTWFrZWZpbGUuaW4gICAgfCAyICstCi0gdGVz
dC9sZXRlc3QvTWFrZWZpbGUuaW4gICAgfCAyICstCisgc291cmNlL3Rlc3QvY2ludGx0c3QvTWFr
ZWZpbGUuaW4gIHwgMiArLQorIHNvdXJjZS90ZXN0L2ludGx0ZXN0L01ha2VmaWxlLmluICB8IDIg
Ky0KKyBzb3VyY2UvdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAgfCAyICstCisgc291cmNlL3Rl
c3QvaW90ZXN0L01ha2VmaWxlLmluICAgIHwgMiArLQorIHNvdXJjZS90ZXN0L2xldGVzdC9NYWtl
ZmlsZS5pbiAgICB8IDIgKy0KICA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKIAotZGlmZiAtLWdpdCBhL3Rlc3QvY2ludGx0c3QvTWFrZWZpbGUuaW4gYi90
ZXN0L2NpbnRsdHN0L01ha2VmaWxlLmluCitkaWZmIC0tZ2l0IGEvc291cmNlL3Rlc3QvY2ludGx0
c3QvTWFrZWZpbGUuaW4gYi9zb3VyY2UvdGVzdC9jaW50bHRzdC9NYWtlZmlsZS5pbgogaW5kZXgg
NTUyYTEwNS4uOWNmMzA3MSAxMDA2NDQKLS0tLSBhL3Rlc3QvY2ludGx0c3QvTWFrZWZpbGUuaW4K
LSsrKyBiL3Rlc3QvY2ludGx0c3QvTWFrZWZpbGUuaW4KKy0tLSBhL3NvdXJjZS90ZXN0L2NpbnRs
dHN0L01ha2VmaWxlLmluCisrKysgYi9zb3VyY2UvdGVzdC9jaW50bHRzdC9NYWtlZmlsZS5pbgog
QEAgLTM5LDcgKzM5LDcgQEAgQ1BQRkxBR1MgKz0gLUkkKHRvcF9zcmNkaXIpL2NvbW1vbiAtSSQo
dG9wX3NyY2RpcikvaTE4biAtSSQodG9wX3NyY2RpcikvdG9vbHMvY3QKICBpZmRlZiBRTlhfVEFS
R0VUCiAgREVGUyArPSAtRCdJQ1VfVU5JQ09ERV9WRVJTSU9OPSIkKFVOSUNPREVfVkVSU0lPTiki
JyAtRCdJQ1VfVkVSU0lPTj0iQFZFUlNJT05AIicgLUQnSUNVREFUQV9OQU1FPSIkKElDVURBVEFf
UExBVEZPUk1fTkFNRSkiJyAtRCdVX1RPUFNSQ0RJUj0iL3Zhci9pY3VfdGVzdHMiJyAtRCdVX1RP
UEJVSUxERElSPSIvdmFyL2ljdV90ZXN0cy8iJwpAQCAtMjcsMTAgKzI3LDEwIEBAIGluZGV4IDU1
MmExMDUuLjljZjMwNzEgMTAwNjQ0CiAgZW5kaWYKICBMSUJTID0gJChMSUJDVEVTVEZXKSAkKExJ
QklDVUkxOE4pICQoTElCSUNVVE9PTFVUSUwpICQoTElCSUNVVUMpICQoREVGQVVMVF9MSUJTKSAk
KExJQl9NKQogIAotZGlmZiAtLWdpdCBhL3Rlc3QvaW50bHRlc3QvTWFrZWZpbGUuaW4gYi90ZXN0
L2ludGx0ZXN0L01ha2VmaWxlLmluCi1pbmRleCA1ZDRhMDNiLi5jYTRlNGNkIDEwMDY0NAotLS0t
IGEvdGVzdC9pbnRsdGVzdC9NYWtlZmlsZS5pbgotKysrIGIvdGVzdC9pbnRsdGVzdC9NYWtlZmls
ZS5pbgorZGlmZiAtLWdpdCBhL3NvdXJjZS90ZXN0L2ludGx0ZXN0L01ha2VmaWxlLmluIGIvc291
cmNlL3Rlc3QvaW50bHRlc3QvTWFrZWZpbGUuaW4KK2luZGV4IDJlNDQ4MzEuLmQ1YmQyNDAgMTAw
NjQ0CistLS0gYS9zb3VyY2UvdGVzdC9pbnRsdGVzdC9NYWtlZmlsZS5pbgorKysrIGIvc291cmNl
L3Rlc3QvaW50bHRlc3QvTWFrZWZpbGUuaW4KIEBAIC0zOSw3ICszOSw3IEBAIENQUEZMQUdTICs9
IC1EVU5JU1RSX0ZST01fQ0hBUl9FWFBMSUNJVD0gLURVTklTVFJfRlJPTV9TVFJJTkdfRVhQTElD
SVQ9CiAgaWZkZWYgUU5YX1RBUkdFVAogIERFRlMgKz0gLUQnVV9UT1BTUkNESVI9Ii92YXIvaWN1
X3Rlc3RzIicgLUQnVV9UT1BCVUlMRERJUj0iL3Zhci9pY3VfdGVzdHMvIicKQEAgLTQwLDExICs0
MCwxMSBAQCBpbmRleCA1ZDRhMDNiLi5jYTRlNGNkIDEwMDY0NAogIGVuZGlmCiAgTElCUyA9ICQo
TElCQ1RFU1RGVykgJChMSUJJQ1VJMThOKSAkKExJQklDVVVDKSAkKExJQklDVVRPT0xVVElMKSAk
KERFRkFVTFRfTElCUykgJChMSUJfTSkgJChMSUJfVEhSRUFEKQogIAotZGlmZiAtLWdpdCBhL3Rl
c3QvaW50bHRlc3QvaW50bHRlc3QuY3BwIGIvdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAKLWlu
ZGV4IDM4MDZkMGYuLjMzODI5YjAgMTAwNjQ0Ci0tLS0gYS90ZXN0L2ludGx0ZXN0L2ludGx0ZXN0
LmNwcAotKysrIGIvdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAKLUBAIC0xNzEzLDcgKzE3MTMs
NyBAQCBzdGF0aWMgYm9vbCBmaWxlRXhpc3RzKGNvbnN0IGNoYXIqIGZpbGVOYW1lKSB7CitkaWZm
IC0tZ2l0IGEvc291cmNlL3Rlc3QvaW50bHRlc3QvaW50bHRlc3QuY3BwIGIvc291cmNlL3Rlc3Qv
aW50bHRlc3QvaW50bHRlc3QuY3BwCitpbmRleCBhODU2NzE1Li41Mzc5NDc5IDEwMDY0NAorLS0t
IGEvc291cmNlL3Rlc3QvaW50bHRlc3QvaW50bHRlc3QuY3BwCisrKysgYi9zb3VyY2UvdGVzdC9p
bnRsdGVzdC9pbnRsdGVzdC5jcHAKK0BAIC0xNzA3LDcgKzE3MDcsNyBAQCBzdGF0aWMgYm9vbCBm
aWxlRXhpc3RzKGNvbnN0IGNoYXIqIGZpbGVOYW1lKSB7CiAgICogUmV0dXJucyB0aGUgcGF0aCB0
byBpY3UvdGVzdGRhdGEvCiAgICovCiAgY29uc3QgY2hhciAqSW50bFRlc3Q6OmdldFNoYXJlZFRl
c3REYXRhKFVFcnJvckNvZGUmIGVycikgewpAQCAtNTMsMTAgKzUzLDEwIEBAIGluZGV4IDM4MDZk
MGYuLjMzODI5YjAgMTAwNjQ0CiAgI2RlZmluZSBSRVBPX1RPUCBTT1VSQ0VfVEFSQkFMTF9UT1Ag
Ii4uIiBVX0ZJTEVfU0VQX1NUUklORwogICNkZWZpbmUgRklMRV9OQU1FIFVfRklMRV9TRVBfU1RS
SU5HICJtZXNzYWdlMiIgVV9GSUxFX1NFUF9TVFJJTkcgInZhbGlkLXRlc3RzLmpzb24iCiAgICAg
IGNvbnN0IGNoYXIgKnNyY0RhdGFEaXIgPSBudWxscHRyOwotZGlmZiAtLWdpdCBhL3Rlc3QvaW90
ZXN0L01ha2VmaWxlLmluIGIvdGVzdC9pb3Rlc3QvTWFrZWZpbGUuaW4KK2RpZmYgLS1naXQgYS9z
b3VyY2UvdGVzdC9pb3Rlc3QvTWFrZWZpbGUuaW4gYi9zb3VyY2UvdGVzdC9pb3Rlc3QvTWFrZWZp
bGUuaW4KIGluZGV4IDE2YzUxMGYuLjllZWZmNGIgMTAwNjQ0Ci0tLS0gYS90ZXN0L2lvdGVzdC9N
YWtlZmlsZS5pbgotKysrIGIvdGVzdC9pb3Rlc3QvTWFrZWZpbGUuaW4KKy0tLSBhL3NvdXJjZS90
ZXN0L2lvdGVzdC9NYWtlZmlsZS5pbgorKysrIGIvc291cmNlL3Rlc3QvaW90ZXN0L01ha2VmaWxl
LmluCiBAQCAtMzksNyArMzksNyBAQCBDUFBGTEFHUyArPSAtRFVOSVNUUl9GUk9NX0NIQVJfRVhQ
TElDSVQ9IC1EVU5JU1RSX0ZST01fU1RSSU5HX0VYUExJQ0lUPQogIGlmZGVmIFFOWF9UQVJHRVQK
ICBERUZTICs9IC1EJ1VfVE9QU1JDRElSPSIvdmFyL2ljdV90ZXN0cyInIC1EJ1VfVE9QQlVJTERE
SVI9Ii92YXIvaWN1X3Rlc3RzLyInCkBAIC02NiwxMCArNjYsMTAgQEAgaW5kZXggMTZjNTEwZi4u
OWVlZmY0YiAxMDA2NDQKICBlbmRpZgogIExJQlMgPSAkKExJQkNURVNURlcpICQoTElCSUNVVE9P
TFVUSUwpICQoTElCSUNVSU8pICQoTElCSUNVSTE4TikgJChMSUJJQ1VVQykgJChERUZBVUxUX0xJ
QlMpICQoTElCX00pCiAgCi1kaWZmIC0tZ2l0IGEvdGVzdC9sZXRlc3QvTWFrZWZpbGUuaW4gYi90
ZXN0L2xldGVzdC9NYWtlZmlsZS5pbgorZGlmZiAtLWdpdCBhL3NvdXJjZS90ZXN0L2xldGVzdC9N
YWtlZmlsZS5pbiBiL3NvdXJjZS90ZXN0L2xldGVzdC9NYWtlZmlsZS5pbgogaW5kZXggMTU2Yzg2
Zi4uNTU1YTgyMCAxMDA2NDQKLS0tLSBhL3Rlc3QvbGV0ZXN0L01ha2VmaWxlLmluCi0rKysgYi90
ZXN0L2xldGVzdC9NYWtlZmlsZS5pbgorLS0tIGEvc291cmNlL3Rlc3QvbGV0ZXN0L01ha2VmaWxl
LmluCisrKysgYi9zb3VyY2UvdGVzdC9sZXRlc3QvTWFrZWZpbGUuaW4KIEBAIC0zMCw3ICszMCw3
IEBAIEJVSUxERElSIDo9ICQoQlVJTERESVI6dGVzdFxcY2ludGx0c3QvLi4vLi4vPSkKICBCVUlM
RERJUiA6PSAkKEJVSUxERElSOlRFU1RcXENJTlRMVFNULy4uLy4uLz0pCiAgCkBAIC03OSw2ICs3
OSwzIEBAIGluZGV4IDE1NmM4NmYuLjU1NWE4MjAgMTAwNjQ0CiAgTElCUyA9ICQoTElCSUNVTFgp
ICQoTElCSUNVVUMpICQoTElCSUNVSTE4TikgJChMSUJDVEVTVEZXKSAkKExJQklDVVRPT0xVVElM
KSAkKERFRkFVTFRfTElCUykgJChMSUJfTSkgJChJQ1VMRUhCX0xJQlMpCiAgCiAgQ09NTU9OT0JK
RUNUUyA9IFNpbXBsZUZvbnRJbnN0YW5jZS5vCi0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1Xzc4LjEuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9y
dC9pY3UvaWN1Xzc4LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83OC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pY3UvaWN1Xzc4LjIuYmIKaW5kZXggZWU3MjQ1YzI3Yi4uMzBhYzc3NmUzYyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdV83OC4xLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1zdXBwb3J0L2ljdS9pY3VfNzguMi5iYgpAQCAtMTE2LDcgKzExNiw3IEBAIFNSQ19VUkkg
PSAiJHtCQVNFX1NSQ19VUkl9O25hbWU9Y29kZSBcCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy10YXJn
ZXQgPSAiXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VEVC1mb3It
TGludXgucGF0Y2ggXAogICAgICAgICAgICIKLVNSQ19VUklbY29kZS5zaGEyNTZzdW1dID0gIjYy
MTdmNThjYTM5YjIzMTI3NjA1Y2ZjNmM3ZTBkMzQ3NWZlNGIwZDYzMTU3MDExMzgzZDcxNmNiNDE2
MTc4ODYiCitTUkNfVVJJW2NvZGUuc2hhMjU2c3VtXSA9ICIzZTk5Njg3YjVjNDM1ZDRiMjA5NjMw
ZTJkMmViYjc5OTA2Yzk4NDY4NWU3ODYzNTA3OGI2NzJlMDNjODlkZjM1IgogU1JDX1VSSVtkYXRh
LnNoYTI1NnN1bV0gPSAiZTdiNjUyMjQ0ZjI3MTk0ZTBlYTQ2YTBkMjFjZmM3MTRlZThhODE4ZTFm
ZDgyZDUxYTkzYmM5MTUxNmZkY2Y2NSIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFz
ZXMvdGFnL3JlbGVhc2UtKD9QPHB2ZXI+KD8hLityYykuKykiCi0tIAoyLjQ3LjEKCg==

--===============5631620457121023558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-38969125f342bdb927349a41c661a41277d769d0"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:38969125f342bdb927349a41c661a41277d769d0"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 111 Local 95 Mirrors 0 Missed 16 Current 423 (85% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 533 of 534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 534 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-native-78.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1503 of 1539 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch)
NOTE: recipe icu-native-78.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1505 of 1539 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch)
NOTE: recipe icu-78.2-r0: task do_fetch: Started
NOTE: recipe icu-native-78.2-r0: task do_fetch: Started
WARNING: icu-78.2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-78.2/icu4c-78.2-data.zip;name=data - will attempt other sources if available
WARNING: icu-native-78.2-r0 do_fetch: Checksum failure encountered with download of https://github.com/unicode-org/icu/releases/download/release-78.2/icu4c-78.2-data.zip;name=data - will attempt other sources if available
NOTE: recipe icu-78.2-r0: task do_fetch: Failed
NOTE: recipe icu-native-78.2-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 1505 tasks of which 1503 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260116010713.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260116010713.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/icu/78.2/temp/log.do_fetch.3336543
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/icu-native/78.2/temp/log.do_fetch.3336609
Summary: There were 2 WARNING messages.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: icu-78.2-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-78.2/icu4c-78.2-data.zip;name=data'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/icu4c-78.2-data.zip.tmp' has sha256 checksum '582968cf174c9498b2046b4f4e7f786def5f18222bd8d98432d7a29399c38c70' when 'e7b652244f27194e0ea46a0d21cfc714ee8a818e1fd82d51a93bc91516fdcf65' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "582968cf174c9498b2046b4f4e7f786def5f18222bd8d98432d7a29399c38c70"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-78.2-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-78.2/icu4c-78.2-data.zip;name=data')
ERROR: icu-native-78.2-r0 do_fetch: Fetcher failure for URL: 'https://github.com/unicode-org/icu/releases/download/release-78.2/icu4c-78.2-data.zip;name=data'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/icu4c-78.2-data.zip.tmp' has sha256 checksum '582968cf174c9498b2046b4f4e7f786def5f18222bd8d98432d7a29399c38c70' when 'e7b652244f27194e0ea46a0d21cfc714ee8a818e1fd82d51a93bc91516fdcf65' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[data.sha256sum] = "582968cf174c9498b2046b4f4e7f786def5f18222bd8d98432d7a29399c38c70"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: icu-native-78.2-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://github.com/unicode-org/icu/releases/download/release-78.2/icu4c-78.2-data.zip;name=data')
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/icu/78.2/temp/log.do_fetch.3336543
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/icu-native/78.2/temp/log.do_fetch.3336609
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch) failed with exit code '1'

--===============5631620457121023558==--

