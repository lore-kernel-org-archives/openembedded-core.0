Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15200.1794296241877593415
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 23:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aYz1gbOU;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1931ff67a29so786250c88.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 23:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296241; x=1794901041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8EOvz2cSEs0uSZ/s/pFdMgyBl1bgy2dCEwwkJ+cmUTQ=;
        b=aYz1gbOUUCnAAw0MULbdMyKbuoQSV19RD+8iKVSUsSrAfUFrwwjuKIjkoxnGWsV0KB
         SIdi1erCD+UvZdlTeJ5r0973guWIAeCyFa+LLUKEJ+U2QLnfIHurS9w6D3VwwkY0Ouxo
         6Q30wa6Tgrdr351o7F3yrS8/Wyy9PxJOfMnH5OoowP/Jd7BLfwtVo4Kd9J9fdbMFH/+T
         ZcXFB9yU+SzTq2fjIXc0jNQ9sLWIBxRyoxraSG2tZ+W4BAOPEzfUzsu9oknAwpURXHr5
         FHkf7Nn8GgrWD158BcDd5zfy6N9RKGkwN/HXbiqHkcU4gvoxkpmxvg6ODC+N4xb55/6r
         BChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296241; x=1794901041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8EOvz2cSEs0uSZ/s/pFdMgyBl1bgy2dCEwwkJ+cmUTQ=;
        b=18kFNGgGC12PN44HYBsB57J6s9phEZeaXMxyVBTP46qqQ55+l5VsFvOI6B8rewMtxt
         DLL2DPflYQvlpjRtbPDzgXk0+j5df7uE87DxG0hc530UfPPbUU9/1TXitP0NgKBb2IBA
         PRFOlT0FjS66I9/Azj0x3QPK/ApPHn/ZRuvNay+ITq/vNMyMsy0bZtlvWeTE35Lv9VJj
         qvpkd7lDq0kQ3teXe9h4lmE2s1UuSKeAot6MrPDje190p9eiDj7yQOUU9MmWC2XMLpZe
         Nxg89ewd6Oe5C/XHyhDJWIfOdlubX+pcYEvH/fH3WNdl9/T875yuFiUgWK89OyEvo742
         7w3w==
X-Gm-Message-State: APuU4Z+vwsEJPqIayZZy45BoOh4UOV7+dJOV1Q2hL8VSKBPIrCuquq/7
	bDFaBeo5GB3ZbEyP6vhBDSASgadAzE7vmQFl0YPcMztX8Evvut3Ub1yLeKdAil8g+jw=
X-Gm-Gg: AYBFou0zeIAnmm2mMn8lRIHSlHOpkhC8ZoeADeyHlY3H34El6COuQ77yTcMWH47/tac
	AKBOt3AqhO0/yadoar1bImjxqwk/Qupw6mpSNZDiHZVpZTXqayOMJLW8y6v+bfyT1CiIGdR63mm
	ZqXkuywABEovsMWyjAi0w13fL4+aVMkUY/Uf5uFhjJiY0zVjKUsVWYGyP93gul/F5q19wMh7Z2y
	I7AI7UByor4Ln2Oqjg2zRE68Ts5tL7g6fb/kTOKnkWqHQxvnA/W559fo4deXBIg+S26HiNAKXi1
	a8BlMd+MNDQa+KwRe8d8UWpBUACuEdteTeLO3Mn1KdYhDIgQBwl+knKozItv7w8W+HTa7Oeb1yW
	Zy7LkGfxVrDTSgmKieQgqRkvpdVgL3DRRqPZYS8G+WxuCjPhmGy7RbKjsF/deIz5E117zp9WMnB
	nIvXie5MBnnQ268LiL9sPUVbPzRSiLNaY8Y3tZgHrBps1Uz4MVLfCMQYsWOXu6EoPKOSkqn9Ut2
	CjqjqznDmQbhInPlnRAt78MMi16zmiq+sRHUVNgrrrsxTrvvUzgZ3F61HY6SqaEg+v630FGz4uF
	EeDOs1Qwsssf+s+CP8CQIuvT4IhL0h0JxjmF+vv0ffhbq/OlY5tROVCGga1bdNbUN06+SRK20/U
	c7pyBVydps60msfGWj0QbqY26HbgCBUPYkTQj63PDUYcxHiG2WNeyQrJWiW3kbYv2KRezf4E6TS
	we7uL750sGXsmV37ezylpkklzpHBhI57ENSancaNFUOvblEbW8RwASs06TmYvzM7PgPOdmdHZxm
	9EiZt2JpiIxPt9bDlVXGUpYOWeR5ZaZX7Tc+xvmT1SF+8hw92V7FwQ47zfsr112TCVgyPlI05lt
	3+Kk
