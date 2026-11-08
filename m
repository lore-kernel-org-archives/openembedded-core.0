Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4846.1794172636929867845
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 13:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SsRu1z1Q;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37000e7234bso950441eec.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 13:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172636; x=1794777436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOIzenpj3qpNVLf4N4zWBqjL55h4uBSwxAGrPRXYUWw=;
        b=SsRu1z1QkmiNjxQ7vWEKR79RvjgOrgKwBV3kUcf2ceevRAt8+V5yx8ofs8WrIGIKHd
         3AQ7b4FP2UHRRQyUyu6pso8I3cVQS2/qt/wFGvJQtdwYyJcaybSxYaSKMAgM8PE9lOHa
         mfDUlINU11VdIA6/nrvt4W/bLtBpDwahqLyHrsbXoF2VthMEpWwIOP7VGdspZzHz/t5O
         mux3NpL1qwRGnx5VE/zLHPNWP8649wU7cnGJLE2n2W5a/F2hPdo8PyeirUXJ2sZDwHBQ
         keT4nb9ex6aDKQtUIBF9BAqgBI+ZGrN3dVw4wE2WZBsypalJl2ORwtsDEa6Y5UsOT7BQ
         a2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172636; x=1794777436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOIzenpj3qpNVLf4N4zWBqjL55h4uBSwxAGrPRXYUWw=;
        b=2ihVkTjcLDYSyKKUmFeNViuD0q3+5f5sLiJ3UXT+0j684GiLVHCNqASHWlXXM93YEp
         tlge65Cjatx+79Rwr0FuI+iHCBF0KQAZXIdc6PdS9McPeLs0KwCIM/dT+t9n7jlMfHgK
         Dt9WLGHQFwdfMGvfuxcJUeOF0Abh0iG7udf0XAjSvSXCdRPaXyIVNh8kuDY1scf9+o5K
         9ImXFEe7leVYeRFY19x0pCl+1/UjrdpIBtYcmLgw9fec5UDNGIjW92CO+M5iZRETI8tt
         sVTHm5FXka6OD4iEWO9V3TrEty/sYm4HMhEsdI+s3l1dcon0JI0yv61d+TEb32k6IBu7
         ZG2g==
X-Gm-Message-State: APuU4Z8+MLwgIKyF1mvx/cGg7Rva49XRjEHSrpvEnENL24g5U5yzO6nw
	Nqt+zrx8AiE3OIMzxfmXrXT/aB5g/74qylBoA6vtB1bcwKV79EbY5yIGPxRhyOHZ3Dw=
X-Gm-Gg: AYBFou1wbi+D4X9efbD9ZCko7+WYVwyk97e1Sied3FKigdPRFoM/7W6fK4Q1TWwSfAe
	aC+dfZG/6egOaSFA0bisQ1TNAWlwyJuzpqN1oeDYLxOndCf3VO89zWiWhrQKh+/kzIL5bTYcXHv
	OmzTw1ikqXckJinCmH0AtJ/PnsE3byak2/htorhWyJU0869vVzlqfdSvZQn0JZn/hJCLMcbd5I0
	Ks62N1GWGYiDFtLnPZE/+6Z4zxjgrsI3lUEvWZ+yNetAAg8lBu315nC448O497e8dyo9NOxzhdF
	YG/+ML4PCVfWPJhcw/cHRnF1odWOSu0usHQGVVGArDfTvBJYX6ntvIzBteemkkri1kjRwsmBJpa
	B7aJUtM4pm3sZ7CvzEFSXt401oquu3pj7FBK7TEl0Uxqd/lLHYPpD6bjRTTq1tjAkaS6GEXKG2u
	PS2Y5jH7sm0ZMewe/oQB9tZ+l31GHAKvWDqSHS5M7MsNpex9JxvKKO4epZcmkkRyvIWNP3ETF6g
	hx8tIu1cdpt6OILDule8QlXMhDw0bWgva9EURW5r8fjj+/sOXhzFGIrP3tY1WTd0pIB20fBM62a
	+6ZokMGil/sR0BQTQv42jK7fNOO7gdQ3/RiHESMQ91hkXNyNwspln1XM/1H5CM/Vw0JKEsx6aOf
	xFqH2mIlo/ys6SzLIzDQ4hnMqI+8YnqawgIx9Xk+lntVgXwMYEsOvb97AKjHHZ88z/Hs9jNdb10
	QwheuKQX4ZR/XdIINaG2+xDMSKzqn/oXKGv4bFNvuqEdvaHmqECn4vwZGkE77U0tlPSLBNvWtlB
	siRs8BD/tD/IWI8dxnseLKl9TXYfbj/ZdxFXFbj4Vc2WFGGh1oOvkm2WG4Ayht9hkaJ6t+qWmdu
	erhX
