Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6476FC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 11:14:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19553.1787656478600555611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 04:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HV7c1aPa;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5B1141A1813
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 11:14:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3064F604C4
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 11:14:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C0A511C7A0D9;
	Tue, 25 Aug 2026 13:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787656471; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=H7qX0vhjGNFv9AaPeAvYnRdJsSiDMfADTGhhCxR9kOI=;
	b=HV7c1aPacH7ukjDonps8XLFGmQ7HBeFL+0s0RxlwEkUFQJ9eas40mMErhAIEp7V/3g8bgO
	UfmTdL+lIVlbaUzdWxiYUI05JtJf5EKM1fMEy5lfHvH6HaLdtdCC8pjXqb+3BrLs9Pex28
	VXoi/0yamo+KwrToMl9Dr/DApnR4XbczePzwnUH81XRFm/l/3GbHbY5eA7B+7ZqfFHAO5C
	fhRxpITbryAxcizuq0YEDrmoE5pQ3Okor8qY0BhPGUashniDjYc/H0sfyGAMJj0yIEoopu
	QIwR+s9vrK6jbQ9ybE7BWLk4zedYxeQM5kdmUSzTf5zzFsc3X7bm03y6KGGtlg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 25 Aug 2026 13:14:18 +0200
Subject: [PATCH] gst-examples: Show warnings in gtk-play
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-mathieu-gst-warning-dialog-v1-1-ae24e8c03e45@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAl5jWoC/x3MSwrDIBAA0KuEWXfA2HykVylZTOPEDLRaNEkL4
 t0jWb7Ny5A4Cid4NBkiH5Ik+Ir21sC8kneMYqtBKz0oo3v80LYK7+jShj+KXrxDK/QODjv1Gpe
 7MrbtCWrwjbzI/8qfUyknLfLJqmwAAAA=
X-Change-ID: 20260825-mathieu-gst-warning-dialog-40b7f308d15a
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787656470; l=4619;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+egYNj2g+W4yTa+XB+vk7WcvbBHbT2UtCeA57/f4lvQ=;
 b=ZhDAoRO+PbBHm+VqyL7O49Tra3fBCDt8BvNvyq8V4alczBaGai6E6QoYAgb3DFGsijnSfDlck
 1+Xhrtr2RWzDWMlgQew10BUGd8f8EjI8CnY18nEbg9toHaUlnbChHdA
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 11:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244229

Show warnings in GTK player as a dialog box. This can be particularly
helpful when the user tries to play an unsupported format.

[YOCTO #12168]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
I'm not sure this is going to be accepted upstream, as gtk-play is
mostly example code.
---
 ...-gtk-show-player-warnings-in-a-dialog-box.patch | 69 ++++++++++++++++++++++
 .../gstreamer/gst-examples_1.28.5.bb               |  1 +
 2 files changed, 70 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
new file mode 100644
index 000000000000..b437b7a998f5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
@@ -0,0 +1,69 @@
+From 11d95270c5216bbe4d0f011c219374800b9ac627 Mon Sep 17 00:00:00 2001
+From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
+Date: Tue, 25 Aug 2026 11:03:34 +0200
+Subject: [PATCH] examples: gtk: show player warnings in a dialog box
+
+Right now, the player example fails silently on playback failures. Show
+a dialog box with the warning message coming from the gstplay instance.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/12346]
+Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
+---
+ .../gst-examples/playback/player/gtk/gtk-play.c   | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/playback/player/gtk/gtk-play.c b/subprojects/gst-examples/playback/player/gtk/gtk-play.c
+index fb83f6be29c5..0b87bcb03171 100644
+--- a/playback/player/gtk/gtk-play.c
++++ b/playback/player/gtk/gtk-play.c
+@@ -88,6 +88,7 @@ typedef struct
+   gboolean loop;
+   gboolean fullscreen;
+   gint toolbar_hide_timeout;
++  gboolean warning_shown;
+ 
+   GtkBuilder *toolbar_ui;
+ } GtkPlay;
+@@ -438,6 +439,7 @@ play_current_uri (GtkPlay * play, GList * uri, const gchar * ext_suburi)
+   else
+     gst_play_set_uri (play->player, uri->data);
+   play->current_uri = uri;
++  play->warning_shown = FALSE;
+   if (play->playing) {
+     if (play->inhibit_cookie)
+       gtk_application_uninhibit (GTK_APPLICATION (g_application_get_default ()),
+@@ -1740,6 +1742,22 @@ show_cb (GtkWidget * widget, gpointer user_data)
+   play_current_uri (self, g_list_first (self->uris), NULL);
+ }
+ 
++static void
++warning_cb (GstPlaySignalAdapter * adapter, GError * warning,
++    GstStructure * details, GtkPlay * self)
++{
++  GtkWidget *dialog;
++
++  if (!self->warning_shown) {
++    self->warning_shown = TRUE;
++    dialog = gtk_message_dialog_new (GTK_WINDOW (self),
++        GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_WARNING,
++        GTK_BUTTONS_CLOSE, "%s", warning->message);
++    gtk_dialog_run (GTK_DIALOG (dialog));
++    gtk_widget_destroy (dialog);
++  }
++}
++
+ static GObject *
+ gtk_play_constructor (GType type, guint n_construct_params,
+     GObjectConstructParam * construct_params)
+@@ -1774,6 +1791,8 @@ gtk_play_constructor (GType type, guint n_construct_params,
+       G_CALLBACK (media_info_updated_cb), self);
+   g_signal_connect (self->signal_adapter, "volume-changed",
+       G_CALLBACK (player_volume_changed_cb), self);
++  g_signal_connect (self->signal_adapter, "warning",
++      G_CALLBACK (warning_cb), self);
+ 
+   /* enable visualization (by default playbin uses goom) */
+   /* if visualization is enabled then use the first element */
+-- 
+2.47.3
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
index dcdf7fd4331f..a2dc90a7af74 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.5.bb
@@ -9,6 +9,7 @@ DEPENDS = "glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-
 
 SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;branch=1.28;tag=${PV} \
            file://0001-Make-player-examples-installable.patch \
+           file://0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch \
            file://gst-player.desktop \
            "
 

---
base-commit: 6f7a806ece411ab32e4b1c08a0299400bdf3b588
change-id: 20260825-mathieu-gst-warning-dialog-40b7f308d15a

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


