Return-Path: <jason.stasiak@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8B0C61DD3
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 21:13:47 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6919.1788210820702794394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 14:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HrGZEw4b;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: jason.stasiak@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so3194963a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 14:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210820; x=1788815620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5fPR0T8oZaFTD6mqj+j2QOSALs2XOHsLiPB1pw8GW8=;
        b=HrGZEw4bptFMJsgNX5HIw9RXjaZr3Vccr5FPMgBr2BKq36G+vqtDftAypdBwdbdwdt
         PSKVbs3HkUs9POC28DBuNTWScETvQX91H1zGTdLsVqvLU6OrOFRP696NRM9nuGWnG+nb
         1ZfWGIEaohPCiYXWJABDBA52tH1PN0H9hyfRCbJoRJ4QRkmjGX5s9+7OQGGCn0LeZ0ly
         8d4MorE3upJAJx0BGMGWPNIWMoFi4cF7MCmJM5YgrhFndFRG0dLhwONhK0a5vko3qpNA
         nnLIuZsydG1337vFIiyAZgwJLXh8CGt8LtgWZGi4AmuScupBrU61I/0H8pNVeM4AKjKu
         Q85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210820; x=1788815620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+5fPR0T8oZaFTD6mqj+j2QOSALs2XOHsLiPB1pw8GW8=;
        b=tH+xPvCwbEZuHdujxvHIt1wNc/WZM1Jtnvv3sMuLw/6cRxWcymugNbMxeTgo9OmNls
         wAdiEiZNvUgYpGmgFxGGGzIvwgMKo7bQME93wEbcs1mk3bhvJvnbNZEd90+zuux2vvSW
         t8p+y+9HTTk+g+ijsvbeO5pz/M4MOu9L4kMKxmj41wq4LD4Hfowi8sKJuxd9SYgaKYuQ
         /z1sfUdP98AwpnnkqPAZUpGtxxsEpqDu3zS/XI8RtaLKUWAqUtf6CUFD+mJgEyjjWNS0
         Cp842+f+jkjmsNlAHAopIo4dZoP2olT1iKQbVLcozIY2ukpNSgGeOZWf/XAs7PHqKufv
         /Itw==
X-Gm-Message-State: AFuF++lUFCWYU2fG3uiLZKHyZZ86TGM0ekWy7hiE7nA/49MAHG/LRJbU
	0LY6Q00+JzBJqsidnu0O9gvo/YicrnHWJH0v+sUrrXjgtjed2PA3D593F0LvpQ==
X-Gm-Gg: AR+sD10Zc6UQXd1YvaYjG2qjTh2+KyNYBbocUao/dIHhAaBi1RajFqQxYSfiswPOoip
	P0Wk5d1fg5XW9as6/f2/4KKT4BGawZHqw3SGjk8zDgIbwAScxInn1xCiVmUXd1PY1nHma5OoR1t
	9UJEs0rZBr0jOo/4yyj81JIfGSVuLYk/o5XnwRoZpsgeUzSskD8se/glDh3q8oBjY/9FBtR+3Yp
	PwjUs88guSenb8bBg8kyqzrJB7mX/m2aMCXSQCPE9TGgHbI5VeYGeH/6RoPfyteAHde9ITDihBF
	ABHb/B1O6t46imMjOk4MNaGDiHjhPU8t88PeEdxZoOEImuTJkpwcqIUWLqWMDmupl/Q/5ws1LW2
	6N56LYpcGBft9pHHMT923RXYeF16pFtmVEnHZyHPloWBXB8NsbI1O8eMlHrc+jTQGsQ816Ao8i/
	Qt2p8SrykdnC6UR6IDhBpI7bzONnMQUmNed3EZzQJkN5f0FcQdMMwXuXN9kbeIbyLR0y6fRJHwG
	cgSSWcxC2ZX
X-Received: by 2002:a05:6a20:2586:b0:3d3:b02a:7252 with SMTP id adf61e73a8af0-3d3b02a76a6mr28713453637.28.1788210819656;
        Mon, 31 Aug 2026 14:13:39 -0700 (PDT)