X-Received: by 2002:a05:7022:2606:b0:194:9e7a:3ba2 with SMTP id a92af1059eb24-1b39fe301edmr4701104c88.2.1794172635647;
        Sun, 08 Nov 2026 13:17:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771f0e0fsm10073748c88.20.2026.11.08.13.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:17:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] glib-networking: Fix openssl backend ptest failures
Date: Sun,  8 Nov 2026 13:17:10 -0800
Message-ID: <20261108211710.730810-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 21:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249772
Content-Type: text/plain; charset="utf-8"

With the openssl backend enabled, connection-openssl.test aborts, which
fails the whole suite:

  not ok /tls/openssl/connection/client-auth-fail-missing-client-private-key
  not ok /tls/openssl/connection/read-time-out-then-write

The first is a test issue: with TLS 1.3 the certificate-required alert is
reported again when the client closes, which the test already ignores for
openssl on Windows. The second is a real bug: a socket timeout is passed
to OpenSSL as a fatal transport error, so the connection is unusable
afterwards.

OpenSSL 4.1 broke two more tests:

- A TLS 1.3 server without a session ID context no longer issues
  session tickets, so session/resume_multiple_times never resumes. Set
  a session ID context on the server SSL_CTX.
- Host name checks no longer fall back to the subject commonName.
  server-self.pem has no subjectAltName, so database/verify-bad-ca also
  got BAD_IDENTITY. Regenerate it with the server.pem extensions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...et-timeouts-and-close-with-OpenSSL-4.patch |  80 +++++++++++++
 ...t-a-session-ID-context-on-the-server.patch |  53 +++++++++
 ...-a-subjectAltName-to-server-self.pem.patch | 111 ++++++++++++++++++
 .../glib-networking/glib-networking_2.90.1.bb |   3 +
 4 files changed, 247 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/0001-openssl-Fix-socket-timeouts-and-close-with-OpenSSL-4.patch
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/0002-openssl-Set-a-session-ID-context-on-the-server.patch
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/0003-tests-Add-a-subjectAltName-to-server-self.pem.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-openssl-Fix-socket-timeouts-and-close-with-OpenSSL-4.patch b/meta/recipes-core/glib-networking/glib-networking/0001-openssl-Fix-socket-timeouts-and-close-with-OpenSSL-4.patch
new file mode 100644
index 0000000000..62c23ed06a
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0001-openssl-Fix-socket-timeouts-and-close-with-OpenSSL-4.patch
@@ -0,0 +1,80 @@
+From 7c30c375ca678f08278bc3315b35d34a2a4becfe Mon Sep 17 00:00:00 2001
+From: Thomas Bechtold <thomasbechtold@jpberlin.de>
+Date: Tue, 3 Nov 2026 10:44:14 +0100
+Subject: [PATCH] openssl: Fix socket timeouts and close() with OpenSSL 4.0
+
+OpenSSL 4.0 (openssl/openssl#30230) puts the SSL object into the error
+state on any fatal record-layer error, and every later SSL_read(),
+SSL_write() or SSL_shutdown() then fails without queueing an error.
+
+A GSocket timeout was reported to OpenSSL as a non-retryable BIO error,
+so on 4.0 the connection could no longer be used after a read timed
+out. Treat G_IO_ERROR_TIMED_OUT as retryable in the BIO, like
+G_IO_ERROR_WOULD_BLOCK and like the GnuTLS backend does, and don't
+turn SSL_ERROR_WANT_* into a retry when the base status is
+G_TLS_CONNECTION_BASE_TIMED_OUT, so the timeout is still reported.
+
+close() called SSL_shutdown() after a failed handshake. On 3.x that
+raised SSL_R_SHUTDOWN_WHILE_IN_INIT, which end_openssl_io() already
+treats as success; 4.0 returns early without it, so close() reported
+the stored handshake error. Skip SSL_shutdown() while SSL_in_init()
+is true.
+
+Closes #242
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib-networking/-/commit/66c888f74f4b1fda0b0a53038d13d643be27492f]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tls/openssl/gtlsbio.c                | 6 ++++--
+ tls/openssl/gtlsconnection-openssl.c | 7 +++++++
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/tls/openssl/gtlsbio.c b/tls/openssl/gtlsbio.c
+index 6656d76..0f17359 100644
+--- a/tls/openssl/gtlsbio.c
++++ b/tls/openssl/gtlsbio.c
+@@ -163,7 +163,8 @@ gtls_bio_write (BIO        *bio,
+ 
+   if (written == -1)
+     {
+-      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK))
++      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK) ||
++          g_error_matches (error, G_IO_ERROR, G_IO_ERROR_TIMED_OUT))
+         BIO_set_retry_write (bio);
+ 
+       g_clear_error (gbio->write_error);
+@@ -213,7 +214,8 @@ gtls_bio_read (BIO  *bio,
+ 
+   if (read == -1)
+     {
+-      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK))
++      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_WOULD_BLOCK) ||
++          g_error_matches (error, G_IO_ERROR, G_IO_ERROR_TIMED_OUT))
+         BIO_set_retry_read (bio);
+ 
+       g_clear_error (gbio->read_error);
+diff --git a/tls/openssl/gtlsconnection-openssl.c b/tls/openssl/gtlsconnection-openssl.c
+index 8270dcd..02cdef6 100644
+--- a/tls/openssl/gtlsconnection-openssl.c
++++ b/tls/openssl/gtlsconnection-openssl.c
+@@ -109,6 +109,7 @@ end_openssl_io (GTlsConnectionOpenssl  *openssl,
+ 
+   if ((err_code == SSL_ERROR_WANT_READ ||
+        err_code == SSL_ERROR_WANT_WRITE) &&
++      status != G_TLS_CONNECTION_BASE_TIMED_OUT &&
+       blocking)
+     {
+       status = G_TLS_CONNECTION_BASE_TRY_AGAIN;
+@@ -1037,6 +1038,12 @@ g_tls_connection_openssl_close (GTlsConnectionBase  *tls,
+ 
+   priv->shutting_down = TRUE;
+ 
++  /* SSL_shutdown() must not be called on a connection whose handshake never
++   * completed or failed.
++   */
++  if (SSL_in_init (g_tls_connection_openssl_get_ssl (openssl)))
++    return G_TLS_CONNECTION_BASE_OK;
++
+   return perform_openssl_io (G_TLS_CONNECTION_OPENSSL (tls),
+                              G_IO_IN | G_IO_OUT,
+                              (GTlsOpensslIOFunc) SSL_shutdown,
diff --git a/meta/recipes-core/glib-networking/glib-networking/0002-openssl-Set-a-session-ID-context-on-the-server.patch b/meta/recipes-core/glib-networking/glib-networking/0002-openssl-Set-a-session-ID-context-on-the-server.patch
new file mode 100644
index 0000000000..efed2f32b2
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0002-openssl-Set-a-session-ID-context-on-the-server.patch
@@ -0,0 +1,53 @@
+From 58f575a1947f4e6e9ef6db91e8df91c6e847c864 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 8 Nov 2026 08:10:29 -0800
+Subject: [PATCH] openssl: Set a session ID context on the server
+
+Since OpenSSL 4.1 a TLS 1.3 server without a session ID context stops
+issuing session tickets (openssl/openssl#31964), so clients never resume
+and /tls/openssl/connection/session/resume_multiple_times fails:
+
+  'reused' should be TRUE
+
+Set a fixed session ID context on the server SSL_CTX.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tls/openssl/gtlsserverconnection-openssl.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/tls/openssl/gtlsserverconnection-openssl.c b/tls/openssl/gtlsserverconnection-openssl.c
+index 09b57f9..4cb965b 100644
+--- a/tls/openssl/gtlsserverconnection-openssl.c
++++ b/tls/openssl/gtlsserverconnection-openssl.c
+@@ -339,6 +339,8 @@ set_signature_algorithm_list (GTlsServerConnectionOpenssl *server)
+   SSL_CTX_set1_sigalgs_list (server->ssl_ctx, signature_algorithm_list);
+ }
+ 
++#define SESSION_ID_CONTEXT "glib-networking"
++
+ static void
+ set_curve_list (GTlsServerConnectionOpenssl *server)
+ {
+@@ -402,6 +404,20 @@ g_tls_server_connection_openssl_initable_init (GInitable       *initable,
+             SSL_OP_NO_TLSv1_1;
+   SSL_CTX_set_options (server->ssl_ctx, options);
+ 
++  /* Since OpenSSL 4.1, a TLS 1.3 server without a session ID context does not
++   * issue session tickets, so clients could never resume.
++   */
++  if (!SSL_CTX_set_session_id_context (server->ssl_ctx,
++                                       (const unsigned char *)SESSION_ID_CONTEXT,
++                                       sizeof (SESSION_ID_CONTEXT) - 1))
++    {
++      ERR_error_string_n (ERR_get_error (), error_buffer, sizeof (error_buffer));
++      g_set_error (error, G_TLS_ERROR, G_TLS_ERROR_MISC,
++                   _("Could not create TLS context: %s"),
++                   error_buffer);
++      return FALSE;
++    }
++
+   SSL_CTX_add_session (server->ssl_ctx, server->session);
+ 
+   set_signature_algorithm_list (server);
diff --git a/meta/recipes-core/glib-networking/glib-networking/0003-tests-Add-a-subjectAltName-to-server-self.pem.patch b/meta/recipes-core/glib-networking/glib-networking/0003-tests-Add-a-subjectAltName-to-server-self.pem.patch
new file mode 100644
index 0000000000..7749724ef7
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0003-tests-Add-a-subjectAltName-to-server-self.pem.patch
@@ -0,0 +1,111 @@
+From 49ed40ea767e7e35bcb36f433d51dbe287a85f23 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 8 Nov 2026 08:10:43 -0800
+Subject: [PATCH] tests: Add a subjectAltName to server-self.pem
+
+server-self.pem only carries the host name in the subject commonName.
+OpenSSL 4.1 no longer falls back to the subject DN when a certificate
+has no subjectAltName (openssl/openssl#31982), so verifying it against
+server.example.com now also reports G_TLS_CERTIFICATE_BAD_IDENTITY and
+/tls/openssl/database/verify-bad-ca fails:
+
+  assertion failed (errors == G_TLS_CERTIFICATE_UNKNOWN_CA): (3 == 1)
+
+Generate the self-signed certificate with the same extensions as
+server.pem, and update the copy in non-ca.pem.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib-networking/-/merge_requests/295]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tls/tests/files/create-files.sh |  2 +-
+ tls/tests/files/non-ca.pem      | 21 +++++++++++----------
+ tls/tests/files/server-self.pem | 21 +++++++++++----------
+ 3 files changed, 23 insertions(+), 21 deletions(-)
+
+diff --git a/tls/tests/files/create-files.sh b/tls/tests/files/create-files.sh
+index 05e3b6b..36e55af 100755
+--- a/tls/tests/files/create-files.sh
++++ b/tls/tests/files/create-files.sh
+@@ -88,7 +88,7 @@ openssl pkcs8 -topk8 -in server-key.pem -outform DER -nocrypt -out server-key-pk
+ #######################################################################
+ 
+ msg "Creating server self-signed certificate"
+-openssl x509 -req -days 9125 -in server-csr.pem -signkey server-key.pem -out server-self.pem
++openssl x509 -req -days 9125 -in server-csr.pem -signkey server-key.pem -extfile ssl/server.conf -extensions v3_req_ext -out server-self.pem
+ 
+ #######################################################################
+ ### Client
+diff --git a/tls/tests/files/non-ca.pem b/tls/tests/files/non-ca.pem
+index 66c605c..b740e54 100644
+--- a/tls/tests/files/non-ca.pem
++++ b/tls/tests/files/non-ca.pem
+@@ -101,10 +101,10 @@ Bmjwkx6t3AjGii6iSeTy/1UJQvVbq/tgVcAHig==
+ 
+ server-self.pem:
+ -----BEGIN CERTIFICATE-----
+-MIIDRzCCAi+gAwIBAgIUaH6pHw9hwrmQ1I7VLy28fE6G7kwwDQYJKoZIhvcNAQEL
++MIIDjDCCAnSgAwIBAgIUUUjhllrH5WdTlXZy4U2Lj8J0evowDQYJKoZIhvcNAQEL
+ BQAwSzETMBEGCgmSJomT8ixkARkWA0NPTTEXMBUGCgmSJomT8ixkARkWB0VYQU1Q
+-TEUxGzAZBgNVBAMMEnNlcnZlci5leGFtcGxlLmNvbTAgFw0yNjA1MjkyMTQ5Mzda
+-GA8yMDUxMDUyMzIxNDkzN1owSzETMBEGCgmSJomT8ixkARkWA0NPTTEXMBUGCgmS
++TEUxGzAZBgNVBAMMEnNlcnZlci5leGFtcGxlLmNvbTAgFw0yNjExMDgxNjEwNDJa
++GA8yMDUxMTEwMjE2MTA0MlowSzETMBEGCgmSJomT8ixkARkWA0NPTTEXMBUGCgmS
+ JomT8ixkARkWB0VYQU1QTEUxGzAZBgNVBAMMEnNlcnZlci5leGFtcGxlLmNvbTCC
+ ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANAFvDpR+Cn1FaHwXlvkRuGK
+ gmOSUqbmEDGEfrnGpRq/jiHZrTlrKX5GKAIrf573iAMMfabbhBygaX1DHd2ELR8U
+@@ -112,11 +112,12 @@ wBoH+E/ymXCT4E5+npVweOVnelVE0XsQcB8xvrVuLbN7obJvb4VymVqN6J/UjMrL
+ PTnsprQZh4ceUH5mpLKT3r1uuznIVfyy9XZ0BBqS8ub9muuixwzeO9j/YpdnQcNt
+ tJV4iXEK7VgT9WDnWduxa6sSWz613ap4MaLykmFqfcr6tNGkY155chZEsOuUYTkh
+ +96xAWw/305drhoLbORvQdK6yZ5ADeeuf2sQvUPNGGMl5yX15BDIBbsvwW0FTGEC
+-AwEAAaMhMB8wHQYDVR0OBBYEFGZAbCAj2xhWObgNfp8Y62+mXx8WMA0GCSqGSIb3
+-DQEBCwUAA4IBAQAPuwday2FnYkbWOHqxZqs3DJ1sJeOiwHvHaDvOkBDiNN/4ESFx
+-d5mag5w2P8I+Ntc0s1+2JiHwecA1cvqhsQsKqqs3G1vFqs8uLT4gz4Ycdh1RqUCI
+-Whsohfmfs4fJBrSw8UppKz0Iqkt7HigJHZFFYDKmRgGVyN1LVlCO5ziGg1mA8XDH
+-Hy3Tz/VDsfO9uVetr4I1CIodezhd8c77WkGSVaoSf9k5YDqPfqUwuBmuSqp9T3is
+-DxdUjYEfQPHYCam2DQHKd4bQ5WiL4net9oc4dnpz3hUmkJF5Q3Z4dz+Lm8WU08bg
+-eKpdhHu657xSFs00t8lX/dRB7zy9WfxcgMZ8
++AwEAAaNmMGQwCQYDVR0TBAIwADATBgNVHSUEDDAKBggrBgEFBQcDATAjBgNVHREE
++HDAahwTAqAEKghJzZXJ2ZXIuZXhhbXBsZS5jb20wHQYDVR0OBBYEFGZAbCAj2xhW
++ObgNfp8Y62+mXx8WMA0GCSqGSIb3DQEBCwUAA4IBAQClfG8qI1gmyNpoX/7FlLi/
++hKN4voWSZa5/EEP/SWY4p9eOWh4FLXvyxsKLCWAJj0pStBR+xyuq8u/MGjXzYtPS
++7d50umqrwzyMIeLSvGzAOauaIpPZMARgT+u/4OeARjAvfokiLzMRptB0RtRXrwkf
++FL+JLXRBYcPLn37b2xlMCeFne5D0tMqkpiawjUcN2C4uExOHh2Loc9ZByqbWzkyk
++Ys3sEmbb0EkolvQgciE8lxE48iUPSlH2g/SAbOWPMqxE7m80Bo0Qo2wW60jYeSjN
++Il4fwbG6gObek0CHyF44JQPUVm+HVm5S3Rg1YH4+GpNieV2zp9826O2Jr2j2Yk3+
+ -----END CERTIFICATE-----
+diff --git a/tls/tests/files/server-self.pem b/tls/tests/files/server-self.pem
+index 7f5700e..97c4cf4 100644
+--- a/tls/tests/files/server-self.pem
++++ b/tls/tests/files/server-self.pem
+@@ -1,8 +1,8 @@
+ -----BEGIN CERTIFICATE-----
+-MIIDRzCCAi+gAwIBAgIUaH6pHw9hwrmQ1I7VLy28fE6G7kwwDQYJKoZIhvcNAQEL
++MIIDjDCCAnSgAwIBAgIUUUjhllrH5WdTlXZy4U2Lj8J0evowDQYJKoZIhvcNAQEL
+ BQAwSzETMBEGCgmSJomT8ixkARkWA0NPTTEXMBUGCgmSJomT8ixkARkWB0VYQU1Q
+-TEUxGzAZBgNVBAMMEnNlcnZlci5leGFtcGxlLmNvbTAgFw0yNjA1MjkyMTQ5Mzda
+-GA8yMDUxMDUyMzIxNDkzN1owSzETMBEGCgmSJomT8ixkARkWA0NPTTEXMBUGCgmS
++TEUxGzAZBgNVBAMMEnNlcnZlci5leGFtcGxlLmNvbTAgFw0yNjExMDgxNjEwNDJa
++GA8yMDUxMTEwMjE2MTA0MlowSzETMBEGCgmSJomT8ixkARkWA0NPTTEXMBUGCgmS
+ JomT8ixkARkWB0VYQU1QTEUxGzAZBgNVBAMMEnNlcnZlci5leGFtcGxlLmNvbTCC
+ ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANAFvDpR+Cn1FaHwXlvkRuGK
+ gmOSUqbmEDGEfrnGpRq/jiHZrTlrKX5GKAIrf573iAMMfabbhBygaX1DHd2ELR8U
+@@ -10,11 +10,12 @@ wBoH+E/ymXCT4E5+npVweOVnelVE0XsQcB8xvrVuLbN7obJvb4VymVqN6J/UjMrL
+ PTnsprQZh4ceUH5mpLKT3r1uuznIVfyy9XZ0BBqS8ub9muuixwzeO9j/YpdnQcNt
+ tJV4iXEK7VgT9WDnWduxa6sSWz613ap4MaLykmFqfcr6tNGkY155chZEsOuUYTkh
+ +96xAWw/305drhoLbORvQdK6yZ5ADeeuf2sQvUPNGGMl5yX15BDIBbsvwW0FTGEC
+-AwEAAaMhMB8wHQYDVR0OBBYEFGZAbCAj2xhWObgNfp8Y62+mXx8WMA0GCSqGSIb3
+-DQEBCwUAA4IBAQAPuwday2FnYkbWOHqxZqs3DJ1sJeOiwHvHaDvOkBDiNN/4ESFx
+-d5mag5w2P8I+Ntc0s1+2JiHwecA1cvqhsQsKqqs3G1vFqs8uLT4gz4Ycdh1RqUCI
+-Whsohfmfs4fJBrSw8UppKz0Iqkt7HigJHZFFYDKmRgGVyN1LVlCO5ziGg1mA8XDH
+-Hy3Tz/VDsfO9uVetr4I1CIodezhd8c77WkGSVaoSf9k5YDqPfqUwuBmuSqp9T3is
+-DxdUjYEfQPHYCam2DQHKd4bQ5WiL4net9oc4dnpz3hUmkJF5Q3Z4dz+Lm8WU08bg
+-eKpdhHu657xSFs00t8lX/dRB7zy9WfxcgMZ8
++AwEAAaNmMGQwCQYDVR0TBAIwADATBgNVHSUEDDAKBggrBgEFBQcDATAjBgNVHREE
++HDAahwTAqAEKghJzZXJ2ZXIuZXhhbXBsZS5jb20wHQYDVR0OBBYEFGZAbCAj2xhW
++ObgNfp8Y62+mXx8WMA0GCSqGSIb3DQEBCwUAA4IBAQClfG8qI1gmyNpoX/7FlLi/
++hKN4voWSZa5/EEP/SWY4p9eOWh4FLXvyxsKLCWAJj0pStBR+xyuq8u/MGjXzYtPS
++7d50umqrwzyMIeLSvGzAOauaIpPZMARgT+u/4OeARjAvfokiLzMRptB0RtRXrwkf
++FL+JLXRBYcPLn37b2xlMCeFne5D0tMqkpiawjUcN2C4uExOHh2Loc9ZByqbWzkyk
++Ys3sEmbb0EkolvQgciE8lxE48iUPSlH2g/SAbOWPMqxE7m80Bo0Qo2wW60jYeSjN
++Il4fwbG6gObek0CHyF44JQPUVm+HVm5S3Rg1YH4+GpNieV2zp9826O2Jr2j2Yk3+
+ -----END CERTIFICATE-----
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.90.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.90.1.bb
index ca701cc89a..b214bab78c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.90.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.90.1.bb
@@ -30,6 +30,9 @@ inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "\
             file://run-ptest \
+            file://0001-openssl-Fix-socket-timeouts-and-close-with-OpenSSL-4.patch \
+            file://0002-openssl-Set-a-session-ID-context-on-the-server.patch \
+            file://0003-tests-Add-a-subjectAltName-to-server-self.pem.patch \
             "
 
 FILES:${PN} += "\
