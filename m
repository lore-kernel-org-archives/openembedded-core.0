Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 64CD9770CC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:47:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 3A95D608F18
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 10:47:13 +0100
Message-Id: <4c1ecf64dba9accea9d41a39efa34623c87bb29b.1445334356.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 5/7] weston: add a PACKAGECONFIG option for xwayland support
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
X-List-Received-Date: Tue, 20 Oct 2015 09:47:33 -0000

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-graphics/wayland/weston_1.8.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index 4f1269f..db68ccc 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -23,7 +23,6 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --disable-xwayland \
                 --enable-simple-clients \
                 --enable-clients \
                 --enable-demo-clients-install \
@@ -71,6 +70,8 @@ PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = ",,systemd dbus"
+# Weston with Xwayland support
+PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.1.4


