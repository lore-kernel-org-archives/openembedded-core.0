Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3734.1793405753130271752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=dasdQZqE;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso13600865e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405751; x=1794010551; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iqc2vzaQIzK+nfRbs2eMIBbk2tfwKCYAmM3CG1oCDO0=;
        b=dasdQZqELBRaFkwYbfvkeYdEgPIRcqsiGAoFTuBs3RUTITwUcTAIJJjjkDkQyNj11a
         m+uxzEQHiG+9fqZmjqI4xftOblWSUvzBCT2NdlWRbhdxAekE7Gjcg5BaSPJGxvUo4c65
         2V+YX9cQKeDqKLOrTI2vi9y6tF6DLoyQilY069ZFOVIU+uJhC6uHxbwZWmZHbzKouYiO
         h3QLK8bowCIkpkQE+N70fxVJCLc83H4T5Gk+lVRuvnYa3lSAYDDSnYx7yHo44dYpHAhm
         /yL8BEBwgqxYr5/+5j170a1Lv/zGfDayjwOuwEXzgzyPes4eEXm8M2whRTkMx+iKZHwM
         eX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405751; x=1794010551;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iqc2vzaQIzK+nfRbs2eMIBbk2tfwKCYAmM3CG1oCDO0=;
        b=IiqJUY7Ll6Ol2ZEVB//3vMArnBtgZgpDqeDM5dKRVddVCsOGIJiKeQxEUlliaQEAYo
         vbrNZ6kRscB6iUK2UOzJ8SdHCMvcN8dGc+ndJM8ISsADcr6hFJm2cqgQ9H0KxOzTtBMC
         2TF0QeGXyqWQsBIGJVY3hohUJvYO7pC3SFj3IsDiWPvUmAxx5oi6Ta0o3mbDlmRXl9JI
         lOFoxDOPVwpcxJh227Ucoqvy8e/JMf6JDelzffsrW9AQLnyBwx6xQ73zYMAV3zI9BesF
         UZS99RAOmvmpguaGvPgMjkfJ5l1pUkux0PnD6Vw1+scdu8UoR4bhjD5gnR92vdW/NQcJ
         FbmQ==
X-Gm-Message-State: AFq9FYIiJsaPBgOfh8nILulZAa+NDmuiB17ISm/ZtnVD3gd5FWFDRkR7
	J4dJ6M4dK4p3laege2AzmzlMOdiOqJEQ5G6bfVDPT3XY8mttjf2z9eiL6/hFmXpMVFeS18A/PO1
	y/xexTWA=
X-Gm-Gg: AYBFou1A9tX/1LqgdPE6w/hLDvGWCux3CgdMfjqiPbkX9WXv5CO90BGDViog1k4dlT4
	lsafWRwwEftuLeiqwQi8tNdJ0/MitL3mlOJAs71lWCPSY2jp7OGdQ+03ovmYK257D4uagozjs4J
	g3uGsI+1vw6oGYcBhUAzClNQuqV7rSthSl5LdIUnozsgEmnmbecaiXvaWag4MsmakACISUjmHdW
	grDVsl5P2WW43HG5th8OmE0vrnc4Oy0Omfy1fu9k31/PYTT77vmHg28NN5OHIYLX7vQvcrVk1g1
	TNk+Q9zsXP6ckJJDQzuLcb75gcRkNmSaTv4nrijV/nqiUOfYxrTX1JqlwDJi8OtI1nV4RSd0V3W
	B1mnRiwbXPMLsfwhfL5QIE7pPWR9b+sI+eV3n2L2ZlLHO5Rq2X99uVfmdQj0Sr/+ky1o/KMfgr0
	c3b5TyPPqTVrGon5yVcL/jVEIhSCJXLIKvI0xSQuOgLgSamI9HSk2ssYEtgqrKY1CREZjibL8Yj
	LK6Zy0oimEDlDw9UuWL4gK7PX3wuqbIRMme+/8m5IUpRY0jhfs/EJe4ZLjISB1nd/NVgVLU8o3h
	308Kq/pOJYogoSA65Wb0KsNwb5kkvJ6uEGYDId4f7s5vZL5Gp58Rc01a1bwfVRqzpIk81oLJrkq
	DnXXshIC9Jz9FNm4eboxo/C3HmRvUVyOJQ7s31hm2imZyN/zhTQ==
