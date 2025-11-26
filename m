Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE74D111BF
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 23:34:32 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7160.1764200062450637553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 15:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FPFV1HDu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202511262334183995dfb896000207ae-evnjk3@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202511262334183995dfb896000207ae
        for <openembedded-core@lists.openembedded.org>;
        Thu, 27 Nov 2025 00:34:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XYaEYfVwSzkCbywoO9TksidxJfJMCsJI9BnCaeIj7Cs=;
 b=FPFV1HDue5/+x7JbWr5aiSCBUnbhDJeFXInrz2JPET/152b9qUNNvXwcUfNNLbLX+tiB0e
 lfPMNndCqEqSoNKACBrF0jsJI51npeqaviuxQfybbnalqTzsSWWjMEt4HMwXi+rN7DJTFIVt
 drx8x//Axg5tlsjuhbdyYS7N0uadKuuTOutz6vKFXwD7gvVw0uz1jMa4IIaAj3aBUKRPmDyW
 JNCCF9cARJ8KKbU1CZmQli0uaferyQJ+lptHvYKNgVafeO47HIhAWEQgTWH24GRWJLUkh4fh
 7J43D6BXU4br6w6vzw4U8tyr3uohn0Cdz5mnLV3kzp81kw/82ZQCj0Dw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] gnutls: upgrade 3.8.10 -> 3.8.11
Date: Thu, 27 Nov 2025 00:34:10 +0100
Message-Id: <20251126233410.1243674-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 23:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226814

From: Peter Marko <peter.marko@siemens.com>

Release information: [1]
Includes fix for CVE-2025-9820.

Refresh patches.

[1] https://lists.gnupg.org/pipermail/gnutls-help/2025-November/004906.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...eating-.hmac-file-should-be-excuted-in-target-envi.patch | 2 +-
 meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch  | 6 +++---
 .../gnutls/{gnutls_3.8.10.bb => gnutls_3.8.11.bb}           | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.10.bb => gnutls_3.8.11.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index 2dccea7859..0847dde8a9 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -14,7 +14,7 @@ diff --git a/lib/Makefile.am b/lib/Makefile.am
 index a50d311..193ea19 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -272,8 +272,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
+@@ -275,8 +275,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
  
  all-local: $(hmac_file)
  
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 339d3d2f9e..d8b5035b38 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -15,7 +15,7 @@ diff --git a/Makefile.am b/Makefile.am
 index 843193f..816b09f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -194,6 +194,9 @@ dist-hook:
+@@ -197,6 +197,9 @@ dist-hook:
  distcheck-hook:
  	@test -d "$(top_srcdir)/po/.reference" || { echo "PO files are not downloaded; run ./bootstrap without --skip-po"; exit 1; }
  
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1491,6 +1491,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1447,6 +1447,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -678,6 +678,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -719,6 +719,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.10.bb b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.10.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.11.bb
index 2ef71a1213..7fee64080b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.10.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.11.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
+SRC_URI[sha256sum] = "91bd23c4a86ebc6152e81303d20cf6ceaeb97bc8f84266d0faec6e29f17baa20"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 

