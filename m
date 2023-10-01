Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941A0E748FC
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.65014.1696183990434144514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IXMTtEud;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G8jBjlb3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018aec71b4ff-000157a2-79c6-49ba-aaa1-0198be4af98f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=D78rIWxaKOHlmHNupp9swMalzhk4GrLW3wFQN1yUFqM=;
	b=IXMTtEuduJzMCS76bPdpfM3l/o5ap/ND25F2TAbK3OhbeDA+qk2nKZJMCO644L79
	C1SpHqfXbAGnBd6Cxkd9PRDgJ5U6QbEDeWVs2HqkgGWKGq4CyPIkz+mIReCd/4CkV+5
	pQ2tXYPDTExH6MsyBAZdzHn7ck4lGtACO+UN/GoI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=D78rIWxaKOHlmHNupp9swMalzhk4GrLW3wFQN1yUFqM=;
	b=G8jBjlb3MVUzicNzO5mNxRqIsxo8zBxKS/qqh1n6rWCz0hRcyJNxfqrRBBJpGqRi
	IuSiQxIpXM7M5wd/8QtBn41hqQFMquGm7nNiKlHyV2Or0/mO/asTE6iBBMHpB6QAbfr
	79q0QfcfwRXU3OdHSf3IUAsi/PTdpA1iTKMrcVGY=
Content-Type: multipart/mixed; boundary="===============5937857045995508240=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-networking: upgrading to 2.78.0 SUCCEEDED
Message-ID: <0101018aec71b4ff-000157a2-79c6-49ba-aaa1-0198be4af98f-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188522

--===============5937857045995508240==
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
From 4ab35da11634e0071842fb5923dc3065bc5e0b74 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 07:41:28 +0000
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


