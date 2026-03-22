Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0DAD58CB2
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 23:01:59 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5699.1774220513189141788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 16:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ffQOZhVe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026032223015168074efe580002076f-pktsge@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026032223015168074efe580002076f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 23 Mar 2026 00:01:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=v842QGEy5YJZcuvrpkF3TTKY9pJPTQPRhEJbGYWglDs=;
 b=ffQOZhVeuArt7KsbfVEhrN9Pq/z53aCVNOwaHWWgxekhfBZ74ttw7honov8FWxNQHkCsgZ
 Rh50i0/C6X3jgaDo0LjsmfAGva9k6z8Rjzc2fNsNe/soFFFT3ernzhi3VhWOxRNRSbog0uBo
 WwIA9je8d4nYU6aqlDUiq5UW/VBokDo5Ke1kgM6NgoaI4lMfhRUY+um1Nid7pWFN3CQ+m4Ai
 ZSQYH9FirxaWxaWdOZjWP5e3iEBRF9vg0O6Eg8MNGTRfeNSVpoAHBBMwf4sKLlYUgD0xKf5J
 dw9i9H8VrnRp0YYupQ+aXHRqrfn4hWnzhGNws9nQQDIqL4yP/JDi49bg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 3/4] icu: upgrade 78.2 -> 78.3
Date: Mon, 23 Mar 2026 00:01:30 +0100
Message-Id: <20260322230131.12001-3-peter.marko@siemens.com>
In-Reply-To: <20260322230131.12001-1-peter.marko@siemens.com>
References: <20260322230131.12001-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 23:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233686

Release notes [1]:

Unicode® ICU 78.3 is a maintenance update on top of ICU 78 and 78.2,
mostly for the CLDR 48.2 bug fixes. In addition, it fixes a C++ code
point iterator bug, and updates to timezone data 2026a.

The next major release of ICU will be ICU 79, planned for October. It
will update to CLDR 49 and Unicode 18.

[1] https://github.com/unicode-org/icu/releases/tag/release-78.3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...U-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch | 2 +-
 ...ke-ICU-test-output-compatible-with-Automake-format.patch | 6 +++---
 .../icu/icu/0001-test-Add-support-ptest.patch               | 2 +-
 meta/recipes-support/icu/{icu_78.2.bb => icu_78.3.bb}       | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-support/icu/{icu_78.2.bb => icu_78.3.bb} (97%)

diff --git a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
index e2e9546679..0bf1910d18 100644
--- a/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
+++ b/meta/recipes-support/icu/icu/0001-ICU-23120-Mask-UnicodeStringTest-TestLargeMemory-on-.patch
@@ -14,7 +14,7 @@ diff --git a/test/intltest/ustrtest.cpp b/test/intltest/ustrtest.cpp
 index 56976b3e3d2..26225f5b5b5 100644
 --- a/test/intltest/ustrtest.cpp
 +++ b/test/intltest/ustrtest.cpp
-@@ -2353,7 +2353,7 @@ void UnicodeStringTest::TestUnicodeStringInsertAppendToSelf() {
+@@ -2375,7 +2375,7 @@ void UnicodeStringTest::TestUnicodeStringInsertAppendToSelf() {
  }
  
  void UnicodeStringTest::TestLargeMemory() {
diff --git a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch b/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
index 484e1c7f6f..ab88803b36 100644
--- a/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
+++ b/meta/recipes-support/icu/icu/0001-Make-ICU-test-output-compatible-with-Automake-format.patch
@@ -25,7 +25,7 @@ diff --git a/configure.ac b/configure.ac
 index da4f170..514fa0c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1165,6 +1165,21 @@ If set, it will REPLACE any automatic list of libraries.],
+@@ -1103,6 +1103,21 @@ If set, it will REPLACE any automatic list of libraries.],
  		*) AC_MSG_ERROR(bad value ${enableval} for --enable-samples) ;;
  		esac],
  	samples=true)
@@ -47,7 +47,7 @@ index da4f170..514fa0c 100644
  ICU_CONDITIONAL(SAMPLES, test "$samples" = true)
  
  ICUDATA_CHAR=$U_ENDIAN_CHAR
-@@ -1428,3 +1443,5 @@ then
+@@ -1366,3 +1381,5 @@ then
  fi
  
  $as_unset _CXX_CXXSUFFIX
@@ -57,7 +57,7 @@ diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
 index 33829b0..bf3ef56 100644
 --- a/test/intltest/intltest.cpp
 +++ b/test/intltest/intltest.cpp
-@@ -830,11 +830,19 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
+@@ -824,11 +824,19 @@ UBool IntlTest::runTestLoop( char* testname, char* par, char *baseName )
              saveBaseLoc[0]=0; /* reset path */
              
              if (lastErrorCount == errorCount) {
diff --git a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
index 88350c0db5..d9fd8e3e43 100644
--- a/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
+++ b/meta/recipes-support/icu/icu/0001-test-Add-support-ptest.patch
@@ -44,7 +44,7 @@ diff --git a/test/intltest/intltest.cpp b/test/intltest/intltest.cpp
 index 3806d0f..33829b0 100644
 --- a/test/intltest/intltest.cpp
 +++ b/test/intltest/intltest.cpp
-@@ -1713,7 +1713,7 @@ static bool fileExists(const char* fileName) {
+@@ -1707,7 +1707,7 @@ static bool fileExists(const char* fileName) {
   * Returns the path to icu/testdata/
   */
  const char *IntlTest::getSharedTestData(UErrorCode& err) {
diff --git a/meta/recipes-support/icu/icu_78.2.bb b/meta/recipes-support/icu/icu_78.3.bb
similarity index 97%
rename from meta/recipes-support/icu/icu_78.2.bb
rename to meta/recipes-support/icu/icu_78.3.bb
index 1e99803105..367e2641e7 100644
--- a/meta/recipes-support/icu/icu_78.2.bb
+++ b/meta/recipes-support/icu/icu_78.3.bb
@@ -116,8 +116,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
 SRC_URI:append:class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[code.sha256sum] = "3e99687b5c435d4b209630e2d2ebb79906c984685e78635078b672e03c89df35"
-SRC_URI[data.sha256sum] = "582968cf174c9498b2046b4f4e7f786def5f18222bd8d98432d7a29399c38c70"
+SRC_URI[code.sha256sum] = "3a2e7a47604ba702f345878308e6fefeca612ee895cf4a5f222e7955fabfe0c0"
+SRC_URI[data.sha256sum] = "9d8b3899096aeb83e4e21ef8a40fec9e03b28db18c48452efac882ce25a91e27"
 
 UPSTREAM_CHECK_REGEX = "releases/tag/release-(?P<pver>(?!.+rc).+)"
 GITHUB_BASE_URI = "https://github.com/unicode-org/icu/releases"

