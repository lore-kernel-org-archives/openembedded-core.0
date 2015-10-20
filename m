Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id E0C4776F8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:47:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id D289F608EFE
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 10:47:11 +0100
Message-Id: <1a1ce45ceedb4a185b9cb03e36a56c5cd2485773.1445334356.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445334356.git.joshua.lock@collabora.co.uk>
References: <cover.1445334356.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v2 3/7] weston: add PACKAGECONFIG to build with systemd-login support
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
X-List-Received-Date: Tue, 20 Oct 2015 09:47:32 -0000

Automatically enable this support for distributions which have
systemd in DISTRO_FEATURES.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-graphics/wayland/weston_1.8.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.8.0.bb b/meta/recipes-graphics/wayland/weston_1.8.0.bb
index a2b1c8c..4f1269f 100644
--- a/meta/recipes-graphics/wayland/weston_1.8.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.8.0.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
 #
 # Compositor choices
@@ -68,6 +69,8 @@ PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 # Weston with unwinding support
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+# Weston with systemd-login support
+PACKAGECONFIG[systemd] = ",,systemd dbus"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
2.1.4