X-Received: by 2002:a05:600c:698d:b0:4a2:994:575c with SMTP id 5b1f17b1804b1-4ac185bcc4emr86567795e9.34.1793405751332;
        Fri, 30 Oct 2026 17:15:51 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:50 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/55] glib-2.0: patch CVE-2026-15588
Date: Sat, 31 Oct 2026 01:14:35 +0100
Message-ID: <9e99d78d51d56e29a55009d7fb2812568ea0aa9e.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249089
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-15588

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-15588.patch    | 267 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 2 files changed, 268 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-15588.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-15588.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-15588.patch
new file mode 100644
index 00000000000..e5ff0e87d36
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-15588.patch
@@ -0,0 +1,267 @@
+From 4235f7b42ba51d6fdb4abd7c4276031802f39834 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Sat, 4 Jul 2026 18:13:08 +0100
+Subject: [PATCH] gdbusauth: Limit length of lines read from client
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The client isn’t trusted at this point, and there was previously nothing
+limiting how long a line `GDBusAuth` would read. So an untrusted client
+could exhaust the server’s memory by sending anything except `\r\n`.
+
+Fix that by applying a reasonably length limit when reading a line, and
+add a unit test.
+
+Spotted by Gitee Codepecker Lab.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+Fixes: #3985
+
+CVE: CVE-2026-15588
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/4235f7b42ba51d6fdb4abd7c4276031802f39834]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gdbusauth.c        |  44 +++++++++++++++
+ gio/tests/gdbus-auth.c | 119 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 163 insertions(+)
+
+diff --git a/gio/gdbusauth.c b/gio/gdbusauth.c
+index 9e31c8318..a5938c969 100644
+--- a/gio/gdbusauth.c
++++ b/gio/gdbusauth.c
+@@ -262,6 +262,21 @@ find_mech_by_name (GDBusAuth *auth,
+   return ret;
+ }
+ 
++static size_t
++get_longest_mechanism_name_length (GDBusAuth *auth)
++{
++  size_t len = 0;
++
++  for (GList *l = auth->priv->available_mechanisms; l != NULL; l = l->next)
++    {
++      Mechanism *m = l->data;
++
++      len = MAX (len, strlen (m->name));
++    }
++
++  return len;
++}
++
+ GDBusAuth  *
+ _g_dbus_auth_new (GIOStream *stream)
+ {
+@@ -270,6 +285,20 @@ _g_dbus_auth_new (GIOStream *stream)
+                        NULL);
+ }
+ 
++/* Arbitrarily chosen limit on the length of a DATA command payload, to prevent
++ * unbounded reads from malicious clients.
++ *
++ *  - The ANONYMOUS mechanism doesn’t use DATA.
++ *  - The EXTERNAL mechanism just uses it to transfer a decimal-encoded UID.
++ *  - The DBUS_COOKIE_SHA1 mechanism transfers a challenge and a SHA1 hash. The
++ *    hash is bounded in length, but the challenge is not, so could potentially
++ *    hit this limit. It doesn’t seem unreasonable to bound the challenge to
++ *    ~4KB though. GDBus itself generates a 16 byte challenge.
++ *
++ * See https://dbus.freedesktop.org/doc/dbus-specification.html#auth-command-data
++ */
++#define MAX_DATA_PAYLOAD_LENGTH_BYTES 4096
++
+ /* ---------------------------------------------------------------------------------------------------- */
+ /* like g_data_input_stream_read_line() but sets error if there's no content to read */
+ static gchar *
+@@ -307,6 +336,7 @@ _my_g_data_input_stream_read_line (GDataInputStream  *dis,
+  */
+ static gchar *
+ _my_g_input_stream_read_line_safe (GInputStream  *i,
++                                   size_t         max_line_length,
+                                    gsize         *out_line_length,
+                                    GCancellable  *cancellable,
+                                    GError       **error)
+@@ -316,11 +346,22 @@ _my_g_input_stream_read_line_safe (GInputStream  *i,
+   gssize num_read;
+   gboolean last_was_cr;
+ 
++  g_assert (max_line_length <= SIZE_MAX - 2);
++
+   str = g_string_new (NULL);
+ 
+   last_was_cr = FALSE;
+   while (TRUE)
+     {
++      if (str->len >= max_line_length + 2  /* allow for \r\n */)
++        {
++          g_set_error_literal (error,
++                               G_IO_ERROR,
++                               G_IO_ERROR_FAILED,
++                               _("Malformed D-Bus authentication line"));
++          goto fail;
++        }
++
+       num_read = g_input_stream_read (i,
+                                       &c,
+                                       1,
+@@ -1073,6 +1114,7 @@ _g_dbus_auth_run_server (GDBusAuth              *auth,
+         case SERVER_STATE_WAITING_FOR_AUTH:
+           debug_print ("SERVER: WaitingForAuth");
+           line = _my_g_input_stream_read_line_safe (g_io_stream_get_input_stream (auth->priv->stream),
++                                                    strlen ("AUTH ") + get_longest_mechanism_name_length (auth) + strlen (" ") + MAX_DATA_PAYLOAD_LENGTH_BYTES,
+                                                     &line_length,
+                                                     cancellable,
+                                                     error);
+@@ -1294,6 +1336,7 @@ _g_dbus_auth_run_server (GDBusAuth              *auth,
+         case SERVER_STATE_WAITING_FOR_DATA:
+           debug_print ("SERVER: WaitingForData");
+           line = _my_g_input_stream_read_line_safe (g_io_stream_get_input_stream (auth->priv->stream),
++                                                    strlen ("DATA ") + MAX_DATA_PAYLOAD_LENGTH_BYTES,
+                                                     &line_length,
+                                                     cancellable,
+                                                     error);
+@@ -1336,6 +1379,7 @@ _g_dbus_auth_run_server (GDBusAuth              *auth,
+         case SERVER_STATE_WAITING_FOR_BEGIN:
+           debug_print ("SERVER: WaitingForBegin");
+           line = _my_g_input_stream_read_line_safe (g_io_stream_get_input_stream (auth->priv->stream),
++                                                    MAX (strlen ("BEGIN"), strlen ("NEGOTIATE_UNIX_FD")),
+                                                     &line_length,
+                                                     cancellable,
+                                                     error);
+diff --git a/gio/tests/gdbus-auth.c b/gio/tests/gdbus-auth.c
+index 657571be3..3323d6eeb 100644
+--- a/gio/tests/gdbus-auth.c
++++ b/gio/tests/gdbus-auth.c
+@@ -263,6 +263,124 @@ temp_dbus_keyrings_teardown (void)
+   g_unsetenv ("G_DBUS_COOKIE_SHA1_KEYRING_DIR_IGNORE_PERMISSION");
+ }
+ 
++static void
++async_result_cb (GObject      *obj,
++                 GAsyncResult *result,
++                 void         *user_data)
++{
++  GAsyncResult **result_out = user_data;
++
++  g_assert (result_out != NULL);
++  g_assert (*result_out == NULL);
++
++  *result_out = g_object_ref (result);
++  g_main_context_wakeup (g_main_context_get_thread_default ());
++}
++
++static gboolean
++server_new_connection_unexpected_cb (GDBusServer     *server,
++                                     GDBusConnection *connection,
++                                     void            *user_data)
++{
++  g_assert_not_reached ();
++  return FALSE;
++}
++
++static void
++test_auth_server_read_limit (void)
++{
++  GDBusServer *server = NULL;
++  unsigned long new_connection_id = 0;
++  const char *server_address;
++  GIOStream *client_stream = NULL;
++  GOutputStream *client_output_stream;
++  GInputStream *client_input_stream;
++  GAsyncResult *result = NULL;
++  char *write_buffer = NULL;
++  char read_buffer[100];
++  ssize_t read_len;
++  size_t bytes_written;
++  GError *local_error = NULL;
++
++  g_test_summary ("Test that GDBusServer limits the lengths of reads it does during auth from a client");
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/3985");
++
++  server = server_new_for_mechanism (NULL);
++
++  new_connection_id = g_signal_connect (server,
++                                        "new-connection",
++                                        G_CALLBACK (server_new_connection_unexpected_cb),
++                                        NULL);
++  server_address = g_dbus_server_get_client_address (server);
++  g_dbus_server_start (server);
++
++  /* Start connecting as a client */
++  g_dbus_address_get_stream (server_address, NULL, async_result_cb, &result);
++
++  while (result == NULL)
++    g_main_context_iteration (NULL, TRUE);
++
++  client_stream = g_dbus_address_get_stream_finish (result, NULL, &local_error);
++  g_assert_no_error (local_error);
++  g_clear_object (&result);
++
++  /* Send an over-long AUTH line, maliciously */
++  client_output_stream = g_io_stream_get_output_stream (client_stream);
++  client_input_stream = g_io_stream_get_input_stream (client_stream);
++
++  write_buffer = g_strdup_printf ("AUTH DBUS_COOKIE_SHA1 context%0*d 123 456\r\n", 5000, 0);
++
++  g_output_stream_write_all_async (client_output_stream,
++                                   write_buffer,
++                                   strlen (write_buffer),
++                                   G_PRIORITY_DEFAULT,
++                                   NULL,
++                                   async_result_cb,
++                                   &result);
++
++  while (result == NULL)
++    g_main_context_iteration (NULL, TRUE);
++
++  g_output_stream_write_all_finish (client_output_stream, result, &bytes_written, &local_error);
++  g_assert_no_error (local_error);
++  g_assert_cmpuint (bytes_written, ==, strlen (write_buffer));
++  g_clear_object (&result);
++
++  g_clear_pointer (&write_buffer, g_free);
++
++  /* Authentication should have been rejected, so reading or writing the stream
++   * should now fail. */
++  read_len = g_input_stream_read (client_input_stream,
++                                  read_buffer,
++                                  sizeof (read_buffer),
++                                  NULL,
++                                  &local_error);
++  g_assert_error (local_error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++  g_assert_cmpint (read_len, <, 0);
++  g_clear_error (&local_error);
++
++  write_buffer = g_strdup_printf ("AUTH\r\n");
++
++  g_output_stream_write_all (client_output_stream,
++                             write_buffer,
++                             strlen (write_buffer),
++                             &bytes_written,
++                             NULL,
++                             &local_error);
++  g_assert_error (local_error, G_IO_ERROR, G_IO_ERROR_CONNECTION_CLOSED);
++  g_assert_cmpuint (bytes_written, ==, 0);
++  g_clear_error (&local_error);
++
++  g_clear_pointer (&write_buffer, g_free);
++
++  /* Cleanup */
++  g_clear_object (&client_stream);
++  g_dbus_server_stop (server);
++
++  g_clear_signal_handler (&new_connection_id, server);
++  g_clear_object (&server);
++}
++
+ /* ---------------------------------------------------------------------------------------------------- */
+ 
+ int
+@@ -282,6 +400,7 @@ main (int   argc,
+   g_test_add_func ("/gdbus/auth/server/ANONYMOUS",        auth_server_anonymous);
+   g_test_add_func ("/gdbus/auth/server/EXTERNAL",         auth_server_external);
+   g_test_add_func ("/gdbus/auth/server/DBUS_COOKIE_SHA1", auth_server_dbus_cookie_sha1);
++  g_test_add_func ("/gdbus/auth/server/read-limit", test_auth_server_read_limit);
+ 
+   /* TODO: we currently don't have tests for
+    *
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 70b0b74e881..62f173739cf 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -58,6 +58,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58015_p2.patch \
            file://CVE-2026-58015_p3.patch \
            file://CVE-2026-58015_p4.patch \
+           file://CVE-2026-15588.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
