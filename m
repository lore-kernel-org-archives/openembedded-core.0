Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A25BE65281
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:09 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29048.1769951560882154712
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=p997DYuO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jKN0eJ7s;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955d40e-85282387-5eb7-45ac-ad07-b8c537fbd0c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=71MBrTk9AkbAG8ytaKHwvl2KXbDE5AsLTWtHYnINS8E=;
	b=p997DYuOmr9ZU7JJXaOiruL1FZ6MfuUZyxZxUIXQsMJQGwTpUUe8N73ptdH68yva
	/sSt8akWi2EEyHKxyRyg4cmWHi1NpzoTwxiKqhQ3cbEB7LQaPPzwQgYfBYrSoPpJWTa
	43PmAk5+aPpToBic81d8pL4c7GSeSketBnp+K9GE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=71MBrTk9AkbAG8ytaKHwvl2KXbDE5AsLTWtHYnINS8E=;
	b=jKN0eJ7sSo3ShFvJpo2u37Wu5i9LwW544eU0tbrf5Gf0XARNaST34wjPEJCSMGBr
	dgNnptoUHSW0t0RCyjqJgdgipqd+AasHBaZwiEwkiNKMn/cnlF4cDvAchhqYYl9geVx
	vz2gG4XyQpiuQywGspyIPIST22RYcPAInBGxzq9o=
Content-Type: multipart/mixed; boundary="===============4246876165282040367=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] icu: upgrading to 78.2 FAILED
Message-ID: <0101019c1955d40e-85282387-5eb7-45ac-ad07-b8c537fbd0c0-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:13:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230330

--===============4246876165282040367==
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
From 77003055b513a874df64f0cb22e85fa4b8712282 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 13:01:21 +0000
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
index c0e9e2806b..97188cd8fe 100644
--- a/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
+++ b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linux.patch
@@ -1,4 +1,4 @@
-From 0f4e9eee64bd4220aa4fae1ab4f7bbf10b87cd69 Mon Sep 17 00:00:00 2001
+From 11ff573adf86121d3cf72eb449058ddccfea1a43 Mon Sep 17 00:00:00 2001
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
index e2e9546679..43b5308b20 100644
--- a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
+++ b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
@@ -1,20 +1,21 @@
-From 4b3e6888c2aaba6465f1bc96f61b17a2513050f3 Mon Sep 17 00:00:00 2001
+From c82d7c25b4d92ed5996ff91b9383777143a1ac50 Mon Sep 17 00:00:00 2001
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
index 484e1c7f6f..1288787757 100644
--- a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
+++ b/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
@@ -1,4 +1,4 @@
-From 4779f798463d673dd74623979ec93141eb60d07a Mon Sep 17 00:00:00 2001
+From bdbe749d24ac44b9d4af6029d38834a12830056e Mon Sep 17 00:00:00 2001
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
index a25285fb54..d1568b14cf 100644
--- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
+++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
@@ -1,4 +1,4 @@
-From cf55c077b77b7a219502364eaadf12c074ab005e Mon Sep 17 00:00:00 2001
+From fc6c586bdf04fa2ac60af01e74b295b94b1d9020 Mon Sep 17 00:00:00 2001
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
index 88350c0db5..db34c3c854 100644
--- a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
+++ b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
@@ -1,4 +1,4 @@
-From 783d9e0d3d7824fbca53c2c3a80e8e5e23eacc82 Mon Sep 17 00:00:00 2001
+From 4dbcb7a41067fbebbef4d8916b546d97e5d2e4f4 Mon Sep 17 00:00:00 2001
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


--===============4246876165282040367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.3.99+snapshot-4285e8d3f40a40c3b7e6acb5a9bc76214827c2f3"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:4285e8d3f40a40c3b7e6acb5a9bc76214827c2f3"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 114 Local 99 Mirrors 0 Missed 15 Current 420 (86% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 532 of 534 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_recipe_qa_setscene)
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
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201130104.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201130104.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/icu/78.2/temp/log.do_fetch.1465367
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/icu-native/78.2/temp/log.do_fetch.1465382
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/icu/78.2/temp/log.do_fetch.1465367
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/icu-native/78.2/temp/log.do_fetch.1465382
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.2.bb:do_fetch) failed with exit code '1'

--===============4246876165282040367==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-icu-upgrade-78.1-78.2.patch"

