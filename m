Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1Tv3WY-00060Y-1C
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 11:13:47 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jan 2013 01:58:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,473,1355126400"; d="scan'208";a="273906888"
Received: from adinu-vostro-460 (HELO localhost.localdomain) ([10.237.105.33])
	by fmsmga001.fm.intel.com with ESMTP; 15 Jan 2013 01:58:13 -0800
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 11:58:55 +0200
Message-Id: <1358243935-925-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH V3] Removed undisplayed picture from connman-gnome
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 10:13:48 -0000

- removed the picture that doesn't display in the
connman-gnome "about" section.
- updated the recipe to use the patch when running bitbake
- created a folder with patches named "connman-gnome",
the same as for connman.

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 ...oved-icon-from-connman-gnome-about-applet.patch |   35 ++++++++++++++++++++
 .../connman/connman-gnome_0.7.bb                   |    3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch

diff --git a/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch b/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
new file mode 100644
index 0000000..9655337
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
@@ -0,0 +1,35 @@
+From 5907a23ad2f49702960a33f9e2039552673eabc7 Mon Sep 17 00:00:00 2001
+From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+Date: Mon, 17 Dec 2012 14:01:18 +0200
+Subject: [PATCH] Removed icon from connman-gnome "about" applet
+
+The connman-gnome "about" applet showed a picture that
+can not be displayed. There is no designated picture
+in connman-gnome to be used in the about section, so
+it was removed.
+
+[OE-Core #2509]
+
+Upstream-status : Pending
+
+Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
+---
+ applet/main.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/applet/main.c b/applet/main.c
+index f12d371..c7b3c7f 100644
+--- a/applet/main.c
++++ b/applet/main.c
+@@ -212,7 +212,7 @@ static void about_callback(GtkWidget *item, gpointer user_data)
+ 			"comments", _("A connection manager for the GNOME desktop"),
+ 			"authors", authors,
+ 			"translator-credits", _("translator-credits"),
+-			"logo-icon-name", "network-wireless", NULL);
++			NULL);
+ }
+ 
+ static void settings_callback(GtkWidget *item, gpointer user_data)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 6cceb2d..1559a9d 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -10,7 +10,8 @@ DEPENDS = "gtk+ dbus-glib"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
-SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git"
+SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git \
+	   file://0001-Removed-icon-from-connman-gnome-about-applet.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5



