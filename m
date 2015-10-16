Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id BDBBD77174
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:51:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 0FCD7608B1C
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 16:51:21 +0100
Message-Id: <ca4abea5bdf64878a824b4af61a70a23798b7b20.1445010543.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445010332.git.joshua.lock@collabora.co.uk>
References: <cover.1445010332.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445010543.git.joshua.lock@collabora.co.uk>
References: <cover.1445010543.git.joshua.lock@collabora.co.uk>
Subject: [PATCH 4/6] weston: add a PACKAGECONFIG option for xwayland support
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
X-List-Received-Date: Fri, 16 Oct 2015 15:51:46 -0000

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-graphics/wayland/weston_1.8.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index 9e057c5..7829c53 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -22,7 +22,6 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --disable-xwayland \
                 --enable-simple-clients \
                 --enable-clients \
                 --enable-demo-clients-install \
@@ -70,6 +69,8 @@ PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = ",,systemd dbus"
+# Weston with Xwayland support
+PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.1.4