--===============5937857045995508240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-dbg: PKGSIZE changed from 677640 to 677600 (-0%)
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
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ca: PKGSIZE changed from 8348 to 8462 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-cs: PKGSIZE changed from 8018 to 8095 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-da: PKGSIZE changed from 7540 to 7631 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-de: PKGSIZE changed from 8850 to 8338 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-el: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-ca: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-en-gb: PKGSIZE changed from 7018 to 7261 (+3%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGSIZE changed from 2665 to 6660 (+150%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-es: PKGSIZE changed from 7853 to 7951 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-et: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eu: PKGSIZE changed from 7569 to 7652 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fa: PKGSIZE changed from 9405 to 9523 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fi: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fr: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-fur: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gd: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gl: PKGSIZE changed from 8751 to 8313 (-5%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-gu: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-he: PKGSIZE changed from 8974 to 9064 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hi: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hr: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-hu: PKGSIZE changed from 8634 to 8124 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-id: PKGSIZE changed from 7891 to 7414 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-it: PKGSIZE changed from 8155 to 8047 (-1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ja: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ka: PKGSIZE changed from 11677 to 11868 (+2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kk: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-km: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-kn: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ko: PKGSIZE changed from 8249 to 8342 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-lt: PKGSIZE changed from 7756 to 7830 (+1%)
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
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-nl: PKGSIZE changed from 7545 to 7643 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-oc: PKGSIZE changed from 8092 to 8173 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-or: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pa: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pl: PKGSIZE changed from 8136 to 8219 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt-br: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-pt: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ro: PKGSIZE changed from 8422 to 8251 (-2%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ru: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sk: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sl: PKGSIZE changed from 8128 to 8193 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr+latin: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sr: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-sv: PKGSIZE changed from 7673 to 7752 (+1%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ta: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-te: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tg: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-th: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-tr: PKGSIZE changed from 7905 to 7403 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-ug: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-uk: PKGSIZE changed from 11812 to 11136 (-6%)
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-vi: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-cn: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-hk: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-locale-zh-tw: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: FILELIST: removed "/usr/lib/glib-networking/ptest/run-ptest"
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: PKGSIZE changed from 381783 to 381726 (-0%)
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking-src: PKGSIZE changed from 741522 to 741786 (+0%)
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking-staticdev: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking/glib-networking: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking/glib-networking: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking: PKGV changed from 2.76.1 [default] to 2.78.0 [default]
packages/core2-32-poky-linux/glib-networking: PV changed from "2.76.1" to "2.78.0"
packages/core2-32-poky-linux/glib-networking: SRC_URI changed from "https://download.gnome.org/sources//glib-networking/2.76/glib-networking-2.76.1.tar.xz;name=archive file://run-ptest file://eagain.patch file://0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch" to "https://download.gnome.org/sources//glib-networking/2.78/glib-networking-2.78.0.tar.xz;name=archive"

--===============5937857045995508240==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-networking-upgrade-2.76.1-2.78.0.patch"

RnJvbSA0YWIzNWRhMTE2MzRlMDA3MTg0MmZiNTkyM2RjMzA2NWJjNWUwYjc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwNzo0MToyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItbmV0d29ya2luZzogdXBncmFkZSAyLjc2LjEgLT4gMi43OC4wCgotLS0KIC4uLnNhYmxlLVBL
Q1MtMTEtdGVzdHMtaWYtbm90LWF2YWlsYWJsZS5wYXRjaCB8IDExMyAtLS0tLS0tLS0tLS0tLS0t
LS0KIC4uLm5nXzIuNzYuMS5iYiA9PiBnbGliLW5ldHdvcmtpbmdfMi43OC4wLmJifSB8ICAgNiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTE4IGRlbGV0aW9ucygtKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5l
dHdvcmtpbmcvMDAwMS10bHMtdGVzdHMtZGlzYWJsZS1QS0NTLTExLXRlc3RzLWlmLW5vdC1hdmFp
bGFibGUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcve2ds
aWItbmV0d29ya2luZ18yLjc2LjEuYmIgPT4gZ2xpYi1uZXR3b3JraW5nXzIuNzguMC5iYn0gKDg5
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1u
ZXR3b3JraW5nLzAwMDEtdGxzLXRlc3RzLWRpc2FibGUtUEtDUy0xMS10ZXN0cy1pZi1ub3QtYXZh
aWxhYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0
d29ya2luZy8wMDAxLXRscy10ZXN0cy1kaXNhYmxlLVBLQ1MtMTEtdGVzdHMtaWYtbm90LWF2YWls
YWJsZS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggN2IwMDM1ODhjOC4uMDAw
MDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3
b3JraW5nLzAwMDEtdGxzLXRlc3RzLWRpc2FibGUtUEtDUy0xMS10ZXN0cy1pZi1ub3QtYXZhaWxh
YmxlLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTEzICswLDAgQEAKLUZyb20gMDQ3MjhhNWI3
M2U4NzBiNDY5NWM1ZTdiYTQyZmE0MWMwMDQ3MTk0NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgotRGF0ZTogRnJpLCAxMiBN
YXkgMjAyMyAyMDoxOTozNSArMDEwMAotU3ViamVjdDogW1BBVENIXSB0bHMvdGVzdHM6IGRpc2Fi
bGUgUEtDUyMxMSB0ZXN0cyBpZiBub3QgYXZhaWxhYmxlCi0KLUdudVRMUyBjYW4gYmUgYnVpbHQg
d2l0aG91dCBQS0NTIzExLCB3aGljaCBtZWFucyB0aGUgc3ltYm9scwotZ251dGxzX3BrY3MxMV9p
bml0IGFuZCBnbnV0bHNfcGtjczExX2FkZF9wcm92aWRlciBhcmUgbm90IHBhcnQgb2YgdGhlCi1s
aWJyYXJ5LgotCi1JZiB0aGVzZSBzeW1ib2xzIGRvbid0IGV4aXN0IGluIEdudVRMUyB0aGVuIHdl
IGNhbid0IGFkZCBhIG1vY2sgcGtjcyMxMQotcHJvdmlkZXIgZm9yIHRlc3RpbmcsIGFuZCBzZXZl
cmFsIHRlc3RzIHdoaWNoIG5lZWQgdGhlIG1vY2sgcHJvdmlkZXIKLXdpbGwgZmFpbC4KLQotU29s
dmUgdGhpcyBieSBjaGVja2luZyBmb3IgdGhlIHN5bWJvbHMgYXQgYnVpbGQgdGltZSBhbmQgZGlz
YWJsaW5nIHRoZQotcHJvdmlkZXIgYW5kIHRlc3RzIHdoaWNoIG5lZWQgaXQuCi0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQKLVNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRv
bkBhcm0uY29tPgotLS0tCi0gbWVzb24uYnVpbGQgICAgICAgICAgICAgfCAgNCArKysrCi0gdGxz
L3Rlc3RzL2NlcnRpZmljYXRlLmMgfCAxMSArKysrKysrLS0tLQotIHRscy90ZXN0cy9jb25uZWN0
aW9uLmMgIHwgIDQgKysrLQotIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWlu
ZGV4IDBmYTkwMjcuLmQyYTAyM2EgMTAwNjQ0Ci0tLS0gYS9tZXNvbi5idWlsZAotKysrIGIvbWVz
b24uYnVpbGQKLUBAIC04NCw2ICs4NCwxMCBAQCBnbnV0bHNfZGVwID0gZGVwZW5kZW5jeSgnZ251
dGxzJywgdmVyc2lvbjogJz49IDMuNy40JywgcmVxdWlyZWQ6IGdldF9vcHRpb24oJ2dudQotIAot
IGlmIGdudXRsc19kZXAuZm91bmQoKQotICAgYmFja2VuZHMgKz0gWydnbnV0bHMnXQotKyAgIyB0
ZXN0LXNwZWNpZmljLCBtYXliZSBtb3ZlIHRvIHRscy90ZXN0cwotKyAgaWYgY2MuaGFzX2Z1bmN0
aW9uKCdnbnV0bHNfcGtjczExX2luaXQnLCBwcmVmaXg6ICcjaW5jbHVkZSA8Z251dGxzL3BrY3Mx
MS5oPicsIGRlcGVuZGVuY2llczogZ251dGxzX2RlcCkKLSsgICAgY29uZmlnX2guc2V0MTAoJ0hB
VkVfR05VVExTX1BLQ1MxMScsIHRydWUpCi0rICBlbmRpZgotIGVuZGlmCi0gCi0gIyAqKiogQ2hl
Y2tzIGZvciBPcGVuU1NMICAgICoqKgotZGlmZiAtLWdpdCBhL3Rscy90ZXN0cy9jZXJ0aWZpY2F0
ZS5jIGIvdGxzL3Rlc3RzL2NlcnRpZmljYXRlLmMKLWluZGV4IGU4MjBiYTEuLmRkMjQxMmIgMTAw
NjQ0Ci0tLS0gYS90bHMvdGVzdHMvY2VydGlmaWNhdGUuYwotKysrIGIvdGxzL3Rlc3RzL2NlcnRp
ZmljYXRlLmMKLUBAIC0yNCw2ICsyNCw3IEBACi0gICogQXV0aG9yOiBTdGVmIFdhbHRlciA8c3Rl
ZndAY29sbGFib3JhLmNvLnVrPgotICAqLwotIAotKyNpbmNsdWRlICJjb25maWcuaCIKLSAjaW5j
bHVkZSAiY2VydGlmaWNhdGUuaCIKLSAKLSAjaW5jbHVkZSA8Z2lvL2dpby5oPgotQEAgLTkxMSw3
ICs5MTIsNyBAQCBpbnQKLSBtYWluIChpbnQgICBhcmdjLAotICAgICAgIGNoYXIgKmFyZ3ZbXSkK
LSB7Ci0tI2lmZGVmIEJBQ0tFTkRfSVNfR05VVExTCi0rI2lmIGRlZmluZWQoQkFDS0VORF9JU19H
TlVUTFMpICYmIEhBVkVfR05VVExTX1BLQ1MxMQotICAgY2hhciAqbW9kdWxlX3BhdGg7Ci0gI2Vu
ZGlmCi0gCi1AQCAtOTIxLDcgKzkyMiw3IEBAIG1haW4gKGludCAgIGFyZ2MsCi0gICBnX3NldGVu
diAoIkdJT19VU0VfVExTIiwgQkFDS0VORCwgVFJVRSk7Ci0gICBnX2Fzc2VydF9jbXBpbnQgKGdf
YXNjaWlfc3RyY2FzZWNtcCAoR19PQkpFQ1RfVFlQRV9OQU1FIChnX3Rsc19iYWNrZW5kX2dldF9k
ZWZhdWx0ICgpKSwgIkdUbHNCYWNrZW5kIiBCQUNLRU5EKSwgPT0sIDApOwotIAotLSNpZmRlZiBC
QUNLRU5EX0lTX0dOVVRMUwotKyNpZiBkZWZpbmVkKEJBQ0tFTkRfSVNfR05VVExTKSAmJiBIQVZF
X0dOVVRMU19QS0NTMTEKLSAgIG1vZHVsZV9wYXRoID0gZ190ZXN0X2J1aWxkX2ZpbGVuYW1lIChH
X1RFU1RfQlVJTFQsICJtb2NrLXBrY3MxMS5zbyIsIE5VTEwpOwotICAgZ19hc3NlcnRfdHJ1ZSAo
Z19maWxlX3Rlc3QgKG1vZHVsZV9wYXRoLCBHX0ZJTEVfVEVTVF9FWElTVFMpKTsKLSAKLUBAIC05
NDIsMTIgKzk0MywxNCBAQCBtYWluIChpbnQgICBhcmdjLAotICAgICAgICAgICAgICAgc2V0dXBf
Y2VydGlmaWNhdGUsIHRlc3RfY3JlYXRlX2NlcnRpZmljYXRlX3dpdGhfaXNzdWVyLCB0ZWFyZG93
bl9jZXJ0aWZpY2F0ZSk7Ci0gICBnX3Rlc3RfYWRkICgiL3Rscy8iIEJBQ0tFTkQgIi9jZXJ0aWZp
Y2F0ZS9jcmVhdGUtd2l0aC1nYXJiYWdlLWlucHV0IiwgVGVzdENlcnRpZmljYXRlLCBOVUxMLAot
ICAgICAgICAgICAgICAgc2V0dXBfY2VydGlmaWNhdGUsIHRlc3RfY3JlYXRlX2NlcnRpZmljYXRl
X3dpdGhfZ2FyYmFnZV9pbnB1dCwgdGVhcmRvd25fY2VydGlmaWNhdGUpOwotLSAgZ190ZXN0X2Fk
ZCAoIi90bHMvIiBCQUNLRU5EICIvY2VydGlmaWNhdGUvcGtjczExIiwgVGVzdENlcnRpZmljYXRl
LCBOVUxMLAotLSAgICAgICAgICAgICAgc2V0dXBfY2VydGlmaWNhdGUsIHRlc3RfY3JlYXRlX2Nl
cnRpZmljYXRlX3BrY3MxMSwgdGVhcmRvd25fY2VydGlmaWNhdGUpOwotICAgZ190ZXN0X2FkZCAo
Ii90bHMvIiBCQUNLRU5EICIvY2VydGlmaWNhdGUvcHJpdmF0ZS1rZXkiLCBUZXN0Q2VydGlmaWNh
dGUsIE5VTEwsCi0gICAgICAgICAgICAgICBzZXR1cF9jZXJ0aWZpY2F0ZSwgdGVzdF9wcml2YXRl
X2tleSwgdGVhcmRvd25fY2VydGlmaWNhdGUpOwotKyNpZiBIQVZFX0dOVVRMU19QS0NTMTEKLSsg
IGdfdGVzdF9hZGQgKCIvdGxzLyIgQkFDS0VORCAiL2NlcnRpZmljYXRlL3BrY3MxMSIsIFRlc3RD
ZXJ0aWZpY2F0ZSwgTlVMTCwKLSsgICAgICAgICAgICAgIHNldHVwX2NlcnRpZmljYXRlLCB0ZXN0
X2NyZWF0ZV9jZXJ0aWZpY2F0ZV9wa2NzMTEsIHRlYXJkb3duX2NlcnRpZmljYXRlKTsKLSAgIGdf
dGVzdF9hZGQgKCIvdGxzLyIgQkFDS0VORCAiL2NlcnRpZmljYXRlL3ByaXZhdGUta2V5LXBrY3Mx
MSIsIFRlc3RDZXJ0aWZpY2F0ZSwgTlVMTCwKLSAgICAgICAgICAgICAgIHNldHVwX2NlcnRpZmlj
YXRlLCB0ZXN0X3ByaXZhdGVfa2V5X3BrY3MxMSwgdGVhcmRvd25fY2VydGlmaWNhdGUpOwotKyNl
bmRpZgotIAotICAgZ190ZXN0X2FkZF9mdW5jICgiL3Rscy8iIEJBQ0tFTkQgIi9jZXJ0aWZpY2F0
ZS9jcmVhdGUtY2hhaW4iLCB0ZXN0X2NyZWF0ZV9jZXJ0aWZpY2F0ZV9jaGFpbik7Ci0gICBnX3Rl
c3RfYWRkX2Z1bmMgKCIvdGxzLyIgQkFDS0VORCAiL2NlcnRpZmljYXRlL2NyZWF0ZS1uby1jaGFp
biIsIHRlc3RfY3JlYXRlX2NlcnRpZmljYXRlX25vX2NoYWluKTsKLWRpZmYgLS1naXQgYS90bHMv
dGVzdHMvY29ubmVjdGlvbi5jIGIvdGxzL3Rlc3RzL2Nvbm5lY3Rpb24uYwotaW5kZXggMTdlZmUx
Yi4uNjJhN2ZiYiAxMDA2NDQKLS0tLSBhL3Rscy90ZXN0cy9jb25uZWN0aW9uLmMKLSsrKyBiL3Rs
cy90ZXN0cy9jb25uZWN0aW9uLmMKLUBAIC0zMzc2LDcgKzMzNzYsNyBAQCBtYWluIChpbnQgICBh
cmdjLAotIAotICAgZ19hc3NlcnRfdHJ1ZSAoZ19hc2NpaV9zdHJjYXNlY21wIChHX09CSkVDVF9U
WVBFX05BTUUgKGdfdGxzX2JhY2tlbmRfZ2V0X2RlZmF1bHQgKCkpLCAiR1Rsc0JhY2tlbmQiIEJB
Q0tFTkQpID09IDApOwotIAotLSNpZmRlZiBCQUNLRU5EX0lTX0dOVVRMUwotKyNpZiBkZWZpbmVk
KEJBQ0tFTkRfSVNfR05VVExTKSAmJiBIQVZFX0dOVVRMU19QS0NTMTEKLSAgIG1vZHVsZV9wYXRo
ID0gZ190ZXN0X2J1aWxkX2ZpbGVuYW1lIChHX1RFU1RfQlVJTFQsICJtb2NrLXBrY3MxMS5zbyIs
IE5VTEwpOwotICAgZ19hc3NlcnRfdHJ1ZSAoZ19maWxlX3Rlc3QgKG1vZHVsZV9wYXRoLCBHX0ZJ
TEVfVEVTVF9FWElTVFMpKTsKLSAKLUBAIC0zNDM4LDggKzM0MzgsMTAgQEAgbWFpbiAoaW50ICAg
YXJnYywKLSAgICAgICAgICAgICAgIHNldHVwX2Nvbm5lY3Rpb24sIHRlc3RfY2xpZW50X2F1dGhf
cmVxdWVzdF9mYWlsLCB0ZWFyZG93bl9jb25uZWN0aW9uKTsKLSAgIGdfdGVzdF9hZGQgKCIvdGxz
LyIgQkFDS0VORCAiL2Nvbm5lY3Rpb24vY2xpZW50LWF1dGgtcmVxdWVzdC1ub25lIiwgVGVzdENv
bm5lY3Rpb24sIE5VTEwsCi0gICAgICAgICAgICAgICBzZXR1cF9jb25uZWN0aW9uLCB0ZXN0X2Ns
aWVudF9hdXRoX3JlcXVlc3Rfbm9uZSwgdGVhcmRvd25fY29ubmVjdGlvbik7Ci0rI2lmIEhBVkVf
R05VVExTX1BLQ1MxMQotICAgZ190ZXN0X2FkZCAoIi90bHMvIiBCQUNLRU5EICIvY29ubmVjdGlv
bi9jbGllbnQtYXV0aC1wa2NzMTEiLCBUZXN0Q29ubmVjdGlvbiwgTlVMTCwKLSAgICAgICAgICAg
ICAgIHNldHVwX2Nvbm5lY3Rpb24sIHRlc3RfY2xpZW50X2F1dGhfcGtjczExX2Nvbm5lY3Rpb24s
IHRlYXJkb3duX2Nvbm5lY3Rpb24pOwotKyNlbmRpZgotICAgZ190ZXN0X2FkZCAoIi90bHMvIiBC
QUNLRU5EICIvY29ubmVjdGlvbi9uby1kYXRhYmFzZSIsIFRlc3RDb25uZWN0aW9uLCBOVUxMLAot
ICAgICAgICAgICAgICAgc2V0dXBfY29ubmVjdGlvbiwgdGVzdF9jb25uZWN0aW9uX25vX2RhdGFi
YXNlLCB0ZWFyZG93bl9jb25uZWN0aW9uKTsKLSAgIGdfdGVzdF9hZGQgKCIvdGxzLyIgQkFDS0VO
RCAiL2Nvbm5lY3Rpb24vZmFpbGVkIiwgVGVzdENvbm5lY3Rpb24sIE5VTEwsCi0tLSAKLTIuMzQu
MQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1u
ZXR3b3JraW5nXzIuNzYuMS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9n
bGliLW5ldHdvcmtpbmdfMi43OC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43Ni4x
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3
b3JraW5nXzIuNzguMC5iYgppbmRleCAzNjg3MTIzMTQxLi4xMDY5NzJkNWQ0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzYu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3Jr
aW5nXzIuNzguMC5iYgpAQCAtMTQsNyArMTQsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyBcCiBTRUNUSU9O
ID0gImxpYnMiCiBERVBFTkRTID0gImdsaWItMi4wLW5hdGl2ZSBnbGliLTIuMCIKIAotU1JDX1VS
SVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNWM2OThhOTk5NGRkZTUxZWZkZmIxMDI2YTU2Njk4YTIy
MWQ2MjUwZTg5ZGM1MGViY2RkZGE3YjgxNDgwYTQyYiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZz
dW1dID0gIjUyZmU0Y2U5M2Y3ZGM1MTMzNGIxMDI4OTQ1OTk4NThkMjNjOGE2NWFjNGExMTEwYjMw
OTIwNTY1ZDY4ZDNhYmEiCiAKICMgVXBzdHJlYW0gbm90ZSB0aGF0IGZvciB0aGUgb3BlbnNzbCBi
YWNrZW5kLCBoYWxmIHRoZSB0ZXN0cyB3aGVyZSB0aGlzIGJhY2tlbmQgZG9uJ3QgcmV0dXJuCiAj
IHRoZSBleHBlY3RlZCBlcnJvciBjb2RlIG9yIGRvbid0IHdvcmsgYXMgZXhwZWN0ZWQgc28gZGVm
YXVsdCB0byBnbnV0bHMKQEAgLTMwLDEwICszMCw2IEBAIFBBQ0tBR0VDT05GSUdbZ25vbWVwcm94
eV0gPSAiLURnbm9tZV9wcm94eT1lbmFibGVkLC1EZ25vbWVfcHJveHk9ZGlzYWJsZWQsZ3NldHRp
CiBHTk9NRUJBU0VCVUlMRENMQVNTID0gIm1lc29uIgogaW5oZXJpdCBnbm9tZWJhc2UgZ2V0dGV4
dCB1cHN0cmVhbS12ZXJzaW9uLWlzLWV2ZW4gZ2lvLW1vZHVsZS1jYWNoZSBwdGVzdC1nbm9tZQog
Ci1TUkNfVVJJICs9ICJmaWxlOi8vcnVuLXB0ZXN0IgotU1JDX1VSSSArPSAiZmlsZTovL2VhZ2Fp
bi5wYXRjaCIKLVNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLXRscy10ZXN0cy1kaXNhYmxlLVBLQ1Mt
MTEtdGVzdHMtaWYtbm90LWF2YWlsYWJsZS5wYXRjaCIKLQogRklMRVM6JHtQTn0gKz0gIlwKICAg
ICAgICAgICAgICAgICAke2xpYmRpcn0vZ2lvL21vZHVsZXMvbGliZ2lvKi5zbyBcCiAgICAgICAg
ICAgICAgICAgJHtkYXRhZGlyfS9kYnVzLTEvc2VydmljZXMvIFwKLS0gCjIuMzkuMgoK

--===============5937857045995508240==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glib-networking/glib-networking-locale-eo: PKGSIZE changed from 2665 to 6660 (+150%)
packages/core2-32-poky-linux/glib-networking/glib-networking-ptest: FILELIST: removed "/usr/lib/glib-networking/ptest/run-ptest"

--===============5937857045995508240==--

