Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAA2C531CB
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:41:47 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1389.1771440098848526382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=C0aZKTvx;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SeKczgLZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c720ecad9-289adab8-0384-4f80-84c3-984eb261e560-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440098;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2xA1rgkPQ3VF5dUdr+ER87Ldz55gAAiHfXUW24+HRn4=;
	b=C0aZKTvx30zoI6WEkXBr65K5gS0EPvzaJ5lf5ltVwKMcOLol91pakNhFGrOnIC4T
	EwjkT9mQpEEBNqMGYyUhcVRebhg7E4alIKPNOX/hfJJ3DYDjJzd509B4vCXZyubO70K
	OuyfseOmxzZhNwURNjqqZy7tPJp55KeAn1L3f8qE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440098;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2xA1rgkPQ3VF5dUdr+ER87Ldz55gAAiHfXUW24+HRn4=;
	b=SeKczgLZexy75GtoMqt2/JtKnoEiTjEe9TCWdhkp2GgexKoAf+QCVqg/ykCxJq1O
	L8oueuHcqn/0QmGSoAjGf9Vs2KihBQA3y9gfnclUCWvlFOeQ2x+liv69cP3gpfM78cL
	jDPvpl73wphFxjguHJyCFtGS6WSiQ2mzMkzMeZU8=
Content-Type: multipart/mixed; boundary="===============7632210201479704429=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] openssl: upgrading to 3.6.1 SUCCEEDED
Message-ID: <0101019c720ecad9-289adab8-0384-4f80-84c3-984eb261e560-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231337

--===============7632210201479704429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *openssl* to *3.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssl-upgrade-3.5.5-3.6.1.patch
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
From b8538b0a8c162c657c66169883923238d3585a39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 12:01:20 +0000
Subject: [PATCH] openssl: upgrade 3.5.5 -> 3.6.1

---
 ...ke-history-reporting-when-test-fails.patch | 25 ++++++++-----------
 ...1-Configure-do-not-tweak-mips-cflags.patch |  6 ++---
 ...sysroot-and-debug-prefix-map-from-co.patch |  7 +++---
 .../0001-extend-check_cwm-test-timeout.patch  |  4 +--
 .../{openssl_3.5.5.bb => openssl_3.6.1.bb}    |  2 +-
 5 files changed, 20 insertions(+), 24 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb => openssl_3.6.1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index a74c79303f..5104a3cc00 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -1,4 +1,4 @@
-From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
+From cda360c014be3c6bfbec23045ae0cb784908cf59 Mon Sep 17 00:00:00 2001
 From: William Lyu <William.Lyu@windriver.com>
 Date: Fri, 20 Oct 2023 16:22:37 -0400
 Subject: [PATCH] Added handshake history reporting when test fails
@@ -13,10 +13,10 @@ Signed-off-by: William Lyu <William.Lyu@windriver.com>
  3 files changed, 217 insertions(+), 33 deletions(-)
 
 diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
-index f611b3a..5703b48 100644
+index 5e56060..f9bb035 100644
 --- a/test/helpers/handshake.c
 +++ b/test/helpers/handshake.c
-@@ -25,6 +25,102 @@
+@@ -26,6 +26,102 @@
  #include <netinet/sctp.h>
  #endif
  
@@ -119,7 +119,7 @@ index f611b3a..5703b48 100644
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
  {
      HANDSHAKE_RESULT *ret;
-@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
+@@ -828,15 +924,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
          SSL_set_post_handshake_auth(client, 1);
  }
  
@@ -135,7 +135,7 @@ index f611b3a..5703b48 100644
  /* An SSL object and associated read-write buffers. */
  typedef struct peer_st {
      SSL *ssl;
-@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)
+@@ -1181,16 +1268,6 @@ static void do_shutdown_step(PEER *peer)
      }
  }
  
@@ -152,7 +152,7 @@ index f611b3a..5703b48 100644
  static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
  {
      switch (test_ctx->handshake_mode) {
-@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
+@@ -1268,19 +1345,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
      }
  }
  
@@ -172,7 +172,7 @@ index f611b3a..5703b48 100644
  /*
   * Determine the handshake outcome.
   * last_status: the status of the peer to have acted last.
-@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+@@ -1645,6 +1709,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
  
      start = time(NULL);
  
@@ -183,7 +183,7 @@ index f611b3a..5703b48 100644
      /*
       * Half-duplex handshake loop.
       * Client and server speak to each other synchronously in the same process.
-@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+@@ -1666,6 +1734,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
                  0 /* server went last */);
          }
  
@@ -195,7 +195,7 @@ index f611b3a..5703b48 100644
          case HANDSHAKE_SUCCESS:
              client_turn_count = 0;
 diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
-index 78b03f9..b9967c2 100644
+index 7cf654f..b4459d7 100644
 --- a/test/helpers/handshake.h
 +++ b/test/helpers/handshake.h
 @@ -1,5 +1,5 @@
@@ -300,7 +300,7 @@ index 78b03f9..b9967c2 100644
 +
  #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */
 diff --git a/test/ssl_test.c b/test/ssl_test.c
-index ea60851..9d6b093 100644
+index 27b4415..64a13c0 100644
 --- a/test/ssl_test.c
 +++ b/test/ssl_test.c
 @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx = NULL;
@@ -360,7 +360,4 @@ index ea60851..9d6b093 100644
 +
      return ret;
  }
-
---
-2.25.1
-
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index cf5ff356ee..d1526cb69a 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -1,4 +1,4 @@
-From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001
+From 8db9b88edbfbf40d56f330110efdc5cade6f183e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 30 May 2023 09:11:27 -0700
 Subject: [PATCH] Configure: do not tweak mips cflags
@@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 10 deletions(-)
 
 diff --git a/Configure b/Configure
-index fff97bd..5ee54c1 100755
+index 6cc03bf..2bcb075 100755
 --- a/Configure
 +++ b/Configure
-@@ -1552,16 +1552,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1573,16 +1573,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index dadc034c91..f70b14ab84 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -1,4 +1,4 @@
-From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
+From 31f71d1f2def3def2b44ec905cc9bcc7d8d2b454 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Tue, 6 Nov 2018 14:50:47 +0100
 Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compiler
@@ -28,14 +28,13 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Update to fix buildpaths qa issue for '-ffile-prefix-map'.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
  crypto/build.info                 |  2 +-
  2 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index 09303c4..011bda1 100644
+index 71b069e..ad82899 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
 @@ -513,13 +513,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
@@ -68,7 +67,7 @@ index 09303c4..011bda1 100644
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
 diff --git a/crypto/build.info b/crypto/build.info
-index aee5c46..95c9577 100644
+index 872684c..96d37c6 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
 @@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
index f6eb28069a..6bf768cf94 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
@@ -1,4 +1,4 @@
-From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001
+From 1f2bfacaefde4fbf6020946333df45cdd84bfac8 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Thu, 23 Oct 2025 11:24:36 +0200
 Subject: [PATCH] extend check_cwm test timeout
@@ -15,7 +15,7 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/test/radix/main.c b/test/radix/main.c
-index 4a1e886a71..39f8c61ef9 100644
+index 0f3dc11..d925639 100644
 --- a/test/radix/main.c
 +++ b/test/radix/main.c
 @@ -25,6 +25,11 @@ static int test_script(int idx)
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.6.1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.5.bb
rename to meta/recipes-connectivity/openssl/openssl_3.6.1.bb
index 7f81b976ba..95813229b8 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.6.1.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
+SRC_URI[sha256sum] = "b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.47.1


--===============7632210201479704429==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-openssl-upgrade-3.5.5-3.6.1.patch"

