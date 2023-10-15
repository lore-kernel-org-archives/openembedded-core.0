Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C858FC04FE9
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:24 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.102659.1697399113489820306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KMnW1Utp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=c3AHA+Lv;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.45, mailfrom: 0101018b34df036a-88c926fa-705f-4818-968c-2a75c0472c9d-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wwu7qLOl4BzHSFUy+HP7Lzlw6nQaVFUsOjTh28njbmY=;
	b=KMnW1UtpYnZ+7A8axtf6ItkcFc4BgwktG8d4hxY5Vg5i6bIyVhio/jvamwtSNcZ0
	Ea5ntbGDKoCaz7QkixY5h0F3gVPHpocLmiXlppy8b3ncf3KVmggIE66lUKf0roGWi4w
	2hABBG+x27XeH/0xw1ziC3WBDGcR+otdGHZFG5n8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wwu7qLOl4BzHSFUy+HP7Lzlw6nQaVFUsOjTh28njbmY=;
	b=c3AHA+LvlpUzochrf/TkuqSf/QkQS9NxEtK1U8uCdEiL0IeCOko/Z/V49ggM91sX
	vuClSX5QSd04509oiD0yW3NjyxLElo1CYRWZ8tg7vVrdg70Q69h8yBgCfZBQMzxys1J
	HzCOHI8Zb55cQHcCvyun4LLQYVNQSkvGyCzlrpUI=
Content-Type: multipart/mixed; boundary="===============3611374178576175168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.78.0 SUCCEEDED
Message-ID: <0101018b34df036a-88c926fa-705f-4818-968c-2a75c0472c9d-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189165

--===============3611374178576175168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-networking* to *2.78.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-networking-upgrade-2.76.1-2.78.0.patch
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
From 46908670ebdbc00b89c4a3c651dd011341b9ec1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 08:17:48 +0000
Subject: [PATCH] glib-networking: upgrade 2.76.1 -> 2.78.0

