Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33615C79FAE
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:58:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3677.1788861519967556338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 02:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QVpT7j1/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 533B51A1A5B
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 293C0603C4
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:58:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57DF311C7AF4B;
	Tue,  8 Sep 2026 11:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788861517; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Chi7NlYEPAwMlTQhdToa4pSdc31UWcACRwKCpjLWP68=;
	b=QVpT7j1/lQuaLf8xfMTgWRJUI/wULPYKggm5ItBBRwsSYMEv6fd2CNcJ4yn3yNFk6oI9bE
	U521rybxg57IqLxw7Zwu1pSH+Lqgxo+whbSD0eS0ertXSyIaNhb/q7sglbmje9zRXPrgEt
	pQKMDOLOQUoXZ7GHl8hly0+VZ4f4SJgEnzbqbcYXMFEao07E44UXi5px7U57pjeHYPnG15
	3PCdPGwDEQxyoKOvwvLzt7zbBYvxlPNcdYqcQXvym6AaE8GUUpBwJSdUH2uCs+U/cjxe53
	5XEjxfXvOvIqHCyNQgH8x/mnomrXVANNrsBP4RZyRUtyG4qHRioVw2PQhef0nA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Tue, 08 Sep 2026 11:58:26 +0200
Subject: [PATCH 04/10] gst-examples: upgrade 1.28.6 -> 1.28.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-mathieu-gstreamer-1-28-7-v1-4-9694738804f6@bootlin.com>
References: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
In-Reply-To: <20260908-mathieu-gstreamer-1-28-7-v1-0-9694738804f6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788861512; l=5179;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=mzz7WtaEeIqED6DpYPTsrAvhrJlziHvvhitgqlIDjKs=;
 b=U5+n8aodj1bL034TMtvnlIxWuYX09fAH0Bi40+CVg1inKVUt/wcOOSDbgtJm17Pim0mRNcSir
 MQOYQC7nnubAFvlKHW3C2xcBBOBfXOzzJDpdpKd/VRo/VL7Fa0R5+8Z
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245344

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../0001-Make-player-examples-installable.patch           |  6 +++---
 ...xamples-gtk-show-player-warnings-in-a-dialog-box.patch | 15 ++++++---------
 .../{gst-examples_1.28.6.bb => gst-examples_1.28.7.bb}    |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
index e7862b40e795..caf2e02980bc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
@@ -1,4 +1,4 @@
-From 75ff9436c9ff965327d6dad256c0a1539435b13a Mon Sep 17 00:00:00 2001
+From c93f7aba35171abfc913684a26f85a03714e2a4c Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Thu, 17 Aug 2017 11:07:02 +0300
 Subject: [PATCH] Make player examples installable
@@ -13,7 +13,7 @@ https://bugzilla.gnome.org/show_bug.cgi?id=777827
  2 files changed, 2 insertions(+)
 
 diff --git a/playback/player/gst-play/meson.build b/playback/player/gst-play/meson.build
-index 5e80ca8dd4..129e5bdcbe 100644
+index 5e80ca8dd4a8..129e5bdcbe3d 100644
 --- a/playback/player/gst-play/meson.build
 +++ b/playback/player/gst-play/meson.build
 @@ -2,5 +2,6 @@ executable('gst-play',
@@ -24,7 +24,7 @@ index 5e80ca8dd4..129e5bdcbe 100644
      dependencies : [gst_dep, dependency('gstreamer-play-1.0'), m_dep])
  
 diff --git a/playback/player/gtk/meson.build b/playback/player/gtk/meson.build
-index 6892f15254..20d7505877 100644
+index 6892f152544f..20d7505877c2 100644
 --- a/playback/player/gtk/meson.build
 +++ b/playback/player/gtk/meson.build
 @@ -21,5 +21,6 @@ if gtk_dep.found()
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
index b437b7a998f5..cb9b815488ec 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-examples/0002-examples-gtk-show-player-warnings-in-a-dialog-box.patch
@@ -1,4 +1,4 @@
-From 11d95270c5216bbe4d0f011c219374800b9ac627 Mon Sep 17 00:00:00 2001
+From 1609881b8d1246e85d9eb68275d54d28e2170301 Mon Sep 17 00:00:00 2001
 From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
 Date: Tue, 25 Aug 2026 11:03:34 +0200
 Subject: [PATCH] examples: gtk: show player warnings in a dialog box
@@ -9,11 +9,11 @@ a dialog box with the warning message coming from the gstplay instance.
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/12346]
 Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
 ---
- .../gst-examples/playback/player/gtk/gtk-play.c   | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
+ .../playback/player/gtk/gtk-play.c            | 20 +++++++++++++++++++
+ 1 file changed, 20 insertions(+)
 
-diff --git a/playback/player/gtk/gtk-play.c b/subprojects/gst-examples/playback/player/gtk/gtk-play.c
-index fb83f6be29c5..0b87bcb03171 100644
+diff --git a/playback/player/gtk/gtk-play.c b/playback/player/gtk/gtk-play.c
+index fb83f6be29c5..2310c716f2e9 100644
 --- a/playback/player/gtk/gtk-play.c
 +++ b/playback/player/gtk/gtk-play.c
 @@ -88,6 +88,7 @@ typedef struct
@@ -55,7 +55,7 @@ index fb83f6be29c5..0b87bcb03171 100644
  static GObject *
  gtk_play_constructor (GType type, guint n_construct_params,
      GObjectConstructParam * construct_params)
-@@ -1774,6 +1791,8 @@ gtk_play_constructor (GType type, guint n_construct_params,
+@@ -1774,6 +1792,8 @@ gtk_play_constructor (GType type, guint n_construct_params,
        G_CALLBACK (media_info_updated_cb), self);
    g_signal_connect (self->signal_adapter, "volume-changed",
        G_CALLBACK (player_volume_changed_cb), self);
@@ -64,6 +64,3 @@ index fb83f6be29c5..0b87bcb03171 100644
  
    /* enable visualization (by default playbin uses goom) */
    /* if visualization is enabled then use the first element */
--- 
-2.47.3
-
diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.6.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.28.6.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
index b46b8b2d5239..627bc9013710 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.28.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.28.7.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "2d3e05cbdad68e47d645f548899b432dc9fb4473"
+SRCREV = "070125524a8422e29d3b69a372ed4f62fd343ffa"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 

-- 
2.47.3