RnJvbSBiODUzOGIwYThjMTYyYzY1N2M2NjE2OTg4MzkyMzIzOGQzNTg1YTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTI6MDE6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBv
cGVuc3NsOiB1cGdyYWRlIDMuNS41IC0+IDMuNi4xCgotLS0KIC4uLmtlLWhpc3RvcnktcmVwb3J0
aW5nLXdoZW4tdGVzdC1mYWlscy5wYXRjaCB8IDI1ICsrKysrKysrLS0tLS0tLS0tLS0KIC4uLjEt
Q29uZmlndXJlLWRvLW5vdC10d2Vhay1taXBzLWNmbGFncy5wYXRjaCB8ICA2ICsrLS0tCiAuLi5z
eXNyb290LWFuZC1kZWJ1Zy1wcmVmaXgtbWFwLWZyb20tY28ucGF0Y2ggfCAgNyArKystLS0KIC4u
Li8wMDAxLWV4dGVuZC1jaGVja19jd20tdGVzdC10aW1lb3V0LnBhdGNoICB8ICA0ICstLQogLi4u
L3tvcGVuc3NsXzMuNS41LmJiID0+IG9wZW5zc2xfMy42LjEuYmJ9ICAgIHwgIDIgKy0KIDUgZmls
ZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL3tvcGVuc3NsXzMuNS41LmJiID0+IG9wZW5z
c2xfMy42LjEuYmJ9ICg5OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1BZGRlZC1oYW5kc2hha2UtaGlzdG9yeS1yZXBvcnRpbmct
d2hlbi10ZXN0LWZhaWxzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3Ns
L29wZW5zc2wvMDAwMS1BZGRlZC1oYW5kc2hha2UtaGlzdG9yeS1yZXBvcnRpbmctd2hlbi10ZXN0
LWZhaWxzLnBhdGNoCmluZGV4IGE3NGM3OTMwM2YuLjUxMDRhM2NjMDAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtQWRkZWQtaGFuZHNo
YWtlLWhpc3RvcnktcmVwb3J0aW5nLXdoZW4tdGVzdC1mYWlscy5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLUFkZGVkLWhhbmRzaGFrZS1o
aXN0b3J5LXJlcG9ydGluZy13aGVuLXRlc3QtZmFpbHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDViYTY1MDUxZmVhMDUxM2RiMGQ5OTdmMGFiN2NhZmI5ODI2ZWQ3NGEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGNkYTM2MGMwMTRiZTNjNmJmYmVjMjMwNDVhZTBjYjc4NDkwOGNm
NTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBXaWxsaWFtIEx5dSA8V2lsbGlhbS5M
eXVAd2luZHJpdmVyLmNvbT4KIERhdGU6IEZyaSwgMjAgT2N0IDIwMjMgMTY6MjI6MzcgLTA0MDAK
IFN1YmplY3Q6IFtQQVRDSF0gQWRkZWQgaGFuZHNoYWtlIGhpc3RvcnkgcmVwb3J0aW5nIHdoZW4g
dGVzdCBmYWlscwpAQCAtMTMsMTAgKzEzLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gTHl1
IDxXaWxsaWFtLkx5dUB3aW5kcml2ZXIuY29tPgogIDMgZmlsZXMgY2hhbmdlZCwgMjE3IGluc2Vy
dGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdC9oZWxwZXJzL2hh
bmRzaGFrZS5jIGIvdGVzdC9oZWxwZXJzL2hhbmRzaGFrZS5jCi1pbmRleCBmNjExYjNhLi41NzAz
YjQ4IDEwMDY0NAoraW5kZXggNWU1NjA2MC4uZjliYjAzNSAxMDA2NDQKIC0tLSBhL3Rlc3QvaGVs
cGVycy9oYW5kc2hha2UuYwogKysrIGIvdGVzdC9oZWxwZXJzL2hhbmRzaGFrZS5jCi1AQCAtMjUs
NiArMjUsMTAyIEBACitAQCAtMjYsNiArMjYsMTAyIEBACiAgI2luY2x1ZGUgPG5ldGluZXQvc2N0
cC5oPgogICNlbmRpZgogIApAQCAtMTE5LDcgKzExOSw3IEBAIGluZGV4IGY2MTFiM2EuLjU3MDNi
NDggMTAwNjQ0CiAgSEFORFNIQUtFX1JFU1VMVCAqSEFORFNIQUtFX1JFU1VMVF9uZXcodm9pZCkK
ICB7CiAgICAgIEhBTkRTSEFLRV9SRVNVTFQgKnJldDsKLUBAIC03MjQsMTUgKzgyMCw2IEBAIHN0
YXRpYyB2b2lkIGNvbmZpZ3VyZV9oYW5kc2hha2Vfc3NsKFNTTCAqc2VydmVyLCBTU0wgKmNsaWVu
dCwKK0BAIC04MjgsMTUgKzkyNCw2IEBAIHN0YXRpYyB2b2lkIGNvbmZpZ3VyZV9oYW5kc2hha2Vf
c3NsKFNTTCAqc2VydmVyLCBTU0wgKmNsaWVudCwKICAgICAgICAgIFNTTF9zZXRfcG9zdF9oYW5k
c2hha2VfYXV0aChjbGllbnQsIDEpOwogIH0KICAKQEAgLTEzNSw3ICsxMzUsNyBAQCBpbmRleCBm
NjExYjNhLi41NzAzYjQ4IDEwMDY0NAogIC8qIEFuIFNTTCBvYmplY3QgYW5kIGFzc29jaWF0ZWQg
cmVhZC13cml0ZSBidWZmZXJzLiAqLwogIHR5cGVkZWYgc3RydWN0IHBlZXJfc3QgewogICAgICBT
U0wgKnNzbDsKLUBAIC0xMDc3LDE2ICsxMTY0LDYgQEAgc3RhdGljIHZvaWQgZG9fc2h1dGRvd25f
c3RlcChQRUVSICpwZWVyKQorQEAgLTExODEsMTYgKzEyNjgsNiBAQCBzdGF0aWMgdm9pZCBkb19z
aHV0ZG93bl9zdGVwKFBFRVIgKnBlZXIpCiAgICAgIH0KICB9CiAgCkBAIC0xNTIsNyArMTUyLDcg
QEAgaW5kZXggZjYxMWIzYS4uNTcwM2I0OCAxMDA2NDQKICBzdGF0aWMgaW50IHJlbmVnb3RpYXRl
X29wKGNvbnN0IFNTTF9URVNUX0NUWCAqdGVzdF9jdHgpCiAgewogICAgICBzd2l0Y2ggKHRlc3Rf
Y3R4LT5oYW5kc2hha2VfbW9kZSkgewotQEAgLTExNjQsMTkgKzEyNDEsNiBAQCBzdGF0aWMgdm9p
ZCBkb19jb25uZWN0X3N0ZXAoY29uc3QgU1NMX1RFU1RfQ1RYICp0ZXN0X2N0eCwgUEVFUiAqcGVl
ciwKK0BAIC0xMjY4LDE5ICsxMzQ1LDYgQEAgc3RhdGljIHZvaWQgZG9fY29ubmVjdF9zdGVwKGNv
bnN0IFNTTF9URVNUX0NUWCAqdGVzdF9jdHgsIFBFRVIgKnBlZXIsCiAgICAgIH0KICB9CiAgCkBA
IC0xNzIsNyArMTcyLDcgQEAgaW5kZXggZjYxMWIzYS4uNTcwM2I0OCAxMDA2NDQKICAvKgogICAq
IERldGVybWluZSB0aGUgaGFuZHNoYWtlIG91dGNvbWUuCiAgICogbGFzdF9zdGF0dXM6IHRoZSBz
dGF0dXMgb2YgdGhlIHBlZXIgdG8gaGF2ZSBhY3RlZCBsYXN0LgotQEAgLTE1NDEsNiArMTYwNSwx
MCBAQCBzdGF0aWMgSEFORFNIQUtFX1JFU1VMVCAqZG9faGFuZHNoYWtlX2ludGVybmFsKAorQEAg
LTE2NDUsNiArMTcwOSwxMCBAQCBzdGF0aWMgSEFORFNIQUtFX1JFU1VMVCAqZG9faGFuZHNoYWtl
X2ludGVybmFsKAogIAogICAgICBzdGFydCA9IHRpbWUoTlVMTCk7CiAgCkBAIC0xODMsNyArMTgz
LDcgQEAgaW5kZXggZjYxMWIzYS4uNTcwM2I0OCAxMDA2NDQKICAgICAgLyoKICAgICAgICogSGFs
Zi1kdXBsZXggaGFuZHNoYWtlIGxvb3AuCiAgICAgICAqIENsaWVudCBhbmQgc2VydmVyIHNwZWFr
IHRvIGVhY2ggb3RoZXIgc3luY2hyb25vdXNseSBpbiB0aGUgc2FtZSBwcm9jZXNzLgotQEAgLTE1
NjIsNiArMTYzMCwxMCBAQCBzdGF0aWMgSEFORFNIQUtFX1JFU1VMVCAqZG9faGFuZHNoYWtlX2lu
dGVybmFsKAorQEAgLTE2NjYsNiArMTczNCwxMCBAQCBzdGF0aWMgSEFORFNIQUtFX1JFU1VMVCAq
ZG9faGFuZHNoYWtlX2ludGVybmFsKAogICAgICAgICAgICAgICAgICAwIC8qIHNlcnZlciB3ZW50
IGxhc3QgKi8pOwogICAgICAgICAgfQogIApAQCAtMTk1LDcgKzE5NSw3IEBAIGluZGV4IGY2MTFi
M2EuLjU3MDNiNDggMTAwNjQ0CiAgICAgICAgICBjYXNlIEhBTkRTSEFLRV9TVUNDRVNTOgogICAg
ICAgICAgICAgIGNsaWVudF90dXJuX2NvdW50ID0gMDsKIGRpZmYgLS1naXQgYS90ZXN0L2hlbHBl
cnMvaGFuZHNoYWtlLmggYi90ZXN0L2hlbHBlcnMvaGFuZHNoYWtlLmgKLWluZGV4IDc4YjAzZjku
LmI5OTY3YzIgMTAwNjQ0CitpbmRleCA3Y2Y2NTRmLi5iNDQ1OWQ3IDEwMDY0NAogLS0tIGEvdGVz
dC9oZWxwZXJzL2hhbmRzaGFrZS5oCiArKysgYi90ZXN0L2hlbHBlcnMvaGFuZHNoYWtlLmgKIEBA
IC0xLDUgKzEsNSBAQApAQCAtMzAwLDcgKzMwMCw3IEBAIGluZGV4IDc4YjAzZjkuLmI5OTY3YzIg
MTAwNjQ0CiArCiAgI2VuZGlmIC8qIE9TU0xfVEVTVF9IQU5EU0hBS0VfSEVMUEVSX0ggKi8KIGRp
ZmYgLS1naXQgYS90ZXN0L3NzbF90ZXN0LmMgYi90ZXN0L3NzbF90ZXN0LmMKLWluZGV4IGVhNjA4
NTEuLjlkNmIwOTMgMTAwNjQ0CitpbmRleCAyN2I0NDE1Li42NGExM2MwIDEwMDY0NAogLS0tIGEv
dGVzdC9zc2xfdGVzdC5jCiArKysgYi90ZXN0L3NzbF90ZXN0LmMKIEBAIC0yNiw2ICsyNiw0NCBA
QCBzdGF0aWMgT1NTTF9MSUJfQ1RYICpsaWJjdHggPSBOVUxMOwpAQCAtMzYwLDcgKzM2MCw0IEBA
IGluZGV4IGVhNjA4NTEuLjlkNmIwOTMgMTAwNjQ0CiArCiAgICAgIHJldHVybiByZXQ7CiAgfQot
Ci0tLQotMi4yNS4xCi0KKyAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
b3BlbnNzbC9vcGVuc3NsLzAwMDEtQ29uZmlndXJlLWRvLW5vdC10d2Vhay1taXBzLWNmbGFncy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtQ29u
ZmlndXJlLWRvLW5vdC10d2Vhay1taXBzLWNmbGFncy5wYXRjaAppbmRleCBjZjVmZjM1NmVlLi5k
MTUyNmNiNjlhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wv
b3BlbnNzbC8wMDAxLUNvbmZpZ3VyZS1kby1ub3QtdHdlYWstbWlwcy1jZmxhZ3MucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1Db25maWd1
cmUtZG8tbm90LXR3ZWFrLW1pcHMtY2ZsYWdzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAw
Mzc3ZjBkNWI1YzEwNzllM2I5YTgwODgxZjRkY2M4OTFjYmU5ZjlhIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSA4ZGI5Yjg4ZWRiZmJmNDBkNTZmMzMwMTEwZWZkYzVjYWRlNmYxODNlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGlu
dXRyb25peC5kZT4KIERhdGU6IFR1ZSwgMzAgTWF5IDIwMjMgMDk6MTE6MjcgLTA3MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gQ29uZmlndXJlOiBkbyBub3QgdHdlYWsgbWlwcyBjZmxhZ3MKQEAgLTE3LDEw
ICsxNywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBUaW0gT3JsaW5nIDx0aW0ub3JsaW5nQGtvbnN1bGtv
LmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9D
b25maWd1cmUgYi9Db25maWd1cmUKLWluZGV4IGZmZjk3YmQuLjVlZTU0YzEgMTAwNzU1CitpbmRl
eCA2Y2MwM2JmLi4yYmNiMDc1IDEwMDc1NQogLS0tIGEvQ29uZmlndXJlCiArKysgYi9Db25maWd1
cmUKLUBAIC0xNTUyLDE2ICsxNTUyLDYgQEAgaWYgKCR0YXJnZXQgPX4gL15taW5ndy8gJiYgYCRj
b25maWd7Q0N9IC0tdGFyZ2V0LWhlbHAgMj4mMWAgPX4gbS8tbW5vLWN5Z3dpbi9tKQorQEAgLTE1
NzMsMTYgKzE1NzMsNiBAQCBpZiAoJHRhcmdldCA9fiAvXm1pbmd3LyAmJiBgJGNvbmZpZ3tDQ30g
LS10YXJnZXQtaGVscCAyPiYxYCA9fiBtLy1tbm8tY3lnd2luL20pCiAgICAgICAgICBwdXNoIEB7
JGNvbmZpZ3tzaGFyZWRfbGRmbGFnfX0sICItbW5vLWN5Z3dpbiI7CiAgICAgICAgICB9CiAgCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAx
LWJ1aWxkaW5mby1zdHJpcC1zeXNyb290LWFuZC1kZWJ1Zy1wcmVmaXgtbWFwLWZyb20tY28ucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLWJ1aWxk
aW5mby1zdHJpcC1zeXNyb290LWFuZC1kZWJ1Zy1wcmVmaXgtbWFwLWZyb20tY28ucGF0Y2gKaW5k
ZXggZGFkYzAzNGM5MS4uZjcwYjE0YWI4NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1idWlsZGluZm8tc3RyaXAtc3lzcm9vdC1hbmQt
ZGVidWctcHJlZml4LW1hcC1mcm9tLWNvLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvb3BlbnNzbC9vcGVuc3NsLzAwMDEtYnVpbGRpbmZvLXN0cmlwLXN5c3Jvb3QtYW5kLWRl
YnVnLXByZWZpeC1tYXAtZnJvbS1jby5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTk4NTI1
M2YyYzkwMjVkN2MxMjc0NDNhM2E5OTM4OTQ2ZjgwYzJhMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gMzFmNzFkMWYyZGVmM2RlZjJiNDRlYzkwNWNjOWJjYzdkOGQyYjQ1NCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9NYXJ0aW49MjBIdW5kZWI9QzM9Qjhs
bD89IDxtYXJ0aW5AZ2Vhbml4LmNvbT4KIERhdGU6IFR1ZSwgNiBOb3YgMjAxOCAxNDo1MDo0NyAr
MDEwMAogU3ViamVjdDogW1BBVENIXSBidWlsZGluZm86IHN0cmlwIHN5c3Jvb3QgYW5kIGRlYnVn
LXByZWZpeC1tYXAgZnJvbSBjb21waWxlcgpAQCAtMjgsMTQgKzI4LDEzIEBAIFNpZ25lZC1vZmYt
Ynk6IEthaSBLYW5nIDxrYWkua2FuZ0B3aW5kcml2ZXIuY29tPgogVXBkYXRlIHRvIGZpeCBidWls
ZHBhdGhzIHFhIGlzc3VlIGZvciAnLWZmaWxlLXByZWZpeC1tYXAnLgogCiBTaWduZWQtb2ZmLWJ5
OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotCiAtLS0KICBDb25maWd1cmF0aW9ucy91
bml4LU1ha2VmaWxlLnRtcGwgfCAxNiArKysrKysrKysrKysrKystCiAgY3J5cHRvL2J1aWxkLmlu
Zm8gICAgICAgICAgICAgICAgIHwgIDIgKy0KICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9Db25maWd1cmF0aW9ucy91bml4
LU1ha2VmaWxlLnRtcGwgYi9Db25maWd1cmF0aW9ucy91bml4LU1ha2VmaWxlLnRtcGwKLWluZGV4
IDA5MzAzYzQuLjAxMWJkYTEgMTAwNjQ0CitpbmRleCA3MWIwNjllLi5hZDgyODk5IDEwMDY0NAog
LS0tIGEvQ29uZmlndXJhdGlvbnMvdW5peC1NYWtlZmlsZS50bXBsCiArKysgYi9Db25maWd1cmF0
aW9ucy91bml4LU1ha2VmaWxlLnRtcGwKIEBAIC01MTMsMTMgKzUxMywyNyBAQCBCSU5fTERGTEFH
Uz17LSBqb2luKCcgJywgJHRhcmdldHtiaW5fbGZsYWdzfSB8fCAoKSwKQEAgLTY4LDcgKzY3LDcg
QEAgaW5kZXggMDkzMDNjNC4uMDExYmRhMSAxMDA2NDQKICAKICAjIEZvciB4ODYgYXNzZW1ibGVy
OiBTZXQgUFJPQ0VTU09SIHRvIDM4NiBpZiB5b3Ugd2FudCB0byBzdXBwb3J0CiBkaWZmIC0tZ2l0
IGEvY3J5cHRvL2J1aWxkLmluZm8gYi9jcnlwdG8vYnVpbGQuaW5mbwotaW5kZXggYWVlNWM0Ni4u
OTVjOTU3NyAxMDA2NDQKK2luZGV4IDg3MjY4NGMuLjk2ZDM3YzYgMTAwNjQ0CiAtLS0gYS9jcnlw
dG8vYnVpbGQuaW5mbwogKysrIGIvY3J5cHRvL2J1aWxkLmluZm8KIEBAIC0xMTUsNyArMTE1LDcg
QEAgREVGSU5FWy4uL2xpYmNyeXB0b109JFVQTElOS0RFRgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2wvMDAwMS1leHRlbmQtY2hlY2tfY3dtLXRl
c3QtdGltZW91dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVu
c3NsLzAwMDEtZXh0ZW5kLWNoZWNrX2N3bS10ZXN0LXRpbWVvdXQucGF0Y2gKaW5kZXggZjZlYjI4
MDY5YS4uNmJmNzY4Y2Y5NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9v
cGVuc3NsL29wZW5zc2wvMDAwMS1leHRlbmQtY2hlY2tfY3dtLXRlc3QtdGltZW91dC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29wZW5zc2wvb3BlbnNzbC8wMDAxLWV4dGVu
ZC1jaGVja19jd20tdGVzdC10aW1lb3V0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNzAw
MDY3MjI5NmY0YzM2NzM0MWFhMzQxNWYyNmM0ZDlmNWU0NzQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAxZjJiZmFjYWVmZGU0ZmJmNjAyMDk0NjMzM2RmNDVjZGQ4NGJmYWM4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdt
YWlsLmNvbT4KIERhdGU6IFRodSwgMjMgT2N0IDIwMjUgMTE6MjQ6MzYgKzAyMDAKIFN1YmplY3Q6
IFtQQVRDSF0gZXh0ZW5kIGNoZWNrX2N3bSB0ZXN0IHRpbWVvdXQKQEAgLTE1LDcgKzE1LDcgQEAg
U2lnbmVkLW9mZi1ieTogR3lvcmd5IFNhcnZhcmkgPHNrYW5kaWdyYXVuQGdtYWlsLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS90ZXN0L3JhZGl4
L21haW4uYyBiL3Rlc3QvcmFkaXgvbWFpbi5jCi1pbmRleCA0YTFlODg2YTcxLi4zOWY4YzYxZWY5
IDEwMDY0NAoraW5kZXggMGYzZGMxMS4uZDkyNTYzOSAxMDA2NDQKIC0tLSBhL3Rlc3QvcmFkaXgv
bWFpbi5jCiArKysgYi90ZXN0L3JhZGl4L21haW4uYwogQEAgLTI1LDYgKzI1LDExIEBAIHN0YXRp
YyBpbnQgdGVzdF9zY3JpcHQoaW50IGlkeCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuNS41LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9vcGVuc3NsL29wZW5zc2xfMy42LjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vcGVuc3NsL29wZW5zc2xfMy41LjUuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuNi4x
LmJiCmluZGV4IDdmODFiOTc2YmEuLjk1ODEzMjI5YjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuNS41LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb3BlbnNzbC9vcGVuc3NsXzMuNi4xLmJiCkBAIC0xOSw3ICsxOSw3IEBA
IFNSQ19VUkk6YXBwZW5kOmNsYXNzLW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8v
ZW52aXJvbm1lbnQuZC1vcGVuc3NsLnNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiYjI4YzkxNTMyYThiNjVhMWY5ODNiNGMyOGI3NDg4MTc0ZTRhMDEwMDhlMjljZThl
NjliZDc4OWYyOGJjMmE4OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiMWJmZWRjZDViMjg5ZmYy
MmFlZTg3YzlkNjAwZjUxNTc2N2ViZjQ1Zjc3MTY4Y2I2ZDY0ZjIzMWY1MThhODJlIgogCiBpbmhl
cml0IGxpYl9wYWNrYWdlIG11bHRpbGliX2hlYWRlciBtdWx0aWxpYl9zY3JpcHQgcHRlc3QgcGVy
bG5hdGl2ZSBtYW5wYWdlcwogTVVMVElMSUJfU0NSSVBUUyA9ICIke1BOfS1iaW46JHtiaW5kaXJ9
L2NfcmVoYXNoIgotLSAKMi40Ny4xCgo=

--===============7632210201479704429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.4 to libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.4 to libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.4 to libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.4 to libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.4 to libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.4 to libgthread-2.0.so.0.8600.3
  /usr/lib/libgio-2.0.so.0.8600.4 moved to /usr/lib/libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0.8600.4 moved to /usr/lib/libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0.8600.4 moved to /usr/lib/libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0.8600.4 moved to /usr/lib/libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0.8600.4 moved to /usr/lib/libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0.8600.4 moved to /usr/lib/libgthread-2.0.so.0.8600.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: PKGSIZE changed from 711754881 to 571311127 (-20%)
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: FILELIST: added "/usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.1.d/nonconf.bak /usr/lib/openssl/ptest/test/recipes/95-test_external_rpki-client-portable_data/rpki-client-portable.sh /usr/lib/openssl/ptest/test/mem_alloc_test /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.1.d/includes1.cnf /usr/lib/openssl/ptest/test/mem_alloc_custom_fns_test /usr/lib/openssl/ptest/test/recipes/02-test_mem_alloc_custom_fns.t /usr/lib/openssl/ptest/test/recipes/30-test_evp_data/evppkey_lms_sigver.txt /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/non_number.txt /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/multiple_lines.txt /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/order.cnf.expected /usr/lib/openssl/ptest/test/smime-certs/sm_mlkem512.pem /usr/lib/openssl/ptest/test/recipes/25-test_configutl.t /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/leading-and-trailing-w
 hitespace.cnf.expected /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/variables.cnf /usr/lib/openssl/ptest/test/recipes/20-test_prime.t /usr/lib/openssl/ptest/test/recipes/90-test_handshake-memfail.t /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/leading-and-trailing-whitespace.cnf /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.cnf /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.cnf.expected1 /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.cnf.expected2 /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.1.d/includes1.conf /usr/lib/openssl/ptest/test/smime-certs/sm_mlkem768.pem /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/long_number.txt /usr/lib/openssl/ptest/test/recipes/30-test_lms.t /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/empty.txt /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.2.d/main.cnf /usr/lib/openssl/ptest/test/recipes/25-test_
 configutl_data/includes.2.d/subincludes.d/subconf.cnf /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/escapes.cnf.expected /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/hex_number.txt /usr/lib/openssl/ptest/test/recipes/02-test_mem_alloc.t /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/included-file.noncnf /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/order.cnf /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/escapes.cnf /usr/lib/openssl/ptest/test/recipes/95-test_external_rpki-client-portable.t /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/prime.txt /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/composite.txt /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/short_number.txt /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/variables.cnf.expected"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed

--===============7632210201479704429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.4 to libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.4 to libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.4 to libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.4 to libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.4 to libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.4 to libgthread-2.0.so.0.8600.3
  /usr/lib/libgio-2.0.so.0.8600.4 moved to /usr/lib/libgio-2.0.so.0.8600.3
  /usr/lib/libgirepository-2.0.so.0.8600.4 moved to /usr/lib/libgirepository-2.0.so.0.8600.3
  /usr/lib/libglib-2.0.so.0.8600.4 moved to /usr/lib/libglib-2.0.so.0.8600.3
  /usr/lib/libgmodule-2.0.so.0.8600.4 moved to /usr/lib/libgmodule-2.0.so.0.8600.3
  /usr/lib/libgobject-2.0.so.0.8600.4 moved to /usr/lib/libgobject-2.0.so.0.8600.3
  /usr/lib/libgthread-2.0.so.0.8600.4 moved to /usr/lib/libgthread-2.0.so.0.8600.3
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.3-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py
packages/x86-64-v3-poky-linux/openssl: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl: SRC_URI changed from "http://www.openssl.org/source/openssl-3.5.5.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://0001-Added-handshake-history-reporting-when-test-fails.patch file://0001-extend-check_cwm-test-timeout.patch" to "http://www.openssl.org/source/openssl-3.6.1.tar.gz file://run-ptest file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch file://0001-Configure-do-not-tweak-mips-cflags.patch file://0001-Added-handshake-history-reporting-when-test-fails.patch file://0001-extend-check_cwm-test-timeout.patch"
packages/x86-64-v3-poky-linux/openssl/libcrypto: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/libcrypto: PKGSIZE changed from 6111608 to 6200488 (+1%)
packages/x86-64-v3-poky-linux/openssl/libcrypto: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/libssl: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/libssl: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-bin: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-bin: PKGSIZE changed from 1091168 to 1107616 (+2%)
packages/x86-64-v3-poky-linux/openssl/openssl-bin: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-conf: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-conf: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-dbg: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-dbg: PKGSIZE changed from 20171824 to 20538688 (+2%)
packages/x86-64-v3-poky-linux/openssl/openssl-dbg: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-dev: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-dev: PKGSIZE changed from 2008876 to 2021855 (+1%)
packages/x86-64-v3-poky-linux/openssl/openssl-dev: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-doc: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-doc: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-engines: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-engines: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-locale: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-locale: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-misc: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-misc: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-ossl-module-fips: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-ossl-module-fips: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-ossl-module-legacy: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-ossl-module-legacy: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: PKGSIZE changed from 711754881 to 571311127 (-20%)
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-ptest: FILELIST: added "/usr/lib/openssl/ptest/test/recipes/20-test_prime_data/short_number.txt /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/hex_number.txt /usr/lib/openssl/ptest/test/recipes/30-test_lms.t /usr/lib/openssl/ptest/test/recipes/30-test_evp_data/evppkey_lms_sigver.txt /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/long_number.txt /usr/lib/openssl/ptest/test/recipes/02-test_mem_alloc_custom_fns.t /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.2.d/subincludes.d/subconf.cnf /usr/lib/openssl/ptest/test/smime-certs/sm_mlkem768.pem /usr/lib/openssl/ptest/test/recipes/90-test_handshake-memfail.t /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/order.cnf /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.1.d/includes1.conf /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.1.d/nonconf.bak /usr/lib/openssl/ptest/test/recipes/95-test_external_rpki-client
 -portable_data/rpki-client-portable.sh /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/prime.txt /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/composite.txt /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.1.d/includes1.cnf /usr/lib/openssl/ptest/test/mem_alloc_custom_fns_test /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/order.cnf.expected /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.2.d/main.cnf /usr/lib/openssl/ptest/test/recipes/95-test_external_rpki-client-portable.t /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/escapes.cnf.expected /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.cnf.expected1 /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/empty.txt /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.cnf.expected2 /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/includes.cnf /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/escapes.c
 nf /usr/lib/openssl/ptest/test/mem_alloc_test /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/variables.cnf /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/non_number.txt /usr/lib/openssl/ptest/test/smime-certs/sm_mlkem512.pem /usr/lib/openssl/ptest/test/recipes/25-test_configutl.t /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/variables.cnf.expected /usr/lib/openssl/ptest/test/recipes/02-test_mem_alloc.t /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/leading-and-trailing-whitespace.cnf.expected /usr/lib/openssl/ptest/test/recipes/20-test_prime_data/multiple_lines.txt /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/included-file.noncnf /usr/lib/openssl/ptest/test/recipes/20-test_prime.t /usr/lib/openssl/ptest/test/recipes/25-test_configutl_data/leading-and-trailing-whitespace.cnf"
