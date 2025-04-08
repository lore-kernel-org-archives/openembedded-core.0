Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318C9C369A2
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 15:55:21 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.79108.1744127718071789202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 08:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=PrfWTtBL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202504081555131252f84cb0a9a06924-ffubvf@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202504081555131252f84cb0a9a06924
        for <openembedded-core@lists.openembedded.org>;
        Tue, 08 Apr 2025 17:55:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NND348x66DqPIeEI+Z179bRpziL/Tj0IOICPdFupDpI=;
 b=PrfWTtBLdx8emZPHiu2KCzBLVL8o5otdWZfhScjQObE5rqNC2a5+q4cHm/oqonO7Ci8DiW
 zfNhLRLMhCRL8n5rFKEQ2hhyAHzWkPFKX7k/NGXRmwaH/rnW51W9K4gMsqmWm/CumqJ3tDS8
 pYpdmjm0jnryJLh/881cyTduyxgniHEZEDSbhOR4AnR5FaHO+zzhaFUn7Mdllqol1rnInK6I
 rJQRDMcicUUwigNFsf/Y8bfz+i8YXA/irKRlswxEA+zNIh8h89b6jCtbU4MsZOi2+EwtYQ5O
 fDB8MccZKGa/8bMwLq0zfk5Z8vA3mFbfNjEv3gzJmaNXtB5T1gpHWcIg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] openssl: upgrade 3.4.1 -> 3.5.0
Date: Tue,  8 Apr 2025 17:54:25 +0200
Message-Id: <20250408155425.51986-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 15:55:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214545

From: Peter Marko <peter.marko@siemens.com>

This is new openssl LTS release.

Release information:
* https://openssl-library.org/post/2025-02-20-openssl-3.5-lts/
* https://openssl-library.org/post/2025-04-08-openssl-35-final-release/
* https://github.com/openssl/openssl/releases/tag/openssl-3.5.0
* https://github.com/openssl/openssl/blob/openssl-3.5.0/NEWS.md#openssl-35

packages-split directory does not show any changes relevant for
packaging change.

There are new config options but they don't seem to be significant
enough to need explicit packageconfig options.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...handshake-history-reporting-when-test-fails.patch | 12 ++++++------
 .../0001-Configure-do-not-tweak-mips-cflags.patch    |  2 +-
 ...-strip-sysroot-and-debug-prefix-map-from-co.patch |  8 ++++----
 .../openssl/{openssl_3.4.1.bb => openssl_3.5.0.bb}   |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.4.1.bb => openssl_3.5.0.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index 31bbbd8679..5b7365a353 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -16,7 +16,7 @@ diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
 index f611b3a..5703b48 100644
 --- a/test/helpers/handshake.c
 +++ b/test/helpers/handshake.c
-@@ -24,6 +24,102 @@
+@@ -25,6 +25,102 @@
  #include <netinet/sctp.h>
  #endif
  
@@ -119,7 +119,7 @@ index f611b3a..5703b48 100644
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
  {
      HANDSHAKE_RESULT *ret;
-@@ -725,15 +821,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
+@@ -726,15 +822,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
          SSL_set_post_handshake_auth(client, 1);
  }
  
@@ -135,7 +135,7 @@ index f611b3a..5703b48 100644
  /* An SSL object and associated read-write buffers. */
  typedef struct peer_st {
      SSL *ssl;
-@@ -1080,17 +1167,6 @@ static void do_shutdown_step(PEER *peer)
+@@ -1081,17 +1168,6 @@ static void do_shutdown_step(PEER *peer)
      }
  }
  
@@ -153,7 +153,7 @@ index f611b3a..5703b48 100644
  static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
  {
      switch (test_ctx->handshake_mode) {
-@@ -1168,19 +1244,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
+@@ -1169,19 +1245,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
      }
  }
  
@@ -173,7 +173,7 @@ index f611b3a..5703b48 100644
  /*
   * Determine the handshake outcome.
   * last_status: the status of the peer to have acted last.
-@@ -1545,6 +1608,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+@@ -1546,6 +1609,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
  
      start = time(NULL);
  
@@ -184,7 +184,7 @@ index f611b3a..5703b48 100644
      /*
       * Half-duplex handshake loop.
       * Client and server speak to each other synchronously in the same process.
-@@ -1566,6 +1633,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+@@ -1567,6 +1634,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
                                        0 /* server went last */);
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index c7e9c9d96e..7043188973 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -20,7 +20,7 @@ diff --git a/Configure b/Configure
 index fff97bd..5ee54c1 100755
 --- a/Configure
 +++ b/Configure
-@@ -1529,16 +1529,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1551,16 +1551,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index 91a95d8929..687d682976 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -67,10 +67,10 @@ index 09303c4..011bda1 100644
  PERLASM_SCHEME= {- $target{perlasm_scheme} -}
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
-Index: openssl-3.0.4/crypto/build.info
-===================================================================
---- openssl-3.0.4.orig/crypto/build.info
-+++ openssl-3.0.4/crypto/build.info
+diff --git a/crypto/build.info b/crypto/build.info
+index aee5c46..95c9577 100644
+--- a/crypto/build.info
++++ b/crypto/build.info
 @@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.4.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.0.bb
index 8da64aea6a..865e04deb2 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.0.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3"
+SRC_URI[sha256sum] = "344d0a79f1a9b08029b0744e2cc401a43f9c90acd1044d09a530b4885a8e9fc0"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