RnJvbSA3NzAwMzA1NWI1MTNhODc0ZGY2NGYwY2IyMmU4NWZhNGI4NzEyMjgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMzowMToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlj
dTogdXBncmFkZSA3OC4xIC0+IDc4LjIKCi0tLQogLi4uLzAwMDEtRGlzYWJsZS1MREZMQUdTSUNV
RFQtZm9yLUxpbnV4LnBhdGNoIHwgMTAgKystLQogLi4ubmljb2RlU3RyaW5nVGVzdC1UZXN0TGFy
Z2VNZW1vcnktb24tLnBhdGNoIHwgMTggKysrLS0tLQogLi4udHB1dC1jb21wYXRpYmxlLXdpdGgt
QXV0b21ha2UtZm9ybWF0LnBhdGNoIHwgMzkgKysrKysrKy0tLS0tLS0KIC4uLi9pY3UvMDAwMS1p
Y3UtQWRkZWQtYXJtZWItc3VwcG9ydC5wYXRjaCAgICB8IDEwICsrLS0KIC4uLi9pY3UvaWN1LzAw
MDEtdGVzdC1BZGQtc3VwcG9ydC1wdGVzdC5wYXRjaCB8IDUxICsrKysrKysrKy0tLS0tLS0tLS0K
IC4uLi9pY3Uve2ljdV83OC4xLmJiID0+IGljdV83OC4yLmJifSAgICAgICAgICB8ICAyICstCiA2
IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKyksIDY5IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS97aWN1Xzc4LjEuYmIgPT4gaWN1Xzc4LjIuYmJ9ICg5
OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAxLURpc2Fi
bGUtTERGTEFHU0lDVURULWZvci1MaW51eC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lj
dS9pY3UvMDAwMS1EaXNhYmxlLUxERkxBR1NJQ1VEVC1mb3ItTGludXgucGF0Y2gKaW5kZXggYzBl
OWUyODA2Yi4uOTcxODhjZDhmZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1
L2ljdS8wMDAxLURpc2FibGUtTERGTEFHU0lDVURULWZvci1MaW51eC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtRGlzYWJsZS1MREZMQUdTSUNVRFQtZm9yLUxp
bnV4LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwZjRlOWVlZTY0YmQ0MjIwYWE0ZmFlMWFi
NGY3YmJmMTBiODdjZDY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxMWZmNTczYWRm
ODYxMjFkM2NmNzJlYjQ0OTA1OGRkY2NmZWExYTQzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNhdCwgMTUgRmViIDIw
MTQgMjE6MDY6NDIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJsZSBMREZMQUdTSUNVRFQg
Zm9yIExpbnV4CkBAIC03LDEzICs3LDEzIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbIE9FIENvbmZpZ3VyYXRpb24gXQogCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmto
ZW1AZ21haWwuY29tPgogLS0tCi0gY29uZmlnL21oLWxpbnV4IHwgMiArLQorIHNvdXJjZS9jb25m
aWcvbWgtbGludXggfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiAKLWRpZmYgLS1naXQgYS9jb25maWcvbWgtbGludXggYi9jb25maWcvbWgtbGlu
dXgKK2RpZmYgLS1naXQgYS9zb3VyY2UvY29uZmlnL21oLWxpbnV4IGIvc291cmNlL2NvbmZpZy9t
aC1saW51eAogaW5kZXggNTNkNjc4MC4uYjYyMjUxMyAxMDA2NDQKLS0tLSBhL2NvbmZpZy9taC1s
aW51eAotKysrIGIvY29uZmlnL21oLWxpbnV4CistLS0gYS9zb3VyY2UvY29uZmlnL21oLWxpbnV4
CisrKysgYi9zb3VyY2UvY29uZmlnL21oLWxpbnV4CiBAQCAtMjMsNyArMjMsNyBAQCBMRF9SUEFU
SD0gLVdsLC16b3JpZ2luLC1ycGF0aCwnJCQnT1JJR0lOCiAgTERfUlBBVEhfUFJFID0gLVdsLC1y
cGF0aCwKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1J
Q1UtMjMxMjAtTWFzay1Vbmljb2RlU3RyaW5nVGVzdC1UZXN0TGFyZ2VNZW1vcnktb24tLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAxLUlDVS0yMzEyMC1NYXNrLVVuaWNv
ZGVTdHJpbmdUZXN0LVRlc3RMYXJnZU1lbW9yeS1vbi0ucGF0Y2gKaW5kZXggZTJlOTU0NjY3OS4u
NDNiNTMwOGIyMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAx
LUlDVS0yMzEyMC1NYXNrLVVuaWNvZGVTdHJpbmdUZXN0LVRlc3RMYXJnZU1lbW9yeS1vbi0ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaWN1L2ljdS8wMDAxLUlDVS0yMzEyMC1NYXNr
LVVuaWNvZGVTdHJpbmdUZXN0LVRlc3RMYXJnZU1lbW9yeS1vbi0ucGF0Y2gKQEAgLTEsMjAgKzEs
MjEgQEAKLUZyb20gNGIzZTY4ODhjMmFhYmE2NDY1ZjFiYzk2ZjYxYjE3YTI1MTMwNTBmMyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzgyZDdjMjViNGQ5MmVkNTk5NmZmOTFiOTM4Mzc3
NzE0M2ExYWM1MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERhdmlkIFNlaWZlcnQg
PHNvYXBAZ2VudG9vLm9yZz4KIERhdGU6IFNhdCwgMjEgSnVuIDIwMjUgMTI6Mjg6MTUgKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gSUNVLTIzMTIwIE1hc2sgVW5pY29kZVN0cmluZ1Rlc3Q6OlRlc3RM
YXJnZU1lbW9yeSBvbiAzMi1iaXQKKwogIHBsYXRmb3JtcwogCiBVcHN0cmVhbS1TdGF0dXM6IFN1
Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL3VuaWNvZGUtb3JnL2ljdS9wdWxsLzM0OTZdCiBT
aWduZWQtb2ZmLWJ5OiBEYWlzdWtlIFlhbWFuZSA8eWFtYW5lMDd5bmN0QGdtYWlsLmNvbT4KIC0t
LQotIHRlc3QvaW50bHRlc3QvdXN0cnRlc3QuY3BwIHwgMiArLQorIHNvdXJjZS90ZXN0L2ludGx0
ZXN0L3VzdHJ0ZXN0LmNwcCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKIAotZGlmZiAtLWdpdCBhL3Rlc3QvaW50bHRlc3QvdXN0cnRlc3QuY3Bw
IGIvdGVzdC9pbnRsdGVzdC91c3RydGVzdC5jcHAKLWluZGV4IDU2OTc2YjNlM2QyLi4yNjIyNWY1
YjViNSAxMDA2NDQKLS0tLSBhL3Rlc3QvaW50bHRlc3QvdXN0cnRlc3QuY3BwCi0rKysgYi90ZXN0
L2ludGx0ZXN0L3VzdHJ0ZXN0LmNwcAotQEAgLTIzNTMsNyArMjM1Myw3IEBAIHZvaWQgVW5pY29k
ZVN0cmluZ1Rlc3Q6OlRlc3RVbmljb2RlU3RyaW5nSW5zZXJ0QXBwZW5kVG9TZWxmKCkgeworZGlm
ZiAtLWdpdCBhL3NvdXJjZS90ZXN0L2ludGx0ZXN0L3VzdHJ0ZXN0LmNwcCBiL3NvdXJjZS90ZXN0
L2ludGx0ZXN0L3VzdHJ0ZXN0LmNwcAoraW5kZXggM2YzODJjNS4uNjA0OTMzMiAxMDA2NDQKKy0t
LSBhL3NvdXJjZS90ZXN0L2ludGx0ZXN0L3VzdHJ0ZXN0LmNwcAorKysrIGIvc291cmNlL3Rlc3Qv
aW50bHRlc3QvdXN0cnRlc3QuY3BwCitAQCAtMjM3NSw3ICsyMzc1LDcgQEAgdm9pZCBVbmljb2Rl
U3RyaW5nVGVzdDo6VGVzdFVuaWNvZGVTdHJpbmdJbnNlcnRBcHBlbmRUb1NlbGYoKSB7CiAgfQog
IAogIHZvaWQgVW5pY29kZVN0cmluZ1Rlc3Q6OlRlc3RMYXJnZU1lbW9yeSgpIHsKQEAgLTIzLDYg
KzI0LDMgQEAgaW5kZXggNTY5NzZiM2UzZDIuLjI2MjI1ZjViNWI1IDEwMDY0NAogICAgICBpZihx
dWljaykgeyByZXR1cm47IH0KICAgICAgSWN1VGVzdEVycm9yQ29kZSBzdGF0dXMoKnRoaXMsICJU
ZXN0TGFyZ2VNZW1vcnkiKTsKICAgICAgY29uc3RleHByIHVpbnQzMl90IGxlbiA9IDIxNDc0ODM2
NDM7Ci0tLSAKLTIuNDMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3Uv
aWN1LzAwMDEtTWFrZS1JQ1UtdGVzdC1vdXRwdXQtY29tcGF0aWJsZS13aXRoLUF1dG9tYWtlLWZv
cm1hdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1NYWtlLUlDVS10
ZXN0LW91dHB1dC1jb21wYXRpYmxlLXdpdGgtQXV0b21ha2UtZm9ybWF0LnBhdGNoCmluZGV4IDQ4
NGUxYzdmNmYuLjEyODg3ODc3NTcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lj
dS9pY3UvMDAwMS1NYWtlLUlDVS10ZXN0LW91dHB1dC1jb21wYXRpYmxlLXdpdGgtQXV0b21ha2Ut
Zm9ybWF0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1NYWtl
LUlDVS10ZXN0LW91dHB1dC1jb21wYXRpYmxlLXdpdGgtQXV0b21ha2UtZm9ybWF0LnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA0Nzc5Zjc5ODQ2M2Q2NzNkZDc0NjIzOTc5ZWM5MzE0MWViNjBk
MDdhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiZGJlNzQ5ZDI0YWM0NGI5ZDRhZjYw
MjlkMzg4MzRhMTI4MzAwNTZlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSmlheWlu
ZyBTb25nIDxqaWF5aW5nLnNvbmcuY25Ad2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwgMjEgTm92
IDIwMjUgMTA6NDc6NTkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gTWFrZSBJQ1UgdGVzdCBvdXRw
dXQgY29tcGF0aWJsZSB3aXRoIEF1dG9tYWtlIGZvcm1hdApAQCAtMTYsMTYgKzE2LDE2IEBAIFVw
c3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vdW5pY29kZS1vcmcv
aWN1L3B1bGwvMzc2NF0KIAogU2lnbmVkLW9mZi1ieTogSmlheWluZyBTb25nIDxqaWF5aW5nLnNv
bmcuY25Ad2luZHJpdmVyLmNvbT4KIC0tLQotIGNvbmZpZ3VyZS5hYyAgICAgICAgICAgICAgIHwg
MTcgKysrKysrKysrKysrKysrKysKLSB0ZXN0L2ludGx0ZXN0L2ludGx0ZXN0LmNwcCB8IDEwICsr
KysrKysrKy0KLSB0b29scy9jdGVzdGZ3L2N0ZXN0LmMgICAgICB8ICA5ICsrKysrKysrLQorIHNv
dXJjZS9jb25maWd1cmUuYWMgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysrCisg
c291cmNlL3Rlc3QvaW50bHRlc3QvaW50bHRlc3QuY3BwIHwgMTAgKysrKysrKysrLQorIHNvdXJj
ZS90b29scy9jdGVzdGZ3L2N0ZXN0LmMgICAgICB8ICA5ICsrKysrKysrLQogIDMgZmlsZXMgY2hh
bmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAotZGlmZiAtLWdpdCBhL2Nv
bmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggZGE0ZjE3MC4uNTE0ZmEwYyAxMDA2NDQK
LS0tLSBhL2NvbmZpZ3VyZS5hYwotKysrIGIvY29uZmlndXJlLmFjCi1AQCAtMTE2NSw2ICsxMTY1
LDIxIEBAIElmIHNldCwgaXQgd2lsbCBSRVBMQUNFIGFueSBhdXRvbWF0aWMgbGlzdCBvZiBsaWJy
YXJpZXMuXSwKK2RpZmYgLS1naXQgYS9zb3VyY2UvY29uZmlndXJlLmFjIGIvc291cmNlL2NvbmZp
Z3VyZS5hYworaW5kZXggOGZmYWNmOC4uOWJhM2I0ZSAxMDA2NDQKKy0tLSBhL3NvdXJjZS9jb25m
aWd1cmUuYWMKKysrKyBiL3NvdXJjZS9jb25maWd1cmUuYWMKK0BAIC0xMTAzLDYgKzExMDMsMjEg
QEAgSWYgc2V0LCBpdCB3aWxsIFJFUExBQ0UgYW55IGF1dG9tYXRpYyBsaXN0IG9mIGxpYnJhcmll
cy5dLAogIAkJKikgQUNfTVNHX0VSUk9SKGJhZCB2YWx1ZSAke2VuYWJsZXZhbH0gZm9yIC0tZW5h
YmxlLXNhbXBsZXMpIDs7CiAgCQllc2FjXSwKICAJc2FtcGxlcz10cnVlKQpAQCAtNDcsMTcgKzQ3
LDE3IEBAIGluZGV4IGRhNGYxNzAuLjUxNGZhMGMgMTAwNjQ0CiAgSUNVX0NPTkRJVElPTkFMKFNB
TVBMRVMsIHRlc3QgIiRzYW1wbGVzIiA9IHRydWUpCiAgCiAgSUNVREFUQV9DSEFSPSRVX0VORElB
Tl9DSEFSCi1AQCAtMTQyOCwzICsxNDQzLDUgQEAgdGhlbgorQEAgLTEzNjYsMyArMTM4MSw1IEBA
IHRoZW4KICBmaQogIAogICRhc191bnNldCBfQ1hYX0NYWFNVRkZJWAogKwogKwotZGlmZiAtLWdp
dCBhL3Rlc3QvaW50bHRlc3QvaW50bHRlc3QuY3BwIGIvdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5j
cHAKLWluZGV4IDMzODI5YjAuLmJmM2VmNTYgMTAwNjQ0Ci0tLS0gYS90ZXN0L2ludGx0ZXN0L2lu
dGx0ZXN0LmNwcAotKysrIGIvdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAKLUBAIC04MzAsMTEg
KzgzMCwxOSBAQCBVQm9vbCBJbnRsVGVzdDo6cnVuVGVzdExvb3AoIGNoYXIqIHRlc3RuYW1lLCBj
aGFyKiBwYXIsIGNoYXIgKmJhc2VOYW1lICkKK2RpZmYgLS1naXQgYS9zb3VyY2UvdGVzdC9pbnRs
dGVzdC9pbnRsdGVzdC5jcHAgYi9zb3VyY2UvdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAKK2lu
ZGV4IDUzNzk0NzkuLjU3OWRjYmMgMTAwNjQ0CistLS0gYS9zb3VyY2UvdGVzdC9pbnRsdGVzdC9p
bnRsdGVzdC5jcHAKKysrKyBiL3NvdXJjZS90ZXN0L2ludGx0ZXN0L2ludGx0ZXN0LmNwcAorQEAg
LTgyNCwxMSArODI0LDE5IEBAIFVCb29sIEludGxUZXN0OjpydW5UZXN0TG9vcCggY2hhciogdGVz
dG5hbWUsIGNoYXIqIHBhciwgY2hhciAqYmFzZU5hbWUgKQogICAgICAgICAgICAgIHNhdmVCYXNl
TG9jWzBdPTA7IC8qIHJlc2V0IHBhdGggKi8KICAgICAgICAgICAgICAKICAgICAgICAgICAgICBp
ZiAobGFzdEVycm9yQ291bnQgPT0gZXJyb3JDb3VudCkgewpAQCAtNzgsMTAgKzc4LDEwIEBAIGlu
ZGV4IDMzODI5YjAuLmJmM2VmNTYgMTAwNjQ0CiAgICAgICAgICAgICAgICAgIGlmKCFub190aW1l
KSBzdHJfdGltZURlbHRhKG1zZytzdHJsZW4obXNnKSx0aW1lU3RvcC10aW1lU3RhcnQpOwogIAog
ICAgICAgICAgICAgICAgICBmb3IoaW50IGk9MDtpPExMX2luZGVudGxldmVsO2krKykgewotZGlm
ZiAtLWdpdCBhL3Rvb2xzL2N0ZXN0ZncvY3Rlc3QuYyBiL3Rvb2xzL2N0ZXN0ZncvY3Rlc3QuYwor
ZGlmZiAtLWdpdCBhL3NvdXJjZS90b29scy9jdGVzdGZ3L2N0ZXN0LmMgYi9zb3VyY2UvdG9vbHMv
Y3Rlc3Rmdy9jdGVzdC5jCiBpbmRleCA3NjM0NTI2Li5jMmUxMWRkIDEwMDY0NAotLS0tIGEvdG9v
bHMvY3Rlc3Rmdy9jdGVzdC5jCi0rKysgYi90b29scy9jdGVzdGZ3L2N0ZXN0LmMKKy0tLSBhL3Nv
dXJjZS90b29scy9jdGVzdGZ3L2N0ZXN0LmMKKysrKyBiL3NvdXJjZS90b29scy9jdGVzdGZ3L2N0
ZXN0LmMKIEBAIC00MTMsOSArNDEzLDE2IEBAIHN0YXRpYyB2b2lkIGl0ZXJhdGVUZXN0c1dpdGhM
ZXZlbCAoIGNvbnN0IFRlc3ROb2RlKiByb290LAogICAgICAgICAgY3Rlc3RfeG1sX3Rlc3RjYXNl
KHBhdGhUb0Z1bmN0aW9uLCBwYXRoVG9GdW5jdGlvbiwgdGltZVNlY29uZHMsIChteUVSUk9SX0NP
VU5UIT1FUlJPUl9DT1VOVCk/ImVycm9yIjpOVUxMKTsKICAKQEAgLTEwMCw2ICsxMDAsMyBAQCBp
bmRleCA3NjM0NTI2Li5jMmUxMWRkIDEwMDY0NAogICAgICAgICAgICBpZighT05fTElORSkgeyAv
KiBoYWQgc29tZSBvdXRwdXQgKi8KICAgICAgICAgICAgICBpbnQgc3BhY2VzID0gRkxBR19JTkRF
TlQtKGRlcHRoLTEpOwogICAgICAgICAgICAgIGxvZ190ZXN0aW5mb19pKCJ9ICUqc1tPS10gIiwg
c3BhY2VzLCAiLS0tIik7Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c3VwcG9ydC9pY3UvaWN1LzAwMDEtaWN1LUFkZGVkLWFybWViLXN1cHBvcnQucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtaWN1LUFkZGVkLWFybWViLXN1cHBvcnQucGF0
Y2gKaW5kZXggYTI1Mjg1ZmI1NC4uZDE1NjhiMTRjZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvaWN1L2ljdS8wMDAxLWljdS1BZGRlZC1hcm1lYi1zdXBwb3J0LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3UvMDAwMS1pY3UtQWRkZWQtYXJtZWItc3VwcG9y
dC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gY2Y1NWMwNzdiNzdiN2EyMTk1MDIzNjRlYWFk
ZjEyYzA3NGFiMDA1ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZmM2YzU4NmJkZjA0
ZmEyYWM2MGFmMDFlNzRiMjk1Yjk0YjFkOTAyMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IExlaSBNYW9odWkgPGxlaW1hb2h1aUBjbi5mdWppdHN1LmNvbT4KIERhdGU6IFdlZCwgOCBN
YXkgMjAxOSAxNDo0MjozMCArMDkwMAogU3ViamVjdDogW1BBVENIXSBpY3U6IEFkZGVkIGFybWVi
IHN1cHBvcnQuCkBAIC05LDEzICs5LDEzIEBAIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwogCiBT
aWduZWQtb2ZmLWJ5OiBMZWkgTWFvaHVpIDxsZWltYW9odWlAY24uZnVqaXRzdS5jb20+CiAtLS0K
LSBpMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxzLmggfCAyICstCisgc291cmNlL2kxOG4vZG91
YmxlLWNvbnZlcnNpb24tdXRpbHMuaCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAotZGlmZiAtLWdpdCBhL2kxOG4vZG91YmxlLWNvbnZlcnNp
b24tdXRpbHMuaCBiL2kxOG4vZG91YmxlLWNvbnZlcnNpb24tdXRpbHMuaAorZGlmZiAtLWdpdCBh
L3NvdXJjZS9pMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxzLmggYi9zb3VyY2UvaTE4bi9kb3Vi
bGUtY29udmVyc2lvbi11dGlscy5oCiBpbmRleCAzMDM2NjhmLi43ZDg1OWRjIDEwMDY0NAotLS0t
IGEvaTE4bi9kb3VibGUtY29udmVyc2lvbi11dGlscy5oCi0rKysgYi9pMThuL2RvdWJsZS1jb252
ZXJzaW9uLXV0aWxzLmgKKy0tLSBhL3NvdXJjZS9pMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxz
LmgKKysrKyBiL3NvdXJjZS9pMThuL2RvdWJsZS1jb252ZXJzaW9uLXV0aWxzLmgKIEBAIC0xNDYs
NyArMTQ2LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIqKiBhcmd2KSB7CiAgLy8KICAvLyBJ
ZiBpdCBwcmludHMgImNvcnJlY3QiIHRoZW4gdGhlIGFyY2hpdGVjdHVyZSBzaG91bGQgYmUgaGVy
ZSwgaW4gdGhlICJjb3JyZWN0IiBzZWN0aW9uLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvaWN1L2ljdS8wMDAxLXRlc3QtQWRkLXN1cHBvcnQtcHRlc3QucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtdGVzdC1BZGQtc3VwcG9ydC1wdGVzdC5wYXRjaApp
bmRleCA4ODM1MGMwZGI1Li5kYjM0YzNjODU0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9pY3UvaWN1LzAwMDEtdGVzdC1BZGQtc3VwcG9ydC1wdGVzdC5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1LzAwMDEtdGVzdC1BZGQtc3VwcG9ydC1wdGVzdC5wYXRj
aApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzgzZDllMGQzZDc4MjRmYmNhNTNjMmMzYTgwZThlNWUy
M2VhY2M4MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNGRiY2I3YTQxMDY3ZmJlYmJl
ZjRkODkxNmI1NDZkOTdlNWQyZTRmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERh
aXN1a2UgWWFtYW5lIDx5YW1hbmUwN3luY3RAZ21haWwuY29tPgogRGF0ZTogVHVlLCAxIEp1bCAy
MDI1IDE4OjM1OjI1ICswOTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3Q6IEFkZCBzdXBwb3J0IHB0
ZXN0CkBAIC03LDE3ICs3LDE3IEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ut
Y29yZSBzcGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogRGFpc3VrZSBZYW1hbmUgPHlhbWFuZTA3
eW5jdEBnbWFpbC5jb20+CiAtLS0KLSB0ZXN0L2NpbnRsdHN0L01ha2VmaWxlLmluICB8IDIgKy0K
LSB0ZXN0L2ludGx0ZXN0L01ha2VmaWxlLmluICB8IDIgKy0KLSB0ZXN0L2ludGx0ZXN0L2ludGx0
ZXN0LmNwcCB8IDIgKy0KLSB0ZXN0L2lvdGVzdC9NYWtlZmlsZS5pbiAgICB8IDIgKy0KLSB0ZXN0
L2xldGVzdC9NYWtlZmlsZS5pbiAgICB8IDIgKy0KKyBzb3VyY2UvdGVzdC9jaW50bHRzdC9NYWtl
ZmlsZS5pbiAgfCAyICstCisgc291cmNlL3Rlc3QvaW50bHRlc3QvTWFrZWZpbGUuaW4gIHwgMiAr
LQorIHNvdXJjZS90ZXN0L2ludGx0ZXN0L2ludGx0ZXN0LmNwcCB8IDIgKy0KKyBzb3VyY2UvdGVz
dC9pb3Rlc3QvTWFrZWZpbGUuaW4gICAgfCAyICstCisgc291cmNlL3Rlc3QvbGV0ZXN0L01ha2Vm
aWxlLmluICAgIHwgMiArLQogIDUgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQogCi1kaWZmIC0tZ2l0IGEvdGVzdC9jaW50bHRzdC9NYWtlZmlsZS5pbiBiL3Rl
c3QvY2ludGx0c3QvTWFrZWZpbGUuaW4KK2RpZmYgLS1naXQgYS9zb3VyY2UvdGVzdC9jaW50bHRz
dC9NYWtlZmlsZS5pbiBiL3NvdXJjZS90ZXN0L2NpbnRsdHN0L01ha2VmaWxlLmluCiBpbmRleCA1
NTJhMTA1Li45Y2YzMDcxIDEwMDY0NAotLS0tIGEvdGVzdC9jaW50bHRzdC9NYWtlZmlsZS5pbgot
KysrIGIvdGVzdC9jaW50bHRzdC9NYWtlZmlsZS5pbgorLS0tIGEvc291cmNlL3Rlc3QvY2ludGx0
c3QvTWFrZWZpbGUuaW4KKysrKyBiL3NvdXJjZS90ZXN0L2NpbnRsdHN0L01ha2VmaWxlLmluCiBA
QCAtMzksNyArMzksNyBAQCBDUFBGTEFHUyArPSAtSSQodG9wX3NyY2RpcikvY29tbW9uIC1JJCh0
b3Bfc3JjZGlyKS9pMThuIC1JJCh0b3Bfc3JjZGlyKS90b29scy9jdAogIGlmZGVmIFFOWF9UQVJH
RVQKICBERUZTICs9IC1EJ0lDVV9VTklDT0RFX1ZFUlNJT049IiQoVU5JQ09ERV9WRVJTSU9OKSIn
IC1EJ0lDVV9WRVJTSU9OPSJAVkVSU0lPTkAiJyAtRCdJQ1VEQVRBX05BTUU9IiQoSUNVREFUQV9Q
TEFURk9STV9OQU1FKSInIC1EJ1VfVE9QU1JDRElSPSIvdmFyL2ljdV90ZXN0cyInIC1EJ1VfVE9Q
QlVJTERESVI9Ii92YXIvaWN1X3Rlc3RzLyInCkBAIC0yNywxMCArMjcsMTAgQEAgaW5kZXggNTUy
YTEwNS4uOWNmMzA3MSAxMDA2NDQKICBlbmRpZgogIExJQlMgPSAkKExJQkNURVNURlcpICQoTElC
SUNVSTE4TikgJChMSUJJQ1VUT09MVVRJTCkgJChMSUJJQ1VVQykgJChERUZBVUxUX0xJQlMpICQo
TElCX00pCiAgCi1kaWZmIC0tZ2l0IGEvdGVzdC9pbnRsdGVzdC9NYWtlZmlsZS5pbiBiL3Rlc3Qv
aW50bHRlc3QvTWFrZWZpbGUuaW4KLWluZGV4IDVkNGEwM2IuLmNhNGU0Y2QgMTAwNjQ0Ci0tLS0g
YS90ZXN0L2ludGx0ZXN0L01ha2VmaWxlLmluCi0rKysgYi90ZXN0L2ludGx0ZXN0L01ha2VmaWxl
LmluCitkaWZmIC0tZ2l0IGEvc291cmNlL3Rlc3QvaW50bHRlc3QvTWFrZWZpbGUuaW4gYi9zb3Vy
Y2UvdGVzdC9pbnRsdGVzdC9NYWtlZmlsZS5pbgoraW5kZXggMmU0NDgzMS4uZDViZDI0MCAxMDA2
NDQKKy0tLSBhL3NvdXJjZS90ZXN0L2ludGx0ZXN0L01ha2VmaWxlLmluCisrKysgYi9zb3VyY2Uv
dGVzdC9pbnRsdGVzdC9NYWtlZmlsZS5pbgogQEAgLTM5LDcgKzM5LDcgQEAgQ1BQRkxBR1MgKz0g
LURVTklTVFJfRlJPTV9DSEFSX0VYUExJQ0lUPSAtRFVOSVNUUl9GUk9NX1NUUklOR19FWFBMSUNJ
VD0KICBpZmRlZiBRTlhfVEFSR0VUCiAgREVGUyArPSAtRCdVX1RPUFNSQ0RJUj0iL3Zhci9pY3Vf
dGVzdHMiJyAtRCdVX1RPUEJVSUxERElSPSIvdmFyL2ljdV90ZXN0cy8iJwpAQCAtNDAsMTEgKzQw
LDExIEBAIGluZGV4IDVkNGEwM2IuLmNhNGU0Y2QgMTAwNjQ0CiAgZW5kaWYKICBMSUJTID0gJChM
SUJDVEVTVEZXKSAkKExJQklDVUkxOE4pICQoTElCSUNVVUMpICQoTElCSUNVVE9PTFVUSUwpICQo
REVGQVVMVF9MSUJTKSAkKExJQl9NKSAkKExJQl9USFJFQUQpCiAgCi1kaWZmIC0tZ2l0IGEvdGVz
dC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAgYi90ZXN0L2ludGx0ZXN0L2ludGx0ZXN0LmNwcAotaW5k
ZXggMzgwNmQwZi4uMzM4MjliMCAxMDA2NDQKLS0tLSBhL3Rlc3QvaW50bHRlc3QvaW50bHRlc3Qu
Y3BwCi0rKysgYi90ZXN0L2ludGx0ZXN0L2ludGx0ZXN0LmNwcAotQEAgLTE3MTMsNyArMTcxMyw3
IEBAIHN0YXRpYyBib29sIGZpbGVFeGlzdHMoY29uc3QgY2hhciogZmlsZU5hbWUpIHsKK2RpZmYg
LS1naXQgYS9zb3VyY2UvdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAgYi9zb3VyY2UvdGVzdC9p
bnRsdGVzdC9pbnRsdGVzdC5jcHAKK2luZGV4IGE4NTY3MTUuLjUzNzk0NzkgMTAwNjQ0CistLS0g
YS9zb3VyY2UvdGVzdC9pbnRsdGVzdC9pbnRsdGVzdC5jcHAKKysrKyBiL3NvdXJjZS90ZXN0L2lu
dGx0ZXN0L2ludGx0ZXN0LmNwcAorQEAgLTE3MDcsNyArMTcwNyw3IEBAIHN0YXRpYyBib29sIGZp
bGVFeGlzdHMoY29uc3QgY2hhciogZmlsZU5hbWUpIHsKICAgKiBSZXR1cm5zIHRoZSBwYXRoIHRv
IGljdS90ZXN0ZGF0YS8KICAgKi8KICBjb25zdCBjaGFyICpJbnRsVGVzdDo6Z2V0U2hhcmVkVGVz
dERhdGEoVUVycm9yQ29kZSYgZXJyKSB7CkBAIC01MywxMCArNTMsMTAgQEAgaW5kZXggMzgwNmQw
Zi4uMzM4MjliMCAxMDA2NDQKICAjZGVmaW5lIFJFUE9fVE9QIFNPVVJDRV9UQVJCQUxMX1RPUCAi
Li4iIFVfRklMRV9TRVBfU1RSSU5HCiAgI2RlZmluZSBGSUxFX05BTUUgVV9GSUxFX1NFUF9TVFJJ
TkcgIm1lc3NhZ2UyIiBVX0ZJTEVfU0VQX1NUUklORyAidmFsaWQtdGVzdHMuanNvbiIKICAgICAg
Y29uc3QgY2hhciAqc3JjRGF0YURpciA9IG51bGxwdHI7Ci1kaWZmIC0tZ2l0IGEvdGVzdC9pb3Rl
c3QvTWFrZWZpbGUuaW4gYi90ZXN0L2lvdGVzdC9NYWtlZmlsZS5pbgorZGlmZiAtLWdpdCBhL3Nv
dXJjZS90ZXN0L2lvdGVzdC9NYWtlZmlsZS5pbiBiL3NvdXJjZS90ZXN0L2lvdGVzdC9NYWtlZmls
ZS5pbgogaW5kZXggMTZjNTEwZi4uOWVlZmY0YiAxMDA2NDQKLS0tLSBhL3Rlc3QvaW90ZXN0L01h
a2VmaWxlLmluCi0rKysgYi90ZXN0L2lvdGVzdC9NYWtlZmlsZS5pbgorLS0tIGEvc291cmNlL3Rl
c3QvaW90ZXN0L01ha2VmaWxlLmluCisrKysgYi9zb3VyY2UvdGVzdC9pb3Rlc3QvTWFrZWZpbGUu
aW4KIEBAIC0zOSw3ICszOSw3IEBAIENQUEZMQUdTICs9IC1EVU5JU1RSX0ZST01fQ0hBUl9FWFBM
SUNJVD0gLURVTklTVFJfRlJPTV9TVFJJTkdfRVhQTElDSVQ9CiAgaWZkZWYgUU5YX1RBUkdFVAog
IERFRlMgKz0gLUQnVV9UT1BTUkNESVI9Ii92YXIvaWN1X3Rlc3RzIicgLUQnVV9UT1BCVUlMRERJ
Uj0iL3Zhci9pY3VfdGVzdHMvIicKQEAgLTY2LDEwICs2NiwxMCBAQCBpbmRleCAxNmM1MTBmLi45
ZWVmZjRiIDEwMDY0NAogIGVuZGlmCiAgTElCUyA9ICQoTElCQ1RFU1RGVykgJChMSUJJQ1VUT09M
VVRJTCkgJChMSUJJQ1VJTykgJChMSUJJQ1VJMThOKSAkKExJQklDVVVDKSAkKERFRkFVTFRfTElC
UykgJChMSUJfTSkKICAKLWRpZmYgLS1naXQgYS90ZXN0L2xldGVzdC9NYWtlZmlsZS5pbiBiL3Rl
c3QvbGV0ZXN0L01ha2VmaWxlLmluCitkaWZmIC0tZ2l0IGEvc291cmNlL3Rlc3QvbGV0ZXN0L01h
a2VmaWxlLmluIGIvc291cmNlL3Rlc3QvbGV0ZXN0L01ha2VmaWxlLmluCiBpbmRleCAxNTZjODZm
Li41NTVhODIwIDEwMDY0NAotLS0tIGEvdGVzdC9sZXRlc3QvTWFrZWZpbGUuaW4KLSsrKyBiL3Rl
c3QvbGV0ZXN0L01ha2VmaWxlLmluCistLS0gYS9zb3VyY2UvdGVzdC9sZXRlc3QvTWFrZWZpbGUu
aW4KKysrKyBiL3NvdXJjZS90ZXN0L2xldGVzdC9NYWtlZmlsZS5pbgogQEAgLTMwLDcgKzMwLDcg
QEAgQlVJTERESVIgOj0gJChCVUlMRERJUjp0ZXN0XFxjaW50bHRzdC8uLi8uLi89KQogIEJVSUxE
RElSIDo9ICQoQlVJTERESVI6VEVTVFxcQ0lOVExUU1QvLi4vLi4vPSkKICAKQEAgLTc5LDYgKzc5
LDMgQEAgaW5kZXggMTU2Yzg2Zi4uNTU1YTgyMCAxMDA2NDQKICBMSUJTID0gJChMSUJJQ1VMWCkg
JChMSUJJQ1VVQykgJChMSUJJQ1VJMThOKSAkKExJQkNURVNURlcpICQoTElCSUNVVE9PTFVUSUwp
ICQoREVGQVVMVF9MSUJTKSAkKExJQl9NKSAkKElDVUxFSEJfTElCUykKICAKICBDT01NT05PQkpF
Q1RTID0gU2ltcGxlRm9udEluc3RhbmNlLm8KLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1zdXBwb3J0L2ljdS9pY3VfNzguMS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0
L2ljdS9pY3VfNzguMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9pY3UvaWN1Xzc4LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L2ljdS9pY3VfNzguMi5iYgppbmRleCBlZTcyNDVjMjdiLi4zMGFjNzc2ZTNjIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9pY3UvaWN1Xzc4LjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvaWN1L2ljdV83OC4yLmJiCkBAIC0xMTYsNyArMTE2LDcgQEAgU1JDX1VSSSA9
ICIke0JBU0VfU1JDX1VSSX07bmFtZT1jb2RlIFwKIFNSQ19VUkk6YXBwZW5kOmNsYXNzLXRhcmdl
dCA9ICJcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLURpc2FibGUtTERGTEFHU0lDVURULWZvci1M
aW51eC5wYXRjaCBcCiAgICAgICAgICAgIgotU1JDX1VSSVtjb2RlLnNoYTI1NnN1bV0gPSAiNjIx
N2Y1OGNhMzliMjMxMjc2MDVjZmM2YzdlMGQzNDc1ZmU0YjBkNjMxNTcwMTEzODNkNzE2Y2I0MTYx
Nzg4NiIKK1NSQ19VUklbY29kZS5zaGEyNTZzdW1dID0gIjNlOTk2ODdiNWM0MzVkNGIyMDk2MzBl
MmQyZWJiNzk5MDZjOTg0Njg1ZTc4NjM1MDc4YjY3MmUwM2M4OWRmMzUiCiBTUkNfVVJJW2RhdGEu
c2hhMjU2c3VtXSA9ICJlN2I2NTIyNDRmMjcxOTRlMGVhNDZhMGQyMWNmYzcxNGVlOGE4MThlMWZk
ODJkNTFhOTNiYzkxNTE2ZmRjZjY1IgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNl
cy90YWcvcmVsZWFzZS0oP1A8cHZlcj4oPyEuK3JjKS4rKSIKLS0gCjIuNDcuMQoK

--===============4246876165282040367==--