X-Received: by 2002:a05:7022:3c08:b0:195:49ee:94c7 with SMTP id a92af1059eb24-1b3b6057602mr2363421c88.8.1794296240922;
        Mon, 09 Nov 2026 23:37:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm7062138c88.5.2026.11.09.23.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:37:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] libsoup: Fix intermittent ssl-test ptest failure
Date: Mon,  9 Nov 2026 23:37:18 -0800
Message-ID: <20261110073718.3832919-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249908
Content-Type: text/plain; charset="utf-8"

/ssl/tls-interaction-msg fails now and then:

  ERROR:../sources/libsoup-3.8.1/tests/ssl-test.c:437:do_tls_interaction_msg_test:
  assertion failed (error == (g-tls-error-quark, 5)): Connection terminated
  unexpectedly (g-io-error-quark, 34)

With TLS 1.3 the client finishes the handshake before the server checks
its certificate. When the server rejects it and closes the connection,
the client can see the close before the alert, and if it was reading the
response libsoup reports G_IO_ERROR_PARTIAL_INPUT. The test already
accepts G_IO_ERROR_CONNECTION_CLOSED for this race, so accept partial
input too.

Under CPU load on qemux86-64, ssl-test failed 11 of 50 runs without the
patch and 0 of 50 with it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ccept-partial-input-when-the-client-.patch | 112 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.8.1.bb |   4 +-
 2 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/0001-tests-ssl-test-Accept-partial-input-when-the-client-.patch

