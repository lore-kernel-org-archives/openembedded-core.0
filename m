Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFA3C54E7A
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2147.1706810404343627901
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fOJuzZJe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ij/KcrZ0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018d65d3e995-5fcb9709-0edd-4b6b-b97b-032372436b7b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GIZSkJLHFDhj1009SayQ9VeUGOmUTzCziHGhhxWYPeU=;
	b=fOJuzZJexKy2HafEtBUJiWuVUKuZkB8VxmJZiyw72fpBVa3vVivuUgPRrC0QvC+F
	lUhcaE6J8/y5qtZ61oPvNAx88nFul3Qm1foK8MN/obo3jA2CehrL+3LNdBHOkDXVi6o
	0YZPcCpE3k4A3GdtqIbg24mpLF2Bbc4QW0hmaDrc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810403;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GIZSkJLHFDhj1009SayQ9VeUGOmUTzCziHGhhxWYPeU=;
	b=Ij/KcrZ02oCnYH8o3MbuXp6RiaFlEiDczkxZDsJJ8jqInEzDyd60VXsTJdt7wa6p
	B19l2/m0Xj+lRWIAKRg3Dzg88KdgZgKopaeU7eT4lc2bwPwfR32VoVxzWkCevLNUVNI
	TyrfEbC0QZOoqGvpmawbzx+8dI6OYHRFmBCRqgAo=
Content-Type: multipart/mixed; boundary="===============8446398572594134342=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] openssl: upgrading to 3.2.1 SUCCEEDED
Message-ID: <0101018d65d3e995-5fcb9709-0edd-4b6b-b97b-032372436b7b-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194600

--===============8446398572594134342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssl* to *3.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssl-upgrade-3.2.0-3.2.1.patch
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
From 2b386454da751183fbf2be59ab5d57b9d9acc8ef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 05:31:49 +0000
Subject: [PATCH] openssl: upgrade 3.2.0 -> 3.2.1

---
 ...ke-history-reporting-when-test-fails.patch | 40 +++++++++----------
 ...1-Configure-do-not-tweak-mips-cflags.patch |  7 ++--
 ...sysroot-and-debug-prefix-map-from-co.patch | 22 +++++-----
 ...x-mispelling-of-extension-test-macro.patch | 31 --------------
 .../openssl/openssl/aarch64-bti.patch         | 35 ----------------
 .../{openssl_3.2.0.bb => openssl_3.2.1.bb}    |  5 +--
 6 files changed, 36 insertions(+), 104 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.2.0.bb => openssl_3.2.1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index aa2e5bb800..cb98dcd151 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -1,4 +1,4 @@
-From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
+From 9169682ce2fe687d6464768a3a0b89c7c491376e Mon Sep 17 00:00:00 2001
 From: William Lyu <William.Lyu@windriver.com>
 Date: Fri, 20 Oct 2023 16:22:37 -0400
 Subject: [PATCH] Added handshake history reporting when test fails
@@ -6,6 +6,7 @@ Subject: [PATCH] Added handshake history reporting when test fails
 Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22481]
 
 Signed-off-by: William Lyu <William.Lyu@windriver.com>
+
 ---
  test/helpers/handshake.c | 139 +++++++++++++++++++++++++++++----------
  test/helpers/handshake.h |  70 +++++++++++++++++++-
@@ -13,7 +14,7 @@ Signed-off-by: William Lyu <William.Lyu@windriver.com>
  3 files changed, 218 insertions(+), 35 deletions(-)
 
 diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
-index e0422469e4..ae2ad59dd4 100644
+index e042246..ae2ad59 100644
 --- a/test/helpers/handshake.c
 +++ b/test/helpers/handshake.c
 @@ -1,5 +1,5 @@
@@ -26,7 +27,7 @@ index e0422469e4..ae2ad59dd4 100644
 @@ -24,6 +24,102 @@
  #include <netinet/sctp.h>
  #endif
-
+ 
 +/* Shamelessly copied from test/helpers/ssl_test_ctx.c */
 +/* Maps string names to various enumeration type */
 +typedef struct {
@@ -129,7 +130,7 @@ index e0422469e4..ae2ad59dd4 100644
 @@ -719,15 +815,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
          SSL_set_post_handshake_auth(client, 1);
  }
-
+ 
 -/* The status for each connection phase. */
 -typedef enum {
 -    PEER_SUCCESS,
@@ -145,7 +146,7 @@ index e0422469e4..ae2ad59dd4 100644
 @@ -1074,17 +1161,6 @@ static void do_shutdown_step(PEER *peer)
      }
  }
-
+ 
 -typedef enum {
 -    HANDSHAKE,
 -    RENEG_APPLICATION_DATA,
@@ -163,7 +164,7 @@ index e0422469e4..ae2ad59dd4 100644
 @@ -1162,19 +1238,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
      }
  }
-
+ 
 -typedef enum {
 -    /* Both parties succeeded. */
 -    HANDSHAKE_SUCCESS,
@@ -181,9 +182,9 @@ index e0422469e4..ae2ad59dd4 100644
   * Determine the handshake outcome.
   * last_status: the status of the peer to have acted last.
 @@ -1539,6 +1602,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
-
+ 
      start = time(NULL);
-
+ 
 +    save_loop_history(&(ret->history),
 +                      phase, status, server.status, client.status,
 +                      client_turn_count, client_turn);
@@ -194,7 +195,7 @@ index e0422469e4..ae2ad59dd4 100644
 @@ -1560,6 +1627,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
                                        0 /* server went last */);
          }
-
+ 
 +        save_loop_history(&(ret->history),
 +                          phase, status, server.status, client.status,
 +                          client_turn_count, client_turn);
@@ -203,7 +204,7 @@ index e0422469e4..ae2ad59dd4 100644
          case HANDSHAKE_SUCCESS:
              client_turn_count = 0;
 diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
-index 78b03f9f4b..b9967c2623 100644
+index 78b03f9..b9967c2 100644
 --- a/test/helpers/handshake.h
 +++ b/test/helpers/handshake.h
 @@ -1,5 +1,5 @@
@@ -214,9 +215,9 @@ index 78b03f9f4b..b9967c2623 100644
   * Licensed under the Apache License 2.0 (the "License").  You may not use
   * this file except in compliance with the License.  You can obtain a copy
 @@ -12,6 +12,11 @@
-
+ 
  #include "ssl_test_ctx.h"
-
+ 
 +#define MAX_HANDSHAKE_HISTORY_ENTRY_BIT 4
 +#define MAX_HANDSHAKE_HISTORY_ENTRY (1 << MAX_HANDSHAKE_HISTORY_ENTRY_BIT)
 +#define MAX_HANDSHAKE_HISTORY_ENTRY_IDX_MASK \
@@ -228,7 +229,7 @@ index 78b03f9f4b..b9967c2623 100644
 @@ -22,6 +27,63 @@ typedef struct ctx_data_st {
      char *session_ticket_app_data;
  } CTX_DATA;
-
+ 
 +typedef enum {
 +    HANDSHAKE,
 +    RENEG_APPLICATION_DATA,
@@ -296,25 +297,25 @@ index 78b03f9f4b..b9967c2623 100644
 +    /* handshake loop history */
 +    HANDSHAKE_HISTORY history;
  } HANDSHAKE_RESULT;
-
+ 
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void);
 @@ -95,4 +159,8 @@ int configure_handshake_ctx_for_srp(SSL_CTX *server_ctx, SSL_CTX *server2_ctx,
                                      CTX_DATA *server2_ctx_data,
                                      CTX_DATA *client_ctx_data);
-
+ 
 +const char *handshake_connect_phase_name(connect_phase_t phase);
 +const char *handshake_status_name(handshake_status_t handshake_status);
 +const char *handshake_peer_status_name(peer_status_t peer_status);
 +
  #endif  /* OSSL_TEST_HANDSHAKE_HELPER_H */
 diff --git a/test/ssl_test.c b/test/ssl_test.c
-index ea608518f9..9d6b093c81 100644
+index ea60851..9d6b093 100644
 --- a/test/ssl_test.c
 +++ b/test/ssl_test.c
 @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx = NULL;
  /* Currently the section names are of the form test-<number>, e.g. test-15. */
  #define MAX_TESTCASE_NAME_LENGTH 100
-
+ 
 +static void print_handshake_history(const HANDSHAKE_HISTORY *history)
 +{
 +    size_t first_idx;
@@ -368,7 +369,4 @@ index ea608518f9..9d6b093c81 100644
 +
      return ret;
  }
-
---
-2.25.1
-
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index 502a7aaf32..665c843d78 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -1,4 +1,4 @@
-From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001
+From e335d662b63000b672222ce8cd7e832cf7a4150f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 30 May 2023 09:11:27 -0700
 Subject: [PATCH] Configure: do not tweak mips cflags
@@ -12,15 +12,16 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 
 Refreshed for openssl-3.1.1
 Signed-off-by: Tim Orling <tim.orling@konsulko.com>
+
 ---
  Configure | 10 ----------
  1 file changed, 10 deletions(-)
 
 diff --git a/Configure b/Configure
-index 4569952..adf019b 100755
+index cca1ac8..45a12b1 100755
 --- a/Configure
 +++ b/Configure
-@@ -1422,16 +1422,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1485,16 +1485,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index bafdbaa46f..5a51e9fd9d 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -1,4 +1,4 @@
-From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
+From bc8aacbe96b1716d060622d7dba0a05fabe6c17b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Tue, 6 Nov 2018 14:50:47 +0100
 Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compiler
@@ -34,11 +34,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  crypto/build.info                 |  2 +-
  2 files changed, 12 insertions(+), 2 deletions(-)
 
-Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
-===================================================================
---- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
-+++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
-@@ -472,13 +472,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lfl
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index b3350a1..5e8879a 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -481,13 +481,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
@@ -63,11 +63,11 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
  PERLASM_SCHEME= {- $target{perlasm_scheme} -}
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
-Index: openssl-3.0.4/crypto/build.info
-===================================================================
---- openssl-3.0.4.orig/crypto/build.info
-+++ openssl-3.0.4/crypto/build.info
-@@ -109,7 +109,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
+diff --git a/crypto/build.info b/crypto/build.info
+index 2d5b22f..9623f02 100644
+--- a/crypto/build.info
++++ b/crypto/build.info
+@@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
  DEPEND[cversion.o]=buildinf.h
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch b/meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch
deleted file mode 100644
index 1d217bd8e3..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-riscv-Fix-mispelling-of-extension-test-macro.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b51031b05f72923ff1cf3b6a4767450dee89d7f4 Mon Sep 17 00:00:00 2001
-From: Grant Nichol <me@grantnichol.com>
-Date: Fri, 22 Dec 2023 23:46:39 -0600
-Subject: [PATCH] riscv: Fix mispelling of extension test macro
-
-When refactoring the riscv extension test macros,
-RISCV_HAS_ZKND_AND_ZKNE was mispelled.
-
-CLA: trivial
-Upstream-Status: Backport [https://github.com/openssl/openssl/pull/23139]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- providers/implementations/ciphers/cipher_aes_xts_hw.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/providers/implementations/ciphers/cipher_aes_xts_hw.c b/providers/implementations/ciphers/cipher_aes_xts_hw.c
-index 564d6d6..4cf1361 100644
---- a/providers/implementations/ciphers/cipher_aes_xts_hw.c
-+++ b/providers/implementations/ciphers/cipher_aes_xts_hw.c
-@@ -225,7 +225,7 @@ static const PROV_CIPHER_HW aes_xts_rv32i_zbkb_zknd_zkne = {                   \
- # define PROV_CIPHER_HW_select_xts()                                           \
- if (RISCV_HAS_ZBKB_AND_ZKND_AND_ZKNE())                                        \
-     return &aes_xts_rv32i_zbkb_zknd_zkne;                                      \
--if (RISCV_HAS_ZKND_ZKNE())                                                     \
-+if (RISCV_HAS_ZKND_AND_ZKNE())                                                 \
-     return &aes_xts_rv32i_zknd_zkne;
- # else
- /* The generic case */
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch b/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
deleted file mode 100644
index 2a16debb76..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/aarch64-bti.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ad347c9ff0fd93bdd2fa2085611c65b88e94829f Mon Sep 17 00:00:00 2001
-From: "fangming.fang" <fangming.fang@arm.com>
-Date: Thu, 7 Dec 2023 06:17:51 +0000
-Subject: [PATCH] Enable BTI feature for md5 on aarch64
-
-Fixes: #22959
-
-Reviewed-by: Tom Cosgrove <tom.cosgrove@arm.com>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/22971)
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- crypto/md5/asm/md5-aarch64.pl | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/crypto/md5/asm/md5-aarch64.pl b/crypto/md5/asm/md5-aarch64.pl
-index 3200a0fa9bff0..5a8608069691d 100755
---- a/crypto/md5/asm/md5-aarch64.pl
-+++ b/crypto/md5/asm/md5-aarch64.pl
-@@ -28,10 +28,13 @@
- *STDOUT=*OUT;
- 
- $code .= <<EOF;
-+#include "arm_arch.h"
-+
- .text
- .globl  ossl_md5_block_asm_data_order
- .type   ossl_md5_block_asm_data_order,\@function
- ossl_md5_block_asm_data_order:
-+        AARCH64_VALID_CALL_TARGET
-         // Save all callee-saved registers
-         stp     x19,x20,[sp,#-80]!
-         stp     x21,x22,[sp,#16]
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_3.2.0.bb
rename to meta/recipes-connectivity/openssl/openssl_3.2.1.bb
index cf08cdbaa0..f903136620 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.1.bb
@@ -12,15 +12,14 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
-           file://aarch64-bti.patch \
-           file://0001-riscv-Fix-mispelling-of-extension-test-macro.patch \
+           file://environment.d-openssl.sh \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "14c826f07c7e433706fb5c69fa9e25dab95684844b4c962a2cf1bf183eb4690e"
+SRC_URI[sha256sum] = "83c7329fe52c850677d75e5d0b0ca245309b97e8ecbcfdc1dfdc4ab9fac35b39"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.42.0


--===============8446398572594134342==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssl-upgrade-3.2.0-3.2.1.patch"

RnJvbSAyYjM4NjQ1NGRhNzUxMTgzZmJmMmJlNTlhYjVkNTdiOWQ5YWNjOGVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwNTozMTo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG9w
ZW5zc2w6IHVwZ3JhZGUgMy4yLjAgLT4gMy4yLjEKCi0tLQogLi4ua2UtaGlzdG9yeS1yZXBvcnRp
bmctd2hlbi10ZXN0LWZhaWxzLnBhdGNoIHwgNDAgKysrKysrKysrLS0tLS0tLS0tLQogLi4uMS1D
b25maWd1cmUtZG8tbm90LXR3ZWFrLW1pcHMtY2ZsYWdzLnBhdGNoIHwgIDcgKystLQogLi4uc3lz
cm9vdC1hbmQtZGVidWctcHJlZml4LW1hcC1mcm9tLWNvLnBhdGNoIHwgMjIgKysrKystLS0tLQog
Li4ueC1taXNwZWxsaW5nLW9mLWV4dGVuc2lvbi10ZXN0LW1hY3JvLnBhdGNoIHwgMzEgLS0tLS0t
LS0tLS0tLS0KIC4uLi9vcGVuc3NsL29wZW5zc2wvYWFyY2g2NC1idGkucGF0Y2ggICAgICAgICB8
IDM1IC0tLS0tLS0tLS0tLS0tLS0KIC4uLi97b3BlbnNzbF8zLjIuMC5iYiA9PiBvcGVuc3NsXzMu
Mi4xLmJifSAgICB8ICA1ICstLQogNiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAx
MDQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1yaXNjdi1GaXgtbWlzcGVsbGluZy1vZi1leHRlbnNp
b24tdGVzdC1tYWNyby5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsL2FhcmNoNjQtYnRpLnBhdGNoCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL3tvcGVuc3NsXzMuMi4wLmJiID0+IG9wZW5zc2xf
My4yLjEuYmJ9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NsL29wZW5zc2wvMDAwMS1BZGRlZC1oYW5kc2hha2UtaGlzdG9yeS1yZXBvcnRpbmctd2hl
bi10ZXN0LWZhaWxzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29w
ZW5zc2wvMDAwMS1BZGRlZC1oYW5kc2hha2UtaGlzdG9yeS1yZXBvcnRpbmctd2hlbi10ZXN0LWZh
aWxzLnBhdGNoCmluZGV4IGFhMmU1YmI4MDAuLmNiOThkY2QxNTEgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtQWRkZWQtaGFuZHNoYWtl
LWhpc3RvcnktcmVwb3J0aW5nLXdoZW4tdGVzdC1mYWlscy5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLUFkZGVkLWhhbmRzaGFrZS1oaXN0
b3J5LXJlcG9ydGluZy13aGVuLXRlc3QtZmFpbHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDViYTY1MDUxZmVhMDUxM2RiMGQ5OTdmMGFiN2NhZmI5ODI2ZWQ3NGEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDkxNjk2ODJjZTJmZTY4N2Q2NDY0NzY4YTNhMGI4OWM3YzQ5MTM3NmUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBXaWxsaWFtIEx5dSA8V2lsbGlhbS5MeXVA
d2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwgMjAgT2N0IDIwMjMgMTY6MjI6MzcgLTA0MDAKIFN1
YmplY3Q6IFtQQVRDSF0gQWRkZWQgaGFuZHNoYWtlIGhpc3RvcnkgcmVwb3J0aW5nIHdoZW4gdGVz
dCBmYWlscwpAQCAtNiw2ICs2LDcgQEAgU3ViamVjdDogW1BBVENIXSBBZGRlZCBoYW5kc2hha2Ug
aGlzdG9yeSByZXBvcnRpbmcgd2hlbiB0ZXN0IGZhaWxzCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1p
dHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL29wZW5zc2wvb3BlbnNzbC9wdWxsLzIyNDgxXQogCiBT
aWduZWQtb2ZmLWJ5OiBXaWxsaWFtIEx5dSA8V2lsbGlhbS5MeXVAd2luZHJpdmVyLmNvbT4KKwog
LS0tCiAgdGVzdC9oZWxwZXJzL2hhbmRzaGFrZS5jIHwgMTM5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLQogIHRlc3QvaGVscGVycy9oYW5kc2hha2UuaCB8ICA3MCArKysr
KysrKysrKysrKysrKysrLQpAQCAtMTMsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFt
IEx5dSA8V2lsbGlhbS5MeXVAd2luZHJpdmVyLmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDIxOCBp
bnNlcnRpb25zKCspLCAzNSBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3QvaGVscGVy
cy9oYW5kc2hha2UuYyBiL3Rlc3QvaGVscGVycy9oYW5kc2hha2UuYwotaW5kZXggZTA0MjI0Njll
NC4uYWUyYWQ1OWRkNCAxMDA2NDQKK2luZGV4IGUwNDIyNDYuLmFlMmFkNTkgMTAwNjQ0CiAtLS0g
YS90ZXN0L2hlbHBlcnMvaGFuZHNoYWtlLmMKICsrKyBiL3Rlc3QvaGVscGVycy9oYW5kc2hha2Uu
YwogQEAgLTEsNSArMSw1IEBACkBAIC0yNiw3ICsyNyw3IEBAIGluZGV4IGUwNDIyNDY5ZTQuLmFl
MmFkNTlkZDQgMTAwNjQ0CiBAQCAtMjQsNiArMjQsMTAyIEBACiAgI2luY2x1ZGUgPG5ldGluZXQv
c2N0cC5oPgogICNlbmRpZgotCisgCiArLyogU2hhbWVsZXNzbHkgY29waWVkIGZyb20gdGVzdC9o
ZWxwZXJzL3NzbF90ZXN0X2N0eC5jICovCiArLyogTWFwcyBzdHJpbmcgbmFtZXMgdG8gdmFyaW91
cyBlbnVtZXJhdGlvbiB0eXBlICovCiArdHlwZWRlZiBzdHJ1Y3QgewpAQCAtMTI5LDcgKzEzMCw3
IEBAIGluZGV4IGUwNDIyNDY5ZTQuLmFlMmFkNTlkZDQgMTAwNjQ0CiBAQCAtNzE5LDE1ICs4MTUs
NiBAQCBzdGF0aWMgdm9pZCBjb25maWd1cmVfaGFuZHNoYWtlX3NzbChTU0wgKnNlcnZlciwgU1NM
ICpjbGllbnQsCiAgICAgICAgICBTU0xfc2V0X3Bvc3RfaGFuZHNoYWtlX2F1dGgoY2xpZW50LCAx
KTsKICB9Ci0KKyAKIC0vKiBUaGUgc3RhdHVzIGZvciBlYWNoIGNvbm5lY3Rpb24gcGhhc2UuICov
CiAtdHlwZWRlZiBlbnVtIHsKIC0gICAgUEVFUl9TVUNDRVNTLApAQCAtMTQ1LDcgKzE0Niw3IEBA
IGluZGV4IGUwNDIyNDY5ZTQuLmFlMmFkNTlkZDQgMTAwNjQ0CiBAQCAtMTA3NCwxNyArMTE2MSw2
IEBAIHN0YXRpYyB2b2lkIGRvX3NodXRkb3duX3N0ZXAoUEVFUiAqcGVlcikKICAgICAgfQogIH0K
LQorIAogLXR5cGVkZWYgZW51bSB7CiAtICAgIEhBTkRTSEFLRSwKIC0gICAgUkVORUdfQVBQTElD
QVRJT05fREFUQSwKQEAgLTE2Myw3ICsxNjQsNyBAQCBpbmRleCBlMDQyMjQ2OWU0Li5hZTJhZDU5
ZGQ0IDEwMDY0NAogQEAgLTExNjIsMTkgKzEyMzgsNiBAQCBzdGF0aWMgdm9pZCBkb19jb25uZWN0
X3N0ZXAoY29uc3QgU1NMX1RFU1RfQ1RYICp0ZXN0X2N0eCwgUEVFUiAqcGVlciwKICAgICAgfQog
IH0KLQorIAogLXR5cGVkZWYgZW51bSB7CiAtICAgIC8qIEJvdGggcGFydGllcyBzdWNjZWVkZWQu
ICovCiAtICAgIEhBTkRTSEFLRV9TVUNDRVNTLApAQCAtMTgxLDkgKzE4Miw5IEBAIGluZGV4IGUw
NDIyNDY5ZTQuLmFlMmFkNTlkZDQgMTAwNjQ0CiAgICogRGV0ZXJtaW5lIHRoZSBoYW5kc2hha2Ug
b3V0Y29tZS4KICAgKiBsYXN0X3N0YXR1czogdGhlIHN0YXR1cyBvZiB0aGUgcGVlciB0byBoYXZl
IGFjdGVkIGxhc3QuCiBAQCAtMTUzOSw2ICsxNjAyLDEwIEBAIHN0YXRpYyBIQU5EU0hBS0VfUkVT
VUxUICpkb19oYW5kc2hha2VfaW50ZXJuYWwoCi0KKyAKICAgICAgc3RhcnQgPSB0aW1lKE5VTEwp
OwotCisgCiArICAgIHNhdmVfbG9vcF9oaXN0b3J5KCYocmV0LT5oaXN0b3J5KSwKICsgICAgICAg
ICAgICAgICAgICAgICAgcGhhc2UsIHN0YXR1cywgc2VydmVyLnN0YXR1cywgY2xpZW50LnN0YXR1
cywKICsgICAgICAgICAgICAgICAgICAgICAgY2xpZW50X3R1cm5fY291bnQsIGNsaWVudF90dXJu
KTsKQEAgLTE5NCw3ICsxOTUsNyBAQCBpbmRleCBlMDQyMjQ2OWU0Li5hZTJhZDU5ZGQ0IDEwMDY0
NAogQEAgLTE1NjAsNiArMTYyNywxMCBAQCBzdGF0aWMgSEFORFNIQUtFX1JFU1VMVCAqZG9faGFu
ZHNoYWtlX2ludGVybmFsKAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
MCAvKiBzZXJ2ZXIgd2VudCBsYXN0ICovKTsKICAgICAgICAgIH0KLQorIAogKyAgICAgICAgc2F2
ZV9sb29wX2hpc3RvcnkoJihyZXQtPmhpc3RvcnkpLAogKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGhhc2UsIHN0YXR1cywgc2VydmVyLnN0YXR1cywgY2xpZW50LnN0YXR1cywKICsgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNsaWVudF90dXJuX2NvdW50LCBjbGllbnRfdHVybik7CkBAIC0y
MDMsNyArMjA0LDcgQEAgaW5kZXggZTA0MjI0NjllNC4uYWUyYWQ1OWRkNCAxMDA2NDQKICAgICAg
ICAgIGNhc2UgSEFORFNIQUtFX1NVQ0NFU1M6CiAgICAgICAgICAgICAgY2xpZW50X3R1cm5fY291
bnQgPSAwOwogZGlmZiAtLWdpdCBhL3Rlc3QvaGVscGVycy9oYW5kc2hha2UuaCBiL3Rlc3QvaGVs
cGVycy9oYW5kc2hha2UuaAotaW5kZXggNzhiMDNmOWY0Yi4uYjk5NjdjMjYyMyAxMDA2NDQKK2lu
ZGV4IDc4YjAzZjkuLmI5OTY3YzIgMTAwNjQ0CiAtLS0gYS90ZXN0L2hlbHBlcnMvaGFuZHNoYWtl
LmgKICsrKyBiL3Rlc3QvaGVscGVycy9oYW5kc2hha2UuaAogQEAgLTEsNSArMSw1IEBACkBAIC0y
MTQsOSArMjE1LDkgQEAgaW5kZXggNzhiMDNmOWY0Yi4uYjk5NjdjMjYyMyAxMDA2NDQKICAgKiBM
aWNlbnNlZCB1bmRlciB0aGUgQXBhY2hlIExpY2Vuc2UgMi4wICh0aGUgIkxpY2Vuc2UiKS4gIFlv
dSBtYXkgbm90IHVzZQogICAqIHRoaXMgZmlsZSBleGNlcHQgaW4gY29tcGxpYW5jZSB3aXRoIHRo
ZSBMaWNlbnNlLiAgWW91IGNhbiBvYnRhaW4gYSBjb3B5CiBAQCAtMTIsNiArMTIsMTEgQEAKLQor
IAogICNpbmNsdWRlICJzc2xfdGVzdF9jdHguaCIKLQorIAogKyNkZWZpbmUgTUFYX0hBTkRTSEFL
RV9ISVNUT1JZX0VOVFJZX0JJVCA0CiArI2RlZmluZSBNQVhfSEFORFNIQUtFX0hJU1RPUllfRU5U
UlkgKDEgPDwgTUFYX0hBTkRTSEFLRV9ISVNUT1JZX0VOVFJZX0JJVCkKICsjZGVmaW5lIE1BWF9I
QU5EU0hBS0VfSElTVE9SWV9FTlRSWV9JRFhfTUFTSyBcCkBAIC0yMjgsNyArMjI5LDcgQEAgaW5k
ZXggNzhiMDNmOWY0Yi4uYjk5NjdjMjYyMyAxMDA2NDQKIEBAIC0yMiw2ICsyNyw2MyBAQCB0eXBl
ZGVmIHN0cnVjdCBjdHhfZGF0YV9zdCB7CiAgICAgIGNoYXIgKnNlc3Npb25fdGlja2V0X2FwcF9k
YXRhOwogIH0gQ1RYX0RBVEE7Ci0KKyAKICt0eXBlZGVmIGVudW0gewogKyAgICBIQU5EU0hBS0Us
CiArICAgIFJFTkVHX0FQUExJQ0FUSU9OX0RBVEEsCkBAIC0yOTYsMjUgKzI5NywyNSBAQCBpbmRl
eCA3OGIwM2Y5ZjRiLi5iOTk2N2MyNjIzIDEwMDY0NAogKyAgICAvKiBoYW5kc2hha2UgbG9vcCBo
aXN0b3J5ICovCiArICAgIEhBTkRTSEFLRV9ISVNUT1JZIGhpc3Rvcnk7CiAgfSBIQU5EU0hBS0Vf
UkVTVUxUOwotCisgCiAgSEFORFNIQUtFX1JFU1VMVCAqSEFORFNIQUtFX1JFU1VMVF9uZXcodm9p
ZCk7CiBAQCAtOTUsNCArMTU5LDggQEAgaW50IGNvbmZpZ3VyZV9oYW5kc2hha2VfY3R4X2Zvcl9z
cnAoU1NMX0NUWCAqc2VydmVyX2N0eCwgU1NMX0NUWCAqc2VydmVyMl9jdHgsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1RYX0RBVEEgKnNlcnZlcjJfY3R4X2RhdGEsCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQ1RYX0RBVEEgKmNsaWVudF9jdHhf
ZGF0YSk7Ci0KKyAKICtjb25zdCBjaGFyICpoYW5kc2hha2VfY29ubmVjdF9waGFzZV9uYW1lKGNv
bm5lY3RfcGhhc2VfdCBwaGFzZSk7CiArY29uc3QgY2hhciAqaGFuZHNoYWtlX3N0YXR1c19uYW1l
KGhhbmRzaGFrZV9zdGF0dXNfdCBoYW5kc2hha2Vfc3RhdHVzKTsKICtjb25zdCBjaGFyICpoYW5k
c2hha2VfcGVlcl9zdGF0dXNfbmFtZShwZWVyX3N0YXR1c190IHBlZXJfc3RhdHVzKTsKICsKICAj
ZW5kaWYgIC8qIE9TU0xfVEVTVF9IQU5EU0hBS0VfSEVMUEVSX0ggKi8KIGRpZmYgLS1naXQgYS90
ZXN0L3NzbF90ZXN0LmMgYi90ZXN0L3NzbF90ZXN0LmMKLWluZGV4IGVhNjA4NTE4ZjkuLjlkNmIw
OTNjODEgMTAwNjQ0CitpbmRleCBlYTYwODUxLi45ZDZiMDkzIDEwMDY0NAogLS0tIGEvdGVzdC9z
c2xfdGVzdC5jCiArKysgYi90ZXN0L3NzbF90ZXN0LmMKIEBAIC0yNiw2ICsyNiw0NCBAQCBzdGF0
aWMgT1NTTF9MSUJfQ1RYICpsaWJjdHggPSBOVUxMOwogIC8qIEN1cnJlbnRseSB0aGUgc2VjdGlv
biBuYW1lcyBhcmUgb2YgdGhlIGZvcm0gdGVzdC08bnVtYmVyPiwgZS5nLiB0ZXN0LTE1LiAqLwog
ICNkZWZpbmUgTUFYX1RFU1RDQVNFX05BTUVfTEVOR1RIIDEwMAotCisgCiArc3RhdGljIHZvaWQg
cHJpbnRfaGFuZHNoYWtlX2hpc3RvcnkoY29uc3QgSEFORFNIQUtFX0hJU1RPUlkgKmhpc3Rvcnkp
CiArewogKyAgICBzaXplX3QgZmlyc3RfaWR4OwpAQCAtMzY4LDcgKzM2OSw0IEBAIGluZGV4IGVh
NjA4NTE4ZjkuLjlkNmIwOTNjODEgMTAwNjQ0CiArCiAgICAgIHJldHVybiByZXQ7CiAgfQotCi0t
LQotMi4yNS4xCi0KKyAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3Bl
bnNzbC9vcGVuc3NsLzAwMDEtQ29uZmlndXJlLWRvLW5vdC10d2Vhay1taXBzLWNmbGFncy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtQ29uZmln
dXJlLWRvLW5vdC10d2Vhay1taXBzLWNmbGFncy5wYXRjaAppbmRleCA1MDJhN2FhZjMyLi42NjVj
ODQzZDc4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3Bl
bnNzbC8wMDAxLUNvbmZpZ3VyZS1kby1ub3QtdHdlYWstbWlwcy1jZmxhZ3MucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1Db25maWd1cmUt
ZG8tbm90LXR3ZWFrLW1pcHMtY2ZsYWdzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMzc3
ZjBkNWI1YzEwNzllM2I5YTgwODgxZjRkY2M4OTFjYmU5ZjlhIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBlMzM1ZDY2MmI2MzAwMGI2NzIyMjJjZThjZDdlODMyY2Y3YTQxNTBmIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4KIERhdGU6IFR1ZSwgMzAgTWF5IDIwMjMgMDk6MTE6MjcgLTA3MDAKIFN1YmplY3Q6
IFtQQVRDSF0gQ29uZmlndXJlOiBkbyBub3QgdHdlYWsgbWlwcyBjZmxhZ3MKQEAgLTEyLDE1ICsx
MiwxNiBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4
LmRlPgogCiBSZWZyZXNoZWQgZm9yIG9wZW5zc2wtMy4xLjEKIFNpZ25lZC1vZmYtYnk6IFRpbSBP
cmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPgorCiAtLS0KICBDb25maWd1cmUgfCAxMCAt
LS0tLS0tLS0tCiAgMSBmaWxlIGNoYW5nZWQsIDEwIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvQ29uZmlndXJlIGIvQ29uZmlndXJlCi1pbmRleCA0NTY5OTUyLi5hZGYwMTliIDEwMDc1NQor
aW5kZXggY2NhMWFjOC4uNDVhMTJiMSAxMDA3NTUKIC0tLSBhL0NvbmZpZ3VyZQogKysrIGIvQ29u
ZmlndXJlCi1AQCAtMTQyMiwxNiArMTQyMiw2IEBAIGlmICgkdGFyZ2V0ID1+IC9ebWluZ3cvICYm
IGAkY29uZmlne0NDfSAtLXRhcmdldC1oZWxwIDI+JjFgID1+IG0vLW1uby1jeWd3aW4vbSkKK0BA
IC0xNDg1LDE2ICsxNDg1LDYgQEAgaWYgKCR0YXJnZXQgPX4gL15taW5ndy8gJiYgYCRjb25maWd7
Q0N9IC0tdGFyZ2V0LWhlbHAgMj4mMWAgPX4gbS8tbW5vLWN5Z3dpbi9tKQogICAgICAgICAgcHVz
aCBAeyRjb25maWd7c2hhcmVkX2xkZmxhZ319LCAiLW1uby1jeWd3aW4iOwogICAgICAgICAgfQog
IApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wv
MDAwMS1idWlsZGluZm8tc3RyaXAtc3lzcm9vdC1hbmQtZGVidWctcHJlZml4LW1hcC1mcm9tLWNv
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1i
dWlsZGluZm8tc3RyaXAtc3lzcm9vdC1hbmQtZGVidWctcHJlZml4LW1hcC1mcm9tLWNvLnBhdGNo
CmluZGV4IGJhZmRiYWE0NmYuLjVhNTFlOWZkOWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtYnVpbGRpbmZvLXN0cmlwLXN5c3Jvb3Qt
YW5kLWRlYnVnLXByZWZpeC1tYXAtZnJvbS1jby5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLWJ1aWxkaW5mby1zdHJpcC1zeXNyb290LWFu
ZC1kZWJ1Zy1wcmVmaXgtbWFwLWZyb20tY28ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU5
ODUyNTNmMmM5MDI1ZDdjMTI3NDQzYTNhOTkzODk0NmY4MGMyYTEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGJjOGFhY2JlOTZiMTcxNmQwNjA2MjJkN2RiYTBhMDVmYWJlNmMxN2IgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/TWFydGluPTIwSHVuZGViPUMz
PUI4bGw/PSA8bWFydGluQGdlYW5peC5jb20+CiBEYXRlOiBUdWUsIDYgTm92IDIwMTggMTQ6NTA6
NDcgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gYnVpbGRpbmZvOiBzdHJpcCBzeXNyb290IGFuZCBk
ZWJ1Zy1wcmVmaXgtbWFwIGZyb20gY29tcGlsZXIKQEAgLTM0LDExICszNCwxMSBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIGNyeXB0by9idWlsZC5pbmZv
ICAgICAgICAgICAgICAgICB8ICAyICstCiAgMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQogCi1JbmRleDogb3BlbnNzbC0zLjAuNC9Db25maWd1cmF0aW9u
cy91bml4LU1ha2VmaWxlLnRtcGwKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBvcGVuc3NsLTMuMC40Lm9yaWcv
Q29uZmlndXJhdGlvbnMvdW5peC1NYWtlZmlsZS50bXBsCi0rKysgb3BlbnNzbC0zLjAuNC9Db25m
aWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwKLUBAIC00NzIsMTMgKzQ3MiwyMyBAQCBCSU5f
TERGTEFHUz17LSBqb2luKCcgJywgJHRhcmdldHtiaW5fbGZsCitkaWZmIC0tZ2l0IGEvQ29uZmln
dXJhdGlvbnMvdW5peC1NYWtlZmlsZS50bXBsIGIvQ29uZmlndXJhdGlvbnMvdW5peC1NYWtlZmls
ZS50bXBsCitpbmRleCBiMzM1MGExLi41ZTg4NzlhIDEwMDY0NAorLS0tIGEvQ29uZmlndXJhdGlv
bnMvdW5peC1NYWtlZmlsZS50bXBsCisrKysgYi9Db25maWd1cmF0aW9ucy91bml4LU1ha2VmaWxl
LnRtcGwKK0BAIC00ODEsMTMgKzQ4MSwyMyBAQCBCSU5fTERGTEFHUz17LSBqb2luKCcgJywgJHRh
cmdldHtiaW5fbGZsYWdzfSB8fCAoKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgJyQoQ05G
X0xERkxBR1MpJywgJyQoTERGTEFHUyknKSAtfQogIEJJTl9FWF9MSUJTPSQoQ05GX0VYX0xJQlMp
ICQoRVhfTElCUykKICAKQEAgLTYzLDExICs2MywxMSBAQCBJbmRleDogb3BlbnNzbC0zLjAuNC9D
b25maWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwKICBQRVJMQVNNX1NDSEVNRT0gey0gJHRh
cmdldHtwZXJsYXNtX3NjaGVtZX0gLX0KICAKICAjIEZvciB4ODYgYXNzZW1ibGVyOiBTZXQgUFJP
Q0VTU09SIHRvIDM4NiBpZiB5b3Ugd2FudCB0byBzdXBwb3J0Ci1JbmRleDogb3BlbnNzbC0zLjAu
NC9jcnlwdG8vYnVpbGQuaW5mbwotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0tIG9wZW5zc2wtMy4wLjQub3JpZy9j
cnlwdG8vYnVpbGQuaW5mbwotKysrIG9wZW5zc2wtMy4wLjQvY3J5cHRvL2J1aWxkLmluZm8KLUBA
IC0xMDksNyArMTA5LDcgQEAgREVGSU5FWy4uL2xpYmNyeXB0b109JFVQTElOS0RFRgorZGlmZiAt
LWdpdCBhL2NyeXB0by9idWlsZC5pbmZvIGIvY3J5cHRvL2J1aWxkLmluZm8KK2luZGV4IDJkNWIy
MmYuLjk2MjNmMDIgMTAwNjQ0CistLS0gYS9jcnlwdG8vYnVpbGQuaW5mbworKysrIGIvY3J5cHRv
L2J1aWxkLmluZm8KK0BAIC0xMTUsNyArMTE1LDcgQEAgREVGSU5FWy4uL2xpYmNyeXB0b109JFVQ
TElOS0RFRgogIAogIERFUEVORFtpbmZvLm9dPWJ1aWxkaW5mLmgKICBERVBFTkRbY3ZlcnNpb24u
b109YnVpbGRpbmYuaApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NsL29wZW5zc2wvMDAwMS1yaXNjdi1GaXgtbWlzcGVsbGluZy1vZi1leHRlbnNpb24tdGVzdC1t
YWNyby5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAw
MDEtcmlzY3YtRml4LW1pc3BlbGxpbmctb2YtZXh0ZW5zaW9uLXRlc3QtbWFjcm8ucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDFkMjE3YmQ4ZTMuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1yaXNjdi1GaXgt
bWlzcGVsbGluZy1vZi1leHRlbnNpb24tdGVzdC1tYWNyby5wYXRjaAorKysgL2Rldi9udWxsCkBA
IC0xLDMxICswLDAgQEAKLUZyb20gYjUxMDMxYjA1ZjcyOTIzZmYxY2YzYjZhNDc2NzQ1MGRlZTg5
ZDdmNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEdyYW50IE5pY2hvbCA8bWVAZ3Jh
bnRuaWNob2wuY29tPgotRGF0ZTogRnJpLCAyMiBEZWMgMjAyMyAyMzo0NjozOSAtMDYwMAotU3Vi
amVjdDogW1BBVENIXSByaXNjdjogRml4IG1pc3BlbGxpbmcgb2YgZXh0ZW5zaW9uIHRlc3QgbWFj
cm8KLQotV2hlbiByZWZhY3RvcmluZyB0aGUgcmlzY3YgZXh0ZW5zaW9uIHRlc3QgbWFjcm9zLAot
UklTQ1ZfSEFTX1pLTkRfQU5EX1pLTkUgd2FzIG1pc3BlbGxlZC4KLQotQ0xBOiB0cml2aWFsCi1V
cHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vb3BlbnNzbC9vcGVu
c3NsL3B1bGwvMjMxMzldCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgotLS0tCi0gcHJvdmlkZXJzL2ltcGxlbWVudGF0aW9ucy9jaXBoZXJzL2NpcGhlcl9hZXNf
eHRzX2h3LmMgfCAyICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9wcm92aWRlcnMvaW1wbGVtZW50YXRpb25zL2NpcGhlcnMv
Y2lwaGVyX2Flc194dHNfaHcuYyBiL3Byb3ZpZGVycy9pbXBsZW1lbnRhdGlvbnMvY2lwaGVycy9j
aXBoZXJfYWVzX3h0c19ody5jCi1pbmRleCA1NjRkNmQ2Li40Y2YxMzYxIDEwMDY0NAotLS0tIGEv
cHJvdmlkZXJzL2ltcGxlbWVudGF0aW9ucy9jaXBoZXJzL2NpcGhlcl9hZXNfeHRzX2h3LmMKLSsr
KyBiL3Byb3ZpZGVycy9pbXBsZW1lbnRhdGlvbnMvY2lwaGVycy9jaXBoZXJfYWVzX3h0c19ody5j
Ci1AQCAtMjI1LDcgKzIyNSw3IEBAIHN0YXRpYyBjb25zdCBQUk9WX0NJUEhFUl9IVyBhZXNfeHRz
X3J2MzJpX3pia2JfemtuZF96a25lID0geyAgICAgICAgICAgICAgICAgICBcCi0gIyBkZWZpbmUg
UFJPVl9DSVBIRVJfSFdfc2VsZWN0X3h0cygpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKLSBpZiAoUklTQ1ZfSEFTX1pCS0JfQU5EX1pLTkRfQU5EX1pLTkUoKSkg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICByZXR1cm4gJmFl
c194dHNfcnYzMmlfemJrYl96a25kX3prbmU7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCi0taWYgKFJJU0NWX0hBU19aS05EX1pLTkUoKSkgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLStpZiAoUklTQ1ZfSEFTX1pLTkRf
QU5EX1pLTkUoKSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAotICAgICByZXR1cm4gJmFlc194dHNfcnYzMmlfemtuZF96a25lOwotICMgZWxzZQotIC8q
IFRoZSBnZW5lcmljIGNhc2UgKi8KLS0tIAotMi40My4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsL2FhcmNoNjQtYnRpLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvYWFyY2g2NC1idGkucGF0Y2gK
ZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDJhMTZkZWJiNzYuLjAwMDAwMDAwMDAKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvYWFyY2g2NC1idGku
cGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNSArMCwwIEBACi1Gcm9tIGFkMzQ3YzlmZjBmZDkz
YmRkMmZhMjA4NTYxMWM2NWI4OGU5NDgyOWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9t
OiAiZmFuZ21pbmcuZmFuZyIgPGZhbmdtaW5nLmZhbmdAYXJtLmNvbT4KLURhdGU6IFRodSwgNyBE
ZWMgMjAyMyAwNjoxNzo1MSArMDAwMAotU3ViamVjdDogW1BBVENIXSBFbmFibGUgQlRJIGZlYXR1
cmUgZm9yIG1kNSBvbiBhYXJjaDY0Ci0KLUZpeGVzOiAjMjI5NTkKLQotUmV2aWV3ZWQtYnk6IFRv
bSBDb3Nncm92ZSA8dG9tLmNvc2dyb3ZlQGFybS5jb20+Ci1SZXZpZXdlZC1ieTogVG9tYXMgTXJh
eiA8dG9tYXNAb3BlbnNzbC5vcmc+Ci0oTWVyZ2VkIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5zc2wvb3BlbnNzbC9wdWxsLzIyOTcxKQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1T
aWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLS0tLQotIGNy
eXB0by9tZDUvYXNtL21kNS1hYXJjaDY0LnBsIHwgMyArKysKLSAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9jcnlwdG8vbWQ1L2FzbS9tZDUtYWFyY2g2NC5w
bCBiL2NyeXB0by9tZDUvYXNtL21kNS1hYXJjaDY0LnBsCi1pbmRleCAzMjAwYTBmYTliZmYwLi41
YTg2MDgwNjk2OTFkIDEwMDc1NQotLS0tIGEvY3J5cHRvL21kNS9hc20vbWQ1LWFhcmNoNjQucGwK
LSsrKyBiL2NyeXB0by9tZDUvYXNtL21kNS1hYXJjaDY0LnBsCi1AQCAtMjgsMTAgKzI4LDEzIEBA
Ci0gKlNURE9VVD0qT1VUOwotIAotICRjb2RlIC49IDw8RU9GOwotKyNpbmNsdWRlICJhcm1fYXJj
aC5oIgotKwotIC50ZXh0Ci0gLmdsb2JsICBvc3NsX21kNV9ibG9ja19hc21fZGF0YV9vcmRlcgot
IC50eXBlICAgb3NzbF9tZDVfYmxvY2tfYXNtX2RhdGFfb3JkZXIsXEBmdW5jdGlvbgotIG9zc2xf
bWQ1X2Jsb2NrX2FzbV9kYXRhX29yZGVyOgotKyAgICAgICAgQUFSQ0g2NF9WQUxJRF9DQUxMX1RB
UkdFVAotICAgICAgICAgLy8gU2F2ZSBhbGwgY2FsbGVlLXNhdmVkIHJlZ2lzdGVycwotICAgICAg
ICAgc3RwICAgICB4MTkseDIwLFtzcCwjLTgwXSEKLSAgICAgICAgIHN0cCAgICAgeDIxLHgyMixb
c3AsIzE2XQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29w
ZW5zc2xfMy4yLjAuYmIgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNz
bF8zLjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbF8zLjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMy4yLjEuYmIKaW5kZXggY2YwOGNkYmFh
MC4uZjkwMzEzNjYyMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NsL29wZW5zc2xfMy4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVu
c3NsL29wZW5zc2xfMy4yLjEuYmIKQEAgLTEyLDE1ICsxMiwxNCBAQCBTUkNfVVJJID0gImh0dHA6
Ly93d3cub3BlbnNzbC5vcmcvc291cmNlL29wZW5zc2wtJHtQVn0udGFyLmd6IFwKICAgICAgICAg
ICAgZmlsZTovLzAwMDEtYnVpbGRpbmZvLXN0cmlwLXN5c3Jvb3QtYW5kLWRlYnVnLXByZWZpeC1t
YXAtZnJvbS1jby5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUNvbmZpZ3VyZS1kby1u
b3QtdHdlYWstbWlwcy1jZmxhZ3MucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGRl
ZC1oYW5kc2hha2UtaGlzdG9yeS1yZXBvcnRpbmctd2hlbi10ZXN0LWZhaWxzLnBhdGNoIFwKLSAg
ICAgICAgICAgZmlsZTovL2FhcmNoNjQtYnRpLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAw
MDEtcmlzY3YtRml4LW1pc3BlbGxpbmctb2YtZXh0ZW5zaW9uLXRlc3QtbWFjcm8ucGF0Y2ggXAor
ICAgICAgICAgICBmaWxlOi8vZW52aXJvbm1lbnQuZC1vcGVuc3NsLnNoIFwKICAgICAgICAgICAg
IgogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmVzZGsgPSAiIFwKICAgICAgICAgICAgZmls
ZTovL2Vudmlyb25tZW50LmQtb3BlbnNzbC5zaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjE0YzgyNmYwN2M3ZTQzMzcwNmZiNWM2OWZhOWUyNWRhYjk1Njg0ODQ0YjRj
OTYyYTJjZjFiZjE4M2ViNDY5MGUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODNjNzMyOWZlNTJj
ODUwNjc3ZDc1ZTVkMGIwY2EyNDUzMDliOTdlOGVjYmNmZGMxZGZkYzRhYjlmYWMzNWIzOSIKIAog
aW5oZXJpdCBsaWJfcGFja2FnZSBtdWx0aWxpYl9oZWFkZXIgbXVsdGlsaWJfc2NyaXB0IHB0ZXN0
IHBlcmxuYXRpdmUgbWFucGFnZXMKIE1VTFRJTElCX1NDUklQVFMgPSAiJHtQTn0tYmluOiR7Ymlu
ZGlyfS9jX3JlaGFzaCIKLS0gCjIuNDIuMAoK

--===============8446398572594134342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/openssl/openssl-ptest: FILELIST: added "/usr/lib/openssl/ptest/test/smime-certs/smrsa3-cert.pem /usr/lib/openssl/ptest/test/recipes/91-test_pkey_check_data/rsapub_17k.pem /usr/lib/openssl/ptest/test/smime-certs/smrsa3-key.pem /usr/lib/openssl/ptest/test/recipes/80-test_pkcs12_data/bad1.p12 /usr/lib/openssl/ptest/test/recipes/04-test_asn1_stable_parse_data/asn1_stable_parse.cnf /usr/lib/openssl/ptest/test/recipes/80-test_pkcs12_data/bad2.p12 /usr/lib/openssl/ptest/test/x509_load_cert_file_test.c /usr/lib/openssl/ptest/test/x509_load_cert_file_test /usr/lib/openssl/ptest/test/recursive.cnf /usr/lib/openssl/ptest/test/recipes/80-test_pkcs12_data/bad3.p12 /usr/lib/openssl/ptest/test/invalid-x509.cnf /usr/lib/openssl/ptest/test/asn1_stable_parse_test /usr/lib/openssl/ptest/test/asn1_stable_parse_test.c /usr/lib/openssl/ptest/test/test_asn1_parse.cnf /usr/lib/openssl/ptest/test/recipes/04-test_asn1_stable_parse.t /usr/lib/openssl/ptest/test/recipes/60-test_x509
 _load_cert_file.t /usr/lib/openssl/ptest/test/recipes/04-test_asn1_parse.t /usr/lib/openssl/ptest/test/p_minimal.c /usr/lib/openssl/ptest/test/recipes/15-test_gensm2.t"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3 was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7800.3-gdb.py was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7800.3-gdb.py was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3 was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7800.3-gdb.py was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7800.3-gdb.py was removed

--===============8446398572594134342==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/openssl: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl: SRC_URI changed from "http://www.openssl.org/source/openssl-3.2.0.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://0001-Added-handshake-history-reporting-when-test-fails.patch file://aarch64-bti.patch file://0001-riscv-Fix-mispelling-of-extension-test-macro.patch" to "http://www.openssl.org/source/openssl-3.2.1.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://0001-Added-handshake-history-reporting-when-test-fails.patch file://environment.d-openssl.sh"
packages/core2-64-poky-linux/openssl: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/libcrypto: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/libcrypto: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/libssl: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/libssl: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-bin: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-bin: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-conf: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-conf: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-dbg: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-dbg: FILELIST: added "/usr/lib/openssl/ptest/test/.debug/x509_load_cert_file_test /usr/lib/openssl/ptest/test/.debug/asn1_stable_parse_test"
packages/core2-64-poky-linux/openssl/openssl-dbg: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-dbg: PKGSIZE changed from 1161914984 to 1163515080 (+0%)
packages/core2-64-poky-linux/openssl/openssl-dev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-dev: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-dev: PKGSIZE changed from 2017626 to 2018042 (+0%)
packages/core2-64-poky-linux/openssl/openssl-doc: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-doc: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-engines: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-engines: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-locale: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-locale: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-misc: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-misc: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-ossl-module-legacy: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-ossl-module-legacy: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-ptest: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-ptest: FILELIST: added "/usr/lib/openssl/ptest/test/smime-certs/smrsa3-cert.pem /usr/lib/openssl/ptest/test/x509_load_cert_file_test.c /usr/lib/openssl/ptest/test/test_asn1_parse.cnf /usr/lib/openssl/ptest/test/recursive.cnf /usr/lib/openssl/ptest/test/recipes/91-test_pkey_check_data/rsapub_17k.pem /usr/lib/openssl/ptest/test/recipes/80-test_pkcs12_data/bad2.p12 /usr/lib/openssl/ptest/test/recipes/60-test_x509_load_cert_file.t /usr/lib/openssl/ptest/test/asn1_stable_parse_test.c /usr/lib/openssl/ptest/test/asn1_stable_parse_test /usr/lib/openssl/ptest/test/recipes/04-test_asn1_stable_parse_data/asn1_stable_parse.cnf /usr/lib/openssl/ptest/test/recipes/80-test_pkcs12_data/bad1.p12 /usr/lib/openssl/ptest/test/recipes/80-test_pkcs12_data/bad3.p12 /usr/lib/openssl/ptest/test/smime-certs/smrsa3-key.pem /usr/lib/openssl/ptest/test/recipes/15-test_gensm2.t /usr/lib/openssl/ptest/test/recipes/04-test_asn1_stable_parse.t /usr/lib/openssl/ptest/test
 /recipes/04-test_asn1_parse.t /usr/lib/openssl/ptest/test/x509_load_cert_file_test /usr/lib/openssl/ptest/test/p_minimal.c /usr/lib/openssl/ptest/test/invalid-x509.cnf"
packages/core2-64-poky-linux/openssl/openssl-ptest: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-ptest: PKGSIZE changed from 535918661 to 536629762 (+0%)
packages/core2-64-poky-linux/openssl/openssl-src: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-src: FILELIST: directory renamed /usr/src/debug/openssl/3.2.0/crypto/evp -> /usr/src/debug/openssl/3.2.1/crypto/evp, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/signature -> /usr/src/debug/openssl/3.2.1/providers/implementations/signature, directory renamed /usr/src/debug/openssl/3.2.0/crypto/hpke -> /usr/src/debug/openssl/3.2.1/crypto/hpke, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ocsp -> /usr/src/debug/openssl/3.2.1/crypto/ocsp, directory renamed /usr/src/debug/openssl/3.2.0/crypto/rsa -> /usr/src/debug/openssl/3.2.1/crypto/rsa, directory renamed /usr/src/debug/openssl/3.2.0/ssl/record -> /usr/src/debug/openssl/3.2.1/ssl/record, directory renamed /usr/src/debug/openssl/3.2.0/test/testutil -> /usr/src/debug/openssl/3.2.1/test/testutil, directory renamed /usr/src/debug/openssl/3.2.0/include/crypto -> /usr/src/debug/openssl/3.2.1/include/crypto, directory renamed /usr/src/debug/openssl/3.2.0/crypto/
 pkcs7 -> /usr/src/debug/openssl/3.2.1/crypto/pkcs7, directory renamed /usr/src/debug/openssl/3.2.0/crypto/conf -> /usr/src/debug/openssl/3.2.1/crypto/conf, directory renamed /usr/src/debug/openssl/3.2.0/crypto/buffer -> /usr/src/debug/openssl/3.2.1/crypto/buffer, directory renamed /usr/src/debug/openssl/3.2.0/engines -> /usr/src/debug/openssl/3.2.1/engines, directory renamed /usr/src/debug/openssl/3.2.0/crypto/crmf -> /usr/src/debug/openssl/3.2.1/crypto/crmf, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ripemd -> /usr/src/debug/openssl/3.2.1/crypto/ripemd, directory renamed /usr/src/debug/openssl/3.2.0/crypto/x509 -> /usr/src/debug/openssl/3.2.1/crypto/x509, directory renamed /usr/src/debug/openssl/3.2.0/crypto/asn1 -> /usr/src/debug/openssl/3.2.1/crypto/asn1, directory renamed /usr/src/debug/openssl/3.2.0/apps -> /usr/src/debug/openssl/3.2.1/apps, directory renamed /usr/src/debug/openssl/3.2.0/fuzz -> /usr/src/debug/openssl/3.2.1/fuzz, directory renamed /usr/src/debug/open
 ssl/3.2.0/include/internal -> /usr/src/debug/openssl/3.2.1/include/internal, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/exchange -> /usr/src/debug/openssl/3.2.1/providers/implementations/exchange, directory renamed /usr/src/debug/openssl/3.2.0/util -> /usr/src/debug/openssl/3.2.1/util, directory renamed /usr/src/debug/openssl/3.2.0/crypto/cmp -> /usr/src/debug/openssl/3.2.1/crypto/cmp, directory renamed /usr/src/debug/openssl/3.2.0/crypto -> /usr/src/debug/openssl/3.2.1/crypto, directory renamed /usr/src/debug/openssl/3.2.0/crypto/cms -> /usr/src/debug/openssl/3.2.1/crypto/cms, directory renamed /usr/src/debug/openssl/3.2.0/crypto/comp -> /usr/src/debug/openssl/3.2.1/crypto/comp, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/rands/seeding -> /usr/src/debug/openssl/3.2.1/providers/implementations/rands/seeding, directory renamed /usr/src/debug/openssl/3.2.0/crypto/store -> /usr/src/debug/openssl/3.2.1/crypto/store, directory re
 named /usr/src/debug/openssl/3.2.0/providers/implementations/macs -> /usr/src/debug/openssl/3.2.1/providers/implementations/macs, directory renamed /usr/src/debug/openssl/3.2.0/crypto/async -> /usr/src/debug/openssl/3.2.1/crypto/async, directory renamed /usr/src/debug/openssl/3.2.0/crypto/txt_db -> /usr/src/debug/openssl/3.2.1/crypto/txt_db, directory renamed /usr/src/debug/openssl/3.2.0/crypto/stack -> /usr/src/debug/openssl/3.2.1/crypto/stack, directory renamed /usr/src/debug/openssl/3.2.0/crypto/lhash -> /usr/src/debug/openssl/3.2.1/crypto/lhash, directory renamed /usr/src/debug/openssl/3.2.0/crypto/des -> /usr/src/debug/openssl/3.2.1/crypto/des, directory renamed /usr/src/debug/openssl/3.2.0/crypto/rc2 -> /usr/src/debug/openssl/3.2.1/crypto/rc2, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/kem -> /usr/src/debug/openssl/3.2.1/providers/implementations/kem, directory renamed /usr/src/debug/openssl/3.2.0/crypto/modes -> /usr/src/debug/openssl/3.2.1/crypt
 o/modes, directory renamed /usr/src/debug/openssl/3.2.0/crypto/rc4 -> /usr/src/debug/openssl/3.2.1/crypto/rc4, directory renamed /usr/src/debug/openssl/3.2.0/test/helpers -> /usr/src/debug/openssl/3.2.1/test/helpers, directory renamed /usr/src/debug/openssl/3.2.0/crypto/poly1305 -> /usr/src/debug/openssl/3.2.1/crypto/poly1305, directory renamed /usr/src/debug/openssl/3.2.0/crypto/hmac -> /usr/src/debug/openssl/3.2.1/crypto/hmac, directory renamed /usr/src/debug/openssl/3.2.0/crypto/idea -> /usr/src/debug/openssl/3.2.1/crypto/idea, directory renamed /usr/src/debug/openssl/3.2.0/crypto/pem -> /usr/src/debug/openssl/3.2.1/crypto/pem, directory renamed /usr/src/debug/openssl/3.2.0/crypto/pkcs12 -> /usr/src/debug/openssl/3.2.1/crypto/pkcs12, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/digests -> /usr/src/debug/openssl/3.2.1/providers/implementations/digests, directory renamed /usr/src/debug/openssl/3.2.0/crypto/dh -> /usr/src/debug/openssl/3.2.1/crypto/dh, di
 rectory renamed /usr/src/debug/openssl/3.2.0/crypto/ffc -> /usr/src/debug/openssl/3.2.1/crypto/ffc, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/ciphers -> /usr/src/debug/openssl/3.2.1/providers/implementations/ciphers, directory renamed /usr/src/debug/openssl/3.2.0/crypto/siphash -> /usr/src/debug/openssl/3.2.1/crypto/siphash, directory renamed /usr/src/debug/openssl/3.2.0/providers/common/include/prov -> /usr/src/debug/openssl/3.2.1/providers/common/include/prov, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ui -> /usr/src/debug/openssl/3.2.1/crypto/ui, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/encode_decode -> /usr/src/debug/openssl/3.2.1/providers/implementations/encode_decode, directory renamed /usr/src/debug/openssl/3.2.0/crypto/camellia -> /usr/src/debug/openssl/3.2.1/crypto/camellia, directory renamed /usr/src/debug/openssl/3.2.0/crypto/chacha -> /usr/src/debug/openssl/3.2.1/crypto/chacha, directory renamed /
 usr/src/debug/openssl/3.2.0/crypto/bn/asm -> /usr/src/debug/openssl/3.2.1/crypto/bn/asm, directory renamed /usr/src/debug/openssl/3.2.0/crypto/whrlpool -> /usr/src/debug/openssl/3.2.1/crypto/whrlpool, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/rands -> /usr/src/debug/openssl/3.2.1/providers/implementations/rands, directory renamed /usr/src/debug/openssl/3.2.0/crypto/mdc2 -> /usr/src/debug/openssl/3.2.1/crypto/mdc2, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ec/curve448/arch_32 -> /usr/src/debug/openssl/3.2.1/crypto/ec/curve448/arch_32, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ts -> /usr/src/debug/openssl/3.2.1/crypto/ts, directory renamed /usr/src/debug/openssl/3.2.0/crypto/sha -> /usr/src/debug/openssl/3.2.1/crypto/sha, directory renamed /usr/src/debug/openssl/3.2.0/crypto/property -> /usr/src/debug/openssl/3.2.1/crypto/property, directory renamed /usr/src/debug/openssl/3.2.0/crypto/aria -> /usr/src/debug/openssl/3.2.1/crypto/ar
 ia, directory renamed /usr/src/debug/openssl/3.2.0/crypto/bio -> /usr/src/debug/openssl/3.2.1/crypto/bio, directory renamed /usr/src/debug/openssl/3.2.0/crypto/engine -> /usr/src/debug/openssl/3.2.1/crypto/engine, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ec/curve448/arch_64 -> /usr/src/debug/openssl/3.2.1/crypto/ec/curve448/arch_64, directory renamed /usr/src/debug/openssl/3.2.0/crypto/seed -> /usr/src/debug/openssl/3.2.1/crypto/seed, directory renamed /usr/src/debug/openssl/3.2.0/crypto/rand -> /usr/src/debug/openssl/3.2.1/crypto/rand, directory renamed /usr/src/debug/openssl/3.2.0/apps/lib -> /usr/src/debug/openssl/3.2.1/apps/lib, directory renamed /usr/src/debug/openssl/3.2.0/crypto/md5 -> /usr/src/debug/openssl/3.2.1/crypto/md5, directory renamed /usr/src/debug/openssl/3.2.0/crypto/md4 -> /usr/src/debug/openssl/3.2.1/crypto/md4, directory renamed /usr/src/debug/openssl/3.2.0/crypto/thread -> /usr/src/debug/openssl/3.2.1/crypto/thread, directory renamed /usr/src/debu
 g/openssl/3.2.0/providers/implementations/keymgmt -> /usr/src/debug/openssl/3.2.1/providers/implementations/keymgmt, directory renamed /usr/src/debug/openssl/3.2.0/crypto/srp -> /usr/src/debug/openssl/3.2.1/crypto/srp, directory renamed /usr/src/debug/openssl/3.2.0/crypto/bf -> /usr/src/debug/openssl/3.2.1/crypto/bf, directory renamed /usr/src/debug/openssl/3.2.0/crypto/bn -> /usr/src/debug/openssl/3.2.1/crypto/bn, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ec -> /usr/src/debug/openssl/3.2.1/crypto/ec, directory renamed /usr/src/debug/openssl/3.2.0/crypto/aes -> /usr/src/debug/openssl/3.2.1/crypto/aes, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ess -> /usr/src/debug/openssl/3.2.1/crypto/ess, directory renamed /usr/src/debug/openssl/3.2.0/include/openssl -> /usr/src/debug/openssl/3.2.1/include/openssl, directory renamed /usr/src/debug/openssl/3.2.0/ssl -> /usr/src/debug/openssl/3.2.1/ssl, directory renamed /usr/src/debug/openssl/3.2.0/crypto/sm4 -> /usr/src/debu
 g/openssl/3.2.1/crypto/sm4, directory renamed /usr/src/debug/openssl/3.2.0/crypto/sm2 -> /usr/src/debug/openssl/3.2.1/crypto/sm2, directory renamed /usr/src/debug/openssl/3.2.0/crypto/sm3 -> /usr/src/debug/openssl/3.2.1/crypto/sm3, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/storemgmt -> /usr/src/debug/openssl/3.2.1/providers/implementations/storemgmt, directory renamed /usr/src/debug/openssl/3.2.0/crypto/encode_decode -> /usr/src/debug/openssl/3.2.1/crypto/encode_decode, directory renamed /usr/src/debug/openssl/3.2.0/ssl/quic -> /usr/src/debug/openssl/3.2.1/ssl/quic, directory renamed /usr/src/debug/openssl/3.2.0/ssl/record/methods -> /usr/src/debug/openssl/3.2.1/ssl/record/methods, directory renamed /usr/src/debug/openssl/3.2.0/crypto/cmac -> /usr/src/debug/openssl/3.2.1/crypto/cmac, directory renamed /usr/src/debug/openssl/3.2.0/crypto/http -> /usr/src/debug/openssl/3.2.1/crypto/http, directory renamed /usr/src/debug/openssl/3.2.0/crypto/dsa -> /usr/s
 rc/debug/openssl/3.2.1/crypto/dsa, directory renamed /usr/src/debug/openssl/3.2.0/providers/common -> /usr/src/debug/openssl/3.2.1/providers/common, directory renamed /usr/src/debug/openssl/3.2.0/crypto/dso -> /usr/src/debug/openssl/3.2.1/crypto/dso, directory renamed /usr/src/debug/openssl/3.2.0/crypto/cast -> /usr/src/debug/openssl/3.2.1/crypto/cast, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/asymciphers -> /usr/src/debug/openssl/3.2.1/providers/implementations/asymciphers, directory renamed /usr/src/debug/openssl/3.2.0/apps/include -> /usr/src/debug/openssl/3.2.1/apps/include, directory renamed /usr/src/debug/openssl/3.2.0/crypto/kdf -> /usr/src/debug/openssl/3.2.1/crypto/kdf, directory renamed /usr/src/debug/openssl/3.2.0/crypto/objects -> /usr/src/debug/openssl/3.2.1/crypto/objects, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/kdfs -> /usr/src/debug/openssl/3.2.1/providers/implementations/kdfs, directory renamed /usr/src
 /debug/openssl/3.2.0/providers -> /usr/src/debug/openssl/3.2.1/providers, directory renamed /usr/src/debug/openssl/3.2.0/crypto/async/arch -> /usr/src/debug/openssl/3.2.1/crypto/async/arch, directory renamed /usr/src/debug/openssl/3.2.0/providers/implementations/include/prov -> /usr/src/debug/openssl/3.2.1/providers/implementations/include/prov, directory renamed /usr/src/debug/openssl/3.2.0/providers/common/der -> /usr/src/debug/openssl/3.2.1/providers/common/der, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ct -> /usr/src/debug/openssl/3.2.1/crypto/ct, directory renamed /usr/src/debug/openssl/3.2.0/crypto/err -> /usr/src/debug/openssl/3.2.1/crypto/err, directory renamed /usr/src/debug/openssl/3.2.0/ssl/statem -> /usr/src/debug/openssl/3.2.1/ssl/statem, directory renamed /usr/src/debug/openssl/3.2.0/crypto/ec/curve448 -> /usr/src/debug/openssl/3.2.1/crypto/ec/curve448, directory renamed /usr/src/debug/openssl/3.2.0/crypto/thread/arch -> /usr/src/debug/openssl/3.2.1/crypto/
 thread/arch, removed "/usr/src/debug/openssl/3.2.0/test/testutil.h /usr/src/debug/openssl/3.2.0/test/threadstest_fips.c /usr/src/debug/openssl/3.2.0/test/evp_kdf_test.c /usr/src/debug/openssl/3.2.0/test/timing_load_creds.c /usr/src/debug/openssl/3.2.0/test/ssl_old_test.c /usr/src/debug/openssl/3.2.0/test/ssl_test_ctx_test.c /usr/src/debug/openssl/3.2.0/test/context_internal_test.c /usr/src/debug/openssl/3.2.0/test/keymgmt_internal_test.c /usr/src/debug/openssl/3.2.0/test/quicfaultstest.c /usr/src/debug/openssl/3.2.0/test/rdcpu_sanitytest.c /usr/src/debug/openssl/3.2.0/test/evp_extra_test2.c /usr/src/debug/openssl/3.2.0/test/cmsapitest.c /usr/src/debug/openssl/3.2.0/test/enginetest.c /usr/src/debug/openssl/3.2.0/test/exdatatest.c /usr/src/debug/openssl/3.2.0/test/gmdifftest.c /usr/src/debug/openssl/3.2.0/test/lhash_test.c /usr/src/debug/openssl/3.2.0/test/aesgcmtest.c /usr/src/debug/openssl/3.2.0/test/bio_prefix_text.c /usr/src/debug/openssl/3.2.0/test/localetest.c /usr/src/debug/ope
 nssl/3.2.0/test/ocspapitest.c /usr/src/debug/openssl/3.2.0/test/packettest.c /usr/src/debug/openssl/3.2.0/test/quic_txp_test.c /usr/src/debug/openssl/3.2.0/test/quicapitest.c /usr/src/debug/openssl/3.2.0/test/params_api_test.c /usr/src/debug/openssl/3.2.0/test/pkcs12_api_test.c /usr/src/debug/openssl/3.2.0/test/tls13encryptiontest.c /usr/src/debug/openssl/3.2.0/test/hpke_test.c /usr/src/debug/openssl/3.2.0/test/http_test.c /usr/src/debug/openssl/3.2.0/test/list_test.c /usr/src/debug/openssl/3.2.0/test/pbelutest.c /usr/src/debug/openssl/3.2.0/test/conf_include_test.c /usr/src/debug/openssl/3.2.0/test/asynciotest.c /usr/src/debug/openssl/3.2.0/test/dtls_mtu_test.c /usr/src/debug/openssl/3.2.0/test/property_test.c /usr/src/debug/openssl/3.2.0/test/provfetchtest.c /usr/src/debug/openssl/3.2.0/test/bio_tfo_test.c /usr/src/debug/openssl/3.2.0/test/x509_check_cert_pkey_test.c /usr/src/debug/openssl/3.2.0/test/cmp_status_test.c /usr/src/debug/openssl/3.2.0/test/rsa_x931_test.c /usr/src/debu
 g/openssl/3.2.0/test/evp_fetch_prov_test.c /usr/src/debug/openssl/3.2.0/test/cmp_asn_test.c /usr/src/debug/openssl/3.2.0/test/asn1_decode_test.c /usr/src/debug/openssl/3.2.0/test/priority_queue_test.c /usr/src/debug/openssl/3.2.0/test/quic_newcid_test.c /usr/src/debug/openssl/3.2.0/test/quic_record_test.c /usr/src/debug/openssl/3.2.0/test/tls-provider.c /usr/src/debug/openssl/3.2.0/test/tls13secretstest.c /usr/src/debug/openssl/3.2.0/test/v3ext.c /usr/src/debug/openssl/3.2.0/test/x509aux.c /usr/src/debug/openssl/3.2.0/test/evp_pkey_provided_test.c /usr/src/debug/openssl/3.2.0/test/quic_record_test_util.h /usr/src/debug/openssl/3.2.0/test/recordlentest.c /usr/src/debug/openssl/3.2.0/test/bad_dtls_test.c /usr/src/debug/openssl/3.2.0/test/versions.c /usr/src/debug/openssl/3.2.0/test/bio_memleak_test.c /usr/src/debug/openssl/3.2.0/test/bio_addr_test.c /usr/src/debug/openssl/3.2.0/test/dhkem_test.inc /usr/src/debug/openssl/3.2.0/test/casttest.c /usr/src/debug/openssl/3.2.0/test/params_co
 nversion_test.c /usr/src/debug/openssl/3.2.0/test/cmactest.c /usr/src/debug/openssl/3.2.0/test/d2i_test.c /usr/src/debug/openssl/3.2.0/test/danetest.c /usr/src/debug/openssl/3.2.0/test/drbgtest.c /usr/src/debug/openssl/3.2.0/test/dtlstest.c /usr/src/debug/openssl/3.2.0/test/evp_test.c /usr/src/debug/openssl/3.2.0/test/cmp_protect_test.c /usr/src/debug/openssl/3.2.0/test/namemap_internal_test.c /usr/src/debug/openssl/3.2.0/test/algorithmid_test.c /usr/src/debug/openssl/3.2.0/test/nodefltctxtest.c /usr/src/debug/openssl/3.2.0/test/prov_config_test.c /usr/src/debug/openssl/3.2.0/test/quic_stream_test.c /usr/src/debug/openssl/3.2.0/test/evp_pkey_ctx_new_from_name.c /usr/src/debug/openssl/3.2.0/test/cmp_server_test.c /usr/src/debug/openssl/3.2.0/test/uitest.c /usr/src/debug/openssl/3.2.0/test/ssl_handshake_rtt_test.c /usr/src/debug/openssl/3.2.0/test/dsa_no_digest_size_test.c /usr/src/debug/openssl/3.2.0/test/evp_pkey_dparams_test.c /usr/src/debug/openssl/3.2.0/test/cmp_hdr_test.c /usr/s
 rc/debug/openssl/3.2.0/test/ctype_internal_test.c /usr/src/debug/openssl/3.2.0/test/modes_internal_test.c /usr/src/debug/openssl/3.2.0/test/asn1_encode_test.c /usr/src/debug/openssl/3.2.0/test/defltfips_test.c /usr/src/debug/openssl/3.2.0/test/evp_pkey_dhkem_test.c /usr/src/debug/openssl/3.2.0/test/quic_fifd_test.c /usr/src/debug/openssl/3.2.0/test/quic_wire_test.c /usr/src/debug/openssl/3.2.0/test/pem_read_depr_test.c /usr/src/debug/openssl/3.2.0/test/ca_internals_test.c /usr/src/debug/openssl/3.2.0/test/fips_version_test.c /usr/src/debug/openssl/3.2.0/test/cc_dummy.c /usr/src/debug/openssl/3.2.0/test/quic_ackm_test.c /usr/src/debug/openssl/3.2.0/test/quic_txpim_test.c /usr/src/debug/openssl/3.2.0/test/pairwise_fail_test.c /usr/src/debug/openssl/3.2.0/test/poly1305_internal_test.c /usr/src/debug/openssl/3.2.0/test/siphash_internal_test.c /usr/src/debug/openssl/3.2.0/test/sm3_internal_test.c /usr/src/debug/openssl/3.2.0/test/bio_core_test.c /usr/src/debug/openssl/3.2.0/test/hexstr_t
 est.c /usr/src/debug/openssl/3.2.0/test/membio_test.c /usr/src/debug/openssl/3.2.0/test/params_test.c /usr/src/debug/openssl/3.2.0/test/rsa_mp_test.c /usr/src/debug/openssl/3.2.0/test/sysdefaulttest.c /usr/src/debug/openssl/3.2.0/test/ossl_store_test.c /usr/src/debug/openssl/3.2.0/test/sparse_array_test.c /usr/src/debug/openssl/3.2.0/test/verify_extra_test.c /usr/src/debug/openssl/3.2.0/test/x509_dup_cert_test.c /usr/src/debug/openssl/3.2.0/test/pkcs12_format_test.c /usr/src/debug/openssl/3.2.0/test/bio_readbuffer_test.c /usr/src/debug/openssl/3.2.0/test/cmp_vfy_test.c /usr/src/debug/openssl/3.2.0/test/bio_dgram_test.c /usr/src/debug/openssl/3.2.0/test/sslcorrupttest.c /usr/src/debug/openssl/3.2.0/test/bio_callback_test.c /usr/src/debug/openssl/3.2.0/test/quic_cfq_test.c /usr/src/debug/openssl/3.2.0/test/sslbuffertest.c /usr/src/debug/openssl/3.2.0/test/tls13ccstest.c /usr/src/debug/openssl/3.2.0/test/sm4_internal_test.c /usr/src/debug/openssl/3.2.0/test/ext_internal_test.c /usr/src
 /debug/openssl/3.2.0/test/ffc_internal_test.c /usr/src/debug/openssl/3.2.0/test/clienthellotest.c /usr/src/debug/openssl/3.2.0/test/pkcs7_test.c /usr/src/debug/openssl/3.2.0/test/quic_tserver_test.c /usr/src/debug/openssl/3.2.0/test/rsa_sp800_56b_test.c /usr/src/debug/openssl/3.2.0/test/sanitytest.c /usr/src/debug/openssl/3.2.0/test/secmemtest.c /usr/src/debug/openssl/3.2.0/test/sm2_internal_test.c /usr/src/debug/openssl/3.2.0/test/sslapitest.c /usr/src/debug/openssl/3.2.0/test/stack_test.c /usr/src/debug/openssl/3.2.0/test/v3nametest.c /usr/src/debug/openssl/3.2.0/test/evp_libctx_test.c /usr/src/debug/openssl/3.2.0/test/ssl_cert_table_internal_test.c /usr/src/debug/openssl/3.2.0/test/provider_status_test.c /usr/src/debug/openssl/3.2.0/test/provider_test.c /usr/src/debug/openssl/3.2.0/test/threadpool_test.c /usr/src/debug/openssl/3.2.0/test/decoder_propq_test.c /usr/src/debug/openssl/3.2.0/test/user_property_test.c /usr/src/debug/openssl/3.2.0/test/curve448_internal_test.c /usr/src/
 debug/openssl/3.2.0/test/moduleloadtest.c /usr/src/debug/openssl/3.2.0/test/confdump.c /usr/src/debug/openssl/3.2.0/test/bio_enc_test.c /usr/src/debug/openssl/3.2.0/test/quic_cc_test.c /usr/src/debug/openssl/3.2.0/test/quic_fc_test.c /usr/src/debug/openssl/3.2.0/test/cipher_overhead_test.c /usr/src/debug/openssl/3.2.0/test/cmp_msg_test.c /usr/src/debug/openssl/3.2.0/test/filterprov.c /usr/src/debug/openssl/3.2.0/test/bn_internal_test.c /usr/src/debug/openssl/3.2.0/test/ec_internal_test.c /usr/src/debug/openssl/3.2.0/test/cmp_client_test.c /usr/src/debug/openssl/3.2.0/test/filterprov.h /usr/src/debug/openssl/3.2.0/test/rsa_complex.c /usr/src/debug/openssl/3.2.0/test/rand_test.c /usr/src/debug/openssl/3.2.0/test/test_test.c /usr/src/debug/openssl/3.2.0/test/time_test.c /usr/src/debug/openssl/3.2.0/test/x509_test.c /usr/src/debug/openssl/3.2.0/test/hmactest.c /usr/src/debug/openssl/3.2.0/test/ideatest.c /usr/src/debug/openssl/3.2.0/test/afalgtest.c /usr/src/debug/openssl/3.2.0/test/abo
 rttest.c /usr/src/debug/openssl/3.2.0/test/asynctest.c /usr/src/debug/openssl/3.2.0/test/ecdsatest.c /usr/src/debug/openssl/3.2.0/test/ecdsatest.h /usr/src/debug/openssl/3.2.0/test/mdc2test.c /usr/src/debug/openssl/3.2.0/test/rsa_test.c /usr/src/debug/openssl/3.2.0/test/chacha_internal_test.c /usr/src/debug/openssl/3.2.0/test/time_offset_test.c /usr/src/debug/openssl/3.2.0/test/simpledynamic.c /usr/src/debug/openssl/3.2.0/test/punycode_test.c /usr/src/debug/openssl/3.2.0/test/srptest.c /usr/src/debug/openssl/3.2.0/test/rpktest.c /usr/src/debug/openssl/3.2.0/test/endecode_test.c /usr/src/debug/openssl/3.2.0/test/asn1_string_table_test.c /usr/src/debug/openssl/3.2.0/test/crltest.c /usr/src/debug/openssl/3.2.0/test/ct_test.c /usr/src/debug/openssl/3.2.0/test/destest.c /usr/src/debug/openssl/3.2.0/test/bn_rand_range.h /usr/src/debug/openssl/3.2.0/test/dsatest.c /usr/src/debug/openssl/3.2.0/test/errtest.c /usr/src/debug/openssl/3.2.0/test/evp_extra_test.c /usr/src/debug/openssl/3.2.0/tes
 t/provider_internal_test.c /usr/src/debug/openssl/3.2.0/test/simpledynamic.h /usr/src/debug/openssl/3.2.0/test/ciphername_test.c /usr/src/debug/openssl/3.2.0/test/servername_test.c /usr/src/debug/openssl/3.2.0/test/rand_status_test.c /usr/src/debug/openssl/3.2.0/test/pkey_meth_kdf_test.c /usr/src/debug/openssl/3.2.0/test/provider_pkey_test.c /usr/src/debug/openssl/3.2.0/test/asn1_dsa_internal_test.c /usr/src/debug/openssl/3.2.0/test/wpackettest.c /usr/src/debug/openssl/3.2.0/test/fake_rsaprov.c /usr/src/debug/openssl/3.2.0/test/exptest.c /usr/src/debug/openssl/3.2.0/test/igetest.c /usr/src/debug/openssl/3.2.0/test/pbetest.c /usr/src/debug/openssl/3.2.0/test/pemtest.c /usr/src/debug/openssl/3.2.0/test/rc2test.c /usr/src/debug/openssl/3.2.0/test/rc4test.c /usr/src/debug/openssl/3.2.0/test/rc5test.c /usr/src/debug/openssl/3.2.0/test/bftest.c /usr/src/debug/openssl/3.2.0/test/bntest.c /usr/src/debug/openssl/3.2.0/test/dhtest.c /usr/src/debug/openssl/3.2.0/test/ectest.c /usr/src/debug/op
 enssl/3.2.0/test/fake_rsaprov.h /usr/src/debug/openssl/3.2.0/test/p_test.c /usr/src/debug/openssl/3.2.0/test/quic_multistream_test.c /usr/src/debug/openssl/3.2.0/test/cipherbytes_test.c /usr/src/debug/openssl/3.2.0/test/param_build_test.c /usr/src/debug/openssl/3.2.0/test/asn1_time_test.c /usr/src/debug/openssl/3.2.0/test/shlibloadtest.c /usr/src/debug/openssl/3.2.0/test/x509_time_test.c /usr/src/debug/openssl/3.2.0/test/endecoder_legacy_test.c /usr/src/debug/openssl/3.2.0/test/pkey_meth_test.c /usr/src/debug/openssl/3.2.0/test/event_queue_test.c /usr/src/debug/openssl/3.2.0/test/cipherlist_test.c /usr/src/debug/openssl/3.2.0/test/fatalerrtest.c /usr/src/debug/openssl/3.2.0/test/threadstest.h /usr/src/debug/openssl/3.2.0/test/asn1_internal_test.c /usr/src/debug/openssl/3.2.0/test/constant_time_test.c /usr/src/debug/openssl/3.2.0/test/mdc2_internal_test.c /usr/src/debug/openssl/3.2.0/test/provider_default_search_path_test.c /usr/src/debug/openssl/3.2.0/test/bioprinttest.c /usr/src/de
 bug/openssl/3.2.0/test/x509_internal_test.c /usr/src/debug/openssl/3.2.0/test/threadstest.c /usr/src/debug/openssl/3.2.0/test/upcallstest.c /usr/src/debug/openssl/3.2.0/test/dtlsv1listentest.c /usr/src/debug/openssl/3.2.0/test/quic_client_test.c /usr/src/debug/openssl/3.2.0/test/safe_math_test.c /usr/src/debug/openssl/3.2.0/test/trace_api_test.c /usr/src/debug/openssl/3.2.0/test/memleaktest.c /usr/src/debug/openssl/3.2.0/test/ecstresstest.c /usr/src/debug/openssl/3.2.0/test/build_wincrypt_test.c /usr/src/debug/openssl/3.2.0/test/cmp_ctx_test.c /usr/src/debug/openssl/3.2.0/test/sha_test.c /usr/src/debug/openssl/3.2.0/test/ssl_ctx_test.c /usr/src/debug/openssl/3.2.0/test/ssl_test.c /usr/src/debug/openssl/3.2.0/test/provider_fallback_test.c", added "/usr/src/debug/openssl/3.2.1/test/testutil.h /usr/src/debug/openssl/3.2.1/test/threadstest_fips.c /usr/src/debug/openssl/3.2.1/test/evp_kdf_test.c /usr/src/debug/openssl/3.2.1/test/timing_load_creds.c /usr/src/debug/openssl/3.2.1/test/ssl_o
 ld_test.c /usr/src/debug/openssl/3.2.1/test/ssl_test_ctx_test.c /usr/src/debug/openssl/3.2.1/test/context_internal_test.c /usr/src/debug/openssl/3.2.1/test/keymgmt_internal_test.c /usr/src/debug/openssl/3.2.1/test/quicfaultstest.c /usr/src/debug/openssl/3.2.1/test/rdcpu_sanitytest.c /usr/src/debug/openssl/3.2.1/test/evp_extra_test2.c /usr/src/debug/openssl/3.2.1/test/cmsapitest.c /usr/src/debug/openssl/3.2.1/test/enginetest.c /usr/src/debug/openssl/3.2.1/test/exdatatest.c /usr/src/debug/openssl/3.2.1/test/gmdifftest.c /usr/src/debug/openssl/3.2.1/test/lhash_test.c /usr/src/debug/openssl/3.2.1/test/aesgcmtest.c /usr/src/debug/openssl/3.2.1/test/bio_prefix_text.c /usr/src/debug/openssl/3.2.1/test/localetest.c /usr/src/debug/openssl/3.2.1/test/ocspapitest.c /usr/src/debug/openssl/3.2.1/test/packettest.c /usr/src/debug/openssl/3.2.1/test/quic_txp_test.c /usr/src/debug/openssl/3.2.1/test/quicapitest.c /usr/src/debug/openssl/3.2.1/test/params_api_test.c /usr/src/debug/openssl/3.2.1/test/p
 kcs12_api_test.c /usr/src/debug/openssl/3.2.1/test/tls13encryptiontest.c /usr/src/debug/openssl/3.2.1/test/hpke_test.c /usr/src/debug/openssl/3.2.1/test/http_test.c /usr/src/debug/openssl/3.2.1/test/list_test.c /usr/src/debug/openssl/3.2.1/test/pbelutest.c /usr/src/debug/openssl/3.2.1/test/conf_include_test.c /usr/src/debug/openssl/3.2.1/test/asynciotest.c /usr/src/debug/openssl/3.2.1/test/dtls_mtu_test.c /usr/src/debug/openssl/3.2.1/test/property_test.c /usr/src/debug/openssl/3.2.1/test/provfetchtest.c /usr/src/debug/openssl/3.2.1/test/bio_tfo_test.c /usr/src/debug/openssl/3.2.1/test/x509_check_cert_pkey_test.c /usr/src/debug/openssl/3.2.1/test/cmp_status_test.c /usr/src/debug/openssl/3.2.1/test/rsa_x931_test.c /usr/src/debug/openssl/3.2.1/test/evp_fetch_prov_test.c /usr/src/debug/openssl/3.2.1/test/cmp_asn_test.c /usr/src/debug/openssl/3.2.1/test/asn1_decode_test.c /usr/src/debug/openssl/3.2.1/test/priority_queue_test.c /usr/src/debug/openssl/3.2.1/test/quic_newcid_test.c /usr/src
 /debug/openssl/3.2.1/test/quic_record_test.c /usr/src/debug/openssl/3.2.1/test/tls-provider.c /usr/src/debug/openssl/3.2.1/test/tls13secretstest.c /usr/src/debug/openssl/3.2.1/test/v3ext.c /usr/src/debug/openssl/3.2.1/test/x509aux.c /usr/src/debug/openssl/3.2.1/test/evp_pkey_provided_test.c /usr/src/debug/openssl/3.2.1/test/quic_record_test_util.h /usr/src/debug/openssl/3.2.1/test/recordlentest.c /usr/src/debug/openssl/3.2.1/test/bad_dtls_test.c /usr/src/debug/openssl/3.2.1/test/versions.c /usr/src/debug/openssl/3.2.1/test/bio_memleak_test.c /usr/src/debug/openssl/3.2.1/test/bio_addr_test.c /usr/src/debug/openssl/3.2.1/test/dhkem_test.inc /usr/src/debug/openssl/3.2.1/test/casttest.c /usr/src/debug/openssl/3.2.1/test/params_conversion_test.c /usr/src/debug/openssl/3.2.1/test/cmactest.c /usr/src/debug/openssl/3.2.1/test/d2i_test.c /usr/src/debug/openssl/3.2.1/test/danetest.c /usr/src/debug/openssl/3.2.1/test/drbgtest.c /usr/src/debug/openssl/3.2.1/test/dtlstest.c /usr/src/debug/openss
 l/3.2.1/test/evp_test.c /usr/src/debug/openssl/3.2.1/test/cmp_protect_test.c /usr/src/debug/openssl/3.2.1/test/namemap_internal_test.c /usr/src/debug/openssl/3.2.1/test/algorithmid_test.c /usr/src/debug/openssl/3.2.1/test/nodefltctxtest.c /usr/src/debug/openssl/3.2.1/test/prov_config_test.c /usr/src/debug/openssl/3.2.1/test/quic_stream_test.c /usr/src/debug/openssl/3.2.1/test/evp_pkey_ctx_new_from_name.c /usr/src/debug/openssl/3.2.1/test/cmp_server_test.c /usr/src/debug/openssl/3.2.1/test/uitest.c /usr/src/debug/openssl/3.2.1/test/ssl_handshake_rtt_test.c /usr/src/debug/openssl/3.2.1/test/dsa_no_digest_size_test.c /usr/src/debug/openssl/3.2.1/test/evp_pkey_dparams_test.c /usr/src/debug/openssl/3.2.1/test/cmp_hdr_test.c /usr/src/debug/openssl/3.2.1/test/ctype_internal_test.c /usr/src/debug/openssl/3.2.1/test/modes_internal_test.c /usr/src/debug/openssl/3.2.1/test/asn1_encode_test.c /usr/src/debug/openssl/3.2.1/test/defltfips_test.c /usr/src/debug/openssl/3.2.1/test/evp_pkey_dhkem_tes
 t.c /usr/src/debug/openssl/3.2.1/test/quic_fifd_test.c /usr/src/debug/openssl/3.2.1/test/quic_wire_test.c /usr/src/debug/openssl/3.2.1/test/pem_read_depr_test.c /usr/src/debug/openssl/3.2.1/test/ca_internals_test.c /usr/src/debug/openssl/3.2.1/test/fips_version_test.c /usr/src/debug/openssl/3.2.1/test/cc_dummy.c /usr/src/debug/openssl/3.2.1/test/quic_ackm_test.c /usr/src/debug/openssl/3.2.1/test/quic_txpim_test.c /usr/src/debug/openssl/3.2.1/test/pairwise_fail_test.c /usr/src/debug/openssl/3.2.1/test/poly1305_internal_test.c /usr/src/debug/openssl/3.2.1/test/siphash_internal_test.c /usr/src/debug/openssl/3.2.1/test/sm3_internal_test.c /usr/src/debug/openssl/3.2.1/test/bio_core_test.c /usr/src/debug/openssl/3.2.1/test/hexstr_test.c /usr/src/debug/openssl/3.2.1/test/membio_test.c /usr/src/debug/openssl/3.2.1/test/params_test.c /usr/src/debug/openssl/3.2.1/test/rsa_mp_test.c /usr/src/debug/openssl/3.2.1/test/sysdefaulttest.c /usr/src/debug/openssl/3.2.1/test/ossl_store_test.c /usr/src/
 debug/openssl/3.2.1/test/sparse_array_test.c /usr/src/debug/openssl/3.2.1/test/verify_extra_test.c /usr/src/debug/openssl/3.2.1/test/x509_dup_cert_test.c /usr/src/debug/openssl/3.2.1/test/asn1_stable_parse_test.c /usr/src/debug/openssl/3.2.1/test/pkcs12_format_test.c /usr/src/debug/openssl/3.2.1/test/bio_readbuffer_test.c /usr/src/debug/openssl/3.2.1/test/cmp_vfy_test.c /usr/src/debug/openssl/3.2.1/test/bio_dgram_test.c /usr/src/debug/openssl/3.2.1/test/sslcorrupttest.c /usr/src/debug/openssl/3.2.1/test/bio_callback_test.c /usr/src/debug/openssl/3.2.1/test/quic_cfq_test.c /usr/src/debug/openssl/3.2.1/test/sslbuffertest.c /usr/src/debug/openssl/3.2.1/test/tls13ccstest.c /usr/src/debug/openssl/3.2.1/test/sm4_internal_test.c /usr/src/debug/openssl/3.2.1/test/ext_internal_test.c /usr/src/debug/openssl/3.2.1/test/ffc_internal_test.c /usr/src/debug/openssl/3.2.1/test/clienthellotest.c /usr/src/debug/openssl/3.2.1/test/pkcs7_test.c /usr/src/debug/openssl/3.2.1/test/quic_tserver_test.c /usr
 /src/debug/openssl/3.2.1/test/rsa_sp800_56b_test.c /usr/src/debug/openssl/3.2.1/test/sanitytest.c /usr/src/debug/openssl/3.2.1/test/secmemtest.c /usr/src/debug/openssl/3.2.1/test/sm2_internal_test.c /usr/src/debug/openssl/3.2.1/test/sslapitest.c /usr/src/debug/openssl/3.2.1/test/stack_test.c /usr/src/debug/openssl/3.2.1/test/v3nametest.c /usr/src/debug/openssl/3.2.1/test/evp_libctx_test.c /usr/src/debug/openssl/3.2.1/test/ssl_cert_table_internal_test.c /usr/src/debug/openssl/3.2.1/test/provider_status_test.c /usr/src/debug/openssl/3.2.1/test/x509_load_cert_file_test.c /usr/src/debug/openssl/3.2.1/test/provider_test.c /usr/src/debug/openssl/3.2.1/test/threadpool_test.c /usr/src/debug/openssl/3.2.1/test/decoder_propq_test.c /usr/src/debug/openssl/3.2.1/test/user_property_test.c /usr/src/debug/openssl/3.2.1/test/curve448_internal_test.c /usr/src/debug/openssl/3.2.1/test/moduleloadtest.c /usr/src/debug/openssl/3.2.1/test/confdump.c /usr/src/debug/openssl/3.2.1/test/bio_enc_test.c /usr/s
 rc/debug/openssl/3.2.1/test/quic_cc_test.c /usr/src/debug/openssl/3.2.1/test/quic_fc_test.c /usr/src/debug/openssl/3.2.1/test/cipher_overhead_test.c /usr/src/debug/openssl/3.2.1/test/cmp_msg_test.c /usr/src/debug/openssl/3.2.1/test/filterprov.c /usr/src/debug/openssl/3.2.1/test/bn_internal_test.c /usr/src/debug/openssl/3.2.1/test/ec_internal_test.c /usr/src/debug/openssl/3.2.1/test/cmp_client_test.c /usr/src/debug/openssl/3.2.1/test/filterprov.h /usr/src/debug/openssl/3.2.1/test/rsa_complex.c /usr/src/debug/openssl/3.2.1/test/rand_test.c /usr/src/debug/openssl/3.2.1/test/test_test.c /usr/src/debug/openssl/3.2.1/test/time_test.c /usr/src/debug/openssl/3.2.1/test/x509_test.c /usr/src/debug/openssl/3.2.1/test/hmactest.c /usr/src/debug/openssl/3.2.1/test/ideatest.c /usr/src/debug/openssl/3.2.1/test/afalgtest.c /usr/src/debug/openssl/3.2.1/test/aborttest.c /usr/src/debug/openssl/3.2.1/test/asynctest.c /usr/src/debug/openssl/3.2.1/test/ecdsatest.c /usr/src/debug/openssl/3.2.1/test/ecdsate
 st.h /usr/src/debug/openssl/3.2.1/test/mdc2test.c /usr/src/debug/openssl/3.2.1/test/rsa_test.c /usr/src/debug/openssl/3.2.1/test/chacha_internal_test.c /usr/src/debug/openssl/3.2.1/test/time_offset_test.c /usr/src/debug/openssl/3.2.1/test/simpledynamic.c /usr/src/debug/openssl/3.2.1/test/punycode_test.c /usr/src/debug/openssl/3.2.1/test/srptest.c /usr/src/debug/openssl/3.2.1/test/rpktest.c /usr/src/debug/openssl/3.2.1/test/endecode_test.c /usr/src/debug/openssl/3.2.1/test/asn1_string_table_test.c /usr/src/debug/openssl/3.2.1/test/crltest.c /usr/src/debug/openssl/3.2.1/test/ct_test.c /usr/src/debug/openssl/3.2.1/test/destest.c /usr/src/debug/openssl/3.2.1/test/bn_rand_range.h /usr/src/debug/openssl/3.2.1/test/dsatest.c /usr/src/debug/openssl/3.2.1/test/errtest.c /usr/src/debug/openssl/3.2.1/test/evp_extra_test.c /usr/src/debug/openssl/3.2.1/test/provider_internal_test.c /usr/src/debug/openssl/3.2.1/test/simpledynamic.h /usr/src/debug/openssl/3.2.1/test/ciphername_test.c /usr/src/debu
 g/openssl/3.2.1/test/servername_test.c /usr/src/debug/openssl/3.2.1/test/rand_status_test.c /usr/src/debug/openssl/3.2.1/test/pkey_meth_kdf_test.c /usr/src/debug/openssl/3.2.1/test/provider_pkey_test.c /usr/src/debug/openssl/3.2.1/test/asn1_dsa_internal_test.c /usr/src/debug/openssl/3.2.1/test/wpackettest.c /usr/src/debug/openssl/3.2.1/test/fake_rsaprov.c /usr/src/debug/openssl/3.2.1/test/exptest.c /usr/src/debug/openssl/3.2.1/test/igetest.c /usr/src/debug/openssl/3.2.1/test/pbetest.c /usr/src/debug/openssl/3.2.1/test/pemtest.c /usr/src/debug/openssl/3.2.1/test/rc2test.c /usr/src/debug/openssl/3.2.1/test/rc4test.c /usr/src/debug/openssl/3.2.1/test/rc5test.c /usr/src/debug/openssl/3.2.1/test/bftest.c /usr/src/debug/openssl/3.2.1/test/bntest.c /usr/src/debug/openssl/3.2.1/test/dhtest.c /usr/src/debug/openssl/3.2.1/test/ectest.c /usr/src/debug/openssl/3.2.1/test/fake_rsaprov.h /usr/src/debug/openssl/3.2.1/test/p_test.c /usr/src/debug/openssl/3.2.1/test/quic_multistream_test.c /usr/src/
 debug/openssl/3.2.1/test/cipherbytes_test.c /usr/src/debug/openssl/3.2.1/test/param_build_test.c /usr/src/debug/openssl/3.2.1/test/asn1_time_test.c /usr/src/debug/openssl/3.2.1/test/shlibloadtest.c /usr/src/debug/openssl/3.2.1/test/x509_time_test.c /usr/src/debug/openssl/3.2.1/test/endecoder_legacy_test.c /usr/src/debug/openssl/3.2.1/test/pkey_meth_test.c /usr/src/debug/openssl/3.2.1/test/event_queue_test.c /usr/src/debug/openssl/3.2.1/test/cipherlist_test.c /usr/src/debug/openssl/3.2.1/test/fatalerrtest.c /usr/src/debug/openssl/3.2.1/test/threadstest.h /usr/src/debug/openssl/3.2.1/test/asn1_internal_test.c /usr/src/debug/openssl/3.2.1/test/constant_time_test.c /usr/src/debug/openssl/3.2.1/test/mdc2_internal_test.c /usr/src/debug/openssl/3.2.1/test/provider_default_search_path_test.c /usr/src/debug/openssl/3.2.1/test/bioprinttest.c /usr/src/debug/openssl/3.2.1/test/x509_internal_test.c /usr/src/debug/openssl/3.2.1/test/threadstest.c /usr/src/debug/openssl/3.2.1/test/upcallstest.c /u
 sr/src/debug/openssl/3.2.1/test/dtlsv1listentest.c /usr/src/debug/openssl/3.2.1/test/quic_client_test.c /usr/src/debug/openssl/3.2.1/test/safe_math_test.c /usr/src/debug/openssl/3.2.1/test/trace_api_test.c /usr/src/debug/openssl/3.2.1/test/memleaktest.c /usr/src/debug/openssl/3.2.1/test/ecstresstest.c /usr/src/debug/openssl/3.2.1/test/build_wincrypt_test.c /usr/src/debug/openssl/3.2.1/test/cmp_ctx_test.c /usr/src/debug/openssl/3.2.1/test/sha_test.c /usr/src/debug/openssl/3.2.1/test/ssl_ctx_test.c /usr/src/debug/openssl/3.2.1/test/ssl_test.c /usr/src/debug/openssl/3.2.1/test/provider_fallback_test.c"
packages/core2-64-poky-linux/openssl/openssl-src: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-src: PKGSIZE changed from 29321602 to 29355491 (+0%)
packages/core2-64-poky-linux/openssl/openssl-staticdev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl-staticdev: PV changed from "3.2.0" to "3.2.1"
packages/core2-64-poky-linux/openssl/openssl-staticdev: PKGSIZE changed from 33178644 to 33220394 (+0%)
packages/core2-64-poky-linux/openssl/openssl: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-64-poky-linux/openssl/openssl: PV changed from "3.2.0" to "3.2.1"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3 was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7800.3-gdb.py was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7800.3-gdb.py was added
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3 was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7800.3-gdb.py was removed
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.78.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7800.3-gdb.py was removed

--===============8446398572594134342==--