packages/x86-64-v3-poky-linux/openssl/openssl-src: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-src: PKGSIZE changed from 25574758 to 26178080 (+2%)
packages/x86-64-v3-poky-linux/openssl/openssl-src: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl-src: FILELIST: directory renamed /usr/src/debug/openssl/3.5.5/providers/implementations/digests -> /usr/src/debug/openssl/3.6.1/providers/implementations/digests, directory renamed /usr/src/debug/openssl/3.5.5/crypto/slh_dsa -> /usr/src/debug/openssl/3.6.1/crypto/slh_dsa, directory renamed /usr/src/debug/openssl/3.5.5/crypto/srp -> /usr/src/debug/openssl/3.6.1/crypto/srp, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ocsp -> /usr/src/debug/openssl/3.6.1/crypto/ocsp, directory renamed /usr/src/debug/openssl/3.5.5/crypto/x509 -> /usr/src/debug/openssl/3.6.1/crypto/x509, directory renamed /usr/src/debug/openssl/3.5.5/crypto/bio -> /usr/src/debug/openssl/3.6.1/crypto/bio, directory renamed /usr/src/debug/openssl/3.5.5/providers/implementations/exchange -> /usr/src/debug/openssl/3.6.1/providers/implementations/exchange, directory renamed /usr/src/debug/openssl/3.5.5/crypto/cast -> /usr/src/debug/openssl/3.6.1/crypto/cast, directory ren
 amed /usr/src/debug/openssl/3.5.5/crypto/ec/curve448/arch_32 -> /usr/src/debug/openssl/3.6.1/crypto/ec/curve448/arch_32, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ess -> /usr/src/debug/openssl/3.6.1/crypto/ess, directory renamed /usr/src/debug/openssl/3.5.5/crypto/crmf -> /usr/src/debug/openssl/3.6.1/crypto/crmf, directory renamed /usr/src/debug/openssl/3.5.5/crypto/whrlpool -> /usr/src/debug/openssl/3.6.1/crypto/whrlpool, directory renamed /usr/src/debug/openssl/3.5.5/ssl/statem -> /usr/src/debug/openssl/3.6.1/ssl/statem, directory renamed /usr/src/debug/openssl/3.5.5/ssl -> /usr/src/debug/openssl/3.6.1/ssl, directory renamed /usr/src/debug/openssl/3.5.5/engines -> /usr/src/debug/openssl/3.6.1/engines, directory renamed /usr/src/debug/openssl/3.5.5/crypto/engine -> /usr/src/debug/openssl/3.6.1/crypto/engine, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ec/curve448 -> /usr/src/debug/openssl/3.6.1/crypto/ec/curve448, directory renamed /usr/src/debug/openssl/3.5.5
 /crypto/hmac -> /usr/src/debug/openssl/3.6.1/crypto/hmac, directory renamed /usr/src/debug/openssl/3.5.5/crypto/cmp -> /usr/src/debug/openssl/3.6.1/crypto/cmp, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ripemd -> /usr/src/debug/openssl/3.6.1/crypto/ripemd, directory renamed /usr/src/debug/openssl/3.5.5/crypto/async/arch -> /usr/src/debug/openssl/3.6.1/crypto/async/arch, directory renamed /usr/src/debug/openssl/3.5.5/crypto/poly1305 -> /usr/src/debug/openssl/3.6.1/crypto/poly1305, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ml_kem -> /usr/src/debug/openssl/3.6.1/crypto/ml_kem, directory renamed /usr/src/debug/openssl/3.5.5/crypto/seed -> /usr/src/debug/openssl/3.6.1/crypto/seed, directory renamed /usr/src/debug/openssl/3.5.5/crypto/buffer -> /usr/src/debug/openssl/3.6.1/crypto/buffer, directory renamed /usr/src/debug/openssl/3.5.5/crypto/rc2 -> /usr/src/debug/openssl/3.6.1/crypto/rc2, directory renamed /usr/src/debug/openssl/3.5.5/include/openssl -> /usr/src/debu
 g/openssl/3.6.1/include/openssl, directory renamed /usr/src/debug/openssl/3.5.5/crypto/rc4 -> /usr/src/debug/openssl/3.6.1/crypto/rc4, directory renamed /usr/src/debug/openssl/3.5.5/providers/implementations/rands/seeding -> /usr/src/debug/openssl/3.6.1/providers/implementations/rands/seeding, directory renamed /usr/src/debug/openssl/3.5.5/crypto/bn/asm -> /usr/src/debug/openssl/3.6.1/crypto/bn/asm, directory renamed /usr/src/debug/openssl/3.5.5/crypto/camellia -> /usr/src/debug/openssl/3.6.1/crypto/camellia, directory renamed /usr/src/debug/openssl/3.5.5/crypto/sm2 -> /usr/src/debug/openssl/3.6.1/crypto/sm2, directory renamed /usr/src/debug/openssl/3.5.5/crypto/pkcs12 -> /usr/src/debug/openssl/3.6.1/crypto/pkcs12, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ml_dsa -> /usr/src/debug/openssl/3.6.1/crypto/ml_dsa, directory renamed /usr/src/debug/openssl/3.5.5/providers/implementations/signature -> /usr/src/debug/openssl/3.6.1/providers/implementations/signature, directory re
 named /usr/src/debug/openssl/3.5.5/crypto/rsa -> /usr/src/debug/openssl/3.6.1/crypto/rsa, directory renamed /usr/src/debug/openssl/3.5.5/crypto/rand -> /usr/src/debug/openssl/3.6.1/crypto/rand, directory renamed /usr/src/debug/openssl/3.5.5/crypto/http -> /usr/src/debug/openssl/3.6.1/crypto/http, directory renamed /usr/src/debug/openssl/3.5.5/crypto/txt_db -> /usr/src/debug/openssl/3.6.1/crypto/txt_db, directory renamed /usr/src/debug/openssl/3.5.5/crypto/aria -> /usr/src/debug/openssl/3.6.1/crypto/aria, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ffc -> /usr/src/debug/openssl/3.6.1/crypto/ffc, directory renamed /usr/src/debug/openssl/3.5.5/providers/implementations/asymciphers -> /usr/src/debug/openssl/3.6.1/providers/implementations/asymciphers, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ct -> /usr/src/debug/openssl/3.6.1/crypto/ct, directory renamed /usr/src/debug/openssl/3.5.5/crypto/md4 -> /usr/src/debug/openssl/3.6.1/crypto/md4, directory renamed /usr/src/
 debug/openssl/3.5.5/crypto/md5 -> /usr/src/debug/openssl/3.6.1/crypto/md5, directory renamed /usr/src/debug/openssl/3.5.5/crypto/pem -> /usr/src/debug/openssl/3.6.1/crypto/pem, directory renamed /usr/src/debug/openssl/3.5.5/crypto/objects -> /usr/src/debug/openssl/3.6.1/crypto/objects, directory renamed /usr/src/debug/openssl/3.5.5/crypto/bn -> /usr/src/debug/openssl/3.6.1/crypto/bn, directory renamed /usr/src/debug/openssl/3.5.5/crypto/bf -> /usr/src/debug/openssl/3.6.1/crypto/bf, directory renamed /usr/src/debug/openssl/3.5.5/providers/implementations/keymgmt -> /usr/src/debug/openssl/3.6.1/providers/implementations/keymgmt, directory renamed /usr/src/debug/openssl/3.5.5/crypto/property -> /usr/src/debug/openssl/3.6.1/crypto/property, directory renamed /usr/src/debug/openssl/3.5.5/ssl/rio -> /usr/src/debug/openssl/3.6.1/ssl/rio, directory renamed /usr/src/debug/openssl/3.5.5/crypto/mdc2 -> /usr/src/debug/openssl/3.6.1/crypto/mdc2, directory renamed /usr/src/debug/openssl/3.5.5/cry
 pto/ui -> /usr/src/debug/openssl/3.6.1/crypto/ui, directory renamed /usr/src/debug/openssl/3.5.5/ssl/quic -> /usr/src/debug/openssl/3.6.1/ssl/quic, directory renamed /usr/src/debug/openssl/3.5.5/crypto/asn1 -> /usr/src/debug/openssl/3.6.1/crypto/asn1, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ec -> /usr/src/debug/openssl/3.6.1/crypto/ec, directory renamed /usr/src/debug/openssl/3.5.5/providers/common -> /usr/src/debug/openssl/3.6.1/providers/common, directory renamed /usr/src/debug/openssl/3.5.5/providers/implementations/macs -> /usr/src/debug/openssl/3.6.1/providers/implementations/macs, directory renamed /usr/src/debug/openssl/3.5.5/crypto/thread -> /usr/src/debug/openssl/3.6.1/crypto/thread, directory renamed /usr/src/debug/openssl/3.5.5/crypto/cmac -> /usr/src/debug/openssl/3.6.1/crypto/cmac, directory renamed /usr/src/debug/openssl/3.5.5/crypto/dso -> /usr/src/debug/openssl/3.6.1/crypto/dso, directory renamed /usr/src/debug/openssl/3.5.5/crypto/thread/arch -> /usr/s
 rc/debug/openssl/3.6.1/crypto/thread/arch, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ts -> /usr/src/debug/openssl/3.6.1/crypto/ts, directory renamed /usr/src/debug/openssl/3.5.5/crypto/dsa -> /usr/src/debug/openssl/3.6.1/crypto/dsa, directory renamed /usr/src/debug/openssl/3.5.5/crypto/store -> /usr/src/debug/openssl/3.6.1/crypto/store, directory renamed /usr/src/debug/openssl/3.5.5/crypto/async -> /usr/src/debug/openssl/3.6.1/crypto/async, directory renamed /usr/src/debug/openssl/3.5.5/crypto/stack -> /usr/src/debug/openssl/3.6.1/crypto/stack, directory renamed /usr/src/debug/openssl/3.5.5/crypto/conf -> /usr/src/debug/openssl/3.6.1/crypto/conf, directory renamed /usr/src/debug/openssl/3.5.5/crypto/lhash -> /usr/src/debug/openssl/3.6.1/crypto/lhash, directory renamed /usr/src/debug/openssl/3.5.5/crypto/dh -> /usr/src/debug/openssl/3.6.1/crypto/dh, directory renamed /usr/src/debug/openssl/3.5.5/crypto/modes -> /usr/src/debug/openssl/3.6.1/crypto/modes, directory renamed 
 /usr/src/debug/openssl/3.5.5/ssl/record -> /usr/src/debug/openssl/3.6.1/ssl/record, directory renamed /usr/src/debug/openssl/3.5.5/crypto/idea -> /usr/src/debug/openssl/3.6.1/crypto/idea, directory renamed /usr/src/debug/openssl/3.5.5/crypto/sha -> /usr/src/debug/openssl/3.6.1/crypto/sha, directory renamed /usr/src/debug/openssl/3.5.5/crypto/siphash -> /usr/src/debug/openssl/3.6.1/crypto/siphash, directory renamed /usr/src/debug/openssl/3.5.5/providers -> /usr/src/debug/openssl/3.6.1/providers, directory renamed /usr/src/debug/openssl/3.5.5/crypto/hpke -> /usr/src/debug/openssl/3.6.1/crypto/hpke, directory renamed /usr/src/debug/openssl/3.5.5/crypto/chacha -> /usr/src/debug/openssl/3.6.1/crypto/chacha, directory renamed /usr/src/debug/openssl/3.5.5/crypto/des -> /usr/src/debug/openssl/3.6.1/crypto/des, directory renamed /usr/src/debug/openssl/3.5.5/crypto/ec/curve448/arch_64 -> /usr/src/debug/openssl/3.6.1/crypto/ec/curve448/arch_64, directory renamed /usr/src/debug/openssl/3.5.5/cr
 ypto/hashtable -> /usr/src/debug/openssl/3.6.1/crypto/hashtable, directory renamed /usr/src/debug/openssl/3.5.5/apps/lib -> /usr/src/debug/openssl/3.6.1/apps/lib, directory renamed /usr/src/debug/openssl/3.5.5/crypto/kdf -> /usr/src/debug/openssl/3.6.1/crypto/kdf, directory renamed /usr/src/debug/openssl/3.5.5/ssl/record/methods -> /usr/src/debug/openssl/3.6.1/ssl/record/methods, directory renamed /usr/src/debug/openssl/3.5.5/crypto/pkcs7 -> /usr/src/debug/openssl/3.6.1/crypto/pkcs7, directory renamed /usr/src/debug/openssl/3.5.5/crypto/encode_decode -> /usr/src/debug/openssl/3.6.1/crypto/encode_decode, directory renamed /usr/src/debug/openssl/3.5.5/apps/include -> /usr/src/debug/openssl/3.6.1/apps/include, directory renamed /usr/src/debug/openssl/3.5.5/crypto/comp -> /usr/src/debug/openssl/3.6.1/crypto/comp, directory renamed /usr/src/debug/openssl/3.5.5/crypto/err -> /usr/src/debug/openssl/3.6.1/crypto/err, removed "/usr/src/debug/openssl/3.5.5/crypto/evp/signature.c /usr/src/debu
 g/openssl/3.5.5/providers/common/der/der_ecx_key.c /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/ml_kem_codecs.h /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/decode_spki2typespki.c /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/ml_kem_codecs.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/blake2.h /usr/src/debug/openssl/3.5.5/apps/crl.c /usr/src/debug/openssl/3.5.5/apps/fipsinstall.c /usr/src/debug/openssl/3.5.5/include/internal/skey.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/ciphercommon_ccm_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/ciphercommon_gcm_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/ml_common_codecs.c /usr/src/debug/openssl/3.5.5/include/internal/quic_cfq.h /usr/src/debug/openssl/3.5.5/apps/pkeyparam.c /usr/src/debug/openssl/3.5.5/include/crypto/async.h /usr/src/debug/openssl/3.5.5/providers/implementation
 s/encode_decode/ml_common_codecs.h /usr/src/debug/openssl/3.5.5/include/internal/quic_channel.h /usr/src/debug/openssl/3.5.5/include/crypto/ecx.h /usr/src/debug/openssl/3.5.5/crypto/aes/aes_core.c /usr/src/debug/openssl/3.5.5/crypto/aes/aes_misc.c /usr/src/debug/openssl/3.5.5/crypto/aes/aes_wrap.c /usr/src/debug/openssl/3.5.5/crypto/cpuid.c /usr/src/debug/openssl/3.5.5/crypto/evp/legacy_wp.c /usr/src/debug/openssl/3.5.5/apps/info.c /usr/src/debug/openssl/3.5.5/include/internal/quic_tserver.h /usr/src/debug/openssl/3.5.5/apps/enc.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes.h /usr/src/debug/openssl/3.5.5/crypto/aes/aes-x86_64.s /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_cts.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes.c /usr/src/debug/openssl/3.5.5/crypto/evp/keymgmt_lib.c /usr/src/debug/openssl/3.5.5/include/internal/thread.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_
 cts.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_des.c /usr/src/debug/openssl/3.5.5/include/internal/quic_engine.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha.c /usr/src/debug/openssl/3.5.5/include/internal/hpke_util.h /usr/src/debug/openssl/3.5.5/include/internal/quic_stream.h /usr/src/debug/openssl/3.5.5/include/crypto/modes.h /usr/src/debug/openssl/3.5.5/include/crypto/types.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha.h /usr/src/debug/openssl/3.5.5/crypto/aes/aes_cfb.c /usr/src/debug/openssl/3.5.5/crypto/aes/aes_ecb.c /usr/src/debug/openssl/3.5.5/crypto/aes/aes_ige.c /usr/src/debug/openssl/3.5.5/crypto/aes/aes_ofb.c /usr/src/debug/openssl/3.5.5/include/internal/conf.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_chacha20.c /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/decode_msblob2key.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphe
 rs/cipher_chacha20.h /usr/src/debug/openssl/3.5.5/crypto/cms/cms_smime.c /usr/src/debug/openssl/3.5.5/crypto/aes/aesni-sha256-x86_64.s /usr/src/debug/openssl/3.5.5/crypto/ex_data.c /usr/src/debug/openssl/3.5.5/apps/s_server.c /usr/src/debug/openssl/3.5.5/include/internal/json_enc.h /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/decode_pem2der.c /usr/src/debug/openssl/3.5.5/apps/x509.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_wrap_gen.c /usr/src/debug/openssl/3.5.5/apps/dhparam.c /usr/src/debug/openssl/3.5.5/apps/ecparam.c /usr/src/debug/openssl/3.5.5/providers/common/include/prov/der_ec.h /usr/src/debug/openssl/3.5.5/include/crypto/bn.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_chacha20_poly1305_hw.c /usr/src/debug/openssl/3.5.5/include/internal/quic_srt_gen.h /usr/src/debug/openssl/3.5.5/crypto/evp/skeymgmt_meth.c /usr/src/debug/openssl/3.5.5/include/internal/packet_quic.h /usr/src/debug/openssl/3.5.5/crypto/cms/cms_kar
 i.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_pwri.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_asn1.c /usr/src/debug/openssl/3.5.5/include/internal/core.h /usr/src/debug/openssl/3.5.5/crypto/cms/cms_ec.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_wrp.c /usr/src/debug/openssl/3.5.5/include/internal/passphrase.h /usr/src/debug/openssl/3.5.5/providers/common/include/prov/provider_util.h /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/ciphercommon_ccm.h /usr/src/debug/openssl/3.5.5/providers/common/der/der_dsa_gen.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_rsa_gen.c /usr/src/debug/openssl/3.5.5/include/crypto/ml_kem.h /usr/src/debug/openssl/3.5.5/include/crypto/x509v3err.h /usr/src/debug/openssl/3.5.5/crypto/provider_child.c /usr/src/debug/openssl/3.5.5/apps/list.c /usr/src/debug/openssl/3.5.5/include/internal/asn1.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_tdes_common.c /usr/src/debug/opens
 sl/3.5.5/crypto/evp/p_dec.c /usr/src/debug/openssl/3.5.5/crypto/provider_core.c /usr/src/debug/openssl/3.5.5/include/internal/quic_tls.h /usr/src/debug/openssl/3.5.5/crypto/evp/dsa_ctrl.c /usr/src/debug/openssl/3.5.5/providers/common/include/prov/bio.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_null.c /usr/src/debug/openssl/3.5.5/crypto/evp/legacy_md4.c /usr/src/debug/openssl/3.5.5/providers/implementations/rands/drbg_ctr.c /usr/src/debug/openssl/3.5.5/include/internal/quic_record_util.h /usr/src/debug/openssl/3.5.5/include/internal/quic_ssl.h /usr/src/debug/openssl/3.5.5/crypto/evp/evp_utils.c /usr/src/debug/openssl/3.5.5/include/internal/recordmethod.h /usr/src/debug/openssl/3.5.5/crypto/o_str.c /usr/src/debug/openssl/3.5.5/crypto/comp_methods.c /usr/src/debug/openssl/3.5.5/providers/common/include/prov/proverr.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aria_hw.c /usr/src/debug/openssl/3.5.5/crypto/sleep.c /usr/src/debug/open
 ssl/3.5.5/crypto/evp/digest.c /usr/src/debug/openssl/3.5.5/include/internal/to_hex.h /usr/src/debug/openssl/3.5.5/include/crypto/objects.h /usr/src/debug/openssl/3.5.5/include/crypto/security_bits.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aria.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_ecx_gen.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aria.h /usr/src/debug/openssl/3.5.5/providers/implementations/rands/test_rng.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_seed.c /usr/src/debug/openssl/3.5.5/crypto/info.c /usr/src/debug/openssl/3.5.5/crypto/init.c /usr/src/debug/openssl/3.5.5/apps/ec.c /usr/src/debug/openssl/3.5.5/crypto/time.c /usr/src/debug/openssl/3.5.5/include/crypto/decoder.h /usr/src/debug/openssl/3.5.5/crypto/evp/kdf_meth.c /usr/src/debug/openssl/3.5.5/include/crypto/encoder.h /usr/src/debug/openssl/3.5.5/crypto/mem.c /usr/src/debug/openssl/3.5.5/crypto/uid.c /usr/src/debug/openssl/3.5.5/providers/implement
 ations/rands/seed_src.c /usr/src/debug/openssl/3.5.5/crypto/sparse_array.c /usr/src/debug/openssl/3.5.5/include/crypto/ctype.h /usr/src/debug/openssl/3.5.5/include/crypto/store.h /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/encode_key2any.c /usr/src/debug/openssl/3.5.5/crypto/quic_vlint.c /usr/src/debug/openssl/3.5.5/crypto/o_fopen.c /usr/src/debug/openssl/3.5.5/include/crypto/slh_dsa.h /usr/src/debug/openssl/3.5.5/crypto/core_algorithm.c /usr/src/debug/openssl/3.5.5/include/crypto/err.h /usr/src/debug/openssl/3.5.5/include/crypto/ess.h /usr/src/debug/openssl/3.5.5/include/crypto/evp.h /usr/src/debug/openssl/3.5.5/include/crypto/pem.h /usr/src/debug/openssl/3.5.5/include/crypto/rsa.h /usr/src/debug/openssl/3.5.5/include/crypto/sha.h /usr/src/debug/openssl/3.5.5/include/crypto/siv.h /usr/src/debug/openssl/3.5.5/include/crypto/sm2.h /usr/src/debug/openssl/3.5.5/include/crypto/sm4.h /usr/src/debug/openssl/3.5.5/include/crypto/dsa.h /usr/src/debug/openssl/3.5.5/c
 rypto/evp/s_lib.c /usr/src/debug/openssl/3.5.5/include/internal/quic_fc.h /usr/src/debug/openssl/3.5.5/apps/cmp.c /usr/src/debug/openssl/3.5.5/include/crypto/asyncerr.h /usr/src/debug/openssl/3.5.5/include/internal/quic_reactor_wait_ctx.h /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/encode_key2text.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_tdes_default.h /usr/src/debug/openssl/3.5.5/providers/implementations/kem/eckem.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_tdes_default.c /usr/src/debug/openssl/3.5.5/providers/common/include/prov/der_rsa.h /usr/src/debug/openssl/3.5.5/providers/common/include/prov/der_dsa.h /usr/src/debug/openssl/3.5.5/crypto/evp/bio_ok.c /usr/src/debug/openssl/3.5.5/include/internal/quic_reactor.h /usr/src/debug/openssl/3.5.5/crypto/sslerr.h /usr/src/debug/openssl/3.5.5/include/crypto/asn1err.h /usr/src/debug/openssl/3.5.5/include/crypto/comperr.h /usr/src/debug/openssl/3.5.5/incl
 ude/crypto/conferr.h /usr/src/debug/openssl/3.5.5/include/crypto/crmferr.h /usr/src/debug/openssl/3.5.5/include/crypto/httperr.h /usr/src/debug/openssl/3.5.5/include/crypto/ocsperr.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/ciphercommon_block.c /usr/src/debug/openssl/3.5.5/include/crypto/randerr.h /usr/src/debug/openssl/3.5.5/include/crypto/objectserr.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aria_gcm.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aria_gcm.h /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/decode_epki2pki.c /usr/src/debug/openssl/3.5.5/crypto/aes/aesni-mb-x86_64.s /usr/src/debug/openssl/3.5.5/include/internal/ssl_unwrap.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_camellia.c /usr/src/debug/openssl/3.5.5/providers/implementations/skeymgmt/aes_skmgmt.c /usr/src/debug/openssl/3.5.5/include/internal/uint_set.h /usr/src/debug/openssl/3.5.5/include/i
 nternal/quic_demux.h /usr/src/debug/openssl/3.5.5/include/internal/quic_error.h /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/decoders.h /usr/src/debug/openssl/3.5.5/include/internal/quic_lcidm.h /usr/src/debug/openssl/3.5.5/include/internal/quic_rcidm.h /usr/src/debug/openssl/3.5.5/include/internal/quic_statm.h /usr/src/debug/openssl/3.5.5/include/internal/quic_trace.h /usr/src/debug/openssl/3.5.5/include/internal/quic_txpim.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_camellia.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4_xts.h /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/scrypt.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4_xts.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha1_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_gcm.h /usr/src/debug/openssl/3.5.5/crypto/evp/e_aes.c /usr/src/deb
 ug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_gcm.c /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/pkcs12kdf.c /usr/src/debug/openssl/3.5.5/crypto/o_init.c /usr/src/debug/openssl/3.5.5/providers/implementations/skeymgmt/skeymgmt_lcl.h /usr/src/debug/openssl/3.5.5/include/crypto/poly1305.h /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/argon2.c /usr/src/debug/openssl/3.5.5/crypto/evp/pbe_scrypt.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_des3.c /usr/src/debug/openssl/3.5.5/crypto/sm4/sm4.c /usr/src/debug/openssl/3.5.5/providers/implementations/rands/drbg_hash.c /usr/src/debug/openssl/3.5.5/apps/ts.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_sd.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4.h /usr/src/debug/openssl/3.5.5/include/internal/comp.h /usr/src/debug/openssl/3.5.5/include/internal/common.h /usr/src/debug/openssl/3.5.5/crypto/deterministic_nonce.c /usr/src/debug/openssl/3.5.5/crypto/evp/p5_crpt.c /usr/src
 /debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4.c /usr/src/debug/openssl/3.5.5/crypto/evp/pmeth_lib.c /usr/src/debug/openssl/3.5.5/crypto/evp/evp_cnf.c /usr/src/debug/openssl/3.5.5/crypto/evp/evp_enc.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_chacha20_poly1305.h /usr/src/debug/openssl/3.5.5/crypto/evp/evp_err.c /usr/src/debug/openssl/3.5.5/crypto/evp/evp_key.c /usr/src/debug/openssl/3.5.5/crypto/evp/evp_lib.c /usr/src/debug/openssl/3.5.5/crypto/evp/evp_pbe.c /usr/src/debug/openssl/3.5.5/crypto/evp/m_sigver.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_cts.inc /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_gcm_siv_hw.c /usr/src/debug/openssl/3.5.5/include/internal/crmf.h /usr/src/debug/openssl/3.5.5/crypto/evp/c_allc.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_chacha20_poly1305.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/ecx.h /
 usr/src/debug/openssl/3.5.5/crypto/punycode.c /usr/src/debug/openssl/3.5.5/apps/rsa.c /usr/src/debug/openssl/3.5.5/crypto/aes/bsaes-x86_64.s /usr/src/debug/openssl/3.5.5/crypto/evp/e_xcbc_d.c /usr/src/debug/openssl/3.5.5/include/crypto/buffererr.h /usr/src/debug/openssl/3.5.5/include/internal/o_dir.h /usr/src/debug/openssl/3.5.5/crypto/evp/p_sign.c /usr/src/debug/openssl/3.5.5/apps/storeutl.c /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/hmacdrbg_kdf.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_gcm_siv.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_dsa_sig.c /usr/src/debug/openssl/3.5.5/crypto/params_dup.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_rsa_sig.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_gcm_siv.h /usr/src/debug/openssl/3.5.5/include/crypto/rand_pool.h /usr/src/debug/openssl/3.5.5/include/internal/quic_types.h /usr/src/debug/openssl/3.5.5/include/internal/quic_vlint.h /usr/sr
 c/debug/openssl/3.5.5/apps/dgst.c /usr/src/debug/openssl/3.5.5/providers/common/include/prov/der_ml_dsa.h /usr/src/debug/openssl/3.5.5/providers/implementations/storemgmt/file_store.c /usr/src/debug/openssl/3.5.5/apps/dsa.c /usr/src/debug/openssl/3.5.5/crypto/der_writer.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/implementations.h /usr/src/debug/openssl/3.5.5/include/crypto/tserr.h /usr/src/debug/openssl/3.5.5/include/crypto/bnerr.h /usr/src/debug/openssl/3.5.5/include/crypto/cterr.h /usr/src/debug/openssl/3.5.5/include/crypto/dherr.h /usr/src/debug/openssl/3.5.5/include/crypto/ecerr.h /usr/src/debug/openssl/3.5.5/include/crypto/uierr.h /usr/src/debug/openssl/3.5.5/crypto/cms/cms_dh.c /usr/src/debug/openssl/3.5.5/include/internal/priority_queue.h /usr/src/debug/openssl/3.5.5/include/internal/dsoerr.h /usr/src/debug/openssl/3.5.5/crypto/evp/e_aes_cbc_hmac_sha256.c /usr/src/debug/openssl/3.5.5/include/internal/dane.h /usr/src/debug/openssl/3.5.5/crypto/bsearc
 h.c /usr/src/debug/openssl/3.5.5/crypto/passphrase.c /usr/src/debug/openssl/3.5.5/include/crypto/siphash.h /usr/src/debug/openssl/3.5.5/crypto/evp/dh_support.c /usr/src/debug/openssl/3.5.5/include/internal/quic_txp.h /usr/src/debug/openssl/3.5.5/providers/common/include/prov/der_digests.h /usr/src/debug/openssl/3.5.5/include/crypto/cryptlib.h /usr/src/debug/openssl/3.5.5/include/internal/ssl.h /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/hkdf.c /usr/src/debug/openssl/3.5.5/include/internal/quic_cc.h /usr/src/debug/openssl/3.5.5/crypto/provider_local.h /usr/src/debug/openssl/3.5.5/providers/implementations/storemgmt/file_store_any2obj.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_aria.c /usr/src/debug/openssl/3.5.5/providers/common/include/prov/provider_ctx.h /usr/src/debug/openssl/3.5.5/crypto/rcu_internal.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_gcm_siv_polyval.c /usr/src/debug/openssl/3.5.5/crypto/x86_64cpuid.s /usr/src/debug/openssl
 /3.5.5/crypto/cryptlib.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_ccm_hw.c /usr/src/debug/openssl/3.5.5/crypto/mem_sec.c /usr/src/debug/openssl/3.5.5/providers/common/include/prov/providercommon.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_gcm_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_ocb_hw.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_dd.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_siv_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_xts_hw.c /usr/src/debug/openssl/3.5.5/include/crypto/sparse_array.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha256_hw.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_digests_gen.c /usr/src/debug/openssl/3.5.5/crypto/threads_lib.c /usr/src/debug/openssl/3.5.5/crypto/evp/keymgmt_meth.c /usr/src/debug/openssl/3.5.5/crypto/evp/ctrl_params_transla
 te.c /usr/src/debug/openssl/3.5.5/providers/implementations/rands/drbg_hmac.c /usr/src/debug/openssl/3.5.5/crypto/evp/mac_lib.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aria_ccm_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aria_gcm_hw.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_cast.c /usr/src/debug/openssl/3.5.5/include/internal/param_build_set.h /usr/src/debug/openssl/3.5.5/crypto/evp/ec_ctrl.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_io.c /usr/src/debug/openssl/3.5.5/include/internal/propertyerr.h /usr/src/debug/openssl/3.5.5/apps/sess_id.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4_ccm.c /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/endecoder_local.h /usr/src/debug/openssl/3.5.5/crypto/aes/vpaes-x86_64.s /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4_ccm.h /usr/src/debug/openssl/3.5.5/crypto/evp/evp_pkey.c /usr/src/debug/openssl/3.5.5/cry
 pto/evp/evp_rand.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_hw_aesni.inc /usr/src/debug/openssl/3.5.5/crypto/cpt_err.c /usr/src/debug/openssl/3.5.5/crypto/ssl_err.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_slh_dsa_gen.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/mlx_kem.h /usr/src/debug/openssl/3.5.5/include/internal/qlog_event_helpers.h /usr/src/debug/openssl/3.5.5/providers/implementations/kem/ecx_kem.c /usr/src/debug/openssl/3.5.5/providers/implementations/kem/mlx_kem.c /usr/src/debug/openssl/3.5.5/include/internal/der.h /usr/src/debug/openssl/3.5.5/providers/implementations/kem/rsa_kem.c /usr/src/debug/openssl/3.5.5/crypto/evp/legacy_md5_sha1.c /usr/src/debug/openssl/3.5.5/apps/asn1parse.c /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/endecoder_common.c /usr/src/debug/openssl/3.5.5/crypto/params_idx.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/ciphercommon_hw.c /usr/
 src/debug/openssl/3.5.5/include/internal/sha3.h /usr/src/debug/openssl/3.5.5/providers/common/include/prov/der_sm2.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_xts_fips.c /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/decode_der2key.c /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/decode_pvk2key.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aria_ccm.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aria_ccm.h /usr/src/debug/openssl/3.5.5/providers/common/der/der_sm2_sig.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/ml_dsa.h /usr/src/debug/openssl/3.5.5/apps/dsaparam.c /usr/src/debug/openssl/3.5.5/crypto/evp/cmeth_lib.c /usr/src/debug/openssl/3.5.5/include/internal/quic_record_rx.h /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/encode_key2ms.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_att.c /usr/src/debug/openssl/3.
 5.5/crypto/cms/cms_enc.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_env.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_err.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_ess.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_lib.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_rsa.c /usr/src/debug/openssl/3.5.5/include/internal/qlog_events.h /usr/src/debug/openssl/3.5.5/providers/common/der/der_ml_dsa_gen.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_ml_dsa_key.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_rc4_hmac_md5.c /usr/src/debug/openssl/3.5.5/crypto/indicator_core.c /usr/src/debug/openssl/3.5.5/crypto/cms/cms_local.h /usr/src/debug/openssl/3.5.5/providers/common/der/der_sm2_key.c /usr/src/debug/openssl/3.5.5/include/crypto/bn_dh.h /usr/src/debug/openssl/3.5.5/include/crypto/lhash.h /usr/src/debug/openssl/3.5.5/apps/version.c /usr/src/debug/openssl/3.5.5/include/internal/sm3.h /usr/src/debug/openssl/3.5.5/apps/openssl.c /usr/src/debug/openssl/3.5.5/apps/pkeyutl.c /usr/src/debug
 /openssl/3.5.5/apps/skeyutl.c /usr/src/debug/openssl/3.5.5/crypto/evp/p5_crpt2.c /usr/src/debug/openssl/3.5.5/crypto/evp/pmeth_gn.c /usr/src/debug/openssl/3.5.5/apps/mac.c /usr/src/debug/openssl/3.5.5/include/crypto/asn1_dsa.h /usr/src/debug/openssl/3.5.5/providers/implementations/rands/drbg.c /usr/src/debug/openssl/3.5.5/crypto/core_namemap.c /usr/src/debug/openssl/3.5.5/crypto/evp/names.c /usr/src/debug/openssl/3.5.5/providers/implementations/skeymgmt/generic.c /usr/src/debug/openssl/3.5.5/crypto/packet.c /usr/src/debug/openssl/3.5.5/include/internal/thread_arch.h /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/kbkdf.c /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/sskdf.c /usr/src/debug/openssl/3.5.5/crypto/evp/asymcipher.c /usr/src/debug/openssl/3.5.5/crypto/evp/mac_meth.c /usr/src/debug/openssl/3.5.5/include/internal/ssl3_cbc.h /usr/src/debug/openssl/3.5.5/crypto/evp/p_lib.c /usr/src/debug/openssl/3.5.5/include/internal/encoder.h /usr/src/debug/openssl/
 3.5.5/include/crypto/cryptoerr.h /usr/src/debug/openssl/3.5.5/crypto/sm3/legacy_sm3.c /usr/src/debug/openssl/3.5.5/apps/ocsp.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_camellia_cts.inc /usr/src/debug/openssl/3.5.5/include/crypto/storeerr.h /usr/src/debug/openssl/3.5.5/crypto/evp/pmeth_check.c /usr/src/debug/openssl/3.5.5/include/internal/deterministic_nonce.h /usr/src/debug/openssl/3.5.5/include/internal/ring_buf.h /usr/src/debug/openssl/3.5.5/providers/common/der/der_sm2_gen.c /usr/src/debug/openssl/3.5.5/crypto/provider_predefined.c /usr/src/debug/openssl/3.5.5/include/internal/quic_predef.h /usr/src/debug/openssl/3.5.5/include/internal/param_names.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_chacha20_hw.c /usr/src/debug/openssl/3.5.5/crypto/evp/ec_support.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_ec_gen.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/ciphercommon_gcm.h /usr/src/debug/opens
 sl/3.5.5/include/crypto/context.h /usr/src/debug/openssl/3.5.5/include/crypto/pkcs7.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_tdes_wrap_hw.c /usr/src/debug/openssl/3.5.5/include/internal/quic_stream_map.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_ccm.c /usr/src/debug/openssl/3.5.5/crypto/provider_conf.c /usr/src/debug/openssl/3.5.5/apps/req.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_ocb.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_ccm.h /usr/src/debug/openssl/3.5.5/include/internal/cryptlib.h /usr/src/debug/openssl/3.5.5/crypto/evp/e_aes_cbc_hmac_sha1.c /usr/src/debug/openssl/3.5.5/crypto/evp/kdf_lib.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_ocb.c /usr/src/debug/openssl/3.5.5/include/internal/packet.h /usr/src/debug/openssl/3.5.5/include/internal/refcount.h /usr/src/debug/openssl/3.5.5/crypto/asn1_dsa.c /usr/src/debug/openssl
 /3.5.5/crypto/params_from_text.c /usr/src/debug/openssl/3.5.5/crypto/aes/aesni-xts-avx512.s /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/ml_kem.h /usr/src/debug/openssl/3.5.5/crypto/evp/e_rc2.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/md5_sha1.h /usr/src/debug/openssl/3.5.5/apps/cms.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/ciphercommon_ccm.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/ciphercommon_gcm.c /usr/src/debug/openssl/3.5.5/providers/implementations/kem/kem_util.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_rc4.c /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/krb5kdf.c /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/x942kdf.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/ciphercommon.c /usr/src/debug/openssl/3.5.5/crypto/aes/aes_local.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4_ccm_hw.c /usr/src/debug/openssl/3.5
 .5/providers/implementations/ciphers/cipher_sm4_gcm_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4_xts_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/pbkdf2.c /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/pbkdf2.h /usr/src/debug/openssl/3.5.5/providers/common/der/der_ec_key.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/kdfexchange.h /usr/src/debug/openssl/3.5.5/providers/common/include/prov/securitycheck.h /usr/src/debug/openssl/3.5.5/providers/common/include/prov/der_slh_dsa.h /usr/src/debug/openssl/3.5.5/crypto/param_build.c /usr/src/debug/openssl/3.5.5/crypto/param_build_set.c /usr/src/debug/openssl/3.5.5/crypto/ebcdic.c /usr/src/debug/openssl/3.5.5/include/internal/statem.h /usr/src/debug/openssl/3.5.5/crypto/provider.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/hmac_drbg.h /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/encode_key2blob.c /usr/src
 /debug/openssl/3.5.5/crypto/buildinf.h /usr/src/debug/openssl/3.5.5/crypto/evp/exchange.c /usr/src/debug/openssl/3.5.5/crypto/evp/legacy_blake2.c /usr/src/debug/openssl/3.5.5/apps/rehash.c /usr/src/debug/openssl/3.5.5/apps/rsautl.c /usr/src/debug/openssl/3.5.5/apps/s_time.c /usr/src/debug/openssl/3.5.5/apps/verify.c /usr/src/debug/openssl/3.5.5/apps/engine.c /usr/src/debug/openssl/3.5.5/apps/errstr.c /usr/src/debug/openssl/3.5.5/apps/gendsa.c /usr/src/debug/openssl/3.5.5/apps/genrsa.c /usr/src/debug/openssl/3.5.5/apps/passwd.c /usr/src/debug/openssl/3.5.5/apps/pkcs12.c /usr/src/debug/openssl/3.5.5/crypto/ctype.c /usr/src/debug/openssl/3.5.5/crypto/trace.c /usr/src/debug/openssl/3.5.5/include/internal/unicode.h /usr/src/debug/openssl/3.5.5/crypto/evp/legacy_ripemd.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/rands/drbg_local.h /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/
 macsignature.h /usr/src/debug/openssl/3.5.5/apps/progs.h /usr/src/debug/openssl/3.5.5/crypto/context.c /usr/src/debug/openssl/3.5.5/crypto/evp/bio_md.c /usr/src/debug/openssl/3.5.5/apps/prime.c /usr/src/debug/openssl/3.5.5/apps/progs.c /usr/src/debug/openssl/3.5.5/apps/smime.c /usr/src/debug/openssl/3.5.5/apps/speed.c /usr/src/debug/openssl/3.5.5/apps/spkac.c /usr/src/debug/openssl/3.5.5/apps/pkcs7.c /usr/src/debug/openssl/3.5.5/apps/pkcs8.c /usr/src/debug/openssl/3.5.5/include/internal/quic_ackm.h /usr/src/debug/openssl/3.5.5/include/internal/quic_fifd.h /usr/src/debug/openssl/3.5.5/crypto/evp/c_alld.c /usr/src/debug/openssl/3.5.5/include/internal/quic_port.h /usr/src/debug/openssl/3.5.5/include/internal/quic_record_tx.h /usr/src/debug/openssl/3.5.5/include/internal/quic_srtm.h /usr/src/debug/openssl/3.5.5/include/internal/quic_wire.h /usr/src/debug/openssl/3.5.5/providers/common/der/der_slh_dsa_key.c /usr/src/debug/openssl/3.5.5/apps/nseq.c /usr/src/debug/openssl/3.5.5/providers/i
 mplementations/ciphers/cipher_aes_gcm_hw_vaes_avx512.inc /usr/src/debug/openssl/3.5.5/include/internal/cms.h /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/ml_dsa_codecs.c /usr/src/debug/openssl/3.5.5/providers/implementations/storemgmt/file_store_local.h /usr/src/debug/openssl/3.5.5/providers/implementations/encode_decode/ml_dsa_codecs.h /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/sshkdf.c /usr/src/debug/openssl/3.5.5/crypto/evp/encode.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_xts.h /usr/src/debug/openssl/3.5.5/crypto/sm3/sm3.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_camellia.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_xts.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_sm4.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_idea.c /usr/src/debug/openssl/3.5.5/crypto/threads_pthread.c /usr/src/debug/openssl/3.5.5/crypto/evp/legacy_mdc2.c /usr/src/debug/openssl/3.5.5/crypto/evp/bio_b64.c /u
 sr/src/debug/openssl/3.5.5/crypto/evp/bio_enc.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4_hw.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_ccm_hw_aesni.inc /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_gcm_hw_aesni.inc /usr/src/debug/openssl/3.5.5/crypto/evp/p_enc.c /usr/src/debug/openssl/3.5.5/crypto/evp/m_null.c /usr/src/debug/openssl/3.5.5/crypto/evp/p_legacy.c /usr/src/debug/openssl/3.5.5/crypto/evp/p_verify.c /usr/src/debug/openssl/3.5.5/crypto/aes/aesni-sha1-x86_64.s /usr/src/debug/openssl/3.5.5/include/internal/quic_sf_list.h /usr/src/debug/openssl/3.5.5/include/internal/constant_time.h /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/seeding.h /usr/src/debug/openssl/3.5.5/include/crypto/engine.h /usr/src/debug/openssl/3.5.5/crypto/LPdir_unix.c /usr/src/debug/openssl/3.5.5/include/internal/provider.h /usr/src/debug/openssl/3.5.5/include/internal/rio_notifier.h /usr/src
 /debug/openssl/3.5.5/providers/common/include/prov/der_wrap.h /usr/src/debug/openssl/3.5.5/apps/srp.c /usr/src/debug/openssl/3.5.5/providers/implementations/rands/seed_src_jitter.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_ec_sig.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/digestcommon.h /usr/src/debug/openssl/3.5.5/crypto/cversion.c /usr/src/debug/openssl/3.5.5/crypto/initthread.c /usr/src/debug/openssl/3.5.5/apps/crl2pkcs7.c /usr/src/debug/openssl/3.5.5/providers/implementations/kem/ml_kem_kem.c /usr/src/debug/openssl/3.5.5/crypto/evp/p_open.c /usr/src/debug/openssl/3.5.5/include/internal/property.h /usr/src/debug/openssl/3.5.5/include/internal/hashfunc.h /usr/src/debug/openssl/3.5.5/include/crypto/punycode.h /usr/src/debug/openssl/3.5.5/apps/s_client.c /usr/src/debug/openssl/3.5.5/include/internal/params.h /usr/src/debug/openssl/3.5.5/crypto/o_time.c /usr/src/debug/openssl/3.5.5/crypto/defaults.c /usr/src/debug/openssl/3.5.5/crypto/evp/legacy
 _md5.c /usr/src/debug/openssl/3.5.5/include/crypto/x509err.h /usr/src/debug/openssl/3.5.5/crypto/evp/evp_fetch.c /usr/src/debug/openssl/3.5.5/apps/rand.c /usr/src/debug/openssl/3.5.5/crypto/core_fetch.c /usr/src/debug/openssl/3.5.5/include/internal/sslconf.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_tdes_default_hw.c /usr/src/debug/openssl/3.5.5/apps/pkey.c /usr/src/debug/openssl/3.5.5/crypto/evp/dh_ctrl.c /usr/src/debug/openssl/3.5.5/crypto/evp/evp_local.h /usr/src/debug/openssl/3.5.5/include/crypto/aria.h /usr/src/debug/openssl/3.5.5/include/crypto/asn1.h /usr/src/debug/openssl/3.5.5/include/crypto/cmac.h /usr/src/debug/openssl/3.5.5/include/crypto/rand.h /usr/src/debug/openssl/3.5.5/include/crypto/x509.h /usr/src/debug/openssl/3.5.5/include/crypto/x509_acert.h /usr/src/debug/openssl/3.5.5/crypto/evp/e_old.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_tdes.h /usr/src/debug/openssl/3.5.5/include/internal/qlog.h /usr/src/debug/op
 enssl/3.5.5/providers/implementations/ciphers/ciphercommon_local.h /usr/src/debug/openssl/3.5.5/include/internal/bio.h /usr/src/debug/openssl/3.5.5/include/internal/dso.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_tdes.c /usr/src/debug/openssl/3.5.5/include/crypto/pemerr.h /usr/src/debug/openssl/3.5.5/include/crypto/rsaerr.h /usr/src/debug/openssl/3.5.5/include/crypto/bioerr.h /usr/src/debug/openssl/3.5.5/include/crypto/cmperr.h /usr/src/debug/openssl/3.5.5/include/crypto/cmserr.h /usr/src/debug/openssl/3.5.5/include/crypto/dsaerr.h /usr/src/debug/openssl/3.5.5/include/crypto/esserr.h /usr/src/debug/openssl/3.5.5/include/crypto/evperr.h /usr/src/debug/openssl/3.5.5/include/internal/namemap.h /usr/src/debug/openssl/3.5.5/include/internal/quic_rx_depack.h /usr/src/debug/openssl/3.5.5/providers/implementations/kem/ec_kem.c /usr/src/debug/openssl/3.5.5/crypto/evp/e_null.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_camellia_hw.c /usr/
 src/debug/openssl/3.5.5/crypto/evp/e_chacha20_poly1305.c /usr/src/debug/openssl/3.5.5/include/crypto/ec.h /usr/src/debug/openssl/3.5.5/include/internal/bio_addr.h /usr/src/debug/openssl/3.5.5/include/crypto/aes_platform.h /usr/src/debug/openssl/3.5.5/crypto/evp/e_bf.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_dsa_key.c /usr/src/debug/openssl/3.5.5/providers/common/der/der_rsa_key.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_tdes_hw.c /usr/src/debug/openssl/3.5.5/include/internal/numbers.h /usr/src/debug/openssl/3.5.5/include/crypto/bn_srp.h /usr/src/debug/openssl/3.5.5/include/crypto/pkcs7err.h /usr/src/debug/openssl/3.5.5/providers/common/include/prov/der_ecx.h /usr/src/debug/openssl/3.5.5/include/internal/rcu.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_siv.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_tdes_wrap.c /usr/src/debug/openssl/3.5.5/providers/implementations/include/prov/ciphe
 rcommon.h /usr/src/debug/openssl/3.5.5/include/crypto/md32_common.h /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_aes_siv.h /usr/src/debug/openssl/3.5.5/crypto/self_test_core.c /usr/src/debug/openssl/3.5.5/include/crypto/engineerr.h /usr/src/debug/openssl/3.5.5/include/internal/quic_thread_assist.h /usr/src/debug/openssl/3.5.5/include/crypto/pkcs12err.h /usr/src/debug/openssl/3.5.5/crypto/params.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4_gcm.h /usr/src/debug/openssl/3.5.5/crypto/evp/legacy_sha.c /usr/src/debug/openssl/3.5.5/providers/implementations/ciphers/cipher_sm4_gcm.c /usr/src/debug/openssl/3.5.5/include/internal/ffc.h /usr/src/debug/openssl/3.5.5/include/crypto/dh.h /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/tls1_prf.c /usr/src/debug/openssl/3.5.5/providers/implementations/kdfs/pbkdf2_fips.c /usr/src/debug/openssl/3.5.5/include/internal/quic_wire_pkt.h /usr/src/debug/openssl/3.5.5/apps/genpkey.c /usr/sr
 c/debug/openssl/3.5.5/crypto/evp/p_seal.c /usr/src/debug/openssl/3.5.5/apps/kdf.c /usr/src/debug/openssl/3.5.5/crypto/getenv.c /usr/src/debug/openssl/3.5.5/crypto/aes/aesni-x86_64.s /usr/src/debug/openssl/3.5.5/apps/ca.c /usr/src/debug/openssl/3.5.5/apps/testdsa.h /usr/src/debug/openssl/3.5.5/apps/testrsa.h /usr/src/debug/openssl/3.5.5/include/crypto/chacha.h /usr/src/debug/openssl/3.5.5/include/internal/time.h /usr/src/debug/openssl/3.5.5/include/crypto/ml_dsa.h /usr/src/debug/openssl/3.5.5/include/internal/hashtable.h /usr/src/debug/openssl/3.5.5/apps/ciphers.c /usr/src/debug/openssl/3.5.5/crypto/evp/kem.c", added "/usr/src/debug/openssl/3.6.1/crypto/evp/e_old.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_tdes.h /usr/src/debug/openssl/3.6.1/include/internal/bio.h /usr/src/debug/openssl/3.6.1/include/internal/dso.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_tdes.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cip
 her_aes_ccm.c /usr/src/debug/openssl/3.6.1/include/internal/namemap.h /usr/src/debug/openssl/3.6.1/crypto/provider_conf.c /usr/src/debug/openssl/3.6.1/apps/req.c /usr/src/debug/openssl/3.6.1/include/internal/passphrase.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_ccm.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_ocb.h /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/ciphercommon_ccm.h /usr/src/debug/openssl/3.6.1/include/internal/cryptlib.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_ocb.c /usr/src/debug/openssl/3.6.1/crypto/evp/kdf_lib.c /usr/src/debug/openssl/3.6.1/include/internal/packet.h /usr/src/debug/openssl/3.6.1/include/internal/refcount.h /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_digests.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_tdes_common.c /usr/src/debug/openssl/3.6.1/crypto/asn1_dsa.c /usr/src/debug/openssl/3.6
 .1/crypto/evp/dsa_ctrl.c /usr/src/debug/openssl/3.6.1/providers/common/include/prov/bio.h /usr/src/debug/openssl/3.6.1/include/crypto/ec.h /usr/src/debug/openssl/3.6.1/include/crypto/aes_platform.h /usr/src/debug/openssl/3.6.1/include/crypto/sm4_platform.h /usr/src/debug/openssl/3.6.1/crypto/rcu_internal.h /usr/src/debug/openssl/3.6.1/include/internal/quic_record_util.h /usr/src/debug/openssl/3.6.1/include/internal/numbers.h /usr/src/debug/openssl/3.6.1/crypto/evp/evp_utils.c /usr/src/debug/openssl/3.6.1/apps/cms.c /usr/src/debug/openssl/3.6.1/include/internal/recordmethod.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cfb.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_ccm_hw.c /usr/src/debug/openssl/3.6.1/include/internal/rcu.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cfb_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_gcm_hw.c /usr/src/debug/openssl/3.6.1/provi
 ders/implementations/ciphers/cipher_aes_ocb_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_siv_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_xts_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/ciphercommon.c /usr/src/debug/openssl/3.6.1/include/crypto/engineerr.h /usr/src/debug/openssl/3.6.1/crypto/self_test_core.c /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/pbkdf2.c /usr/src/debug/openssl/3.6.1/include/crypto/pkcs12err.h /usr/src/debug/openssl/3.6.1/include/internal/ffc.h /usr/src/debug/openssl/3.6.1/include/crypto/dh.h /usr/src/debug/openssl/3.6.1/crypto/ebcdic.c /usr/src/debug/openssl/3.6.1/include/internal/statem.h /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/ml_common_codecs.h /usr/src/debug/openssl/3.6.1/include/internal/param_build_set.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha512_etm_hw.c /usr/src/debug/open
 ssl/3.6.1/crypto/evp/ec_ctrl.c /usr/src/debug/openssl/3.6.1/crypto/provider.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/drbg.h /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/hmac_drbg.h /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/encode_key2blob.c /usr/src/debug/openssl/3.6.1/crypto/buildinf.h /usr/src/debug/openssl/3.6.1/crypto/evp/evp_pkey.c /usr/src/debug/openssl/3.6.1/crypto/evp/evp_rand.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/ml_kem_codecs.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_hw_aesni.inc /usr/src/debug/openssl/3.6.1/apps/ca.c /usr/src/debug/openssl/3.6.1/include/internal/qlog_event_helpers.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha256_etm_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/kem/ecx_kem.c /usr/src/debug/openssl/3.6.1/providers/implementations/kem/mlx_kem.c /usr/src/debug
 /openssl/3.6.1/providers/implementations/kem/rsa_kem.c /usr/src/debug/openssl/3.6.1/include/internal/quic_reactor_wait_ctx.h /usr/src/debug/openssl/3.6.1/crypto/evp/kem.c /usr/src/debug/openssl/3.6.1/crypto/evp/bio_md.c /usr/src/debug/openssl/3.6.1/include/internal/quic_reactor.h /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_sm2.h /usr/src/debug/openssl/3.6.1/crypto/evp/signature.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_xts_fips.c /usr/src/debug/openssl/3.6.1/crypto/evp/c_alld.c /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/ml_kem_codecs.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/blake2.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/ciphercommon_block.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/file_store_local.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_gcm_hw_vaes_avx512.inc /usr/src/debug/openssl/3.6.1/ap
 ps/dsaparam.c /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/sshkdf.c /usr/src/debug/openssl/3.6.1/crypto/evp/encode.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_xts.h /usr/src/debug/openssl/3.6.1/include/internal/ssl_unwrap.h /usr/src/debug/openssl/3.6.1/include/crypto/async.h /usr/src/debug/openssl/3.6.1/include/internal/qlog_events.h /usr/src/debug/openssl/3.6.1/include/internal/quic_demux.h /usr/src/debug/openssl/3.6.1/include/internal/quic_error.h /usr/src/debug/openssl/3.6.1/include/internal/quic_lcidm.h /usr/src/debug/openssl/3.6.1/include/internal/quic_rcidm.h /usr/src/debug/openssl/3.6.1/crypto/evp/e_idea.c /usr/src/debug/openssl/3.6.1/crypto/threads_pthread.c /usr/src/debug/openssl/3.6.1/include/internal/quic_statm.h /usr/src/debug/openssl/3.6.1/include/internal/quic_trace.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_xts.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_hw_
 x86_64.inc /usr/src/debug/openssl/3.6.1/crypto/cpuid.c /usr/src/debug/openssl/3.6.1/crypto/evp/legacy_wp.c /usr/src/debug/openssl/3.6.1/apps/info.c /usr/src/debug/openssl/3.6.1/crypto/evp/m_null.c /usr/src/debug/openssl/3.6.1/crypto/evp/keymgmt_lib.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_des.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_kemri.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/seeding.h /usr/src/debug/openssl/3.6.1/crypto/core_namemap.c /usr/src/debug/openssl/3.6.1/include/crypto/engine.h /usr/src/debug/openssl/3.6.1/crypto/LPdir_unix.c /usr/src/debug/openssl/3.6.1/include/internal/provider.h /usr/src/debug/openssl/3.6.1/include/crypto/modes.h /usr/src/debug/openssl/3.6.1/include/crypto/types.h /usr/src/debug/openssl/3.6.1/apps/srp.c /usr/src/debug/openssl/3.6.1/crypto/aes/aes_cfb.c /usr/src/debug/openssl/3.6.1/crypto/aes/aes_ecb.c /usr/src/debug/openssl/3.6.1/crypto/aes/aes_ige.c /usr/src/debug/openssl/3.6.1/crypto/aes/aes_ofb.c /usr/src/debug
 /openssl/3.6.1/include/internal/thread_arch.h /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/digestcommon.h /usr/src/debug/openssl/3.6.1/crypto/cversion.c /usr/src/debug/openssl/3.6.1/crypto/initthread.c /usr/src/debug/openssl/3.6.1/crypto/evp/p_open.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_chacha20.c /usr/src/debug/openssl/3.6.1/include/internal/property.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_chacha20.h /usr/src/debug/openssl/3.6.1/include/internal/hashfunc.h /usr/src/debug/openssl/3.6.1/crypto/cms/cms_smime.c /usr/src/debug/openssl/3.6.1/crypto/evp/evp_cnf.c /usr/src/debug/openssl/3.6.1/crypto/evp/evp_enc.c /usr/src/debug/openssl/3.6.1/include/crypto/punycode.h /usr/src/debug/openssl/3.6.1/crypto/evp/evp_err.c /usr/src/debug/openssl/3.6.1/crypto/evp/evp_key.c /usr/src/debug/openssl/3.6.1/crypto/evp/evp_lib.c /usr/src/debug/openssl/3.6.1/crypto/evp/evp_pbe.c /usr/src/debug/openssl/3.6.1/crypto/evp/
 m_sigver.c /usr/src/debug/openssl/3.6.1/crypto/ex_data.c /usr/src/debug/openssl/3.6.1/crypto/o_time.c /usr/src/debug/openssl/3.6.1/include/internal/params.h /usr/src/debug/openssl/3.6.1/include/internal/quic_txpim.h /usr/src/debug/openssl/3.6.1/include/internal/quic_types.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cts.inc /usr/src/debug/openssl/3.6.1/crypto/defaults.c /usr/src/debug/openssl/3.6.1/crypto/aes/bsaes-x86_64.s /usr/src/debug/openssl/3.6.1/crypto/evp/legacy_md5.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_xcbc_d.c /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/decode_pem2der.c /usr/src/debug/openssl/3.6.1/apps/x509.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_wrap_gen.c /usr/src/debug/openssl/3.6.1/crypto/core_fetch.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_gcm_siv.c /usr/src/debug/openssl/3.6.1/include/crypto/bn.h /usr/src/debug/openssl/3.6.1/include/internal/quic_vlint.h /
 usr/src/debug/openssl/3.6.1/apps/configutl.c /usr/src/debug/openssl/3.6.1/include/internal/quic_predef.h /usr/src/debug/openssl/3.6.1/crypto/evp/dh_ctrl.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_gcm_siv.h /usr/src/debug/openssl/3.6.1/include/crypto/aria.h /usr/src/debug/openssl/3.6.1/include/crypto/asn1.h /usr/src/debug/openssl/3.6.1/include/crypto/cmac.h /usr/src/debug/openssl/3.6.1/include/crypto/rand.h /usr/src/debug/openssl/3.6.1/include/crypto/x509.h /usr/src/debug/openssl/3.6.1/include/crypto/x509_acert.h /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_ml_dsa.h /usr/src/debug/openssl/3.6.1/include/internal/qlog.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_tdes_wrap_hw.c /usr/src/debug/openssl/3.6.1/include/internal/quic_stream_map.h /usr/src/debug/openssl/3.6.1/include/crypto/bioerr.h /usr/src/debug/openssl/3.6.1/include/crypto/cmperr.h /usr/src/debug/openssl/3.6.1/include/crypto/cmserr.h /usr/src/debu
 g/openssl/3.6.1/include/crypto/dsaerr.h /usr/src/debug/openssl/3.6.1/include/internal/priority_queue.h /usr/src/debug/openssl/3.6.1/include/crypto/esserr.h /usr/src/debug/openssl/3.6.1/include/crypto/evperr.h /usr/src/debug/openssl/3.6.1/include/crypto/pemerr.h /usr/src/debug/openssl/3.6.1/include/crypto/rsaerr.h /usr/src/debug/openssl/3.6.1/include/crypto/x509v3err.h /usr/src/debug/openssl/3.6.1/crypto/provider_child.c /usr/src/debug/openssl/3.6.1/apps/list.c /usr/src/debug/openssl/3.6.1/crypto/evp/p_dec.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_null.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_camellia_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_null.c /usr/src/debug/openssl/3.6.1/include/internal/bio_addr.h /usr/src/debug/openssl/3.6.1/providers/implementations/storemgmt/file_store_any2obj.c /usr/src/debug/openssl/3.6.1/providers/implementations/rands/drbg_ctr.c /usr/src/debug/openssl/3.6.1/providers/common/include/prov/
 provider_ctx.h /usr/src/debug/openssl/3.6.1/crypto/evp/e_bf.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_dsa_key.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_rsa_key.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_tdes_hw.c /usr/src/debug/openssl/3.6.1/include/crypto/bn_srp.h /usr/src/debug/openssl/3.6.1/include/crypto/pkcs7err.h /usr/src/debug/openssl/3.6.1/crypto/sm3/sm3-x86_64.S /usr/src/debug/openssl/3.6.1/crypto/sm4/sm4-x86_64.S /usr/src/debug/openssl/3.6.1/crypto/o_str.c /usr/src/debug/openssl/3.6.1/providers/common/include/prov/providercommon.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_siv.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_siv.h /usr/src/debug/openssl/3.6.1/crypto/sleep.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_ccm_hw.c /usr/src/debug/openssl/3.6.1/include/internal/quic_thread_assist.h /usr/src/debug/openssl/3.6.1/providers/
 implementations/ciphers/cipher_sm4_gcm_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_xts_hw.c /usr/src/debug/openssl/3.6.1/crypto/params.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_gcm.h /usr/src/debug/openssl/3.6.1/crypto/evp/legacy_sha.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_digests_gen.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_gcm.c /usr/src/debug/openssl/3.6.1/include/crypto/objects.h /usr/src/debug/openssl/3.6.1/include/crypto/security_bits.h /usr/src/debug/openssl/3.6.1/crypto/evp/ctrl_params_translate.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aria.c /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/tls1_prf.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aria.h /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_hkdf.h /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_slh_dsa.
 h /usr/src/debug/openssl/3.6.1/crypto/param_build.c /usr/src/debug/openssl/3.6.1/providers/implementations/rands/test_rng.c /usr/src/debug/openssl/3.6.1/apps/ec.c /usr/src/debug/openssl/3.6.1/include/crypto/decoder.h /usr/src/debug/openssl/3.6.1/crypto/param_build_set.c /usr/src/debug/openssl/3.6.1/crypto/evp/kdf_meth.c /usr/src/debug/openssl/3.6.1/include/crypto/encoder.h /usr/src/debug/openssl/3.6.1/crypto/mem.c /usr/src/debug/openssl/3.6.1/crypto/uid.c /usr/src/debug/openssl/3.6.1/providers/implementations/rands/seed_src.c /usr/src/debug/openssl/3.6.1/include/crypto/ctype.h /usr/src/debug/openssl/3.6.1/include/crypto/store.h /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/encode_key2any.c /usr/src/debug/openssl/3.6.1/crypto/evp/p_seal.c /usr/src/debug/openssl/3.6.1/apps/kdf.c /usr/src/debug/openssl/3.6.1/crypto/o_fopen.c /usr/src/debug/openssl/3.6.1/include/crypto/slh_dsa.h /usr/src/debug/openssl/3.6.1/apps/sess_id.c /usr/src/debug/openssl/3.6.1/providers/imp
 lementations/include/prov/ml_dsa_codecs.h /usr/src/debug/openssl/3.6.1/include/crypto/rsa.h /usr/src/debug/openssl/3.6.1/include/crypto/sha.h /usr/src/debug/openssl/3.6.1/include/crypto/err.h /usr/src/debug/openssl/3.6.1/include/crypto/ess.h /usr/src/debug/openssl/3.6.1/crypto/aes/aesni-x86_64.s /usr/src/debug/openssl/3.6.1/crypto/evp/s_lib.c /usr/src/debug/openssl/3.6.1/crypto/getenv.c /usr/src/debug/openssl/3.6.1/apps/rsautl.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_slh_dsa_gen.c /usr/src/debug/openssl/3.6.1/apps/engine.c /usr/src/debug/openssl/3.6.1/apps/errstr.c /usr/src/debug/openssl/3.6.1/apps/gendsa.c /usr/src/debug/openssl/3.6.1/apps/genrsa.c /usr/src/debug/openssl/3.6.1/crypto/sm3/sm3_local.h /usr/src/debug/openssl/3.6.1/apps/s_time.c /usr/src/debug/openssl/3.6.1/apps/passwd.c /usr/src/debug/openssl/3.6.1/apps/pkcs12.c /usr/src/debug/openssl/3.6.1/apps/asn1parse.c /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/endecoder_common.c /usr/src/
 debug/openssl/3.6.1/include/crypto/chacha.h /usr/src/debug/openssl/3.6.1/include/internal/time.h /usr/src/debug/openssl/3.6.1/include/crypto/ml_dsa.h /usr/src/debug/openssl/3.6.1/include/internal/hashtable.h /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/macsignature.h /usr/src/debug/openssl/3.6.1/include/internal/quic_ackm.h /usr/src/debug/openssl/3.6.1/include/internal/quic_fifd.h /usr/src/debug/openssl/3.6.1/include/internal/quic_port.h /usr/src/debug/openssl/3.6.1/include/internal/quic_srtm.h /usr/src/debug/openssl/3.6.1/include/internal/quic_wire.h /usr/src/debug/openssl/3.6.1/providers/common/der/der_ecx_key.c /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/decode_spki2typespki.c /usr/src/debug/openssl/3.6.1/include/crypto/asn1err.h /usr/src/debug/openssl/3.6.1/include/crypto/comperr.h /usr/src/debug/openssl/3.6.1/include/crypto/conferr.h /usr/src/debug/openssl/3.6.1/include/crypto/crmferr.h /usr/src/debug/openssl/3.6.1/include/crypto/
 httperr.h /usr/src/debug/openssl/3.6.1/include/crypto/ocsperr.h /usr/src/debug/openssl/3.6.1/include/crypto/randerr.h /usr/src/debug/openssl/3.6.1/apps/crl.c /usr/src/debug/openssl/3.6.1/include/crypto/x509err.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aria_gcm.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aria_gcm.h /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/ml_dsa_codecs.c /usr/src/debug/openssl/3.6.1/include/internal/quic_record_rx.h /usr/src/debug/openssl/3.6.1/include/internal/skey.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_camellia.c /usr/src/debug/openssl/3.6.1/include/internal/quic_cfq.h /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/decoders.h /usr/src/debug/openssl/3.6.1/crypto/evp/e_rc4_hmac_md5.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_camellia.h /usr/src/debug/openssl/3.6.1/crypto/aes/aes_core.c /usr/src/debug/o
 penssl/3.6.1/crypto/aes/aes_misc.c /usr/src/debug/openssl/3.6.1/crypto/aes/aes_wrap.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_ccm_hw_aesni.inc /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha1_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_gcm_hw_aesni.inc /usr/src/debug/openssl/3.6.1/crypto/evp/e_aes.c /usr/src/debug/openssl/3.6.1/apps/version.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_cts.h /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/pkcs12kdf.c /usr/src/debug/openssl/3.6.1/apps/enc.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes.h /usr/src/debug/openssl/3.6.1/crypto/aes/aes-x86_64.s /usr/src/debug/openssl/3.6.1/apps/openssl.c /usr/src/debug/openssl/3.6.1/apps/pkeyutl.c /usr/src/debug/openssl/3.6.1/apps/skeyutl.c /usr
 /src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_cts.c /usr/src/debug/openssl/3.6.1/include/internal/thread.h /usr/src/debug/openssl/3.6.1/crypto/aes/aesni-sha1-x86_64.s /usr/src/debug/openssl/3.6.1/include/internal/constant_time.h /usr/src/debug/openssl/3.6.1/providers/implementations/skeymgmt/generic.c /usr/src/debug/openssl/3.6.1/crypto/sm4/sm4.c /usr/src/debug/openssl/3.6.1/apps/ts.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/blake2_params.inc /usr/src/debug/openssl/3.6.1/include/crypto/evp.h /usr/src/debug/openssl/3.6.1/include/crypto/pem.h /usr/src/debug/openssl/3.6.1/include/crypto/dsa.h /usr/src/debug/openssl/3.6.1/include/crypto/ecx.h /usr/src/debug/openssl/3.6.1/include/crypto/siv.h /usr/src/debug/openssl/3.6.1/include/crypto/sm2.h /usr/src/debug/openssl/3.6.1/include/crypto/sm4.h /usr/src/debug/openssl/3.6.1/include/internal/conf.h /usr/src/debug/openssl/3
 .6.1/crypto/evp/evp_pkey_type.c /usr/src/debug/openssl/3.6.1/crypto/evp/p5_crpt.c /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/decode_msblob2key.c /usr/src/debug/openssl/3.6.1/crypto/evp/pmeth_lib.c /usr/src/debug/openssl/3.6.1/crypto/evp/asymcipher.c /usr/src/debug/openssl/3.6.1/crypto/aes/aesni-sha256-x86_64.s /usr/src/debug/openssl/3.6.1/apps/s_client.c /usr/src/debug/openssl/3.6.1/include/internal/json_enc.h /usr/src/debug/openssl/3.6.1/include/crypto/buffererr.h /usr/src/debug/openssl/3.6.1/include/internal/o_dir.h /usr/src/debug/openssl/3.6.1/crypto/provider_predefined.c /usr/src/debug/openssl/3.6.1/include/crypto/rand_pool.h /usr/src/debug/openssl/3.6.1/crypto/cms/cms_kari.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_pwri.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_asn1.c /usr/src/debug/openssl/3.6.1/crypto/evp/ec_support.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_chacha20_hw.c /usr/src/debug/openssl/3.6.1/apps/dgst.c /u
 sr/src/debug/openssl/3.6.1/providers/implementations/storemgmt/file_store.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/ciphercommon_gcm.h /usr/src/debug/openssl/3.6.1/include/internal/core.h /usr/src/debug/openssl/3.6.1/include/crypto/bnerr.h /usr/src/debug/openssl/3.6.1/include/crypto/cterr.h /usr/src/debug/openssl/3.6.1/include/crypto/dherr.h /usr/src/debug/openssl/3.6.1/include/crypto/ecerr.h /usr/src/debug/openssl/3.6.1/crypto/cms/cms_ec.c /usr/src/debug/openssl/3.6.1/include/crypto/tserr.h /usr/src/debug/openssl/3.6.1/include/crypto/uierr.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_wrp.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_aes_cbc_hmac_sha256.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_dsa_gen.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_rsa_gen.c /usr/src/debug/openssl/3.6.1/crypto/bsearch.c /usr/src/debug/openssl/3.6.1/include/crypto/siphash.h /usr/src/debug/openssl/3.6.1/include/crypto/ml_k
 em.h /usr/src/debug/openssl/3.6.1/crypto/evp/dh_support.c /usr/src/debug/openssl/3.6.1/include/internal/asn1.h /usr/src/debug/openssl/3.6.1/include/internal/ssl.h /usr/src/debug/openssl/3.6.1/crypto/params_from_text.c /usr/src/debug/openssl/3.6.1/crypto/provider_core.c /usr/src/debug/openssl/3.6.1/include/internal/quic_tls.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha_etm.c /usr/src/debug/openssl/3.6.1/include/internal/quic_cc.h /usr/src/debug/openssl/3.6.1/crypto/provider_local.h /usr/src/debug/openssl/3.6.1/crypto/aes/aesni-xts-avx512.s /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/skeymgmt_lcl.h /usr/src/debug/openssl/3.6.1/crypto/evp/legacy_md4.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha_etm.h /usr/src/debug/openssl/3.6.1/include/internal/quic_ssl.h /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_ecx.h /usr/src/debug/openssl/3.6.1/providers/implementations
 /ciphers/ciphercommon_ccm.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/ciphercommon_gcm.c /usr/src/debug/openssl/3.6.1/providers/implementations/kem/kem_util.c /usr/src/debug/openssl/3.6.1/crypto/mem_sec.c /usr/src/debug/openssl/3.6.1/crypto/comp_methods.c /usr/src/debug/openssl/3.6.1/include/crypto/md32_common.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aria_hw.c /usr/src/debug/openssl/3.6.1/crypto/evp/digest.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha256_hw.c /usr/src/debug/openssl/3.6.1/include/internal/to_hex.h /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/endecoder_local.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha1_etm_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/kdfexchange.h /usr/src/debug/openssl/3.6.1/providers/common/der/der_ecx_gen.c /usr/src/debug/openssl/3.6.1/providers/common/include/
 prov/securitycheck.h /usr/src/debug/openssl/3.6.1/crypto/evp/mac_lib.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_seed.c /usr/src/debug/openssl/3.6.1/crypto/info.c /usr/src/debug/openssl/3.6.1/crypto/init.c /usr/src/debug/openssl/3.6.1/crypto/time.c /usr/src/debug/openssl/3.6.1/crypto/sparse_array.c /usr/src/debug/openssl/3.6.1/include/internal/quic_wire_pkt.h /usr/src/debug/openssl/3.6.1/crypto/quic_vlint.c /usr/src/debug/openssl/3.6.1/crypto/core_algorithm.c /usr/src/debug/openssl/3.6.1/crypto/aes/vpaes-x86_64.s /usr/src/debug/openssl/3.6.1/crypto/cpt_err.c /usr/src/debug/openssl/3.6.1/crypto/ssl_err.c /usr/src/debug/openssl/3.6.1/apps/cmp.c /usr/src/debug/openssl/3.6.1/include/crypto/asyncerr.h /usr/src/debug/openssl/3.6.1/include/internal/der.h /usr/src/debug/openssl/3.6.1/crypto/evp/legacy_md5_sha1.c /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/encode_key2text.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/ciphercommon_hw.c /usr/src/debu
 g/openssl/3.6.1/apps/progs.h /usr/src/debug/openssl/3.6.1/crypto/evp/bio_ok.c /usr/src/debug/openssl/3.6.1/apps/pkcs8.c /usr/src/debug/openssl/3.6.1/apps/prime.c /usr/src/debug/openssl/3.6.1/apps/progs.c /usr/src/debug/openssl/3.6.1/apps/smime.c /usr/src/debug/openssl/3.6.1/apps/speed.c /usr/src/debug/openssl/3.6.1/apps/spkac.c /usr/src/debug/openssl/3.6.1/apps/pkcs7.c /usr/src/debug/openssl/3.6.1/include/internal/quic_record_tx.h /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/decode_der2key.c /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/decode_pvk2key.c /usr/src/debug/openssl/3.6.1/crypto/sslerr.h /usr/src/debug/openssl/3.6.1/providers/common/der/der_slh_dsa_key.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aria_ccm.c /usr/src/debug/openssl/3.6.1/include/crypto/objectserr.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aria_ccm.h /usr/src/debug/openssl/3.6.1/providers/implementations/inc
 lude/prov/ml_dsa.h /usr/src/debug/openssl/3.6.1/crypto/evp/cmeth_lib.c /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/decode_epki2pki.c /usr/src/debug/openssl/3.6.1/crypto/aes/aesni-mb-x86_64.s /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_ccm_hw_x86_64.inc /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/ciphercommon_ccm_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/ciphercommon_gcm_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_gcm_hw_x86_64.inc /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_xts_hw_x86_64.inc /usr/src/debug/openssl/3.6.1/crypto/cms/cms_att.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_enc.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_env.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_err.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_ess.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_kem.c /usr/src/debug/openssl/3.6.1/crypto
 /cms/cms_lib.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_rsa.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_camellia.c /usr/src/debug/openssl/3.6.1/include/internal/uint_set.h /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/scrypt.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_xts.h /usr/src/debug/openssl/3.6.1/crypto/cms/cms_local.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_xts.c /usr/src/debug/openssl/3.6.1/include/crypto/bn_dh.h /usr/src/debug/openssl/3.6.1/include/crypto/lhash.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_gcm.h /usr/src/debug/openssl/3.6.1/include/internal/sm3.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_gcm.c /usr/src/debug/openssl/3.6.1/crypto/evp/p_legacy.c /usr/src/debug/openssl/3.6.1/crypto/evp/p_verify.c /usr/src/debug/openssl/3.6.1/crypto/o_init.c /usr/src/debug/openssl/3.6.1/providers/implementations/rands/drbg.c /usr/src/d
 ebug/openssl/3.6.1/include/internal/quic_sf_list.h /usr/src/debug/openssl/3.6.1/include/internal/quic_engine.h /usr/src/debug/openssl/3.6.1/include/crypto/poly1305.h /usr/src/debug/openssl/3.6.1/crypto/evp/names.c /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/argon2.c /usr/src/debug/openssl/3.6.1/include/internal/rio_notifier.h /usr/src/debug/openssl/3.6.1/crypto/evp/e_des3.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha.c /usr/src/debug/openssl/3.6.1/include/internal/hpke_util.h /usr/src/debug/openssl/3.6.1/include/internal/quic_stream.h /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_wrap.h /usr/src/debug/openssl/3.6.1/providers/implementations/rands/drbg_hash.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_cbc_hmac_sha.h /usr/src/debug/openssl/3.6.1/providers/implementations/rands/seed_src_jitter.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_sd.c /usr/src/debug/openssl/3.6.1/provider
 s/implementations/ciphers/cipher_sm4.h /usr/src/debug/openssl/3.6.1/include/internal/comp.h /usr/src/debug/openssl/3.6.1/apps/crl2pkcs7.c /usr/src/debug/openssl/3.6.1/include/internal/common.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4.c /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/kbkdf.c /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/sskdf.c /usr/src/debug/openssl/3.6.1/providers/implementations/kem/ml_kem_kem.c /usr/src/debug/openssl/3.6.1/crypto/array_alloc.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/ecx.h /usr/src/debug/openssl/3.6.1/crypto/evp/p_lib.c /usr/src/debug/openssl/3.6.1/crypto/evp/c_allc.c /usr/src/debug/openssl/3.6.1/include/internal/crmf.h /usr/src/debug/openssl/3.6.1/crypto/punycode.c /usr/src/debug/openssl/3.6.1/include/internal/encoder.h /usr/src/debug/openssl/3.6.1/apps/s_server.c /usr/src/debug/openssl/3.6.1/include/crypto/cryptoerr.h /usr/src/debug/openssl/3.6.1/apps/rsa.c /u
 sr/src/debug/openssl/3.6.1/apps/ocsp.c /usr/src/debug/openssl/3.6.1/crypto/aes/aes-cfb-avx512.s /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/eckem.h /usr/src/debug/openssl/3.6.1/crypto/evp/p_sign.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_camellia_cts.inc /usr/src/debug/openssl/3.6.1/crypto/evp/evp_fetch.c /usr/src/debug/openssl/3.6.1/crypto/evp/pmeth_check.c /usr/src/debug/openssl/3.6.1/include/internal/deterministic_nonce.h /usr/src/debug/openssl/3.6.1/providers/common/der/der_dsa_sig.c /usr/src/debug/openssl/3.6.1/crypto/params_dup.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_rsa_sig.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_tdes_default_hw.c /usr/src/debug/openssl/3.6.1/crypto/evp/evp_local.h /usr/src/debug/openssl/3.6.1/crypto/evp/skeymgmt_meth.c /usr/src/debug/openssl/3.6.1/include/internal/packet_quic.h /usr/src/debug/openssl/3.6.1/providers/common/der/der_ec_gen.c /usr/src/debug/open
 ssl/3.6.1/apps/dsa.c /usr/src/debug/openssl/3.6.1/crypto/der_writer.c /usr/src/debug/openssl/3.6.1/include/crypto/context.h /usr/src/debug/openssl/3.6.1/include/crypto/pkcs7.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/ciphercommon_local.h /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/implementations.h /usr/src/debug/openssl/3.6.1/crypto/cms/cms_dh.c /usr/src/debug/openssl/3.6.1/include/internal/quic_rx_depack.h /usr/src/debug/openssl/3.6.1/include/internal/dsoerr.h /usr/src/debug/openssl/3.6.1/providers/common/include/prov/provider_util.h /usr/src/debug/openssl/3.6.1/include/internal/dane.h /usr/src/debug/openssl/3.6.1/crypto/evp/e_aes_cbc_hmac_sha1.c /usr/src/debug/openssl/3.6.1/crypto/passphrase.c /usr/src/debug/openssl/3.6.1/include/internal/quic_txp.h /usr/src/debug/openssl/3.6.1/include/crypto/cryptlib.h /usr/src/debug/openssl/3.6.1/providers/implementations/kem/ec_kem.c /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/hkdf.
 c /usr/src/debug/openssl/3.6.1/crypto/evp/e_chacha20_poly1305.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_aria.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/ml_kem.h /usr/src/debug/openssl/3.6.1/crypto/evp/e_rc2.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_gcm_siv_polyval.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/md5_sha1.h /usr/src/debug/openssl/3.6.1/crypto/x86_64cpuid.s /usr/src/debug/openssl/3.6.1/crypto/cryptlib.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_rc4.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_tdes_wrap.c /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/ciphercommon.h /usr/src/debug/openssl/3.6.1/crypto/cms/cms_dd.c /usr/src/debug/openssl/3.6.1/providers/common/include/prov/proverr.h /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/krb5kdf.c /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/x942kdf.c /usr/src/debug/opens
 sl/3.6.1/crypto/aes/aes_local.h /usr/src/debug/openssl/3.6.1/include/crypto/sparse_array.h /usr/src/debug/openssl/3.6.1/crypto/threads_lib.c /usr/src/debug/openssl/3.6.1/crypto/evp/keymgmt_meth.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_ec_key.c /usr/src/debug/openssl/3.6.1/providers/implementations/rands/drbg_hmac.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aria_ccm_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aria_gcm_hw.c /usr/src/debug/openssl/3.6.1/apps/genpkey.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_cast.c /usr/src/debug/openssl/3.6.1/crypto/cms/cms_io.c /usr/src/debug/openssl/3.6.1/include/internal/propertyerr.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_ccm.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_ccm.h /usr/src/debug/openssl/3.6.1/crypto/evp/exchange.c /usr/src/debug/openssl/3.6.1/crypto/evp/legacy_blake2.c /usr/src/debug/openssl/3.6.1
 /crypto/trace.c /usr/src/debug/openssl/3.6.1/crypto/ctype.c /usr/src/debug/openssl/3.6.1/include/internal/unicode.h /usr/src/debug/openssl/3.6.1/providers/implementations/include/prov/mlx_kem.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_aes_hw.c /usr/src/debug/openssl/3.6.1/apps/testdsa.h /usr/src/debug/openssl/3.6.1/apps/testrsa.h /usr/src/debug/openssl/3.6.1/crypto/evp/legacy_ripemd.c /usr/src/debug/openssl/3.6.1/include/internal/sha3.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_tdes_default.h /usr/src/debug/openssl/3.6.1/apps/ciphers.c /usr/src/debug/openssl/3.6.1/crypto/context.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_tdes_default.c /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_dsa.h /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_rsa.h /usr/src/debug/openssl/3.6.1/apps/nseq.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_hkdf_gen.c /usr/src/debug/openssl/
 3.6.1/providers/common/der/der_sm2_sig.c /usr/src/debug/openssl/3.6.1/include/internal/quic_fc.h /usr/src/debug/openssl/3.6.1/include/internal/cms.h /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/encode_key2ms.c /usr/src/debug/openssl/3.6.1/apps/fipsinstall.c /usr/src/debug/openssl/3.6.1/providers/implementations/encode_decode/ml_common_codecs.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_ml_dsa_gen.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_ml_dsa_key.c /usr/src/debug/openssl/3.6.1/providers/implementations/skeymgmt/aes_skmgmt.c /usr/src/debug/openssl/3.6.1/crypto/sm3/sm3.c /usr/src/debug/openssl/3.6.1/apps/pkeyparam.c /usr/src/debug/openssl/3.6.1/crypto/indicator_core.c /usr/src/debug/openssl/3.6.1/crypto/evp/e_sm4.c /usr/src/debug/openssl/3.6.1/include/internal/quic_channel.h /usr/src/debug/openssl/3.6.1/crypto/evp/legacy_mdc2.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_sm2_key.c /usr/src/debug/openssl/3.6.1/crypto/evp/bio_
 b64.c /usr/src/debug/openssl/3.6.1/crypto/evp/bio_enc.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_sm4_hw.c /usr/src/debug/openssl/3.6.1/crypto/evp/p_enc.c /usr/src/debug/openssl/3.6.1/include/internal/quic_tserver.h /usr/src/debug/openssl/3.6.1/crypto/evp/p5_crpt2.c /usr/src/debug/openssl/3.6.1/crypto/evp/pmeth_gn.c /usr/src/debug/openssl/3.6.1/apps/mac.c /usr/src/debug/openssl/3.6.1/include/crypto/asn1_dsa.h /usr/src/debug/openssl/3.6.1/crypto/evp/pbe_scrypt.c /usr/src/debug/openssl/3.6.1/include/internal/mem_alloc_utils.h /usr/src/debug/openssl/3.6.1/crypto/packet.c /usr/src/debug/openssl/3.6.1/providers/common/der/der_ec_sig.c /usr/src/debug/openssl/3.6.1/crypto/deterministic_nonce.c /usr/src/debug/openssl/3.6.1/crypto/evp/mac_meth.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_chacha20_poly1305.h /usr/src/debug/openssl/3.6.1/crypto/threads_common.c /usr/src/debug/openssl/3.6.1/include/internal/ssl3_cbc.h /usr/src/debug/openssl
 /3.6.1/providers/implementations/ciphers/cipher_aes_gcm_siv_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_chacha20_poly1305.c /usr/src/debug/openssl/3.6.1/crypto/sm3/legacy_sm3.c /usr/src/debug/openssl/3.6.1/apps/storeutl.c /usr/src/debug/openssl/3.6.1/apps/dhparam.c /usr/src/debug/openssl/3.6.1/apps/ecparam.c /usr/src/debug/openssl/3.6.1/apps/rand.c /usr/src/debug/openssl/3.6.1/include/crypto/storeerr.h /usr/src/debug/openssl/3.6.1/include/internal/ring_buf.h /usr/src/debug/openssl/3.6.1/include/internal/sslconf.h /usr/src/debug/openssl/3.6.1/providers/common/der/der_sm2_gen.c /usr/src/debug/openssl/3.6.1/providers/common/include/prov/der_ec.h /usr/src/debug/openssl/3.6.1/providers/implementations/ciphers/cipher_chacha20_poly1305_hw.c /usr/src/debug/openssl/3.6.1/providers/implementations/kdfs/hmacdrbg_kdf.c /usr/src/debug/openssl/3.6.1/apps/pkey.c /usr/src/debug/openssl/3.6.1/apps/rehash.c /usr/src/debug/openssl/3.6.1/apps/verify.c /usr/src/debug/opens
 sl/3.6.1/include/internal/threads_common.h /usr/src/debug/openssl/3.6.1/include/internal/quic_srt_gen.h"
packages/x86-64-v3-poky-linux/openssl/openssl-staticdev: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl-staticdev: PKGSIZE changed from 37646632 to 38247890 (+2%)
packages/x86-64-v3-poky-linux/openssl/openssl-staticdev: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/openssl/openssl: PKGV changed from 3.5.5 [default] to 3.6.1 [default]
packages/x86-64-v3-poky-linux/openssl/openssl: PV changed from "3.5.5" to "3.6.1"
packages/x86-64-v3-poky-linux/python3/python3-dbg: PKGSIZE changed from 43334016 to 43334000 (-0%)
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.3-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.3/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.3-gdb.py was removed

--===============7632210201479704429==--