---
 ...sable-PKCS-11-tests-if-not-available.patch | 113 ------------------
 ...ng_2.76.1.bb => glib-networking_2.78.0.bb} |   6 +-
 2 files changed, 1 insertion(+), 118 deletions(-)
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch
 rename meta/recipes-core/glib-networking/{glib-networking_2.76.1.bb => glib-networking_2.78.0.bb} (89%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch b/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch
deleted file mode 100644
index 7b003588c8..0000000000
--- a/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 04728a5b73e870b4695c5e7ba42fa41c00471944 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 12 May 2023 20:19:35 +0100
-Subject: [PATCH] tls/tests: disable PKCS#11 tests if not available
-
-GnuTLS can be built without PKCS#11, which means the symbols
-gnutls_pkcs11_init and gnutls_pkcs11_add_provider are not part of the
-library.
-
-If these symbols don't exist in GnuTLS then we can't add a mock pkcs#11
-provider for testing, and several tests which need the mock provider
-will fail.
-
-Solve this by checking for the symbols at build time and disabling the
-provider and tests which need it.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- meson.build             |  4 ++++
- tls/tests/certificate.c | 11 +++++++----
- tls/tests/connection.c  |  4 +++-
- 3 files changed, 14 insertions(+), 5 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 0fa9027..d2a023a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -84,6 +84,10 @@ gnutls_dep = dependency('gnutls', version: '>= 3.7.4', required: get_option('gnu
- 
- if gnutls_dep.found()
-   backends += ['gnutls']
-+  # test-specific, maybe move to tls/tests
-+  if cc.has_function('gnutls_pkcs11_init', prefix: '#include <gnutls/pkcs11.h>', dependencies: gnutls_dep)
-+    config_h.set10('HAVE_GNUTLS_PKCS11', true)
-+  endif
- endif
- 
- # *** Checks for OpenSSL    ***
-diff --git a/tls/tests/certificate.c b/tls/tests/certificate.c
-index e820ba1..dd2412b 100644
---- a/tls/tests/certificate.c
-+++ b/tls/tests/certificate.c
-@@ -24,6 +24,7 @@
-  * Author: Stef Walter <stefw@collabora.co.uk>
-  */
- 
-+#include "config.h"
- #include "certificate.h"
- 
- #include <gio/gio.h>
-@@ -911,7 +912,7 @@ int
- main (int   argc,
-       char *argv[])
- {
--#ifdef BACKEND_IS_GNUTLS
-+#if defined(BACKEND_IS_GNUTLS) && HAVE_GNUTLS_PKCS11
-   char *module_path;
- #endif
- 
-@@ -921,7 +922,7 @@ main (int   argc,
-   g_setenv ("GIO_USE_TLS", BACKEND, TRUE);
-   g_assert_cmpint (g_ascii_strcasecmp (G_OBJECT_TYPE_NAME (g_tls_backend_get_default ()), "GTlsBackend" BACKEND), ==, 0);
- 
--#ifdef BACKEND_IS_GNUTLS
-+#if defined(BACKEND_IS_GNUTLS) && HAVE_GNUTLS_PKCS11
-   module_path = g_test_build_filename (G_TEST_BUILT, "mock-pkcs11.so", NULL);
-   g_assert_true (g_file_test (module_path, G_FILE_TEST_EXISTS));
- 
-@@ -942,12 +943,14 @@ main (int   argc,
-               setup_certificate, test_create_certificate_with_issuer, teardown_certificate);
-   g_test_add ("/tls/" BACKEND "/certificate/create-with-garbage-input", TestCertificate, NULL,
-               setup_certificate, test_create_certificate_with_garbage_input, teardown_certificate);
--  g_test_add ("/tls/" BACKEND "/certificate/pkcs11", TestCertificate, NULL,
--              setup_certificate, test_create_certificate_pkcs11, teardown_certificate);
-   g_test_add ("/tls/" BACKEND "/certificate/private-key", TestCertificate, NULL,
-               setup_certificate, test_private_key, teardown_certificate);
-+#if HAVE_GNUTLS_PKCS11
-+  g_test_add ("/tls/" BACKEND "/certificate/pkcs11", TestCertificate, NULL,
-+              setup_certificate, test_create_certificate_pkcs11, teardown_certificate);
-   g_test_add ("/tls/" BACKEND "/certificate/private-key-pkcs11", TestCertificate, NULL,
-               setup_certificate, test_private_key_pkcs11, teardown_certificate);
-+#endif
- 
-   g_test_add_func ("/tls/" BACKEND "/certificate/create-chain", test_create_certificate_chain);
-   g_test_add_func ("/tls/" BACKEND "/certificate/create-no-chain", test_create_certificate_no_chain);
-diff --git a/tls/tests/connection.c b/tls/tests/connection.c
-index 17efe1b..62a7fbb 100644
---- a/tls/tests/connection.c
-+++ b/tls/tests/connection.c
-@@ -3376,7 +3376,7 @@ main (int   argc,
- 
-   g_assert_true (g_ascii_strcasecmp (G_OBJECT_TYPE_NAME (g_tls_backend_get_default ()), "GTlsBackend" BACKEND) == 0);
- 
--#ifdef BACKEND_IS_GNUTLS
-+#if defined(BACKEND_IS_GNUTLS) && HAVE_GNUTLS_PKCS11
-   module_path = g_test_build_filename (G_TEST_BUILT, "mock-pkcs11.so", NULL);
-   g_assert_true (g_file_test (module_path, G_FILE_TEST_EXISTS));
- 
-@@ -3438,8 +3438,10 @@ main (int   argc,
-               setup_connection, test_client_auth_request_fail, teardown_connection);
-   g_test_add ("/tls/" BACKEND "/connection/client-auth-request-none", TestConnection, NULL,
-               setup_connection, test_client_auth_request_none, teardown_connection);
-+#if HAVE_GNUTLS_PKCS11
-   g_test_add ("/tls/" BACKEND "/connection/client-auth-pkcs11", TestConnection, NULL,
-               setup_connection, test_client_auth_pkcs11_connection, teardown_connection);
-+#endif
-   g_test_add ("/tls/" BACKEND "/connection/no-database", TestConnection, NULL,
-               setup_connection, test_connection_no_database, teardown_connection);
-   g_test_add ("/tls/" BACKEND "/connection/failed", TestConnection, NULL,
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
similarity index 89%
rename from meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
index 3687123141..106972d5d4 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "5c698a9994dde51efdfb1026a56698a221d6250e89dc50ebcddda7b81480a42b"
+SRC_URI[archive.sha256sum] = "52fe4ce93f7dc51334b102894599858d23c8a65ac4a1110b30920565d68d3aba"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
@@ -30,10 +30,6 @@ PACKAGECONFIG[gnomeproxy] = "-Dgnome_proxy=enabled,-Dgnome_proxy=disabled,gsetti
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
-SRC_URI += "file://run-ptest"
-SRC_URI += "file://eagain.patch"
-SRC_URI += "file://0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch"
-
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
                 ${datadir}/dbus-1/services/ \
-- 
2.39.2


--===============3611374178576175168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.76.1-2.78.0.patch"

RnJvbSA0NjkwODY3MGViZGJjMDBiODljNGEzYzY1MWRkMDExMzQxYjllYzFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMDg6MTc6NDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bGliLW5ldHdvcmtpbmc6IHVwZ3JhZGUgMi43Ni4xIC0+IDIuNzguMAoKLS0tCiAuLi5zYWJsZS1Q
S0NTLTExLXRlc3RzLWlmLW5vdC1hdmFpbGFibGUucGF0Y2ggfCAxMTMgLS0tLS0tLS0tLS0tLS0t
LS0tCiAuLi5uZ18yLjc2LjEuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIuNzguMC5iYn0gfCAgIDYg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDExOCBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1u
ZXR3b3JraW5nLzAwMDEtdGxzLXRlc3RzLWRpc2FibGUtUEtDUy0xMS10ZXN0cy1pZi1ub3QtYXZh
aWxhYmxlLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL3tn
bGliLW5ldHdvcmtpbmdfMi43Ni4xLmJiID0+IGdsaWItbmV0d29ya2luZ18yLjc4LjAuYmJ9ICg4
OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWIt
bmV0d29ya2luZy8wMDAxLXRscy10ZXN0cy1kaXNhYmxlLVBLQ1MtMTEtdGVzdHMtaWYtbm90LWF2
YWlsYWJsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5l
dHdvcmtpbmcvMDAwMS10bHMtdGVzdHMtZGlzYWJsZS1QS0NTLTExLXRlc3RzLWlmLW5vdC1hdmFp
bGFibGUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDdiMDAzNTg4YzguLjAw
MDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0
d29ya2luZy8wMDAxLXRscy10ZXN0cy1kaXNhYmxlLVBLQ1MtMTEtdGVzdHMtaWYtbm90LWF2YWls
YWJsZS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDExMyArMCwwIEBACi1Gcm9tIDA0NzI4YTVi
NzNlODcwYjQ2OTVjNWU3YmE0MmZhNDFjMDA0NzE5NDQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Ci1Gcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KLURhdGU6IEZyaSwgMTIg
TWF5IDIwMjMgMjA6MTk6MzUgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gdGxzL3Rlc3RzOiBkaXNh
YmxlIFBLQ1MjMTEgdGVzdHMgaWYgbm90IGF2YWlsYWJsZQotCi1HbnVUTFMgY2FuIGJlIGJ1aWx0
IHdpdGhvdXQgUEtDUyMxMSwgd2hpY2ggbWVhbnMgdGhlIHN5bWJvbHMKLWdudXRsc19wa2NzMTFf
aW5pdCBhbmQgZ251dGxzX3BrY3MxMV9hZGRfcHJvdmlkZXIgYXJlIG5vdCBwYXJ0IG9mIHRoZQot
bGlicmFyeS4KLQotSWYgdGhlc2Ugc3ltYm9scyBkb24ndCBleGlzdCBpbiBHbnVUTFMgdGhlbiB3
ZSBjYW4ndCBhZGQgYSBtb2NrIHBrY3MjMTEKLXByb3ZpZGVyIGZvciB0ZXN0aW5nLCBhbmQgc2V2
ZXJhbCB0ZXN0cyB3aGljaCBuZWVkIHRoZSBtb2NrIHByb3ZpZGVyCi13aWxsIGZhaWwuCi0KLVNv
bHZlIHRoaXMgYnkgY2hlY2tpbmcgZm9yIHRoZSBzeW1ib2xzIGF0IGJ1aWxkIHRpbWUgYW5kIGRp
c2FibGluZyB0aGUKLXByb3ZpZGVyIGFuZCB0ZXN0cyB3aGljaCBuZWVkIGl0LgotCi1VcHN0cmVh
bS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0
b25AYXJtLmNvbT4KLS0tLQotIG1lc29uLmJ1aWxkICAgICAgICAgICAgIHwgIDQgKysrKwotIHRs
cy90ZXN0cy9jZXJ0aWZpY2F0ZS5jIHwgMTEgKysrKysrKy0tLS0KLSB0bHMvdGVzdHMvY29ubmVj
dGlvbi5jICB8ICA0ICsrKy0KLSAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1p
bmRleCAwZmE5MDI3Li5kMmEwMjNhIDEwMDY0NAotLS0tIGEvbWVzb24uYnVpbGQKLSsrKyBiL21l
c29uLmJ1aWxkCi1AQCAtODQsNiArODQsMTAgQEAgZ251dGxzX2RlcCA9IGRlcGVuZGVuY3koJ2du
dXRscycsIHZlcnNpb246ICc+PSAzLjcuNCcsIHJlcXVpcmVkOiBnZXRfb3B0aW9uKCdnbnUKLSAK
LSBpZiBnbnV0bHNfZGVwLmZvdW5kKCkKLSAgIGJhY2tlbmRzICs9IFsnZ251dGxzJ10KLSsgICMg
dGVzdC1zcGVjaWZpYywgbWF5YmUgbW92ZSB0byB0bHMvdGVzdHMKLSsgIGlmIGNjLmhhc19mdW5j
dGlvbignZ251dGxzX3BrY3MxMV9pbml0JywgcHJlZml4OiAnI2luY2x1ZGUgPGdudXRscy9wa2Nz
MTEuaD4nLCBkZXBlbmRlbmNpZXM6IGdudXRsc19kZXApCi0rICAgIGNvbmZpZ19oLnNldDEwKCdI
QVZFX0dOVVRMU19QS0NTMTEnLCB0cnVlKQotKyAgZW5kaWYKLSBlbmRpZgotIAotICMgKioqIENo
ZWNrcyBmb3IgT3BlblNTTCAgICAqKioKLWRpZmYgLS1naXQgYS90bHMvdGVzdHMvY2VydGlmaWNh
dGUuYyBiL3Rscy90ZXN0cy9jZXJ0aWZpY2F0ZS5jCi1pbmRleCBlODIwYmExLi5kZDI0MTJiIDEw
MDY0NAotLS0tIGEvdGxzL3Rlc3RzL2NlcnRpZmljYXRlLmMKLSsrKyBiL3Rscy90ZXN0cy9jZXJ0
aWZpY2F0ZS5jCi1AQCAtMjQsNiArMjQsNyBAQAotICAqIEF1dGhvcjogU3RlZiBXYWx0ZXIgPHN0
ZWZ3QGNvbGxhYm9yYS5jby51az4KLSAgKi8KLSAKLSsjaW5jbHVkZSAiY29uZmlnLmgiCi0gI2lu
Y2x1ZGUgImNlcnRpZmljYXRlLmgiCi0gCi0gI2luY2x1ZGUgPGdpby9naW8uaD4KLUBAIC05MTEs
NyArOTEyLDcgQEAgaW50Ci0gbWFpbiAoaW50ICAgYXJnYywKLSAgICAgICBjaGFyICphcmd2W10p
Ci0gewotLSNpZmRlZiBCQUNLRU5EX0lTX0dOVVRMUwotKyNpZiBkZWZpbmVkKEJBQ0tFTkRfSVNf
R05VVExTKSAmJiBIQVZFX0dOVVRMU19QS0NTMTEKLSAgIGNoYXIgKm1vZHVsZV9wYXRoOwotICNl
bmRpZgotIAotQEAgLTkyMSw3ICs5MjIsNyBAQCBtYWluIChpbnQgICBhcmdjLAotICAgZ19zZXRl
bnYgKCJHSU9fVVNFX1RMUyIsIEJBQ0tFTkQsIFRSVUUpOwotICAgZ19hc3NlcnRfY21waW50IChn
X2FzY2lpX3N0cmNhc2VjbXAgKEdfT0JKRUNUX1RZUEVfTkFNRSAoZ190bHNfYmFja2VuZF9nZXRf
ZGVmYXVsdCAoKSksICJHVGxzQmFja2VuZCIgQkFDS0VORCksID09LCAwKTsKLSAKLS0jaWZkZWYg
QkFDS0VORF9JU19HTlVUTFMKLSsjaWYgZGVmaW5lZChCQUNLRU5EX0lTX0dOVVRMUykgJiYgSEFW
RV9HTlVUTFNfUEtDUzExCi0gICBtb2R1bGVfcGF0aCA9IGdfdGVzdF9idWlsZF9maWxlbmFtZSAo
R19URVNUX0JVSUxULCAibW9jay1wa2NzMTEuc28iLCBOVUxMKTsKLSAgIGdfYXNzZXJ0X3RydWUg
KGdfZmlsZV90ZXN0IChtb2R1bGVfcGF0aCwgR19GSUxFX1RFU1RfRVhJU1RTKSk7Ci0gCi1AQCAt
OTQyLDEyICs5NDMsMTQgQEAgbWFpbiAoaW50ICAgYXJnYywKLSAgICAgICAgICAgICAgIHNldHVw
X2NlcnRpZmljYXRlLCB0ZXN0X2NyZWF0ZV9jZXJ0aWZpY2F0ZV93aXRoX2lzc3VlciwgdGVhcmRv
d25fY2VydGlmaWNhdGUpOwotICAgZ190ZXN0X2FkZCAoIi90bHMvIiBCQUNLRU5EICIvY2VydGlm
aWNhdGUvY3JlYXRlLXdpdGgtZ2FyYmFnZS1pbnB1dCIsIFRlc3RDZXJ0aWZpY2F0ZSwgTlVMTCwK
LSAgICAgICAgICAgICAgIHNldHVwX2NlcnRpZmljYXRlLCB0ZXN0X2NyZWF0ZV9jZXJ0aWZpY2F0
ZV93aXRoX2dhcmJhZ2VfaW5wdXQsIHRlYXJkb3duX2NlcnRpZmljYXRlKTsKLS0gIGdfdGVzdF9h
ZGQgKCIvdGxzLyIgQkFDS0VORCAiL2NlcnRpZmljYXRlL3BrY3MxMSIsIFRlc3RDZXJ0aWZpY2F0
ZSwgTlVMTCwKLS0gICAgICAgICAgICAgIHNldHVwX2NlcnRpZmljYXRlLCB0ZXN0X2NyZWF0ZV9j
ZXJ0aWZpY2F0ZV9wa2NzMTEsIHRlYXJkb3duX2NlcnRpZmljYXRlKTsKLSAgIGdfdGVzdF9hZGQg
KCIvdGxzLyIgQkFDS0VORCAiL2NlcnRpZmljYXRlL3ByaXZhdGUta2V5IiwgVGVzdENlcnRpZmlj
YXRlLCBOVUxMLAotICAgICAgICAgICAgICAgc2V0dXBfY2VydGlmaWNhdGUsIHRlc3RfcHJpdmF0
ZV9rZXksIHRlYXJkb3duX2NlcnRpZmljYXRlKTsKLSsjaWYgSEFWRV9HTlVUTFNfUEtDUzExCi0r
ICBnX3Rlc3RfYWRkICgiL3Rscy8iIEJBQ0tFTkQgIi9jZXJ0aWZpY2F0ZS9wa2NzMTEiLCBUZXN0
Q2VydGlmaWNhdGUsIE5VTEwsCi0rICAgICAgICAgICAgICBzZXR1cF9jZXJ0aWZpY2F0ZSwgdGVz
dF9jcmVhdGVfY2VydGlmaWNhdGVfcGtjczExLCB0ZWFyZG93bl9jZXJ0aWZpY2F0ZSk7Ci0gICBn
X3Rlc3RfYWRkICgiL3Rscy8iIEJBQ0tFTkQgIi9jZXJ0aWZpY2F0ZS9wcml2YXRlLWtleS1wa2Nz
MTEiLCBUZXN0Q2VydGlmaWNhdGUsIE5VTEwsCi0gICAgICAgICAgICAgICBzZXR1cF9jZXJ0aWZp
Y2F0ZSwgdGVzdF9wcml2YXRlX2tleV9wa2NzMTEsIHRlYXJkb3duX2NlcnRpZmljYXRlKTsKLSsj
ZW5kaWYKLSAKLSAgIGdfdGVzdF9hZGRfZnVuYyAoIi90bHMvIiBCQUNLRU5EICIvY2VydGlmaWNh
dGUvY3JlYXRlLWNoYWluIiwgdGVzdF9jcmVhdGVfY2VydGlmaWNhdGVfY2hhaW4pOwotICAgZ190
ZXN0X2FkZF9mdW5jICgiL3Rscy8iIEJBQ0tFTkQgIi9jZXJ0aWZpY2F0ZS9jcmVhdGUtbm8tY2hh
aW4iLCB0ZXN0X2NyZWF0ZV9jZXJ0aWZpY2F0ZV9ub19jaGFpbik7Ci1kaWZmIC0tZ2l0IGEvdGxz
L3Rlc3RzL2Nvbm5lY3Rpb24uYyBiL3Rscy90ZXN0cy9jb25uZWN0aW9uLmMKLWluZGV4IDE3ZWZl
MWIuLjYyYTdmYmIgMTAwNjQ0Ci0tLS0gYS90bHMvdGVzdHMvY29ubmVjdGlvbi5jCi0rKysgYi90
bHMvdGVzdHMvY29ubmVjdGlvbi5jCi1AQCAtMzM3Niw3ICszMzc2LDcgQEAgbWFpbiAoaW50ICAg
YXJnYywKLSAKLSAgIGdfYXNzZXJ0X3RydWUgKGdfYXNjaWlfc3RyY2FzZWNtcCAoR19PQkpFQ1Rf
VFlQRV9OQU1FIChnX3Rsc19iYWNrZW5kX2dldF9kZWZhdWx0ICgpKSwgIkdUbHNCYWNrZW5kIiBC
QUNLRU5EKSA9PSAwKTsKLSAKLS0jaWZkZWYgQkFDS0VORF9JU19HTlVUTFMKLSsjaWYgZGVmaW5l
ZChCQUNLRU5EX0lTX0dOVVRMUykgJiYgSEFWRV9HTlVUTFNfUEtDUzExCi0gICBtb2R1bGVfcGF0
aCA9IGdfdGVzdF9idWlsZF9maWxlbmFtZSAoR19URVNUX0JVSUxULCAibW9jay1wa2NzMTEuc28i
LCBOVUxMKTsKLSAgIGdfYXNzZXJ0X3RydWUgKGdfZmlsZV90ZXN0IChtb2R1bGVfcGF0aCwgR19G
SUxFX1RFU1RfRVhJU1RTKSk7Ci0gCi1AQCAtMzQzOCw4ICszNDM4LDEwIEBAIG1haW4gKGludCAg
IGFyZ2MsCi0gICAgICAgICAgICAgICBzZXR1cF9jb25uZWN0aW9uLCB0ZXN0X2NsaWVudF9hdXRo
X3JlcXVlc3RfZmFpbCwgdGVhcmRvd25fY29ubmVjdGlvbik7Ci0gICBnX3Rlc3RfYWRkICgiL3Rs
cy8iIEJBQ0tFTkQgIi9jb25uZWN0aW9uL2NsaWVudC1hdXRoLXJlcXVlc3Qtbm9uZSIsIFRlc3RD
b25uZWN0aW9uLCBOVUxMLAotICAgICAgICAgICAgICAgc2V0dXBfY29ubmVjdGlvbiwgdGVzdF9j
bGllbnRfYXV0aF9yZXF1ZXN0X25vbmUsIHRlYXJkb3duX2Nvbm5lY3Rpb24pOwotKyNpZiBIQVZF
X0dOVVRMU19QS0NTMTEKLSAgIGdfdGVzdF9hZGQgKCIvdGxzLyIgQkFDS0VORCAiL2Nvbm5lY3Rp
b24vY2xpZW50LWF1dGgtcGtjczExIiwgVGVzdENvbm5lY3Rpb24sIE5VTEwsCi0gICAgICAgICAg
ICAgICBzZXR1cF9jb25uZWN0aW9uLCB0ZXN0X2NsaWVudF9hdXRoX3BrY3MxMV9jb25uZWN0aW9u
LCB0ZWFyZG93bl9jb25uZWN0aW9uKTsKLSsjZW5kaWYKLSAgIGdfdGVzdF9hZGQgKCIvdGxzLyIg
QkFDS0VORCAiL2Nvbm5lY3Rpb24vbm8tZGF0YWJhc2UiLCBUZXN0Q29ubmVjdGlvbiwgTlVMTCwK
LSAgICAgICAgICAgICAgIHNldHVwX2Nvbm5lY3Rpb24sIHRlc3RfY29ubmVjdGlvbl9ub19kYXRh
YmFzZSwgdGVhcmRvd25fY29ubmVjdGlvbik7Ci0gICBnX3Rlc3RfYWRkICgiL3Rscy8iIEJBQ0tF
TkQgIi9jb25uZWN0aW9uL2ZhaWxlZCIsIFRlc3RDb25uZWN0aW9uLCBOVUxMLAotLS0gCi0yLjM0
LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWIt
bmV0d29ya2luZ18yLjc2LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcv
Z2xpYi1uZXR3b3JraW5nXzIuNzguMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzYu
MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0
d29ya2luZ18yLjc4LjAuYmIKaW5kZXggMzY4NzEyMzE0MS4uMTA2OTcyZDVkNCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjc2
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29y
a2luZ18yLjc4LjAuYmIKQEAgLTE0LDcgKzE0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vQ09QWUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAogU0VDVElP
TiA9ICJsaWJzIgogREVQRU5EUyA9ICJnbGliLTIuMC1uYXRpdmUgZ2xpYi0yLjAiCiAKLVNSQ19V
UklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjVjNjk4YTk5OTRkZGU1MWVmZGZiMTAyNmE1NjY5OGEy
MjFkNjI1MGU4OWRjNTBlYmNkZGRhN2I4MTQ4MGE0MmIiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2
c3VtXSA9ICI1MmZlNGNlOTNmN2RjNTEzMzRiMTAyODk0NTk5ODU4ZDIzYzhhNjVhYzRhMTExMGIz
MDkyMDU2NWQ2OGQzYWJhIgogCiAjIFVwc3RyZWFtIG5vdGUgdGhhdCBmb3IgdGhlIG9wZW5zc2wg
YmFja2VuZCwgaGFsZiB0aGUgdGVzdHMgd2hlcmUgdGhpcyBiYWNrZW5kIGRvbid0IHJldHVybgog
IyB0aGUgZXhwZWN0ZWQgZXJyb3IgY29kZSBvciBkb24ndCB3b3JrIGFzIGV4cGVjdGVkIHNvIGRl
ZmF1bHQgdG8gZ251dGxzCkBAIC0zMCwxMCArMzAsNiBAQCBQQUNLQUdFQ09ORklHW2dub21lcHJv
eHldID0gIi1EZ25vbWVfcHJveHk9ZW5hYmxlZCwtRGdub21lX3Byb3h5PWRpc2FibGVkLGdzZXR0
aQogR05PTUVCQVNFQlVJTERDTEFTUyA9ICJtZXNvbiIKIGluaGVyaXQgZ25vbWViYXNlIGdldHRl
eHQgdXBzdHJlYW0tdmVyc2lvbi1pcy1ldmVuIGdpby1tb2R1bGUtY2FjaGUgcHRlc3QtZ25vbWUK
IAotU1JDX1VSSSArPSAiZmlsZTovL3J1bi1wdGVzdCIKLVNSQ19VUkkgKz0gImZpbGU6Ly9lYWdh
aW4ucGF0Y2giCi1TUkNfVVJJICs9ICJmaWxlOi8vMDAwMS10bHMtdGVzdHMtZGlzYWJsZS1QS0NT
LTExLXRlc3RzLWlmLW5vdC1hdmFpbGFibGUucGF0Y2giCi0KIEZJTEVTOiR7UE59ICs9ICJcCiAg
ICAgICAgICAgICAgICAgJHtsaWJkaXJ9L2dpby9tb2R1bGVzL2xpYmdpbyouc28gXAogICAgICAg
ICAgICAgICAgICR7ZGF0YWRpcn0vZGJ1cy0xL3NlcnZpY2VzLyBcCi0tIAoyLjM5LjIKCg==

--===============3611374178576175168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGSIZE changed from 2665 to 6660 (+150%)
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: FILELIST: removed "/usr/lib/glib-networking/ptest/run-ptest"

--===============3611374178576175168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 677640 to 677600 (-0%)
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dev: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-doc: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ab: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ab: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-an: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ar: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-as: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-be: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bg: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bn-in: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-bs: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca+valencia: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PKGSIZE changed from 8348 to 8462 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGSIZE changed from 8018 to 8095 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PKGSIZE changed from 7540 to 7631 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGSIZE changed from 8850 to 8338 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGSIZE changed from 7018 to 7261 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGSIZE changed from 2665 to 6660 (+150%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGSIZE changed from 7853 to 7951 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGSIZE changed from 7569 to 7652 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PKGSIZE changed from 9405 to 9523 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGSIZE changed from 8751 to 8313 (-5%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PKGSIZE changed from 8974 to 9064 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGSIZE changed from 8634 to 8124 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGSIZE changed from 7891 to 7414 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGSIZE changed from 8155 to 8047 (-1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PKGSIZE changed from 11677 to 11868 (+2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGSIZE changed from 8249 to 8342 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGSIZE changed from 7756 to 7830 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lv: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ml: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-mr: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ms: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nb: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ne: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGSIZE changed from 7545 to 7643 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGSIZE changed from 8092 to 8173 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGSIZE changed from 8136 to 8219 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGSIZE changed from 8422 to 8251 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGSIZE changed from 8128 to 8193 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGSIZE changed from 7673 to 7752 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGSIZE changed from 7905 to 7403 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGSIZE changed from 11812 to 11136 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: FILELIST: removed "/usr/lib/glib-networking/ptest/run-ptest"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGSIZE changed from 381783 to 381726 (-0%)
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 741522 to 741786 (+0%)
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.76/glib-networking-2.76.1.tar.xz;name=archive file://run-ptest file://eagain.patch file://0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch" to "https://download.gnome.org/sources//glib-networking/2.78/glib-networking-2.78.0.tar.xz;name=archive"
packages/core2-32-poky-linux/glib-networking: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking: PV changed from "2.76.1" to "2.78.0"

--===============3611374178576175168==--