Received: from CHA-FQKPM83.ad.garmin.com ([65.175.40.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e907fsm29018469eec.25.2026.08.31.14.13.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:13:39 -0700 (PDT)
From: Jason Stasiak <jason.stasiak@gmail.com>
X-Google-Original-From: Jason Stasiak <jason.stasiak@garmin.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] libsoup-2.4: fix CVE-2026-1467
Date: Mon, 31 Aug 2026 14:13:24 -0700
Message-ID: <20260831211324.635049-1-jason.stasiak@garmin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 21:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244777

From: Jason Stasiak <jason.stasiak@gmail.com>

Backport fix for CVE-2026-1467 from meta-oe to OE-core.
Update CVE patch to address a use case where a uri validation
failure was not handled.

(From meta-oe rev: 07d67228162018f5f619dce7183f85e79293378d)

Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
---
 .../libsoup/libsoup-2.4/CVE-2026-1467.patch   | 276 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 277 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1467.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1467.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1467.patch
new file mode 100644
index 0000000000..c9cc9a19da
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-1467.patch
@@ -0,0 +1,276 @@
+From 361d797281f7ecfce4c2fb642c40227d66e541b5 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 21 Apr 2026 17:10:37 +0800
+Subject: [PATCH] Fix CVE-2026-1467
+
+CVE: CVE-2026-1467
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6dfe506618d2d5856618e5c0f85bd93386dc8012]
+
+The original backport patch targets libsoup3. This patch has been
+adapted accordingly for libsoup2, refer the openSUSE patch, see [1]
+
+[1] https://www.suse.com/security/cve/CVE-2026-1467.html
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Update soup_session_connect_async(...) in soup-session.c to handle
+the case where soup_message_new_from_uri() fails and returns a NULL
+msg. Adjust connection unit tests to account for the change in
+soup_session_connect_async(...).
+
+Backport the uri-parsing uri validation unit tests from the upstream
+libsoup3 patch
+
+Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
+---
+ libsoup/soup-auth.c      |  2 +-
+ libsoup/soup-message.c   |  5 +++-
+ libsoup/soup-session.c   | 13 +++++++++
+ libsoup/soup-uri.c       | 60 ++++++++++++++++++++++++++++++++++++++++
+ libsoup/soup-uri.h       |  2 ++
+ tests/connection-test.c  |  8 ++++--
+ tests/uri-parsing-test.c | 41 +++++++++++++++++++++++++++
+ 7 files changed, 127 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-auth.c b/libsoup/soup-auth.c
+index 1896aab7..e205fe31 100644
+--- a/libsoup/soup-auth.c
++++ b/libsoup/soup-auth.c
+@@ -535,7 +535,7 @@ GSList *
+ soup_auth_get_protection_space (SoupAuth *auth, SoupURI *source_uri)
+ {
+ 	g_return_val_if_fail (SOUP_IS_AUTH (auth), NULL);
+-	g_return_val_if_fail (source_uri != NULL, NULL);
++	g_return_val_if_fail (soup_uri_is_valid (source_uri), NULL);
+ 
+ 	return SOUP_AUTH_GET_CLASS (auth)->get_protection_space (auth, source_uri);
+ }
+diff --git a/libsoup/soup-message.c b/libsoup/soup-message.c
+index da32b42f..cc4f22b6 100644
+--- a/libsoup/soup-message.c
++++ b/libsoup/soup-message.c
+@@ -1044,7 +1044,7 @@ soup_message_new (const char *method, const char *uri_string)
+ 	uri = soup_uri_new (uri_string);
+ 	if (!uri)
+ 		return NULL;
+-	if (!uri->host) {
++	if (!soup_uri_is_valid (uri)) {
+ 		soup_uri_free (uri);
+ 		return NULL;
+ 	}
+@@ -1066,6 +1066,8 @@ soup_message_new (const char *method, const char *uri_string)
+ SoupMessage *
+ soup_message_new_from_uri (const char *method, SoupURI *uri)
+ {
++	g_return_val_if_fail (soup_uri_is_valid (uri), NULL);
++
+ 	return g_object_new (SOUP_TYPE_MESSAGE,
+ 			     SOUP_MESSAGE_METHOD, method,
+ 			     SOUP_MESSAGE_URI, uri,
+@@ -1676,6 +1678,7 @@ soup_message_set_uri (SoupMessage *msg, SoupURI *uri)
+ 	SoupMessagePrivate *priv;
+ 
+ 	g_return_if_fail (SOUP_IS_MESSAGE (msg));
++	g_return_if_fail (soup_uri_is_valid (uri));
+ 	priv = soup_message_get_instance_private (msg);
+ 
+ 	if (priv->uri)
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 4472bb91..fadd5cd2 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -5106,6 +5106,7 @@ soup_session_connect_async (SoupSession                       *session,
+         SoupMessageQueueItem *item;
+         ConnectAsyncData *data;
+         GTask *task;
++        GError *error = NULL;
+ 
+         g_return_if_fail (SOUP_IS_SESSION (session));
+         g_return_if_fail (!SOUP_IS_SESSION_SYNC (session));
+@@ -5116,6 +5117,18 @@ soup_session_connect_async (SoupSession                       *session,
+         task = g_task_new (session, cancellable, callback, user_data);
+ 
+         msg = soup_message_new_from_uri (SOUP_METHOD_HEAD, uri);
++
++        /* Trigger task to notify caller when soup_message can not be constructed */
++        if ( msg == NULL ) {
++                  g_set_error( &error,
++                             G_IO_ERROR,
++                             G_IO_ERROR_INVALID_ARGUMENT,
++                             "Failed to construct soup message from uri");
++                g_task_return_error (task, error);
++                g_object_unref (task);
++                return;
++        }
++
+         soup_message_set_flags (msg, SOUP_MESSAGE_NEW_CONNECTION);
+         g_signal_connect_object (msg, "finished",
+                                  G_CALLBACK (connect_async_message_finished),
+diff --git a/libsoup/soup-uri.c b/libsoup/soup-uri.c
+index bdb7a175..d781ff11 100644
+--- a/libsoup/soup-uri.c
++++ b/libsoup/soup-uri.c
+@@ -1342,6 +1342,66 @@ soup_uri_host_equal (gconstpointer v1, gconstpointer v2)
+ 	return g_ascii_strcasecmp (one->host, two->host) == 0;
+ }
+ 
++static gboolean
++is_valid_character_for_host (char c)
++{
++        static const char forbidden_chars[] = { '\t', '\n', '\r', ' ', '#', '/', ':', '<', '>', '?', '@', '[', '\\', ']', '^', '|' };
++        int i;
++
++        for (i = 0; i < G_N_ELEMENTS (forbidden_chars); ++i) {
++                if (c == forbidden_chars[i])
++                        return FALSE;
++        }
++
++        return TRUE;
++}
++
++static gboolean
++is_host_valid (const char* host)
++{
++        int i;
++        gboolean is_valid;
++        char *ascii_host = NULL;
++
++        if (!host || !host[0])
++                return FALSE;
++
++        if (g_hostname_is_non_ascii (host)) {
++                ascii_host = g_hostname_to_ascii (host);
++                if (!ascii_host)
++                  return FALSE;
++
++                host = ascii_host;
++        }
++
++        if ((g_ascii_isdigit (host[0]) || strchr (host, ':')) && g_hostname_is_ip_address (host)) {
++                g_free (ascii_host);
++                return TRUE;
++        }
++        is_valid = TRUE;
++        for (i = 0; host[i] && is_valid; i++)
++                is_valid = is_valid_character_for_host (host[i]);
++
++        g_free (ascii_host);
++
++        return is_valid;
++}
++
++gboolean
++soup_uri_is_valid (SoupURI *uri)
++{
++        if (!uri)
++                return FALSE;
++
++        if (!is_host_valid (soup_uri_get_host (uri)))
++                return FALSE;
++
++        /* FIXME: validate other URI components? */
++
++        return TRUE;
++}
++
++
+ gboolean
+ soup_uri_is_http (SoupURI *uri, char **aliases)
+ {
+diff --git a/libsoup/soup-uri.h b/libsoup/soup-uri.h
+index 8015e4f1..64099c3c 100644
+--- a/libsoup/soup-uri.h
++++ b/libsoup/soup-uri.h
+@@ -133,6 +133,8 @@ guint       soup_uri_host_hash             (gconstpointer key);
+ SOUP_AVAILABLE_IN_2_28
+ gboolean    soup_uri_host_equal            (gconstpointer v1,
+ 					    gconstpointer v2);
++SOUP_AVAILABLE_IN_2_68
++gboolean     soup_uri_is_valid             (SoupURI       *uri);
+ 
+ #define   SOUP_URI_IS_VALID(uri)       ((uri) && (uri)->scheme && (uri)->path)
+ #define   SOUP_URI_VALID_FOR_HTTP(uri) ((uri) && ((uri)->scheme == SOUP_URI_SCHEME_HTTP || (uri)->scheme == SOUP_URI_SCHEME_HTTPS) && (uri)->host && (uri)->path)
+diff --git a/tests/connection-test.c b/tests/connection-test.c
+index 08400fb9..21ffd6f9 100644
+--- a/tests/connection-test.c
++++ b/tests/connection-test.c
+@@ -1135,11 +1135,15 @@ do_connection_connect_test (void)
+         } else
+                 debug_printf (1, "    wss -- SKIPPING\n");
+ 
++        g_test_expect_message ("libsoup",
++                               G_LOG_LEVEL_CRITICAL,
++                               "*soup_message_new_from_uri*assertion*soup_uri_is_valid*failed*");
+         debug_printf (1, "    file\n");
+         file_uri = soup_uri_new ("file:///foo/bar");
+         do_one_connection_connect_fail_test (session, file_uri,
+-                                             G_RESOLVER_ERROR, G_RESOLVER_ERROR_NOT_FOUND,
+-                                             "r");
++                                             G_IO_ERROR, G_IO_ERROR_INVALID_ARGUMENT,
++                                             "");
++        g_test_assert_expected_messages ();
+ 
+         debug_printf (1, "    wrong http (invalid port)\n");
+         wrong_http_uri = soup_uri_new (HTTP_SERVER);
+diff --git a/tests/uri-parsing-test.c b/tests/uri-parsing-test.c
+index 07ef96b2..68a4940d 100644
+--- a/tests/uri-parsing-test.c
++++ b/tests/uri-parsing-test.c
+@@ -575,6 +575,46 @@ test_uri_decode (void)
+ 	g_free (decoded);
+ }
+ 
++static struct {
++	const char *host;
++	gboolean valid;
++} valid_tests[] = {
++	{ "example.com", TRUE },
++	{ "localhost", TRUE },
++	{ "127.0.0.1", TRUE },
++	{ "::1", TRUE },
++	{ "::192.168.0.10", TRUE },
++	{ "FEDC:BA98:7654:3210:FEDC:BA98:7654:3210", TRUE },
++	{ "\xe4\xbe\x8b\xe5\xad\x90.\xe6\xb5\x8b\xe8\xaf\x95", TRUE },
++	{ "012x:4567:89AB:cdef:3210:7654:ba98:FeDc", FALSE },
++	{ "\texample.com", FALSE },
++	{ "example.com\n", FALSE },
++	{ "\r\nexample.com", FALSE },
++	{ "example .com", FALSE },
++	{ "example:com", FALSE },
++	{ "exampl<e>.com", FALSE },
++	{ "exampl[e].com", FALSE },
++	{ "exampl^e.com", FALSE },
++	{ "examp|e.com", FALSE },
++};
++
++static void
++do_valid_tests (void)
++{
++	int i;
++
++	for (i = 0; i < G_N_ELEMENTS (valid_tests); ++i) {
++		SoupURI *uri;
++
++		uri = soup_uri_new ("http://example.com/");
++		soup_uri_set_host (uri, valid_tests[i].host);
++
++		g_assert_true (soup_uri_is_valid (uri) == valid_tests[i].valid);
++
++		soup_uri_free (uri);
++	}
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -589,6 +629,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/uri/normalization", do_normalization_tests);
+ 	g_test_add_func ("/uri/data", do_data_tests);
+ 	g_test_add_func ("/uri/decode", test_uri_decode);
++	g_test_add_func ("/uri/valid", do_valid_tests);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.55.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 7e00cd678a..ac715dc169 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4476.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2026-1467.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.55.0