diff --git a/meta/recipes-support/libsoup/libsoup/0001-tests-ssl-test-Accept-partial-input-when-the-client-.patch b/meta/recipes-support/libsoup/libsoup/0001-tests-ssl-test-Accept-partial-input-when-the-client-.patch
new file mode 100644
index 0000000000..00869ce842
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/0001-tests-ssl-test-Accept-partial-input-when-the-client-.patch
@@ -0,0 +1,112 @@
+From 2d43fb0049313bdb2025625196040a65d8583dc5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 01:53:35 -0800
+Subject: [PATCH] tests: ssl-test: Accept partial input when the client
+ certificate is rejected
+
+With TLS 1.3 the client finishes the handshake before the server checks
+the client certificate. When the server rejects it, it sends an alert
+and closes the connection, and depending on timing the client reports
+either the certificate error, a closed connection, or, if it was
+already reading the response, G_IO_ERROR_PARTIAL_INPUT:
+
+  ERROR:../tests/ssl-test.c:437:do_tls_interaction_msg_test: assertion
+  failed (error == (g-tls-error-quark, 5)): Connection terminated
+  unexpectedly (g-io-error-quark, 34)
+
+The tests already tolerate G_IO_ERROR_CONNECTION_CLOSED for this race;
+accept G_IO_ERROR_PARTIAL_INPUT as well. Seen with the openssl backend
+on a loaded qemux86-64 in 9 of 50 runs.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/586]
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/ssl-test.c | 25 ++++++++++++++++++-------
+ 1 file changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/tests/ssl-test.c b/tests/ssl-test.c
+index f31bc72..e67d571 100644
+--- a/tests/ssl-test.c
++++ b/tests/ssl-test.c
+@@ -29,6 +29,17 @@ static const StrictnessTest strictness_tests[] = {
+ 	  FALSE, FALSE, SOUP_STATUS_OK },
+ };
+
++/* When the server rejects the client certificate, it can close the
++ * connection before the client has read the alert. The client then sees
++ * a closed connection, or partial input if it was reading the response.
++ */
++static gboolean
++connection_closed_by_peer (const GError *error)
++{
++        return g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED) ||
++               g_error_matches (error, G_IO_ERROR, G_IO_ERROR_PARTIAL_INPUT);
++}
++
+ static gboolean
+ accept_certificate (SoupMessage *msg,
+ 		    GTlsCertificate *certificate,
+@@ -185,7 +196,7 @@ do_tls_interaction_test (gconstpointer data)
+ 	/* Sometimes glib-networking fails to report the error as certificate required
+ 	 * and we end up with connection reset by peer because the server closes the connection
+ 	 */
+-	if (!g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED))
++	if (!connection_closed_by_peer (error))
+ 		g_assert_error (error, G_TLS_ERROR, G_TLS_ERROR_CERTIFICATE_REQUIRED);
+ 	g_clear_error (&error);
+ 	g_bytes_unref (body);
+@@ -331,7 +342,7 @@ do_tls_interaction_msg_test (gconstpointer data)
+         /* Not handling request-certificate signal */
+         msg = soup_message_new_from_uri ("GET", uri);
+         body = soup_test_session_async_send (session, msg, NULL, &error);
+-        if (!g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED))
++        if (!connection_closed_by_peer (error))
+                 g_assert_error (error, G_TLS_ERROR, G_TLS_ERROR_CERTIFICATE_REQUIRED);
+         g_clear_error (&error);
+         g_bytes_unref (body);
+@@ -364,7 +375,7 @@ do_tls_interaction_msg_test (gconstpointer data)
+         msg = soup_message_new_from_uri ("GET", uri);
+         soup_message_add_flags (msg, SOUP_MESSAGE_NEW_CONNECTION);
+         body = soup_test_session_async_send (session, msg, NULL, &error);
+-        if (!g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED))
++        if (!connection_closed_by_peer (error))
+                 g_assert_error (error, G_TLS_ERROR, G_TLS_ERROR_CERTIFICATE_REQUIRED);
+         g_clear_error (&error);
+         g_bytes_unref (body);
+@@ -383,7 +394,7 @@ do_tls_interaction_msg_test (gconstpointer data)
+                           G_CALLBACK (request_certificate_cb),
+                           wrong_certificate);
+         body = soup_test_session_async_send (session, msg, NULL, &error);
+-        if (!g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED))
++        if (!connection_closed_by_peer (error))
+                 g_assert_error (error, G_TLS_ERROR, G_TLS_ERROR_CERTIFICATE_REQUIRED);
+         g_assert_null (body);
+         g_clear_error (&error);
+@@ -396,7 +407,7 @@ do_tls_interaction_msg_test (gconstpointer data)
+                           G_CALLBACK (request_certificate_cb),
+                           NULL);
+         body = soup_test_session_async_send (session, msg, NULL, &error);
+-        if (!g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED))
++        if (!connection_closed_by_peer (error))
+                 g_assert_error (error, G_TLS_ERROR, G_TLS_ERROR_CERTIFICATE_REQUIRED);
+         g_clear_error (&error);
+         g_bytes_unref (body);
+@@ -433,7 +444,7 @@ do_tls_interaction_msg_test (gconstpointer data)
+                           G_CALLBACK (request_certificate_async_cb),
+                           wrong_certificate);
+         body = soup_test_session_async_send (session, msg, NULL, &error);
+-        if (!g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED))
++        if (!connection_closed_by_peer (error))
+                 g_assert_error (error, G_TLS_ERROR, G_TLS_ERROR_CERTIFICATE_REQUIRED);
+         g_assert_null (body);
+         g_clear_error (&error);
+@@ -446,7 +457,7 @@ do_tls_interaction_msg_test (gconstpointer data)
+                           G_CALLBACK (request_certificate_async_cb),
+                           NULL);
+         body = soup_test_session_async_send (session, msg, NULL, &error);
+-        if (!g_error_matches (error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED))
++        if (!connection_closed_by_peer (error))
+                 g_assert_error (error, G_TLS_ERROR, G_TLS_ERROR_CERTIFICATE_REQUIRED);
+         g_assert_null (body);
+         g_clear_error (&error);
diff --git a/meta/recipes-support/libsoup/libsoup_3.8.1.bb b/meta/recipes-support/libsoup/libsoup_3.8.1.bb
index 241fc1ee78..241c00f595 100644
--- a/meta/recipes-support/libsoup/libsoup_3.8.1.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.1.bb
@@ -13,7 +13,9 @@ inherit gettext gnomebase upstream-version-is-even gobject-introspection gi-docg
 
 SRC_URI[archive.sha256sum] = "5013dcef9136f6f861e6529fca578af50c1f52a39219027fb5aff652d1371a04"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://0001-tests-ssl-test-Accept-partial-input-when-the-client-.patch \
+            "
 
 PROVIDES = "libsoup-3.0"
 
