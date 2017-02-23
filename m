Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 468C47300E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 12:47:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 04:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="1133845596"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2017 04:47:23 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 830626A4004;
	Thu, 23 Feb 2017 04:47:22 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 14:47:18 +0200
Message-Id: <2ab6ea8d09b526ac995edca667773e4cdb287d5a.1487853010.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487853010.git.jussi.kukkonen@intel.com>
References: <cover.1487853010.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] gst-player: Upgrade to recent git revision
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2017 12:47:23 -0000

The update contains a small number of bug fixes. Removed one
upstreamed patch.

gst-player does not have releases: this is the current git master.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...ovide-similar-behaviour-for-quit-and-clos.patch | 32 ----------------------
 .../recipes-multimedia/gstreamer/gst-player_git.bb |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch b/meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch
deleted file mode 100644
index e3f1c4f..0000000
--- a/meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 220c2659a45dd354270a465c45197970dae5f548 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Fri, 5 Aug 2016 17:52:18 +0300
-Subject: [PATCH] gtk-play: provide similar behaviour for quit and close
-
-In x86 targets, gtk-play just pause rather than quitting the application
-when we click the close button (delete-event). Change the callback function
-to get similar behaviour when we click on "Quit" menu option.
-
-Upstream-Status: Accepted
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- gtk/gtk-play.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gtk/gtk-play.c b/gtk/gtk-play.c
-index a520bef..16afc6b 100644
---- a/gtk/gtk-play.c
-+++ b/gtk/gtk-play.c
-@@ -177,7 +177,7 @@ load_from_builder (const gchar * filename, gboolean register_sig_handler,
- static void
- delete_event_cb (GtkWidget * widget, GdkEvent * event, GtkPlay * play)
- {
--  gst_player_stop (play->player);
-+  gtk_widget_destroy (GTK_WIDGET (play));
- }
- 
- static void
--- 
-2.4.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gst-player_git.bb b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
index 9a023ab..ebc4ae8 100644
--- a/meta/recipes-multimedia/gstreamer/gst-player_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-player_git.bb
@@ -8,10 +8,9 @@ SRC_URI = "git://github.com/sdroege/gst-player.git \
            file://filechooser.patch;apply=0 \
            file://Fix-pause-play.patch;apply=0 \
            file://Add-error-signal-emission-for-missing-plugins.patch;apply=0 \
-           file://0001-gtk-play-provide-similar-behaviour-for-quit-and-clos.patch \
            file://gst-player.desktop"
 
-SRCREV = "ea90e63c1064503f9ba5d59aa4ca604f13ca5def"
+SRCREV = "ee3c226c82767a089743e4e06058743e67f73cdb"
 PV = "0.0.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.1.4


